Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 946936061F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 14:52:05 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id d11so2419704qko.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 06:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H/L5e0bdtDbQ6XHrdPZPZjL65HyTgOhTZAsBgOxOTSI=;
	b=XUksh275n2LJAGuK61N5/0QU9bSTA41TwLqNlLmTLIV9GiSZuHqNrUhtfNG2NNc2FW
	8pSGfNKoyrSzStUTW8y3RuWPxU2Xp6dZOUHtzZV1rwVmafQpaShSg7/Y1kpl7W9rLdqo
	HLnjCOZTC8V3zUQCjDQokR9iD+xJPart0w+ABAOjOzGPeeosN9LeDM5p84O+vqNXRuJN
	BZandK5F9Ce2G24sX/60byXasz3x3DOY21N1/9Hn2z6qVMyUL+ZxDyxPlb5MdXO14wcZ
	iaF4SigR48pGj6yjy2pn18CGZ8P6B+XVl/wWOJzxEVNZevWJo+qySpvJwskS/e56K45q
	YDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H/L5e0bdtDbQ6XHrdPZPZjL65HyTgOhTZAsBgOxOTSI=;
	b=Q6AZVmUOFlY5YpcQfbvU0BCypFOvSrKglWHYXPocytzmhYWwtouOpyyneK5wMUEkYK
	z2iSt/oQRdfpOegMjiVlrxUP85sByTtAGywCPcXQMdFKXzJeBMg8cda9l0r23NfvnyIa
	wB+9YKbk8Vs+oZX35XTvef8CO097Ds2xASy38iSMYe0WYrOR/CL7OzsKwM0fNTShapLZ
	ry9q7d877kqJh2Oz3Slr6SdP1Pxsd4HAdv8yKFJUbwHdIO3TmKiaIhvDinU2U8vmw4rz
	7QXXwSXkphK1haAMF/ybyjq3PDMKjzSRbujR6jf0draQK3AdABZ2bvAVHsO3eVtSfsa9
	qyHw==
X-Gm-Message-State: APjAAAW7ENOlfbNX0MyyMJtwcObyAJmEdI+F/wv7e8K4bly14oWBYtFg
	dwYotwe1ahipLVDicfBQT172bCtoi9c=
X-Google-Smtp-Source: APXvYqw6OAiKVofYjo2nuoOLyymxiLxLuZ1MaqP5/zlv/TLdQGfmBrr2Vj6dK34/WX/qnxF6d6Kc0g==
X-Received: by 2002:a05:620a:13e3:: with SMTP id
	h3mr7420713qkl.319.1581087126213; 
	Fri, 07 Feb 2020 06:52:06 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	v18sm1397018qkg.67.2020.02.07.06.52.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 06:52:05 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  7 Feb 2020 09:52:04 -0500
Message-Id: <20200207145204.35747-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] kern-tools: fix merge_config when LD contains parameters
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
X-List-Received-Date: Fri, 07 Feb 2020 14:52:05 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To ensure that the kernel linker is used when allno/mod/yes config
merge_config steps were executed, the call to make was tweaked to
explicitly pass LD.

But since the variable wasn't quoted, any parameters to LD (like
the sysroot) were mistakenly passed to make, and hence could trigger
an error on some architectures.

We also tweak the logging to hightlight errors like this in the
future and avoid losing it in the noise of merge configs sometimes
overly verbose output.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Martin noticed that I sent a WIP version as part of my series when
I was shuffling LD around to various locations. This is the final
version and should replace 10/10 in my last series.

Bruce

 meta/classes/kernel-yocto.bbclass                      | 10 +++++++---
 .../recipes-kernel/kern-tools/kern-tools-native_git.bb |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 918d101d3d..44863adc27 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -352,10 +352,14 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
-	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}
-
+	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
 	if [ $? -ne 0 -o ! -f ${B}/.config ]; then
-		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
+		bberror "Could not generate a .config for ${KMACHINE}-${LINUX_KERNEL_TYPE}"
+		if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
+			bbfatal_log "`cat ${meta_dir}/cfg/merge_config_build.log`"
+		else
+			bbfatal_log "Details can be found at: ${S}/${meta_dir}/cfg/merge_config_build.log"
+		fi
 	fi
 
 	if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index f263421234..4f1af731d6 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "388b67974deb2176c06994a325676cbf23e5fce8"
+SRCREV = "c66833e1caac25279a5052fceb13213f5e4f79f9"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1


