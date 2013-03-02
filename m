Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UBbIT-0005UG-Mg
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 02:31:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r221F7fR029862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2013 17:15:08 -0800 (PST)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Fri, 1 Mar 2013 17:15:07 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2013 19:14:57 -0600
Message-ID: <1362186897-9653-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH] package_rpm.bbclass: Fix translate_smart_to_oe arch comparison
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
X-List-Received-Date: Sat, 02 Mar 2013 01:31:39 -0000
Content-Type: text/plain

When the OE arch is of the format "foo_bar-foobar" the previous
comparison routine did not selectively translate the '-' causing
a failed comparison.

In order to work around this issue, we -always- compare the
RPM translated version of the package architectures.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index c0ba54d..697bb36 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -93,7 +93,8 @@ translate_smart_to_oe() {
 			while [ -n "$1" ]; do
 				cmp_arch=$1
 				shift
-				if [ "$arch" = "$cmp_arch" -o "$fixed_arch" = "$cmp_arch" ]; then
+				fixed_cmp_arch=`echo "$cmp_arch" | tr _ -`
+				if [ "$fixed_arch" = "$fixed_cmp_arch" ]; then
 					if [ "$mlib" = "default" ]; then
 						new_pkg="$pkg"
 						new_arch=$cmp_arch
@@ -114,7 +115,7 @@ translate_smart_to_oe() {
 					# break
 				fi
 			done
-			if [ "$found" = "1" ] && [ "$arch" = "$cmp_arch" -o "$fixed_arch" = "$cmp_arch" ]; then
+			if [ "$found" = "1" ] && [ "$fixed_arch" = "$fixed_cmp_arch" ]; then
 				break
 			fi
 		done
-- 
1.7.1



