Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAC5C54F5C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43752.1785192981849824923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=g2780X+h;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so31573495e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192980; x=1785797780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QKaHyEuykbAmzrVBoggjcul0Xxjx58+VPkjTgonvpQ8=;
        b=g2780X+hh2u2TpPTC95iko+3eOstezb+d83RMQrjVlFdqwFyBMJJNxvSatACopvV1m
         tzLvwwk8SlDQDZFASHOfH2e0ublUW64YzLNU+eJI1uTIti8KCNgXVmL2BxMKkYBaJejR
         8D4n2/n+7yz7PEhNNhf8rGcTMXrct18mQBV2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192980; x=1785797780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QKaHyEuykbAmzrVBoggjcul0Xxjx58+VPkjTgonvpQ8=;
        b=kIb9Lj3s8R96/1bRh+q0puKTVxvmS2DLBwv8ZgZhNny7GiPrXTMX6sGMtsY7D9ilmh
         tLfm/9MLi9XYLP6naoA5jwWMYE1Sa22qN/vX6HO/VT690Weo0RK4AIxWIX1DfzqaSW9r
         w8sGWc3oYABaR9r1rytNHlhiDSUjb5hTuHF5TwuE7I937rxgNM2fvp2CqXeEBU8X1dYN
         0BF55yNvpSgLSTgeVRiCUGtIVKnkG/8I5jZ6Fd46WzWmIxCN1qxhHZhJQ1BnBQU0Vdq5
         YOz5XkhAXik/yT6ssxtkyu0EFJM12OGHuzigkM9nr/DI68p2pOOv3fX5AkNL/3yOzycc
         SRSQ==
X-Gm-Message-State: AOJu0Yy4IU3b9P/mryEYzpYXmxsMMK7stJlm1Cp4xgga2nWu+7UHVPAS
	+ukV17cOYlC0faH6nWxr9+irc7fUfCyE7HLXmL8IclwciavUUgHvsAsuDLi81ed6WN91oKD5QkG
	Y7+05Wkk=
X-Gm-Gg: AR+sD10nEeAB2epZ0B5kWtPX+wzdGFJ1WVfAARzfBxAACVF0gAnJ7gqmh4aeQKkSG2h
	XC3TTOpsCJ0u4vtx4vte0yMWhtpEnNe7H19UZEWJZWxE9NHyeFzmigIEFsFUQhgAaJxleFFCbZu
	YERTmj7ViNAcbmf2A0XyQylspzUOGx513eQvuxfH06QP2pBhMeRiXEDo5+e3xWCAeQ1bV/StcEf
	XDpSMTsr2hx5Eb0gygo9fpjXqf2NWHcrL4hey4u3bR+mK0QzPPkJ/Qtyen7s14kNbVk3KQQ5Utf
	4rtcOfKhnlKIrmrM2QKyH7T1Ags2Si7Ik3zjcvbryUJcM9zxTT7DMSP7Ik0azA8MxwDpE2v9gCe
	yUkysm6ujdEI0qE6U3odq73xljnsK+F78o0Qb1pEKZWLqKXlfqe8z+wTpSto6U5fhrJQL8ytiWf
	3vAYieCG0phoEbyeZ3Q0rgS9L0cMl/c2KzwrbCPF/yKWIaTRr0riq8zg24zD2GR9Fj4xL6cqjYb
	Tdj8Q==
X-Received: by 2002:a05:600c:45d5:b0:493:df1d:7488 with SMTP id 5b1f17b1804b1-496b56d51aemr122956965e9.16.1785192980075;
        Mon, 27 Jul 2026 15:56:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/36] libpng: set status for CVE-2026-40930
Date: Tue, 28 Jul 2026 00:55:27 +0200
Message-ID: <6d16a4aac261162704f5d5974081d061fe1cf630.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242121

From: Peter Marko <peter.marko@siemens.com>

Per [1]:
* The vulnerable code originates from the third-party libpng-apng patch,
which adds APNG support to libpng 1.6.x.
* Upstream libpng 1.6.x (without the apng patch) is not affected.

As Yocto never included libpng-apng patch, we can ignore this CVE.

[1] https://github.com/pnggroup/libpng/security/advisories/GHSA-c4v6-gxrq-6g2x

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8a4758455a2534050ee4b5cedcfdf86da9f243c2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/libpng/libpng_1.6.56.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb b/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
index 9dbd0d26e06..9a85d44f52b 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
@@ -72,3 +72,5 @@ do_install_ptest() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-40930] = "cpe-incorrect: Yocto never included affected libpng-apng patch"

