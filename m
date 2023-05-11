Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7696AC7EE24
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 21:28:38 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.8926.1683840514458969697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 14:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LgS1yllI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6439e6f5a33so5427919b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 14:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683840513; x=1686432513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvWusLfMZ2vLGUsGFKoj7rEkVNpMh48fjVR/eJPOW6Q=;
        b=LgS1yllIYsA0zofFd9VaJo91MAc9VppuGIMF31GgfKpoGNyISc6u0E36RGW39I3JQW
         R4ajGl/qPlJOboVeNpnVksl/1UljX4IkHXI3lnC9Fbve69Wx7ciQV85oR8p4h5AQmpFi
         AuxpDsg0Czc3gupH2Nw72OCEBoNxZdxbSn6JBxDhvkhr+X8vE0hBqq2S3nOH1boMk3cE
         evWJdR02ZYWOVcSTEkrL14UCtmzDd/V4Whi44GJJD4tr6D5nrZp+AHDNgjxg+G2DICHy
         kF/NekLyiOlh48yh05hIN5krouTog35mXr4zfxQUgIoq3vjztin5E3uDaDxjI0OlMbtn
         pqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683840513; x=1686432513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvWusLfMZ2vLGUsGFKoj7rEkVNpMh48fjVR/eJPOW6Q=;
        b=cOU75knMKvAs1/4KL1T/R2DRPybIMNEyhmjU53j/lImuWwyKORiK71J/W6QdFLhJUr
         dlKlCTRitn3fta+zCRAHkqlsuGou37ps9LUOE+towkzHF1iTjxMYWvy00l/iXc/AOv+C
         KShCovtlKjZUgOVUvLwVXRjEk57hlkyKgwJ1VYS14toGm1u52TadGIsZ2gasGLAQJHge
         SXWopJBQJKa861ZMiVY9rwCiPm32gB9YOlG9cDk/270IneNsF1AmrRjUoD81OT18/LZK
         kM9j0s2/LxtQ4W39PAfp0LLUqlhXT+ODIVbTA03Lwy8y6b6khsn9v4E5YxknEh6d06sW
         PSlA==
X-Gm-Message-State: AC+VfDzDlMdXjShhDxRzyOGiOFEZRd/oLVmomAzHMLVLpwkPcIhvoJkd
	DLheSaFTtHKpZvHMpooeo8csPiM5OsB2YrFz/b8=
X-Google-Smtp-Source: ACHHUZ5tzhXMYWu3VfHAqdPDrLYkeTS+L+B7vWX8wPZCt+jmhFc13nIZqNBSOePxD8PEayqP+CUpFA==
X-Received: by 2002:a05:6a00:2d06:b0:645:1fc7:881e with SMTP id fa6-20020a056a002d0600b006451fc7881emr24125851pfb.22.1683840513380;
        Thu, 11 May 2023 14:28:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e5-20020aa78c45000000b00640defda6d2sm5671981pfd.207.2023.05.11.14.28.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 14:28:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] run-postinsts: Set dependency for ldconfig to avoid boot issues
Date: Thu, 11 May 2023 11:28:11 -1000
Message-Id: <1bc254e7969f3d5470bacf9ad9f065d38b7b7fde.1683840390.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683840390.git.steve@sakoman.com>
References: <cover.1683840390.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 21:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181153

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
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
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


