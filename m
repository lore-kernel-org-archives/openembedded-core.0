Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B884571975
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 17:56:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA3HuS5c000963
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Nov 2017 10:56:28 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 3 Nov 2017 10:56:27 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Nov 2017 19:56:26 +0200
Message-ID: <20171103175626.166150-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] libxfont: bump versions to 1.5.3 and 2.0.2
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
X-List-Received-Date: Fri, 03 Nov 2017 17:56:27 -0000
Content-Type: text/plain

Bump libxfont version to 1.5.3 and libxfont2 version to 2.0.2 in order to
eliminate CVE-2017-13720 and CVE-2017-13722 vulnerabilities.

In the PatternMatch function in fontfile/fontdir.c in libXfont through 1.5.2
and 2.x before 2.0.2, an attacker with access to an X connection can cause
a buffer over-read during pattern matching of fonts, leading to information
disclosure or a crash (denial of service). This occurs because '\0'
characters are incorrectly skipped in situations involving ? characters.

In the pcfGetProperties function in bitmap/pcfread.c in libXfont through 1.5.2
and 2.x before 2.0.2, a missing boundary check (for PCF files) could be used
by local attackers authenticated to an Xserver for a buffer over-read, for
information disclosure or a crash of the X server.

References:
https://nvd.nist.gov/vuln/detail/CVE-2017-13720
https://nvd.nist.gov/vuln/detail/CVE-2017-13722

Upstream patches:
https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?id=d1e670a4a8704b8708e493ab6155589bcd570608
https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?id=672bb944311392e2415b39c0d63b1e1902905bcd

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../xorg-lib/{libxfont2_2.0.1.bb => libxfont2_2.0.2.bb}               | 4 ++--
 .../xorg-lib/{libxfont_1.5.2.bb => libxfont_1.5.3.bb}                 | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.1.bb => libxfont2_2.0.2.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.5.2.bb => libxfont_1.5.3.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.2.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.2.bb
index 4bfb290..08d1123 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.2.bb
@@ -15,8 +15,8 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "0d9f6dd9c23bf4bcbfb00504b566baf5"
-SRC_URI[sha256sum] = "e9fbbb475ddd171b3a6a54b989cbade1f6f874fc35d505ebc5be426bc6e4db7e"
+SRC_URI[md5sum] = "d39e6446e46f939486d1a8b856e8b67b"
+SRC_URI[sha256sum] = "94088d3b87f7d42c7116d9adaad155859e93330c6e47f5989f2de600b9a6c111"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.3.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb
rename to meta/recipes-graphics/xorg-lib/libxfont_1.5.3.bb
index b11dda5..5b15a4e 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.3.bb
@@ -18,8 +18,8 @@ XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "254ee42bd178d18ebc7a73aacfde7f79"
-SRC_URI[sha256sum] = "02945ea68da447102f3e6c2b896c1d2061fd115de99404facc2aca3ad7010d71"
+SRC_URI[md5sum] = "9ba75bf38ba62a6ad52550ab716da9b3"
+SRC_URI[sha256sum] = "ab85c10fd2683481dfef672a77fe60e6a2039558cbc0e9bf56b5e1df471c93d0"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.10.2


