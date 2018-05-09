Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8F7750CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 21:47:02 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id ay10-v6so26576plb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 14:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5ngi/+EiE9mqn9vx4rxYbERh1MS0qaa5wD/MP4avl64=;
	b=IBsYCf7CCUFzCWtL5RxXJc/R05asSul6bmQEHe1aeAfgG0QDa1Jg0U6FpS9A4rPbaD
	u0L5a4xedZU1Q95ZEkujLsMGeGVOlaOIzCxZFavNyDzMjNH57Gd0jvMuSOMjbKLcrxKx
	AbOxytror/6NG+bUMpa/MRMtSHA8dmq5MJ7qh8srjjcb6H1erO5CgfkUJENs16RJ2RcC
	MXsxDTNW/v6wiyvFTanEmNpdT+WbAmwuDPh1bCXWiQWtNzLrVtOoQ9Js+JKseXn+7K+m
	xXBg0uOPNHPIJG5YRi6Cgl4CNL0/S/kCOA03oTGZHCGzflBsc5Geu5WPUy3caEX9HX58
	5+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5ngi/+EiE9mqn9vx4rxYbERh1MS0qaa5wD/MP4avl64=;
	b=N8PqUKFf3NZS8k0hQxy8MxsMk1BDHRoBx4wG+L2SjdH+g6dN2qND9HAD6wgQxcWvBB
	PtyQr/mcD/qc77HCZsYR7CiK/LX/qPd6SMCU3bkwTDadkn/ENiVr4mzW2jFnlqxiU6kK
	scTLnz3WOeULLiU7l3QfcyN5Y/u7mamifni4+X5nIZ9IqHzY6SwOPs69pfvclsPFFmZI
	/3vsig6q6gHnP1XnEtQq3BJ3VssfTNW1iUt5L1t+QmzwBpUDIRC6y1AUTJ10f5WGprSp
	/KahQOC2pdC8eu7FnhYCOwBVt5lSWODV8bVj3vw+wJAFuTC4o2OFu3UqCyf/mE/prfaI
	l95g==
X-Gm-Message-State: ALKqPweDxqtrz4yLRipdqtUNhdcamwp2qiaRs0Z/cyt1quR4q2bM11lC
	W/46UcgvXsKgBI3hbOyi7FDLkQ==
X-Google-Smtp-Source: AB8JxZou238/taYqwzpDhuMKwRqjexm00vxrfxjpbhe1CkbV39DkUbD3d6o4rRpd6gTkytVfL9A53w==
X-Received: by 2002:a17:902:9048:: with SMTP id
	w8-v6mr3208002plz.34.1525902423140; 
	Wed, 09 May 2018 14:47:03 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	76-v6sm3699193pge.75.2018.05.09.14.47.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 14:47:02 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 14:46:46 -0700
Message-Id: <1525902408-6796-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
References: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 6/8] pciutils: move ASNEEDED over-ride into the pciutils recipe
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
X-List-Received-Date: Wed, 09 May 2018 21:47:02 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc      | 1 -
 meta/recipes-bsp/pciutils/pciutils_3.5.6.bb | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 305e654..c67f2f3 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -2,7 +2,6 @@
 ASNEEDED = "-Wl,--as-needed"
 
 ASNEEDED_pn-openobex = ""
-ASNEEDED_pn-pciutils = ""
 ASNEEDED_pn-puzzles = ""
 ASNEEDED_pn-rpm = ""
 
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb
index b18b7da..de974ed 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb
@@ -38,6 +38,8 @@ export MANDIR = "${mandir}"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS= ${PCI_CONF_FLAG}"
 
+ASNEEDED = ""
+
 # The configure script breaks if the HOST variable is set
 HOST[unexport] = "1"
 
-- 
1.9.1


