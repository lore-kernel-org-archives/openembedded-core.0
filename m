Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9804C43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:45 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.64035.1656877120499272683
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Kyw4VEDv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 23so7110136pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fZ3dnj7svyLqhCRESYHvgOKNBzlEw0nVO4dwCWeYygk=;
        b=Kyw4VEDv4ygjHXd4kS0KGm5QLgZxlpsc4G9IZXk5rdOaapVNzdhjIllmyqlnNtDqX+
         U/25KDfRsVAoyyDOaQMrajQ9AIS2ka9U/QXI5STLMOZtKD/5RUi1sjwsDbKlnW/stVr9
         izi3TaGBOgtN4eHayrr0GeUVlxgDjSEa2CrOyGxnWmSo5LIu0T+bfqt7/0fTIczPb6Ad
         XZkCjh4C/HBQddhflQiRvGpeibxb9chnNZ6th1j5l5z5nbveK9IdNZJ95jcZevmErCvf
         ccJN99lfaMbq12HtgGA0+CKSLZRklpRKxMoO8nk38GtULjIGJ0FK4IIwm/hh+LfjvJEv
         kPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZ3dnj7svyLqhCRESYHvgOKNBzlEw0nVO4dwCWeYygk=;
        b=czzHYmYWK/SoLXbN86jmi34bylRazR86Wm1xTmHKKEpk/1ZdPL2OTTtfQX7PBmhEfj
         5HX9I8QcSR6bSRCSy5umgRCJ1WBX1TtGYj7mPu1olJkKnxEXfSXgNAF3n/cjOAXHIv9F
         s5DuxNeiAACJE9fFkDYz/owUhjdj8pBlfkGeDDYpSyGxkv0tiT6eJmWYZ91M8bSKWMtN
         B9+tXPeMTQzU6UJKd5areCDXxlLpVMZeucPKFkxTeYYwk+bUN7wgYoac5du2mmyv+UNZ
         GhFp9aIByNn1ieYr62d4PXqk0avbJAEp51C6qI/ywHE3mEy6/Yio5Z3Y2KwYFjTYIGhr
         4BYw==
X-Gm-Message-State: AJIora9va+CPy+gQKkgNiS4L4jfCwnC1Algipdb0qWUBGrAVz9n1eVVu
	Thm721GzrGig0+/die+tkJ+zIKDHL075x/HQ
X-Google-Smtp-Source: 
 AGRyM1sKG8dWKfO2TbRxj5bjnBJiBhLrn2+yzirieCKuwUMGFGIVf50nlm3KPVKVitbLuWRYPBLzKQ==
X-Received: by 2002:a63:af59:0:b0:40c:a49e:7104 with SMTP id
 s25-20020a63af59000000b0040ca49e7104mr22525175pgo.279.1656877119321;
        Sun, 03 Jul 2022 12:38:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.38.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:38:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/30] oe-selftest-image: Ensure the image has
 sftp as well as dropbear
Date: Sun,  3 Jul 2022 09:36:03 -1000
Message-Id: 
 <d6344cca6c76f0f8a89b576babe2ce36ce5ed049.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167588

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We need sftp so that scp works with recent openssh. Use the packagegroup
instead of a direct dependency to ensure this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b76c8e5fc8802bbe54371119e6bf6312bf2a8ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/recipes-test/images/oe-selftest-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/images/oe-selftest-image.bb b/meta-selftest/recipes-test/images/oe-selftest-image.bb
index e295943ae5..317a0712aa 100644
--- a/meta-selftest/recipes-test/images/oe-selftest-image.bb
+++ b/meta-selftest/recipes-test/images/oe-selftest-image.bb
@@ -1,7 +1,7 @@
 SUMMARY = "An image used during oe-selftest tests"
 
 # libudev is needed for deploy mdadm via devtool
-IMAGE_INSTALL = "packagegroup-core-boot dropbear libudev"
+IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-dropbear libudev"
 IMAGE_FEATURES = "debug-tweaks"
 
 IMAGE_LINGUAS = " "
-- 
2.25.1


