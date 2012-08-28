Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6Fh7-0006Ki-0W
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 08:54:37 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so1416465eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=o4/GizhJlZ+JJGNyv8J1l4bjeltrJyEHKvbw1mzSHuI=;
	b=JnN6H5z3yno8VA7tMDCxw72OOV/38apjIcMUIne8a5MUK3KBvBC14yWhCHoz9eD+7B
	cvO64Uw9QjiepcW9UebsRiRG/+HSj/rryHrp7pOdH3FT1YjmTWpy7MbnRJLfy+NaLm8V
	Y8sjgKqhgNY8gRm2QWfVbvAAOG6JuK2Ly8Nt1u19BZEvBMYPNr04KGmwX45lGjmNKS8m
	8f5GpV8MyHOvHJDIKX+qoiSVKZiXDGhQq+Jtv9k/OOebTyrdytakibFZ3CD1ySYd3Ppj
	0MpBppj4YvIbwvh4ukbIIhbzrzGBRnma8UnRHN/Jlb3Ze503+ZUofpSmAoPYf2yBaFhj
	t8aQ==
Received: by 10.14.5.67 with SMTP id 43mr20579608eek.15.1346136146823;
	Mon, 27 Aug 2012 23:42:26 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id i8sm2348783eeo.16.2012.08.27.23.42.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:42:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:41:44 +0200
Message-Id: <1346136108-13062-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmAiMwoqrOb7DzevaRBOZY362YjsPN0ESUt1AV4KHF/z3zUvRs43tAYIM4hM63+k3jH7gdc
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][meta-oe][PATCH 07/11] kernel.bbclass: pass KERNEL_VERSION to depmod calls in postinst
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
X-List-Received-Date: Tue, 28 Aug 2012 06:54:37 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* without this, kernel upgrades where KERNEL_VERSION is changed
  e.g. 3.4.2 -> 3.4.3 generate .dep for running 3.4.2 and after reboot user ends
  up without any module loaded to make it worse after reboot nothing is upgraded
  to trigger another kernel(-module) postinst to generate .dep for now running 3.4.3

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5f6ff66..7512ee0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -276,13 +276,13 @@ fi
 if [ -n "$D" ]; then
 	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
-	depmod -a
+	depmod -a ${KERNEL_VERSION}
 fi
 }
 
 pkg_postinst_modules () {
 if [ -z "$D" ]; then
-	depmod -a
+	depmod -a ${KERNEL_VERSION}
 	update-modules || true
 fi
 }
-- 
1.7.7.6



