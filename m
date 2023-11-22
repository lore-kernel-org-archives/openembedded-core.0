Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CC0C61DA7
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:18 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.18439.1700657116892995830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dmu8Z8jg;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso915268066b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657115; x=1701261915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mc4sO9tD2TOemG6NsC4zxLJijiMNYm5Btq3woQe7tc=;
        b=Dmu8Z8jg3da4JwMZIaPDTy4fx1nxOJcVukKitr5GjBfngn3AjzBgiPHBJVRm4405cb
         SbtydGJ19tU5IteEv93KbBqHuaIJiHnCpqf1ZGjaNdh2227f9d8QnVTfPPOeaxzTIGHv
         tVb3GT3rpTWgDDmPYqP0MiHYG8m6xxOfzUToXLQjyHb8q7wBooBtLcor6dmEFlvG5VkM
         P2WuP4HPSNa2gRygUKh0gVU53P9ZANke56g7jSHrbcZHNKes9UyLKLUbJcIi1JrszWJo
         TyUaT6rjTgqOLA6EKe/2UjduEy0DnsyHKq6Iu8rTt9TmHaEl3tPlEHsU8zQtKB3Oi5dU
         Kyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657115; x=1701261915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mc4sO9tD2TOemG6NsC4zxLJijiMNYm5Btq3woQe7tc=;
        b=NpLmD47yGt2mh0rKBG0hwwZvA5lBBV/LjP8zSAUezzSTjDZLuyMQBYQJHCj71GHCbD
         VA1mxAvpSJjgPNWdEGEbH6qtB3iOEZ/u5V9XBr50xbf8pRaHo72anuPcKHcXHZV9gpyP
         HgMik0R+2KX026OKwPXZQ3b3jXVBiacLvMluHWLDhCAQPmKgllJqehxqbl/uXPZOZFm8
         SmLndND6m1w2E5UAwXaocFTOkGCunhQClk6aKToQ6j/rF6l5bxOkKafFT46u/TDxAWjD
         QM+jmenIcPlPwOUGsrN1JzNywZ+WERd4G69nHjo09TB72tTvntYIjf4YVrUNLVnHXcMZ
         qC9Q==
X-Gm-Message-State: AOJu0YxV+kUMcsj9WBw6E6C3dub4BXJat6xxb4UePJbUBMXu7CVrl2Sd
	dtbIxdqAtwad8g17aN/RBXkqjk/0Tjs=
X-Google-Smtp-Source: AGHT+IGk1Jd0nPeybYntdW+I5y4BKAT5+jLsUreG8dwBOKJwGdn+f8mbqjfhV5716M2qIsBiuCaDGQ==
X-Received: by 2002:a17:906:12:b0:a01:f06b:77c8 with SMTP id 18-20020a170906001200b00a01f06b77c8mr1376951eja.2.1700657115172;
        Wed, 22 Nov 2023 04:45:15 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y5-20020a170906524500b009e6cedc8bf5sm6548449ejm.29.2023.11.22.04.45.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/21] image-artifact-names.bbclass: add IMAGE_VERSION_SUFFIX_DATETIME which uses SOURCE_DATE_EPOCH
Date: Wed, 22 Nov 2023 13:44:39 +0100
Message-ID: <d6a2d93535fe596cbf94f7b7a6c6223030651c43.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191086

* since https://git.openembedded.org/openembedded-core/diff/meta/classes/image-artifact-names.bbclass?id=abb0671d2cebfd7e8df94796404bbe9c7f961058
  which removed the
  bb.data.inherits_class('reproducible_build', d)
  condition this was already applied in all the builds which used DATETIME, so we
  can move it to the default value directly and DISTRO configs than can choose
  to use IMAGE_VERSION_SUFFIX_DATETIME as they want

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-global/base.bbclass                 |  3 +++
 meta/classes-recipe/image-artifact-names.bbclass | 12 +++---------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index ac84312a87..755d10106a 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -207,6 +207,9 @@ do_unpack[postfuncs] += "create_source_date_epoch_stamp"
 
 def get_source_date_epoch_value(d):
     return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
+def get_source_date_epoch_value_datetime(d):
+    import datetime
+    return datetime.datetime.fromtimestamp(int(get_source_date_epoch_value(d)), datetime.timezone.utc).strftime('%Y%m%d%H%M%S')
 
 def get_layers_branch_rev(d):
     revisions = oe.buildcfg.get_layer_revisions(d)
diff --git a/meta/classes-recipe/image-artifact-names.bbclass b/meta/classes-recipe/image-artifact-names.bbclass
index d0f1b0dc55..2d18f34c9c 100644
--- a/meta/classes-recipe/image-artifact-names.bbclass
+++ b/meta/classes-recipe/image-artifact-names.bbclass
@@ -9,8 +9,9 @@
 ##################################################################
 
 IMAGE_BASENAME ?= "${PN}"
-IMAGE_VERSION_SUFFIX ?= "-${PKGE}-${PKGV}-${PKGR}-${DATETIME}"
-IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME SOURCE_DATE_EPOCH"
+IMAGE_VERSION_SUFFIX_DATETIME = "${@get_source_date_epoch_value_datetime(d)}"
+IMAGE_VERSION_SUFFIX_DATETIME[vardepvalue] = ""
+IMAGE_VERSION_SUFFIX ?= "-${PKGE}-${PKGV}-${PKGR}-${IMAGE_VERSION_SUFFIX_DATETIME}"
 IMAGE_NAME ?= "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
 IMAGE_LINK_NAME ?= "${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}"
 
@@ -32,10 +33,3 @@ IMAGE_MACHINE_SUFFIX ??= "-${MACHINE}"
 # by default) followed by additional suffices which describe the format (.ext4,
 # .ext4.xz, etc.).
 IMAGE_NAME_SUFFIX ??= ".rootfs"
-
-python () {
-    if bb.data.inherits_class('deploy', d) and d.getVar("IMAGE_VERSION_SUFFIX") == "-${DATETIME}":
-        import datetime
-        d.setVar("IMAGE_VERSION_SUFFIX", "-" + datetime.datetime.fromtimestamp(int(d.getVar("SOURCE_DATE_EPOCH")), datetime.timezone.utc).strftime('%Y%m%d%H%M%S'))
-        d.setVarFlag("IMAGE_VERSION_SUFFIX", "vardepvalue", "")
-}
-- 
2.43.0


