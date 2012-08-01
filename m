Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwaFC-0006ET-9q
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:49:52 +0200
Received: by wgbds1 with SMTP id ds1so4153963wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BtHBmbtZ1kfFY2qGsJE67R04kFU22fGmMh3ow4geKLw=;
	b=RkJMPeg1pGo3m+XtpgkVo2uXC+8wZoVk7ClD1/ZQ8lMoTIGMhupXCPSTTp1K+iO7LM
	/uKus5v0hXOwUQBdK+aYNLz4sPkN3WRKCtMW1C1+bf/YEdujIwrCD+hOV3N+UMbBe3WU
	feVAChldLGzBx9tJPLk61GBKl9d+gcbTPXBd8Se6dr+EYy4IoucyVlgWzDY0LGu4kaRQ
	312lI/82H5HnJoyp3QiHCmGdRjloERouHTmzZwRtP+CY07IITkH4x7MAPh/Guym6v6Y2
	WjIj9yFihx4r4bVJsjmHmwfMfiTjstZv7m/y7lyjvpBDs9gENNS6dUC3IdAio63G1Qri
	YRJw==
Received: by 10.180.93.68 with SMTP id cs4mr12449145wib.14.1343831885025;
	Wed, 01 Aug 2012 07:38:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm28189874wiz.1.2012.08.01.07.38.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 07:38:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 16:38:00 +0200
Message-Id: <1343831880-20707-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] sip.bbclass: fix sip-native dependency
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
X-List-Received-Date: Wed, 01 Aug 2012 14:50:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sip.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sip.bbclass b/meta/classes/sip.bbclass
index 3a00e4d..074d4dd 100644
--- a/meta/classes/sip.bbclass
+++ b/meta/classes/sip.bbclass
@@ -9,6 +9,9 @@ RDEPENDS += "python-sip"
 # default stuff, do not uncomment
 # EXTRA_SIPTAGS = "-tWS_X11 -tQt_4_3_0"
 
+# do_generate is before do_configure so ensure that sip_native is populated in sysroot before executing it
+do_generate[depends] += "sip-native:do_populate_sysroot"
+
 sip_do_generate() {
 	if [ -z "${SIP_MODULES}" ]; then 
 		MODULES="`ls sip/*mod.sip`"
-- 
1.7.8.6



