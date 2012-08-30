Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1T79M1-0006Qj-ED
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 20:20:33 +0200
Received: by qadc11 with SMTP id c11so506704qad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 11:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=bwOQMLa/v2XmLBViS0vEOkiKyrtaHD/NtgTW2nmW2b0=;
	b=Pks+be5pZTtPVnJBXbWy+HiNM6/XwkAI9ozaR2p5CEz0llh60YkgJOTHhUUCp5ahj6
	LXE8RT6k3BNFCtA+tPAiBn8xi1I7YfR4Y0783+h/gjQAyMKyb19rQJsLlqKVIS4dcHEs
	OQ6QIlm/OtMZSXcjk5c3kt/qqevHFxn4BPPoSta9kRSYYAy+L+4PeDh5PT26dFd33xKh
	yBY6vaQqnUYcR2FGf8el6yHc3GerDEPcTX2UoQA/XTI6lMfvzrMF3yJ12crn6anBg5q1
	uNg7NJ0tZ2fvV5ebh7mTbs3Oo1DAHPK4GE1DbNwuFLVtBNEQkcVWcMRmXJmby6558EL3
	5FcA==
Received: by 10.224.181.207 with SMTP id bz15mr12859066qab.65.1346350097500;
	Thu, 30 Aug 2012 11:08:17 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id j5sm3174525qac.4.2012.08.30.11.08.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 11:08:16 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Thu, 30 Aug 2012 14:08:45 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2012 14:08:45 -0400
Message-Id: <1346350125-10939-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] sysstat: Explicitly disable sensors support.
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
X-List-Received-Date: Thu, 30 Aug 2012 18:20:33 -0000

Since no lmsensors recipe exists by default in oe-core, explicitly disable
support for it in sysstat. In my case sysstat would fail linking complaining
about undefined references when adding my own lmsensors recipe.

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 meta/recipes-extended/sysstat/sysstat.inc       |    2 ++
 meta/recipes-extended/sysstat/sysstat_10.0.5.bb |    2 +-
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
diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.5.bb b/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
index 233102a..1c8595a 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
@@ -2,7 +2,7 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r0"
+PR = "${INC_PR}.1"
 
 SRC_URI[md5sum] = "208dd236d726d20591d53d3a20124dd4"
 SRC_URI[sha256sum] = "1f474d6ca742af73d0f9d09a374bda64c72bccb126aef327fa74383ff438feff"
-- 
1.7.5.4



