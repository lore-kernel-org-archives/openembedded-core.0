Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59077D0BB75
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 08:54:46 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.10123.1729760075893820825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 01:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ikX2m7Rf;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so6133231fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729760074; x=1730364874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IA8zjIr5GLwTnlZ+wwYCWnxfyQ6pF9mk/QRMIQDSVX4=;
        b=ikX2m7Rff+/T6xdXqDLxAdjDCm1tEJ6KxHLk4yV/3HrvICeFFX+aGcPb3ze+8tGLiU
         TTHJhEdbBPW75QeOCePpbzbxaQIbE/8cGsCmnAM5kbPwCYIzV0RK2OEnNUQUklKcbYC/
         KwgsxYtv+g4Gp6YU7SxI9SzEfjv4hk4+5RIkcKj5EhUP61H+N4es8bdeqKBz3YkZ8yov
         Dv3EQT9HZKrLp5CFF0xzdGfSKGV1Zv4EsjLjfuCHcXrPkg1Szy5c7DEYXSyzwRJ6yl5Q
         GH+BeZr9yRu4uBRtECAlPi2+KUjWQ7hObQvmHWg+VWw3nRc03DCRzfphsDWd4BM+jc1Y
         ZlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760074; x=1730364874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IA8zjIr5GLwTnlZ+wwYCWnxfyQ6pF9mk/QRMIQDSVX4=;
        b=G6+mKvtvsuXZoZtswQY3/ToUmuclYWCqkzqytjb0+p8n6WtOmigygXjIBo2ejlM7oN
         A6WRB8WWvUMiuHZq/tWEobC7Af273iS7DAL90hleCLR5FVR+yyKa06RRTi0GIK7KKq2q
         oBKO6wgZEfV0kjPMF0tC9fIEKYEW4N9Zp97K37U8pHTZholo0wCh+COsUEuvfx5HczTM
         5D78B4Asxxq/0vnFnRqSPmwY+hYs4DYcyekTeI2NTYO34uxhPAbrpdQ5GnK0ccjv0MJI
         ut4ivPjXjeZVFWp2t3YuBYbMeNxRdA8MdGNyhoMGipoEAfAVEpzz0lgsKTh8iT6womV7
         t14Q==
X-Gm-Message-State: AOJu0YxVobtbRoy+rNxissYDlhsEE0rg1Dik9rcqKwpjScRHgq9d36eJ
	jwWv9K53EGqb7NeftgPQ+7WZF1lSG/sEXF7bz4ALn7IWLRWcAottRMc9++eRWLkcMROISrHW40r
	OIKk=
X-Google-Smtp-Source: AGHT+IEVnoU867h5TLK05juyQNxwWspr04IYeKrSfdY1M1DfSwe/seek+jxBQ83rarQyIA698jJI+Q==
X-Received: by 2002:a05:6512:308d:b0:539:f23b:59db with SMTP id 2adb3069b0e04-53b1a2fb0b9mr3061118e87.5.1729760073587;
        Thu, 24 Oct 2024 01:54:33 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223e58cfsm1303054e87.44.2024.10.24.01.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:54:33 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH][master-next] oeqa selftest wic.py: apply build config to runqemu too
Date: Thu, 24 Oct 2024 11:54:17 +0300
Message-ID: <20241024085418.30410-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 08:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206280

Build configuration is applied to bitbake build command
but removed before calling runqemu. Thus disabling KVM
support on aarc64 host was not effective. Note that this
pattern is used in a lot of tests. KVM gets enabled
via CI scripts.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 972fffe6f8..5e475f9e3f 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1374,7 +1374,6 @@ IMAGE_CLASSES:remove = 'testimage'
         self.append_config(config)
         bitbake('core-image-base u-boot')
         runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-base') or ""
-        self.remove_config(config)
 
         with runqemu('core-image-base', ssh=False,
                      runqemuparams='%s nographic' % (runqemu_params), image_fstype='wic') as qemu:
@@ -1387,6 +1386,7 @@ IMAGE_CLASSES:remove = 'testimage'
             cmd = "cat /boot/loader/entries/boot.conf"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+        self.remove_config(config)
 
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     @OETestTag("runqemu")
-- 
2.34.1


