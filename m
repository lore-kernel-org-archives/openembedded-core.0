Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id B146D7307B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 17:49:05 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id 203so185700703ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fekmckIvVgfAk4cBPbHIC+GpyqLZZrekVBgYZmetRyc=;
	b=ujJNF8vVx5GQCwfou6Ovrtfzbm9zqY24iJaeaJbl3BtDalm/Noo5CptIXLEDnERPfG
	C3JFPa/OTSAT+qurJb2d6fXtQZvQQkoZWxSrIWprSZWtmgdk3nKtiebeNNyjZne9F0Ah
	s1q3r3xGOAC+fddB8uSkth/OpOse1xhOdOIhAi45FLFkqe9/5OrVKm8sV3bBqodEHOmQ
	WHOlRJH+tav0aG/s/cw/5VW/QYMZHBej8JGzEMj3titK7Ov+Ih1Ek8+yKU+G4FMupSHE
	5BDMdv1KYo48mWtljq7BC7YbCWFLVmOZ3ChgMnbtBVwpKGhvEGPkWiHHDuLKFmRteaKD
	toWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fekmckIvVgfAk4cBPbHIC+GpyqLZZrekVBgYZmetRyc=;
	b=K3hGbVjJYS04ODpqFTQsJjA8y5nYRuoGvKBsW4J1Fx1oyxKzTqGh9FbhUCLqKmI880
	7msCO1bGJvjVP0GFON+EjayYZ531kUFchAa2MLpraBIBpco0bqK/YK6C3i792M71qE45
	4Mjwh6T5syzcpkNGr7ycTet08NorYysPinb/ygexXP51IznxinjQqTFHMU1BgcDeOwxw
	Vk4c27hlZz7+Eoyqao9DCkBlVvuYww8JFUFkQsGB8+pXEYXpOUoFj6zh7J8Ku4l91OYl
	FX8eGWwl4kP6jEqdE1U0AllbNgSU/AgOyu34fx1JMX8VqvXv69MRbxTGIRxcssZSSQYX
	ZjIw==
X-Gm-Message-State: AMke39ltQJByDfJrVvvB6BLa0/VqaR9JKusbEysOlmdPcyI47rrUyyb9GhZPGsCfzYj4QcfF
X-Received: by 10.107.191.130 with SMTP id p124mr35262878iof.172.1487872146377;
	Thu, 23 Feb 2017 09:49:06 -0800 (PST)
Received: from pohly-mobl1.event.rightround.com ([67.23.202.154])
	by smtp.gmail.com with ESMTPSA id 202sm2258437ity.8.2017.02.23.09.49.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 09:49:05 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 18:48:51 +0100
Message-Id: <1487872131-6571-2-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1487872131-6571-1-git-send-email-patrick.ohly@intel.com>
References: <1487872053.11306.39.camel@intel.com>
	<1487872131-6571-1-git-send-email-patrick.ohly@intel.com>
Subject: [PATCH 2/2] ovmf: increase path length limit
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2017 17:49:07 -0000

The VfrCompile tool has a hard-coded maximum length for path names
which turned out to be too small by around 20 characters in the
Yocto autobuilder setup. Increasing the maximum by a factor of 4
is relatively easy and makes the problem less likely.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 6b3a597..76e836a 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -50,6 +50,11 @@ COMPATIBLE_HOST='(i.86|x86_64).*'
 OVMF_SECURE_BOOT_EXTRA_FLAGS ??= ""
 OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE ${OVMF_SECURE_BOOT_EXTRA_FLAGS}"
 
+do_patch[postfuncs] += "fix_path_len"
+fix_path_len () {
+    sed -i -e 's/^#define MAX_PATH.*255/#define MAX_PATH 1023/' ${S}/BaseTools/Source/C/VfrCompile/EfiVfr.h
+}
+
 do_patch_append_class-native() {
     bb.build.exec_func('do_fix_iasl', d)
     bb.build.exec_func('do_fix_toolchain', d)
-- 
2.1.4


