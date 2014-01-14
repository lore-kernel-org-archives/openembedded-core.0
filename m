Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8D09F6D1D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 11:43:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0EBhMXY011812 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 11:43:22 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zlV4Ooc6T5Lj
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 11:43:22 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0EBhKAq011808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 11:43:22 GMT
Message-ID: <1389699794.14987.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2014 11:43:14 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] ptest: d.keys() is slow, use a list instead
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
X-List-Received-Date: Tue, 14 Jan 2014 11:43:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Unfortunately d.keys is extremely slow. Using a list in this case should be
fine since the addtask lines are immediately above the code and aren't
going to change often.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index e5bbb89..caf7101 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -55,6 +55,6 @@ python () {
 
     # Remove all '*ptest_base' tasks when ptest is not enabled
     if not(d.getVar('PTEST_ENABLED', True) == "1"):
-        for i in filter(lambda k: d.getVarFlag(k, "task") and k.endswith("ptest_base"), d.keys()):
+        for i in ['do_configure_ptest_base', 'do_compile_ptest_base', 'do_install_ptest_base']:
             bb.build.deltask(i, d)
 }



