Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMHFO-00081o-FZ for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 12:11:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HA8UUD008509
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 11:08:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03909-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 11:08:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HA8LTA008487
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 11:08:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2011 11:08:18 +0100
Message-ID: <1305626898.3424.223.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [RFC PATCH] distro/defaultsetup.conf: Append TCLIBC to TMPDIR by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2011 10:11:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The current solutions to share uclibc, eglibc and glibc builds in the
same tree all have various issues associated with them. Appending the
suffix to TMPDIR seems like the best solution since sstate (which
defaults to outside TMPDIR) will allow reuse of any components.

This avoids messy changes to the core with other approaches to this
problem inevitably entail, usually in code where this abstraction isn;'t
logically best placed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 8da6c0a..e7636b4 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -14,6 +14,10 @@ require conf/distro/include/tcmode-${TCMODE}.inc
 TCLIBC ?= "eglibc"
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
+# Allow single libc distros to disable this code
+TCLIBCAPPEND ?= "-${TCLIBC}"
+TMPDIR_append = "${TCLIBCAPPEND}"
+
 CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))
 
 USER_CLASSES ?= ""
diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index 27f6ec6..83418d6 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -20,12 +20,6 @@ CXXFLAGS += "-fvisibility-inlines-hidden"
 
 IMAGE_LINGUAS = ""
 
-DEPLOY_DIR_IMAGE = "${TMPDIR}/deploy/images"
-DEPLOY_DIR_append = "-uclibc"
-STAGING_DIR_TARGET_append = "-uclibc"
-STAGING_DIR_HOST_append = "-uclibc"
-SSTATE_MANIFESTS_append = "-uclibc"
-
 LIBC_DEPENDENCIES = "\
     uclibc \
     uclibc-dbg \




