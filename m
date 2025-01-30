Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC81DC0218F
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 15:35:30 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.18012.1738251322794663433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 07:35:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ppJ7r4Ca;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so971829e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 07:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738251321; x=1738856121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfJSdWt9g/2yD+nlx0Fs3m2cACLbzLUuleiYYd/sjw4=;
        b=ppJ7r4Camh3f44gsn5DtY3docYWiYympQOazZSTQ8tUzwVRVpcXSwub0ChaLwJ4gN3
         JuX6PuhTpF2WtL1itRfHjFK+/VrBDlj0pZjY5rAeIXG4TFuo6uvwPeM+w0wYTZ5zSC1a
         WLzY7MzODul22pLtGUv32xkKoQevLWNRlClZlsCoG9mSqlI7xBNizxku8w6ThYzzCbJN
         Hv277OEpW+baRfy8UHyZkTXbZvOf4oJljBQzwBmRLLwWEg/MIG4roAKszBJMs4e64W7o
         dEdxAi6l31FMQ6JbXi4m286J5v+m9t+a470HbEJhVIKj6P4XlwLtdw98ic/2gurxGXUb
         XlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738251321; x=1738856121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfJSdWt9g/2yD+nlx0Fs3m2cACLbzLUuleiYYd/sjw4=;
        b=oCRlfKQ5Uhc/E5toZxWqJYYf9G5pwhq2j46TRgH1c2VpMdRT4e3hMB+91lSlRosaAY
         yYEOd/yg34aqtGzg5p2gi4y3UcUmfFPnOYJNBrrIQjXSKP/xcUO0eOhmK6JITVTPo7fV
         0PCfRZ+uQjPOWmgBrvtzpdbuS6Zt5NRe7Wd04g+IvSDqABXt2NC7ew+AWbv06Vo//9up
         Wf8yJoEQk2fOJNnMZelE7n/P+pk6jPsVCr1DuQc54rmGP0L96iW3TRAcRHtYkwEgGa3Z
         juMC5/q1BYQEWzSh7fsC8dI2sBlCm/PGTMkGgvCjWZlczEZQo/CFsTbDivPWTk+EE+KB
         6uyg==
X-Gm-Message-State: AOJu0YwdMzY+0i4efPyfLD9gOKTzXDuNahnXskzY5WG22+WNW60w+J81
	YOrU59caj7BcsuExOeY/wPZ3NDjzGLjfJ23eN3cnleYYL9cSuPROZVkkbPLCbK9L6QDozG/3yag
	sGLw=
X-Gm-Gg: ASbGncvXy5mkGiyXbuOtnP0uuEHw97AhfHIua2wjiQyllsyGFrBJOJlJQP3W8ioJr2C
	BT49FOqOvPohq7Ct5HNtjfSVJPjRS194yq8OZsWxMUJMZ53SoRt+xBIMsLB/6WPrdGqJ/kjz8eZ
	Hmog7TSjESQSX2i91fY806hIADBzC8s5YVTVVwMLt3ZzSPiqB/etU29AwWhHsoS2VWEiKJcht+b
	TRkg4xVLOPosLMIeVs4Z2Qhz3VJz/u+7Uo9Xp5TwTGSMQZey7/abGKOfyaLb5fq3LvuUngTbhbd
	sGJlTVxlqGVNUBerYs6y1sfdEzdiqSg60iBgPwaSO2Jdhp3suSRwibXbJMXb
X-Google-Smtp-Source: AGHT+IGDClsCzYjnk84oe9miG17cHHO4EqJvUqn4k490ZQHJW7c22uLGGk5NmE3zsIJ5nxXZvPfBgg==
X-Received: by 2002:a05:6512:239e:b0:540:358e:36b9 with SMTP id 2adb3069b0e04-543e4c36d3fmr3036290e87.45.1738251320905;
        Thu, 30 Jan 2025 07:35:20 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebecc3sm186125e87.242.2025.01.30.07.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:35:19 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: meta-arm@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Jon Mason <jdmason@kudzu.us>
