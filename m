Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 74CB26AC83
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 19:47:12 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so3224256wes.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 12:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YF8jf9HhETSzTbKDV4BB60rK9vz627EkQtE5kv6JNT4=;
	b=IIXFZP6vK825GTcF/RdCYXl6iTFJXtkWseq6GUyz2UME8UeCOIL2jEnSEeNVcyCpR1
	YFiucpkME84zKdiPNXZh1GLIfinSBRG0WrM50jKzwHMzf+PKJ3VuC1e2m6MAn/M19mEH
	lCJIKTmKWjMVjyTER89RJlpmeXtVCk44VXB9qDeCul2vKFTTdctrWtGqzkLvFA7vIGAo
	XvqWU2bwCWJ8k2wylC7fHZBmy1EQ93Zsx7WaWpHSFaLlTTX11Qjwt6s7lYDgV3SEWuLi
	7ytiH/8k/kE9kAkZuedPRuDbRq5QShIWyEWrH/0OyIBY/X8NaFWIzOrpISjDXWzZvxGa
	0ozA==
X-Gm-Message-State: ALoCoQkvFS4JeAKXBPOu/IDcObMK8AzDcGFm1mPNT0jeu2RLSEokrduSAb1ubGGDHDStviHNNuUH
X-Received: by 10.180.24.225 with SMTP id x1mr15836610wif.14.1406231232684;
	Thu, 24 Jul 2014 12:47:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id o12sm26703837wiw.5.2014.07.24.12.47.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 12:47:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jul 2014 20:47:08 +0100
Message-Id: <1406231228-20303-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libice: fix non-deterministic libbsd dependency
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
X-List-Received-Date: Thu, 24 Jul 2014 19:47:17 -0000

libice 1.0.9 added automatic detection of arc4random(), which is in libbsd on
Linux.  As this is automatic and leads to failing builds when ssstate is reused,
seed the autoconf cache as relevant to implement a PACKAGECONFIG for the
functionality.

Default to not using arc4random() as the fallback has been in use for many
years, but people interested in security may wish to turn this on to increase
the security of the X authentication cookies.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libice_1.0.9.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
index 314d281..c55f5a1 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
@@ -22,3 +22,6 @@ BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "addfb1e897ca8079531669c7c7711726"
 SRC_URI[sha256sum] = "8f7032f2c1c64352b5423f6b48a8ebdc339cc63064af34d66a6c9aa79759e202"
+
+PACKAGECONFIG ??= "arc4"
+PACKAGECONFIG[arc4] = "ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"
-- 
1.7.10.4


