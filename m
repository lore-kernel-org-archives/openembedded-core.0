Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFCF103E167
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 11:35:14 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11953.1773833709669706481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 04:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AhoR45p2;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b042533de1so3953985ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 04:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773833709; x=1774438509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3l4jpEXyilitEoGk1Z/ZClplWlo6bSZnaPvzFjOPWc=;
        b=AhoR45p2pe1LDZ/rAttC9G5ZWukd4Ir6oUE6Buf+0SdpZ//xRDLfGVqYzclH1FaJ+d
         TMgwNxyxeYugEL/cXgmZLjqEj53/6Ll7vKz0pkfar/XKbjCPPXPvb+l/g2TXx68rjDTV
         +W24+YqXtBQjydUMqJDDxzLDFBdZM8tZ4OnTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833709; x=1774438509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3l4jpEXyilitEoGk1Z/ZClplWlo6bSZnaPvzFjOPWc=;
        b=a1GA0URx3WxkuGWiBfZtIJJz0T8f2rGobKlEPRymJmZbOmMob8Z7cejK9glXkazb4d
         cHtvjHEda0oMqagXMeIDbCMhzM1zZVTkAoKrN7R3SJj4RLozarpdNXdido/jVp/e4jo/
         Ta1FPqDv6Fx6EjiKkGjo4+wYo0ELGy/1o1Deg1iNjHtFjPTf6smX1r3idNk0cfyXtEW2
         FsRcAin5dV7PnlqqQ4j72xXrlM4+BhpLqncm+uyxEg+7w619P7qIDzLTeXOxmQ67OxLA
         naVMLUAATQjBTyXXeRnijpfHkEc0Va9n/jdX6rBuVwLWu6FB2U5gkBD5vG715QHx4YoD
         Ysjw==
X-Gm-Message-State: AOJu0Yy3Mngv15QARSwj46fxNPzUTNlRFmFE6Zc6PHGFyoIWg77XrHLW
	tFgQbcgK9Yx7C2CrihjPqkAHq2SYgJ0RKWznnVAPvypj+h6Q9uy4MkvRQcuZEWIVRilV+FKvtO1
	cLmF5nCw=
X-Gm-Gg: ATEYQzzgHvNFD4FCyoDTK2lDxBOmcfMOTLQE/tBwZCmGZ1oStDMSrBPagmkcyv2OoN9
	uLdQolt1UH4HbEtEpdfKSUlgjO2s+qmA4kyukhCRRMPLYa0a/ebWvMZ7mZAcib3QDvf0UPBDtNh
	jO6CBR7We1h99mtlzeu8Kw5RSBCCEgaLaGb3bwBmY5G3CrAIkl5ZE6IMmvMnzrWYrCx/cfBwUTx
	7QPwyMG0wcK/RylRDaqjZQfz2Oy9ltsc4PTuY+uAXO30Qvg0D7ki/3D8H31g+d045Ac/pPBfA1H
	rwL/G77nZUwlG3B3XaYn2ryhhVf3QIrvugcSVaFjd1dD2HAH3fB28IPMulEkCLZVgCPcbJH2QSw
	6oh8w2+SAa9c0fZ6HtIPw7XRnbagJ8q4hehNzrqCSlWlwJkp/P5U7dLSS2xawPHg4RWx+KKE3il
	nwlAV39EIzuw1w7k6deHqNph0uDPatiDopK9c=
X-Received: by 2002:a17:903:1b0f:b0:2ae:5426:da49 with SMTP id d9443c01a7336-2b06e3e106dmr35782315ad.34.1773833708584;
        Wed, 18 Mar 2026 04:35:08 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:84ed:f824:cb15:1c78:bc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e6216c5sm32407945ad.73.2026.03.18.04.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:35:07 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][whinlatter][patch] inetutils: Fix CVE-2026-32746
Date: Wed, 18 Mar 2026 17:04:47 +0530
Message-ID: <20260318113448.2316921-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 11:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233380

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-32746
[2] https://lists.gnu.org/archive/html/bug-inetutils/2026-03/msg00031.html
[3] https://codeberg.org/inetutils/inetutils/pulls/17/files

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../inetutils/inetutils/CVE-2026-32746.patch  | 40 +++++++++++++++++++
 .../inetutils/inetutils_2.6.bb                |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
new file mode 100644
index 0000000000..dfab82f01f
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
@@ -0,0 +1,40 @@
+From 6864598a29b652a6b69a958f5cd1318aa2b258af Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Wed, 11 Mar 2026 23:06:46 -0700
+Subject: [PATCH] telnetd: fix stack buffer overflow processing SLC suboption triplets
+
+Previously a client could write past the end of an internal buffer using
+an SLC suboption with many triplets using function octets greater than
+18, possibly leading to remote code execution. Reported by Adiel Sol,
+Arad Inbar, Erez Cohen, Nir Somech, Ben Grinberg, Daniel Lubel at DREAM
+Security Research Team at:
+<https://lists.gnu.org/r/bug-inetutils/2026-03/msg00031.html>.
+
+* telnetd/slc.c (add_slc): Return early if writing the tuple would lead
+us to writing past the end of the buffer.
+* NEWS.md: Mention the fix.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=6864598a29b652a6b69a958f5cd1318aa2b258af]
+CVE: CVE-2026-32746
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ telnetd/slc.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/telnetd/slc.c b/telnetd/slc.c
+index be18782..3434829 100644
+--- a/telnetd/slc.c
++++ b/telnetd/slc.c
+@@ -162,6 +162,9 @@ get_slc_defaults (void)
+ void
+ add_slc (char func, char flag, cc_t val)
+ {
++  /* Do nothing if the entire triplet cannot fit in the buffer.  */
++  if (slcbuf + sizeof slcbuf - slcptr <= 6)
++    return;
+ 
+   if ((*slcptr++ = (unsigned char) func) == 0xff)
+     *slcptr++ = 0xff;
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
index 29a40143a2..9892507ad9 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://CVE-2026-24061-01.patch \
            file://CVE-2026-24061-02.patch \
            file://CVE-2026-28372.patch \
+           file://CVE-2026-32746.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.43.0


