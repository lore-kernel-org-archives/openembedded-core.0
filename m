Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8799C3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:41 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.30092.1722791378394105205
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EhWwhvvf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70d333d5890so9020132b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791378; x=1723396178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4fUdSdjQVVWPEo5y2852mTW0CPQ1vm95QXac7TyLGo=;
        b=EhWwhvvfO6w7u/c9ok3464yOCGP9aw5jikYftW82lDBhvFVlMiGS4mJGEP9VEfq1Ax
         QiPYra9M1HemM607FskH/yctM8JxurI0rCF5f++KvyW1Fnuf6iFKvJZEsg7/CFcbw0eQ
         l5xHYfA/NOicbvyJ5i6RoAG6daAmWz4usZ/SkN5odju4rRJuP6JNunZpnUvppPWDASci
         xccQKl4LtNRhBDsI7oOn6w1e/HNbmREJJP67DW1drTSFbXYLwc5dl+yjkOYGTlSJcp1e
         z3ZPlKDhCQYSZoTg5SkbhAKwpsnRfsGdDRNrIx2XhmtOjitY8GC96MtOIOs23Yoju1O+
         RLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791378; x=1723396178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4fUdSdjQVVWPEo5y2852mTW0CPQ1vm95QXac7TyLGo=;
        b=uHfNazvtooPPcHifHbhSmJBQ0RQk5HbMJev3pKFHHusaTmw5wUHcTnPSS/iOghsWvK
         2leyesMiNK5mF3XJVQ4bgCzJQIVE+8nMdAP7xHGZfjjBNTH4oEplNcTsorYvAUgcuDhl
         RxPnU4QAlNkyMUSY5Bg6QsxHSa5VnOJgAzIOyicBZI+kzqzHi4Dnpag5j/y4VAxBCw4Q
         aCtLfSCKUyQRsyrDr65US8iP6ybKpEiTfyjTdTKFqAaqpzzGAZm1lMUluqiRT/LbEach
         AT5DFgcKASHtexsQLeoHnHfxgUTxuNkZ1rHXsme2jRTaepHW3eNFa/vqczRxdSwf38Xh
         o0ww==
X-Gm-Message-State: AOJu0YxR95h5qum4aOk5j26s4kvSS49b07dat6z9RyjVwITMLoLP/u4w
	D0nAWQrJpE/2hPhTpqcliiLqANvLLHW2MpYJq0TtIFvFVXmTsakYoB0PYcsZB9ViyxC28cFFbpx
	CVMI37g==
X-Google-Smtp-Source: AGHT+IFTJxknjyDWmEACNTjdurTZ0dkXMXjhdjoeAsWYth6dM2UqgbppTuFWpY+rVEK4J8XlripCsA==
X-Received: by 2002:a05:6a00:182a:b0:710:5a64:30d5 with SMTP id d2e1a72fcca58-7106cf9362emr12912433b3a.6.1722791377654;
        Sun, 04 Aug 2024 10:09:37 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/18] selftest-hardlink: Add additional test cases
Date: Sun,  4 Aug 2024 10:09:11 -0700
Message-Id: <39823d3211411e661320e1164ba4c50370804425.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202967

From: Mark Hatle <mark.hatle@amd.com>

Additional test cases for debug symlink generation both binaries
and static libraries.

This also has the side effect of testing for race conditions in the
hardlink debug generation and stripping.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7171f41c07a39a7543bb64f075d38b8e74563089)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../selftest-hardlink/selftest-hardlink.bb    | 13 ++++++++++
 meta/lib/oeqa/selftest/cases/package.py       | 26 +++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
index be346b8a0e..052bf0c92a 100644
--- a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
@@ -10,6 +10,9 @@ S = "${WORKDIR}"
 
 do_compile () {
 	${CC} hello.c -o hello1 ${CFLAGS} ${LDFLAGS}
+
+	${CC} hello.c -c -o hello.o ${CFLAGS}
+	${AR} rcs libhello.a hello.o
 }
 
 do_install () {
@@ -22,9 +25,19 @@ do_install () {
 	ln ${D}${bindir}/hello1 ${D}${libexecdir}/hello3
 	ln ${D}${bindir}/hello1 ${D}${libexecdir}/hello4
 
+	# We need so many hardlink copies to look for specific race conditions
+	install -d ${D}${libdir}
+	install -m 0644 libhello.a ${D}${libdir}
+	for num in `seq 1 100` ; do
+		ln ${D}${libdir}/libhello.a ${D}${libdir}/libhello-${num}.a
+	done
+
 	dd if=/dev/zero of=${D}${bindir}/sparsetest bs=1 count=0 seek=1M
 }
 
 RDEPENDS:${PN}-gdb += "gdb"
 PACKAGES =+ "${PN}-gdb"
 FILES:${PN}-gdb = "${bindir}/gdb.sh"
+
+PACKAGE_STRIP_STATIC = "1"
+PACKAGE_DEBUG_STATIC_SPLIT = "1"
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 1aa6c03f8a..38ed7173fe 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -103,11 +103,37 @@ class PackageTests(OESelftestTestCase):
 
         dest = get_bb_var('PKGDEST', 'selftest-hardlink')
         bindir = get_bb_var('bindir', 'selftest-hardlink')
+        libdir = get_bb_var('libdir', 'selftest-hardlink')
+        libexecdir = get_bb_var('libexecdir', 'selftest-hardlink')
 
         def checkfiles():
             # Recipe creates 4 hardlinked files, there is a copy in package/ and a copy in packages-split/
             # so expect 8 in total.
             self.assertEqual(os.stat(dest + "/selftest-hardlink" + bindir + "/hello1").st_nlink, 8)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink" + libexecdir + "/hello3").st_nlink, 8)
+
+            # Check dbg version
+            # 2 items, a copy in both package/packages-split so 4
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + bindir + "/.debug/hello1").st_nlink, 4)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + libexecdir + "/.debug/hello1").st_nlink, 4)
+
+            # Even though the libexecdir name is 'hello3' or 'hello4', that isn't the debug target name
+            self.assertEqual(os.path.exists(dest + "/selftest-hardlink-dbg" + libexecdir + "/.debug/hello3"), False)
+            self.assertEqual(os.path.exists(dest + "/selftest-hardlink-dbg" + libexecdir + "/.debug/hello4"), False)
+
+            # Check the staticdev libraries
+            # 101 items, a copy in both package/packages-split so 202
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-staticdev" + libdir + "/libhello.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-staticdev" + libdir + "/libhello-25.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-staticdev" + libdir + "/libhello-50.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-staticdev" + libdir + "/libhello-75.a").st_nlink, 202)
+
+            # Check static dbg
+            # 101 items, a copy in both package/packages-split so 202
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + libdir + "/.debug-static/libhello.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + libdir + "/.debug-static/libhello-25.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + libdir + "/.debug-static/libhello-50.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + libdir + "/.debug-static/libhello-75.a").st_nlink, 202)
 
             # Test a sparse file remains sparse
             sparsestat = os.stat(dest + "/selftest-hardlink" + bindir + "/sparsetest")
-- 
2.34.1


