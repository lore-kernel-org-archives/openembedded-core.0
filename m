Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ACE4F6093F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491839915; x=1523375915; h=from:to:subject:date:message-id;
	bh=Yz2TKgEBtyYfUMFygQqiloc5PsEFCrBI3JoHm9DSaL8=;
	b=OUk02gCeFnL615e8Sr3cfdExmffk6BRaKG4LRaYsQPt5beHR09OfKqYD
	kQazwCsVWxBQL6iBXZlfTNJhJQEKlw==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2017 08:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,182,1488873600"; d="scan'208";a="246803722"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.112.101])
	by fmsmga004.fm.intel.com with ESMTP; 10 Apr 2017 08:58:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 10 Apr 2017 08:58:30 -0700
Message-Id: <1491839910-31562-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gnu-efi: copy header files for x32 build
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
X-List-Received-Date: Mon, 10 Apr 2017 15:58:34 -0000

Gnu-efi needs to be build for 64bit since it is a boot time tool. It
needs these 2 headers to be in 64 bit versions, we can use the existing
32bit ones as there is not really any difference.

[YOCTO #11051]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
index f46381d..6f235b7 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
@@ -24,6 +24,11 @@ SRC_URI[sha256sum] = "bd8fcd5914f18fc0e4ba948ab03b00013e528504f529c60739b748f6ef
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
 
+do_configure_linux-gnux32_prepend() {
+	cp ${STAGING_INCDIR}/gnu/stubs-x32.h ${STAGING_INCDIR}/gnu/stubs-64.h
+	cp ${STAGING_INCDIR}/bits/long-double-32.h ${STAGING_INCDIR}/bits/long-double-64.h
+}
+
 def gnu_efi_arch(d):
     import re
     tarch = d.getVar("TARGET_ARCH")
-- 
2.7.4


