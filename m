Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6FhH-0006Kp-Ns
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 08:54:48 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1156736eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=AqllHZrs4lOXK5DNTXquigdDNL9rWD2nzY80OUWHXhE=;
	b=f/lpmKF9gXqdn1ViK6qQVnIs+zWT+zKCURLOAu0zNqiwHMe6n0ZzK8gyglDIZgphEd
	cmJJXGOvoKVy3dyGxOtwsPUAdyT9CaDwgdks0g/BQ4p16BozB6dG+EHVKXI+lg/ljvax
	rEdfmrQ6YOmGq6Z0YqVx5bgBGRBNUQPxgT2M4y8H0CugIGBTWO5ovTmi15CAr18Ae458
	vifEoVDVD7IBHcnhffksOffLIotznJYTfvep3CLxjfMOD51kw7t0UcQvcu8J0ndhzNx5
	O8+ukJ/A1uJrW/FlFcYqaDNy76oHDxY0rZUuzEnTlMO3hRHC5f758ePQUF7iOSaGL0H8
	3HrA==
Received: by 10.14.172.129 with SMTP id t1mr20795452eel.34.1346136157630;
	Mon, 27 Aug 2012 23:42:37 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id 45sm58240755eeb.8.2012.08.27.23.42.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:42:35 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:41:47 +0200
Message-Id: <1346136108-13062-10-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnvXhD+bzZ+1qC/NgtPDzZQAqT1pVvgv4cD8yooXpYL16oK37l2OfO//QXxjhc/CBGAINgH
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][meta-oe][PATCH 10/11] kernel.bbclass: add non-santized kernel provides
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 06:54:49 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

If the kernel version string uses characters or symbols that
need to be santized for the package name, we can end up with a
mismatch between module requirements and what the kernel
provides.

The kernel version is pulled from utsrelease.h, which contains
the exact string that was passed to the kernel build, not
one that is santized, this can result in:

 echo "CONFIG_LOCALVERSION="\"MYVER+snapshot_standard\" >> ${B}/.config

 <build>

 % rpm -qp kernel-module-uvesafb-3.4-r0.qemux86.rpm --requires
update-modules
kernel-3.4.3-MYVER+snapshot_standard
 % rpm -qp kernel-3.4.3-myver+snapshot-standard-3.4-r0.qemux86.rpm --provides
kernel-3.4.3-myver+snapshot-standard = 3.4-r0

At rootfs assembly time, we'll have a dependency issue with the kernel
providing the santizied string and the modules requiring the utsrelease.h
string.

To not break existing use cases, we can add a second provides to the
kernel packaging with the unsantized version string, and allowing the
kernel module packaging to be unchanged.

   RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"

 % rpm -qp kernel-3.4.3-myver+snapshot-standard-3.4-r0.qemux86.rpm --provides
kernel-3.4.3-MYVER+snapshot_standard
kernel-3.4.3-myver+snapshot-standard = 3.4-r0

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d79ba9f..5de270f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -262,6 +262,7 @@ RDEPENDS_kernel = "kernel-base"
 RDEPENDS_kernel-base ?= "kernel-image"
 PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
 PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
+RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
 ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
-- 
1.7.7.6



