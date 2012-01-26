Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1RqVAM-0002YU-Sg
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 20:39:27 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1RqV2q-0006ct-BO from wade_farnsworth@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 11:31:40 -0800
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 26 Jan 2012 11:30:42 -0800
Received: from [172.30.9.43] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 26 Jan 2012 11:31:39 -0800
Message-ID: <4F21AA1B.6030603@mentor.com>
Date: Thu, 26 Jan 2012 12:31:39 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F1F26C6.8050501@mentor.com> <4F21A9CF.3020103@mentor.com>
In-Reply-To: <4F21A9CF.3020103@mentor.com>
X-OriginalArrivalTime: 26 Jan 2012 19:30:42.0632 (UTC)
	FILETIME=[FE2E4C80:01CCDC60]
Subject: [PATCH v2 2/3] systemtap: extend the recipe to build the native package
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
X-List-Received-Date: Thu, 26 Jan 2012 19:39:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Since the target image may not contain dev tools, it is useful to
provide native systemtap in order to be able to compile systemtap
scripts for the target.

Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 7172386..298e005 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -2,10 +2,12 @@ DESCRIPTION = "SystemTap - script-directed dynamic tracing and performance analy
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "elfutils sqlite3"
+DEPENDS = "elfutils sqlite3 systemtap-native"
+DEPENDS_virtclass-native = "elfutils sqlite3 gettext-native"
+DEPENDS_virtclass-nativesdk = "elfutils sqlite3 gettext-native"
 
 SRCREV = "a56e4b7800e3fa8f9df6f4434cb02f86f6e995bc"
-PR = "r3"
+PR = "r4"
 PV = "1.6+git${SRCPV}"
 
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
@@ -28,4 +30,6 @@ S = "${WORKDIR}/git"
 
 inherit autotools gettext
 
+BBCLASSEXTEND = "native nativesdk"
+
 FILES_${PN}-dbg += "${libexecdir}/systemtap/.debug"
-- 
1.7.0.4



