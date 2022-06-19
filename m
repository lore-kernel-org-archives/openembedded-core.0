Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA005CCA47A
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:37 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.22004.1655667335458542670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hgntNgWc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id d14so4945648pjs.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uSy3FrZRw8gmLEyii6mTZSygmLEpg8wok+O8ZlFeP5g=;
        b=hgntNgWcq+zVFPzYzfNcg2B/xM0+pB5B6igzn+Kw4ETjZhqupiYPTYZTfeOgG0eDW3
         kLOXjZ4bq/4VUAF2ODzNPxIqehKUrfpiJU0Oe0FNyOiWSTE/fJjmQ3ebc2Zx9StRFmu5
         UbBDKXSXluYyFfhMuCZuku2IXlKKg23cdo/3Io+y4uI3emv1w7A6i9o9GcrQCFTU8309
         uyE3m4rX9INySySvHhV6GHBAfJS7xWceCqflyACo+kv14zNUpRzLIhvzJcW88AHvB72e
         C1JlJpjxE0Gt8tAkkINiqo/SSLO60LxtfkgCfeSJql+2yv38/gcTWVX1rZOZGvvL2DD6
         CEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uSy3FrZRw8gmLEyii6mTZSygmLEpg8wok+O8ZlFeP5g=;
        b=ViNp4g6mSdAKtIlFDRFii5UO67KUGE9RsDyWWhKuhRa6Bv8QFkW/LTQkvV97RnaVjD
         sN5xuAWViORJ1MmBJw0GCuN7koeg71UnxfndAJLizTBoMf0FJF6Vr79npzHL727xcwW8
         y9VsmCDYTIkP9oyaohVfEk3t/8bCtomxvtW+DYpEHoT8Seqw/80mGWN0W1R8hxb7m8+4
         GSyYUgC9BQphqW/pLOftlObfkXld8o2mnFcud/o/lmWuAlKthZ4zsbyhCU2MbOdbsxsY
         BKl8Svx6IswBApoxMqiDxGSZjS0f1FpHdOxPo3kEeJrbMyvk+73uO46rvXleGXrezPx6
         khcQ==
X-Gm-Message-State: AJIora/1yYAh5tqwPsK1tw52eBuEtdP6vDIc89bagX9NqKHeD1NQkFL8
	t9QkPZ7C8uI6NyYZQQKxvOCcnfB7t1WVxJfV
X-Google-Smtp-Source: 
 AGRyM1uyuGbRFPUTa/VemuWxVCavsszB8udrsr78PP2eF/UeSVKJVa/+AsbLBvbztGOnsaJi6aiKOw==
X-Received: by 2002:a17:903:18d:b0:167:47f3:49 with SMTP id
 z13-20020a170903018d00b0016747f30049mr20806759plg.95.1655667334392;
        Sun, 19 Jun 2022 12:35:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/12] archiver: use bb.note instead of echo
Date: Sun, 19 Jun 2022 09:35:02 -1000
Message-Id: 
 <fd1ed873ec00fda2f58370770ad7aed039bdc470.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167070

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6420c8a6a8143f53ccad7ab2d56b2ba06db83099)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 9ef18ebd3c..80fa6752be 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -578,7 +578,7 @@ python do_dumpdata () {
 
 SSTATETASKS += "do_deploy_archives"
 do_deploy_archives () {
-    echo "Deploying source archive files from ${ARCHIVER_TOPDIR} to ${DEPLOY_DIR_SRC}."
+    bbnote "Deploying source archive files from ${ARCHIVER_TOPDIR} to ${DEPLOY_DIR_SRC}."
 }
 python do_deploy_archives_setscene () {
     sstate_setscene(d)
-- 
2.25.1


