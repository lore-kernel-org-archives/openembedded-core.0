Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id EEE816121F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 17:13:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s34HD6Qf025319 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Apr 2014 18:13:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KsL56ZzShs-K
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 18:13:06 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s34HD37G025313
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Apr 2014 18:13:04 +0100
Message-ID: <1396631578.13862.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Apr 2014 18:12:58 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] siteconfig: Unbreak after sstate changes some time ago
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
X-List-Received-Date: Fri, 04 Apr 2014 17:13:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Some time ago, the sstate name field was dropped. This code wouldn't have
worked since then. Makes me wonder if we really need it.

Anyhow, my last patch properly breaks it. This fixes the naming so
it works as designed again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bbclass
index 3701b7c..9a4d03b 100644
--- a/meta/classes/siteconfig.bbclass
+++ b/meta/classes/siteconfig.bbclass
@@ -1,6 +1,6 @@
 python siteconfig_do_siteconfig () {
 	shared_state = sstate_state_fromvars(d)
-	if shared_state['name'] != 'populate-sysroot':
+	if shared_state['task'] != 'populate_sysroot':
 		return
 	if not os.path.isdir(os.path.join(d.getVar('FILE_DIRNAME', True), 'site_config')):
 		bb.debug(1, "No site_config directory, skipping do_siteconfig")



