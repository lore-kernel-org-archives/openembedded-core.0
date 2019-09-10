Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 06AB47F346
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 12:41:24 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d15so11445922pfo.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 05:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=XCX/K7ZRVk1OQXorngajekpBfDKGhkHT5nX+BPggqpU=;
	b=WRu0vMxyO4K604AQoD6KG+UtaoLgk/3/LRzvh8ncXmZg0qlKSlW3uRi9/fTx6E05EE
	FMAuZNt9L+hdsqr6bebgTxhfMfTBRBSIV54OWM//CsDv6znQKBJEpER+Y9qeLxQN4uqw
	TTQjjaUp8BxzvE45AgzjyFx8ToX2SLy1b99JGkYZisxcDeES8IViy+RtdtYoJbNbCtJ+
	Dg0aE3e47q6v30NixWz7RtMg7Eo0f4bfDwyNRUeSXJ6j3t7d5E9DGMNWL+DKHyyUmaz/
	w0yhp8sIi/mqE4GZup1CliYL38wC5OHBjfnOCs8+0g6CKrWrwkmkHIJmVSKCidYxwNEF
	em7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=XCX/K7ZRVk1OQXorngajekpBfDKGhkHT5nX+BPggqpU=;
	b=VMvD8SK+5hRkt7BCYNzY4xPXuQ7i6GTgX8IfFLWN/0mVxe4qvEaxFl2g4lxV0dztfc
	hImSQUWu1ll7Or3Oo97qHytHGELqzJexzXuhWLju8VJNb+zLA5BlHJz0mfLSjVSxo2NC
	s5y/wPtBwz0mWnUJMw/ZjXxaNUgGyl5RdDE2l5Wztw2BhifGpvSGXEE8Noc31IQiBAbM
	6z+a23BPLiYOqPf01Av2EdirXAVy8K8U+YZGyaILIjK+XEQFW2lkyMpf4dNj/reogQtN
	2wcuLAuGL+XMzbSG9Qd/6yne8d1lWVhv7IjLhTGfLWWofAovLJzOXrJjSLbF4yZnq9MS
	xHmQ==
X-Gm-Message-State: APjAAAX8JACXK5QM5hhT4InVLJYufTYpAmtTHCl8J5D9D4hwixUoBsMR
	/tsLAQ5Nx695c3ZoCBsAOC82lQ==
X-Google-Smtp-Source: APXvYqwerhttpz0UM5UqX5c/yhRsQTOviVwsPyccGsDATrDIyT4nCONqJ2lzluzBTMdFWSxriAsqJQ==
X-Received: by 2002:a63:2349:: with SMTP id u9mr24838230pgm.214.1568119286019; 
	Tue, 10 Sep 2019 05:41:26 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	k4sm333091pfa.95.2019.09.10.05.41.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 05:41:25 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:40:59 +0000
Message-Id: <20190910124059.3908-4-nathan@nathanrossi.com>
In-Reply-To: <20190910124059.3908-1-nathan@nathanrossi.com>
References: <20190910124059.3908-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 4/6] gcc-cross.inc: Process binaries in build dir to be relocatable
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
X-List-Received-Date: Tue, 10 Sep 2019 12:41:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Process binaries within the build directory before stashing to be
relocatable with ORIGIN relative rpaths. This corrects issues with
rpaths being invalid when trying to use the binaries from an unstashed
build directory (e.g. gcc-runtime).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 95af6d89a9..e20f6cb6c1 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -206,9 +206,17 @@ do_package_write_ipk[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 
+inherit chrpath
+
+python gcc_stash_builddir_fixrpaths() {
+    # rewrite rpaths, breaking hardlinks as required
+    process_dir("/", d.getVar("BUILDDIRSTASH"), d, break_hardlinks = True)
+}
+
 BUILDDIRSTASH = "${WORKDIR}/stashed-builddir"
 do_gcc_stash_builddir[dirs] = "${B}"
 do_gcc_stash_builddir[cleandirs] = "${BUILDDIRSTASH}"
+do_gcc_stash_builddir[postfuncs] += "gcc_stash_builddir_fixrpaths"
 do_gcc_stash_builddir () {
 	dest=${BUILDDIRSTASH}
 	hardlinkdir . $dest
---
2.23.0.rc1

