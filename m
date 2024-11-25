Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04EBD5808C
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.17225.1732536108056361921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ntMs9RxM;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a044dce2so8758175e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536106; x=1733140906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHz8lASAOlGcPuYx5Z5nFH9XgZehz97jrp0O+76xp4s=;
        b=ntMs9RxMurfshdAYJkZ1zMltNZ+ETloekh9/Ds8/KP4qL6w9vmYeQc96EWfKEAtkxB
         QEdRprh/z6X8G3ij8HAnD53FXDygNdSOe4YhpQr8T8fVr3PuyTuY7JkEFHoPwZZ/VH2e
         Jjxs9JtbYDVOW3PkfWgsPZw0aJbgwPcIS2gzjZUU/xCZ8x0SfNvFXUX0Fis51qwslaVL
         KRTPcRudYGSmD9JGGXPOEBt9EyLDvhToEd9lbcndB36wrRA/j30b6Mhi1Bjz1aVonn0+
         qwJztt6WawVuU8+14gvLiNDfv9pcERayo5hU3uR6kzaQmtYDTwjovp/4N7Fa1WkVEgli
         KIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536106; x=1733140906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHz8lASAOlGcPuYx5Z5nFH9XgZehz97jrp0O+76xp4s=;
        b=lyyLQS7Jmjxtbz/iMa9r9j9AOk88eXPGTyfPnp2DFJQ5aCnt4XQqrCAaK8bCdlBO0Q
         GbQ6ADfNtLyxpMSU6Ln58Z3jVcGWkbXLKnHEUjZ7KQxfamHtFgIAoaa3g1GedZzPLjit
         WYLihxOjhp2mbuWpNGmYyHt6GfPWLWd4DHjzPHNmH826fB6dcyGXJjuIGe/f6xsYzQzc
         c1Qzpy69efjFXb1DW6EI2+HIhcI68li3cowwEcvgTSB9IFebEQkGQs9s5Fq+rw1Ap2j/
         0jus+CiaUBZ89KOmdUx4Q7wzjrfMA355I9YXAxA29KX45YK1MYnXh+vyXU1g4jBPw/iM
         9gRw==
X-Gm-Message-State: AOJu0Yz/JX656/jGKtNKrF6eBL57sU7YueZEVk5V90sSySds5eOSReC6
	z9M1T5BqAxLI4BXjInGtyPZ3VOym1bfhNfyyk8CC4sP/7dEoZGsceLq4Ww==
X-Gm-Gg: ASbGncswHG1ZA3lnKw/7rt6H4dBlq4M4GrYnwj8BgimNQGZKZSZNKiqbZgvc18bNy6W
	taPSjdUgxKgTgTjrPI0A27D6khvfYih8IkksCUu/GBejDI9C311+9+xE+rUuEdeJI5dfkIA3brx
	h7W5T1sorD2U80j221bbv4pO5nx0YPQaIVhTZyAn3/YdaZfbpbRe/1RVhHr0kFzV1tZyCOmUQHU
	/plVDUy2AVd90uEWumc71fXw1xGZTfyjpoplPvVF4gWL/C/JdB6uMy0/+FGwpzLYFngvvDhh5mm
	8aexb++ZF50=
X-Google-Smtp-Source: AGHT+IGUomLpK3HQPr5SXRrKR9say9DkcifieGI8qilFqHHI4A47wyt2qjSiXl0h9X5sf0RymN2qjw==
X-Received: by 2002:a05:6000:1acd:b0:37d:4376:6e1d with SMTP id ffacd0b85a97d-38260bc7577mr13337174f8f.41.1732536106259;
        Mon, 25 Nov 2024 04:01:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/35] python3-flit-core: upgrade 3.9.0 -> 3.10.1
Date: Mon, 25 Nov 2024 13:01:13 +0100
Message-Id: <20241125120127.2205232-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207768

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-flit-core_3.9.0.bb => python3-flit-core_3.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.9.0.bb => python3-flit-core_3.10.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
index b0bef4b6b69..acd2f866f7e 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "d75edf5eb324da20d53570a6a6f87f51e606eee8384925cd66a90611140844c7"
+SRC_URI[sha256sum] = "9c6258ae76d218ce60f9e39a43ca42006a3abcc5c44ea6bb2a1daa13857a8f1a"
 
 inherit pypi python_flit_core
 
-- 
2.39.5


