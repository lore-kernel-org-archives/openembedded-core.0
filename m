Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3EDC02198
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:21 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.92327.1738600939752923638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y9ViMx8v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso4853499f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600938; x=1739205738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=en70a+xHLO5EWqocpPy0cUYYwpQQfNKDfGG1VMhzqGE=;
        b=Y9ViMx8v9ivRgogFxWWw2Umm/g/iWOK3TLhT78JYcRn62XKlEQAKvSpQYdgOLe/ylU
         rgKkuJwff3GQO0HtHwqXPyXMPObKdM79GDtKy5UyJKRNZ0p29XwIPFl/eWeYMkvvZ26r
         9GbNR2AVnnRcZ/movrdiMP3W2OEn1QJJc6OV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600938; x=1739205738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=en70a+xHLO5EWqocpPy0cUYYwpQQfNKDfGG1VMhzqGE=;
        b=bdex3vRaVUPo5/BRm6GSri1LIoiTI99edScEESNkCPaD4GqHUuvQUV/xKrjRJzFvVC
         0d1aj9DS5f/zalK9JTMEuaVOU2mg2YCZx2O9T2KslcQVE4oan2lw40LYB6P5+j4JuHiU
         6FTKp8PHIsD76/4xcNKD4tGuKSof1vz/KufHGkj4TWVvvYIbrvALLlbddCopoDLPHrMQ
         j9QA4SG1L7P3AYNG+xrOZtJNd+zo1HLmgG9eUCGFdQWYCsGcvzhYRk54zWnGl4obkQWs
         IY/dEGgKe7PINcoIRNkKAYAYPVM5SdnICmJuaTMmiAriWv8UlFy3ZZPkARmHB16FLCtN
         rOJg==
X-Gm-Message-State: AOJu0Yx3igG3pNf7eT6MeZhg+mqKhlHfCLr6qITZiimD/aRWJ9ohzfSL
	rbSBQB0+2VZp8irf7mGvmpJslHhfoNX72RtmJwpmdoc29ZNe/Wt4Amkpuh00sa1gPe6H1FzQWrg
	v
X-Gm-Gg: ASbGnctopX1fUnKbOtiXMTqdfBpI8sRdSeFpK1LPPkd5oF084XrRi7TlMTD9TYwQyZv
	1B3podDAneYSTOBw7J9WLaE6xAin0lxQmy5gVBvsNyOQLNMfijfXyyHcsqJexHhdS1bYdpf13LY
	cl5/25dQYtWFVDtnWAZYjV+YU1toq5lJ7PRboQM+cLJCE/sTz6IYdcQal9tAOwMMMHmrdj16AMF
	o+YjNJgNJAyKn0rnOc9GqM2ziKNatCPDiIRPeSf4CNx2LRlwL9vRIRAQ6OeaqiQlKnApHrj//4x
	haV8XuwZ3ES2GjFiTpt3CRmPqzbUuqNiVGKgyVrH+pC3
X-Google-Smtp-Source: AGHT+IEEkYgDBQs5ii6QMvXM0gqaqeQNIkrrVd1ui7OZS+Fz0k5CAda1z67rD7+fPyyafMkRV+KtZQ==
X-Received: by 2002:a05:6000:154e:b0:385:e9de:d521 with SMTP id ffacd0b85a97d-38c519395bamr20763763f8f.8.1738600937793;
        Mon, 03 Feb 2025 08:42:17 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:17 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 44/46] sysklogd: upgrade 2.6.2 -> 2.7.0
Date: Mon,  3 Feb 2025 16:41:28 +0000
Message-ID: <20250203164130.3403325-44-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210717

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sysklogd/{sysklogd_2.6.2.bb => sysklogd_2.7.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.6.2.bb => sysklogd_2.7.0.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb
index 7f06738d009..af8abb56b42 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "c1f8842853378781c2fdf6e70070a95539ba7d2e"
+SRCREV = "b45eb487b96935c72fc997d840f82ecf650ed8a5"
 
 S = "${WORKDIR}/git"
 