Subject: [PATCH 3/3] systemd-boot-native: fix kernel signature for secureboot
Date: Thu, 30 Jan 2025 17:34:35 +0200
Message-ID: <20250130153435.1074941-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130153435.1074941-1-mikko.rapeli@linaro.org>
References: <181F17E3A23753E5.21193@lists.yoctoproject.org>
 <20250130153435.1074941-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 15:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210451

systemd update from 256 to 257 broke kernel secureboot signatures
inside signed UKI files with u-boot based UEFI firmware, e.g.
meta-arm and qemuarm64-secureboot machine config and secureboot:

$ cd meta-arm
$ kas build ci/poky.yml:ci/qemuarm64-secureboot.yml:ci/uefi-secureboot.yml:ci/testimage.yml

systemd-boot itself is secureboot signed and verified by firmware.
Same for the UKI file which combines kernel, initramfs etc.
Then kernel from UKI is additionally executed using UEFI firmware calls
which check signatures so the kernel binary inside signed UKI
needs to be signed with same keys too. PE file padding added
to systemd ukify in 257 release broke kernel signature validation
for u-boot and sbsign/sbverify tools. EDK2 based firmware like
OVMF may not be affected because systemd-boot is able to disable
signature checking after a signed UKI has been loaded. This feature
is not supported by u-boot.

Upstream systemd bug report:

https://github.com/systemd/systemd/issues/35851

This patch proposed to upstream in:

https://github.com/systemd/systemd/pull/36225

systemd upstream may not like this revert and would prefer
alternative, possibly more intrusive changes instead, e.g. to
UEFI firmware implementations, sbsign/sbverify tooling or
systemd-boot, but this ukify revert is simpler for us
systemd users for now.

Cc: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../systemd/systemd-boot-native_257.1.bb      |  3 ++
 ...y.py-disable-virtual-size-for-kernel.patch | 39 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-ukify.py-disable-virtual-size-for-kernel.patch

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
index 5b4b63c294..22ac5c96cc 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
@@ -1,4 +1,7 @@
 require systemd.inc
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
+
+SRC_URI += "file://0001-ukify.py-disable-virtual-size-for-kernel.patch"
 
 inherit native
 
diff --git a/meta/recipes-core/systemd/systemd/0001-ukify.py-disable-virtual-size-for-kernel.patch b/meta/recipes-core/systemd/systemd/0001-ukify.py-disable-virtual-size-for-kernel.patch
new file mode 100644
index 0000000000..ddf53f01c7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-ukify.py-disable-virtual-size-for-kernel.patch
@@ -0,0 +1,39 @@
+From cb869363ed84bcdd84c44781bc7f74ac027f9a9e Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 30 Jan 2025 11:33:38 +0000
+Subject: [PATCH] ukify.py: disable virtual size for kernel
+
+Adding padding to kernel breaks secure boot signature
+for u-boot based UEFI firmware and sbverify tooling.
+
+Workaround for https://github.com/systemd/systemd/issues/35851
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ src/ukify/ukify.py | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/36225]
+
+diff --git a/src/ukify/ukify.py b/src/ukify/ukify.py
+index 5f821297c1..08ba800b44 100755
+--- a/src/ukify/ukify.py
++++ b/src/ukify/ukify.py
+@@ -1238,12 +1238,8 @@ def make_uki(opts: UkifyConfig) -> None:
+         uki.add_section(section)
+ 
+     if linux is not None:
+-        try:
+-            virtual_size = pefile.PE(linux, fast_load=True).OPTIONAL_HEADER.SizeOfImage
+-        except pefile.PEFormatError:
+-            print(f'{linux} is not a valid PE file, not using SizeOfImage.')
+-            virtual_size = None
+-
++        # Padding breaks signature for kernel https://github.com/systemd/systemd/issues/35851
++        virtual_size = None
+         uki.add_section(Section.create('.linux', linux, measure=True, virtual_size=virtual_size))
+ 
+     # Don't add a sbat section to profile PE binaries.
+-- 
+2.43.0
+
-- 
2.43.0


