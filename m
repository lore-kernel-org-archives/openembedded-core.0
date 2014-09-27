Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 001D36DA74
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Sep 2014 07:22:32 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id k48so10535398wev.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Sep 2014 00:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iXPkovX7AFhxn3M54PcoFvyb8Uuz07G8zBtCkjS1vgw=;
	b=fF37wygi95lA7Jf5wVhlSZFZPs4yHUMRJu/MR9mrLUqpshzHCU0M/hZ2TB6iqNbwGy
	2vaIBk1zSh5oe0d14HQQeaAJTgkBOZ1SeIcP/5taIY2NUdHomt5a3zjv+8GnOXA843fi
	Zkkedvvh3TEBeXHxT07BBpslsg9eKQzfXjZzZreIGpWabS0kFpmIGfHv50H4wApe5Oro
	ACqpCbOECju5EdDr0+NBXgu9cY8VBgoqx/fOn04Zy2Vuf5jA4L6pPHXoIa388kQtntLR
	vkLo32gdTE+O8/P9IRAqLGy3X9wGYuy56scvaqQ+TOSuJbe9f2Ch+lAbC1hF+nfQWOYI
	6M0A==
X-Gm-Message-State: ALoCoQmMLHBawVfFkc6S5lqVw1KRXeQrHz01jcvcPWX5BH8O6bFsh/oV3CJ9jzpA7PPCC6nBX3Dv
X-Received: by 10.180.108.143 with SMTP id hk15mr50104997wib.27.1411802552971; 
	Sat, 27 Sep 2014 00:22:32 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id ic7sm4597555wid.11.2014.09.27.00.22.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 27 Sep 2014 00:22:32 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Sep 2014 09:22:24 +0200
Message-Id: <1411802545-17081-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] systemd 216: add postinsts for hostname and machine nss modules
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
X-List-Received-Date: Sat, 27 Sep 2014 07:22:34 -0000

The external recipe has postinsts so to make this a true replacement add
them here as well.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/systemd/systemd_216.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 331da99..3e572e8 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -369,6 +369,28 @@ pkg_prerm_udev-hwdb () {
 	rm -f ${sysconfdir}/udev/hwdb.bin
 }
 
+# Do not activate libnss-resolve by default, that needs more thought
+
+pkg_postinst_${PN} () {
+	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
+		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
+		-i $D${sysconfdir}/nsswitch.conf
+
+	sed -e '/^hosts:/s/\s*\<mymachine\>//' \
+		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mymachine \3\4\5/' \
+		-i $D${sysconfdir}/nsswitch.conf
+}
+
+pkg_prerm_${PN} () {
+	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
+		-e '/^hosts:/s/\s*myhostname//' \
+		-i $D${sysconfdir}/nsswitch.conf
+
+	sed -e '/^hosts:/s/\s*\<mymachine\>//' \
+		-e '/^hosts:/s/\s*mymachine//' \
+		-i $D${sysconfdir}/nsswitch.conf
+}
+
 # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
 # that we don't build both udev and systemd in world builds.
 python () {
-- 
1.9.0


