Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537E1C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 14:13:20 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.20467.1683123193367947116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 07:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=B0XOMS9u;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50b8d2eed3dso7196291a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683123191; x=1685715191;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mz5neMAlo4Mtrs7NiCc+tZHnvFyF1yfLDJCLI2lS5yA=;
        b=B0XOMS9uVuWAvqBbyXzvUswH83puSXyU4G8N8Z+o15MnA0oyRN7Qu/0szr9O0N4BgR
         kS0T6rJgRbfHThG8v9R4JQp4mF5XKEBVa6UYkQcSnJdxRp5u5hklocXXvkNa8ymmjPzl
         ARVVVKxBOAJPxJylprK2lj+qs5gf2Hyk2d/KtUaBE9EXpYjXzk6qiqO9ggJOswKEVI6I
         1hGz2KYLRf7xF1Lx7fvQWFybSXbE87UD8V87XmvZC9zNUdgA+yoVfgUP7ZL3yI6oBbeF
         wb1nL0WncU9psBb9vvYlSApLhrLNoe5f2fb6fPYkLnpeH8wA8DJdHq2DDMG1pyCsuss0
         UyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683123191; x=1685715191;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mz5neMAlo4Mtrs7NiCc+tZHnvFyF1yfLDJCLI2lS5yA=;
        b=PUyekdOPBqlWo+5UR9dYqOgT/Psy4jPEjp9GouvA6FOva0hJz3eL84Oh2nGQnko/uM
         r/dPbO9pcuDB8Sbn+Fa1zaUb6C7f7cxH13MhGth1cfFUaTsPjjqaqxgxYg7Gqxhdq0E6
         0xvHG9l+yksb00eec73slXdkSi7m+2HugMMo29Kp1pu/aLKx4JmPMh4RmDM6q6v7rtF+
         Eh/tf/6QlhQAIP8SZxlDXiCJ9f/y2lW5hvBIxwz8j14X3XOoTFv9nP82jc/bWgFwwlTM
         ZqaHubLigUB2n7zmHhNeh+GzxqP/ebvWQ7H8Ys80GMVTQakNjXjLptf8TKMY8yeFrJbX
         NQwQ==
X-Gm-Message-State: AC+VfDzfabeLJfePCNmk6vc4qz62T+oOTCKIG49yKqx+v1SzY/W2L+ho
	HevP5kakLvp5S5TIpE4o5RcMu+PmdnU=
X-Google-Smtp-Source: ACHHUZ5cwy0O8q+Zo7a0R14BYN3Ere8v3Gi8S1YEI+0LzR+ECYysg4eNhCVKw89hLNFsB6spBwPiWw==
X-Received: by 2002:a17:907:94c9:b0:932:ac6c:7ef9 with SMTP id dn9-20020a17090794c900b00932ac6c7ef9mr3708024ejc.22.1683123191583;
        Wed, 03 May 2023 07:13:11 -0700 (PDT)
Received: from NVC4181.nedap.local (smtp3.nedap.com. [87.249.123.12])
        by smtp.gmail.com with ESMTPSA id l3-20020a170906230300b0094e7d196aa4sm17229677eja.160.2023.05.03.07.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:13:11 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Arturo Buzarra <arturo.buzarra@digi.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [kirkstone][PATCH] run-postinsts: Set dependency for ldconfig to avoid boot issues
Date: Wed,  3 May 2023 16:12:46 +0200
Message-Id: <20230503141246.2087-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.39.2.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 14:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180828

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


