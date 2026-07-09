Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4787CC4450C
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5803.1783591626528576538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BkhPL51O;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so12972465e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591625; x=1784196425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B1w3kL3kaWGbPrFpOktrQFR40rJ1VtuYWrgumn+cQIk=;
        b=BkhPL51Ot/4S5q/JVCNKXzrPxxttoCfPZxru1EEj7ngbsjIk8MbARv2CYdilEyxNRx
         CTpZKCQjKAyGxzMCgF0D3clplCgdI1QDRfWwe/SnImXN4TVUn1RmF2SeoNSlMyp7Kmin
         wYc6IdymNQ8VQiNByllodeMNBcj6EXN4uDseo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591625; x=1784196425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B1w3kL3kaWGbPrFpOktrQFR40rJ1VtuYWrgumn+cQIk=;
        b=f+5TTtYoefk8ZVoJA5emu1fE7NNkOZbk2pQAivuegqe+/2e3fYJ1WmfNG8OqmK/EfK
         CqLyZsj/X37Pwvu+BAcJEP9+YpVl4zi4E1skcSwLWEiIaRSLmLb1WMkSKfUwTiWG2WR6
         opA8Cvl/Tl4ShkVZs52X+lUai6FSXTEGjeh+q0g9H0HGXSk+7sgZIGU88x9MERzprDgY
         q7jI3LkoOBS6mYbiS0nP+LdfoA0ybwrRxcM0Cw/2K9SawyFavApR0jII0SqZamBXyyvV
         tUBAyJkinlJWLvMpPp4BIftHgGx78dVHbiK++GOr+ny+pnYKjtZw5SqWFugkySZKddDk
         arFg==
X-Gm-Message-State: AOJu0YyTQh/RAgH/92NEMKEnJVZX8TKYTG3J1NFoL6pZ6K2aP+x7s3xl
	2c/a2iyjKF/zvGg4m8IYUraprbuywOxtyy16fCw2V9ovQPOUbNSj9XGG0mzq0h+fT1rR9dYSFqC
	u96Osimc=
X-Gm-Gg: AfdE7ckNbPyIoUZHo2Sq0ple/Qv41bE45n9iAKCE5bU5jpTSbOsgDe2wSeoTY2GBbdM
	GgEGk6qfS4NLOudeq+UNHmn6dJgUrRHDF55Pl2Nd4xm+N1qgfFuxVMZVeJHH8xSKTOKtSno7VuB
	rjDKvrpLy8bCB8buLn+45DWB7brgSpdbc0EhH9VT9mFIoYM+BUAOUbAJWbX2Pvo9pVlwsogAqYL
	hhHwn5cUtZ6L9HiUgIhMyimrp0Ym8qoUDrevLAPJ7PxzvvvajN1c318Vn9lbXU4OzlBTTARQXeo
	smjmspWGEkJva3BVzLJeSLhyw6HPX9jtauDfU1Kzm4/WfQnQ9mJ5xsSx3eEixL/PToGCOA3/htr
	5ewBQr1va9HzltqxUx/NaAck5Y5hk9v8mRacPKJjL47pCNqL09U+rXX7xfi0+AFfOrSrVpON4pA
	xjuk731E5bRQUer90M4Nk8b3HcNmPKa5/QPVSCOvva8KVYZq0CYEvDAjgUE8inC1paKx6gBCuW/
	sB2FOobYGhz70AxiA==
X-Received: by 2002:a05:600c:8a08:b0:493:eed4:7210 with SMTP id 5b1f17b1804b1-493eed47225mr7159895e9.11.1783591624605;
        Thu, 09 Jul 2026 03:07:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/25] dhcpcd: patch CVE-2026-56114
Date: Thu,  9 Jul 2026 12:06:24 +0200
Message-ID: <6c3c37d54bacce4fa4ff82997f458f99c333e175.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240555

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029

[2] https://security-tracker.debian.org/tracker/CVE-2026-56114

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dhcpcd/dhcpcd_10.0.6.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56114.patch         | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index 65dcbe52ec9..bc87b91503c 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
+           file://CVE-2026-56114.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
new file mode 100644
index 00000000000..748dc1ee8ca
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
@@ -0,0 +1,34 @@
+From fd86ded940524f60174582faa96f583c168589ef Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 02:06:55 +0100
+Subject: [PATCH] DHCPv6: Prefix exclude option can be 17 octets (#671)
+
+Well that's a simple off by one error
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 2f00c7bfc408b6582d331932dfa47829c4819029)
+
+CVE: CVE-2026-56114
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/dhcp6.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dhcp6.c b/src/dhcp6.c
+index 5154bf41..1eac9f23 100644
+--- a/src/dhcp6.c
++++ b/src/dhcp6.c
+@@ -1006,7 +1006,7 @@ dhcp6_makemessage(struct interface *ifp)
+ 
+ 				/* RFC6603 Section 4.2 */
+ 				if (ap->prefix_exclude_len) {
+-					uint8_t exb[16], *ep, u8;
++					uint8_t exb[17], *ep, u8;
+ 					const uint8_t *pp;
+ 
+ 					n = (size_t)((ap->prefix_exclude_len -
+-- 
+2.43.0
+

