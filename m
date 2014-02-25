Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA2E6E71C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 17:41:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1PHetIk017818 for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 17:41:30 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nPMBhMJzbkLD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 17:41:29 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1PHfOYp017842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 17:41:26 GMT
Message-ID: <1393350077.31769.102.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Feb 2014 17:41:17 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] base: Remove pointless createCopy/update_data calls
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
X-List-Received-Date: Tue, 25 Feb 2014 17:41:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I was asked why we had these copy and update_data calls. I can
offer no good explanation other than them perhaps once being needed
for reasons long since forgotten and superceeded.

With modern bitbake these should not be needed and shouldn't have been
for a long time. Lets therefore remove them and simplify the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 7837c89..3e9051c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -106,11 +106,8 @@ python base_do_fetch() {
     if len(src_uri) == 0:
         return
 
-    localdata = bb.data.createCopy(d)
-    bb.data.update_data(localdata)
-
     try:
-        fetcher = bb.fetch2.Fetch(src_uri, localdata)
+        fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.download()
     except bb.fetch2.BBFetchException as e:
         raise bb.build.FuncFailed(e)
@@ -124,13 +121,10 @@ python base_do_unpack() {
     if len(src_uri) == 0:
         return
 
-    localdata = bb.data.createCopy(d)
-    bb.data.update_data(localdata)
-
-    rootdir = localdata.getVar('WORKDIR', True)
+    rootdir = d.getVar('WORKDIR', True)
 
     try:
-        fetcher = bb.fetch2.Fetch(src_uri, localdata)
+        fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.unpack(rootdir)
     except bb.fetch2.BBFetchException as e:
         raise bb.build.FuncFailed(e)
@@ -653,11 +647,8 @@ python do_cleanall() {
     if len(src_uri) == 0:
         return
 
-    localdata = bb.data.createCopy(d)
-    bb.data.update_data(localdata)
-
     try:
-        fetcher = bb.fetch2.Fetch(src_uri, localdata)
+        fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.clean()
     except bb.fetch2.BBFetchException, e:
         raise bb.build.FuncFailed(e)



