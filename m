Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D15C433FE
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:37 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.20023.1637901396457075624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F/RUTc1C;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id s137so7063599pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6jLkv//PEfv79VGc1qi0lbHc2P+fX5z5r1nuqZ8uXEo=;
        b=F/RUTc1CYl7sBTl643XGywGDJFhl1Fnpvew5M6EYcPCYmfNWjzrYk5AN+Wy5/cONet
         sfICMJ008XhiCvrGak2jjyeqjgG81QSJAX6PLvvgT1r2tVq5+Izgt+YZueTRMFcjqrD8
         JSGvZ+D9eO1JPSH0ACKLS8p6Z7flmvbfJ+EuAvgV9s4e+hUDurVxQSCrY49VnP8EsYDk
         2DNqKQ+fz5FLS6DvkioJtr57g3tCyXoLX+HgX9R6GkFFAaFw4y5SHb+BYFLNQ+y+hJfk
         hVF1CYYVzmiheQbfqIPZhVp46IGGRJgQ6iCDJrUm1QItUQHbqIuIFqWO3mVX412qRUiV
         f6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6jLkv//PEfv79VGc1qi0lbHc2P+fX5z5r1nuqZ8uXEo=;
        b=OOYLvLmgyXnKHT6T4Y+mSEvKIVU+ktMU+fsKUT+1XIUxTFPH1jIVYhfNBCWhTZSxXi
         sEcMu1MtxXmNQd/Q71b/DkxYjtprwEkx4+HjQkK9VC+vfMKxk8Dc9Et0TL2W998p5hPI
         NrFErgK2EXmf/Cf6iE/yPZiFjVcIsWr95sAzwUDQr/NIkLXiYK2dHy2rrc+b0Enfg/6N
         yHXRUNSFL+4LPLnt+riwXReet/1KrSknmpspzhpVGNc30IucpTG/2k8q/JbRIfAa8rY+
         XUJ7ZVce6n9YGMAm3K+xXlud4xIJhG+Vi67Kw+BA/oaH7soTw6Uee2uqA27z4CnpczNr
         qA0w==
X-Gm-Message-State: AOAM532ULKTpHAy1iJWlzUSm4shGCnRibdqBJ62xoX638K+6n/dAldHP
	QFW4fy0pFyCWancs1Xgv3uCHti+exnA=
X-Google-Smtp-Source: 
 ABdhPJxHYLdPkExJuoQTLblQ8u0tYI7qPUuO2JlcIyqzrMR7OEeKp6zBBIOBciE8MyRlzsJHQg48KA==
X-Received: by 2002:a05:6a00:10cf:b0:4a3:124d:bb81 with SMTP id
 d15-20020a056a0010cf00b004a3124dbb81mr18928860pfu.75.1637901395419;
        Thu, 25 Nov 2021 20:36:35 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:34 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 25/26] python3native.bbclass: distutils -> sysconfig
Date: Thu, 25 Nov 2021 20:36:04 -0800
Message-Id: 
 <aeca252e09c0ef75c1c41ead9c280055cd4df0f9.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158821

In the comment it says we patch distutils modules, but we now are
patching sysconfig and not using disutils.

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/classes/python3native.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index 13fbaa5f9c7..3783c0c47eb 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -4,7 +4,7 @@ PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
 EXTRANATIVEPATH += "python3-native"
 DEPENDS:append = " python3-native "
 
-# python-config and other scripts are using distutils modules
+# python-config and other scripts are using sysconfig modules
 # which we patch to access these variables
 export STAGING_INCDIR
 export STAGING_LIBDIR
-- 
2.30.2


