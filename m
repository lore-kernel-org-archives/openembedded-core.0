Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id BBEF27E41C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:44:51 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id t184so9583075itf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=G7TMcX+FAG22+7jjos0E76QvFWajJQ1Q6cA9bhmlh54=;
	b=AZ9eaa83m5vV+IwQjZ6ntX6Mxa3DSJ2WJ3E/Ixh97OQq3pne3kyg384IP4QHZ/J2L9
	B2Sr/LsCdmHu76mDVbVPtRAma3Q+IcRXDhPUYeCqViWBFoOm2je7teRZJQwtAw2HaHCA
	vaIuXCIilxqPtR8R78jwn7KjZzGLrT3K7q10K3EijRiTYBQzHQ5jofSmG03zzkovg3Mo
	P0K9HKODzufLZpibhfS5t3I8bNQeXUxHS5nggvPipYh5YOiNsfAMgVvv+YvLCbun9r01
	f6QGIGVEzGvlQxKRuEdMOB7xM7AzK6wjojYwx6+NcvorbBD4ICODmLEehAhjeGT6o88L
	cUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G7TMcX+FAG22+7jjos0E76QvFWajJQ1Q6cA9bhmlh54=;
	b=XcfayPJfLgRkWu0VmagMIEi1umkNo3wHAoNfi1Dbf0+Hx0JUxlWS4zDwLE2YK9fOlG
	WF89rN/RNUUxqFiDIyNraviUDKjd4CxiMmD2cNMcI+4eTiyGlHc4dNW9ACkwI0HXgDkA
	WJNpOCzBubBBURHHmOcqE2zboYFHhm+2c8uAA/w7kHWIskARE8hNpZCaoHq6Z/KiSqRG
	xiJ34XVAdvQ44kjy8VSFRhSq2/+G381PFFVodY3ELF2BOeLHXoABU+yngQyhLwP0GX/V
	655ht1av1rT4eqdbC2f5lBY86hiqshoR4PVPvlhPZu966Osf0cdeR0MZHTogVsnyPH1g
	CD5Q==
X-Gm-Message-State: APjAAAU59rTugEP9T/uF0LUvuR9DoKt1hwmR+Fru2YSFK0Tj5ggHleMP
	OnmRHgw0/zZ5kwOkS++yf30=
X-Google-Smtp-Source: APXvYqxSgkBBBZ6Kp71mP2AoNo43KXTNCKEL5UrU9Lx7crx1xMMXKmx9LB7OEWL/ZRNWTsAMss/m1A==
X-Received: by 2002:a05:660c:64f:: with SMTP id
	y15mr2819383itk.180.1559220292709; 
	Thu, 30 May 2019 05:44:52 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	s70sm1034266itb.16.2019.05.30.05.44.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 05:44:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu, 30 May 2019 08:44:39 -0400
Message-Id: <74d2e3a8ebd01013d2fb417670ccfb668974cb95.1559220004.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559220004.git.bruce.ashfield@gmail.com>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] kernel: package modules.builtin.modinfo
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
X-List-Received-Date: Thu, 30 May 2019 12:44:52 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

As of commit 898490c010b [moduleparam: Save information about built-in
modules in separate file] (kernels v5.2-rc1+), modules.builtin.modinfo
is generated as part of the kernel build process.

We package it along with the other module artifacts, so it can be used
by scripts/other build steps.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 437b8c7671..111a0b2eeb 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -558,7 +558,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
 PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
 FILES_${PN} = ""
-FILES_${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
+FILES_${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
 FILES_${KERNEL_PACKAGE_NAME}-image = ""
 FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
-- 
2.19.1


