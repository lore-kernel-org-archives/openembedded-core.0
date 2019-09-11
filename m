Return-Path: <jwessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C1A8D7EC42
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 18:32:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8BIW5no013278
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 11:32:05 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 11 Sep 2019 11:32:05 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 6682AC610BA;
	Wed, 11 Sep 2019 11:32:05 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2019 11:32:04 -0700
Message-ID: <20190911183204.42316-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] gnupg: Extend -native wrapper to fix gpgme-native's gpgconf problems
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
X-List-Received-Date: Wed, 11 Sep 2019 18:32:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The gpg commit signing in ostree-native doesn't work properly when
running from sstate.  The ostree-native is linked with gpgme-native's
libraries, which have calls into gpg.

Ultimately it turned out the problem was that gpgme calls gpgconf and
some of the other gnupg-native binaries directly.  Not all the
binaries have a wrapper which sets the environment variable GNUPG_BIN.
Without this wrapper these binaries it gets the path assignment from
the original compilation which causes a fault when running from sstate
in a new tmp directory because these paths will not exist.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-support/gnupg/gnupg_2.2.17.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.17.bb b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
index e5456dd9b9..689cf8a75e 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
@@ -46,6 +46,9 @@ do_install_append() {
 
 do_install_append_class-native() {
 	create_wrapper ${D}${bindir}/gpg2 GNUPG_BINDIR=${STAGING_BINDIR_NATIVE}
+	create_wrapper ${D}${bindir}/gpgconf GNUPG_BINDIR=${STAGING_BINDIR_NATIVE}
+	create_wrapper ${D}${bindir}/gpg-agent GNUPG_BINDIR=${STAGING_BINDIR_NATIVE}
+	create_wrapper ${D}${bindir}/gpg-connect-agent GNUPG_BINDIR=${STAGING_BINDIR_NATIVE}
 }
 
 PACKAGECONFIG ??= "gnutls"
-- 
2.23.0


