Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3247C4332F
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 22:18:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.16202.1633213087703810460
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Oct 2021 15:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H232Dwa5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so14514962wmc.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Oct 2021 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=35qh2A3RdE4/3N7MIyEohrcrPlfiEZqVHgxStv9Z89E=;
        b=H232Dwa5GO615B3kwmolda1/5ExB2udez4dHUU3/43xwLX4wzTKjlQdwYAjUk0G2eF
         +1/bxZ1oyRxGIGl3d8lDI9ceK5a+WXkwdYH9I3ozCgbmNkP2Q+4/RtEIBFntd8xiqYyq
         LcxeU0AP0c4vBjdIO5CbcdhEs1lNa/twEluQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=35qh2A3RdE4/3N7MIyEohrcrPlfiEZqVHgxStv9Z89E=;
        b=C9C2cR7yoNRl2ioripuuxi7lEbs6aGfHjywte0HqAGVYN+sCWai2/8Hh9PoHvY+o5Z
         Z8LeNynSn3TKXUqNOsUF4wSskI3+/2Q1qDBE86l52wp3D4j/OcQkricG8hWT+jPmKWCn
         r/J15aTVClhugg4RcENhBMlza+z75vR2lwwXoP0wqLLij9FRK583AM/nn8puVY1jAmZy
         MAWmD9hfb3f9y3N141ZkQSeTGxRJjRVQfNN8YQG3v+7g9DNa7ykQCDKGbIbcanJNOHxj
         1r6HUZvcapUl4wAVcvaqShrTmwNyHDhkRiRMKVRB6q02jH1Eu31I0bi3ciAGQXEf20f7
         CNNw==
X-Gm-Message-State: AOAM531ZScrrMyv3cPDYE03YmCIYx5zo2XPMDVSZG2UomY7qxKUcAWMH
	D2CLdCTxhf0IQj3pK9FjoGlbJMSmvsXWk54h
X-Google-Smtp-Source: 
 ABdhPJyJs3oH5pw2d8AYe/25lR5e2+jxgL0jCAX+KgOc4oQeW3xiZG8R2zL2LkllywffpleGUkeqJQ==
X-Received: by 2002:a1c:2309:: with SMTP id j9mr7781247wmj.189.1633213086149;
        Sat, 02 Oct 2021 15:18:06 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8657:7fac:b2bf:59a6])
        by smtp.gmail.com with ESMTPSA id
 z8sm11172777wrm.63.2021.10.02.15.18.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 15:18:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] image-artifact-names: Use SOURCE_DATE_EPOCH when making
 reproducible builds
Date: Sat,  2 Oct 2021 23:18:01 +0100
Message-Id: <20211002221803.2283254-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
References: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Oct 2021 22:18:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156541

Using DATETIME means the deploy output is not deterministic. Use SDE
when using reproducible builds since it is consistent for given input data.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-artifact-names.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image-artifact-names.bbclass b/meta/classes/image-artifact-names.bbclass
index 3ac8dd731a6..df9e17c6b0f 100644
--- a/meta/classes/image-artifact-names.bbclass
+++ b/meta/classes/image-artifact-names.bbclass
@@ -4,7 +4,7 @@
 
 IMAGE_BASENAME ?= "${PN}"
 IMAGE_VERSION_SUFFIX ?= "-${DATETIME}"
-IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
+IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME SOURCE_DATE_EPOCH"
 IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
 
@@ -13,3 +13,10 @@ IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
 # by default) followed by additional suffices which describe the format (.ext4,
 # .ext4.xz, etc.).
 IMAGE_NAME_SUFFIX ??= ".rootfs"
+
+python () {
+    if bb.data.inherits_class('reproducible_build', d):
+        import datetime
+        d.setVar("IMAGE_VERSION_SUFFIX", "-" + datetime.datetime.fromtimestamp(int(d.getVar("SOURCE_DATE_EPOCH")), datetime.timezone.utc).strftime('%Y%m%d%H%M%S'))
+        d.setVarFlag("IMAGE_VERSION_SUFFIX", "vardepvalue", "")
+}
-- 
2.32.0


