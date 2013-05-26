Return-Path: <net147@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 02003608F7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 08:00:42 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id uo1so5741957pbc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 01:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZmYIJPPtxDFENaSN3/1Mut1ywCpb20zHCQQLQyep1tg=;
	b=fYyTfFmx4DPLFwU4e3IEw3DGmM+NxKuUK3y2WGqD1SmYdWJ31EXgDkSuToEYGH2PAx
	8JkZ6gbAEN74UO9Ew2EsaihqBmx/XS5x9EkpYJWbLd2fenA0XPPd71QqYYZ8I+vcZDvm
	ne91k7wF0QePPBekYrgL/i5FOLwPDnq9xQ4/niabHsW/OK4dm0bZrrFFht9YGiKds3rh
	nsDoDA+FlvdOldhbtqsiCVRAHMEPrGNIumfVT1U5/CA41bakQsqqR9pMr0A1X3KnXAbm
	33wRhZHXHHQrQL1Gen9sfbrsYdhnSSXfhofTb8rFmUsAUvwn2ggZNQI/Sx3xblpBqCaI
	mnrA==
X-Received: by 10.68.176.197 with SMTP id ck5mr20133498pbc.165.1369555244129; 
	Sun, 26 May 2013 01:00:44 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id q8sm16516309pan.12.2013.05.26.01.00.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 01:00:43 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 18:14:13 +1000
Message-Id: <1369556053-12445-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] consolekit: remove /var/run from package
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
X-List-Received-Date: Sun, 26 May 2013 08:00:43 -0000

The /var/run/ConsoleKit directory doesn't need to be included in the
package as it is created by console-kit-daemon if it doesn't exist.
The /var/run directory is already created by base-files.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.5.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index db4ac00..7d66b39 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -37,3 +37,8 @@ FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 PACKAGES =+ "pam-plugin-ck-connector"
 FILES_pam-plugin-ck-connector += "${base_libdir}/security/*.so"
 RDEPENDS_pam-plugin-ck-connector += "${PN}"
+
+do_install_append() {
+	# Remove /var/run from package as console-kit-daemon will populate it on startup
+	rm -fr "${D}${localstatedir}/run"
+}
-- 
1.8.2.3


