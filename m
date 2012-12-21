Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1Tm1Xu-0008Fw-0k
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:17:46 +0100
Received: by mail-we0-f178.google.com with SMTP id x43so2121769wey.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 04:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=gabxTf7EBP5ehITpec/VrZ0AE5jdDqLwhEWxRMV5JkI=;
	b=W1YR1NT5MBZBUtPUH494DWS88T3y7BN4bXnyJW7C/JymiPNtM7oWSbuccSfa5hqEcB
	dF74a6Rat5/8uliu8e8HgwE+l3MyBVN63RmLJvF1vEc9DHp/QdtHBjYgFMQ4pil73Qz6
	s2TMgUgPuqQlI2e0oc4jv2jxvU74E+7FJICLdUpnevO79hcoyE5HgKU6uHEmh2YoJFwz
	QnbilKh3Iant2Ud2VN3P5DRvlSDcb/t2o8Uy7hzcuzkGqYDBCZXYUiV9EPcqys1vgjRb
	A0TkPXC+2jqv7B4hDr81t8sX2dt1sT7Htl7JCroKewI85VajWDsNq9QrjY6g3YITXi2/
	EbGw==
X-Received: by 10.180.73.202 with SMTP id n10mr22956175wiv.17.1356091380126;
	Fri, 21 Dec 2012 04:03:00 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id dw4sm17959133wib.1.2012.12.21.04.02.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 04:02:59 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2012 17:02:39 +0500
Message-Id: <1356091359-29763-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>,
	Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH] cml1: set and export TERMINFO, to handle ncurses-native relocation
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
X-List-Received-Date: Fri, 21 Dec 2012 12:17:46 -0000

ncurses library looks at the compiled-in search path for the terminfo
database, and that path no longer exists, when using cached binaries (sstate).
Export TERMINFO pointing at the current sysroot, so the attempt to run mconf
is able to find the correct terminfo db.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>

the patch was imported from meta-mentor layer on yoctoproject git server
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit id
0cae284f294e3a2c99d9a4d79c95c25103cd8f8b

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 meta/classes/cml1.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index ba44196..bb95639 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -9,10 +9,11 @@ addtask configure after do_unpack do_patch before do_compile
 
 inherit terminal
 
-OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIBES"
+OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIBES TERMINFO"
 HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
 HOSTLDFLAGS = "${BUILD_LDFLAGS}"
 HOST_LOADLIBES = "-lncurses"
+TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
 
 python do_menuconfig() {
     try:
-- 
1.7.9.5



