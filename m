Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C50B65CDD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 13:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6ADCviL010899 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:12:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0-HowkpWwhsb
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:12:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6ADCkvB010891
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:12:57 +0100
Message-ID: <1436533966.3310.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 14:12:46 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] recipetool/append: Fix selftest failure with multilib
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
X-List-Received-Date: Fri, 10 Jul 2015 13:12:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you have multilib enabled, it finds lib32-base-files instead of 
base-files for test_recipetool_appendfile_basic causing a test 
failure. Add a fix for this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 9903871..a2133f7 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -280,6 +280,9 @@ def appendfile(args):
                 alternative_pns.append(pn[1:])
             elif pn.startswith('!'):
                 postinst_pns.append(pn[1:])
+            elif selectpn:
+                # hit here with multilibs
+                continue
             else:
                 selectpn = pn
 



