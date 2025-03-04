Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DF8C282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:19:54 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.20376.1741090791246234821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=drf8adxW;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22349dc31bcso95947005ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090790; x=1741695590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXEh0yR4wF8+mUu6WaZvc3PPwbKcpyHHOMqhgCz2Ff4=;
        b=drf8adxW2Z180mnhDLlir+5Vjr04wFTfbQFDnn1Y2Jxg5/5Xp3oLWPkrMXDaacDoPV
         TzkUw5B/1GWCTrEUH3+dR3buUD3mlwz9XqAyy1fyqyB2K7daqMiB2aNZU+9CYiXf1mFs
         FQaIsFoLxq43YegvNjvIbjWWsbiajPD8mN0Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090790; x=1741695590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXEh0yR4wF8+mUu6WaZvc3PPwbKcpyHHOMqhgCz2Ff4=;
        b=wfm7xv0I906931sm0G3dqima40OELyCMY42mY9B39guwCoqi2N1/2M6c7WCvF/flET
         duuPx0djlNzaQlYIHbP6g34CcYXkk/YL+TtC/4/fcDK+DeC7nr3CYLIMzqaoHc6B8Gkj
         be3uK2en0lPFmTFpBcB46hEcSu9sv57wJoqUuE3j1Z/+akik17sBcam1Wy/w5vDKivUB
         uRQh4X6QA0d62isdqtms18pFOAAX1YkzSRQkk/IAZaLWwKOQDkZUl16CUFtsT3lsTuj6
         LpkjJwQR+fptebJzyu8AlbnYpG5xh76xQxdT7N1D9sxn5Dzs4E77/YxrenWoEm0b1UKY
         Uoig==
X-Gm-Message-State: AOJu0YwY2ca0Qpui1avaHSQSPCmBTOX0QDTwSJ4paApJ2GH+rZFFgPMp
	FkRtwIeFWv4PyxXuxRTA80llaG/ou0AFL8KObOr2BvIvLZA2szxh/F2qRi2mtKeklI4/lFda+3I
	jw1w=
X-Gm-Gg: ASbGnctH0jVSHa5CIeReTbW3Xo+q2uGZZkswShZgQ4JGh+xgIz+3Tx6KBq2IyqxwcT8
	0djnM2WwreNcIrWvYnx63opdix4VH7CxoS8Mh5oiHog/t4cb3J+OXjmAQ8UPkj9bVxfQOruxG6x
	ygB7duMXMTDVXA3HiCTbPmPrWi21NZkDJ3hILXxZgJcJ2aoqtyMQ4XsdKZqgztCR5UtVUGbuZw4
	qwtIJsFNtzjhlPMnm1E+HSnrpVh+g6ba/7XABuxadrA247P0m+YhdSpvW5xiepBnx9FrLT/K56q
	fhEPMoKeEPjnYAmDYfJ6lWA7PwCRQFCHEgGkck7uPTMmyPUNxWIUVQ==
X-Google-Smtp-Source: AGHT+IE/AaDEdVNT8WDDnkEF/WhWP+6WO1mHEuv7Cr5qhD8Yfie/G2nkz9wf/KGZSMfktpRUQpkjvQ==
X-Received: by 2002:a05:6a20:3943:b0:1ee:cdda:b8ea with SMTP id adf61e73a8af0-1f2f4d20979mr25780029637.19.1741090790293;
        Tue, 04 Mar 2025 04:19:50 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:19:49 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 04/14] xwayland: Fix CVE-2024-31081
Date: Tue,  4 Mar 2025 17:49:08 +0530
Message-Id: <20250304121918.147345-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212269

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645db5d0c00926a29ffecee

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2024-31081.patch    | 47 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-31081.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31081.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31081.patch
new file mode 100644
index 0000000000..4380004700
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31081.patch
@@ -0,0 +1,47 @@
+From 3e77295f888c67fc7645db5d0c00926a29ffecee Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 22 Mar 2024 18:56:27 -0700
+Subject: [PATCH] Xi: ProcXIPassiveGrabDevice needs to use unswapped length to
+ send reply
+
+CVE-2024-31081
+
+Fixes: d220d6907 ("Xi: add GrabButton and GrabKeysym code.")
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1463>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645db5d0c00926a29ffecee]
+CVE: CVE-2024-31081
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/xipassivegrab.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Xi/xipassivegrab.c b/Xi/xipassivegrab.c
+index c9ac2f8553..896233bec2 100644
+--- a/Xi/xipassivegrab.c
++++ b/Xi/xipassivegrab.c
+@@ -93,6 +93,7 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+     GrabParameters param;
+     void *tmp;
+     int mask_len;
++    uint32_t length;
+ 
+     REQUEST(xXIPassiveGrabDeviceReq);
+     REQUEST_FIXED_SIZE(xXIPassiveGrabDeviceReq,
+@@ -247,9 +248,11 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+         }
+     }
+ 
++    /* save the value before SRepXIPassiveGrabDevice swaps it */
++    length = rep.length;
+     WriteReplyToClient(client, sizeof(rep), &rep);
+     if (rep.num_modifiers)
+-        WriteToClient(client, rep.length * 4, modifiers_failed);
++        WriteToClient(client, length * 4, modifiers_failed);
+ 
+  out:
+     free(modifiers_failed);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 78e849b305..5fa2402234 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-21886-1.patch \
            file://CVE-2024-21886-2.patch \
            file://CVE-2024-31080.patch \
+           file://CVE-2024-31081.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


