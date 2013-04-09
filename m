Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPXux-0003mD-AX for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 14:44:55 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39CcgD0011597 for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2013 13:38:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UaTRspnYA5O3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2013 13:38:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39CcaMa011593
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2013 13:38:38 +0100
Message-ID: <1365510444.12407.78.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Apr 2013 13:27:24 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: cronie: Convert crontab to a system user
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
X-List-Received-Date: Tue, 09 Apr 2013 12:44:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

crontab is meant to be a system user, not a normal user of the system
so lets pass the correct parameters to the system. If we don't do this
it interferes with the setup of normal users, particularly if some 
preset list of users is desired.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/cronie/cronie_1.4.9.bb b/meta/recipes-extended/cronie/cronie_1.4.9.bb
index 7db0381..b338c37 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.9.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.9.bb
@@ -40,7 +40,7 @@ INITSCRIPT_NAME = "crond"
 INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "crontab"
+GROUPADD_PARAM_${PN} = "--system crontab"
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/sysconfig/




