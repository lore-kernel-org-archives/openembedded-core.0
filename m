Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2CCC71136
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 20:59:48 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.7491.1749848381860050317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 13:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A0Jv7qIk;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so399790166b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749848380; x=1750453180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1oftOndQx76AMAS7ojsPqQLlUggHhIS6poPa25YPuQ=;
        b=A0Jv7qIk/kb6HIPi6L6FaHOtN/TGnsoAbcAI3ZgpueUoKwOR9NmgoKFFhdRHyJiBD9
         zPaynnomsAc54cMDoYM27hIlav40tulX6BnDH02uwECM7mdDlZ+8hQVwldLGsjozsRuc
         9IoTxcJH/n4WzGJxc+KBlreWP97h/jMi42NBIpeuMOPzIVT+/MbCRr+F2wXJxuXlYAlM
         eboa6OYh6jTGW0f2ZBiF/Ta6zayZPaIm5umki00cf+0c7hZDJ/yX0nl2GO7AUFsiW1ms
         oXxqw4z6WJJfnC/KmfIWHJDOR148wramywDZr5467ATzNlvfy+3xzmZ6Z0CNpPh9cFYE
         orLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848380; x=1750453180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1oftOndQx76AMAS7ojsPqQLlUggHhIS6poPa25YPuQ=;
        b=XEjwCJEm7rj66kBmTqiDxBqzi0wxsd6JuOkj1fGANZd2M+sL+EzCK2BoOrgWXzEyNv
         U0a4piiJ8BBz062+9zb75nhHZs8UYJ4jPn3IFtn/qvXMdr47CKyd7dlgZBS8xUEtuN3V
         jDOLPhM/8RnEcQrzj9GL/4FUWFftf9MrPyHxmxzQDBay2ZNT4At63QVGLRukcS7sIvkm
         UyfzMCbmrQFSeuVMh/FNDCTsPAH62ptSn4DBdO0qkHRrCMe56KeQB6NrFAbcrRLyPVi8
         3bM0ixDN7xPlcMMT0WvlqgKKZ7D+hA8fT20xbappEcXbg0FWbhi01l3Zst7nM4wB4pad
         bcYw==
X-Gm-Message-State: AOJu0YzC549/+4PRDItiyFlAzSDhzz5GfIoqh84gNDaskahxRvBgjur1
	kHtA12pZ75NDcB1b8IGkK9+GcKQK5WYqgEym+a90ubP6IT+3cOfG4lun1UOVHg==
X-Gm-Gg: ASbGncvP5GbHz1Cxbq24/dxaD+oMyte79nmwAkggZSujCVEXxTZOXSIskIQebrQN4Qo
	1RBrqZ668t7nqCC+JWBl3OvN0e416894LgIk29cdAa6igzARU4hyP4OXVzs5xNkob70OkDivCwv
	JAn4vfQ/Lie90Tu3K8wePjsW42Wrl7pyiPjY6jRlXDxBfXoMIiqrKsaoCje51HhHUIPcPESBWmv
	FkXIjeRjVuKQXcboRuh1GGF7LxIrNNuTCk6hghP8K9lsDTHrQewunbDgngFhx/YgtBSApAk51OP
	2nvJ0VdUFL6cXNf19xf7sYRR+TfFNC2CUQo03WHcLfUDYH6ZYQQTfwj3lek6cw==
X-Google-Smtp-Source: AGHT+IEwnfDiO0O+I8HNOSlbSbyufN8rIIb3FM2U9ZDsJuem5bxuoB7usxn5M2me16TwcOmw2FLAoA==
X-Received: by 2002:a17:907:72c9:b0:ad8:8529:4f83 with SMTP id a640c23a62f3a-adfad449c2bmr58339366b.39.1749848379850;
        Fri, 13 Jun 2025 13:59:39 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:61c:a000:5c5e:8cd0:a3f7:8c84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159377sm185097566b.9.2025.06.13.13.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 13:59:39 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH] scripts/install-buildtools: Update to 5.0.10
Date: Fri, 13 Jun 2025 22:59:32 +0200
Message-ID: <20250613205934.332435-2-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613205934.332435-1-an010@live.com>
References: <20250613205934.332435-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 20:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218627

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.10 release of the 5.0.10 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 59b45d8f1c..b699b34270 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.9'
-DEFAULT_INSTALLER_VERSION = '5.0.9'
+DEFAULT_RELEASE = 'yocto-5.0.10'
+DEFAULT_INSTALLER_VERSION = '5.0.10'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


