Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2828AC79F9B
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2490.1788641134047282172
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UtwTz8gh;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba14so1927263f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641132; x=1789245932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j4mrVTQ3kkDRbNpc7wX5UtBm1FlJvcEOL/ytwamFGwc=;
        b=UtwTz8ghPj8a6MgtIXRqFC38VHM7OcwlWJVYLmdR0ZUGwvF3tG0Kf4mvfNxAhrJPMR
         iL1Oqi15g2B1MQHhLW2oh+4r0yVwFUogWwckRdlO96eEgsiBUDeKOWzUSBVYJBBfIBf0
         2hB4Zpjhntx2AAKAVs8g1NKse/r6sgeMcWCQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641132; x=1789245932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j4mrVTQ3kkDRbNpc7wX5UtBm1FlJvcEOL/ytwamFGwc=;
        b=S6nayGU32YGfbcRqO8R9sd/wDziyvcyTxtERjGzZkKAZjYuyJrSgjR86wtu5D/LWQ8
         CKKMc33MhSoMnrCZVBmeDa1DNOC9aSchQpQzv5a9ejhoNR0CwMwRm43S1QAt7OdeesHh
         MK38BgE2h1NDIbFO62Uo8TP1G+ZSOE4C7zwaOZvk4ya2s7tKue8PQ+fJ63mEMNzt17zX
         XAAx12SH8C8OYfHzfUVe7qTBFkXmJfb7eCT6rGDV50x2vi/2qqRXKQRMiVBFyupxI9S9
         MZ7CgjS7Ri7r3bKnLjC6VhzQPLxDMRDx6dxlaVsEhnM72TwsEFnEfcwuqrkPyuaHfWpY
         FZTA==
X-Gm-Message-State: AFuF++m1vVXbTFap6maxURZCG8xf/S06bBgmbeYHjpakfVS7vqmiID1d
	y609BcyD+d41gVc02LJmG1MKgNGckFiRdMOiNv63MNJ2zA+pEvTUyXHicPMLlp6FnbazmyqbyOa
	uXEVwUdw=
X-Gm-Gg: AYBFou3QsroMJ6n71YfYSO//+HBceiw5FSy4fI+Fx8/MLTdpLoiwKw5K/RpFPJKg1Mc
	TAW48DGe1PX126/uBzC1uymXsC49n61sLAk9UYosBeRxlUVY376hgT7xBNmUcC8bT2eBgZ/LZrC
	WUPkI85EsOYxALVlMZxHx3fmRWpDFhBxOXOnMqc9yyFOcWeF//nfSGRIWBh0C2FkMZFlz7HEqIc
	3zFIymoJboOHhb+dW49O1XhfsD8546QX4EQ9rbxvryNgavAvJvJ2FVpVJf/pBuURMvSOrzH/IVC
	Ak+TkRYkQ0V6HZA5rw3AvaOTa4owve0v+yz8bAzHJS5hvu/iBejDJS5lcEftQd2a0Qw5ql2UL0D
	FHE9m9LaiXQNX5+JoYESii+5MkK97iiSnmY0sizyDSuqa14mJ6kHY/FRKulVdZGLnNFzreJQtrP
	htFtqmRxw41UuC8wzZTBi37muaZpaWxmmcvI9RQBMAhuU7gwyOkos5AD1siMwEmGxHgYTtjBshg
	OdqJgIxXx+DKynYhLv5hxAbzY97hUqgJXEd+DTLlA7OYLVS4qto7dKEflJPajsBdA==
X-Received: by 2002:a5d:5e91:0:b0:483:3695:6ea6 with SMTP id ffacd0b85a97d-485872c1debmr17461515f8f.20.1788641132209;
        Sat, 05 Sep 2026 13:45:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 38/40] util-linux: set status for CVE-2026-13595
Date: Sat,  5 Sep 2026 22:44:39 +0200
Message-ID: <6d98aed110fe0f6671cd22833f4e64106e9034dd.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245190

From: Peter Marko <peter.marko@siemens.com>

Per [1] this bas backported to 2.41.5.

[1] https://security-tracker.debian.org/tracker/CVE-2026-13595

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC:
Fixed the inequality in the comment, commit message and [1]
tell ">= 2.41.5".
]
---
 meta/recipes-core/util-linux/util-linux.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index fdc62acc748..09916594b0a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -26,3 +26,5 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 SRC_URI[sha256sum] = "f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728"
 
 CVE_PRODUCT = "util-linux"
+
+CVE_STATUS[CVE-2026-13595] = "cpe-stable-backport: Fixed from version >=2.41.5"

