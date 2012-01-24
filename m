Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1RpoLZ-0003iJ-Jw
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 22:56:09 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1RpoE5-0004zc-Bm from wade_farnsworth@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 13:48:25 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 24 Jan 2012 13:48:25 -0800
Received: from [172.30.9.40] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 24 Jan 2012 13:48:24 -0800
Message-ID: <4F1F2728.1070202@mentor.com>
Date: Tue, 24 Jan 2012 14:48:24 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F1F26C6.8050501@mentor.com>
In-Reply-To: <4F1F26C6.8050501@mentor.com>
X-OriginalArrivalTime: 24 Jan 2012 21:48:25.0209 (UTC)
	FILETIME=[E63BFE90:01CCDAE1]
Subject: [PATCH 2/3] systemtap: extend the recipe to build the native package
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
X-List-Received-Date: Tue, 24 Jan 2012 21:56:09 -0000
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



