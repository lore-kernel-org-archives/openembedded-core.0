Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36F1D21257
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:46:43 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.44644.1729154802226368732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FVnYhj9z;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso596616e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729154800; x=1729759600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+IUGIYMQy4+I/TNl0353Ri8Nl2uMqB664dTz+MuZ3s=;
        b=FVnYhj9zXoD/j7mUxmtR+GS5KEh8Yly6n5abglKQUuTmG6CN1nz/1SYvn3yIS3+HUe
         vqC/pZ6qMt2izT7mGrOuq70VjN30WLB8kVw7vpMQiLJKGToASgF7jB9aSpyE0dNAIMpy
         qUxK4lMSc4r1RNoKl5b1smdY6/0GniqakRA+LRQTIR3ny2JB/xWg+Cbr4C/N7dJG6AWc
         b2BzFW9t1mgtIaN4Z7mtAowtvrhj0DnjFy7l7ohhqOqIwaJPo1JZzpEKT8xWNi783uSJ
         CFsGscCbPCE7JsK891Jxe5yWfGfYZG4qPvRZ1wwwMTSwR7NClBFHKjx/L7uXb9BkQKf3
         MT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154800; x=1729759600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+IUGIYMQy4+I/TNl0353Ri8Nl2uMqB664dTz+MuZ3s=;
        b=LGkf9A55BXeOWR5byTa9w8fcFJTXBWHl6bU/88K9upyOgJsjPZDZLLt11RbUGaJppE
         dV2zaF/xM6puGAHtv0NtkFG6nKqjgI+T/8W950y85/bCTN3oekWrqzQxUX7PXa51WIIS
         cB1kzfzuOs8kNGCt3Qw4D6e4OQLcMcOkU+myU5pxtXGIgspQm5KX64Ult0oYcGP0uhEN
         TyqH+vnsGTv789E95jRZfHLY9s0hyvG8x9PoQc4zJrsHGmuju0GJytgXfqEc3EtAHSuP
         m2UohnB4LP6tinRqzo4JsEvR0DtNvWesJRcrvXr5loN0eAP44JUnCVzk+t8EK3/ygXPT
         DEOw==
X-Gm-Message-State: AOJu0YwFk9oOHaN7+zRyo2kMbvRyzW69Rls22OGWVg/NxtxkfsxrItvf
	AY3AKTZLBfcm+/d1/C9co7g8BdUpHKarGIfgK1q6RRgggtjCSrs6AqNWE9IDgYzdb3HzkpGCS7W
	cVgQ=
X-Google-Smtp-Source: AGHT+IG59jnqD6P0ih1DeIgAcCORWPDPvdiLFWy7OADF5wzxt1xTGklmiyDJp9Ab2qC5154v4qxTTg==
X-Received: by 2002:a05:6512:3c88:b0:539:f23b:59db with SMTP id 2adb3069b0e04-539f23b5b96mr8624056e87.5.1729154800280;
        Thu, 17 Oct 2024 01:46:40 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8e4asm706138e87.55.2024.10.17.01.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:46:38 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v9 11/11] oeqa selftest wic.py: fix missing ext4 image
Date: Thu, 17 Oct 2024 11:45:52 +0300
Message-ID: <20241017084552.182136-12-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017084552.182136-1-mikko.rapeli@linaro.org>
References: <20241017084552.182136-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206006

test_rawcopy_plugin fails if machine does not build
ext4 images by default. Make the ext4 image build
explicit in the test. Fixes test on genericarm64 machine
which defaults to wic image only.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 664d1aa427..43cdbc7e31 100644
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


