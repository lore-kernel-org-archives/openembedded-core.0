Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7D23A65C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 17:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0LHe6BE006434 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 17:40:06 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lXpx82ZZog4u
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 17:40:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0LHdrEa006403
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 17:40:05 GMT
Message-ID: <1421861993.19798.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jan 2015 17:39:53 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] net-tools: Fix rerunning of do_patch task
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
X-List-Received-Date: Wed, 21 Jan 2015 17:40:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Rerunning the do_patch task currently fails. The code is nearly correct
but needs to remove the quilt ".pc" directory and move the secondary
one into place in order to rerun, not move it into the .pc directory
as the code currently does.

[YOCTO #7128]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb b/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
index 02826a0..0e4ee75 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
@@ -34,6 +34,7 @@ nettools_do_patch() {
 	cd ${S}
 	quilt pop -a || true
 	if [ -d ${S}/.pc-nettools ]; then
+		rm -rf ${S}/.pc
 		mv ${S}/.pc-nettools ${S}/.pc
 		QUILT_PATCHES=${S}/debian/patches quilt pop -a
 		rm -rf ${S}/.pc ${S}/debian



