Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5704CD13CF
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:05:28 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13144.1777474324480625113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 07:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=aWHkSlT2;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.221.52, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43fe62837baso7314017f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1777474322; x=1778079122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjtG7uGof/B7apGWWCaoVokjxtDZoPRCdUh0fiXShhg=;
        b=aWHkSlT2tiEbEyHV0zzqydNNy32bkwUkwEclon7EtQXthg84mHAvXxIMSmIQN9Os7l
         LmV0xr8XPDKc4upPX84x/rEMIjRJdcIeQhufrXgA01WHUo7Ad8yx5LLdR+m87yvyxDXg
         CV4tXtEKpXZew2bmCL9+LC1gEOLWrWVDwNBbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777474322; x=1778079122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjtG7uGof/B7apGWWCaoVokjxtDZoPRCdUh0fiXShhg=;
        b=MBJWjuNNKOmNimCMxEdRWb0W03PTciBznEtisZGNciq+2Pc6aZNvsLyY94ZMA/Um5E
         vaWDel8FQwR3qK7XCRw24hI6dhoPnsf4uINSspGl8xFRFOKQpb4SvM6N41/4WhXsXwDO
         nBFWbVKq8zQ1ZyHJdoWjy+W4G2h/cc7DLfNIel10qRUXNHPDYFYo5B++OG2TPtzoveVT
         H3AQ0vehcUb+UbsseR2OyKkVm5gMPE6skynyPjL3ykYXNdFcFZI5kRBSku3oBOQroQsw
         CL25aUmkEdx8J8n9SCRaDb9WfGuFR2M097Az/mY79ZKSib9cFAy+MT6Hp1DhUL6cwzqj
         zU9Q==
X-Gm-Message-State: AOJu0Yw5+PO4OsShazTMoKxsg5NcUf7H9a7L0rqjayTgLikQ9KwmqHg4
	7VpbpP+FGumRtz7kLL0ZuEgH9Mlj8uOcRpqWjtm+qce9lcyNgi5S59VQa5N4XVkPqW1YogSF6wP
	MdWo+
X-Gm-Gg: AeBDiesmL9+K5N+lqbNS5XO86Qo9UGn4IJVR+3yAyeg2in59H1PXlBv4wcEyoxjg1C0
	P8YWhorWY/vzEThfxeNZ0O2+rYjWHIMs2F/rDY/mWaimlzpd7Zf4gm9un8fP8o9zl/fF/6k5nsF
	0tRZeOXDTc3BFTuxZ0tmaa/1hK7Smyg9+6SOUPdEkY98fD9Gz2Xyn79noSe/u/QPhl0JRb/ibTX
	R3yw+4GFKjZRRhCSzOLnSU4BVwzp+k4jguFHoOztCHIVHFdM5Skz/baE99f7jkRvy6BQYaFaw7b
	KXESLMR2AlwufZrH6QAw/mjEDLwUfKETdl9Lyz6AAJoPnDNLGalr/6P2fv6o1WG1KKQAlHGd5M6
	Neqtw/rUBQ0/yCZtN0koqdxd+lKbTdBHywtwln8OlO9tf4ewSftTmKrQq2afHU84RI9wOtzR+oC
	RerDMeKVPmkMCFBZd+4JHfzyfhS6FQ1qnNY3A5+rk9NNn50Bk6/eL1SKRjNFgzNbocyS/5SpouU
	59I87cie6vKiBeS6bHTnXz8JSSVrwhBwI7J6+PwQoTHDRnfRSlfOznhAU6pulOGqWVrIRuiL4VI
	DdtaiTyfLV5TT2KWOdKlwE7t32RQw+tb9BE=
X-Received: by 2002:a05:6000:2287:b0:43f:dc86:d61f with SMTP id ffacd0b85a97d-44647cda901mr13828752f8f.14.1777474321574;
        Wed, 29 Apr 2026 07:52:01 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-56-22-134.retail.telecomitalia.it. [82.56.22.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d481b2sm6551566f8f.4.2026.04.29.07.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:52:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [OE-core][PATCH] libfwumdata: add new recipe
Date: Wed, 29 Apr 2026 16:51:36 +0200
Message-ID: <20260429145136.618168-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 15:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236110

libfwumdata is a lightweight C library for parsing, validating (CRC32),
and manipulating Firmware Update (FWU) metadata, allowing tools such as
RAUC or SWUpdate, and in general any application, to modify the boot
bank selection.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb

diff --git a/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
new file mode 100644
index 000000000000..838b4983c21d
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Library to access Firmware Update (FWU) metadata"
+
+DESCRIPTION = "This package contains a library to read and modify FWU \
+metadata. It provides a minimal API to allow userspace applications, such as \
+SWUpdate, RAUC or any other OTA update manager, to modify the boot bank \
+selection."
+
+HOMEPAGE = "https://github.com/passgat/libfwumdata"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951079008b364516c"
+SECTION = "libs"
+
+SRC_URI = "git://github.com/passgat/libfwumdata;protocol=https;branch=master"
+SRCREV = "c6e235d3cf0467211ca6946bd10a2c8bdc0d5053"
+
+S = "${WORKDIR}/git"
+
+inherit cmake lib_package
+
+DEPENDS = "zlib"
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


