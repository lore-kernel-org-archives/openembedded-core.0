Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1380CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 17:15:54 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14989.1763399745156616156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 09:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mBf1+0iG;
 spf=pass (domain: smile.fr, ip: 209.85.208.177, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a875e3418so32904561fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 09:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763399743; x=1764004543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2rGx/BiaO0xDahFe43paB74yHkGHzHB+GY+2kLWx64=;
        b=mBf1+0iGK/hjtT5bEcJrh3o2uV9qS4qcpLGnB95yE8OY0UIpXCYCM2cpmoBs7Icr7+
         grwqYeBkWbbKfgEA5e86z56OdXqmfZRDOLAjfi9VGkf+I5fFAjo2cISPpJFvatqxWGkD
         qzQ+IzFmCJInm32fElHP7dS9873YiW+AO2bbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763399743; x=1764004543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o2rGx/BiaO0xDahFe43paB74yHkGHzHB+GY+2kLWx64=;
        b=Mx60j8vkKURj+a4uaXdUX6gPePG3HqATJ/aFaGaqssWMEuTPO4YkEHfsBGCwQ8wk3f
         N48+PuIN336m0qT0iA82jNc1MF/BA+04R/DRn6BPb/tX+rF6DzFnEE+04N/qkDF+ec+u
         MVXquJTtyRNkbgXmpUklgIBnJGhMSPVA0Lt4XtxFuy7KF3wYMdo83PpYIgVtqxoe2Hi6
         WiHJR732bINBjsQN5192FgavV+K5ebL9SzBPHnKEJ86erNq2op1bbEw4iyDQ27Emjx79
         qy4wSy71JP0mbFSXL9uUSz//ZbNIQvJ2kIjpiQaGyjfXWqYPfl0hqSbNqbMesxubIfTH
         ibzw==
X-Gm-Message-State: AOJu0YzKXZ9cP66yR3TCHSlaUN8TgogFhoVkUvwM8BK5At1ER5EASZ32
	I8H6F5DUSZ/qyIdQuP8y1mbNFdKP1uTOEBo8NniKQZkxgJ3NIOH2zzTiNArVMFzxBZfFnmG53nb
	51wn4UlwWWQ==
X-Gm-Gg: ASbGncvXe+IqvXJJ5q2M9Q04GVnvyJia8PuaWLjvA9DCtiyPWShaKjDoyy6teG7QICn
	lKXFL5/Xiho6vHctPcf0rAW1ser6dLVNkoYVfq9YMtf1urLENh5kD8YJA8ZcsGkZJ9QQg694U5R
	e4kOfe830mPVgLEIFlUTeXGKvCMsaV4dqdy48jAidzrXLrADLtjanYCySTxKJbSR6Z8q52ImjnI
	O59ju4q6TB1D+EmZfc8Gn87/ut31sL9DqPgxfVhRu/pdf8I6ou2lYy0phNI28QZfeC24h1rlGTi
	bInif0TaxiUUrsx6t6DIDx+h3bbRLw3PRUOUvpj/zWS1H5BQK45gfnLMRUUixHVSjU1tIWcSyo7
	Lp/3ogxu2naEdxwI+UVmsGjioIqEcnNJ00E8GVHiav3M8qBKwKPQmgNMx0t0ZvjVMaYaaYhDIZv
	W5CYzTTrE9qvI3Z8J0j8ODpBj3DT/Ghsrh0TNHIPQqaw==
X-Google-Smtp-Source: AGHT+IHpVx911SQYZAG1EXcYiRgV5VJG9VpyVCYSu/z6Blbu+metTp/lDU003vMjy/95ATYrYPZF3Q==
X-Received: by 2002:a2e:80d9:0:b0:37a:2bc5:9d7d with SMTP id 38308e7fff4ca-37babd6f929mr35957091fa.32.1763399743146;
        Mon, 17 Nov 2025 09:15:43 -0800 (PST)
Received: from heaven.lan ([2001:861:3080:b0f0:8ab:bf5a:da73:c932])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce25408sm28748101fa.20.2025.11.17.09.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:15:42 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v2 2/2] layer.conf: enable test for revision alongside a git URI
Date: Mon, 17 Nov 2025 18:12:24 +0100
Message-ID: <20251117171223.919666-3-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251117171223.919666-1-corentin.guillevic@smile.fr>
References: <20251117171223.919666-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 17:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226505

As meta is the main layer, its recipes should fully comply with revisions
for git URIs. Enable the check for this layer only.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index ba25ca3029..1f95867165 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -19,6 +19,9 @@ BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 # Set a variable to get to the top of the metadata location
 COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 
+# Raise an error if no revision is provided with a git URI
+ERROR_QA:append:layer-core = " missing-srcrev"
+
 # opkg-utils is for update-alternatives :(
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
-- 
2.49.0


