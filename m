Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A484C5CFDB
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 11:33:36 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11018.1786707214221618100
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 04:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Oobfd4xL;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3811f512167so1142091a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 04:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1786707213; x=1787312013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lp0FABIlTBoEZuLliDzNUwkiV1tvM6QkVpXODuLz06k=;
        b=Oobfd4xLUI0mZshmXaQsOSptWKR2YNbZ27U6AFknZ4wjuEyXA3PIQeIVshA63btYBI
         LCaMEMbxqRbLQ1is1riQVEsocp7VkXtGBLgN/wvWOIYRPisdKnHGCteQljAfMq/2TDQE
         likwmYLgZurW6eUDZCB97RJGIOOh4KRXLGS6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786707213; x=1787312013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lp0FABIlTBoEZuLliDzNUwkiV1tvM6QkVpXODuLz06k=;
        b=ljZ4mFCdNVCqb0H/vq/ZC+15cjLOGYHiKixDtOmZ6s0djpxC+V+eOEeBIoDlZNKUk/
         JMK4HEVqoSOU6RLPiAv/KDKwbKP4ZIcAfLKLh4wxzWzgQITER2XV5rTqWMS4j4mYGRc/
         KgJ6wgu5aUvPG9ppn2KgQf+ZGw6fwnA8sd5QVsnfmY+mmK7pPz+MSRwBUD7iYVD0mIXb
         dk3P7Ob3xDoIX4+ReDxq3sXFm8VH0T22MaJwbwZwT6hKjsrpzPcGRiFw9bZJpYT8/Flk
         Yhjo0IiVsUzIgOdoa0qANo3heRFB73Ck0PyzWarL/bKJhdy1Zu+rAYaLp4XgHNbZzGpQ
         H8YA==
X-Gm-Message-State: AOJu0Yw0X7hhGeEd1Mq0pZqHVZZPHXPjbN09Vw20npHubTSnMn2yIjx1
	kqE7wBocrBH9DoB9cPQmMPNdrIrl7y85qsTiigN1xTwW8lfAZFbfBGVo6b6CP1AO1iQ7/XCT/YT
	nESN8bFk=
X-Gm-Gg: AR+sD13yLAvkpU59mV5PZbBgiKDOAR3HEP1+XcztfkDjduilEYtWVSai1R2jOgfxFaz
	1NEhwE2xBhCJ/TQ0VrslnHtMXoPABCMQw+e3HhE2DtD26t63QS+Vcxizo58ES5kOeI0p1vysOWt
	n338GNEFD42G/PIRjRi/oSpW3k5OZ/6qIsqNUi5zwxfl+yOX+F4EvIRRQp1iAGXbKBHTsAmzfsO
	YbwxDXlCkMf3ADFTiohIdnpXbDFM31VAYYpp4IbJRAjF6GHzXNmEOSoGunPqghT6ejxE1/4J5hC
	qrCZ7HimQvu8PdumfZNtmXce0qKiR1DMGwa3pQNzqbKxkqbVfH5HpouwW4MOAv/A4pai86BC8Nj
	AE98Lme7O5zUs7FVOQ1R31bNLAjI420FW59qo00rsCIZAPl8WfOw7gUlPwVPXHFQauWXgqj3gId
	5nDE6oMLFs34aKHPSr5O7knxNwRSwI1dk9xz5QsvU3Uab1uXpXB5u3Y/ck9ijzuUUM2dZSMkpKg
	/c2
X-Received: by 2002:a17:90b:57ee:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3933b4e6c9dmr5869124a91.0.1786707213417;
        Fri, 14 Aug 2026 04:33:33 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:a7de:e349:c3d5:7c44:1c80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889d914sm8755859c88.13.2026.08.14.04.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:33:32 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] rpcbind: Fix CVE-2026-16277
Date: Fri, 14 Aug 2026 17:03:23 +0530
Message-ID: <20260814113323.1033135-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 11:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243447

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-16277
[2] https://security-tracker.debian.org/tracker/CVE-2026-16277

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../rpcbind/rpcbind/CVE-2026-16277.patch      | 34 +++++++++++++++++++
 .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch b/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
new file mode 100644
index 0000000000..868e5c3f01
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
@@ -0,0 +1,34 @@
+From bb9bb7286a4c345442946dc2ce3c9e7f67e96d4d Mon Sep 17 00:00:00 2001
+From: Steve Dickson <steved@redhat.com>
+Date: Wed, 27 May 2026 11:42:11 -0400
+Subject: [PATCH] rpcinfo: stack buffer overflow in rpcinfo rpcbaddrlist()
+
+rpcinfo's rpcbaddrlist() formats two server-controlled, unbounded XDR strings into a fixed 128-byte stack buffer with sprintf(). A malicious or on-path rpcbind server overflows it when a user runs:
+rpcinfo -l <host> <prognum> <versnum>
+
+Reported-by: Michalis Vasileiadis <vmihalis.tmd@gmail.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/rpcbind.git;a=commitdiff;h=bb9bb7286a4c345442946dc2ce3c9e7f67e96d4d]
+CVE: CVE-2026-16277
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/rpcinfo.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rpcinfo.c b/src/rpcinfo.c
+index 0e14f78..43e8115 100644
+--- a/src/rpcinfo.c
++++ b/src/rpcinfo.c
+@@ -1120,7 +1120,7 @@ rpcbaddrlist (netid, argc, argv)
+ 
+ 	  re = &head->rpcb_entry_map;
+ 	  printf ("%10u%3u    ", parms.r_prog, parms.r_vers);
+-	  sprintf (buf, "%s/%s/%s ",
++	  snprintf (buf, sizeof(buf), "%s/%s/%s ",
+ 		   re->r_nc_protofmly, re->r_nc_proto,
+ 		   re->r_nc_semantics == NC_TPI_CLTS ? "clts" :
+ 		   re->r_nc_semantics == NC_TPI_COTS ? "cots" : "cots_ord");
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
index dbd4d32e0a..07e2f10c98 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind.conf \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
+           file://CVE-2026-16277.patch \
           "
 SRC_URI[sha256sum] = "5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de"
 
-- 
2.43.0


