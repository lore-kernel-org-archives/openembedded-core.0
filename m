Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 66FE260897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 12:14:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4LCI1VX019774 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 13:18:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hUvbozM4PFby
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 13:18:01 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4LCHvbT019766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 13:17:59 +0100
Message-ID: <1369127148.11013.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 May 2013 10:05:48 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.6.4-0ubuntu1 
Subject: [PATCH] scripts/bitbake: Handle the case where git isn't installed cleanly
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
X-List-Received-Date: Tue, 21 May 2013 12:14:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the user sees ugly errors if git isn't installed, this patch
cleans up the code to correctly handle that case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/bitbake | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index ca2bc82..31a34b3 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -60,7 +60,7 @@ fi
 needtar="1"
 needgit="1"
 TARVERSION=`tar --version | head -n 1 | cut -d ' ' -f 4`
-GITVERSION=`git --version | cut -d ' ' -f 3`
+GITVERSION=`git --version 2> /dev/null | cut -d ' ' -f 3`
 float_test() {
      echo | awk 'END { exit ( !( '"$1"')); }'
 }
@@ -72,9 +72,10 @@ version_compare() {
 # but earlier versions do not; this needs to work properly for sstate
 float_test "$TARVERSION > 1.23" && needtar="0"
 
-# Need git >= 1.7.5 for git-remote --mirror=xxx syntax
-version_compare $GITVERSION ">=" 1.7.5 && needgit="0"
-
+if [ ! -z $GITVERSION ]; then
+    # Need git >= 1.7.5 for git-remote --mirror=xxx syntax
+    version_compare $GITVERSION ">=" 1.7.5 && needgit="0"
+fi
 
 buildpseudo="1"
 if [ $needpseudo = "1" ]; then



