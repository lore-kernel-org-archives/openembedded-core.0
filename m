Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA93ECDDE7B
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:09:50 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.7152.1729685383999615811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ku+B7OlD;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb561f273eso66877811fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729685382; x=1730290182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbUEyv1tUGXvnPXjxRsMUGWJzkeQiFr2o3OYlT3pEJQ=;
        b=ku+B7OlDiPXsRkBWcPWp42ktJ6QO7hJba5BwtmTgvHbOgA3GfqnkJeBEdogfF0UCYU
         p9Z7zLerxKRBmFvhanMmwSxbRZXzBh9ZmUgQpfb6xI7W4eOueWxywxUdCIezHr210NP7
         GOnM4B/NO69kNrwP6rFjRKV3epWZhQK2kt9bLcNHciGY89nFQI3RkmIBsVMa1gJtEbZ7
         KRIRJNuN/GomQyUgBiR55GRAN6/CEX1nuh3wyaHA6aLCMWdA7vIyQR8BZFIt/gwc5Pry
         HWDwDFf6CwjEjrYpqzr7eO8NCe8zjsXGCVj+R5p1A52aWZutbfjC1spFPdPE8CXv/qtF
         W3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729685382; x=1730290182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbUEyv1tUGXvnPXjxRsMUGWJzkeQiFr2o3OYlT3pEJQ=;
        b=nwqgiQ+9c+rU9T2UrCEOrjq9m+z9Bf0xBnyQCP/2A8pk0hAmZ2akZeQWM1w6nWRqAc
         EDnCRH5FoKQLrNjXfOPloo3HlgsI8GSGqy+SjIRs8ta8faKZqu/Ku+k5wR3KCtZpg8Nd
         HbiJ6/6rYR6qMBu39Ycqvm8WxR4ieoGOWgLho+li7BC+rbet54DKstgKXXcUDod8T8sh
         w0a6A15gN2lh5stqGaKsUgb5qshQpGO2LGZvMrO91B/tLV7KIzQ/HAYkxkDJCQ7kL6gU
         b9gqcwHQ9zgV7FCUaTxeIRHV0he19EQ19DhMNRajsbZFOLDr2kNiUaQUoko58LSZ+Wcl
         7UAg==
X-Gm-Message-State: AOJu0YzJYYefOxbcw+VuAUHdySpG3peB5MRYsHsmynY0oLIhhDb3Cfc7
	hEpANn8Ax46/IAjfcm05m+hFocR65Y4R/DE+bnx9aLHXQiF55TjHxopmO96QBjzmKBgZbV2Zoqo
	Huic=
X-Google-Smtp-Source: AGHT+IHlUAL/VDDOXSFV9ylci81sOgy+6qiGRXzj9mmzV+kEUb+gwPXabeHLnzDQ4AcEJ3UVT2CFbw==
X-Received: by 2002:a05:651c:b21:b0:2fb:403c:268b with SMTP id 38308e7fff4ca-2fc9d5fe0cemr10312871fa.34.1729685382050;
        Wed, 23 Oct 2024 05:09:42 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae25d87sm10763801fa.139.2024.10.23.05.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:09:40 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v10 9/9] oeqa selftest wic.py: fix missing ext4 image
Date: Wed, 23 Oct 2024 15:08:39 +0300
Message-ID: <20241023120839.437771-10-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023120839.437771-1-mikko.rapeli@linaro.org>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206210

test_rawcopy_plugin fails if machine does not build
ext4 images by default. Make the ext4 image build
explicit in the test. Fixes test on genericarm64 machine
which defaults to wic image only.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 9b09be75ec..972fffe6f8 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1180,6 +1180,10 @@ class Wic2(WicTestCase):
             self.assertEqual(1, len(out))
 
     def test_rawcopy_plugin(self):
+        config = 'IMAGE_FSTYPES = "ext4"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+        self.remove_config(config)
         self._rawcopy_plugin('ext4')
 
     def test_rawcopy_plugin_unpack(self):
-- 
2.34.1


