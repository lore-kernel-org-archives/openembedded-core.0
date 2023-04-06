Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EC7C77B70
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:36 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.162523.1680796955851529054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XrFFFwSx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so43304693pjp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796955; x=1683388955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bs/Pomw7s+s/CibVeTODBJNNdNiFjDw4aYO1Ru3irds=;
        b=XrFFFwSxCLFzMHzOMDPO5pOfpfXh7c0cV/CXxAedmNopj68QH2Ls0QRYoMFX5BBZzj
         kz/KBWwcu79R8xClcduuPALsbtsXDKfMl1uIzqil4mvkWE9CFCHs2NCUXyNFdvGG7ptY
         z7oTro/G1Yd2f9AP2vWnlM2ld3hjrk0XF4zU9Vjzylsf0BvBKxE/kZHGuVqjadwplGnq
         tCKku8h3o+dwUsaJ7c7PLIf4OV2444zkTDH5GR3Gm1Anqi6nVlaq9dS9D6ww8xAJKkE/
         V9FvtIO5OmDx3QqW093x8v0pr4myfYVOXyRXInMJYj6ygJGUp7gOstjdBUAFo2KUkTX+
         lH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796955; x=1683388955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bs/Pomw7s+s/CibVeTODBJNNdNiFjDw4aYO1Ru3irds=;
        b=pARV04uRIzLhfFWgjQZ20iPNneS5Ls4Nbi/9UwYWzKUDZf3XDfPHF6a0U/UQoPiBPL
         u/S6LR7ajiMJMs6pvkLgtcwY3SAfQxfd215r7m6Er8ECUSRFMU6qct3P8wJrMUnOGxp7
         Q8cpVeufujo+vjt0LrARidcegImKGtJypd5odQhAcbx2BnGrVfc7a9roFXej+EcgpHU2
         JSD9SUGmGXcPNY4108I/XkaH3+xAZM2VIGJNZiX7eye0IBmcj5gJLul03eXDv+whDEF9
         opuhNqI+B4GU3OqkHkJ0yXg0OF7RVZNc/DyQtaGaGfZ6vm/9qEuNM3pivRP/rVve9Al8
         /E7g==
X-Gm-Message-State: AAQBX9e7dSbUKT/BctNeHQx6op7JDYc/CZeL5CgDIIwTvb3/S4wLyy2S
	k7KXvfNIcOzvOV+Ytsv5w3ro3G3W9yJRk0FI6zQ=
X-Google-Smtp-Source: AKy350aY0XR1z5kyInwor7JFgf+FZKqmI8XoYWMNg8jYo3QmGGmrUYtB8xlwpCrKUlwX+rt0OTZ3jQ==
X-Received: by 2002:a05:6a20:bc88:b0:e5:58e6:be37 with SMTP id fx8-20020a056a20bc8800b000e558e6be37mr2813786pzb.61.1680796954821;
        Thu, 06 Apr 2023 09:02:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/26] run-postinsts: Set dependency for ldconfig to avoid boot issues
Date: Thu,  6 Apr 2023 06:01:36 -1000
Message-Id: <8362859236d7b9f312f2d36f2437f4abbdeb5716.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179787

From: Arturo Buzarra <arturo.buzarra@digi.com>

If a package with a postsints script requires ldconfig, the package class adds
a ldconfig postinst fragment to initialize it before. Systemd has its own
ldconfig.service to initialize it and sometimes if both services are running
at the same time in the first boot, the first one will work, but the second
one will fail with the following error:

    ldconfig[141]: /sbin/ldconfig: Renaming of /etc/ld.so.cache~ to /etc/ld.so.cache failed: No such file or directory

This commit adds a ordering dependency between them to make sure that only one
service is running at the same time.

Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e9d812e127dc6743f52f4881e509e8e2e833afe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
index 7f72f3388a..b6b81d5c1a 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -1,7 +1,7 @@
 [Unit]
 Description=Run pending postinsts
 DefaultDependencies=no
-After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
+After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount ldconfig.service
 Before=sysinit.target
 
 [Service]
-- 
2.34.1


