Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C85C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 14:09:10 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.20350.1683122948611340875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 07:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KKqMJfyS;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50b37f3e664so8719690a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 07:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683122947; x=1685714947;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mz5neMAlo4Mtrs7NiCc+tZHnvFyF1yfLDJCLI2lS5yA=;
        b=KKqMJfySR/buodjPUwcVXjdxwy/I+WvlmnB6R6yotR4dP4HBCWiWT88EJqinbGjPjM
         8Uc6g3MBSxX/ok/SS6/Jzntb2iVw62EbTGUzOrLo5x9gdQNnz1QXsR/LmmKcacwB41Q9
         ZLNlCKNMg+omEYU6fmZz++YAmSL728bSRDrHAAWmkK0L+oyjKxhz2k5ut39Gy4getD4Q
         i/CQbjSMEWxEyC5Fe8+x67DxbgynAXOa5Y2G9qFC6Mdy5mj9ZccrYB7F/iMsGpRcmme2
         JQSdaZdMYuYakf4LKVuvKKfamORn7iV8SHyRKXIBLDYxX1/OzAEDutqiSJYvu50p0G87
         XJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683122947; x=1685714947;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mz5neMAlo4Mtrs7NiCc+tZHnvFyF1yfLDJCLI2lS5yA=;
        b=adB45R7W+ZPIeDDthtA6Yze5Kfrwc1cbozmFtPpJC7/w/XbRiiEe94Uj8TGW5Y7V95
         ZeZA30VbmIcak+j2elfbiT39eUX+GNNr6/GqLOIMpUz4evgy953Iw+zN7KXJi76Vun2G
         UrnCOlQBx4acWFko65g9LU9Oq9+Y0UiuKGIi30AY4r/tdSJS8KAeanMaBXa9ApOP1+OY
         rJ59629DSFwg8HeiBKZ1b+sK0jtUICLBfqq6mbYo787uHkIjLtj8FIFVM48XL9Y02h1x
         tXN6yITjeq3YAm12S0tMSEhR2OVQkGl1GslPfxACar6ST5OTBnRllN2sMbSeLLS+K4OL
         xQ/Q==
X-Gm-Message-State: AC+VfDzA1myd64Pk11J9HzpORHvmVL7Zk/DdVD30ortYsNoFP/ZTaGih
	9CetoOuyvRO3k9UW73HhB6VArKiJJLc=
X-Google-Smtp-Source: ACHHUZ4lvUa/gVJmftXTUr3n6ZPKJFUfaFlxtp0C9DoQ9cF4NZbxu1+VrXYM1EhMK5OcPjH92y1Bnw==
X-Received: by 2002:aa7:cd75:0:b0:50b:df59:dbcf with SMTP id ca21-20020aa7cd75000000b0050bdf59dbcfmr2540865edb.12.1683122946858;
        Wed, 03 May 2023 07:09:06 -0700 (PDT)
Received: from NVC4181.nedap.local (smtp3.nedap.com. [87.249.123.12])
        by smtp.gmail.com with ESMTPSA id bf26-20020a0564021a5a00b005027d31615dsm728317edb.62.2023.05.03.07.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:09:06 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Arturo Buzarra <arturo.buzarra@digi.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [dunfell][PATCH] run-postinsts: Set dependency for ldconfig to avoid boot issues
Date: Wed,  3 May 2023 16:08:13 +0200
Message-Id: <20230503140813.1913-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.39.2.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 14:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180826

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
2.39.2.windows.1


