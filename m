Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F1A1F6CBDF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 14:52:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1BEqWxw027225 for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 14:52:33 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yKAICnmGVhoF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 14:52:32 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1BEqRRZ027216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 14:52:29 GMT
Message-ID: <1392130342.7120.155.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Feb 2014 14:52:22 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Exclude SSTATE_EXTRAPATH from checksums
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
X-List-Received-Date: Tue, 11 Feb 2014 14:52:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

After the change to allow target recipes to depend on native recipes, the
native checksums becomes all the more critical. Add to this that we're now
accounting for pre/postfuncs and we have a cache reuse issue since the
distro LSB string is getting coded in when it shouldn't be.

This excludes that string and allows one set of native sstate to share
checksums with another set from a different host distro. They're separated
into different directories so this is fine for our use cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ec9c546..f7bd117 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -17,6 +17,10 @@ SSTATE_EXTRAPATH   = ""
 SSTATE_EXTRAPATHWILDCARD = ""
 SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC}"
 
+# We don't want the sstate to depend on things like the distro string
+# of the system, we let the sstate paths take care of this.
+SSTATE_EXTRAPATH[vardepvalue] = ""
+
 SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/"
 # Also need to make cross recipes append to ${PN} and install once for any given PACAGE_ARCH so
 # can avoid multiple installs (e.g. routerstationpro+qemumips both using mips32)



