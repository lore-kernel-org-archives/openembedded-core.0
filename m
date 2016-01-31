Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5FD877723F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0VDZwCt016156 for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:35:58 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5YDAs_dJDX8Q
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:35:58 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0VDZsZI016153
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:35:55 GMT
Message-ID: <1454247354.27087.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 31 Jan 2016 13:35:54 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] Revert using -m option to tar in sstate
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
X-List-Received-Date: Sun, 31 Jan 2016 13:35:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=2d89cff42af2bb0049224bfaaebaa2b21966169f
we added a workaround for dealing with lack of time sync between build
machines and their users.

This has turned out to cause problems for people who reply on timestamps
being preserved in sstate output.

Since our autobuilders are all in time sync with ntp, revert the commit.

[YOCTO #8996]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6c3e828..33aa8d7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -703,7 +703,7 @@ sstate_create_package () {
 # Will be run from within SSTATE_INSTDIR.
 #
 sstate_unpack_package () {
-	tar -xmvzf ${SSTATE_PKG}
+	tar -xvzf ${SSTATE_PKG}
 	# Use "! -w ||" to return true for read only files
 	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
 	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig



