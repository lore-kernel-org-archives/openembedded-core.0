Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101a.appriver.com [207.97.230.14])
	by mail.openembedded.org (Postfix) with ESMTP id 45090605C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 13:23:39 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/24/2017 9:23:40 AM
X-Note: SecureTide Build: 4/27/2017 4:11:48 PM UTC (2.6.18.8)
X-Note: Filtered by 10.238.11.161
X-Policy: brightsign.biz  - brightsign.biz
X-Policy: brightsign.biz  - brightsign.biz
X-Primary: mcrowe@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-870/SG:1 5/24/2017 9:23:19 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-50/SG:1 5/24/2017 9:23:20 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.407177 p=-1 Source Normal
X-Signature-Violations: 0-0-0-4146-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->PRIVATE->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G269 G270 G271 G272 G276 G277 G405 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [213.210.30.29] (HELO elite.brightsigndigital.co.uk)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 146123993; Wed, 24 May 2017 09:23:40 -0400
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1dDWGJ-0008AN-WE; Wed, 24 May 2017 14:23:40 +0100
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1dDWGJ-00017R-VG; Wed, 24 May 2017 14:23:39 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 May 2017 14:23:36 +0100
Message-Id: <20170524132336.4259-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] libgcrypt: Revert to inheriting from binconfig
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
X-List-Received-Date: Wed, 24 May 2017 13:23:40 -0000

Commit 5870bd272b0b077d0826fb900b251884c1c05061 introduced
binconfig-disabled and enabled it for libgcrypt. This intentionally broke
the old-style libgcrypt-config binary since packages should be using the
pkg-config instead.

oe-core patches libgcrypt itself in order to generate a .pc file. This
patch was not accepted upstream because they do not wish to depend on
pkg-config. This means that upstream libgcrypt continues to ship with an
autoconf snippet that expects the libgcrypt-config binary so the configure
scripts shipped with other upstream projects (e.g. libmicrohttpd) also
expect to be able to find the libgcrypt-config binary.

If libgcrypt upstream doesn't generate a .pc file by default, then we
shouldn't expect other upstreams to make use of one. So, I think it makes
most sense to go back to installing a working libgcrypt-config binary until
that situation changes.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 84c1cc018b..569e102c01 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -22,9 +22,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://fix-undefined-reference-to-pthread.patch \
 "
 
-BINCONFIG = "${bindir}/libgcrypt-config"
-
-inherit autotools texinfo binconfig-disabled pkgconfig
+inherit autotools texinfo binconfig pkgconfig
 
 EXTRA_OECONF = "--disable-asm"
 
-- 
2.11.0


