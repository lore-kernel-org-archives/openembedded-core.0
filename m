Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web10.4250.1623956818369666520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 12:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cybernetics.com header.s=mail header.b=ez91zvah;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==802c75fb84e==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1623956816-0fb3b02bd7d2ef0001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id ReLu29wQKdVzqgs4 for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 15:06:56 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=dTppMe2F1MW/mmmBcekJIXDA9TFeq0bofF+Cvl46Sqo=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:To; b=ez91zvah9Ut+Yeb8BD7a5CyXc80gWErvduxMBbDB3hTp7c5
	qcMUtpSJPV4jR/ZBHSMCsH+wHloqhBHbneBwg8wkzIVz0MLJRM7YLc1VZalPdGS8Bw9vcJeD1pAN3
	cEMOD1523COKL9JIsYI330qmduUOQaTXZ4j6Oib/n7PJrg0=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 10919390 for openembedded-core@lists.openembedded.org; Thu, 17 Jun 2021 15:06:56 -0400
To: openembedded-core@lists.openembedded.org
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
From: "Tony Battersby" <tonyb@cybernetics.com>
Subject: [PATCH] glibc: fix path to place zdump in the tzcode package
Message-ID: <e28daac3-9131-6f27-f8cc-577b821323d1@cybernetics.com>
X-ASG-Orig-Subj: [PATCH] glibc: fix path to place zdump in the tzcode package
Date: Thu, 17 Jun 2021 15:06:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1623956816
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 1234
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

zdump should be included in the tzcode package but is instead included
in the glibc-utils package due to an incorrect path in the recipe.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14427

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 8d0cc8047f..8841c5e3ca 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -43,7 +43,7 @@ FILES_${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
 FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
               ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
 FILES_${PN}-mtrace = "${bindir}/mtrace"
-FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
+FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${bindir}/zdump"
 FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
 FILES_catchsegv = "${bindir}/catchsegv"
 RDEPENDS_catchsegv = "libsegfault"
-- 
2.25.1

