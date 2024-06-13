Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F43EC27C6E
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:24 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.9999.1718288479560618954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eOxt+3Sw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f6a837e9a3so7636095ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288479; x=1718893279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YS/T1YXJZJcdeEA6un7cCZgf/P+LtlSVknb/jwgkpt4=;
        b=eOxt+3SwE61Xm5yLB93/yH6kcDXUkH+bnEGdqBlG2Tqi1ofDoEaJH/4VR+fYgpUPos
         7GktyQsTAjVQT2zs+SnCJq3rAWZx65+TIIrsLi2DhfqnKMMm2TeeQB+osa9UxJIV2CV8
         cPhwzWziAMGYUof0z0jhJPAf89hJMqnv7a3h4ng27T82itGiiZ9Ps6crXzP6aDjXf4Yc
         wLFKIiOr2QGBW753xZVAZ12QhkKFwWPLNPP3ErJOW+4Z0Hby9jMhAWAwvivPT7cVT3Mw
         Z5UxWOabizX5t2mrTuEkqjep9OosbteLDGBPXkp9bAAfzAqaPq9N7PigmvygHSIO38ms
         kgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288479; x=1718893279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YS/T1YXJZJcdeEA6un7cCZgf/P+LtlSVknb/jwgkpt4=;
        b=t10NVsRQC+Si1OQYUIcdT3EEbewpCFnBVrD+R6fm+9v9ASVfEgVb5H3CDx+0pgJFMw
         N26PGpK38hJbM6vVdxzPD83S7gDKMTK8lX85OPdJ53rvPVSMoE29eC/w2m3W3E78Iqcm
         NVfkyCmfuU/2SrF28RIpPRyvIshEVRl+KWBq4YOh52agluvlB9fDxzl3pLYlCaq2Qhmh
         4SGzY8d2Edt/hLqHq+GpBMaaDO9elgBhURrv7eH8upXeGDwRNF4Vc5Q91QjIPwCzm5qP
         HwPZEKMkVch816m8vkpuxN2QzLLery+nOWvOJlNtgJ0ZSHGUY7PCeWAabd4++KUM+itj
         /Fpg==
X-Gm-Message-State: AOJu0YwCFQYButTDC110Tj/sMjUqUcdEtjmXqwhL8vCXZSUiaR/+Amrb
	K0OETA2/ZMB4Oj6ySD9SeUNF7h1TBjFLk5ZkEUqz1+UTFPglRlvJJyOFkTFsmvKwo4qpgyAbawl
	Q
X-Google-Smtp-Source: AGHT+IFIz1fkvTnQHVCJFH9d8Yzug3JukIbax/wDAo+9sI06BUji80j0Lax8q5PfIrrOXiyiyzj1OQ==
X-Received: by 2002:a17:902:ecc2:b0:1f3:266b:ea23 with SMTP id d9443c01a7336-1f83b565bb7mr59552225ad.13.1718288478777;
        Thu, 13 Jun 2024 07:21:18 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/29] Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2"
Date: Thu, 13 Jun 2024 07:20:33 -0700
Message-Id: <fd30cc2ab99fe6a8e4beb29d9cb46a772db8b8d8.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200631

From: Alexandre Truong <alexandre.truong@smile.fr>

This reverts commit ab6d3e3d645ffc343f434bf731339fa237df027a
from poky repository.

The previous reverted commit was a workaround. The fix
"oeqa/selftest/devtool: fix _test_devtool_add_git_url"
tackle the issue. So, the workaround is not needed anymore.

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 731f47ecfd8ad6558aac629806810789c623986b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 1597aeedff..44a2a50f2e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -486,7 +486,7 @@ class DevtoolAddTests(DevtoolBase):
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
         git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
-        resulting_src_uri = "gitsm://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
+        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
         self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri, srcrev)
 
     def test_devtool_add_library(self):
-- 
2.34.1


