Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF846A59E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 07:29:18 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id CB6D6A6168
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 09:29:15 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 09:29:14 +0200
Message-Id: <1373354955-16500-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1373354955-16500-1-git-send-email-eric@eukrea.com>
References: <1373354955-16500-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [danny][PATCH 2/3] eglibc: fix build with recent texinfo (5.1)
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
X-List-Received-Date: Tue, 09 Jul 2013 07:29:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../remove_hsep_and_vsep_from_info_pages.patch     |   71 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/remove_hsep_and_vsep_from_info_pages.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/remove_hsep_and_vsep_from_info_pages.patch b/meta/recipes-core/eglibc/eglibc-2.16/remove_hsep_and_vsep_from_info_pages.patch
new file mode 100644
index 0000000..3a9abe1
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/remove_hsep_and_vsep_from_info_pages.patch
@@ -0,0 +1,71 @@
+From libc-alpha-return-35113-listarch-libc-alpha=sources dot redhat dot com at sourceware dot org Mon Dec 03 09:38:08 2012
+Return-Path: <libc-alpha-return-35113-listarch-libc-alpha=sources dot redhat dot com at sourceware dot org>
+Delivered-To: listarch-libc-alpha at sources dot redhat dot com
+Received: (qmail 4372 invoked by alias); 3 Dec 2012 09:38:05 -0000
+Received: (qmail 3968 invoked by uid 22791); 3 Dec 2012 09:38:03 -0000
+X-SWARE-Spam-Status: No, hits=-2.1 required=5.0
+	tests=AWL,BAYES_00,RP_MATCHES_RCVD
+X-Spam-Check-By: sourceware.org
+From: Allan McRae <allan at archlinux dot org>
+To: libc-alpha at sourceware dot org
+Subject: [PATCH] Remove @hsep and @vsep usage from info pages
+Date: Mon,  3 Dec 2012 19:37:44 +1000
+Message-Id: <1354527464-15109-1-git-send-email-allan@archlinux.org>
+Mailing-List: contact libc-alpha-help at sourceware dot org; run by ezmlm
+Precedence: bulk
+List-Id: <libc-alpha.sourceware.org>
+List-Subscribe: <mailto:libc-alpha-subscribe at sourceware dot org>
+List-Archive: <http://sourceware.org/ml/libc-alpha/>
+List-Post: <mailto:libc-alpha at sourceware dot org>
+List-Help: <mailto:libc-alpha-help at sourceware dot org>, <http://sourceware dot org/ml/#faqs>
+Sender: libc-alpha-owner at sourceware dot org
+Delivered-To: mailing list libc-alpha at sourceware dot org
+
+2012-12-03  Allan McRae  <allan@archlinux.org>
+
+	* manual/stdio.texi (Predefined Printf Handlers): Remove
+	@hsep and @vsep usage.
+
+Upstream-Status: Backport
+---
+
+As far as I can tell, @hsep and @vsep have not been supported in texinfo for
+a long time, although it attempted to add the requested separators resulting
+in ugliness:
+
+     +------+--------------+--------+--------+---------------+
+     |low|Multiplier|From|Upper|Multiplier|
+     |' '|1||' '|1|
+     |k|2^10 (1024)|kilo|K|10^3 (1000)|
+
+Go to "info libc" then 
+IO on streams -> Customizing Printf -> Predefined Printf Handlers
+to see this section.
+
+With texinfo 4.13.91, this becomes an error:
+
+./stdio.texi:3140: Unknown command `hsep'
+./stdio.texi:3140: Unknown command `vsep'
+
+There is also 215 lines of warnings to be fixed at a later date...
+
+
+ manual/stdio.texi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/manual/stdio.texi b/manual/stdio.texi
+index be769a5..7b436f0 100644
+--- a/manual/stdio.texi
++++ b/manual/stdio.texi
+@@ -3137,7 +3137,7 @@ The postfix tag corresponds to bytes, kilobytes, megabytes, gigabytes,
+ etc.  The full table is:
+ 
+ @ifinfo
+-@multitable @hsep @vsep {' '} {2^10 (1024)} {zetta} {Upper} {10^24 (1000)}
++@multitable {' '} {2^10 (1024)} {zetta} {Upper} {10^24 (1000)}
+ @item low @tab Multiplier  @tab From  @tab Upper @tab Multiplier
+ @item ' ' @tab 1           @tab       @tab ' '   @tab 1
+ @item k   @tab 2^10 (1024) @tab kilo  @tab K     @tab 10^3 (1000)
+-- 
+1.8.0.1
+
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 78bf9be..4db1ea5 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -32,6 +32,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch \
            file://fsl-ppc-no-fsqrt.patch \
            file://0001-R_ARM_TLS_DTPOFF32.patch \
+           file://remove_hsep_and_vsep_from_info_pages.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.10.4


