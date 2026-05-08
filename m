Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063B9CD37B1
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:29 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8163.1778224343666869526
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b5IYiOkN;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so1462408f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224342; x=1778829142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuEV+8iSZSk45TKEfXjhdt8zShUz7in945gYyXVOeaw=;
        b=b5IYiOkN2iTAtYY2UET+c/ycXbBKbSwYFlqlwIxyTXrpdbFDv1W2/N4MaLhoBO+8Xh
         i3vK8OxbH7sN6Jzb0ELRQHJA1Hgbjfe8nsSsBEav5AsSoTou6uoP+RZqSk2ILXqDvF70
         fs10Lxfv/o8lUkqw9LafxATOee0k8iyF14PvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224342; x=1778829142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DuEV+8iSZSk45TKEfXjhdt8zShUz7in945gYyXVOeaw=;
        b=eAwpb8qY6lx0oeRLI/andVPtU7okgEcGJ5QVa08memqhrqB+OvjkrRGQ//c+dAyJbK
         gUh/8tpegPygjxK1SY9v3fs059L1wE4bGgsmApyFCyIqkE7kRPd/vpscRK1kWZo0eyvw
         vyxP8JgSVoZkQUJVB3wPcJ6islDmRtl6/R97cHDDWqsWS+irhJmR217j1co5Eqgk7XD4
         XcxqWDLuwg9PdBR2cRJadCHrJ5ymEzXOOzmkCiqKZ5soumGu7CZj28Gp6Q9DQQhql2dI
         b9GuxImz60b968BGa/f73vJLJQqn1Fjat7JY6qYjLYDxBJb0UK1IDH/i7nDWAvyYrmB3
         gQRw==
X-Gm-Message-State: AOJu0Yxc/CUs6u2Bhb1KkwpH2oa8RDJZko9fJg14ObcXpKQN0TOotmpe
	ehmRc0Cz1FvIhciEz4N8fxMvuhi124fY4vzL5o5eMMf/CD6XX3QzxLjdH0ETYHzaPLXkXoyOc9v
	0IY13d4k=
X-Gm-Gg: Acq92OHhg+CMUhZKaxnxNaiuu2A8iADikF2/zUkPGuaFODtXDKlQRpa5OaDGulUlHSO
	S/ZnQMBURDh/YNvhxSqRtRn9pqrd1Ac9syAGpcv0Tx0nGjxJfDPijScfHzPu6AZz9uQieiFqCKP
	ytOWheiiW+SJ10s0HGlOzZ4OOhJQa8fbuPaB3kfd3RBDg0hlwmALfAjDAMWHT+1wRl+GQAsY5GE
	tkksjK3vw56qhklaXF0kkGq9hULF51jcJ5v5Qnk9Vhbg45r6t0Fa5dwCRK5RJl+cEZ1btoPYaue
	xMYVeTnjCmpqGHPq6zhD1+D0qUvUcbI6SizI+ZSVguAcczBrgkSzdVdoB26SY2hX/NG2dyfQPuA
	OkiD3Pytf6Nq1vpDoMMDoZMMp5yJ7/rg8KbHUzLXboGDrfLTqlViciCS7UbV6Q0t4dwigwj55Yl
	ddnuPrQ+4LhuOwMYqzohXGHwX4AR+2C8Da/Wh9eF9wzo14qwkLWMTm4LC5Fi8lSVuWJQlAZgAqI
	gGBE0nnTZ74kv7vmnbKEV2CzmCXj6AVUjHbiQ==
X-Received: by 2002:a05:6000:2211:b0:43d:77e1:6a69 with SMTP id ffacd0b85a97d-4515d9a0330mr17864891f8f.38.1778224341647;
        Fri, 08 May 2026 00:12:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/52] cargo: set CVE_PRODUCT
Date: Fri,  8 May 2026 09:11:09 +0200
Message-ID: <9747553fc34826f4a40f03ba329a856c48258e75.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236658

From: Peter Marko <peter.marko@siemens.com>

This removes mediawiki:cargo CVEs from CVE metrics.
* CVE-2026-39837, CVE-2026-39839, CVE-2026-39840, CVE-2026-39841

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5cb71e7df95925a5c342c341e699e244b1b84f6)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rust/cargo_1.94.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo_1.94.1.bb b/meta/recipes-devtools/rust/cargo_1.94.1.bb
index 36ec3461135..f16688fc762 100644
--- a/meta/recipes-devtools/rust/cargo_1.94.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.94.1.bb
@@ -17,6 +17,8 @@ require rust-snapshot.inc
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
+CVE_PRODUCT = "rust-lang:cargo"
+
 inherit cargo pkgconfig
 
 DEBUG_PREFIX_MAP += "-ffile-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"

