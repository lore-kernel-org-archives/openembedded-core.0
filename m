Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D77C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 11:46:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.17219.1678707969608293093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 04:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NILCEMmR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so10702707wmb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 04:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678707968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nuGhC1RlaFkdioyPEBeH3k6bOOBxB86aOShi+CTO7Og=;
        b=NILCEMmRXkAzjsxto3lC42XYhcIPcutOWXWuCnisTYbA1U8fyoz86ntK9oQzg4HUoe
         xugnbTSziTA9TBu/2uZtOO/K8xXI9qrGNyMsaK/6awN+d+QDRsTKRajJ2cHS4ZBnn4cP
         bKLzvd37WVz4qYPLCgaPJtsoY1w09MgQt77Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678707968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nuGhC1RlaFkdioyPEBeH3k6bOOBxB86aOShi+CTO7Og=;
        b=pTf60Rc9UAHdnpnnnfONpkxTLMOask7Qyla2I8BPFsF3D/uhZ3UEbxWj7dxIoaPuZ8
         r8HQeMy7PsESIQfE9FI9hAUfUPkz1xiKIIKMsJm50DwXQJNuPR2+owSvsU/BCzPSQ/xm
         AaWrIAimHJo+BfdEAhhC/5fl4cHVK5TlxFQUmzeoiygO0zG/bYUD4xjWxqNCEV+bAV4w
         +b8lOGdXAEmqP/L1APZ4wB3UrhkwE8e5AFyXgUoxPYsA7O8MriL+Q/QcijE3RXu9xwvH
         jXUV8cXjEKG8pLjWvYW1400imaEGqlGdv/mVnYSoWz3zBFFI3FU73n7O9am0hKRvWK72
         qh4g==
X-Gm-Message-State: AO0yUKVvNnPh8zjQ7e2gGEO0lNIxTotZchc08TGaB7TZojTQ6gMY0W7i
	S29kOwysL+gT5fRaZMBSdLXeS1yKPPw13U1RW6M=
X-Google-Smtp-Source: AK7set/dMZdhobIW1/C8oAV0UHYjThjLGV97+8LfyggP4r0wmzyeT/z1z9ewO7urYKwVqq5mwVAWlA==
X-Received: by 2002:a05:600c:3d87:b0:3eb:9822:2907 with SMTP id bi7-20020a05600c3d8700b003eb98222907mr10408151wmb.4.1678707967531;
        Mon, 13 Mar 2023 04:46:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5538:39df:2049:3326])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc30c000000b003dc522dd25esm8825388wmj.30.2023.03.13.04.46.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:46:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/recipetool: Stop test corrupting tinfoil class
Date: Mon, 13 Mar 2023 11:46:06 +0000
Message-Id: <20230313114606.3733038-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 11:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178431

Running recipetool.RecipetoolTests.test_recipetool_handle_license_vars
followed by wic.Wic2.test_biosplusefi_plugin_qemu would show a failure of:

  File "/media/build/poky/meta/lib/oeqa/utils/commands.py", line 351, in runqemu
    qemu = oeqa.targetcontrol.QemuTarget(recipedata, targetlogger, image_fstype)
  File "/media/build/poky/meta/lib/oeqa/targetcontrol.py", line 116, in __init__
    use_kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TARGET_ARCH'))
  File "/media/build/poky/meta/lib/oe/types.py", line 182, in qemu_use_kvm
    if kvm and boolean(kvm):
  File "/media/build/poky/meta/lib/oe/types.py", line 128, in boolean
    raise ValueError("Invalid boolean value '%s'" % value)
ValueError: Invalid boolean value '/media/build/poky/meta/files/common-licenses'

which made no sense until you realise the recipetool test is corrupting
the tinfoil class. Work on a copy instead to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 25b06cdcf02..b193f0f5c83 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -581,7 +581,10 @@ class RecipetoolTests(RecipetoolBase):
 
         commonlicdir = get_bb_var('COMMON_LICENSE_DIR')
 
-        d = bb.tinfoil.TinfoilDataStoreConnector
+        class DataConnectorCopy(bb.tinfoil.TinfoilDataStoreConnector):
+            pass
+
+        d = DataConnectorCopy
         d.getVar = Mock(return_value=commonlicdir)
 
         srctree = tempfile.mkdtemp(prefix='recipetoolqa')
-- 
2.38.1


