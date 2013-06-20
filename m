Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8F22961EB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 15:48:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5KFsrEc016488 for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:54:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FT6Dfl4QxelT
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:54:53 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5KFslPh016484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:54:49 +0100
Message-ID: <1371743303.20823.241.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2013 16:48:23 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] base.bbclass: Ensure finalised data is displayed in build banner
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
X-List-Received-Date: Thu, 20 Jun 2013 15:48:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The build banner displayed at the start of builds can be misleading since
the data store has not been finalised. As easy way to illustrate this is
to use something like:

DEFAULTTUNE = "i586"
DEFAULTTUNE_<machineoverride> = "core2"

and the banner will display the i586 tune yet the core2 tune will be
used. We can avoid this if we finalise a copy of the data before
displaying it.

[YOCTO #4225]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5e6ed1d..97b2a26 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -309,13 +309,15 @@ python base_eventhandler() {
         oe.utils.features_backfill("MACHINE_FEATURES", e.data)
 
     if isinstance(e, bb.event.BuildStarted):
+        localdata = bb.data.createCopy(e.data)
+        bb.data.update_data(localdata)
         statuslines = []
-        for func in oe.data.typed_value('BUILDCFG_FUNCS', e.data):
+        for func in oe.data.typed_value('BUILDCFG_FUNCS', localdata):
             g = globals()
             if func not in g:
                 bb.warn("Build configuration function '%s' does not exist" % func)
             else:
-                flines = g[func](e.data)
+                flines = g[func](localdata)
                 if flines:
                     statuslines.extend(flines)
 



