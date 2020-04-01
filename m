Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1206.1585723819698457375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 23:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0316nltp015698
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 23:50:08 -0700
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 31 Mar 2020
 23:49:35 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] inetutils: Use alternatives to avoid manpage conflict
Date: Wed, 1 Apr 2020 09:48:06 +0300
Message-ID: <20200401064806.18529-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Fix the following manpage conflicts:
 * check_data_file_clashes: Package inetutils-doc wants to install file /usr/share/man/man1/tftp.1
	But that file is already provided by package  * tftp-hpa-doc
 * check_data_file_clashes: Package inetutils-doc wants to install file /usr/share/man/man8/tftpd.8
	But that file is already provided by package  * tftp-hpa-doc
 * check_data_file_clashes: Package netkit-telnet-doc wants to install file /usr/share/man/man8/telnetd.8
	But that file is already provided by package  * inetutils-doc

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 684fbe09e1..cc9410b94e 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -143,11 +143,15 @@ ALTERNATIVE_${PN}-traceroute = "traceroute"
 ALTERNATIVE_${PN}-hostname = "hostname"
 ALTERNATIVE_LINK_NAME[hostname]  = "${base_bindir}/hostname"
 
-ALTERNATIVE_${PN}-doc = "hostname.1 dnsdomainname.1 logger.1 syslogd.8"
+ALTERNATIVE_${PN}-doc = "hostname.1 dnsdomainname.1 logger.1 syslogd.8 \
+                         tftpd.8 tftp.1 telnetd.8"
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
 ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
 ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
+ALTERNATIVE_LINK_NAME[telnetd.8] = "${mandir}/man8/telnetd.8"
+ALTERNATIVE_LINK_NAME[tftpd.8] = "${mandir}/man8/tftpd.8"
+ALTERNATIVE_LINK_NAME[tftp.1] = "${mandir}/man1/tftp.1"
 
 ALTERNATIVE_${PN}-ifconfig = "ifconfig"
 ALTERNATIVE_LINK_NAME[ifconfig]  = "${base_sbindir}/ifconfig"
-- 
2.17.1

