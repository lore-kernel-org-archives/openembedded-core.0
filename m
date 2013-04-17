Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sergey_Matyukevich@mentor.com>) id 1USRqB-0007Ps-CF
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 14:52:02 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1USRBn-0000j4-Ee from Sergey_Matyukevich@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 05:10:15 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 17 Apr 2013 05:10:14 -0700
Received: from bars.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.1.289.1; Wed, 17 Apr 2013 13:10:13 +0100
From: Sergey Matyukevich <sergey_matyukevich@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2013 16:10:12 +0400
Message-ID: <1366200612-22469-1-git-send-email-sergey_matyukevich@mentor.com>
X-Mailer: git-send-email 1.7.2.5
MIME-Version: 1.0
X-OriginalArrivalTime: 17 Apr 2013 12:10:14.0817 (UTC)
	FILETIME=[84A00110:01CE3B64]
Subject: [PATCH] map_kernel_arch: x86 sub-architectures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 12:52:03 -0000
Content-Type: text/plain

Suppose we build software for x86 targets on x86 build hosts. There are use-cases
when it is not enough to specify x86 as a kernel architecture. It is necessary
to go one step further and to specify proper x86 sub-architecture (i386 or
x86_64) of the target system.

This patch modifies kernel-arch.bbclass in the following way:
 - adds x86_64 to the list of valid architectures
 - differentiates between i386 and x86_64 sub-architectures in map_kernel_arch

Signed-off-by: Sergey Matyukevich <sergey_matyukevich@mentor.com>
---
 meta/classes/kernel-arch.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index b3b71ba..3e29f45 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -5,7 +5,7 @@
 #
 
 valid_archs = "alpha cris ia64 \
-               i386 x86 \
+               i386 x86 x86_64 \
                m68knommu m68k ppc powerpc powerpc64 ppc64  \
                sparc sparc64 \
                arm aarch64 \
@@ -20,7 +20,9 @@ def map_kernel_arch(a, d):
 
     valid_archs = d.getVar('valid_archs', True).split()
 
-    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
+    if   re.match('athlon$', a):                return 'x86'
+    elif re.match('i.86$', a):                  return 'i386'
+    elif re.match('x86.64$', a):                return 'x86_64'
     elif re.match('armeb$', a):                 return 'arm'
     elif re.match('aarch64$', a):               return 'arm64'
     elif re.match('mips(el|64|64el)$', a):      return 'mips'
-- 
1.7.2.5



