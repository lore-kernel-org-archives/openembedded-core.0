Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CEEC32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 21:33:39 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.3648.1664228010202624438
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 14:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PKixASul;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id 13so16876379ejn.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 14:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ZDhnFVNEnTtwJm//nPk0yj3EAD5JfjwKpjSkHi6eVN4=;
        b=PKixASul5NXSjgOscXK92/DfGicPisg0ucl9WYNUoTsxSGxrUD/NiG7IqJwU0qTeub
         XaCKT1GQ8vSzR1SYBocTXws0z6IiDU9iUEVL9bNdZNo+xpMPe8BLpBcxS+MbS67ZOmtY
         +00OdnFsMgsEkEt3ZVsOfBCbqBWZQah8LPULDOQnv5e+HWRI1zrfNneRZ2jrfPt2DJB6
         Dwxq+Jja3zypJvip4rvZPUiZx2C+qMPJ0VjRkgZI55LjI/EKcLm1CSu3vVzZjQTs6sLo
         Z7K05uLySdQoJFf9UYBa/EBFWnXt4lF8Mh9Nq8jZckHcogVY11eLOPkCUrOvRn/bZ4lz
         PtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ZDhnFVNEnTtwJm//nPk0yj3EAD5JfjwKpjSkHi6eVN4=;
        b=S3sL2uWW6pGSoNID1YtKS2Pzgz45Dr82v0A4H4eNP8MlkIjYnjNPQw6sCLoud8kLIs
         NP9sGYA3DlnyShWKrK5188p7/kB96shRKM88nRhncRXm6TFjgOSmDLCx+DSS5WBdMJbC
         pJkXzxzj8CjEGaRnXZ3I47Ps1ueO8TJ0RB3JAQwlFXP5sVj9rOKFzRPU9DB66OJwBYF0
         pKg05u8tFgiVwCgYAHTkMjOOndbs5h7CM0bLrc9RcD/0UP587t+rct38WcUQO3E0ILHB
         A/PhIgUe7Rx7XeGzbeja6zsA4yNDmitZ4C4DF+258rSE10Cr7aTynhnYnOdEF/hywn59
         HD6A==
X-Gm-Message-State: ACrzQf1XG3ZbwKUcatpYGVkRK7670Y0iiAg+79wOruv/q/gXQpq8fUxD
	6xggmD5DGMGiDcxmyxuUkkdiNPPLjPw=
X-Google-Smtp-Source: 
 AMsMyM6ijIcFemJZT2C4RqYb1OJDYPE55rYWFuOBtcH8WXdYnAtzbe/+KMo7ES90LcFz+2ayg9ln4w==
X-Received: by 2002:a17:907:97c6:b0:783:dcad:3454 with SMTP id
 js6-20020a17090797c600b00783dcad3454mr2559349ejc.271.1664228008320;
        Mon, 26 Sep 2022 14:33:28 -0700 (PDT)
Received: from localhost.localdomain (ip5b423fb4.dynamic.kabel-deutschland.de.
 [91.66.63.180])
        by smtp.gmail.com with ESMTPSA id
 i2-20020a170906444200b00783975025c8sm1949535ejp.121.2022.09.26.14.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 14:33:27 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] inetutils: Fix remote DoS vulnerability in
 inetutils-telnetd
Date: Mon, 26 Sep 2022 23:33:08 +0200
Message-Id: <20220926213308.48588-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 21:33:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171076

Fix telnetd crash if the first two bytes of a new connection
are 0xff 0xf7 (IAC EC) or 0xff 0xf8 (IAC EL).

CVE: CVE-2022-39028

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 .../inetutils/inetutils/CVE-2022-39028.patch  | 54 +++++++++++++++++++
 .../inetutils/inetutils_1.9.4.bb              |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
new file mode 100644
index 0000000000..da2da8da8a
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
@@ -0,0 +1,54 @@
+From eaae65aac967f9628787dca4a2501ca860bb6598 Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Mon, 26 Sep 2022 22:05:07 +0200
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
+Signed-off-by: Minjae Kim<flowergom@gmail.com>
+---
+ telnetd/state.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/telnetd/state.c b/telnetd/state.c
+index 2184bca..7948503 100644
+--- a/telnetd/state.c
++++ b/telnetd/state.c
+@@ -314,15 +314,21 @@ telrcv (void)
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
++		{
++		  if (slctab[SLC_EC].sptr)
++		    ch = *slctab[SLC_EC].sptr;
++		}
+ 		else
+-		  ch = *slctab[SLC_EL].sptr;
++		{
++		  if (slctab[SLC_EL].sptr)
++		    ch = *slctab[SLC_EL].sptr;
++		}
+ 		if (ch != (cc_t) (_POSIX_VDISABLE))
+ 		  pty_output_byte ((unsigned char) ch);
+ 		break;
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index f4450e19f4..fe391b8bce 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://0001-rcp-fix-to-work-with-large-files.patch \
            file://fix-buffer-fortify-tfpt.patch \
            file://CVE-2021-40491.patch \
+           file://CVE-2022-39028.patch \
 "
 
 SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
-- 
2.25.1


