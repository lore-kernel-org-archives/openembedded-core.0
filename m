Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6ECC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:49 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.30649.1668892539262578883
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=HrF5uwJx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id ci10so1171262pjb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZjKx3taedihzQLq4LOXOcRsta2yW+Bn46Au885JIqc=;
        b=HrF5uwJxoXOV11YMhBbGRJ/9ndPGgu/4uT7zzBMfCg+/8bfnDgdBxwFaleAQTLmb4E
         RMIXJCVnGlHcFulZtmFB3YJsLwxDYEUJDlqH9/7PKkVKK/xwVdltZ85JbF4Xbxf6qZzB
         PLUN/uQfmwotYhwWFzY861k/fS0jBV1+59bfnkFEeY8Er2VnuIzaZhx8awra7uR0DG0v
         FqVA4+Dy4zvnkGLOzLtGLbMPNB7JW0Lw1SlfzB+EfOfLTiWnUUHVQyvthGWqCvZxBfFa
         OIkpGuziuBTBD63pNvcjLE1SVRGCFVTGP21mLWR44UxGVtrp9+AnD+cPL5p6mEfHhZll
         RFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZjKx3taedihzQLq4LOXOcRsta2yW+Bn46Au885JIqc=;
        b=I0E/WcOh5y/aKEKpYCFCTAFC6CmVNOK0cVIs1kyOJ3ATPR6OFERY1RHbPb2xFIkAFj
         6gkz+pCEAet26ellIVp0k+GFgxYkNZDu7TFUNXjoukD2BAKbYr3uuSS0oKzWUaGKosMO
         YapHEhiIOAc0wCX0QG33s0MIrdlHKnpPMe+xNy1SmPhzDAHk2erP/Pu2riatDFbGl6AL
         h7M3wdWikqGkvU+C3Q7Sun3HImQH5MiuocyC4zHok3e8iXlNEXM5GJRXuVv0+cYszJt+
         yRvZe+KogZOrl5reJCbjY3m8TzjHJOoKcnhJEBYcAG2qJvCu6FD2gNbWPue9ZHdvZUku
         b4SA==
X-Gm-Message-State: ANoB5pl7oLYurr73X78JoBi0fmTAcmkC/NCGLAu75mk9o6j1uP4xStYz
	ca5kadhkcKGq2xv0EwPVLT02b3DdH1mvxDNMwts=
X-Google-Smtp-Source: AA0mqf7rCuE5w6+wUxXXMHxMOqb4jfUxeJWaay6yViZHwfGHKaucxl3mRiQDZBSEjayS3pe0TDnuFA==
X-Received: by 2002:a17:902:ab8b:b0:176:7852:dae3 with SMTP id f11-20020a170902ab8b00b001767852dae3mr5416543plr.25.1668892537934;
        Sat, 19 Nov 2022 13:15:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/35] inetutils: upgrade 2.3 -> 2.4
Date: Sat, 19 Nov 2022 11:14:47 -1000
Message-Id: <b8d39056f58ac6a2264b432c95fd7012babe5164.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173548

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2022-39028.patch
removed since it's included in 2.4

Changelog:
==========
ifconfig
------------
Support specifying prefix netmask lengths in -A.
Hurd: tell pfinet translator interfaces to configure

ftp
----------
Avoid crash caused by signed integer overflow resulting in out-of-bounds buffer access.
Avoid crash caused by heap buffer overflow.
Avoid crash caused by NULL pointer dereference.
Avoid crash caused by infinite macro recursion.

telnetd
-----------
Avoid crash on 0xff 0xf7 (IAC EC) or 0xff 0xf8 (IAC EL).  CVE-2022-39028

telnet
-----------
Fix a buffer overflow problem.  CVE-2019-0053

tftp
-----------
Avoid crashing when given unexpected or invalid commands from tty.
Various bugs fixes, internal improvements and clean ups.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fec6ec179b97b768d32fbd782338450edc1a5344)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../inetutils/inetutils/CVE-2022-39028.patch  | 54 -------------------
 .../{inetutils_2.3.bb => inetutils_2.4.bb}    |  3 +-
 2 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
 rename meta/recipes-connectivity/inetutils/{inetutils_2.3.bb => inetutils_2.4.bb} (98%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
deleted file mode 100644
index 3b07515c7b..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From d52349fa1b6baac77ffa2c74769636aa2ece2ec5 Mon Sep 17 00:00:00 2001
-From: Erik Auerswald <auerswal@unix-ag.uni-kl.de>
-Date: Sat, 3 Sep 2022 16:58:16 +0200
-Subject: [PATCH] telnetd: Handle early IAC EC or IAC EL receipt
-
-Fix telnetd crash if the first two bytes of a new connection
-are 0xff 0xf7 (IAC EC) or 0xff 0xf8 (IAC EL).
-
-The problem was reported in:
-<https://pierrekim.github.io/blog/2022-08-24-2-byte-dos-freebsd-netbsd-telnetd-netkit-telnetd-inetutils-telnetd-kerberos-telnetd.html>.
-
-* NEWS: Mention fix.
-* telnetd/state.c (telrcv): Handle zero slctab[SLC_EC].sptr and
-zero slctab[SLC_EL].sptr.
-
-CVE: CVE-2022-39028
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=fae8263e467380483c28513c0e5fac143e46f94f]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- telnetd/state.c | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/telnetd/state.c b/telnetd/state.c
-index ffc6cba..c2d760f 100644
---- a/telnetd/state.c
-+++ b/telnetd/state.c
-@@ -312,15 +312,21 @@ telrcv (void)
- 	    case EC:
- 	    case EL:
- 	      {
--		cc_t ch;
-+		cc_t ch = (cc_t) (_POSIX_VDISABLE);
- 
- 		DEBUG (debug_options, 1, printoption ("td: recv IAC", c));
- 		ptyflush ();	/* half-hearted */
- 		init_termbuf ();
- 		if (c == EC)
--		  ch = *slctab[SLC_EC].sptr;
-+		  {
-+		    if (slctab[SLC_EC].sptr)
-+		      ch = *slctab[SLC_EC].sptr;
-+		  }
- 		else
--		  ch = *slctab[SLC_EL].sptr;
-+		  {
-+		    if (slctab[SLC_EL].sptr)
-+		      ch = *slctab[SLC_EL].sptr;
-+		  }
- 		if (ch != (cc_t) (_POSIX_VDISABLE))
- 		  pty_output_byte ((unsigned char) ch);
- 		break;
--- 
-2.37.3
-
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.3.bb b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
similarity index 98%
rename from meta/recipes-connectivity/inetutils/inetutils_2.3.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.4.bb
index 2fce84374d..6519331141 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.3.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
@@ -10,7 +10,7 @@ LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
-SRC_URI[sha256sum] = "0b01bb08e29623c4e3b940f233c961451d9af8c5066301add76a52a95d51772c"
+SRC_URI[sha256sum] = "1789d6b1b1a57dfe2a7ab7b533ee9f5dfd9cbf5b59bb1bb3c2612ed08d0f68b2"
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
            file://inetutils-1.8-0003-wchar.patch \
@@ -21,7 +21,6 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
-           file://CVE-2022-39028.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.25.1


