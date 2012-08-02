Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1SwwQl-00021I-Qv
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:31:16 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1SwwFT-0007Ux-Rf from wade_farnsworth@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 07:19:35 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 2 Aug 2012 07:19:35 -0700
Received: from [172.30.4.61] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1; Thu, 2 Aug 2012
	07:19:34 -0700
Message-ID: <501A8C5C.8090503@mentor.com>
Date: Thu, 2 Aug 2012 07:19:08 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <501A8C20.8020502@mentor.com>
In-Reply-To: <501A8C20.8020502@mentor.com>
X-OriginalArrivalTime: 02 Aug 2012 14:19:35.0721 (UTC)
	FILETIME=[D7E87990:01CD70B9]
Subject: [PATCH 1/1] systemtap-uprobes: inhibit package strip
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
X-List-Received-Date: Thu, 02 Aug 2012 14:31:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

uprobes.ko is not located in /lib/modules, so it fails the check in
runstrip that ensures that only the debug section is stripped, leaving
the symbols untouched.  This prevents the module from being inserted at
run time.  Inhibiting package stripping fixes the problem.

Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
---
 .../systemtap/systemtap-uprobes_git.bb             |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
index b328e6b..f135a54 100644
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -9,6 +9,8 @@ PR = "r0"
 # On systems without CONFIG_UTRACE, this package is empty.
 ALLOW_EMPTY_${PN} = "1"
 
+INHIBIT_PACKAGE_STRIP = "1"
+
 inherit module-base gettext
 
 FILES_${PN} += "${datadir}/systemtap/runtime/uprobes"
-- 
1.7.0.4



