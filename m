Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8490E69196
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87668.1766434087248964090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ADTXif5y;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b81ec3701so6322405a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434085; x=1767038885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUt8Z+Mp7ITm1tO+ZAjmqsH1QoNzU9GiAdB8I7mmysU=;
        b=ADTXif5yk9TQyT1sQDpdQB6+4SNYO0jv0AiU4e168pQqYGTxw1+OvEhCeRhxWaWAAU
         R0yr4/jktJt+Hj2Zu1oJm6s55celM+8CsO6AIb+LBz9dgDNywgOini0/iTE+Vd1dDcIV
         WseVcszwMRdM0UeyhohSskMDQActrqDJ09fOPZYeF6XM7pRRqRIEdKePIqD/4+CH655A
         prZ9zZ4k8C3bxAH8Xa74rq97kBANXOI0c5YmNLgdr+/gKcz/hrPvNwxserCQoDH+L+ip
         9mJcVaNdyH8RikHjCgQ1BpCaXJatA+aY3WdmvyvVRvrp3nGnfkHcU4yaNokWKCnysHmu
         Ckpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434085; x=1767038885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xUt8Z+Mp7ITm1tO+ZAjmqsH1QoNzU9GiAdB8I7mmysU=;
        b=axKSAcgphqiGFJlJIyG9GYxUg/YLylCLNER36p2gF7Unrsb9LwpzxEQJmW9ocT7pTt
         92GakrfdmSavyNSJVdZB6WCWF5w+qWAdpNQNY92IaUsbobejenBTIIOyEuG7eRnvDm6D
         c05Dd1g0dRW4bVwH+aT/Pouz7R95caKH6tv3zBF88YYTFmT/FYCfwpkkktbjL+BAC7hu
         y5JmS0V+sc6m/YV35X5bkSDsQeLBmr4LxVDGy155XwGEJ00wErV2qnJTt/z6CUeMY3xK
         RNlTDXxsAFq+gb6RaTtIBIIf7FPpcB6vSf15RHL0f33ItTkb/LZQSEMUS61j9Fx/thgR
         hSUg==
X-Gm-Message-State: AOJu0YzCFbGg96Cp/Dfe+rYE512tg8USbdK7TSGV1b8ixlSfKLvLIOxr
	VHKOGjWeFA9qTc4CfdNmuqTP3FMgeepAHJnDt84u4ouYlSrcbd+x4RDhDA/bNw==
X-Gm-Gg: AY/fxX5l+d6zCJSmTz6jRdztFOilkkygRYrD1L1N5W5WY8DJYQtdvsWWU5Eb8c+3Kz6
	CNYxKN8ZVOxIFH2JmUTrnK5gScxRj4tBOWTBmyUjozReyvRtcIYFCw5MYWS60hQ1MybGksiVt2Z
	d6/2SqzSTd7fwj3fR3oYHFiwqIMyyPlMd7A9XkLWvjEIcqS4J6dBV53HGa2pNv/AxNzs3vuzIMB
	yWp4C5KdG7luui3j2H0Ouy2B0ol/MFVktGJI8MblVr8ZqDsK7KcfuhJStGJXRZIgLI4j1IY8rOR
	hJBNShVLySXdygzV/kfccofvMb31zf9LaiYQhiMulhSulfaKceH3QtkDHbhu77oblUNwKpzFz42
	wc54w0z2iAx6yHqJrHqPw/OXGZKgVS4yW0DFQlxWd3lUJnwPvJaOq8gSZ0hsQV23CDCHx3QGos1
	tKC8CesxmfIROJqHSHis/GC0G5OL2NRrVwJgzcdTHVuDAHZsA=
X-Google-Smtp-Source: AGHT+IHN5GC7IpHaAVeuaYVALqKd3P+WZMgp+Dl1iSSkCBJMz1u1cw1nkCgk4wdAEoHAHqaMRu5sDw==
X-Received: by 2002:a17:907:9345:b0:b76:6aca:f1f3 with SMTP id a640c23a62f3a-b8036f5a9abmr1048448366b.19.1766434085523;
        Mon, 22 Dec 2025 12:08:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 027/114] libadwaita: upgrade 1.8.1 -> 1.8.2
Date: Mon, 22 Dec 2025 21:06:09 +0100
Message-ID: <20251222200739.2278706-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228352

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libadwaita/{libadwaita_1.8.1.bb => libadwaita_1.8.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.8.1.bb => libadwaita_1.8.2.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb
index c4a40a8c36..b2e70a4ccd 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "8b1d4d5f89373a5b6eea8d93ecdaee34cd26ad27a4dd396c06f5d9929fb313bc"
+SRC_URI[archive.sha256sum] = "589a6e0f4191740e8690a7d3298e16fa0d4061341b551da7abb2f030b550adb1"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.47.3


