Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 903 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 Apr 2015 16:06:27 UTC
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id B1A1165CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 16:06:27 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 544910952; Thu, 30 Apr 2015 11:51:23 -0400
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1YnqkC-0002uC-DN; Thu, 30 Apr 2015 16:51:20 +0100
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1YnqkC-0004TX-CL; Thu, 30 Apr 2015 16:51:20 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 16:51:13 +0100
Message-Id: <1430409073-17164-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] libcap: Avoid passing "-e" to make
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
X-List-Received-Date: Thu, 30 Apr 2015 16:06:28 -0000

oe-core 51540b64f62234c145fc32cfa3fbbaaebbeece08 altered libcap.inc (at the
time) to append to EXTRA_OEMAKE rather than assign to it. The default value
for EXTRA_OEMAKE contains "-e". This means that the change caused "-e" to
be passed to make for the first time.

Unfortunately passing "-e" subtly changes the behaviour of libcap's
Make.Rules under recursive make when prefix="" (which it is for us since
we're using meta-micro.)

Without "-e" the prefix comes from the command line in both the parent and
submakes. This takes precedence over any attempt to reassign it with a
simple "=" operation so the headers are correctly installed in (empty
string)/include.

With "-e" the prefix still comes from the command line in the parent make
but from the environment in the submake. The attempt to assign it fails in
the parent make as before, but not in the submake so the headers are
installed incorrectly in /usr/include.

In all four cases the "ifdef prefix" else clause is executed.

So, let's assign EXTRA_OEMAKE in order to avoid using "-e" at all.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-support/libcap/libcap_2.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap/libcap_2.24.bb b/meta/recipes-support/libcap/libcap_2.24.bb
index 75cf5d4..f50dc94 100644
--- a/meta/recipes-support/libcap/libcap_2.24.bb
+++ b/meta/recipes-support/libcap/libcap_2.24.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG_class-native ??= ""
 PACKAGECONFIG[attr] = "LIBATTR=yes,LIBATTR=no,attr"
 PACKAGECONFIG[pam] = "PAM_CAP=yes,PAM_CAP=no,libpam"
 
-EXTRA_OEMAKE += " \
+EXTRA_OEMAKE = " \
   INDENT=  \
   lib=${@os.path.basename('${libdir}')} \
   RAISE_SETFCAP=no \
-- 
2.1.4


