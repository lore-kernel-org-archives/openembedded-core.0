Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F6BCD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 13:45:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8672.1779111899118486767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 06:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RA3WLMTf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45d96d21e82so1325823f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779111897; x=1779716697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBBoFY3FXROb5k+EOso24zU8FoqEhOWu6bI+dg50Ngo=;
        b=RA3WLMTfaIBpju8H4S4r2Rcz2L4cM4UqBKVFjbS3j9xmEJfrgHLkGKJzuG95z8aXoP
         Z5U2m6lV5ifeG5Qs94+IFsQeEANZSjEpTaSVqs6dYouwAtnNG1Z6P6ud9544fLUEuiST
         fbscEdovZOYqL8xLta3mZFjIbaWGvHZzB976U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111897; x=1779716697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBBoFY3FXROb5k+EOso24zU8FoqEhOWu6bI+dg50Ngo=;
        b=Sea2KSSVc02+N8CRbbj1WvTzz8F4nco7xkZ9PyM1Dr9NTUHobdTvBOE9/p0ToTFWQH
         M80sWH+FrWl+iKRImppKjKlaDhaFwZxdRUXpkYQVXlBETEXxjTbanRN7szOraF4CtAXM
         a+a6GlLYaouYRzVw1GXy1MnUWlKRB0nLICkZAecfNAd15GX6va1kGbavNOxVhrQVjdD6
         ja5O0YWCFi+i7k9w8yVR8BJArCJ3RVVcK25YOqjVBFYuQJ/G0Oa3nOK0PiLTpKgdkMOw
         6BMdSsmkWd4QP5uifHv1Ph80asLtjUiSN6IeEAgQMaNPXGVMr6AduoDP6exAu6yBuU++
         NNJw==
X-Gm-Message-State: AOJu0YzHx/6+fwzGUkGhSyL3Eu0/hbsMGvrrzwqF4fQNzm2DPSmBqK0l
	Lj4rgcYc8tRV82juCeaRrvuYbcZiOxOy1qFcmA6VHzf/TbOsJOX8vAGrrEh6P580yML4VsS5loS
	Vn8ZB
X-Gm-Gg: Acq92OHATC59X9/wGSlINgrjAhM5UhflP2CxyixzU+0jyM/ULEMHCt9wG1pTCIHQDGs
	7iCf1FwcfeTlDrp5LRoHofVhf+7OsjOL0V8R96xkBVRLAZEjAR8LLoaNeVCJsWdyBnzAB3bBPhT
	t5gfYkvubi4VwMjP2+5u8WVwTUnOGzYzQFb3ZDCUnFwN/vDyZ3A9zs3vh1RXTKRspdm/BbBBqpB
	bO/Rcaexz4chKWSLd3bzggzdVwfkVb42o6EA5U03IUetdBQmvPMdOFkYppJHYEo9ZAUdxuRpOtX
	sJtOa99bLmCXpiRu1B2UbJQ2HMDPAnCGL1S4HPCIKq/y6WuZrFf76DLzBNqXRUdudBT/SK1jpZj
	t77ejaaUluzJmkLYoSRgjTFEUzAAJVwLjZbCMxao17++DrwDgCDRTgkmsZ7u+TTN3Y8Xhr0cRTm
	1URNT048AsVFLdKRl9DNje1DqDyK5+o9pInhp4OAhkiqB80YN/X/k=
X-Received: by 2002:a05:600c:5296:b0:48a:65ad:1881 with SMTP id 5b1f17b1804b1-48fe60ed846mr233955655e9.13.1779111897113;
        Mon, 18 May 2026 06:44:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c0c5:308:9c51:e911])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fffb9aac4sm252510305e9.9.2026.05.18.06.44.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:44:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Update to use blacksail release series name
Date: Mon, 18 May 2026 14:44:55 +0100
Message-ID: <20260518134455.3568809-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 13:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237246

For now we remain compatible with wrynose so just start the transition.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/layer.conf | 2 +-
 meta-skeleton/conf/layer.conf | 2 +-
 meta/conf/layer.conf          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index ff14960bab0..40b6b6910ad 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -11,6 +11,6 @@ BBFILE_PRIORITY_selftest = "5"
 
 addpylib ${LAYERDIR}/lib oeqa
 
-LAYERSERIES_COMPAT_selftest = "wrynose"
+LAYERSERIES_COMPAT_selftest = "blacksail"
 
 OE_FRAGMENTS_BUILTIN:append = " selftest-fragment:SELFTEST_BUILTIN_FRAGMENT_VARIABLE"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index a36211a8c9a..94909d51205 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_skeleton = "1"
 
 LAYERDEPENDS_skeleton = "core"
 
-LAYERSERIES_COMPAT_skeleton = "wrynose"
+LAYERSERIES_COMPAT_skeleton = "blacksail"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index b097c34c7ba..b91ce3e4371 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "wrynose"
+LAYERSERIES_CORENAMES = "wrynose blacksail"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core = "15"
-LAYERSERIES_COMPAT_core = "wrynose"
+LAYERSERIES_COMPAT_core = "blacksail"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 

