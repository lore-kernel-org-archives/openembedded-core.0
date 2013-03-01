Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rich.dubielzig@windriver.com>) id 1UBZAV-0000v1-OD
	for Openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 00:15:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r21Mwmvm010677
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2013 14:58:48 -0800 (PST)
Received: from ala-lpd-test3.wrs.com (147.11.105.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Fri, 1 Mar 2013 14:58:46 -0800
From: Rich Dubielzig <rich.dubielzig@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2013 14:58:31 -0800
Message-ID: <1362178711-11594-1-git-send-email-rich.dubielzig@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20130301224538.GV3279@jama>
References: <20130301224538.GV3279@jama>
MIME-Version: 1.0
Cc: rich.dubielzig@windriver.com
Subject: [PATCH V2] pulseaudio: Specify gdbm in configure (Denzil)
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
X-List-Received-Date: Fri, 01 Mar 2013 23:15:27 -0000
Content-Type: text/plain

The OE code as-is makes pulseaudio depend on gdbm, but the actual configure
process may automatically select the tdb library if a samba build has already
started.  This is problematic because it's nondeterministic and the samba
build may not be in a completed state causing compile to fail.

Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    3 ++-
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 11c6355..4ce803c 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -36,7 +36,8 @@ EXTRA_OECONF = "\
                 --disable-hal \
                 --disable-orc \
                 --with-access-group=audio \
-		--without-fftw \
+                --without-fftw \
+                --with-database=gdbm \
 "
 
 PARALLEL_MAKE = ""
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index e39b69e..2f3728f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.1



