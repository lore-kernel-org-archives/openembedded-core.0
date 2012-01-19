Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RnkqM-0005vD-6E
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 06:47:26 +0100
Received: by ggno1 with SMTP id o1so4344992ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2012 21:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4HI4taFmj5MGe56DsE2yyEMn7j/bAUL2n2NmkwdSRbA=;
	b=cWU/u7HCuDCdmp59L6n52N8p6lU8Fhd5xlVeos52Z6GHcjzFQtGffoUia8K1/Xec2k
	Ta0ADfcvlzb/AIDwv71VYKgBrsivydpr499Dc81xSr1Fg1f4QpgTGFIPffUsc6/mLrSB
	fL8skcRUz9E9lPn71Z5dlb5Txk3hP9qX4RyOM=
Received: by 10.101.202.17 with SMTP id e17mr2319769anq.65.1326951586684;
	Wed, 18 Jan 2012 21:39:46 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id e48sm45107656yhm.12.2012.01.18.21.39.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 21:39:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2012 21:39:16 -0800
Message-Id: <1326951556-18395-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] gnutls: Fix configure issue wrt to rm
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
X-List-Received-Date: Thu, 19 Jan 2012 05:47:26 -0000

Add -f option so if the files dont exist then we can
still continue. Fixes errors like

| + do_configure
| + for dir in . lib libextra
| + rm ./aclocal.m4 ./m4/libtool.m4 './m4/lt*.m4'
| rm: cannot remove `./m4/libtool.m4': No such file or directory
| rm: cannot remove `./m4/lt*.m4': No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 5991540..c639b11 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -31,7 +31,7 @@ EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               "
 do_configure_prepend() {
 	for dir in . lib libextra; do
-		rm ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
+		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
 }
 
-- 
1.7.5.4



