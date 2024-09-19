Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBA6CF3958
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:38:03 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.21530.1726756674302156903
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FwnQ1g6b;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-535dc4ec181so969363e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726756672; x=1727361472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWp9RylT+KR4FZb1lIW/0UhAhnGCU5MMU0wbOObb1l8=;
        b=FwnQ1g6bN09xCkXFSSbhL0XaQoORMt3OByQeMZoRUVHw0R5T+OHUxCST6tDg7KXF4F
         rVd5V0bEy5SZy3gRI0aVFegA6VMvwRj5yxXzkwVmBPSUqlgtFQFZPHkp/OWGk5trOGm1
         yU/ms7uUHNYkrq7IIB5vqPwS4VeNfW+tDfeAJelkeTm5YSNKJKHqug3gDpLy7AWCFDtj
         /uETfjKBB9Ux2IXCecmyD9ZwuC3HXjG6fRZh4J+HTcyXZsg046NEimVlsNX5qkaYqS/V
         0//K49df/zQocKSmHDXz3+uOatWjGORuFFbKGxVpQsA/JxU2KP8y2IgMK/b8DikqaLCr
         +bIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756672; x=1727361472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWp9RylT+KR4FZb1lIW/0UhAhnGCU5MMU0wbOObb1l8=;
        b=FZI9wQUl2Fzf/3XscXoEWcdINySxAnlsF3mhDj5/oB2ruhAklcwJUY1wbd+HYWlSZV
         EDsJOOXHH3/HkIfZ+R7SWSkCjpyZPwGV7GfSA3ZZ4Q5S1L0XbfOCyGv4imVpdvHYbaZZ
         Vs9YSuENyFCIoHmiLTa/0yhfk9QaZKQ67LODhAN0VmWU6aeLFTtCv/URk+n/9fqnck7x
         RBxjc26AvXavxrli7q9VKs8QraLgeqiBVpp+94xo8D6E3aFAa9vQzZDumjefztzhEUfm
         bA3WIDbXGpHtI+1WD09lKbfAk370uE0zg2f3Kjsecuglg/jOG/GZqQbulKchKV8vnWQb
         Z01g==
X-Gm-Message-State: AOJu0YzKvrxSnlo46P/8s0A80xbxab496mBpVnoo2vdJ+h/pfy2TLBub
	xLGFTr+jrzx4LvEhy42/JPr53RmnCFRATt5eN4q5wWBCuwblcQ1EmsU8+HwK3ryqIVlCAk6116U
	0NuE=
X-Google-Smtp-Source: AGHT+IGW3UB7t1ZMzLqcRyJNJHIduXxsK0w1BHYSuRiW7/s0INNoTuGO4jcZqF42KBij721am3U9GA==
X-Received: by 2002:a05:6512:a8a:b0:52f:159:2dc5 with SMTP id 2adb3069b0e04-53678fe69a7mr17525867e87.42.1726756672352;
        Thu, 19 Sep 2024 07:37:52 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8721sm1889194e87.232.2024.09.19.07.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 07:37:51 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 09/12] oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Thu, 19 Sep 2024 17:37:03 +0300
Message-ID: <20240919143706.6074-10-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919143706.6074-1-mikko.rapeli@linaro.org>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204701

TEST_RUNQEMUPARAMS variable is used to add runqemu parameters like
"slirp" networking. Support this also in selftests so that "slirp"
networking can be used instead of the tun/tap devices setup which
is easier to work with on shared build machines.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/efibootpartition.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index fa74103dec..671bb68f2c 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -6,7 +6,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 from oeqa.core.decorator.data import skipIfNotMachine
 import oe.types
 
@@ -14,10 +14,11 @@ class GenericEFITest(OESelftestTestCase):
     """EFI booting test class"""
     @skipIfNotMachine("qemux86-64", "test is qemux86-64 specific currently")
     def test_boot_efi(self):
-        cmd = "runqemu nographic serial wic ovmf"
+        image = "core-image-minimal"
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image)
+        cmd = "runqemu %s nographic serial wic ovmf" % (runqemu_params)
         if oe.types.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td["TARGET_ARCH"]):
             cmd += " kvm"
-        image = "core-image-minimal"
 
         self.write_config("""
 EFI_PROVIDER = "systemd-boot"
-- 
2.34.1


