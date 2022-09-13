Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD9BECAAA1
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 01:38:00 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.4156.1663033069962263746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 18:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dUTo4yyN;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id y136so10330345pfb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 18:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=eKCmXPfR6giH2Xlq5dfYBCPVpuS0fC29OjiHtueey8Q=;
        b=dUTo4yyNSs0TJAI2/eo3Lq3Z13i4yVpI80ZU0cxKuRW897GjNARMDGrpUy/Bw2JFSm
         KHY/ffXscaz2RWa2dHnEadmlhaObUM/OHo5lyru5MYG8sNT4sGhAAtbykY3/3D6tYdRR
         Sr8MoIcY4Rfn4xsz9ytgkAZSQl/EVTopc+1ZLPVgBZBikdn4hsVS+/IuOUKQj8kDJrB0
         r5bDvflrOcdVg5QLOnIWJVod2AxLcfsoMp2Bick5fdtQ9/N9c5qkYK7Je4YVRzsTZHXs
         rzIaRUQAmKUhNz05C20wixDKvRyDmUHL0pjq5QKdmyAzX+FEYu0UrqzO/i38agsY72BJ
         O9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=eKCmXPfR6giH2Xlq5dfYBCPVpuS0fC29OjiHtueey8Q=;
        b=K8v/z+KA/GEeBVtE8KmKx/VhUjICUUWGa3Zh/lv0t6Bk3WEtbks9DNBldvkJHDeYfw
         IUQ7LnfL8wD4/6Yo+i7uHwoPnWOq/whwf5UqJjnwvVkc3ee8g6le3+89pAGxqESA6Soh
         5WyJvELA4JJr9d2WOMu+unt1xx2glDmCg1BNGBdBy0N1PMIqDPEqciyIdfmARLCM0vgw
         GYkFXOqUjLbckErnvbS6HtfVP5TsFV26IDEHElnc/6bl2Lvv09LnxRAMI1Je8xrvy4jj
         sQspEPHiF63aYcJgqfTQzaU0ydk9yCptx/Yg5aATyTjScuPn4gmCOLdHGKtrWFezzAM+
         mp0w==
X-Gm-Message-State: ACgBeo0lKjw0EnOFGLiDPG7kSzdcGTDUSRIbfEJzixV1zXJq/WenUoej
	NeJ0jfCPXSVz6zd92unXr7d0l9s6UqgFng==
X-Google-Smtp-Source: 
 AA6agR65YENfa+Liicg4XjrkEFKq2syxaD+Jnu8WZYZ+hSV2JHyJwVzEe7tqiATqjrRsVjL2k7caKg==
X-Received: by 2002:a63:f0e:0:b0:439:3aaf:8d2 with SMTP id
 e14-20020a630f0e000000b004393aaf08d2mr1781587pgl.256.1663033069027;
        Mon, 12 Sep 2022 18:37:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 q11-20020a170902eb8b00b001781a7c28bcsm5912923plg.237.2022.09.12.18.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 18:37:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] inetutils: Fix remote DoS vulnerability in inetutils-telnetd
Date: Mon, 12 Sep 2022 18:37:45 -0700
Message-Id: <20220913013745.4098256-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 01:38:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170555

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../inetutils/inetutils/CVE-2022-39028.patch  | 54 +++++++++++++++++++
 .../inetutils/inetutils_2.3.bb                |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
new file mode 100644
index 0000000000..3b07515c7b
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
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.3.bb b/meta/recipes-connectivity/inetutils/inetutils_2.3.bb
index 1e8f63637e..2fce84374d 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.3.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
+           file://CVE-2022-39028.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.37.3


