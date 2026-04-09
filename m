Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C590F364D3
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:08:36 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.143826.1775772513841193899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 15:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Pv0m2Djr;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488ad135063so12298875e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775772512; x=1776377312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=Pv0m2DjrCL9bN4NpXxR+N8tOCIfyoVA4tgfHGnU22ZE/Tff75G0h4HGf141036C3tF
         X3KkPihs0D5a4SGSOS/dLI4Ty92hm5UXjkibUy4SDoSpY4/SSA9UvEiPB/aom8apf2Cc
         8y7kr0BkMHo9bdY1s+X0PJaeetbYWWPvgt9XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772512; x=1776377312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=QInQhTIO3pyQOel6YDOhTu93LgqtehYqXuLqUltzNjhvqZiSRW2Jxj5fuzaY6XLLoJ
         R2r+tboenJYZbJfAWC6ETClHzLP3xNVBYFm49DrJm4N5HZVojJQS7XvAPBp2pvgRWw75
         vGhs9cCFHL2eblxxmyIWfCZvAGBzL9lKQFdjN/2jgLuEsDwQ/GIQpPC9+NlJo5E+w2eC
         vfJao+rPKDcuhAqMJAVyE7LHYWFXcLDbKetKwxPFqLjBJAV52mWlFUokhtsj59ITgqvb
         l0NbvaxEWljGpCtAnaNJ1SNIXNOfEH6F2xKALg5pmgUz2lAqdFCInh3CNhxWMD7Phw2y
         VMig==
X-Gm-Message-State: AOJu0YxLeB7qeuEuPS30ukHSD63SuW8IZ1SKXo9qnE66uakUfArM+/JQ
	8x7o8vx1+Dd7FuiUIs02xkOP0/CBKoRn+Zs0zjAtUWWJvQpop4D+A2NTbV0RKj3r/iowaf7q/aO
	D48Sr76ROlvSI
X-Gm-Gg: AeBDiesDy6LfnP2/mRjNrIOopLUWxNZxgtoZZmJm09rcDG+aX7a7IirSCoPAyGd2UXw
	koGDkxx9SxRpCxCA8Z53+yPPYqcjwbFQcd5ekdStnyq67xO2vdZ+Zbrf0dlWd4ldtIftB13xSZy
	GUiAZNcmRBRmzSgwVNNQ/BkEcCJRMVSSTHCYs+KpZNf+V7JuqJosT4MeihsjygQ5XQ2+hQ6YMuU
	D+2bVDKwQsrdUjZub27Yjy3gHMZ1/8xex6NA0UY/hYv2tGc2ZiYud7w9DnIxxG0z67TwxRkdKIs
	VTnOHKl6mkLPsbQ2U0oKXP173BGIbhKQC82ed5up3BRpiHMzLW3NngrUgUUDmfFMss3jqkKNUjT
	CoiQvRL/Vj3r+rugTgdQhbXoxOEiWGT6D7aHLnjYUUwLuogBgdcSNRM88aVlH96nxSJRntbKlbP
	yeRS0d9zIzmwn63tBkyshptjezG0UrX8rddtMPzQe/C5HpMgTXLXp+3PW2w7iBwCItN+Vtyr/Dk
	p2otOBdmocfNmWbH/UDHwk3RPfWTd3eAoNXXA==
X-Received: by 2002:a05:600c:8b27:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-488d687664emr5214845e9.17.1775772511976;
        Thu, 09 Apr 2026 15:08:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58bb830sm22123045e9.7.2026.04.09.15.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 15:08:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [kirkstone][PATCH v2 4/6] scripts: Default to https git protocol for YP/OE repos
Date: Fri, 10 Apr 2026 00:08:17 +0200
Message-ID: <20260409220819.2427583-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409220819.2427583-1-yoann.congal@smile.fr>
References: <20260409220819.2427583-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 22:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234956

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/combo-layer.conf.example | 4 ++--
 scripts/contrib/patchtest.sh     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 90e2b58723b..4ae3db45ab1 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -14,7 +14,7 @@ signoff = False
 
 # mandatory options
 # git upstream uri
-src_uri = git://git.openembedded.org/bitbake
+src_uri = https://git.openembedded.org/bitbake
 
 # the directory to clone the component repo
 local_repo_dir = /home/kyu3/src/test/bitbake
@@ -76,7 +76,7 @@ last_revision =
 # that matches the original commit.
 
 [oe-core]
-src_uri = git://git.openembedded.org/openembedded-core
+src_uri = https://git.openembedded.org/openembedded-core
 local_repo_dir = /home/kyu3/src/test/oecore
 dest_dir = .
 last_revision =
diff --git a/scripts/contrib/patchtest.sh b/scripts/contrib/patchtest.sh
index b1e1ea334b9..550b6a88f3c 100755
--- a/scripts/contrib/patchtest.sh
+++ b/scripts/contrib/patchtest.sh
@@ -75,8 +75,8 @@ source $PTENV/bin/activate
 cd $PTENV
 
 # clone or pull
-clone git://git.yoctoproject.org/patchtest $PT
-clone git://git.yoctoproject.org/patchtest-oe $PTOE
+clone https://git.yoctoproject.org/patchtest $PT
+clone https://git.yoctoproject.org/patchtest-oe $PTOE
 
 # install requirements
 pip install -r $PT/requirements.txt --quiet

