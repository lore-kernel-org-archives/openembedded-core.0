Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8A3C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 10:51:53 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.30455.1654512712613175429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 03:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HjCXFIwy;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id h19so18286674edj.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 03:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7TXjx7X1FEpv/HOmTNVpe20riURhzMepic1ftcdSke8=;
        b=HjCXFIwybGKdso5WFGTTpUchMl6RmETwxC3/4rPUZ1TmlF1qt9u4x8HyCsjDqWj7RT
         nrNoOXdaClviH8vxKHL2UClhOADP90KlihxLU7kLgVXtvzMbqFHGJ/7wlXGtUraKc36p
         s+orpTTae1Qhc/yBirElmC0l4SzcjHq8bkVCb9k/AnadVUCYEUr4EPS1DsvH1MCL9e06
         DFnk/cKwWge2eNF7GMzQaFAa+tyrwFB2v9l6IgR0+M098kGELMdS4psivb7zo+iGG7u9
         d0zRbl+ae2BfIaIRI3kxfTXMRyn5BSTDc06hJSXkcWnYYzHduAWwtsoVfZ6cHxROhDP7
         Mleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7TXjx7X1FEpv/HOmTNVpe20riURhzMepic1ftcdSke8=;
        b=IxwN1fQohDbtKoBcooQ0VxLPrB9Q+gdUu8dLZR+tKHrTsem9C9wtR9or1RRIv4zacR
         7UMZaozfgKhEDlviHe2m/NcTFGKqbqlvH36ZVX6KvYlDc+PkfnqisLzd+jbTqgHVLgDK
         ZZrwavJ8pZeuC8nbXuuTw/RDemvFWGhWXld13+TAbDsUT5IFg+pVO3KzUy/ZxbCwurjG
         pKQ0AA1iR3CFD102WH0IH2JUUvuiQDrK2VZ8uBJ/DRrFZIk3ED5WXZeWgYIZ1Pavo8GH
         aP0Csf0C2+oB2tN3PCACRyordl6By330i8SLRa1d1a0uXokWKWyrQL4FSDMq33lVRjPf
         wT7Q==
X-Gm-Message-State: AOAM5321JnSdWCR7rWio3I3N3jlAsSu2HPvZUB4zu+xbg4inthWZ9wUX
	wl0C7smG85sd5K3C8sbriFcAiZxo1Xs=
X-Google-Smtp-Source: 
 ABdhPJyB34AT7QH+raX8jL0q3DYZh/g8i2c592P0JlRuriUd5OPuhkfzld7QivRBVUT3+aayf3N4mA==
X-Received: by 2002:a05:6402:5114:b0:42f:b5f3:1f96 with SMTP id
 m20-20020a056402511400b0042fb5f31f96mr14525184edd.260.1654512710571;
        Mon, 06 Jun 2022 03:51:50 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-12-122-122.business.telecomitalia.it. [87.12.122.122])
        by smtp.gmail.com with ESMTPSA id
 b23-20020a17090630d700b0070e1adff390sm4124475ejb.34.2022.06.06.03.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 03:51:50 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH] baremetal-image: fix broken symlink in
 do_rootfs
Date: Mon,  6 Jun 2022 12:51:42 +0200
Message-Id: <20220606105142.995335-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 10:51:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166592

If IMAGE_LINK_NAME and IMAGE_MANIFEST are equal
don't create a link otherwise it will create it
to itself.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
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
2.32.0


