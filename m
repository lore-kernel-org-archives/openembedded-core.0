Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55184F8DFC1
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:09:06 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26353.1776373740033659855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zt9K4FOU;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so82655165e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776373738; x=1776978538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnjigDy8gTAPulvgg/2Tm4n2vbKDeFo61qma0W977/s=;
        b=zt9K4FOUBWitm6d0/4BjlOYteZCcGP/XiBXP9b40+mNm6lggc94zF4YoyAgDbRCTJ9
         dcqdPLKF5fzgTv3Tb07N9RofgPYditnC99HJ2UyqnbdLz/C5/cSiQGAB5T4WHUABRx+s
         QoGxrOkOMjT9IyVrKIyE54BPMI4avqIAIb3So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373738; x=1776978538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FnjigDy8gTAPulvgg/2Tm4n2vbKDeFo61qma0W977/s=;
        b=jAWZkN3CFZuFFz2XTGFGvzAwO+55eJtpznEPtMi38ZbBcJsrpXNYaUDBBLwZfgE3Zt
         9+RKrrnxvNEFj+3SOmPbaIGqcYi7P/ufRLbXmjvBUSNLiew7tWW0ASrbE8xd7x/6w/DX
         KEm+hXd2twQwpp71l1vi95k/Zj+iaDzuJmj6NGEJ6FJq3woGx+Jc4Xx2qGm3bIkuxvTD
         uYIKYbjdOpYszRK0D1gaw41ArxjmvnaxiBSd9dMow1QNiy2wbnqJbDpcDzUnHhJC8/ov
         7Lzzp3MTE2zOJkIgjx4OTJXaBKeuB4f3Zigl3H0j+v+IsIO2uLiXnv793XsYUDooBptj
         4b5A==
X-Gm-Message-State: AOJu0YxEaAQkPjer5COMKl06+RcZvrHtOGoPPZZEe7u58GhE1uAhC9/g
	SthHMVWcP1J3EfiLEhklzobJhmXPWXCXVVvTGGGmBAEoR+RF553LkxhlQsEjWOGyVcCnMGkHljh
	pDPO5Aq5LapuJ
X-Gm-Gg: AeBDieuPHsEVhwfSypmhjIIX7Svyjplvt0Ezbv96KP6k6lR9gY2c3OyLUqEhJDHHgjW
	y2bxli7DqwPaNbpeDNmKH2c5Hep7yFLBBpKyFJEs83v/71NzhiyDGRm/955ZRaxAaV11kbx2O/4
	6+zohBZYSpqcyU9TiiMbo7dPMbZs/6iZ2pjQnRTdteI4E1axZu5NRCx0e4irMmEPzyG/nxdYg73
	OOvpvnnqYqnVytbzFWZZOlGTqa0FS6xjylPuu5Wug2nTGo9Zo73g6Fqrf9cqvLOm3aqgEC5KPrE
	DyDmmb8BJ/K8zYzR1RN7quSEkBUlJW/DPHMiZZeMCxbaVyTk/qWY5n6Y8SI898soxvXKVBpzsdl
	DkStgOYX1s5Rgbd29mlE7wL58vYZPJlKaxPtoIQ73IJsLcpZ9O4HUVIHgQlOJIYirw0JeAgTlAr
	MjTVzga3aY1s21OvZW0MhYYgwf65hCAUhLJtJpllIthYMYXNDl5Vom+GpeC8N2L/RGtej/MS8O4
	9CqXVujKHquy+x1JYsL1VsCILSdmBx3GTvtK/jaVmMthMSu
X-Received: by 2002:a05:600d:1c:b0:488:ba5f:984f with SMTP id 5b1f17b1804b1-488fb746d8amr2088665e9.6.1776373738170;
        Thu, 16 Apr 2026 14:08:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7c2167sm944985e9.36.2026.04.16.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:08:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 7/8] meta/files/layers.example.json: switch to https clone URIs
Date: Thu, 16 Apr 2026 23:04:00 +0200
Message-ID: <20260416210836.1336162-8-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416210836.1336162-1-yoann.congal@smile.fr>
References: <20260416210836.1336162-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 21:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235425

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/files/layers.example.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
index d9905022055..77e02c72d55 100644
--- a/meta/files/layers.example.json
+++ b/meta/files/layers.example.json
@@ -14,7 +14,7 @@
             "git-remote": {
                 "branch": "master",
                 "describe": "15.0-hardknott-3.3-310-g0a96edae",
-                "uri": "git://git.yoctoproject.org/meta-intel",
+                "uri": "https://git.yoctoproject.org/meta-intel",
                 "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
             }
         },
@@ -24,7 +24,7 @@
                 "describe": "4.1_M1-374-g9dda719b2a",
                 "remotes": {
                     "origin": {
-                        "uri": "git://git.yoctoproject.org/poky"
+                        "uri": "https://git.yoctoproject.org/poky"
                     },
                     "poky-contrib": {
                         "uri": "ssh://git@push.yoctoproject.org/poky-contrib"

