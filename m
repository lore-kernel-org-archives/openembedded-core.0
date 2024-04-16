Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F213C04FFF
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:07:11 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.18817.1713269226612741899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RXgRPzau;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ecec796323so4461882b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 05:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713269226; x=1713874026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObXX5xv52NhQcGYxoOqfJ97yOM44UZRca78m8Rl90w8=;
        b=RXgRPzauwqP0mI1mI3fAJRwYQUTcGvLn4B3ewUO6W0Jih3Kw+LYUYNWOUo/6gZ3KrR
         QNwBEKf+c8/QhkR2+VxRaYzlyKUtonWX7MrsLfgGvaLrBXFQ44xvreQqTLWlaYnjerAk
         tOrVDEvOaY3jZCRsRtldC/kTHKkX/FzOcqIceotUGf91Le1Bu398ljXljx7SNj6VFOEa
         U4TKdrN/7AIAhnbrNIBHdJXX20hWIi3cjxOrcYoErzBsA3fys7YjaoRi6VIugcepUc0z
         taCGI80aSlRYo0OvhCFP0IiM/kNGg6P/KzKJUS7ssp7fW40v3kVAZhEjmjWOgNdKwacz
         SNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269226; x=1713874026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObXX5xv52NhQcGYxoOqfJ97yOM44UZRca78m8Rl90w8=;
        b=dVIrQ0taLzU9OcQchRTUCk9Q+3QzDBQXoQFdumuICFRMsiupyeTzqqAyikFNeJGJrm
         t1boktRUUy6D2acAln2qT+33TItAhVIkkPUdLi4cw+OUzB+dBS4rj7B8ZQTXv15bFXZy
         kwF1jzSQ6fNuqitAiBqcinfdvsLXA4MlgD3KTlCf3b8SEwLzyeGJ86rpQ3karU5aVi1x
         GDvKSQT9Q0Iur65d4jMKzY9z7by/49dWHxAx6BFraebJn2FuYRIjy3vmG3S2+pv697UD
         KfdCFfXDx5+jfQwlwRdwE9uEbZ87j9ZIxyPrGYtQNizsHFinqTGzFLjwAzQtiqapLP1T
         cFdA==
X-Gm-Message-State: AOJu0YwEhjyIElBGjXNL5lgpAlgcS291e33WZN4vFkVtQ6nQcqsyDBN8
	jyvRGlJOMxAqQ5j+2UmbS13l9HpXIBHRGpkAhZFXMikmhEwoqvgjFyPDZL8J7k8ooIG/1BbsJKw
	JEec=
X-Google-Smtp-Source: AGHT+IEYfx5DW4dw1nHjUTvuhong5+u29ccIuvZbCA2ntU6CkYwSJZIgVFIxJcbfdlH0WJBQMBYH5A==
X-Received: by 2002:a05:6a00:1312:b0:6ea:dfbf:13d4 with SMTP id j18-20020a056a00131200b006eadfbf13d4mr16584260pfu.18.1713269225703;
        Tue, 16 Apr 2024 05:07:05 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b006edd9339917sm8746111pfe.58.2024.04.16.05.07.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:07:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] cups: fix typo in CVE-2023-32360 backport patch
Date: Tue, 16 Apr 2024 05:06:48 -0700
Message-Id: <eab100205bc5cdffc5ccc7752e1ee5abd9ebb58a.1713268959.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713268959.git.steve@sakoman.com>
References: <cover.1713268959.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198438

From: Jonathan GUILLOT <jonathan@joggee.fr>

Typo prevents cupsd to start correctly with following error:
Unable to read "/etc/cups/cupsd.conf" due to errors.

Using `/usr/sbin/cupsd -t` to check the configuration:
Unknown authorization type Defaul on line 77 of /etc/cups/cupsd.conf.
Unknown Policy Limit directive AuthType on line 77 of /etc/cups/cupsd.conf.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups/CVE-2023-32360.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
index f1b0f9f918..c3db722f1f 100644
--- a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
@@ -27,7 +27,7 @@ index b258849..08f5070 100644
 +  </Limit>
 +
 +  <Limit CUPS-Get-Document>
-+    AuthType Defaul
++    AuthType Default
      Require user @OWNER @SYSTEM
      Order deny,allow
    </Limit>
-- 
2.34.1


