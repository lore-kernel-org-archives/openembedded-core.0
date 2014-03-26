Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 84FC56E40A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:31:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2Q9VKlF005741 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:31:21 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CxfMfdjbBK-6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:31:20 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2Q9VFoi005733
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:31:17 GMT
Message-ID: <1395826269.24890.82.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 09:31:09 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [RFC PATCH 2/3] base.bbclass: Merge two ConfigParsed event handlers
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
X-List-Received-Date: Wed, 26 Mar 2014 09:31:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There were two ConfigParsed event handlers in base.bbclass, this merges
them together for small efficiency wins.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f085173..360b112 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -38,13 +38,6 @@ def oe_import(d):
 BASEIMPORTS = "${@oe_import(d)}"
 inherit ${BASEIMPORTS}
 
-python oe_import_eh () {
-    e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
-}
-
-addhandler oe_import_eh
-oe_import_eh[eventmask] = "bb.event.ConfigParsed"
-
 def lsb_distro_identifier(d):
     adjust = d.getVar('LSB_DISTRO_ADJUST', True)
     adjust_func = None
@@ -296,6 +289,7 @@ addhandler base_eventhandler
 base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted"
 python base_eventhandler() {
     if isinstance(e, bb.event.ConfigParsed):
+        e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
         e.data.setVar('BB_VERSION', bb.__version__)
         pkgarch_mapping(e.data)
         preferred_ml_updates(e.data)



