Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D6AC4450B
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:51 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14793.1783866582321478175
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=SpnP/cS9;
 spf=pass (domain: underview.tech, ip: 209.85.128.173, mailfrom: vince@underview.tech)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-80a1fb0c683so29854277b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866581; x=1784471381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xVxz9GtVTGTsjVvp9X2ONZJt1qKJzxvkBLiP1Pzf0E=;
        b=SpnP/cS9mRTKuq54p3umtfg/0AJ2NXyKVYPMHWveTLEIakQ0v88fWj8IJweVrcWIxX
         fE384O8Pvd/d7HldmeS/zBypne36XqNkzgPq2O8FheS8UaO6y57Ys2/euM2rUSGC3bTZ
         aQcHMufkjf9gsSy2OAOUUtFAvedmlvqVeBMChKHaKRP5/ujFP09jMTd2cb4qvbh9liks
         /g0e8VhHEwXZHRdBOQlrh38+bAcVo6noPWvbyad5ufFQKiK+rgue4BH/dGFpmPsesd/y
         b8JmBqDPOI+/aVJUfvFfeYjL6pejlxWK7laKSr7DEEs6GE/29TBAQOUJbmHpG2Ex2QE/
         wmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866581; x=1784471381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xVxz9GtVTGTsjVvp9X2ONZJt1qKJzxvkBLiP1Pzf0E=;
        b=kfUatY3v5rm8ByIGNyyp9FD2ysw+aOQYW2dveiQzoqGatg4+/0KWKxeRXWEbeVeVU+
         wI+fo1ChlaoBIJ7IclCkJRRgJW0W3gHUWh/6iWNdLXRHO58NZn4vOY/cp/eDUXO66LLO
         zzZTGfk4drFhtslS+Ii6Vxblca3SGOwj4/GTJFi0AelnBLMzdUU9wOFteZ8OTkAxw0SD
         CB5KUCw8GzEYEsaacZxcbuzSa9zP21y2z1eAE88YSREXZEjHuJV9pjjqS/dbbIz4KCVj
         h4MZIt5B70Uj3I3eXz5f3CVkgEZSFj+1piBlA0nSinMPTMbT8waizY+ode0CSuBj5zvD
         jhpg==
X-Gm-Message-State: AOJu0YzdXKzucj8HntVYRKBeftoq7Dh++P4T6m2NB5wtiD+qARF7DJOb
	z1CFUkRecBf1IuICTfC77TdmSBWdRMZ5Cuc2PY+/8xuGI9BVFfpiDOHXv++Mmn4zrzs/77hHl+w
	r2RQN6ow=
X-Gm-Gg: AfdE7cnoPTXLRcqefiIXxAzRO67+6yAPxNWGPLsVtkKtGWKwak5yMcea7Y86rjpBrw+
	y8ts4z7ixgVeQVz29bw7Ed33De7YXnkP1EOZmNcVztwhhB3vygIrLgwBXZq7AulS64qqUkuXemZ
	bvlebfxYTUptD9yDRmzaSvZNO03T8wZZ7fdqiHUf5eQSzejCtJdUHus3b1+EpYekdAY7YNHLfhC
	TlCZtspcdtoyHTIYnYmMn+ftI78AKj0Ch90Hh/jmZzWOa0svVJNZYf095pxXxPRh+C4CrTEk6YA
	OpeSvjqrcnP7sVugzT99XPTM84kc1ht/fjIL7Qw9EH8hFYHZMm/tedzxe4iRE4ZRaOK54wXVolE
	INeiHl3J+CgEwnbGK45pCjNfJqt5yelLReytHLX7xc679Exo0zOPRHHiuf6ngzDN4ETRkfSxnit
	0M27E3t8FmWGTFLw==
X-Received: by 2002:a05:690c:688e:b0:80c:6dd5:21c3 with SMTP id 00721157ae682-81e9001a320mr42693757b3.24.1783866581342;
        Sun, 12 Jul 2026 07:29:41 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:40 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 19/24] efivar: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:11 -0400
Message-ID: <20260712142916.2573370-19-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240785

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-bsp/efivar/efivar_39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar/efivar_39.bb
index e5839f7a99..b15279239d 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -28,6 +28,6 @@ do_install() {
 
 BBCLASSEXTEND = "native"
 
-RRECOMMENDS:${PN}:class-target = "kernel-module-efivarfs"
+RRECOMMENDS:${PN}:class-target = "${KERNEL_PACKAGE_NAME}-module-efivarfs"
 
 CLEANBROKEN = "1"
-- 
2.43.0


