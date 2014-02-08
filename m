Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id AC7EE6E36A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2014 20:56:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s18KuCJQ020755 for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Feb 2014 20:56:13 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dt1no3J9H7li
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2014 20:56:12 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s18Ku7vl020751
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Feb 2014 20:56:09 GMT
Message-ID: <1391892962.32614.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 08 Feb 2014 20:56:02 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] systemd-compat-units: Handle nfs scripts
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
X-List-Received-Date: Sat, 08 Feb 2014 20:56:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The nfs init scripts have both systemd and sysvinit versions with
non-matching names so we need to mask out the duplicate scripts
else we see NFS errors on bootup.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index fe4c50c..a9cc15a 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -15,6 +15,8 @@ SYSTEMD_DISABLED_SYSV_SERVICES = " \
   busybox-udhcpc \
   hwclock \
   networking \
+  nfsserver \
+  nfscommon \
   syslog.busybox \
 "
 



