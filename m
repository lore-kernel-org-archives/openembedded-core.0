Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jeffrey.honig@windriver.com>) id 1UBHOR-0003ov-6g
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 05:16:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r212CuKO020257
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 18:12:56 -0800 (PST)
Received: from jch-schlepp.wrs.com (172.25.32.253) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.328.9;
	Thu, 28 Feb 2013 18:12:55 -0800
Received: from schlepp.honig.net (schlepp.honig.net [127.0.0.1])	by
	jch-schlepp.wrs.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	r212CqKf002652	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256
	verify=NOT);	Thu, 28 Feb 2013 21:12:52 -0500
Received: (from jch@localhost)	by schlepp.honig.net (8.14.4/8.14.4/Submit) id
	r212CpIc002651;	Thu, 28 Feb 2013 21:12:51 -0500
From: <jeffrey.honig@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Feb 2013 21:12:51 -0500
Message-ID: <1362103971-2618-1-git-send-email-jeffrey.honig@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: jeffrey.honig@windriver.com
Subject: [PATCH] Help ncurses-native find terminfo on RHEL 6
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
X-List-Received-Date: Fri, 01 Mar 2013 04:16:34 -0000
Content-Type: text/plain

From: Jeffrey C Honig <jeffrey.honig@windriver.com>

[ CQID: WIND00405305 ]

When using ncurses from sstate cache it is not able to find terminfo
for screen on RHEL 6.  While RHEL 6 has /lib/terminfo, it is not
complete, the complete terminfo database is in /usr/share/terminfo.  This
results failure of programs linked to ncurses, such as menuconfig.

Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 9250e9d..040495c 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_class-native = ""
-INC_PR = "r14"
+INC_PR = "r15"
 
 inherit autotools binconfig multilib_header
 
@@ -51,8 +51,8 @@ EX_TERMCAP = ""
 EX_TERMCAP_virtclass-native = ":/etc/termcap:/usr/share/misc/termcap"
 EX_TERMCAP_virtclass-nativesdk = ":/etc/termcap:/usr/share/misc/termcap"
 EX_TERMINFO = ""
-EX_TERMINFO_virtclass-native = ":/etc/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
-EX_TERMINFO_virtclass-nativesdk = ":/etc/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
+EX_TERMINFO_virtclass-native = ":/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
+EX_TERMINFO_virtclass-nativesdk = ":/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
 
 # Helper function for do_configure to allow multiple configurations
 # $1 the directory to run configure in
-- 
1.7.9.5



