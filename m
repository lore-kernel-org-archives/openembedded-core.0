Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 53EBC605F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:13:01 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id y8so1976563qvk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=96thOFLTrdL7VxPCvbk2egsU3MtC3r918mqbaIeQHcE=;
	b=G/dyUuzMxBmzRtiB9wmJuShYZPEJRO3FnteTpLqso7CyGFA86zPHF/LO+PKGKqGwXo
	XSsIIfxHnvY71VfIE4qQ+m2mtXb5HjNQmBkx7z5WcjrPuApP9XIalxYF0LFO2mq1WtNP
	1ZYz8wpy559MiBMnl3x/6l3I3YR3tGibjUoN+8xHGfqGPhP1J681v4G4Tt3r56G1YELA
	kIWlPVY63J4Ey3b+CAdfcAzJQG5W3ONAN7o/v/WdnW+BD5uKNQ0LIz9bSlPVrN03J3aL
	FPccstfowTB0PjKbO4pKT8GzN0YeaC2zCwue68nwj8EQ7dJUsAf/DI8o9Q5feZLHldOm
	1xDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=96thOFLTrdL7VxPCvbk2egsU3MtC3r918mqbaIeQHcE=;
	b=JG545TVV5C0wBTCvyqs6X6SL3LXXCvhZe060HAOLdMWgnvPcdUYL5OVmoG6eq5GNFv
	LeUZdsfHD0Al2Wynzx/GOpBKkbFUz+0nlEDmBxLsyNkc0ZPSQfhSWuNigauG903R98Ee
	K5k8BO3jXyRwy34FbyQmthmY2Nr9q1eEf+JJ++ya4x1hpvrppYy6kYwr2IeFcoQ/kV9x
	B4zlq6Ur355CXe4+V8DFu0jpyhIh3kPo6Ge3d0c0xYxi+x/8w+vyO/tG7fBHwrvcMBad
	lA/o3GvE483+arZaLTmL7x3rejG2hxamx/oC+TxzX87VxquN/aIVicWHDHO1YMwpyHFQ
	s5pA==
X-Gm-Message-State: APjAAAVuCo67vo7aDDw2zadt1ZSWc3Y5sJrEXNLL37WvbQf6QPf5jS5P
	gmzwnG0jMgGk2hUAg5RmKiI=
X-Google-Smtp-Source: APXvYqzYGP7ZSxgyp6pBtFgBUBYol/qtxfknMfxyK+7Kt244osVBB9TpTMGyAFF4Er7UiJSaHxRG1w==
X-Received: by 2002:a0c:e58e:: with SMTP id t14mr49414qvm.131.1580944382237;
	Wed, 05 Feb 2020 15:13:02 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id o17sm696332qtj.80.2020.02.05.15.13.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 15:13:01 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  5 Feb 2020 18:12:49 -0500
Message-Id: <a7dfcd09a44a35ce8cd109c3084486347782e8aa.1580944129.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580944129.git.bruce.ashfield@gmail.com>
References: <cover.1580944129.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] kernel-yocto.bbclass: do_kernel_configme: don't use +errexit, merge_config_build.log and fail when /.config wasn't created
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
X-List-Received-Date: Wed, 05 Feb 2020 23:13:01 -0000
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@gmail.com>

* for whatever reason, instead of silently continuing to build default kernel config

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index f71aa7d0a6..d961901b74 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -327,8 +327,6 @@ do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
-	set +e
-
 	# translate the kconfig_mode into something that merge_config.sh
 	# understands
 	case ${KCONFIG_MODE} in
@@ -354,8 +352,9 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
-	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}"	HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
-	if [ $? -ne 0 ]; then
+	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}
+
+	if [ $? -ne 0 -o ! -f ${B}/.config ]; then
 		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
 
-- 
2.19.1


