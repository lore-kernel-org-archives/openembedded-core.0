Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE46F357D3
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21683.1771943590316227809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=slm3YEqv;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806bf39419so49255935e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943588; x=1772548388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Fg55gEiTJ/sGs2zhR5CQ7Kx0qC0plXmW94Cv3oC1aU=;
        b=slm3YEqvTVz4800ry0tGu4aHdgTohpv4PUelwi3B3Oqhmd7oW907UTffYa/JqG0gtD
         S/BXFSyZepzo8uiPlwBhX4XKyAa+10Gn1g9l22d8tF+YyiAWeq8hVPtQw2SIuNHaICYf
         1bMUYI0zUfmaNl0e0t34wUu/1HXS+1eAfP/Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943588; x=1772548388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Fg55gEiTJ/sGs2zhR5CQ7Kx0qC0plXmW94Cv3oC1aU=;
        b=SSBtVY7QKNwqMY5RYToSyCx8Y2rCfdbvAUGhGIbpfsS5bId/4dlBK62F4j5OrswHT6
         RTiZAM+2jYi5FiPMkcjpU1WE9ab1IU4+BOvPd+g7orBhjfgESsoswReUT2CG5W1IElqo
         jCBchGfAQ6eg99K86KN1ZXzOwENjscO0UFtUX7Vf1Scz+qSQdW2dTyMkp0RFsXkx1W3s
         oYgdY3N9ZnH4aQ/Qc7vJQ7Ts9+vBwX0/L1TVeg7lZ+yunXtyFymFEY1p4BKkaVNK0YK+
         GsuxMmNsDbDyyaoth/YX8XdVwvWRghOXTvloZ/HKAlFcrlak2JoZhPkPysFPbP1UZaSp
         7U9Q==
X-Gm-Message-State: AOJu0YzLD3AHLisbCRkMOmJ2KG3f3SePU098Z91T/0Q1zRJatTXFjpdF
	hQ+WBMeWmE7puj2i9KC/S13sFdmSs8WbgTr+u9NKmlGXTyv4FWPCEaOVumfTiz0ZAfhGgF1Mx3g
	8xVD+
X-Gm-Gg: AZuq6aKNYWbEVugTEiTfR0XtfZLS55lj4U1houf57x3hmIRuSNn4oAf6rfhoqKpiF8i
	81loMoV4bYXXojgwd6HFLsIaIcwgO0Mo2+cnESYCE//3kkuUaaIyZg4KNVoZFzAKzrk5iS+Dkpa
	4f164IMzhoJ091dXTNBLPB+Sdac00Bhkm5GouWx1og9CwWO5JbT/Dha68eFAXMtQvg7K903vLoh
	bqKPCyeKoeVA7yYufFw1oTxDnHKXhDBAwtKcVxVbDqdk0fWFfA//Gs9K1kqE/JJ+N1LmaHKky46
	+sNubvG99b+/UIxGRwg5ljT21EwPy9NUVSQz5t/hL42HR4rl+TxSOiOeeD6XfcrZTYbQuGBaLuU
	Ej7x8yLCSH9GfFyTdKPZbKZGTImaSmBFAN1WCc1atis3iIbP2gwwgflsKmrjhM/muV14ihoNtWf
	OaITfeCwsyj6p2kFnoD1RGqflCZjK8+p+jxVEyHeWLQV1Rk9HKLckLgrUaP5ITlCkqxL/PIgOMQ
	d48ShVTR7BpCLmM2AyBsUROiQrRdTFWsw==
X-Received: by 2002:a05:600c:530d:b0:483:78e7:ce15 with SMTP id 5b1f17b1804b1-483bd76b9e1mr2128505e9.13.1771943588405;
        Tue, 24 Feb 2026 06:33:08 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/44] bind: Upgrade 9.18.41 -> 9.18.44
Date: Tue, 24 Feb 2026 15:31:55 +0100
Message-ID: <9a57aa1e4fc56a3f4a703e82ba28bbe208a48927.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231834

From: Vijay Anusuri <vanusuri@mvista.com>

This upgrade fixes CVE-2025-13878

Changelog
==========
https://downloads.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../bind/{bind_9.18.41.bb => bind_9.18.44.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.41.bb => bind_9.18.44.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.41.bb b/meta/recipes-connectivity/bind/bind_9.18.44.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.41.bb
rename to meta/recipes-connectivity/bind/bind_9.18.44.bb
index a83ec29bb47..d424edcb4e2 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.41.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.44.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d"
+SRC_URI[sha256sum] = "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

