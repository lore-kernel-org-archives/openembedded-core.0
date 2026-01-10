Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4A5D25029
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 22:45:42 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.522.1768085130689712403
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 14:45:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NGeJ66Ah;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026011022453311372fc3d7000207fa-tt2fnl@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026011022453311372fc3d7000207fa
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 23:45:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XE+TgWK2z59t8E1cYF9gmruHhhv6HQ+3LoJsJk/9szo=;
 b=NGeJ66Ah2IECZo6m3mxLHamm1jNh6XiP+yr6xvuxITcH6vIERvfF9yIi0W5mwADTd/daWA
 3OkuvM3bORUGHnuJtmJOUuekMPlAlqy2aY+kewSj0f01d39X8S+F/KLcnrgtMPFbdQmb8vzf
 4lPBc2UoFayddmqQvl9b/rf0+rr6bkGIYyiZFu1hwlCogbHLdwglFI1I2DGvC9wRL+rqd8S9
 akkvn+TV4cr+NyFVvNkGgEMXihkBGDSXNsS15o+yGXemNb27UQO8A3kJWcIDC0TrwbZWZBHy
 yfF0yIJ/CCWBgYgWnfgiYTLL3FwXiZMpDmiW6pvX6CX2KnUaUg8JXmMg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] gnupg: patch CVE-2025-68973
Date: Sat, 10 Jan 2026 23:45:07 +0100
Message-Id: <20260110224507.395192-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 22:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229169

From: Peter Marko <peter.marko@siemens.com>

Pick patch from 2.4 branch per [1].
2.5 branch already reworked this and patch from that didn't apply.

[1] https://security-tracker.debian.org/tracker/CVE-2025-68973

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.5.11.bb    |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch b/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
new file mode 100644
index 0000000000..1d5225361b
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
@@ -0,0 +1,108 @@
+From 4ecc5122f20e10c17172ed72f4fa46c784b5fb48 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 23 Oct 2025 11:36:04 +0200
+Subject: [PATCH] gpg: Fix possible memory corruption in the armor parser.
+
+* g10/armor.c (armor_filter): Fix faulty double increment.
+
+* common/iobuf.c (underflow_target): Assert that the filter
+implementations behave well.
+--
+
+This fixes a bug in a code path which can only be reached with special
+crafted input data and would then error out at an upper layer due to
+corrupt input (every second byte in the buffer is unitialized
+garbage).  No fuzzing has yet hit this case and we don't have a test
+case for this code path.  However memory corruption can never be
+tolerated as it always has the protential for remode code execution.
+
+Reported-by: 8b79fe4dd0581c1cd000e1fbecba9f39e16a396a
+Fixes-commit: c27c7416d5148865a513e007fb6f0a34993a6073
+which fixed
+Fixes-commit: 7d0efec7cf5ae110c99511abc32587ff0c45b14f
+Backported-from-master: 115d138ba599328005c5321c0ef9f00355838ca9
+
+The bug was introduced on 1999-01-07 by me:
+* armor.c: Rewrote large parts.
+which I fixed on 1999-03-02 but missed to fix the other case:
+* armor.c (armor_filter): Fixed armor bypassing.
+
+Below is base64+gzipped test data which can be used with valgrind to
+show access to uninitalized memory in write(2) in the unpatched code.
+
+--8<---------------cut here---------------start------------->8---
+H4sICIDd+WgCA3h4AO3QMQ6CQBCG0djOKbY3G05gscYFSRAJt/AExp6Di0cQG0ze
+a//MV0zOq3Pt+jFN3ZTKfLvP9ZLafqifJUe8juOjeZbVtSkbRPmRgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgMCXF6dYDgAAAAAAAAAAAAAAAAAAAAAA
+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC7E14AAAAA
+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADwZ94aieId3+8EAA==
+--8<---------------cut here---------------end--------------->8---
+
+CVE: CVE-2025-68973
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/4ecc5122f20e10c17172ed72f4fa46c784b5fb48]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ common/iobuf.c | 8 +++++++-
+ g10/armor.c    | 4 ++--
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/common/iobuf.c b/common/iobuf.c
+index 748e6935d..2497713c1 100644
+--- a/common/iobuf.c
++++ b/common/iobuf.c
+@@ -2041,6 +2041,8 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
+ 	rc = 0;
+       else
+       {
++        size_t tmplen;
++
+ 	/* If no buffered data and drain buffer has been setup, and drain
+ 	 * buffer is largish, read data directly to drain buffer. */
+ 	if (a->d.len == 0
+@@ -2053,8 +2055,10 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
+ 	      log_debug ("iobuf-%d.%d: underflow: A->FILTER (%lu bytes, to external drain)\n",
+ 			 a->no, a->subno, (ulong)len);
+ 
+-	    rc = a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain,
++            tmplen = len;  /* Used to check for bugs in the filter.  */
++            rc = a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain,
+ 			    a->e_d.buf, &len);
++            log_assert (len <= tmplen);
+ 	    a->e_d.used = len;
+ 	    len = 0;
+ 	  }
+@@ -2064,8 +2068,10 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
+ 	      log_debug ("iobuf-%d.%d: underflow: A->FILTER (%lu bytes)\n",
+ 			 a->no, a->subno, (ulong)len);
+ 
++            tmplen = len;  /* Used to check for bugs in the filter.  */
+ 	    rc = a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain,
+ 			    &a->d.buf[a->d.len], &len);
++            log_assert (len <= tmplen);
+ 	  }
+       }
+       a->d.len += len;
+diff --git a/g10/armor.c b/g10/armor.c
+index 81af15339..f8cfa86db 100644
+--- a/g10/armor.c
++++ b/g10/armor.c
+@@ -1312,8 +1312,8 @@ armor_filter( void *opaque, int control,
+ 	n = 0;
+ 	if( afx->buffer_len ) {
+             /* Copy the data from AFX->BUFFER to BUF.  */
+-	    for(; n < size && afx->buffer_pos < afx->buffer_len; n++ )
+-		buf[n++] = afx->buffer[afx->buffer_pos++];
++            for(; n < size && afx->buffer_pos < afx->buffer_len;)
++                buf[n++] = afx->buffer[afx->buffer_pos++];
+ 	    if( afx->buffer_pos >= afx->buffer_len )
+ 		afx->buffer_len = 0;
+ 	}
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.11.bb b/meta/recipes-support/gnupg/gnupg_2.5.11.bb
index 9cc063f837..753eea6276 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.11.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.11.bb
@@ -19,6 +19,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/ftp/gcrypt/gnupg/"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://CVE-2025-68973.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"

