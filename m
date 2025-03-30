Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3729BC28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 20:44:46 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.37911.1743367479170327336
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 13:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Lk5MN8ht;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250330204437e6b3048eaecd1e046b-zztqrj@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250330204437e6b3048eaecd1e046b
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Mar 2025 22:44:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oExGZcjS8m6I+okIjQRYmsK7zy2jXIvoAQXKxv5HrSU=;
 b=Lk5MN8ht0z9K3vwtR4iXbDPgx59r49jbeEAe+ku6GnS9RPOAMClIsvCrs9Q3hcg8dbUomK
 nXh4xP1yi/o4PVWyBCnUR9+HdkPbjaSgUX4NVnT9UdlNTG5/sRPxL+1ycuT2sGuSH98Qp7cj
 W3UuDpznt5M6ZADrpM5OGqfBYDCPd6rrZvY95AlFcK0pGSbe7dcVp+dq+obgPcGEb1mX6cs4
 yOsu8ZFkYOD/9EEkQ/PLzUo7DwsXVeR/kwYd/ncWXzsl2jaWvLNSi/Jx8jx3bp+0vVKSbxEI
 qVUoTZ/3+98Nge2dgLsJvAQIPD/zZLmHrL6ODXthveySjxnAtQsw9osQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] freetype: patch CVE-2025-27363
Date: Sun, 30 Mar 2025 22:43:50 +0200
Message-Id: <20250330204350.365686-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 20:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213925

From: Peter Marko <peter.marko@siemens.com>

From [1]:
An out of bounds write exists in FreeType versions 2.13.0 and below
(newer versions of FreeType are not vulnerable) when attempting to
parse font subglyph structures related to TrueType GX and variable font
files. The vulnerable code assigns a signed short value to an unsigned
long and then adds a static value causing it to wrap around and
allocate too small of a heap buffer. The code then writes up to 6
signed long integers out of bounds relative to this buffer. This may
result in arbitrary code execution. This vulnerability may have been
exploited in the wild.

Per [2] patches [3] and [4] are needed.
Unfortunately, the code changed since 2.11.1 and it's not possible to do
backport without significant changes. Since Debian and Ubuntu have
already patched this CVE, take the patch from them - [5]/[6].
The patch is a combination of patch originally proposed in [7] and
follow-up patch [4].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-27363
[2] https://gitlab.freedesktop.org/freetype/freetype/-/issues/1322
[3] https://gitlab.freedesktop.org/freetype/freetype/-/commit/ef636696524b081f1b8819eb0c6a0b932d35757d
[4] https://gitlab.freedesktop.org/freetype/freetype/-/commit/73720c7c9958e87b3d134a7574d1720ad2d24442
[5] https://git.launchpad.net/ubuntu/+source/freetype/commit/?h=applied/ubuntu/jammy-devel&id=fc406fb02653852dfa5979672e3d8d56ed329186
[6] https://salsa.debian.org/debian/freetype/-/commit/13295227b5b0d717a343f276d77ad3b89fcc6ed0
[7] https://www.openwall.com/lists/oss-security/2025/03/14/3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../freetype/freetype/CVE-2025-27363.patch    | 44 +++++++++++++++++++
 .../freetype/freetype_2.11.1.bb               |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch b/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch
new file mode 100644
index 0000000000..28fc50c0cb
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch
@@ -0,0 +1,44 @@
+From 26b83ec58c60ced0e6c423df438227fb33ccca2e Mon Sep 17 00:00:00 2001
+From: Marc Deslauriers <marc.deslauriers@ubuntu.com>
+Date: Thu, 13 Mar 2025 08:41:20 -0400
+Subject: [PATCH] fix OOB write when when attempting to parse font subglyph
+ structures
+
+Gbp-Pq: CVE-2025-27363.patch.
+
+Source: https://git.launchpad.net/ubuntu/+source/freetype/commit/?h=applied/ubuntu/jammy-devel&id=fc406fb02653852dfa5979672e3d8d56ed329186
+
+CVE: CVE-2025-27363
+Upstream-Status: Inappropriate [cannot do exact patch backport as the code changed too much]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/truetype/ttgload.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/truetype/ttgload.c b/src/truetype/ttgload.c
+index 11968f6..f5aa292 100644
+--- a/src/truetype/ttgload.c
++++ b/src/truetype/ttgload.c
+@@ -1948,7 +1948,7 @@
+         short        i, limit;
+         FT_SubGlyph  subglyph;
+ 
+-        FT_Outline  outline;
++        FT_Outline  outline = { 0, 0, NULL, NULL, NULL, 0 };
+         FT_Vector*  points    = NULL;
+         char*       tags      = NULL;
+         short*      contours  = NULL;
+@@ -1957,6 +1957,13 @@
+ 
+         limit = (short)gloader->current.num_subglyphs;
+ 
++        /* make sure this isn't negative as we're going to add 4 later */
++        if ( limit < 0 )
++        {
++          error = FT_THROW( Invalid_Argument );
++          goto Exit;
++        }
++
+         /* construct an outline structure for              */
+         /* communication with `TT_Vary_Apply_Glyph_Deltas' */
+         outline.n_points   = (short)( gloader->current.num_subglyphs + 4 );
diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
index 29f4d8dfb7..22158511c1 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://CVE-2022-27405.patch \
            file://CVE-2022-27406.patch \
            file://CVE-2023-2004.patch \
+           file://CVE-2025-27363.patch \
            "
 SRC_URI[sha256sum] = "3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8"
 

