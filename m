Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1367EC56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 14:13:28 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id d15so13726442pfo.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 07:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=3tSFGCeqLkR+i4a2MGmVVq42Sq5iKYY7fB8fWxvFjYg=;
	b=Ca7ehZ7IE6U7b0ko7o/f4D+JRWxGuWe2MX0rUAARS15iufCuiO0r9uEM+m+jxl2JfY
	EpnHFjYQUE0eVCe0GqunCar0hv5QORpmfMBSQ/PGBSKQIL9ecLosULtoqsq7410ef4QZ
	5qU7ZsCkLB0vB+fu2IcSHCFxULnMTp/fqJVEIXZBpLukR4A1vOfgLWsBCz3FNCuEIThu
	MwL62RqO2sWBHh0u3BO5HBGkITkOJFPUVq8oYFJoTTn6dnZCfD+6E5a3LaJL2I4Cx2dT
	Kh1+IASIWGdU/i7d4z4DedwJkBDTjBVqrecA3SIoQKpJqMjtt3Sips8l0Cc0hAKmminB
	6leQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=3tSFGCeqLkR+i4a2MGmVVq42Sq5iKYY7fB8fWxvFjYg=;
	b=Gr2k212ezekfYNKVwCdGZ4FQWMDoAMX8nQXzxeQRJyp0igY+IAcZJYmclEtmY2dmYS
	71/m8/rBIXqgV20Tsl+QzV3nJLoRF8iQROf5WfwiosYeTID7JW8GDHf6tpxUp1mxDP45
	OP/Xxaanu2u27uq8JS9yzMK9BPhmLezu9sXoBOlFtrcmEUoCGeFNr0oCKq4XrF9k5RlG
	ACefffBA1BzVziDG9A6JDcZUh4Ax52OR6NryNKxPXs9OWL7M39DxJmYDHT69dFGsjts0
	8XgIR8XWoP4Fn10KC36EQ6TGVU6bEBugUX3M+25QGlcEWk4CTQnqGMy2ayc0KS5arOw/
	umag==
X-Gm-Message-State: APjAAAWmdGCf53vScVcrNm7imHHSOXKwqEYNazAYCtoLbd68WRpdWMq5
	z72QuZEbD02ik4IXSDyms1IU73KuKZxpPQ==
X-Google-Smtp-Source: APXvYqys2DyJsouIs11wu2czKRJdf+O4SgHO0cvdwg9QnxmK//NLZLeXhmZ9GqYDwPZVjayJD+JskA==
X-Received: by 2002:a17:90a:a892:: with SMTP id
	h18mr5955455pjq.14.1568211209144; 
	Wed, 11 Sep 2019 07:13:29 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	f89sm8653474pje.20.2019.09.11.07.13.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 07:13:28 -0700 (PDT)
Date: Wed, 11 Sep 2019 14:13:07 +0000
Message-Id: <20190911141307.28014-2-nathan@nathanrossi.com>
In-Reply-To: <20190911141307.28014-1-nathan@nathanrossi.com>
References: <20190911141307.28014-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 2/4] gcc-cross.inc: Process binaries in build dir to be relocatable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2019 14:13:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Process binaries within the build directory before stashing to be
relocatable with ORIGIN relative rpaths. This corrects issues with
rpaths being invalid when trying to use the binaries from an unstashed
build directory (e.g. gcc-runtime).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- Nest the stash directory within 'stashed-builddir' to match the
  nesting of the copied build directory, this ensures that the relative
  rpaths are correct when extracting to a similar build directory.
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 95af6d89a9..8855bb1f34 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -206,9 +206,17 @@ do_package_write_ipk[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 
-BUILDDIRSTASH = "${WORKDIR}/stashed-builddir"
+inherit chrpath
+
+python gcc_stash_builddir_fixrpaths() {
+    # rewrite rpaths, breaking hardlinks as required
+    process_dir("/", d.getVar("BUILDDIRSTASH"), d, break_hardlinks = True)
+}
+
+BUILDDIRSTASH = "${WORKDIR}/stashed-builddir/build"
 do_gcc_stash_builddir[dirs] = "${B}"
 do_gcc_stash_builddir[cleandirs] = "${BUILDDIRSTASH}"
+do_gcc_stash_builddir[postfuncs] += "gcc_stash_builddir_fixrpaths"
 do_gcc_stash_builddir () {
 	dest=${BUILDDIRSTASH}
 	hardlinkdir . $dest
---
2.23.0.rc1

