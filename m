Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131D9C77B7E
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 05:49:59 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.5769.1685166590266092888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 22:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BBnx7qZh;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-510b56724caso5798443a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 22:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685166588; x=1687758588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vN8qqHzAeRnNx6hy96dgrxCrDYgJfkQWlErQMHxUqY=;
        b=BBnx7qZhPyaf3WKd/22dxQ9yG5GQfybxTXKycZZ31YvB8WA97q0Gw7MTyvTF305q1S
         ezeddKLCbizxput8RRdfgrzEBiPHuvmI61WJbo6jKewtRr3wJRb3CHAJIKlw1dFh/Eei
         MJ7nDVHcFQFMkksc5Xr2D+0gfkhL9M245BgIU6uMiUzznKBl7eN9XAcAhpbpuROjgXVz
         bs9T1PEDzOuw3KyQqRv/BigSuqumRIeyqtgB/R+tVvDdiAUa0VA+dAh88NZGGV7wi3Nc
         ZcgksVr1oK9nir8+qJhfCcWCG9Bv/e0IvNfBT1r3j35JQDtsoQ+AeFwbbPCyxJi2D1Fx
         X8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685166588; x=1687758588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vN8qqHzAeRnNx6hy96dgrxCrDYgJfkQWlErQMHxUqY=;
        b=GmgIPcjl6PKY9cbRTcmbd/NvucHoNSSqxiyT+DPRxUZBxHzOdGX9EUHAkmqXzpDFIC
         F9EEyb8KjNIyznBqDat0/uvjtTHUYIDHCtmMUwuzR/2qSv+4wyaucIGxRk0jtjWAX19n
         KCiK9EDy+p7Pq0awp32WlLm77DIsw/nlJ1NVA7vovY4Ic7tmsz2UdVsPgMUQGlJMYHXx
         xCXY9aZafAr4LnhJT+U5z8oxzZLRdJqLSw1E0jzB/HDIAkN2s3rFHgUREJggCpBAC/Kk
         DCSvLwAf2MfwDMW/m/e5wrHNNQbv/qtw3BeLuuwV8OO204HkOELBXMptVzriH93HhkhW
         TLyQ==
X-Gm-Message-State: AC+VfDyy3oglqEQM/2sgrmKTEubj1zTYcY9u8vuqVUSJKI6yrrhoWC+W
	fScFlsE+r7dxWyV+WXouEno2yVTl1Bg=
X-Google-Smtp-Source: ACHHUZ6A8HJ4mcj92PmlXrI8BtrS4eXN6h+47VDVUW115N5Zx7H94bSklHa6gQZ5Z03stuk5/YELDg==
X-Received: by 2002:a17:907:6ea8:b0:973:9443:c5fc with SMTP id sh40-20020a1709076ea800b009739443c5fcmr1014331ejc.14.1685166588398;
        Fri, 26 May 2023 22:49:48 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lf13-20020a170907174d00b009571293d6acsm3028264ejc.59.2023.05.26.22.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 22:49:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] selftest: wic.py respect IMAGE_LINK_NAME
Date: Sat, 27 May 2023 07:49:40 +0200
Message-Id: <20230527054940.3637666-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526180939464ac2f2@mail.local>
References: <20230526180939464ac2f2@mail.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 05:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181790

* use IMAGE_LINK_NAME instead of hardcoding
  core-image-minimal-${MACHINE} assumption

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 0b0ca90c1e..d479343773 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1352,14 +1352,15 @@ class Wic2(WicTestCase):
         """Test --part-name argument to set partition name in GPT table"""
         config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "test_gpt_partition_name.wks"\n'
         self.append_config(config)
-        bitbake('core-image-minimal')
+        image = 'core-image-minimal'
+        bitbake(image)
         self.remove_config(config)
         deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = self.td['MACHINE']
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+        image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], '%s.wic' % bb_vars['IMAGE_LINK_NAME'])
 
-        image_path = os.path.join(deploy_dir, 'core-image-minimal-%s.wic' % machine)
         # Image is created
-        self.assertTrue(os.path.exists(image_path))
+        self.assertTrue(os.path.exists(image_path), "image file %s doesn't exist" % image_path)
 
         # Check the names of the three partitions
         # as listed in test_gpt_partition_name.wks
-- 
2.40.1


