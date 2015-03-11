Return-Path: <net147@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id E00AC73AAB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 02:26:54 +0000 (UTC)
Received: by paceu11 with SMTP id eu11so7278292pac.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 19:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=z0MlpOZE1160exoFBMk6CrVmSd0B8FwfnwZawvYaSqg=;
	b=SehHfO+jVA6YE/reJp7eVKgE9RnHGHzxTfNbXI+wW24QlEGwzQSMY0EBZHGBbHaB4z
	jA6fM0xrVn8MYIRQ8l7MsUUrjJ+QnoQjFFejFKu0E/KlSYXgsGiClT8r2NA5ripnvbPm
	MOenZC00ii/W/mehvMgAflxEt4CYbW0PpyiUgJifPV4FLIpCcE4JWntMADo+QrGpT+K7
	SoXZlseviauH4LpqngXSyL5QSYr3yXoAngMHg+sNdMyc0NhpxV1SMRLURg9yt860kCdS
	zXfNuAa64vg4XXJzycm0if6CBSUdCzqQ/PlV+/+ecFHTVDLE33tt0X/ZuMWYUVla27XX
	1VFw==
X-Received: by 10.66.237.35 with SMTP id uz3mr73301762pac.46.1426040815751;
	Tue, 10 Mar 2015 19:26:55 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id nj5sm2801018pdb.24.2015.03.10.19.26.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 19:26:54 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 13:25:56 +1100
Message-Id: <1426040756-27293-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [dizzy][PATCH] fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Wed, 11 Mar 2015 02:26:55 -0000

Appending to PACKAGEFUNCS results in the font packages missing the
postinst/postrm scripts and the fontconfig cache not being generated
in /var/cache/fontconfig when creating images or installing font
packages. This is because the package data has already been emitted
by emit_pkgdata in PACKAGEFUNCS. Prepend to PACKAGEFUNCS to ensure
add_fontcache_postinsts is executed before emit_pkgdata.

[YOCTO #7410]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/fontcache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 2bf1e4b..dcd1f04 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -42,4 +42,4 @@ python add_fontcache_postinsts() {
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
 
-PACKAGEFUNCS += "add_fontcache_postinsts"
+PACKAGEFUNCS =+ "add_fontcache_postinsts"
-- 
2.3.1


