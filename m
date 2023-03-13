Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1110C77B60
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.18079.1678709756829506490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nOQr2Aef;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id o12so47827589edb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MieWw1+YmZwDMgxkUbJCoeC0im+AzofyPYtIaiPQlHQ=;
        b=nOQr2Aef4yLdm2F12sZeqQOLXPN9xemCnu+AfIk62XfQddzAezbvmNQRsJO9AtaThW
         C/wdlegIdo0p1+ots2RJfnFsMymhiGDHC8xPm1QGM4vOlju8o8TrRdIA0IqV0OmmOUTV
         eRDn33pHuXiM/b8T+aDzOob8HiqiaRIb9rwpHcoKJyGq6sRmTTGA0NA40T3zblrNf2YP
         JWuURrRvHIbrhn/wKgkOsW6sI3NS1W0zaCpAF0Gh3fzhPpVHhvNwvc1nTdD3K9slrwM2
         JOD6fwd4vRaWtS/3lGcboC+ossQaw/qWU6eerXPM7+m4Ms27jvfubHnF+t4HRpCUHN7Q
         008g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MieWw1+YmZwDMgxkUbJCoeC0im+AzofyPYtIaiPQlHQ=;
        b=G17VTQE8AbTgChZn4tFdyIQACJbf9tqP1aNYYBlg53Fa582ir49qsgVodUChWZRWLz
         SpI3SbbFKPpWM9olet8OXRrprWAiUpIB9Jh6OKR+TfTgXIyOBR/hzjVKjHg2wR3Vi+/4
         Y/xbXYXY40s8W7KhvSIp6c2/DmzP9+9nC9tc/pLGkTM3KqNniIMEU2g+VMDF/2spC3Fl
         MScVhA62haQIyrnD4+6KPmsXlXIgqb8ogH38m3GHiqvPVmSj4CBtgCeQLwRA4wPNlSCL
         PbFpzI9K7/vsXsF5b2yfGExy831YVQ+mR3jlIIHq/JVbmwylO2HWcUbYqv1Y6S2YsUuB
         oy7A==
X-Gm-Message-State: AO0yUKXHOTrJur9IZXYqIM8RWIioGOHvzNdttUdHt0PujF9bL3hrf2L9
	AnWfbytb53T27aWm5YHnhpceFzaZSrE=
X-Google-Smtp-Source: AK7set8Tm/TSIEZcfpzNQHxMvjCS+yaM/NrdaI1BCSothjs8eM+xnWDsp7nUJq19zUWizrt7AaLBmw==
X-Received: by 2002:a17:906:a3c2:b0:887:9a7f:4326 with SMTP id ca2-20020a170906a3c200b008879a7f4326mr32668635ejb.8.1678709755384;
        Mon, 13 Mar 2023 05:15:55 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906135000b00928de86245fsm1284785ejb.135.2023.03.13.05.15.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/14] selftest: wic: respect IMAGE_LINK_NAME also in test_rawcopy_plugin_qemu
Date: Mon, 13 Mar 2023 13:15:31 +0100
Message-Id: <eb9b7945eb12db1a7a37d68327b8329f23b87482.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178437

* this one is more tricky, because the test_rawcopy_plugin.wks.in file
  is used while building core-image-minimal-mtdutils, but the image filename
  inside wks.in is from core-image-minimal, so we cannot just let bitbake
  expand IMAGE_LINK_NAME, use separate variable set in the same config fragment
  IMAGE_LINK_NAME_CORE_IMAGE_MINIMAL

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-selftest/wic/test_rawcopy_plugin.wks.in | 2 +-
 meta/lib/oeqa/selftest/cases/wic.py          | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/wic/test_rawcopy_plugin.wks.in b/meta-selftest/wic/test_rawcopy_plugin.wks.in
index 83be4be914..a865dd1d32 100644
--- a/meta-selftest/wic/test_rawcopy_plugin.wks.in
+++ b/meta-selftest/wic/test_rawcopy_plugin.wks.in
@@ -1,6 +1,6 @@
 # short-description: This file is used in oe-selftest wic module to test rawcopy plugin
 
 part /boot --active --source bootimg-pcbios
-part / --source rawcopy --sourceparams="file=core-image-minimal-${MACHINE}.ext4" --use-uuid
+part / --source rawcopy --sourceparams="file=${IMAGE_LINK_NAME_CORE_IMAGE_MINIMAL}.ext4" --use-uuid
 
 bootloader  --timeout=0 --append="console=ttyS0,115200n8"
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 7c31848732..b26b649c3a 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1034,9 +1034,13 @@ class Wic2(WicTestCase):
         config = 'IMAGE_FSTYPES = "ext4"\n'
         self.append_config(config)
         bitbake('core-image-minimal')
+        image_link_name = get_bb_var('IMAGE_LINK_NAME', 'core-image-minimal')
         self.remove_config(config)
 
-        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_rawcopy_plugin.wks.in"\n'
+        config = 'IMAGE_FSTYPES = "wic"\n' \
+                 'IMAGE_LINK_NAME_CORE_IMAGE_MINIMAL = "%s"\n'\
+                 'WKS_FILE = "test_rawcopy_plugin.wks.in"\n'\
+                 % image_link_name
         self.append_config(config)
         bitbake('core-image-minimal-mtdutils')
         self.remove_config(config)
-- 
2.39.2


