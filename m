Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1T76lG-00013g-JN
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 17:34:26 +0200
Received: by vcbfy27 with SMTP id fy27so2006878vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=lLVghum6xV2CrJLVnvuLlbDIhp7gQIuk6aNGPCbr6rI=;
	b=JdurAY2PIUa5P6GGY9sTrEFcKS4yrJAsRMzV3ljygkTrxj0+o4j9R9vb0ke9IaNBut
	tPwn5UrmUlLG0+If776y1eTnz9ulwXZZ16HClzOZ13oa5Mq/kp3d1ukK/lbQsY2R1zAY
	YiqkeKoCgryAsEz0zdpZH0BhM/tzDrAjzXwa/3Q01LzqBqdRBVMoWT7kyxzC9Jo5mDox
	5/RahGd3aOd2fw4brpMvvDAKhm8pgjebmiEh7Dslry7bf8aG8EOBvUGtfnchWTHCol27
	5txw4CFqKZ+6JeSkrpgjMK5gOWvd7Tp3nec1LP2KwlLdBL06nMipEk0PiKmi/wYL7ywV
	IRTQ==
Received: by 10.52.65.112 with SMTP id w16mr2827451vds.65.1346340130712;
	Thu, 30 Aug 2012 08:22:10 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id a13sm448726vdu.9.2012.08.30.08.22.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 08:22:09 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Thu, 30 Aug 2012 11:22:41 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2012 11:22:41 -0400
Message-Id: <1346340161-2649-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCHv3] sysstat: Explicitly disable sensors support.
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
X-List-Received-Date: Thu, 30 Aug 2012 15:34:26 -0000

Since no lmsensors recipe exists by default in oe-core, explicitly disable
support for it in sysstat. In my case sysstat would fail linking complaining
about undefined references when adding my own lmsensors recipe.

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 meta/recipes-extended/sysstat/sysstat.inc       |    2 ++
 meta/recipes-extended/sysstat/sysstat_10.0.3.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 9da40a7..287bb54 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -3,12 +3,14 @@ DESCRIPTION = "The sysstat utilities are a collection of performance monitoring
 HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
 LICENSE = "GPLv2+"
 SECTION = "console/utils"
+INC_PR = "r1"
 
 SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
 		   file://99_sysstat"
 
 inherit autotools gettext
 
+EXTRA_OECONF += "--disable-sensors"
 EXTRA_OEMAKE += 'LFLAGS=""'
 
 do_install() {
diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
index 7ef6c60..e9b95d8 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
@@ -2,7 +2,7 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r1"
+PR = "${INC_PR}.1"
 
 SRC_URI[md5sum] = "0e1ed5200f31f69a3b90ff1e81c07745"
 SRC_URI[sha256sum] = "7c0dd172f09edaff100b33db29ef502e15e71867b505c6d519f76a24fabcc1f5"
-- 
1.7.5.4



