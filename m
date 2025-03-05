Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AD9C28B22
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:36 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.6369.1741212686369059761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JYKUOY5k;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223fd89d036so19279435ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212685; x=1741817485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH7M4gR9/TU2+1DJ80sAOgADYycJSRd6dtAtJaBtVjA=;
        b=JYKUOY5kjXY+nq/BX3lAOiqN4irXf8gSWPZO+rl9tm83c0WB2ty3McSW5BmplayDYD
         434M1Zx43jBd8RxuMflNwyrVs3bESn+w51SujN+0VtvYZCqLr4R4dH7FYDDLBdPr8zT0
         aVLrFWLlGl7ZF5e1HMZTSu1NKfGWaN9g/TTb746MYdTcRsHG2z1rZf14Mnw6zcnQzmd2
         NfxNsclgzTXn4nQGjqHkSFgTncDWKr/AQoEYigBy66AMbVllz0UCyBcZgIik6KVaLcNB
         Hk/9m8n6fLucIdAhQTO98RtiuyJe5Y/BKobg360RHTruM2ZwHBtyNOWqr04gSxvZ03f/
         +Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212685; x=1741817485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH7M4gR9/TU2+1DJ80sAOgADYycJSRd6dtAtJaBtVjA=;
        b=QbChdz8VZXjh0lTuf+GVDWxRqDonEEjFdb/zqLn43Ow2qIeLgmz8GU0KnjY4AGCDCQ
         RZ8n/FiwwmDSQ//YoVryXUa9EDALw0dfTNGcWSRdIIXt9zZaZ/bXyy2shJcD6nCAsRfK
         xqF4GxiuDINKQQjpY7TKApJh0IW6MJ10zPWBXB56TK88gyZ+ac6ZOh4jmXDG/+BT3CrB
         UQNat6sg0QvmS0goz6duyxalPEXik5V76d9CMgC/7lfMaqk4oF6txBAC0euLg1RcpuSF
         sDt8CgXpzR63hbup/He7/4hd3ulbnlN2gCUf+ELiMExBTyIDVJTWKHFWBUEArK4tVSaK
         ij0A==
X-Gm-Message-State: AOJu0YzZjA1qjelmEqLftzuZdzqexbMuLNrX/BVGLMkpfLoXLNTkSNSh
	Ylqet1zKst//+7AqEr/xRt2DRYNj9eva3kc703V3uVslepxw1iUmDDgAEXoKyl/zNsN+cxDzgvU
	N
X-Gm-Gg: ASbGnctkfKRNOwMuyOhJYSewpFwyorQZeG6u7kGQNJHE2S0lRUmhiRXpzTgURr4mMV+
	gDZOi5D/zIcCjzKvE0MQ99oL0nPHcO6GTPDGppIMGTZNgrImREk8/ELZQPxaz5by+clR2Wr9EDd
	xa8ydq/7dgg3PuHixH85qJdQCu3Yy2d3622qHudlOtCrpw9PmX14ei96QFixcHMklnZIALKJnf1
	dSsF2lZLGRbDmlftXn+4W2xCve71jSnyvedkZJa0gBWZEhI2h7nRdJ+ISlD1zGFvhfvcHh5aU5u
	gO+HRhRrzFxHihH7FZKVSbU+9+oi+6mV0io=
X-Google-Smtp-Source: AGHT+IFJ9ir+9wWLEX21jUnFBOYUP1TtnSDoadmFOSZ8qxrmrjkSeX/tvIWvIjLflqUiA0y6iCfHBg==
X-Received: by 2002:a17:903:32c2:b0:223:66bc:f1e6 with SMTP id d9443c01a7336-223f1c6afa6mr89522905ad.5.1741212685592;
        Wed, 05 Mar 2025 14:11:25 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/16] openssh: Fix CVE-2025-26466
Date: Wed,  5 Mar 2025 14:11:00 -0800
Message-ID: <7360f3998939e202f9611644a8bed0c3fe0c782a.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212351

From: Vijay Anusuri <vanusuri@mvista.com>

sshd(8) in OpenSSH versions 9.5p1 to 9.9p1
  (inclusive) is vulnerable to a memory/CPU denial-of-service related
  to the handling of SSH2_MSG_PING packets. This condition may be
  mitigated using the existing PerSourcePenalties feature.

Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2025-26466.patch      | 38 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch
new file mode 100644
index 0000000000..27b2fa7143
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch
@@ -0,0 +1,38 @@
+From 6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 18 Feb 2025 08:02:12 +0000
+Subject: [PATCH] upstream: Don't reply to PING in preauth phase or during KEX
+
+Reported by the Qualys Security Advisory team. ok markus@
+
+OpenBSD-Commit-ID: c656ac4abd1504389d1733d85152044b15830217
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2]
+CVE: CVE-2025-26466
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ packet.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/packet.c b/packet.c
+index beb214f..aeab98c 100644
+--- a/packet.c
++++ b/packet.c
+@@ -1773,6 +1773,14 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+ 			if ((r = sshpkt_get_string_direct(ssh, &d, &len)) != 0)
+ 				return r;
+ 			DBG(debug("Received SSH2_MSG_PING len %zu", len));
++			if (!ssh->state->after_authentication) {
++				DBG(debug("Won't reply to PING in preauth"));
++				break;
++			}
++			if (ssh_packet_is_rekeying(ssh)) {
++				DBG(debug("Won't reply to PING during KEX"));
++				break;
++			}
+ 			if ((r = sshpkt_start(ssh, SSH2_MSG_PONG)) != 0 ||
+ 			    (r = sshpkt_put_string(ssh, d, len)) != 0 ||
+ 			    (r = sshpkt_send(ssh)) != 0)
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index a8ba67e360..ea5face097 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2024-6387.patch \
            file://CVE-2024-39894.patch \
            file://0001-Fix-missing-header-for-systemd-notification.patch \
+           file://CVE-2025-26466.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.43.0


