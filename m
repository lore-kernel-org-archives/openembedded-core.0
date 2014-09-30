Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1A01260809
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 12:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8UCvX9C004391 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 13:57:33 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iDTHF0ubmwnd
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 13:57:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8UCvUw3004343
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 13:57:31 +0100
Message-ID: <1412081883.6893.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Sep 2014 13:58:03 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] sstate: Add rpm allarch to overwrite whitelist
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
X-List-Received-Date: Tue, 30 Sep 2014 12:58:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The packagegroup allarch rpm files for multilib can overwrite each other since
they are in theory indentical (in contrast to the other backends). We therefore
need to whitelist this to avoid build failures now this overwrite failure
is fatal.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 9160e7f..403d6a0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -21,7 +21,8 @@ SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC
 # of the system, we let the sstate paths take care of this.
 SSTATE_EXTRAPATH[vardepvalue] = ""
 
-SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/"
+# For multilib rpm the allarch packagegroup files can overwrite (in theory they're identical)
+SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_RPM}/all/"
 # Avoid docbook/sgml catalog warnings for now
 SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
 



