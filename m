Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87626C77B60
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 15:15:42 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.104474.1680621335493378479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 08:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=C4PVY0hg;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id r11so33180723wrr.12
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680621334; x=1683213334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Naw72JmMme/il79jbGaPIqyuwDObjrHHUlFvtwriUQY=;
        b=C4PVY0hgNZRFnlBJkXyaEerwvIkjSmPg1w8cFqBtr6gCgCmFbPuiJsdS+MhD99612/
         BgxSybfIMlNnkHSG3fWxSyUkmC3R5fsmKp24rd2E5jM6aAo/mUHKM288j2rxc815DYA+
         3l8FSkhwHuLcjQ36D8hFm+WG0f55w6uwV8BizbfP6MEIfkegTXyyTPM8qbce4/VnC0Ei
         Oj4NGbCjbPfJaHMVbWk5pzrbf/f9SI07xdrfdR7GgUiBL6mCkgtp3B5N24XMQof5pcRj
         PprPdKGevD2zlhM2zbEv9v/5oULqA5Tll/IvpHEdqEUndIhJyIrYxCnPh7XNS7c3Adpd
         jRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680621334; x=1683213334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Naw72JmMme/il79jbGaPIqyuwDObjrHHUlFvtwriUQY=;
        b=5l6KPO49byschXquVN77TPLc/WQ+3HxPqWaugPVfxAUO429w5feMXdZFaBjWfxvAxf
         t9LZIYAlQpfWjNNffVJjuVYFI+BRxomssU4B1WWesFCAAZ7bfElr1xlI3giVX210k3/H
         HETu1ikyugITSWf3jTeauZPJCLddlS0IOTM21Tsr2K2Oc418z8kiXWOYetofsdsfjT6i
         b2TIcP8t4aWWdi1xhgIi3897rymv6uzjARQQHBV+lNCYw17vPcoBITA8AtOTNlOmsR+D
         iNOdlQzxMjBRrdciY10RqcXcDRZWDVmPgvQXI+YaIgm+J0CqVzrk14Y8rugBW+iwIqdn
         lArw==
X-Gm-Message-State: AAQBX9cfZy2JIkZR8e+GsDawA+l8+AylCYbuOikZIeq+4UTj5FxoTUSB
	SCnPBJ9A8URGv6OlLARI0RLf/V9C9PE=
X-Google-Smtp-Source: AKy350ZpRhVXM2j2hkGwJG9VuL0UZjNCRAr3KuotRiDa6iQS6DhD6Q85os1AQhIw1QSfShpBB2kNTg==
X-Received: by 2002:adf:fe46:0:b0:2ce:adda:f45a with SMTP id m6-20020adffe46000000b002ceaddaf45amr1611942wrs.62.1680621332122;
        Tue, 04 Apr 2023 08:15:32 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y11-20020adfd08b000000b002c55b0e6ef1sm12673879wrh.4.2023.04.04.08.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:15:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 3/3] uninative: Upgrade to 3.9 to include glibc 2.37
Date: Tue,  4 Apr 2023 17:15:20 +0200
Message-Id: <20230404151520.2078894-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404151520.2078894-1-Martin.Jansa@gmail.com>
References: <20230404151520.2078894-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 15:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179698

From: Michael Halstead <mhalstead@linuxfoundation.org>

Update uninative to work with the new glibc 2.37.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 51c0cdee43..8a5cab5360 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.36"
-UNINATIVE_VERSION = "3.8.1"
+UNINATIVE_MAXGLIBCVERSION = "2.37"
+UNINATIVE_VERSION = "3.9"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "3f15d420049b21854bd7a8843da0f42f17064559492c8b752d7a6f998ff5ea65"
-UNINATIVE_CHECKSUM[i686] ?= "a6dcf316d738ade2e5e463bd3b33a270b4bfc25bba41770ad5cbdc3b0e24044c"
-UNINATIVE_CHECKSUM[x86_64] ?= "5fab9a5c97fc73a21134e5a81f74498cbaecda75d56aab971c934e0b803bcc00"
+UNINATIVE_CHECKSUM[aarch64] ?= "de35708c95c34573af140da910132c3291ba4fd26ebf7b74b755ada432cdf07b"
+UNINATIVE_CHECKSUM[i686] ?= "adac07b08adb88eb26fc7fd87fee0cec9d5be167bf7c5ffd3a549a2a6699c29c"
+UNINATIVE_CHECKSUM[x86_64] ?= "3dd82c3fbdb59e87bf091c3eef555a05fae528eeda3083828f76cd4deaceca8b"
-- 
2.40.0


