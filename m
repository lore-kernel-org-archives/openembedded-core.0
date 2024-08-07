Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2807CC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:12:39 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.31959.1723032756091472597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qcci52Uz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3687f91af40so893611f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723032754; x=1723637554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LNkc8+PN3TQ8cRlfP5liO8s6vQPwZ92nCOP71VAmDk=;
        b=Qcci52Uzsgxpe9Mj8xMDP5josljNQV6dPXJSITpbjOjPf4Z13UZZ11z8UGLIrJtEr2
         RFRfhZ5HCmvc5V6CohGTHkXI+ch3tUfLk+G3Q9TYxG0IenEhdCvS1EM2AoiiMBqQuv6u
         E3t8Bkd6uosl64HTcnhMjBceutqtcY/JOJS3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723032754; x=1723637554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LNkc8+PN3TQ8cRlfP5liO8s6vQPwZ92nCOP71VAmDk=;
        b=tA21O1/7NPKLT1vUyj46F8qEqSSLxksxhDmjh1CEyYw3YthMUGFLAAxFDr36R0YfJb
         70J56LWpbKs6u1gQ9A2Ch/gLvt3jrjtE1CqzmnH0yWQ3EfEIsR8XMo8/1bydZ7QvDUtE
         DW/gVnsSqCnnRLN2jv0fQSMxoO+9zE2E9XyGCICznnO5SIpnni/FLTVFWfFibZ+4nQFR
         Fkv0496JPypxaPyzL08J+ascQDv8JZ310XCux+yTgdruVa+M4E7+dXjGkOpYDpmxWSe8
         OJu5M8528YWxXAKHzp661iRyaWVUVsm5yI7MJYhO/5m+4yq8JRafm3LfCf5EO1TmdhUX
         1HiQ==
X-Gm-Message-State: AOJu0Yz14You0Qs1smrqV3mmlgW+UwfbYY4Zz0k5eILFQYn+ijRc2HXp
	XatwjMQWUi83ir12KW4wQLIMnIUrxQe2qgH5k+Zr4E6Y7TJlS1ImP7FXMx73LFs4C5xT0IHYGl4
	PB/Y=
X-Google-Smtp-Source: AGHT+IF4PaZf/2wvzTuLnJdjk0nOujO+NDIunWfEgKyo3hajDLrMbmK/LadVTn26yxYASuidGIpOHg==
X-Received: by 2002:a5d:47ce:0:b0:367:9828:f42d with SMTP id ffacd0b85a97d-36bbc190693mr14676304f8f.53.1723032754107;
        Wed, 07 Aug 2024 05:12:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ff8:c4ec:1a07:92b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf0de1csm15941697f8f.4.2024.08.07.05.12.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:12:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] gettext: Drop ptest INSANE_SKIPs
Date: Wed,  7 Aug 2024 13:12:30 +0100
Message-ID: <20240807121230.185087-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807121230.185087-1-richard.purdie@linuxfoundation.org>
References: <20240807121230.185087-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 12:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203069

In my local testing there are now no QA issues from this recipe so we can drop
the ptest INSANE_SKIPs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/gettext/gettext_0.22.5.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
index 7eeb1a86fd5..ef5272a2065 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
@@ -208,7 +208,4 @@ RRECOMMENDS:${PN}-ptest:append:libc-glibc = "\
     locale-base-fr-fr.iso-8859-1 \
 "
 
-INSANE_SKIP:${PN}-ptest += "ldflags"
-INSANE_SKIP:${PN}-ptest += "rpaths"
-
 BBCLASSEXTEND = "native nativesdk"

