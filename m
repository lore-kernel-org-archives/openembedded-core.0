Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SU4Ef-0005Jr-OE
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 00:59:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4EMnP4B013359
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 15:49:25 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 14 May 2012 15:49:24 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 May 2012 17:49:23 -0500
Message-ID: <48e888dd2f3cebd256476a7ddd90f2d1a88ad788.1337035611.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1337035611.git.peter.seebach@windriver.com>
References: <cover.1337035611.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu: replace bashism with working shell idiom
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
X-List-Received-Date: Mon, 14 May 2012 22:59:26 -0000
Content-Type: text/plain

The =~ operator is not one of my favorites, not just due to portability
issues, but because it's not well known, and a lot of people might
not expect a regex operator.

The canonical shell idiom for this is to use case with alternation
and wildcards.  As a side note, if you are matching anything containing
core-image-sato, you don't need to also check for core-image-sato-sdk.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 scripts/runqemu |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 305e46a..fc7363f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -300,14 +300,15 @@ findimage() {
     # recently created one is the one we most likely want to boot.
     filenames=`ls -t $where/*-image*$machine.$extension 2>/dev/null | xargs`
     for name in $filenames; do
-        if [ "$name" =~ core-image-sato-sdk -o \
-              "$name" =~ core-image-sato     -o \
-              "$name" =~ core-image-lsb      -o \
-              "$name" =~ core-image-basic    -o \
-              "$name" =~ core-image-minimal ]; then
+        case $name in
+        *core-image-sato* | \
+        *core-image-lsb* | \
+        *core-image-basic* | \
+        *core-image-minimal* )
             ROOTFS=$name
             return
-        fi	
+            ;;
+        esac
     done
 
     echo "Couldn't find a $machine rootfs image in $where."
-- 
1.7.0.4



