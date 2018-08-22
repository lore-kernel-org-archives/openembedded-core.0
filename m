Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id E0305793CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:13 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id q11-v6so3106658oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YvasmTQCEkhjZ00hYUKyTBsgb/5eRgPbshxJsDAWLf0=;
	b=JRgnhbEiiT87IVMV/+IfZNjjSvZSV9hC+1pbASoMZb9MUkrODzrDHz6iUOU8ay/7r9
	/gAvHwi8LGg23pKdZ7uO+9vNAPwdXK/JtjXQJLHMFniyPiAWK6leapeUwmjhCCatfB3t
	9hDluomZ3biOtCKqLl//VL565jy/O0ydsFM2a0UtXnY5TLCjc9cbnPWPPhs239tBd2VF
	ZIrmxBSfwdAkIlBE9uf+lkstbJFsXN1tGrcbnZJ43GwAMH4RxLQBYlbJCK/wPXWZBbAD
	VfVd3+BppPj/9tBL67b1gkGgBNAq77B7w8Dh107i7C5gwYH+u4cHY7sgKzNYaKnfuMdF
	drxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YvasmTQCEkhjZ00hYUKyTBsgb/5eRgPbshxJsDAWLf0=;
	b=kIqq22yJuDOLhKfD5DSe/RilFrFCVDKatZK9KL/ZIKS+mniXsuXLdxGYVx+EQySAlA
	xyy+2A+yKbwp4SwdabULtIFWpez+fm3jGfEr6pt1TycjU6kBKJz12HQ0lvT6MSo8EqZW
	jZURAtVzckB1h1/g5XB+Cd/Y/pFHKnxlfGVMtnd9umTA/5zWcOcpvoMChqq/X4W2357R
	Qrk8cR74u1AOSC4y8iXwXNFC/6XsLv/1KnPMosijmAN4niA3PoB5V8enZeIKygzvV5R2
	TI/U0srrOEeTEJYdnPnHQuRs1sjZrAzi/1LWkoSMorCe56WGHo2StzI7d5Z2MF7/Qh9s
	LAzQ==
X-Gm-Message-State: APzg51At7v5nUuZw8AN9PVqdZv5DazGxD0Ud2tizfRG3+PnGTM221Sq4
	mtJXZfYX6OPoo2ya552d96780frbHOw=
X-Google-Smtp-Source: ANB0Vda25ZrBWfyKv5JQ1NWsF/e7+dG3tnU+HqbzXlmV8Prw/7eF7NN9kLk/lIRS/DV0yeFpq/laDg==
X-Received: by 2002:aca:aa06:: with SMTP id
	t6-v6mr4152848oie.152.1534944974890; 
	Wed, 22 Aug 2018 06:36:14 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:14 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:11 +0530
Message-Id: <1534944940-21566-5-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 05/34] rpm: CVE-2017-7501
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:14 -0000

Open newly created files with O_EXCL to prevent symlink tricks.
When reopening hardlinks for writing the actual content, use append
mode instead. This is compatible with the write-only permissions but
is not destructive in case we got redirected to somebody elses file,
verify the target before actually writing anything.

