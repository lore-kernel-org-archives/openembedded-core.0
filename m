Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0519077283
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:40:13 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so79557825pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Xv6laAyfw61LfcMaLi/5jjjn9fmPFWrBNmLQiS5S6pk=;
	b=h1dE+ixrT8+HwECpeHo0ibRn8z+wMHwAMcr6ejo8s40cDCmUoMBmwftJXD8L9zo3kM
	H4Q3xO6Tnd1S/L+CKavtYJ3EMU/JfR+nfIEQqvhEH7znuaiRdAttsTjt+VmWdh8zyKTO
	rPj4C1cF1lmuFl3/nDDYi08hcfGuHxCHbVmZ2AbAC44J1j2hh9ofxr7spBdD5GO2xcq6
	6Xk33PjCKS9l1dUahTymbV1Gv4A+3MPECcilcLB08rLlLw6cvJSjQ+zVRUW+qdsprenu
	1X1hF9YbBDrGRpKxHMMzFiVETBK+XdK5lVGp1TQzFctK87S/U4Cd+sll3cZWYVf+Rm3E
	LFkQ==
X-Received: by 10.67.4.69 with SMTP id cc5mr26985379pad.142.1447371614112;
	Thu, 12 Nov 2015 15:40:14 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cs5sm16739866pbc.15.2015.11.12.15.40.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:40:12 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:21 -0700
Message-Id: <81889bf57fd69d60d4ba70033c5d3184a7d8e00b.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
References: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 10/11] sysklogd: inhibit updatercd for non-sysvinit
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
X-List-Received-Date: Thu, 12 Nov 2015 23:40:14 -0000

From: Christopher Larson <chris_larson@mentor.com>

This recipe doesn't inherit systemd, so we need to take care of it ourselves.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index bcf8aa7..85b3cdc 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -56,3 +56,8 @@ pkg_prerm_${PN} () {
 	fi
 	fi
 }
+
+python () {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
-- 
2.2.1


