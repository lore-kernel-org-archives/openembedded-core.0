Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6FhA-0006Kp-5M
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 08:54:40 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1156736eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=GpVnUCX0VLd2AGCUqreh26PMxQ7VnBrMmz+2Zvy7epA=;
	b=g6TiniEgrhtE0hZ6u2+p8BSRplcdi4EVUEJQOU4zGU7HY8J0R//CMBExfzFS8GnmLE
	GqBrUN6nJ86GEK7XRIkfgSWXin+Jw/SkQ4ROCyVCy40Xmy55+tIIuyNHFVFZ7YA3TX4Q
	qNwOQ1Y08XZw1lNpNaKkOzvf29hWc/Rp+TR1+rfjF9II5cICXC+rUyCL1eNDo8WrHbzT
	tNd/va6QRpMNZBDAkXYslaZzyjLuOihzmNywrzExBpuwF966tnpx0jT92y7SRXg/FhAP
	QgbMKH43WWnbPrwaS2/7qWzBnmkL/hYYUALap0Fc78Rna2PZDGPvyohDT3ey0GBssNSA
	92pw==
Received: by 10.14.181.132 with SMTP id l4mr20820937eem.17.1346136150072;
	Mon, 27 Aug 2012 23:42:30 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id a7sm58202958eep.14.2012.08.27.23.42.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:42:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:41:45 +0200
Message-Id: <1346136108-13062-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnJhq0e481oR9GJBPbHPU4n3MMt6/WOKwru71e8ylnhuApUlCZJa52uRAzXX3mvxoLV1/8K
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][meta-oe][PATCH 08/11] kernel: save $kerndir/tools and $kerndir/lib from pruning
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
X-List-Received-Date: Tue, 28 Aug 2012 06:54:40 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

The kernel source tree in the sysroot has all unecessary source
code removed. The existing use case is to support module building
out of the sysroot, but as more toolsa are moved into the kernel
tree itself there are new use cases for the kernel sysroot source.

To avoid putting dependencies on the kernel, and to be able to
individually build and package these tools out of the source tree,
we can save $kerndir/tools and $kernddir/lib from being removed.
This enables tools like perf to be built our of the kernel source
in the sysroot, without significantly increasing the amount of
source in the sysroot.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7512ee0..3ccd753 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -173,7 +173,7 @@ kernel_do_install() {
 	#
 	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
 	make -C $kerneldir _mrproper_scripts
-	find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
+	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
 	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
 
 	# As of Linux kernel version 3.0.1, the clean target removes
-- 
1.7.7.6



