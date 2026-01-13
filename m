Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43211D2F357
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 17:58:14 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65235.1768327086935198260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 09:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wfZkVPrU;
 spf=pass (domain: baylibre.com, ip: 209.85.219.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a288811a4so75729716d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768327085; x=1768931885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fi9/1T8iXpuwCyl0pvF2TeKQ9O1lKka5iMdkD4hw2Jc=;
        b=wfZkVPrU8hk+rERPyNlES6vWVNIOMZHct4QnWpF/LRfumv1nqJqiPB5Pfb52rqGVF7
         B0hIgMss6QrVc2K89hGdzlV8G2ltVhy50zqyQd56qjLkbjUgurP4TFCLWIVq1+q1hMP2
         59F6uLf9GJn/oVzzqREfwlHSUDgB2MWoL/DYD3dc9SxDw7DxH7EYLQWWUGkTMJO5U2Te
         3TXlDkxZ/iS3lY5GnVetLLWx/b4Jky1KsgqOWW8BawCNvRjaW4DqLTMrwps0OcpG3lLB
         Tfnom1aJKwNe4NB6/qUEueIkxGe7G1l7PO7ad2jTa887toe2oVsDShDZ9sFel4VtBI6i
         rtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768327085; x=1768931885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fi9/1T8iXpuwCyl0pvF2TeKQ9O1lKka5iMdkD4hw2Jc=;
        b=MRRAxfSxdgu16Zqio2o4P5yT0fq4vBfamxQfQO7l+W1GEVp7+wVuAmyIWZ7GdaKdQb
         z+Rh2qt/qwu/x04L5VRIY/DomcR20IzM5ASjIaDPdY0oTsJ5IjWxXgOXTXicTmpFyNF7
         J9K1/N04fkizSz15XGuKHY1iTCOwNwr/nwfPlF/r3e2bKS5m2efFy57ngxJ0ALTibjzN
         DAdNKYQlpsCM1Y5AzyaJLnzu8J2EOjzEmRRpAZzQqGR5Sn8m9cpwvspKKKRgaTBsQmJl
         GuEev7QUar1Ljw/wzHPtQp0IQ0nb4NVlgng5g2QNNuHmIyeDOgQHeuF45OEud5FT7n6U
         9jog==
X-Gm-Message-State: AOJu0YwyZ14UXbxFH55sZUaAFFrPNH4JMIaO8xE4LaxmZjDcX9Ir+9Ln
	O4SO6k/bqi+6Vn7JGNlyasr1lrinZWMOaMzoJNGYxVUPK0PTm6lGvzCvr0hz4MtIIyiPLdP/G2P
	wWeJ+YX8=
X-Gm-Gg: AY/fxX5rMotC20Yhel2JpUKCkJ/IPMm3HvtYWFOYyS5GcFWJ91EHbSY+KwE7IWfMHsk
	rvTbplXNpV9guTsM2crvrZbJkceDpnZxzN3xiQGNrC5LffBlREA1SQfQYmL/vzt3gIyfxueWbYD
	OLUz6rvEppNonPYYWraE0Egh9NnwYsxKnbZYgH9DLWXBCptBGWf8/mTz9QUJ4XMVdsUlh1YO3DB
	jrOA0UNoqOCU8YcbwceAF+kvz2vElFfquqQPQ6Tkg6Wn6S96Sh+Ed/OF9NRluJ78XHSo9r3l4kt
	z+PvsYtpUO9A3yQB+vZRX1W8Hn2omce5OCohelHwR+Bv3oLdAyS4fnlOP/hpLOSdjZRUkVMPQEz
	CsnC/DN9sqNWjoDnjLGLCPW+oV0NSW9PDweSiXjaLzfY3cdFfN12W/V5oCEQJQUQsomUqj3HoRp
	nD193I0wWtoCOVFyU=
X-Google-Smtp-Source: AGHT+IEoJCvT11qGqS2rbSdyjYlbPZ1GR9ZNWV6ItGWMYWjkbGcGrEnhbMq+HQUf0DXsCuEHej5OgQ==
X-Received: by 2002:ad4:5c6d:0:b0:888:883d:ee7c with SMTP id 6a1803df08f44-8908429462bmr322833136d6.58.1768327085181;
        Tue, 13 Jan 2026 09:58:05 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907726fd1bsm161605666d6.53.2026.01.13.09.58.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:58:04 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/7 v4] python3targetconfig: export _PYTHON_PROJECT_BASE
Date: Tue, 13 Jan 2026 12:57:53 -0500
Message-ID: <20260113175758.1409859-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113175758.1409859-1-tgamblin@baylibre.com>
References: <20260113175758.1409859-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 17:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229282

See: https://github.com/python/cpython/commit/2950bc50af8f

As of 3.14.0, Python's sysconfig module looks for _PYTHON_PROJECT_BASE
to be set when cross-compiling, or otherwise it'll find and use the
native interpreter's paths when calling get_path() and filling out
_CONFIG_VARS. Set _PYTHON_PROJECT_BASE to "${B}" in
python3targetconfig's setup_target_config() to help avoid issues with
incorrect paths in rpm and other recipes that depend on this class.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/python3targetconfig.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 08bc619398..2877665737 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -12,6 +12,7 @@ DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 
 setup_target_config() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        export _PYTHON_PROJECT_BASE="${B}"
         export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata:$PYTHONPATH
         export PATH=${STAGING_EXECPREFIXDIR}/python-target-config/:$PATH
 }
-- 
2.52.0


