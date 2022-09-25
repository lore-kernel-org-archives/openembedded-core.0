Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EADEC54EE9
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:12 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.20183.1664133481797225765
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WvnX8vpK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d82so4725973pfd.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Zf9Y8dMncKlupokUMqXZePOZTPHIpotQqqCNqfxjhdo=;
        b=WvnX8vpK1qa6MavtK9X1JBm0M2peHSIHN11dGDq/qGZbTDHyDfDuRfTSW5ehC1cWyK
         QIThDcGwhSOBGA4IApwptaK1UAHmQp+ozBnv2zbRYCXE4QALObuobnvngZtEwEFI0mWy
         XVdcRtoE7sDaX4lQvvsVozhRsv/xmGvg0fYS7Koc/aGrDtRFz3C5z2Giemw9JGEMOwR6
         7SksbaYIq7IyTW5eUGiAPcSAq08v5apBZIaZybP7f05RtrWrnUNY1d1+fnAHbYy4C0qK
         6t9L7LcDI6v+z2U5mJ+uoh3i1ePS0UQGHsM+clVfsl59Joiui0YDPsSp4l3DZnYN/y0t
         t1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Zf9Y8dMncKlupokUMqXZePOZTPHIpotQqqCNqfxjhdo=;
        b=P97VAKHPo0IUpShTgPv/osDJeVtC1ddf9Of7/olQ26+nka78NpugM6CE9puLefdju8
         bo0AZsB8OBOeWf/enbyDV/X3VCGXGU8t70wvfJ24mRcHo/1oLWY3rM+nBzjHW+8HrtRv
         TxmYXyELB2D9VS2HFAkCv2dLxcbGg/v2zXq8yuSZXeBvAKps85RmhyeueGt0krD5gr6N
         yBG1FXi8EN7J7z2LnW0221N+L8jyKRlr5LOuwxJZybxZKtrgetEUpWZeJUNyFb7Co4nd
         KOKxVr5WF7aWF7PI/4qhedZuBfYjoC7Qk1bO6iUFvHqbKFCqAmOx7uY9QJkEaLIJ0qOb
         s05w==
X-Gm-Message-State: ACrzQf1rEtusvf4uLxswDI4QLQfkn34fNQ+wy9F091dyRMSf9FkAiD0Q
	MudO8GsdrwF5694XJuHxwshyRtBLtYhu8Qa+
X-Google-Smtp-Source: 
 AMsMyM43gJ/1c3RL5fbgVPnXdJ+/NsipzbhDmD2JHtWRZzWjzmUdrQZFWqKOr3ppEIFz3IE5FEbR5w==
X-Received: by 2002:a65:6950:0:b0:439:51cd:8b8b with SMTP id
 w16-20020a656950000000b0043951cd8b8bmr16954179pgq.230.1664133480719;
        Sun, 25 Sep 2022 12:18:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.17.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:17:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/33] inetutils: fix CVE-2022-39028 - remote DoS
 vulnerability in inetutils-telnetd
Date: Sun, 25 Sep 2022 09:17:13 -1000
Message-Id: 
 <12740b58ce1f700ff271a9891a92de6e04e325f2.1664133308.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171015

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../inetutils/inetutils/CVE-2022-39028.patch  | 54 +++++++++++++++++++
 .../inetutils/inetutils_2.2.bb                |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
new file mode 100644
index 0000000000..54040ad74c
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
@@ -0,0 +1,54 @@
+From d52349fa1b6baac77ffa2c74769636aa2ece2ec5 Mon Sep 17 00:00:00 2001
+From: Erik Auerswald <auerswal@unix-ag.uni-kl.de>
+Date: Sat, 3 Sep 2022 16:58:16 +0200
+Subject: [PATCH] telnetd: Handle early IAC EC or IAC EL receipt
+
+Fix telnetd crash if the first two bytes of a new connection
+are 0xff 0xf7 (IAC EC) or 0xff 0xf8 (IAC EL).
+
+The problem was reported in:
+<https://pierrekim.github.io/blog/2022-08-24-2-byte-dos-freebsd-netbsd-telnetd-netkit-telnetd-inetutils-telnetd-kerberos-telnetd.html>.
+
+* NEWS: Mention fix.
+* telnetd/state.c (telrcv): Handle zero slctab[SLC_EC].sptr and
+zero slctab[SLC_EL].sptr.
+
+CVE: CVE-2022-39028
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=fae8263e467380483c28513c0e5fac143e46f94f]
+Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
+---
+ telnetd/state.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/telnetd/state.c b/telnetd/state.c
+index ffc6cba..c2d760f 100644
+--- a/telnetd/state.c
++++ b/telnetd/state.c
+@@ -312,15 +312,21 @@ telrcv (void)
+ 	    case EC:
+ 	    case EL:
+ 	      {
+-		cc_t ch;
++		cc_t ch = (cc_t) (_POSIX_VDISABLE);
+ 
+ 		DEBUG (debug_options, 1, printoption ("td: recv IAC", c));
+ 		ptyflush ();	/* half-hearted */
+ 		init_termbuf ();
+ 		if (c == EC)
+-		  ch = *slctab[SLC_EC].sptr;
++		  {
++		    if (slctab[SLC_EC].sptr)
++		      ch = *slctab[SLC_EC].sptr;
++		  }
+ 		else
+-		  ch = *slctab[SLC_EL].sptr;
++		  {
++		    if (slctab[SLC_EL].sptr)
++		      ch = *slctab[SLC_EL].sptr;
++		  }
+ 		if (ch != (cc_t) (_POSIX_VDISABLE))
+ 		  pty_output_byte ((unsigned char) ch);
+ 		break;
+-- 
+2.37.3
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
index 6c9a299b71..d8062e2b21 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
+           file://CVE-2022-39028.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.25.1


