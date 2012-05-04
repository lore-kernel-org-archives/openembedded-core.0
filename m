Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SQDUc-0005cq-Hm
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 10:03:58 +0200
Received: by wera1 with SMTP id a1so1798043wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 00:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=py907sghrXULCd9n0kvCvpViysodiTgyGK6y/NpWis4=;
	b=fNXasEe/3GVGNEK+3K87ka+ACEciTVw6mTi5z+pA6XzABTKYx1Qoc34beUdHnwey5h
	TVFJaJ+wuR9Eg0uBbDRHMaK9fU17shEOssn8wTzS9r3kfU5stFLfemzSpsyktER35qQS
	XwK5jvPEMB1NwhqysJDO6Sc5eWhxGUk8V5GrDQBOvKNEdT4XJejtuJNLsLOPPee4Jbp6
	1B5ohZElkXGWv5cBDCcgut5exWQxhM9qztLh9f8ydWe6k1hWi79WS0q90BhV5kQISHMD
	1JhlxMUFd4TCA1kg42RqMuyANn5ccpMbYUTbdR18cJxcusQjNK+AfynSc9Yrc2uJ6ATF
	yz0w==
Received: by 10.180.86.197 with SMTP id r5mr10344549wiz.21.1336118052089;
	Fri, 04 May 2012 00:54:12 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id h8sm12478764wix.4.2012.05.04.00.54.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 00:54:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 09:54:06 +0200
Message-Id: <1336118046-20901-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkiw1TOY6+cZpQJ+HwNTd5S0W08PPtzDOnscvnlgJkS8gFaE84NLz1sO/ijTlWnzPQIHjkU
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] connman: enable TI shared transport plugin when wifi or bluetooth are requested
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
X-List-Received-Date: Fri, 04 May 2012 08:03:58 -0000

This plugin manages the firmware loading for the TI wl12xx series of bluetooth/wifi/fm chips.

The double --enable-tist when both bluetooth and wireless are enabled is ugly, but harmless

The background on the plugin: https://bugs.meego.com/show_bug.cgi?id=8418

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

If accepted into master I'd like to have this in the 'denzil' branch as well.

 meta/recipes-connectivity/connman/connman.inc     |    4 ++--
 meta/recipes-connectivity/connman/connman_0.79.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index bfe6620..8b27cfb 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -28,8 +28,8 @@ EXTRA_OECONF += "\
     --enable-threads \
     --enable-loopback \
     --enable-ethernet \
-    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', '--disable-wifi', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi --enable-tist', '--disable-wifi', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth --enable-tist', '--disable-bluetooth', d)} \
     --enable-dnsproxy \
     --enable-ofono \
     --enable-tools \
diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
index 4c57dab..d7f22b9 100644
--- a/meta/recipes-connectivity/connman/connman_0.79.bb
+++ b/meta/recipes-connectivity/connman/connman_0.79.bb
@@ -11,4 +11,4 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://test-set-ipv6-method-api-fix.patch \
             file://connman"
 S = "${WORKDIR}/git"
-PR = "r3"
+PR = "r4"
-- 
1.7.10



