Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREM-0007XX-Pk
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:28:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPBK4026663
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:11 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:10 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:02 -0500
Message-ID: <d841fe05df49bcc07373ab510be5ddeb9f97324c.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 08/40] perf: Fix linux-tools to ensure perf is installed under "fakeroot"
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
X-List-Received-Date: Wed, 22 Jun 2011 17:28:49 -0000
Content-Type: text/plain

If perf isn't installed under "fakeroot" (pseudo) control, all of the files
are given the build user's uid/gid.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-kernel/linux/linux-tools.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
index ef81650..88a1c5b 100644
--- a/meta/recipes-kernel/linux/linux-tools.inc
+++ b/meta/recipes-kernel/linux/linux-tools.inc
@@ -6,11 +6,11 @@ do_compile_perf_libc-uclibc () {
 do_install_perf_libc-uclibc () {
 	:
 }
-do_compile_perf() {
+fakeroot do_compile_perf() {
 	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix} NO_NEWT=1 NO_DWARF=1
 }
 
-do_install_perf() {
+fakeroot do_install_perf() {
 	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix} DESTDIR=${D} install NO_NEWT=1 NO_DWARF=1
 }
 
-- 
1.7.3.4



