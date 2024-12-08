Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5EBE7717F
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:10:54 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.78179.1733663448830114875
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TxQeBGOW;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3863c36a731so185671f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663447; x=1734268247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Brd60U4xkIX8kVcK6GQZx4de7qMAodEnLyX+pEj7gk=;
        b=TxQeBGOWzGljCpx9a/sJ/n1pHABhQ1khaAfzNNlx6B49G1L9xab3DKWqXQ+objycOk
         1NqIDWoq5QSiEYFQ4gGOKXNHx+EhpXJtmYICKyr/uZekqDE56o1GrkEHXcZG47f3YecH
         Z/eSWB7ECGgX761AoW246gTHM3nA9rOnoC8Gg60VGUSUu85uq8xOJbyVgGZd242pyFwo
         NkEZhtKFj82xw6Z2dFhJmkycYpg8PklJBtOB8Rbi0VKx4Td8aN95XM66t4pua9pmnoEa
         ut9+Ona7SAAqHwvZXoeLgaNlwv36pHqhWlm6+94CV+/aV4LVK8Aw3iAEu+7Mz3fuflwZ
         36Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663447; x=1734268247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Brd60U4xkIX8kVcK6GQZx4de7qMAodEnLyX+pEj7gk=;
        b=rWEiJP67pMI/Jf1JDGUWj1joNKG0BdAPYlLqO0glcT4XBf8wac8pKq7fmDtz6gaRil
         097AXj06xP7sBEYNvQWWgulKMs11REqAQRx99qihPr8qkVV7OgktZsJwqCdR5pUuHv6z
         cPfm/rP7SNYwn2NF0kW+dsgBLRCSmRhceCWA1Cx1dcBoXwN1vWCMkC7NK42s+yYxMYXt
         qEqe18K4bvmgorbRmJBKQVP2xJurTS7sFWAaBIazOi3BSs0zmJgvTWrROZvL9tK8GSM7
         8W8Zw2Ri3yRI83uNeFnULv1OymUzvYSpYqP/Dl8THxBwSd/nHttTOWATlOT7kpW2sV0c
         pgjw==
X-Gm-Message-State: AOJu0YwWiPS/rhDLiG1nTRFcqxMq402Y1+jQEOz5PjqnOBi2BobAapId
	p0EiRHEtsiW0IYjGw6wz27G7hAfnraWCIBbZZy1UwapfjIE0XmMQJmP12ET6
X-Gm-Gg: ASbGncuddLwKYiwfSvqAhlIy2uocVVAWvBJETIHTNSeDO1gU9p0NV/MvI1KDX0iP5ry
	gItm/RCIZarqXkgt0mS+HiCiCaJ3aOq2ZKG9N5DIRGsle5cC4hHLJ32q1IdLptjeVxRBnZnELQW
	JqIbdoyQSejdkhHDPuC2/rKCszHbWlkyawGDTDxUYjAyM9+rnH7u00lq+e/0zksZ7CrpwyCWE9r
	gXdgUS56ZG3qj/tcDwaWbByKYe5xkJ552vMMJ5o6/40PAzMjixm1YNoeddEGZxZQyQ/jNMGj44=
X-Google-Smtp-Source: AGHT+IHvFV+tIqIDyaP4FZAzfQo6pMavgWPk8hFRu4NxnsSQK6zLs0RQBaGDkDSalcLNPP6KauXXQA==
X-Received: by 2002:a5d:64ab:0:b0:385:f7a3:fecd with SMTP id ffacd0b85a97d-3862b33e3b8mr7950949f8f.11.1733663446295;
        Sun, 08 Dec 2024 05:10:46 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862a4ae481sm7522689f8f.25.2024.12.08.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:10:44 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/4] systemd: drop intltool-native from DEPENDS
Date: Sun,  8 Dec 2024 13:10:31 +0000
Message-ID: <20241208131034.4696-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208131034.4696-1-gudni.m.g@gmail.com>
References: <20241208131034.4696-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208455

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_255.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.13.bb b/meta/recipes-core/systemd/systemd_255.13.bb
index 0ccca8a567..fa3ad1d2cd 100644
--- a/meta/recipes-core/systemd/systemd_255.13.bb
+++ b/meta/recipes-core/systemd/systemd_255.13.bb
@@ -4,7 +4,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
+DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-- 
2.43.0


