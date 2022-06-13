Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9E9C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:27 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.6477.1655130137449645091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cjvee/Eo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso6107391pjk.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5XU9bHIWCZLdyz1LSFif/uoHDUxnPiK7grv5rjgwWjw=;
        b=cjvee/EoF7dsLrfP+dOFqI54pf46BggwmMqxaWUI1GZEqCvUYinpOG8MonJ0V7jH5C
         IgzeOJQ13J79MY7a/RU3HUAFsdS1Y4Eq7C4Lrqi8IWCnZQMIYdN1z5yPoKlOl0X86EfR
         0RXHfbIsqv+074poB4WzMBsBQaMkXYHCL4lJBRSnkIEi57sKxPOhaDe8TCXVCAbSNn5w
         YiXKeiTwTKjx5sz4+Vmz+J9zn4yWtH+2EYNcJZDhvsHuP+ViVVMaOR8qipG0JMqb3uhq
         TUroo4SAhP2AgpubhHO6gq42QJknT/OpQh0jEjoWlxsHlBWPw52qgzXqOCE3FGnjjyOp
         34dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5XU9bHIWCZLdyz1LSFif/uoHDUxnPiK7grv5rjgwWjw=;
        b=pxC7xgd2WXma5ZMbC9ZCpJq6wS3FFQvWHC269qC1cYe5OGdtWv0fLj99FPikqytHP7
         sFDigk73FUm6nqYrufZiGH9Jp+IszoJ6bn+Tl9xI/sWf5rFtIHcS/tYdZCH3k7ZcPyaH
         w5pb+fZK2m9d/cCjt0P6VmHetikSW/mw1flk/5xlzwLygov1+KOMeGVhwTppQdNOdPw/
         ZGvl0rCqGOGs0H0wVwitqnO2WdqrEIFiYlPNaJKRY6cLij4MmJ8Yus+AxAUKBHLM174A
         FBIjaOY1Cl2Sg9hJO/4RT8vnyrxgVm0MdHykMoaEXavpvznmA2t5oB43O0ISP+iEPfuc
         PsBA==
X-Gm-Message-State: AOAM5337WiiJPywP4H6hP8rPkd9LnF9r47egUfzHMyHFVjEHPPjvI+FY
	USM/plWowawvzfkrQA807stj6+EWw+YHwUAU
X-Google-Smtp-Source: 
 ABdhPJyES3Qm/KU0PBJIxJGUZ70vYtgy/rL8eGON1gKUiIGrcLkx7O44aImJ7+KoK0m4wY67tfZCuQ==
X-Received: by 2002:a17:902:c2ca:b0:168:db72:16a with SMTP id
 c10-20020a170902c2ca00b00168db72016amr6567536pla.171.1655130136227;
        Mon, 13 Jun 2022 07:22:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/20] baremetal-image: fix broken symlink in
 do_rootfs
Date: Mon, 13 Jun 2022 04:21:37 -1000
Message-Id: 
 <fb4672a8b4090d0ea9b7931d1b04bccf7a81548c.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166850

From: Davide Gardenal <davidegarde2000@gmail.com>

If IMAGE_LINK_NAME and IMAGE_MANIFEST are equal
don't create a link otherwise it will create it
to itself.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8fd1a37c38dbfc688d840d12c61d76f151f9f605)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/baremetal-image.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremetal-image.bbclass
index 81f5e5e93d..cb9e250350 100644
--- a/meta/classes/baremetal-image.bbclass
+++ b/meta/classes/baremetal-image.bbclass
@@ -47,9 +47,10 @@ python do_rootfs(){
     Path(manifest_name).touch()
     if os.path.exists(manifest_name) and link_name:
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
-        if os.path.lexists(manifest_link):
-            os.remove(manifest_link)
-        os.symlink(os.path.basename(manifest_name), manifest_link)
+        if manifest_link != manifest_name:
+            if os.path.lexists(manifest_link):
+                os.remove(manifest_link)
+            os.symlink(os.path.basename(manifest_name), manifest_link)
     # A lot of postprocess commands assume the existence of rootfs/etc
     sysconfdir = d.getVar("IMAGE_ROOTFS") + d.getVar('sysconfdir')
     bb.utils.mkdirhier(sysconfdir)
-- 
2.25.1


