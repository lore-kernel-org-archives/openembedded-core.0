Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE556CC99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 11:23:35 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hn9so6343805wib.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2013 04:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aB+Kg25WdtlhdN4hEvdoczQfzRaryvhzmkQUdiOzPtg=;
	b=jyDLRIuiBvzYRWis9dtXADBW8Lpwiw5mRXWJeR2NBAd3n7lQvNhPA+lJyJ3SWF6fga
	n2kfqUWJU874X8r+gAPTmDzL/WxsxTjBN/hFayskK94296LDMNBiEKdzi4NuaXvB9Mtq
	Y0BVZc+F5yZJh5RHOIXaWhjSoZxCS0xOaNfa20CspmiGnK4deDTQfa3tCGS0F8aODHXb
	fZRQEYX+Atmi4bkEHb1oaOPSTptSeyhxO+AuB6x+cktDWQzZ0bcgG8WBBkj7s3JYUKI9
	zzyaWQ9drHqY9Y0NSJ2kUHjeW/vVJD589TAF64+WVqB0neJKDeysb90pB+rEVcikoTqi
	xcxQ==
X-Gm-Message-State: ALoCoQl9j52Tymd7DY/7Zc6Rkvoh2T2bBcsQEajAytiugASJLW7/33umTOnuD1B9TMbb1LeSUO/6
X-Received: by 10.180.211.171 with SMTP id nd11mr23532587wic.0.1381231416937; 
	Tue, 08 Oct 2013 04:23:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id d11sm4183529wic.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Oct 2013 04:23:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2013 12:23:32 +0100
Message-Id: <1381231412-31162-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xorg-lib-common: fix malloc0returnsnull usage
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
X-List-Received-Date: Tue, 08 Oct 2013 11:23:35 -0000

Xorg libraries that use Xmalloc need to know if malloc(0) returns NULL or not,
and as this is a runtime test it can't be checked for.  Previously
xorg-lib-common declared that malloc(0) did return NULL, but this isn't true for
eglibc (only uclibc).

Instead, use libc-specific overrides to pass the relevant option.

(ideally the check would use the autoconf cache so this can be stored in the site files)

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index c911925..98e1416 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -13,8 +13,9 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-malloc0returnsnull \
-                --disable-specs --with-groff=no --with-ps2pdf=no --with-fop=no --without-xmlto"
+EXTRA_OECONF = "--disable-specs --without-groff --without-ps2pdf --without-fop --without-xmlto"
+EXTRA_OECONF_append_libc-glibc = " --disable-malloc0returnsnull"
+EXTRA_OECONF_append_libc-uclibc = " --enable-malloc0returnsnull"
 
 python () {
         whitelist = [ "pixman", "libpciaccess" ]
-- 
1.7.10.4


