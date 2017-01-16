Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3010F71AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:17:08 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 75so5491807pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=7Uzlw4fcqSyce3vjANkxEbJ6rbmfFdDxrfMfDy7sEcg=;
	b=a405wnjzfO0xhwi1lt9Fdp7QSOfsGj5KHGYwKafmdPXbv22MqHrrqnYwtcO6NcNlvW
	KRFkmf4/oa3t/I0VtWf0DWjhfDfDzCGwxYhGJ+SA+Gsg8njT1WeN+7U01OVgehmWlxkL
	VlIV68IZbgrsp3618aZOMNCiCii0Y4s6wuYMDYgGR27thKTqWNgqv6f2eHEeRhE+QTvo
	3VIP7bjqJM0p960CvTdU28tLPG6DZOZgGdefGKpclDQsY+gBkq4ArtlnwgYtKp9+ofCu
	/YiSy19/+uoPQXDktyAD/fm7+qxi2arFVDRDnS1Z4uvE/gLnQljDELCJRI0yXXHT9rBg
	2wrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=7Uzlw4fcqSyce3vjANkxEbJ6rbmfFdDxrfMfDy7sEcg=;
	b=df82Rvbv/33YjQ1mYWYzOuNAZ/UtOh7aFsIXg/izGxkWexjPDW3JqKcvCBGLkjBU7U
	r9MkzRfDrNzyUDDv5vHyHfRISK/U9AKsuovDS+iPpUtDqK0Df3hb5ouo/jCjX+gL8giE
	up1syD/1SS1WRWoDopddsGjOzXOK2Qo+YUYqe6PMFMWYv72VhD7cugAOlKGRTPtwo18D
	t2aWbECP7wlgsDXPNddxoAwpcdnDF+jDs2qP4wNKP0Rn/AG4QjSGaAXtcAnu/JwBMt0m
	lXQE4S0bmrWxnNndsBII3BFn7TKdu9txohJ1N58n3OLenZtl4pJI/05WrpEtKg1cmIV4
	G/pA==
X-Gm-Message-State: AIkVDXKcuSMfaxgQQFCfHjca2diuOdnYDbq8cjE39/3epX3U71aIpubqYnHvCACMiasWOg==
X-Received: by 10.98.26.210 with SMTP id a201mr37745793pfa.57.1484576228891;
	Mon, 16 Jan 2017 06:17:08 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	o126sm48462943pga.34.2017.01.16.06.17.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:17:08 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-18-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 18/30] libgpg-error_1.25.bb: Add patch to resolve configure bug for mingw32
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
X-List-Received-Date: Mon, 16 Jan 2017 14:17:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Resolve bug with the generation of the versioninfo.rc file which depends
on the BUILD_REVISION being set during configure. The BUILD_REVISION is
unset when building against tarball source due to no git repository
information. This patch sets the BUILD_REVISION to 0 when no information
is available.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 ...c-Set-mym4_revision-to-0-if-not-a-git-rep.patch | 46 ++++++++++++++++++++++
 .../libgpg-error/libgpg-error_1.25.bb              |  2 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch b/meta/recipes-support/libgpg-error/libgpg-error/configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch
new file mode 100644
index 0000000000..ea5a10261c
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch
@@ -0,0 +1,46 @@
+From 274bb6fc22f8e0bfe521305d5e67eee268cabf7f Mon Sep 17 00:00:00 2001
+From: Nathan Rossi <nathan@nathanrossi.com>
+Date: Fri, 30 Dec 2016 18:02:26 +1000
+Subject: [PATCH] configure.ac: Set 'mym4_revision' to 0 if not a git repo
+
+---
+It is possible for the source to not be located in a git repository
+(e.g. source is from a tarball). In which case the git repository
+information is not available. This results in the mym4_revision being an
+empty string however this value is used in BUILD_FILEVERSION where it is
+assumed to be 4 decimal values. Additionally BUILD_REVISION uses this
+value and is also assumed to be non-empty.
+
+In the case of BUILD_FILEVERSION it is used in versioninfo.rc.in, where
+it must be populated as 4 decimal values due to the expected syntax. In
+cases where it is not (e.g. when BUILD_FILEVERSION = '1,26,0,' a syntax
+error is raised.
+
+    windres: versioninfo.rc.in:21: syntax error
+
+This patch changes mym4_revision so that if the 'git rev-parse' returns
+non-zero (e.g. not in a git repository) the value falls back to '0'.
+This propagates as '0' to both BUILD_FILEVERSION and BUILD_REVISION.
+
+Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
+Upstream-Status: Submitted
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6d4f173d1b..149ac02b5f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,7 +35,7 @@ m4_define([mym4_version_minor], [27])
+ # processing is done by autoconf and not during the configure run.
+ m4_define([mym4_version], [mym4_version_major.mym4_version_minor])
+ m4_define([mym4_revision],
+-          m4_esyscmd([git rev-parse --short HEAD | tr -d '\n\r']))
++          m4_esyscmd([(git rev-parse --short HEAD || printf '0') | tr -d '\n\r']))
+ m4_define([mym4_revision_dec],
+           m4_esyscmd_s([echo $((0x$(echo ]mym4_revision[|head -c 4)))]))
+ m4_define([mym4_betastring],
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
index d4ce224948..c6a6ba098d 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
@@ -14,8 +14,10 @@ SECTION = "libs"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
+           file://configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch \
 	  "
 
+
 SRC_URI[md5sum] = "d9fa545922a5060cbfbd87464bc31686"
 SRC_URI[sha256sum] = "f628f75843433b38b05af248121beb7db5bd54bb2106f384edac39934261320c"
 
-- 
2.11.0


