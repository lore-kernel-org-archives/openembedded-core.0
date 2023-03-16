Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CF7C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:54 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.5150.1679003151092139877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Hox3UhnP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so2965203pjp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=di20d5b/1UKyxPL2Lwx+sVaahFSG0fO52IoLHP+W2ow=;
        b=Hox3UhnPABq4DJ094uRk2sGkUO1Jc7exQOoJSsTUhR7KfoxqtHw12si+zrsHFiDJ+s
         GQt8W8tUlNYOr5hffx5TuNWMXSBH4pd1gmVk/N2CL5Fsb9vURfcivZVI1ettQ9gguqqV
         rXmH0DsQHCfVRZaRpGzRThLW3QCt8pimfLJUxa8Aa1xEPy/5jKHhTq9qlS4ZKBM7FNF+
         /GOixRU+oTtOC2wgaUY0uUVMrtKp8hYyZjQHmhEuB+MlpTBxdh5anXIJWmFTYOqcvSN4
         yJdpqg5nQp77maOMvFkHnAnE99CdwRsbKnCDW5YfyVdiN1WoxzSmGTyEy3FgqT/hKn4Z
         crdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=di20d5b/1UKyxPL2Lwx+sVaahFSG0fO52IoLHP+W2ow=;
        b=GycHvcopMbcBIvq5MLCXdiI99AxA6E+0gBJh2AnxGW/hylV9Es3GyZ3Ia1/GyOCnrT
         NqinONjaBmbD9oJAjja7ODUuEqqZJySTgb/I1MH6i8dGACki9YBf+ZVo9THEde4OG2Kx
         kvQkgJZHzelBpw+7sSFfymkiTD9/jVWiMoVa1pKgLT1B5A0Kk+kS8FQoVhSEi8VJBx5k
         GM/OraQW125LiduAFte39mCwx4bjOCX9CAMKvVZ2qLnNOkOgBQyjGFO9FCYSHqEr2Ezf
         Z+25ns271CQTN3eptDlrZ+WYTbquqLcWO1fyS8xS+q6UyhmwzthBWpbRUNaY5XOSTNM4
         DjVQ==
X-Gm-Message-State: AO0yUKVLzVF6OF9jKgIYlUak36BS6XPfYxq5B4Deg3V7iAxM5TCSVVqk
	45OvOvzsURlRtztq8euhesZ3iOoFZAp/pXDiLp4=
X-Google-Smtp-Source: AK7set8sK38/xleZEvu2ZUAzKEYvRjwXQdIJil98pxSGsKEebc39ufvKXj3+sDjy6GeOsNiFL8XUTw==
X-Received: by 2002:a05:6a20:4c2:b0:cc:d7ec:b7c with SMTP id 2-20020a056a2004c200b000ccd7ec0b7cmr4664865pzd.4.1679003150095;
        Thu, 16 Mar 2023 14:45:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/23] selftest/recipetool: Stop test corrupting tinfoil class
Date: Thu, 16 Mar 2023 11:45:09 -1000
Message-Id: <76930f40ffeabea07f495c0011a3e6231ea3eddc.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178723

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
(cherry picked from commit 7fe76fe17f67c1bbd108d02836692fed20d24771)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 25b06cdcf0..b193f0f5c8 100644
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
2.34.1


