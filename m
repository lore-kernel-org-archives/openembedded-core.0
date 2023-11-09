Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85B8C4167B
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 16:27:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.126226.1699547220849211246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 08:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hMoJdt4A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so7803755e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 08:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699547219; x=1700152019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3xS6sIWO1Bz4ojflkyasJQgJ5GBFafI6A+3tX7/L3kA=;
        b=hMoJdt4AcsK+G+Ca0GTmo2dx0vESmWfWOSj++JpyyYj9WBeYcy4cuhqsY5GbddqkF1
         NPpbPc5cOouKyJUU0HkcMXg3rE4RtIAip13jv/Iz+FoTS7xf0lCBGSxSxg4rlZwVi18u
         CK9dwPdho0VfSOseU2MEm06aw4k/CK4zBvlRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699547219; x=1700152019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xS6sIWO1Bz4ojflkyasJQgJ5GBFafI6A+3tX7/L3kA=;
        b=jT6OntDhAXY7y70UpAG+y5P3TNIjmUnTNODGv8SPI0Vnolia0IFR0jcwC9SYMqQ0xz
         0m0ogPZHbp2FdNiFctSGnRVEPipfQFhSBstUfV8FnNHhvSba9ALzr9XH9arM95MmbLyw
         HkWBO8TNMDKXMAIoaLhVGdZR3erflFAQYNpo2Kryxqdpf2pdWOgksd9UNkKgV5l8Y5hk
         eGNys7zuQPmoqRZRCc8TVZi2/Ihx4tUwV7FDxnyUk9jjybwpNUX4WSvtrrofn0IT0h99
         gNMAhYiCsQ2roh1/8RWYoX5p5jaYnMVolyJe8m5GQ1AKwZFq4pQ/E0fuMsfAOMh974M+
         0tfw==
X-Gm-Message-State: AOJu0YxWZuXkDS/ApbKJG2hRMdMhul0NN60Ydq07E1MlZZ2RhyNxCUfx
	q9gN6x/3L0hZpx6qRNuVpCDGHWJ1VWtlqNZ+nNg=
X-Google-Smtp-Source: AGHT+IGHVuPE+fswAJ7mEpwlGk4wsks3V0nofE8iEn0aLcqCI25JO+/3QKaqJ1JOIxk+kJg6b0f4KQ==
X-Received: by 2002:a05:600c:310c:b0:405:3b92:2fed with SMTP id g12-20020a05600c310c00b004053b922fedmr4925240wmo.26.1699547218732;
        Thu, 09 Nov 2023 08:26:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7d6a:4777:87ed:703e])
        by smtp.gmail.com with ESMTPSA id f23-20020a1c6a17000000b0040648217f4fsm2503206wmc.39.2023.11.09.08.26.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 08:26:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Switch layer to nanbield series only
Date: Thu,  9 Nov 2023 16:26:57 +0000
Message-Id: <20231109162657.1701262-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 16:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190392

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 9b94bbd8b34..bb8b1c81b12 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "nanbield mickledore"
+LAYERSERIES_CORENAMES = "nanbield"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-- 
2.39.2


