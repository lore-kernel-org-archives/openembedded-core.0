Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18FAC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.4771.1741809398198200390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jJ+kIGOK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22403cbb47fso5183585ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809397; x=1742414197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipvEK2pxxK2Ysg2Jejg/pXVtvwxTSI0VAU8MeamhKto=;
        b=jJ+kIGOKHT0RGL4ZKdCYcnWAf4CMheh0TEde9UC6rrMBtDGrn5achMc3KdLDZIj9zB
         aE9nuCO4YMnpjZAhUXurxN5nNVcOSg7PpUztCh67LNPBx258cpMdr6USfzjZvLqCOWq7
         xF8LSCnpWWmHnzoA85775t3xP4duh1PFlFvx4K8ZPEskJuXOllJ4qlfdKlD6g3pfIbc2
         oaKPGwIk7tlB30dEspcJ5GRWTJitqEYFo1hJfHofToxCAveNU+pn4E32PzfhXYWyC4qO
         VoDcww7KqHNX+OuiXe8tbjECjiWHKEiCX84+/DIuLBeSMFOF+ZRp3KqnXkACi28AwajQ
         +KnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809397; x=1742414197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipvEK2pxxK2Ysg2Jejg/pXVtvwxTSI0VAU8MeamhKto=;
        b=SXBkmcaB4NUapzzY/Uk5sFdph8qFFgE7dIvhNX/dWhsXPQ2+ZcD4SUOk3CLPtjlP3s
         YiNyyuvgUOeOSrfUORxsm7ySlr9gxVI8kVR0eEDYKkTAChToKvAIHIEi4WErZxyYSgOj
         mCR3bvSolbkFWAuZFmNhMxaHB8iVT3xH2yz3HXp2LsrFcTUWxrT2JWUCi7p1dBxHgixX
         IUTSD/5iMihAMTr2J41bxmJ+I2wpsStDnabozZ4D0dANOJPrFH9q+s4+VXue5hUMVLN0
         a8ZaavuX/YkT5ktRzmPbeTbH26MgsLgYqHjsmRCOx8jyjtKn4D9HoKMr8twJYjh+1XI5
         1YLg==
X-Gm-Message-State: AOJu0Yxlfl0Nbc2xzl1/KCAmEBwt0JT2vAwL72NkvNNHd5799Hs91D/8
	tUWnk8ZN65fpI4yFjRQ0WObIzc2TNxyZ/DecR8EGjAU2MFS77pbyQyIsck6oPjSuXZ7r+u/JiY/
	C
X-Gm-Gg: ASbGncvQt91klnFS6uxr3YucAKzhOpeDgYbG6Xn65RDrQaD2XRqkwyoh/ugrWih/qmG
	wgb+aMsVRJdDKCRBMZkPBniAKgmOgMreFrqpCm+gIUB54o09JKEeB/qYlZX7Uce7YrYHDlOQI2r
	/IWy+fH+l4NIUqp7gzXLHku8Lk0HhjXeftLi7Xu5IWceX6F8h65ZUTt/eRCdEJvfAhqRGcLREI1
	GXy0eFpbMWx+PCvMEmuhdvqkqZPIOjAZsIbneVpChn2+mTkoYIFo4oVCJnEwsTYEPJJ64jCvWwb
	vCFM9bQZ4H2WQ9gopJwtEayq7kLMHgK/UonWmuckqL+QZg==
X-Google-Smtp-Source: AGHT+IG3Iu1L+//Hv0Sl5j1NcWczhBEloY0ViZssvhveCgsXe8eaeY1J0AkhkU3GVre9zGOUWnUzbw==
X-Received: by 2002:a05:6a21:4cc2:b0:1f5:8220:7452 with SMTP id adf61e73a8af0-1f582207511mr18998294637.24.1741809397474;
        Wed, 12 Mar 2025 12:56:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/28] babeltrace: extend to nativesdk
Date: Wed, 12 Mar 2025 12:55:48 -0700
Message-ID: <b422b4d3c04fb04fddb22da82aa91c39f1b54b2a.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212721

From: Changqing Li <changqing.li@windriver.com>

This allows anyone using the SDK to be able to analyze the logs
collected on target

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.5.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
index f4d9b5e42a..2585747fb6 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
@@ -96,3 +96,5 @@ do_install_ptest () {
 	sed -i 's:^BTBIN.*:BTBIN=/usr/bin/babeltrace:' ${f}
     done
 }
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.43.0


