Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B946EB7EC9
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:43:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15038.1772621033748849336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PCqZfu1H;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so81320525e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 02:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772621032; x=1773225832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFUXLSzwiy/UnmW/n5AFF2pewH8CYf/u9tCOcT3PXQI=;
        b=PCqZfu1H/yxyTmHbe6CK/Ka5Yj7jynnCbiqvQwLCR03kWW48FhKJ9Gp1bZRPT2Q2DJ
         WYrMBxI2jwfPAqGkT2327RioKbmzaAAR6aVDwQTbtPwW7QFvvtioPcvNhKLfNaFaMAsq
         J9MxYfhg1GcJTD3lA4448Qz8rCQchGrTfSRVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621032; x=1773225832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SFUXLSzwiy/UnmW/n5AFF2pewH8CYf/u9tCOcT3PXQI=;
        b=BQAJ9GQfjnZqd+pOnNhTcDLdTD+n5pgjW2tJCcKdAzQbOkVcPOXqh5lvAOv6IgivpG
         QyO7ZqXomnvGTK+C0TzFxPAD/wJ7N8Z4EDpl3lNNOndAN4GaAxdG/0NyzfJnAkWuVq8g
         PnUkxHcSsWWk52A47bqfY09OwMQlLIwZuKCG//U2XwEbxAx2yT7xedeLN2MUSjnoF+IX
         I69QPyEVRUO3m1Lb7djrrBh1fxMkf1dGQY3oOgH7uYuO0UpUUHs2bftyTKR0AqKoObIO
         Z/N8IbjmFHr+JOtw3FAp3mLTL4NsI5KBaYlyuTsFBkDcJCt4rX9i2W+Z4OZNL3RsXuNY
         ZyiA==
X-Gm-Message-State: AOJu0YwR7HdN3Th4ZgdQUoEyPHlqDu+gpkAq9pXjJPZe0DGD3Rqw+PVN
	yFVLoCPtkFq5C7FaZEcWgvfSivPZfEcT8Yoxio6mqly+K+zGMiCBV/Dqhy+uyqRpegpNwkQxzkl
	v6+wPgnk=
X-Gm-Gg: ATEYQzxpoYdzAXVOAA18ElATL4/o3hfi5Kg+nPsb5JoDZ4ut27tKRZhEr22lIwbL507
	+6lgJJiV7ZxFEGExJIxZ5u6TSjcTbDfi3FIwVOGVvLLzYbclVONbkcPOLeZA1e4BLQey/6RbOow
	CAwCCNuKSkGQ81cIdGl9rQtYosb6tQiv37FaqmKsfZzsL0A0H53RfVuvpPihdC3AsqTb77rdjER
	zKkC+hbTfRBDIf/sPggymmlpa32FY3gXuk7DLBXEKMNVIjITe6ZfDsTVh//VsUIqktGWsI7CFAw
	Vqzz38YQuoV7g9BmR9fV1cT2KTJS9PaDXmfP4nBVcruso5pufrVoJmhtcH8RAv/B29K3mNBQ8oP
	qTS+OSCdMJVxo62Zi6D9B5oMsJDBulKqOkJbJwA+Musec0K445/41DJsHJhr6XhAstwOje9iMGt
	eCSdnUonBddX/K71dVC+GBcOpWr3PXYNrZ0XdT58YlQ7GwlVtUzh9E1/550ZFPAX7r91rzaSD9j
	SolDBaR7ueIFMjHIbk30LyBn8VI6ISc
X-Received: by 2002:a05:600c:1d26:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-485198310e2mr27012875e9.5.1772621032159;
        Wed, 04 Mar 2026 02:43:52 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b34b6252sm25638168f8f.10.2026.03.04.02.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:43:51 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [RFC PATCH 2/4] layer.conf: enable test for revision alongside a git URI
Date: Wed,  4 Mar 2026 11:43:40 +0100
Message-ID: <20260304104342.869457-3-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304104342.869457-1-corentin.guillevic@smile.fr>
References: <20260304104342.869457-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232371

As meta is the main layer, its recipes should fully comply with revisions
for git URIs. Enable the check for this layer only.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index ba25ca3029..1f95867165 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -19,6 +19,9 @@ BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 # Set a variable to get to the top of the metadata location
 COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 
+# Raise an error if no revision is provided with a git URI
+ERROR_QA:append:layer-core = " missing-srcrev"
+
 # opkg-utils is for update-alternatives :(
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
-- 
2.51.0


