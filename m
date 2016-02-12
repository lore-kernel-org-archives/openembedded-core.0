Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 73BF973204
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBaFrj017163 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:36:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QOn62-nABmLd
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:36:15 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBaDCd017159
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:36:14 GMT
Message-ID: <1455276973.16142.276.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Feb 2016 11:36:13 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] buildhistory: Fix regex to handle versions without spaces
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
X-List-Received-Date: Fri, 12 Feb 2016 11:36:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its valid to have dependencies like XXX (=2.1) without spaces, as injected
by debian.bbclass. The code was breaking these into separate components
and destroying them so improve the regex to handle them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 32e096b..52a5f31 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -145,7 +145,7 @@ python buildhistory_emit_pkghistory() {
             return None
 
     def sortpkglist(string):
-        pkgiter = re.finditer(r'[a-zA-Z0-9.+-]+( \([><=]+ [^ )]+\))?', string, 0)
+        pkgiter = re.finditer(r'[a-zA-Z0-9.+-]+( \([><=]+[^)]+\))?', string, 0)
         pkglist = [p.group(0) for p in pkgiter]
         pkglist.sort()
         return ' '.join(pkglist)



