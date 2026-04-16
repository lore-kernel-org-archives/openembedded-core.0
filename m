Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC2BF88084
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7734.1776322129057035013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SHCxNCp3;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so7716553f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322127; x=1776926927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=SHCxNCp3JvmV7nOaERxDifGDLcznS+aDscAELjUOrGv/efck7KR/Df0mqGbhNX1IJH
         HYQTQNcqWN/58LaajfeeCiD7lLl8tGWVPDprK+KAZIphH+O9Jzw1/kDjzyJNXXTe1YHi
         glowshzbz/oMBQNcWp0CkwGb5DhgymQHa3rW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322127; x=1776926927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=B7QFQtAa24zHWe4zgyU5gR88vbqWoLdEFUf7Wj7ZXVLuqqqeKpqUtA0lXxg8dRZ++F
         /uXI3K7/eMCb/tpDFuzGhRaAJc460tISfJ9yegVCbmfUZhYznWyYYU1iZxPRmKy7Sg08
         Uf1SudJq2SSh6ydD24WJ1rHkPzOI+DT65tMHPOvIaHP5dpjvAirMruOAAmzcGDhLv0rY
         hrPL41g9XvnS2TagFclhFwWpf2iruQ0Qt4J01qto90p7bMxFxfDXSm177zuAG723wyQr
         zAJq0l5a3EvuBZKNNLgLTPMci1ln/YUdwxJ1c+ZGJ/IiHaEdcrBPIjiVBqTenLC22UFx
         MKNw==
X-Gm-Message-State: AOJu0Yz+22aWlzOK6jFLeP87LnzQqsB4Xl0R6YYp50F68ghAx2qtE6xI
	o+LBN8Z/WnPf0faVup7ipwLEnlWGOyLFvW/pPAWULz3cQBpQlo6F5m5h6PdKgZLSkoPLr48HVFU
	E11xyKa/eCFBP
X-Gm-Gg: AeBDiesARhkIMe9/fmyo8t42hjRWUFufW7d6RxDqgohR0BjQRRcTh6pwK9+dUIuP+tq
	vm3gxs9JtAZtiFpunbRvfmMKnNqOuSioM7V8WRKsKOsUgdKJPJ4751Hm03Wypnyvigr5Wp91w5a
	8urZjpO02bT/pGl1JhFQOZOrwtBpPvaerrjy8oe0e2Gl5biGMwzZvawTn4RkWLCBooG4o9jsQgW
	OMQ1wWAC8Lnf8R7JwuaPHdN98TLlU+7QYhh9XHTTDEuRL2ZoVgFyEouj6RxNGumHpVVvWNKFPvq
	cNublLCIDXiKvyRb0832dtBB5nPkl5FPiqD7sH9Wly2xzc/EcdkNjnJQXa5xoPZmzIUekbPHL79
	O1O2WaW0LgkvThO771mW+GR6laMYHT3UZKMEo3zfjejxCkEvCl7XRoGkzd3phESJ5qfraPVSH0l
	ShvaHhksINZXB8oH5x/hfvFZf8IJ9qF7MHSC9GYAvwqO6GT6YNmhQk0F+hKtGd8oTml4xAsjlQ6
	ajCyH0sVrjImA5ghRsEBkAWoshaINat2SfVfg==
X-Received: by 2002:a05:6000:2886:b0:43b:7ff5:fdf7 with SMTP id ffacd0b85a97d-43d642c8664mr35771972f8f.29.1776322127012;
        Wed, 15 Apr 2026 23:48:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 43/47] scripts: Default to https git protocol for YP/OE repos
Date: Thu, 16 Apr 2026 08:47:44 +0200
Message-ID: <95cf84a4ea77c4a8af2cf814857f50c8a3508c1e.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235385

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

