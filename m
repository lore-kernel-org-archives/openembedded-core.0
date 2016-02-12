Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D869E73204
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBZBwM017091 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:35:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id f-trL3Jeyls7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:35:48 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBZgFk017139
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:35:43 GMT
Message-ID: <1455276942.16142.275.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Feb 2016 11:35:42 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] debian: Fix superfluous setting for RPROVIDES
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
X-List-Received-Date: Fri, 12 Feb 2016 11:35:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

PKG_ can be set to something like ${MLPREFIX}<name> and the lack of expansion here
means the case where MLPREFIX is empty leads to a bogus RPROVIDES.

Use expansion of the variable to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 1b6979a..be7cacc 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -53,7 +53,7 @@ python debian_package_name_hook () {
         return (s[stat.ST_MODE] & stat.S_IEXEC)
 
     def add_rprovides(pkg, d):
-        newpkg = d.getVar('PKG_' + pkg, False)
+        newpkg = d.getVar('PKG_' + pkg, True)
         if newpkg and newpkg != pkg:
             provs = (d.getVar('RPROVIDES_' + pkg, True) or "").split()
             if pkg not in provs:



