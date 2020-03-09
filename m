Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 86D9D61A0A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 14:21:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l18so1330874wru.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5ElGfCRK09601nqJsjoS9fr4Oumt+p7+7XxtrOOyRUc=;
	b=HOAi68ItI6bxbF6imwKbJ2Fn8WOwxzG5HNPYTTy+SJavNBK9Fta/pOFfk9qLgLPU9G
	9Vm8aIysncoLBBEHGCGnh80bFba9QL9x8V8/UHA9KWbvU03/xIVPAxx4OP9G/eZnBqgH
	E5xrQnZbtVuIyhvrGefvXzAaFvKHpxNTY6vmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5ElGfCRK09601nqJsjoS9fr4Oumt+p7+7XxtrOOyRUc=;
	b=bZMHX03pRqFV+XWEReWF+MDNMrFIF9hi9VLiF8VPkgeBGQfuxSrZ0uJqhiN5px7Lzz
	z/av+81sHVVSn48RfqSrpXMDAi7S+LX3AcyuO7fs58pJQrCoCOSJZkfut+ubluz30oN/
	/MCnsxCX/0NUkbTu1eP0kt+Jn6wNtXAQdM8yDy8dXtMCec2IzQwuugU0VTT/K/rHiXNj
	2v76W924PRKs8OEd6wAM9VVX2GWFYW9UVtGYjLbhXEN6X88JyXcYS8mEns9fD2axaBXP
	pIusx2aR3d8QQ9oD4UAwY+N0OdrSCHAi+QA1juGHIaqSSq0rwJ0T5RFJdlkKh2EqNlRp
	sryQ==
X-Gm-Message-State: ANhLgQ1iXWPVf6wSsezqubLKiTBqAUX5A2viK2KtpY7lDPDl09FwzxgX
	ZcAMmUqGCc/NSI76sPcx59Tme5oax7v69obK
X-Google-Smtp-Source: ADFU+vtVtV5N+RtMGKUvcuBxabglacCjzGXkKyllfi50i2RamdsxVQkFIVrvNDHmUqkDksBXePXC6A==
X-Received: by 2002:a5d:6caa:: with SMTP id a10mr14124123wra.342.1583763715842;
	Mon, 09 Mar 2020 07:21:55 -0700 (PDT)
Received: from ub1910.Hitronhub.home ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	z10sm25780577wmk.31.2020.03.09.07.21.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 07:21:55 -0700 (PDT)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 14:21:39 +0000
Message-Id: <20200309142139.15741-6-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309142139.15741-1-pbarker@konsulko.com>
References: <20200309142139.15741-1-pbarker@konsulko.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] kernel-yocto.bbclass: Support config fragments with externalsrc
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
X-List-Received-Date: Mon, 09 Mar 2020 14:21:55 -0000
Content-Transfer-Encoding: 8bit

The merging of config fragments is performend in the do_kernel_configme
task and so config fragments will not be supported when this task is
removed from the dependency tree.

kernel-yocto adds additional tasks which may modify the source directory
to SRCTREECOVEREDTASKS so that they are removed when using externalsrc.
However, do_kernel_configme should be safe to use, the only modification
to the source tree is the potential creation of the '.kernel-meta'
directory and the '.metadir' file.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/kernel-yocto.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index d71ce212a8..6792c9a233 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -1,5 +1,5 @@
 # remove tasks that modify the source tree in case externalsrc is inherited
-SRCTREECOVEREDTASKS += "do_kernel_configme do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
+SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
 PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
@@ -325,6 +325,7 @@ do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
+do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
 	# translate the kconfig_mode into something that merge_config.sh
-- 
2.20.1


