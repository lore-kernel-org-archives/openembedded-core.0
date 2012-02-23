Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0ZuX-0001fg-Bb
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:44:45 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEm1Fc002936 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:01 GMT
X-Quarantine-ID: <b1uMmCV74xEE>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b1uMmCV74xEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:00 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NElw82002920
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:00 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S0Ysz-00058q-IJ
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 13:39:05 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:38:23 +0000
Message-Id: <b46a7264aa65f80e9b48154a8d15e759e351736f.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
References: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 14/16] autotools.bbclass: Make builds deterministic
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
X-List-Received-Date: Thu, 23 Feb 2012 14:44:45 -0000

We need to ensure any aclocal-copy directory is removed before we s
earch for .m4 files, else the locations .m4 files are found from can
vary depending on whether its the first or second time we run configure.

Clearing any existing aclocal-copy directory before we start resolves
this issue and makes builds deterministic again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/autotools.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 5d74333..4db021b 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -102,6 +102,8 @@ autotools_do_configure() {
 		if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
 			olddir=`pwd`
 			cd ${S}
+			# Remove any previous copy of the m4 macros
+			rm -rf ${B}/aclocal-copy/
 			if [ x"${acpaths}" = xdefault ]; then
 				acpaths=
 				for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
-- 
1.7.5.4



