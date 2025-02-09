Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D30CC021A2
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:56:33 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.40277.1739145387521035766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 15:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E6VqYP1g;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4718d989c1cso12882491cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 15:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739145386; x=1739750186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcJJPYch1xmbjM/1GmmlhuNd9LKjfp09OzWIvrtW6b0=;
        b=E6VqYP1gxg96yo2BpM5jnAoDsixiIdMmOSfzSSIrHbxZglC3hX5Z+0O390a8xWOR+R
         vtV0DBCuESRzA9TrjPbAXFEsHJhEDorphbTebSbFKG7bzO/jwu9Ogerx0uBmPOryAgXK
         haurOi/djEj6CRSbqo9prOm/Os5mNkOIlL9fwJqw7ZEziunHzdfhxchcfC4PUCnojORg
         MVnqxmROKvnanSkolwSrD6wK/YSlrmmEYblvV8EaIYKe6jfPMbO7+TW8atxUmCw6CYqi
         Oj4gLt078CeODxkE0LdI/ZK/d3cdH0ZEAenc3j45qUM88ZNa0p6L5BCbvTJ6bU4wDoEm
         3fQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739145386; x=1739750186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcJJPYch1xmbjM/1GmmlhuNd9LKjfp09OzWIvrtW6b0=;
        b=TAZPf2UwKjRfHA79kKrjwgC9sAQITGVa5NXhA07uj5l/mzY9/2FwZ2LS55bu7MbGyB
         IaylomVseWb7kFA9a4wLgbHbvkUqNy21y6YwFATD2ccS2eDygg32aZujOOs2ENMbibM0
         YcL6HgNRLvgTbf+eDVJufO6y8b/wV56Tn5pSbHYozZ7GpNojEVjWWBi6FjiiEPH7Glta
         I/8xbT7RUUuu5jT4kljeWQKeK3Wtdxny4gScA48phd9LMs+olebKtQ2sgcrvRJ1PvZf3
         +i04+TNz8GD9tpiqvOHi8ZyhZdSE5aZ9lcCW49JhGPKftkRYnwSDI3NYYAxe8QnZbjUL
         H67Q==
X-Gm-Message-State: AOJu0Yw7U931eLQJsoFV13KSmY1ce17MPu6bspwvHF1xZ7zE9qoLbYeF
	tuG3yRfmGR1VfzKkd39nirQ2vNqGecHvEexWwvW1HyOkI7GUsY3n/vtA0j5vVgk=
X-Gm-Gg: ASbGncv1rnJ+bI+E9x7tYNnNJhkNupmI4EKzGOOqtClR69T4e0MNKorF+gvxJI0OcQv
	JnwwEBE+a3ehL8KoTEZJqBLHOjPygX8wFvGKbT8+j6+iJDAahtjB7AY+wFzOkUH6OSprgouX02y
	lcpewGU9566JpmubqJK3dwvUJc5gpLJGzaLkGzMo2qc8bu5Wy23m9b0yDnKonsCqZ9c+Ihp8Qb3
	JgucXiqDve8Mfr3bD8RHHgKeutpl0voguIZtNmKuoDfwRKZa1WCFgu3BPl76YuK80ypVWkjSS4z
	Er30nVaJEZ4Z0G1EeX5AX2sOs68rEKxOGqbrG5CZKjCdiDAL5sG+i/g99itkLywz5903f8ZMi7w
	98i3MhcWNJ5+Vwumm
X-Google-Smtp-Source: AGHT+IGiFr7Yhjk4CYmt0URkAgGCOylJ/PiI3CfFvtYEpcDUbQB14MDrJCFSIl25DshJ85TKkKXheQ==
X-Received: by 2002:a05:622a:1882:b0:46c:791f:bf3e with SMTP id d75a77b69052e-47167b244ddmr143538861cf.48.1739145386586;
        Sun, 09 Feb 2025 15:56:26 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153beaa5csm40754181cf.68.2025.02.09.15.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:56:25 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] poky-alt: switch preferred kernel to 6.12
Date: Sun,  9 Feb 2025 18:56:13 -0500
Message-Id: <dbc453ced8c538af94f7ab658b64dc071e1173a2.1739145061.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1739145061.git.bruce.ashfield@gmail.com>
References: <cover.1739145061.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 23:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211061

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.6 is being removed from the upcoming LTS release, so we
adjust the alt config to use the 6.12 reference.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/include/poky-distro-alt-test-config.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
index 3e10251e8b..a24d5e15ab 100644
--- a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
+++ b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
@@ -2,7 +2,7 @@
 DISTRO_FEATURES:append = " pam usrmerge"
 
 # Use our alternate kernel version
-PREFERRED_VERSION_linux-yocto = "6.6%"
+PREFERRED_VERSION_linux-yocto = "6.1%"
 
 # Ensure the kernel nfs server is enabled
 KERNEL_FEATURES:append:pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
-- 
2.39.2


