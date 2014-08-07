Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 966516FA94
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 10:35:51 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so5026410pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 03:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=58CU1Aibn75bochlFRWBa2ET7N/oODOjLlhdvdkJ1GM=;
	b=WrPkFXk1mclomVZHaH/vUU5sqbxn22gUHUtTcpX/OHYKBePkdFmVGBECVVDQIn1ffn
	BZQIa+OHtaQSXOv2TZHslphSpHpnwXZbacgXyCAfIBM73rGV4bYp+KcyY2fdQ0x/5ksm
	tYpggynh83KM/Hrw7gZ3B49mbSuJ5ys0JUHJFiPFH/mbNVHzj3O21gmVFBX9XDJwnvqI
	6AiibHjDdOpV7TZZBnmlCV/dFR41/GKWa59MepAbJVk6dWuSfP+YeyZfn64OCAYR6vzd
	9hiGOtZfd9udc2d2J77GaQbT4In9DSt3kJeZp6WzEjKP5evFQC/AF2OrHy5IHDRGzoOT
	2jmw==
X-Received: by 10.66.236.161 with SMTP id uv1mr16991652pac.85.1407407752502;
	Thu, 07 Aug 2014 03:35:52 -0700 (PDT)
Received: from localhost.localdomain ([139.181.35.34])
	by mx.google.com with ESMTPSA id ph6sm3983849pbc.38.2014.08.07.03.35.50
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Aug 2014 03:35:51 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 16:06:57 +0530
Message-Id: <1407407817-1034-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: [PATCH] pigz: Add dependency on zlib-native for pigz-native
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
X-List-Received-Date: Thu, 07 Aug 2014 10:35:52 -0000

From: Shrikant Bobade <Shrikant_Bobade@mentor.com>

When pigz-native and zlib-native are coming from sstate the setscenes might
not necessarily run in the expected order. The problem happens when setscene
for pigz-native runs before setscene for zlib-native. To fix the issue
do_populate_sysroot_setscene[depends] should be properly set for pigz-native.

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
---
 meta/recipes-extended/pigz/pigz.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
index 355fb2a..9a045e7 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -30,3 +30,7 @@ ALTERNATIVE_${PN} = "gzip gunzip"
 ALTERNATIVE_LINK_NAME[gzip] = "${base_bindir}/gzip"
 ALTERNATIVE_LINK_NAME[gunzip] = "${base_bindir}/gunzip"
 ALTERNATIVE_PRIORITY = "80"
+
+PIGZ_SYSROOT_DEPS = ""
+PIGZ_SYSROOT_DEPS_class-native = "zlib-native:do_populate_sysroot_setscene"
+do_populate_sysroot_setscene[depends] += "${PIGZ_SYSROOT_DEPS}"
-- 
1.7.9.5


