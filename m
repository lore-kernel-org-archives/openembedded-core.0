Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1RtOwy-0006i9-Ua
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 20:37:37 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1RtOpI-0001xe-NI from wade_farnsworth@mentor.com ;
	Fri, 03 Feb 2012 11:29:40 -0800
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 3 Feb 2012 11:29:40 -0800
Received: from [172.30.8.16] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 3 Feb 2012 11:29:38 -0800
Message-ID: <4F2C35A1.4050504@mentor.com>
Date: Fri, 3 Feb 2012 12:29:37 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F1F26C6.8050501@mentor.com> <4F21A9CF.3020103@mentor.com>
	<4F2C3541.5000409@mentor.com>
In-Reply-To: <4F2C3541.5000409@mentor.com>
X-OriginalArrivalTime: 03 Feb 2012 19:29:40.0338 (UTC)
	FILETIME=[2C5AFD20:01CCE2AA]
Subject: [PATCH v3 2/3] systemtap: extend the recipe to build the native package
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
X-List-Received-Date: Fri, 03 Feb 2012 19:37:37 -0000
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
index e3e21d8..e3caab7 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -2,10 +2,12 @@ DESCRIPTION = "SystemTap - script-directed dynamic tracing and performance analy
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "elfutils sqlite3"
+DEPENDS = "elfutils sqlite3 systemtap-native"
+DEPENDS_virtclass-native = "elfutils-native sqlite3-native gettext-native"
+DEPENDS_virtclass-nativesdk = "elfutils-nativesdk sqlite3-nativesdk gettext-nativesdk"
 
 SRCREV = "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
-PR = "r3"
+PR = "r4"
 PV = "1.7+git${SRCPV}"
 
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
@@ -28,4 +30,6 @@ S = "${WORKDIR}/git"
 
 inherit autotools gettext
 
+BBCLASSEXTEND = "native nativesdk"
+
 FILES_${PN}-dbg += "${libexecdir}/systemtap/.debug"
-- 
1.7.0.4



