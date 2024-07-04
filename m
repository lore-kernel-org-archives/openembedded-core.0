Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03873C3DA46
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:34 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.5045.1720077026396513298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VAxMMhDK;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so3792541fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077024; x=1720681824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sQJc9AzBQtCzKDmUCFIZvmbULEi7BoSm1l4E60dgTU=;
        b=VAxMMhDKJrf45TroOLAfC/t7GoDCc6ikdsTO2pNMI+8gVRbKj+/YL9zkr814IQUpY5
         2FM7IKcwuXNwBPjGsmw7GlpKRXap2jHu/dWg+rJKDE1mAmDzVVsFxJk3hOCZqot6Z7z6
         2WvbAVDuOOdZVpcD41NZueXY5A54dqY8PSqaE1NAqPmWIVgDVm+AoJRya3rGVe+LGjiT
         3TJFhp7MboUzefqeddUOwR5GxfMROfrFNAtHPUmETWVrVg3B0sYqxiMGbW2ggbSOxR1H
         9SWD7jQSV+VmpuOYKkgxk/I13u4GaKs+T7oPiw/hBMw6LbYxzNZmudJU9/EVQsD+HUeh
         LEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077024; x=1720681824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sQJc9AzBQtCzKDmUCFIZvmbULEi7BoSm1l4E60dgTU=;
        b=drqNpKOX9jR3c09G2jeP5f0Oi8Tpw+/KWPEWMUw50XSg+UdZffdk56UN+chbyQIb8v
         A0z2e3g6fYmg/8Jnke38A8Em+76BVmXhmIn2J2mmZuyP0vdD+YAB2JF1GCGZGwriTWbS
         dY455yR7KN8OTg0nuaqfa5xaei6tx4a7JVBpZ2mptWsGm5bFJm1FSFYcEixvxwhR+3ME
         YeZ/bvdCuschMBsqkJ6eSVEB0tDUdssn56q+Bjd/rGwlfJB5QAXzgAAGcCSZiyDYl++5
         i8RajnIEw4wCJnN18nwzjjQSTUVUJE765GqdQcsu9Xdi9LIn+GyF2bJeDr7M+OOUWycT
         PuMw==
X-Gm-Message-State: AOJu0YwZNVphHIvZ/HR0amJ8VE48+LhD3juiImhx34Tu38s9Fa+RqseT
	Uy+NDLgeMtVeNf09M3zNl2oCpiJMHB76i3ZcLAh+Vz/6QBnTJA4PTftFuw==
X-Google-Smtp-Source: AGHT+IF9j0YcgXdRNCEv6BLQBB6buIb1Bftq5Y6lslwURwE+fZHD639tn95C55LJFSi6nR0gGuGDNQ==
X-Received: by 2002:a05:6512:3b4:b0:52c:1d8a:9716 with SMTP id 2adb3069b0e04-52ea062a28amr441109e87.19.1720077024251;
        Thu, 04 Jul 2024 00:10:24 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:23 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 07/14] kernel-fitimage: fix external dtb check
Date: Thu,  4 Jul 2024 09:09:43 +0200
Message-ID: <20240704071013.2982700-8-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201511

From: Adrian Freihofer <adrian.freihofer@siemens.com>

If EXTERNAL_KERNEL_DEVICETREE and dtb_image_sect are empty variables
dtb_path ends up as "/" which is available on most Unix systems but
probably not the dtb_path which is needed here. Checking for a file
makes more sense and also solves the issue with the "/".

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 6e6898e5f6f..664ebc65d7c 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -429,7 +429,7 @@ fitimage_emit_section_config() {
 	fi
 
 	dtb_path="${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
-	if [ -e "$dtb_path" ]; then
+	if [ -f "$dtb_path" ]; then
 		compat=$(fdtget -t s "$dtb_path" / compatible | sed 's/ /", "/g')
 		if [ -n "$compat" ]; then
 			compatible_line="compatible = \"$compat\";"
-- 
2.45.2


