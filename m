Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (unknown [74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB9C65DBF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 10:13:26 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q59so1682483wes.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 03:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=LwMXJ8/X0V6ZW8rJ+uSPbXedtlz8kX/mZtffimTNL00=;
	b=JGKSOcclnjBrmvnck/zY/Vh4L5atEq51GlvySybMzY9Q6KHNp9msGpnwQFW5Kv2u7q
	3X1W3yZnZRIEXrJ+B+tba3ItAu2IDHzESN6NwhgOTXp48ai5MtZAyl3DXiV5rNYAORxL
	6xXDSlj0e1es8Jmp9UTeZZcifLPx6X3Txpevx/PWsXGGkz1ii6JLWN9osekcfAoQS7An
	iGRzG4QZ6TWpV+BE267PR3SwKdrXQyjfg2lj2l9OfCStE6fwrE5EGugzoqyNsOqVP7zU
	ECgSlt/dNkLsD0R8F7xcLclPEaSIOw08rTWZUKEcQ6OnNzOceh7Jejb/fSdMzI9b4tbM
	v4oA==
X-Gm-Message-State: ALoCoQkRyapBkv56Lm9hnuGD6VqmgPn6j4uaDSzNQ1piJc2vxMYoedXIrdalEN2rJdTqs438+cHY
X-Received: by 10.180.92.103 with SMTP id cl7mr2788221wib.26.1400062407001;
	Wed, 14 May 2014 03:13:27 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id cl9sm1885605wjc.25.2014.05.14.03.13.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 03:13:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 11:13:19 +0100
Message-Id: <1400062399-1426-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] freetype: disable harfbuzz
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
X-List-Received-Date: Wed, 14 May 2014 10:13:27 -0000

Freetype has an automatically detected dependency on Harfbuzz, which has a
dependency on Freetype.

To produce deterministic builds and avoid link failures when rebuilding freetype
with harfbuzz present add a PACKAGECONFIG for Harfbuzz and disable it by
default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/freetype/freetype_2.5.3.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/freetype/freetype_2.5.3.bb b/meta/recipes-graphics/freetype/freetype_2.5.3.bb
index 7182c21..5d239e8 100644
--- a/meta/recipes-graphics/freetype/freetype_2.5.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.3.bb
@@ -26,6 +26,8 @@ EXTRA_OECONF = "--without-zlib --without-bzip2 CC_BUILD='${BUILD_CC}'"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pixmap] = "--with-png,--without-png,libpng"
+# This results in a circular dependency so enabling is non-trivial
+PACKAGECONFIG[harfbuzz] = "--with-harfbuzz,--without-harfbuzz,harfbuzz"
 
 do_configure() {
 	cd builds/unix
-- 
1.7.10.4