As these are files with the temporary suffix, errors mean a local
user with sufficient privileges to break the installation of the package
anyway is trying to goof us on purpose, don't bother trying to mend it
(we couldn't fix the hardlink case anyhow) but just bail out.

Based on a patch by Florian Festi.

Affects rpm < 4.13.0.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-devtools/rpm/files/CVE-2017-7501.patch | 106 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_git.bb               |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2017-7501.patch

diff --git a/meta/recipes-devtools/rpm/files/CVE-2017-7501.patch b/meta/recipes-devtools/rpm/files/CVE-2017-7501.patch
new file mode 100644
index 0000000..fb299d9
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2017-7501.patch
@@ -0,0 +1,106 @@
+From 404ef011c300207cdb1e531670384564aae04bdc Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Tue, 19 Sep 2017 14:46:36 +0300
+Subject: [PATCH] Don't follow symlinks on file creation (CVE-2017-7501)
+
+Open newly created files with O_EXCL to prevent symlink tricks.
+When reopening hardlinks for writing the actual content, use append
+mode instead. This is compatible with the write-only permissions but
+is not destructive in case we got redirected to somebody elses file,
+verify the target before actually writing anything.
+
+As these are files with the temporary suffix, errors mean a local
+user with sufficient privileges to break the installation of the package
+anyway is trying to goof us on purpose, don't bother trying to mend it
+(we couldn't fix the hardlink case anyhow) but just bail out.
+
+Based on a patch by Florian Festi.
+
+CVE: CVE-2017-7501
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/404ef011c300207cdb1e531670384564aae04bdc]
+
+Signed-off-by: Panu Matilainen <pmatilai@redhat.com>
+Signed-off-by: Florian Festi <ffesti@redhat.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ lib/fsm.c | 29 +++++++++++++++++++++++------
+ 1 file changed, 23 insertions(+), 6 deletions(-)
+
+diff --git a/lib/fsm.c b/lib/fsm.c
+index 553774b..e0e9d03 100644
+--- a/lib/fsm.c
++++ b/lib/fsm.c
+@@ -206,11 +206,22 @@ static int fsmSetFCaps(const char *path, const char *captxt)
+     return rc;
+ }
+ 
++/* Check dest is the same, empty and regular file with writeonly permissions */
++static int linkSane(FD_t wfd, const char *dest)
++{
++    struct stat sb, lsb;
++
++    return (fstat(Fileno(wfd), &sb) == 0 && sb.st_size == 0 &&
++	    (sb.st_mode & ~S_IFMT) == S_IWUSR &&
++	    lstat(dest, &lsb) == 0 && S_ISREG(lsb.st_mode) &&
++	    sb.st_dev == lsb.st_dev && sb.st_ino == lsb.st_ino);
++}
++
+ /** \ingroup payload
+  * Create file from payload stream.
+  * @return		0 on success
+  */
+-static int expandRegular(rpmfi fi, const char *dest, rpmpsm psm, int nodigest, int nocontent)
++static int expandRegular(rpmfi fi, const char *dest, rpmpsm psm, int exclusive, int nodigest, int nocontent)
+ {
+     FD_t wfd = NULL;
+     int rc = 0;
+@@ -218,8 +229,14 @@ static int expandRegular(rpmfi fi, const char *dest, rpmpsm psm, int nodigest, i
+     /* Create the file with 0200 permissions (write by owner). */
+     {
+ 	mode_t old_umask = umask(0577);
+-	wfd = Fopen(dest, "w.ufdio");
++	wfd = Fopen(dest, exclusive ? "wx.ufdio" : "a.ufdio");
+ 	umask(old_umask);
++
++	/* If reopening, make sure the file is what we expect */
++	if (!exclusive && wfd != NULL && !linkSane(wfd, dest)) {
++	    rc = RPMERR_OPEN_FAILED;
++	    goto exit;
++	}
+     }
+     if (Ferror(wfd)) {
+ 	rc = RPMERR_OPEN_FAILED;
+@@ -248,7 +265,7 @@ static int fsmMkfile(rpmfi fi, const char *dest, rpmfiles files,
+ 	/* Create first hardlinked file empty */
+ 	if (*firsthardlink < 0) {
+ 	    *firsthardlink = rpmfiFX(fi);
+-	    rc = expandRegular(fi, dest, psm, nodigest, 1);
++	    rc = expandRegular(fi, dest, psm, 1, nodigest, 1);
+ 	} else {
+ 	    /* Create hard links for others */
+ 	    char *fn = rpmfilesFN(files, *firsthardlink);
+@@ -263,10 +280,10 @@ static int fsmMkfile(rpmfi fi, const char *dest, rpmfiles files,
+        existing) file with content */
+     if (numHardlinks<=1) {
+ 	if (!rc)
+-	    rc = expandRegular(fi, dest, psm, nodigest, 0);
++	    rc = expandRegular(fi, dest, psm, 1, nodigest, 0);
+     } else if (rpmfiArchiveHasContent(fi)) {
+ 	if (!rc)
+-	    rc = expandRegular(fi, dest, psm, nodigest, 0);
++	    rc = expandRegular(fi, dest, psm, 0, nodigest, 0);
+ 	*firsthardlink = -1;
+     } else {
+ 	*setmeta = 0;
+@@ -939,7 +956,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+ 	    /* we skip the hard linked file containing the content */
+ 	    /* write the content to the first used instead */
+ 	    char *fn = rpmfilesFN(files, firsthardlink);
+-	    rc = expandRegular(fi, fn, psm, nodigest, 0);
++	    rc = expandRegular(fi, fn, psm, 0, nodigest, 0);
+ 	    firsthardlink = -1;
+ 	    free(fn);
+ 	}
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 7866314..bec0630 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm \
            file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
+           file://CVE-2017-7501.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.7.4


