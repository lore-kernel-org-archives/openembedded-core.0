Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27745.1793856424539973886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d3BbBTQW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=twaQ2Pzt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1aa2cc6ae-7504c7bf-ba78-4367-b232-ec6bd0ff70f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793856423;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=HMR55A+jP4ACcwQ4d5fM2weqRdHZ1+UsNZbbEihGSSc=;
	b=d3BbBTQWl6moVy+2qnjKBacqMmtxy2we/1bkYMjbxc/napdZuehVfhb/GNPwFFhQ
	GkMArQG8lBZ0jy6VhWVRJhLrftESvEOKJ2sIUsbpsS4uQrOEiozuItDCBhnPSkDiM5m
	lXJvZFz9p22QDAKZzJt1Z1oSUp4Oy5kfw7w1jZ9k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793856423;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=HMR55A+jP4ACcwQ4d5fM2weqRdHZ1+UsNZbbEihGSSc=;
	b=twaQ2PztsExYaiS0YPFoVkfGtCJdy7LvxKpOU6/DitPxxDz2yn+SuWWMEMZG7u9Z
	Ne/KCcgfylpgHOUvMN/1t91o04jfSWSTsvjeAOe7a0vEJe8683UXuB+w3xYLR9JQbKd
	APvzf8wP+XX1EJy+Z0Gu1CJEGfZ+7uHTXl6/APpY=
Content-Type: multipart/mixed; boundary="===============6687187321487281451=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 15.1.0 SUCCEEDED
Message-ID: <010101a1aa2cc6ae-7504c7bf-ba78-4367-b232-ec6bd0ff70f6-000000@us-west-2.amazonses.com>
Date: Thu, 5 Nov 2026 05:27:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.05-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249425

--===============6687187321487281451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *15.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-15.0.0-15.1.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 92f76bd64966b13a97dc81f852fe55ca5372aa28 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 5 Nov 2026 05:24:48 +0000
Subject: [PATCH] harfbuzz: upgrade 15.0.0 -> 15.1.0

Overview of changes leading to 15.1.0
Wednesday, November 4, 2026
=====================================
- Add buffer deserialization APIs that report progress as a byte offset, for
  use from introspection bindings.
- Fix Indic shaping of the Unicode 18 Devanagari and Bengali additions.
- Fix Arabic fallback shaping: wrong ligatures when a component is missing from
  the font, and disappearing marks in legacy fonts.
- Fix `COLR` glyph extents and mark positioning in fonts with empty layers.
- Fix AAT shaping: wrong `kerx` kerning (formats 1 and 2) and mark positioning
  (format 4, a 14.3.0 regression), and ignored `kern` and `mort` tables with a
  non-first initial state.
- Various fixes to the Graphite2 shaper.
- Report HarfRust shaping failures through `hb_buffer_allocation_successful()`.
- Fix wrong outlines in `gvar` fonts with intermediate tuples.
- Fix `hb_face_create_or_fail()` rejecting face indices with named-instance
  bits set.
- Fix wrong fallback metrics: the vertical descender in fonts without `vhea`,
  and the hanging baseline for some scripts.
- Fix `hb_ot_layout_lookup_collect_glyph_alternates()` collecting garbage from
  `AlternateSubst` and `SingleSubst` format 1 lookups.
- Speed up shaping on faces with many shape plans, `hb_language_from_string()`,
  vertical text with `hb-ft`, and `CBDT` and `sbix` fonts.
- Fix crashes and deadlocks with FreeType, including `hb_ft_font_set_funcs()` on
  immutable fonts and font queries from color paint callbacks.
- Fix crashes with NULL result pointers in
  `hb_ot_metrics_get_position_with_fallback()`,
  `hb_ot_layout_get_font_extents()`, and `hb_ot_layout_get_font_extents2()`.
- Fix use-after-free in `hb_map_update()` when updating a map from itself.
- Various fixes for crashes, hangs, and memory use with malformed fonts.
- Faster subsetting of large `GSUB` and `GPOS` tables, and smaller `CFF` output.
- Partially instancing or desubroutinizing `CFF2` fonts with nested blends now
  fails instead of changing the outlines.
- Subsetting now fails if a glyph mapping assigns another glyph to glyph 0.
- Fix `hb_subset_axis_range_from_string()` reading past the given length.
- Fix subsetting beyond-64k variable fonts losing `HVAR` advance deltas.
- Various subsetting and instancing fixes, mostly for `CFF`, `CFF2`, and `COLR`.
- Fix rotated and skewed rectangle clips hiding their contents in the raster
  library, and out-of-bounds access when extents change during painting.
- Fix the vector library mirroring path clips in SVG, and writing PDFs with
  wrong page bounds and misplaced or clipped `COLR` gradients.
- Fix wrong clipping of `COLR` layers in the GPU library.
- Various Cairo integration fixes, including a memory leak per scaled font.
- Fix `hb-info --list-*` crashes on unusual fonts.
- Various build and CI fixes.

- New API:
  +hb_buffer_deserialize_glyphs2()
  +hb_buffer_deserialize_unicode2()
---
 .../harfbuzz/{harfbuzz_15.0.0.bb => harfbuzz_15.1.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_15.0.0.bb => harfbuzz_15.1.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_15.1.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_15.1.0.bb
index ec829e0a24..b3d6318f5e 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_15.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "968536e9abd782f07f7954044c0c4020199fcdd39b41d221ec42d2a3be4a44df"
+SRC_URI[sha256sum] = "0fc7c565443a5f4be7da65ac5ee5bd737d9b158dc908708b7689a0a5796b0c8d"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.47.1


--===============6687187321487281451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILES: removed "/usr/lib/libharfbuzz-cairo.so.0.61500.0", added "/usr/lib/libharfbuzz-cairo.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61500.0", added "/usr/lib/libharfbuzz-cairo.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 127202240 to 127589344 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-gobject.so.0.61500.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61500.0 /usr/lib/.debug/libharfbuzz.so.0.61500.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61500.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61500.0", added "/usr/lib/.debug/libharfbuzz-subset.so.0.61510.0 /usr/lib/.debug/libharfbuzz.so.0.61510.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61510.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61510.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1944979 to 1951573 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILES: removed "/usr/lib/libharfbuzz-gobject.so.0.61500.0", added "/usr/lib/libharfbuzz-gobject.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61500.0", added "/usr/lib/libharfbuzz-gobject.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILES: removed "/usr/lib/libharfbuzz-icu.so.0.61500.0", added "/usr/lib/libharfbuzz-icu.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61500.0", added "/usr/lib/libharfbuzz-icu.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5862885 to 5925742 (+1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/15.1.0/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/glyf -> /usr/src/debug/harfbuzz/15.1.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/15.1.0/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/15.1.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/15.1.0/src/OT/Var/VARC, directory renamed /usr/src/debug/harfbuzz/15.0.0/util -> /usr/src/debug/harfbuzz/15.1.0/util, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/graph -> /usr/src/debug/harfbuzz/15.1.0/src/graph, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/15.1.0/src/OT/Layout/GDEF, directory renamed /usr/src/debu
 g/harfbuzz/15.0.0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/15.1.0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/15.0.0/src -> /usr/src/debug/harfbuzz/15.1.0/src, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/15.1.0/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/15.1.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/name -> /usr/src/debug/harfbuzz/15.1.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/15.1.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/15.1.0/src/OT/Layout/GSUB
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILES: removed "/usr/lib/libharfbuzz-subset.so.0.61500.0", added "/usr/lib/libharfbuzz-subset.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1427655 to 1439943 (+1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61500.0", added "/usr/lib/libharfbuzz-subset.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1186592 to 1215676 (+2%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61500.0", added "/usr/lib/libharfbuzz.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/15.0.0/harfbuzz-15.0.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/15.1.0/harfbuzz-15.1.0.tar.xz"
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "15.0.0" to "15.1.0"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 15.0.0 [default] to 15.1.0 [default]
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61500.0 to libharfbuzz-cairo.so.0.61510.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61500.0 to libharfbuzz-gobject.so.0.61510.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61500.0 to libharfbuzz-icu.so.0.61510.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61500.0 to libharfbuzz.so.0.61510.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61500.0 to libharfbuzz-subset.so.0.61510.0
  /usr/lib/libharfbuzz-cairo.so.0.61500.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61510.0
  /usr/lib/libharfbuzz-gobject.so.0.61500.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61510.0
  /usr/lib/libharfbuzz-icu.so.0.61500.0 moved to /usr/lib/libharfbuzz-icu.so.0.61510.0
  /usr/lib/libharfbuzz.so.0.61500.0 moved to /usr/lib/libharfbuzz.so.0.61510.0
  /usr/lib/libharfbuzz-subset.so.0.61500.0 moved to /usr/lib/libharfbuzz-subset.so.0.61510.0

--===============6687187321487281451==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-15.0.0-15.1.0.patch"

RnJvbSA5MmY3NmJkNjQ5NjZiMTNhOTdkYzgxZjg1MmZlNTVjYTUzNzJhYTI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNSBOb3YgMjAyNiAwNToyNDo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDE1LjAuMCAtPiAxNS4xLjAKCk92ZXJ2aWV3IG9mIGNoYW5nZXMgbGVh
ZGluZyB0byAxNS4xLjAKV2VkbmVzZGF5LCBOb3ZlbWJlciA0LCAyMDI2Cj09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KLSBBZGQgYnVmZmVyIGRlc2VyaWFsaXphdGlvbiBBUElz
IHRoYXQgcmVwb3J0IHByb2dyZXNzIGFzIGEgYnl0ZSBvZmZzZXQsIGZvcgogIHVzZSBmcm9tIGlu
dHJvc3BlY3Rpb24gYmluZGluZ3MuCi0gRml4IEluZGljIHNoYXBpbmcgb2YgdGhlIFVuaWNvZGUg
MTggRGV2YW5hZ2FyaSBhbmQgQmVuZ2FsaSBhZGRpdGlvbnMuCi0gRml4IEFyYWJpYyBmYWxsYmFj
ayBzaGFwaW5nOiB3cm9uZyBsaWdhdHVyZXMgd2hlbiBhIGNvbXBvbmVudCBpcyBtaXNzaW5nIGZy
b20KICB0aGUgZm9udCwgYW5kIGRpc2FwcGVhcmluZyBtYXJrcyBpbiBsZWdhY3kgZm9udHMuCi0g
Rml4IGBDT0xSYCBnbHlwaCBleHRlbnRzIGFuZCBtYXJrIHBvc2l0aW9uaW5nIGluIGZvbnRzIHdp
dGggZW1wdHkgbGF5ZXJzLgotIEZpeCBBQVQgc2hhcGluZzogd3JvbmcgYGtlcnhgIGtlcm5pbmcg
KGZvcm1hdHMgMSBhbmQgMikgYW5kIG1hcmsgcG9zaXRpb25pbmcKICAoZm9ybWF0IDQsIGEgMTQu
My4wIHJlZ3Jlc3Npb24pLCBhbmQgaWdub3JlZCBga2VybmAgYW5kIGBtb3J0YCB0YWJsZXMgd2l0
aCBhCiAgbm9uLWZpcnN0IGluaXRpYWwgc3RhdGUuCi0gVmFyaW91cyBmaXhlcyB0byB0aGUgR3Jh
cGhpdGUyIHNoYXBlci4KLSBSZXBvcnQgSGFyZlJ1c3Qgc2hhcGluZyBmYWlsdXJlcyB0aHJvdWdo
IGBoYl9idWZmZXJfYWxsb2NhdGlvbl9zdWNjZXNzZnVsKClgLgotIEZpeCB3cm9uZyBvdXRsaW5l
cyBpbiBgZ3ZhcmAgZm9udHMgd2l0aCBpbnRlcm1lZGlhdGUgdHVwbGVzLgotIEZpeCBgaGJfZmFj
ZV9jcmVhdGVfb3JfZmFpbCgpYCByZWplY3RpbmcgZmFjZSBpbmRpY2VzIHdpdGggbmFtZWQtaW5z
dGFuY2UKICBiaXRzIHNldC4KLSBGaXggd3JvbmcgZmFsbGJhY2sgbWV0cmljczogdGhlIHZlcnRp
Y2FsIGRlc2NlbmRlciBpbiBmb250cyB3aXRob3V0IGB2aGVhYCwKICBhbmQgdGhlIGhhbmdpbmcg
YmFzZWxpbmUgZm9yIHNvbWUgc2NyaXB0cy4KLSBGaXggYGhiX290X2xheW91dF9sb29rdXBfY29s
bGVjdF9nbHlwaF9hbHRlcm5hdGVzKClgIGNvbGxlY3RpbmcgZ2FyYmFnZSBmcm9tCiAgYEFsdGVy
bmF0ZVN1YnN0YCBhbmQgYFNpbmdsZVN1YnN0YCBmb3JtYXQgMSBsb29rdXBzLgotIFNwZWVkIHVw
IHNoYXBpbmcgb24gZmFjZXMgd2l0aCBtYW55IHNoYXBlIHBsYW5zLCBgaGJfbGFuZ3VhZ2VfZnJv
bV9zdHJpbmcoKWAsCiAgdmVydGljYWwgdGV4dCB3aXRoIGBoYi1mdGAsIGFuZCBgQ0JEVGAgYW5k
IGBzYml4YCBmb250cy4KLSBGaXggY3Jhc2hlcyBhbmQgZGVhZGxvY2tzIHdpdGggRnJlZVR5cGUs
IGluY2x1ZGluZyBgaGJfZnRfZm9udF9zZXRfZnVuY3MoKWAgb24KICBpbW11dGFibGUgZm9udHMg
YW5kIGZvbnQgcXVlcmllcyBmcm9tIGNvbG9yIHBhaW50IGNhbGxiYWNrcy4KLSBGaXggY3Jhc2hl
cyB3aXRoIE5VTEwgcmVzdWx0IHBvaW50ZXJzIGluCiAgYGhiX290X21ldHJpY3NfZ2V0X3Bvc2l0
aW9uX3dpdGhfZmFsbGJhY2soKWAsCiAgYGhiX290X2xheW91dF9nZXRfZm9udF9leHRlbnRzKClg
LCBhbmQgYGhiX290X2xheW91dF9nZXRfZm9udF9leHRlbnRzMigpYC4KLSBGaXggdXNlLWFmdGVy
LWZyZWUgaW4gYGhiX21hcF91cGRhdGUoKWAgd2hlbiB1cGRhdGluZyBhIG1hcCBmcm9tIGl0c2Vs
Zi4KLSBWYXJpb3VzIGZpeGVzIGZvciBjcmFzaGVzLCBoYW5ncywgYW5kIG1lbW9yeSB1c2Ugd2l0
aCBtYWxmb3JtZWQgZm9udHMuCi0gRmFzdGVyIHN1YnNldHRpbmcgb2YgbGFyZ2UgYEdTVUJgIGFu
ZCBgR1BPU2AgdGFibGVzLCBhbmQgc21hbGxlciBgQ0ZGYCBvdXRwdXQuCi0gUGFydGlhbGx5IGlu
c3RhbmNpbmcgb3IgZGVzdWJyb3V0aW5pemluZyBgQ0ZGMmAgZm9udHMgd2l0aCBuZXN0ZWQgYmxl
bmRzIG5vdwogIGZhaWxzIGluc3RlYWQgb2YgY2hhbmdpbmcgdGhlIG91dGxpbmVzLgotIFN1YnNl
dHRpbmcgbm93IGZhaWxzIGlmIGEgZ2x5cGggbWFwcGluZyBhc3NpZ25zIGFub3RoZXIgZ2x5cGgg
dG8gZ2x5cGggMC4KLSBGaXggYGhiX3N1YnNldF9heGlzX3JhbmdlX2Zyb21fc3RyaW5nKClgIHJl
YWRpbmcgcGFzdCB0aGUgZ2l2ZW4gbGVuZ3RoLgotIEZpeCBzdWJzZXR0aW5nIGJleW9uZC02NGsg
dmFyaWFibGUgZm9udHMgbG9zaW5nIGBIVkFSYCBhZHZhbmNlIGRlbHRhcy4KLSBWYXJpb3VzIHN1
YnNldHRpbmcgYW5kIGluc3RhbmNpbmcgZml4ZXMsIG1vc3RseSBmb3IgYENGRmAsIGBDRkYyYCwg
YW5kIGBDT0xSYC4KLSBGaXggcm90YXRlZCBhbmQgc2tld2VkIHJlY3RhbmdsZSBjbGlwcyBoaWRp
bmcgdGhlaXIgY29udGVudHMgaW4gdGhlIHJhc3RlcgogIGxpYnJhcnksIGFuZCBvdXQtb2YtYm91
bmRzIGFjY2VzcyB3aGVuIGV4dGVudHMgY2hhbmdlIGR1cmluZyBwYWludGluZy4KLSBGaXggdGhl
IHZlY3RvciBsaWJyYXJ5IG1pcnJvcmluZyBwYXRoIGNsaXBzIGluIFNWRywgYW5kIHdyaXRpbmcg
UERGcyB3aXRoCiAgd3JvbmcgcGFnZSBib3VuZHMgYW5kIG1pc3BsYWNlZCBvciBjbGlwcGVkIGBD
T0xSYCBncmFkaWVudHMuCi0gRml4IHdyb25nIGNsaXBwaW5nIG9mIGBDT0xSYCBsYXllcnMgaW4g
dGhlIEdQVSBsaWJyYXJ5LgotIFZhcmlvdXMgQ2Fpcm8gaW50ZWdyYXRpb24gZml4ZXMsIGluY2x1
ZGluZyBhIG1lbW9yeSBsZWFrIHBlciBzY2FsZWQgZm9udC4KLSBGaXggYGhiLWluZm8gLS1saXN0
LSpgIGNyYXNoZXMgb24gdW51c3VhbCBmb250cy4KLSBWYXJpb3VzIGJ1aWxkIGFuZCBDSSBmaXhl
cy4KCi0gTmV3IEFQSToKICAraGJfYnVmZmVyX2Rlc2VyaWFsaXplX2dseXBoczIoKQogICtoYl9i
dWZmZXJfZGVzZXJpYWxpemVfdW5pY29kZTIoKQotLS0KIC4uLi9oYXJmYnV6ei97aGFyZmJ1enpf
MTUuMC4wLmJiID0+IGhhcmZidXp6XzE1LjEuMC5iYn0gICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9oYXJmYnV6ei97aGFyZmJ1enpfMTUuMC4wLmJiID0+IGhhcmZidXp6XzE1LjEu
MC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enov
aGFyZmJ1enpfMTUuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZi
dXp6XzE1LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTUuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTUuMS4wLmJiCmluZGV4IGVjODI5ZTBh
MjQuLmIzZDYzMThmNWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6
ei9oYXJmYnV6el8xNS4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L2hhcmZidXp6XzE1LjEuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9Yjk4NDI5YjhlOGUzYzJhNjdjZmVmMDFlOTllNDg5M2QgXAogICAg
ICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25s
b2FkLyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTY4
NTM2ZTlhYmQ3ODJmMDdmNzk1NDA0NGMwYzQwMjAxOTlmY2RkMzliNDFkMjIxZWM0MmQyYTNiZTRh
NDRkZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwZmM3YzU2NTQ0M2E1ZjRiZTdkYTY1YWM1ZWU1
YmQ3MzdkOWIxNThkYzkwODcwOGI3Njg5YTBhNTc5NmIwYzhkIgogCiBpbmhlcml0IG1lc29uIHBr
Z2NvbmZpZyBsaWJfcGFja2FnZSBndGstZG9jIGdvYmplY3QtaW50cm9zcGVjdGlvbiBnaXRodWIt
cmVsZWFzZXMKIAotLSAKMi40Ny4xCgo=

--===============6687187321487281451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61500.0", added "/usr/lib/libharfbuzz-cairo.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61500.0", added "/usr/lib/libharfbuzz-gobject.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61500.0", added "/usr/lib/libharfbuzz-icu.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61500.0", added "/usr/lib/libharfbuzz-subset.so.0.61510.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61500.0", added "/usr/lib/libharfbuzz.so.0.61510.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61500.0 to libharfbuzz-cairo.so.0.61510.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61500.0 to libharfbuzz-gobject.so.0.61510.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61500.0 to libharfbuzz-icu.so.0.61510.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61500.0 to libharfbuzz.so.0.61510.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61500.0 to libharfbuzz-subset.so.0.61510.0
  /usr/lib/libharfbuzz-cairo.so.0.61500.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61510.0
  /usr/lib/libharfbuzz-gobject.so.0.61500.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61510.0
  /usr/lib/libharfbuzz-icu.so.0.61500.0 moved to /usr/lib/libharfbuzz-icu.so.0.61510.0
  /usr/lib/libharfbuzz.so.0.61500.0 moved to /usr/lib/libharfbuzz.so.0.61510.0
  /usr/lib/libharfbuzz-subset.so.0.61500.0 moved to /usr/lib/libharfbuzz-subset.so.0.61510.0

--===============6687187321487281451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="harfbuzz-changelog.txt"

Overview of changes leading to 15.1.0
Wednesday, November 4, 2026
=====================================
- Add buffer deserialization APIs that report progress as a byte offset, for
  use from introspection bindings.
- Fix Indic shaping of the Unicode 18 Devanagari and Bengali additions.
- Fix Arabic fallback shaping: wrong ligatures when a component is missing from
  the font, and disappearing marks in legacy fonts.
- Fix `COLR` glyph extents and mark positioning in fonts with empty layers.
- Fix AAT shaping: wrong `kerx` kerning (formats 1 and 2) and mark positioning
  (format 4, a 14.3.0 regression), and ignored `kern` and `mort` tables with a
  non-first initial state.
- Various fixes to the Graphite2 shaper.
- Report HarfRust shaping failures through `hb_buffer_allocation_successful()`.
- Fix wrong outlines in `gvar` fonts with intermediate tuples.
- Fix `hb_face_create_or_fail()` rejecting face indices with named-instance
  bits set.
- Fix wrong fallback metrics: the vertical descender in fonts without `vhea`,
  and the hanging baseline for some scripts.
- Fix `hb_ot_layout_lookup_collect_glyph_alternates()` collecting garbage from
  `AlternateSubst` and `SingleSubst` format 1 lookups.
- Speed up shaping on faces with many shape plans, `hb_language_from_string()`,
  vertical text with `hb-ft`, and `CBDT` and `sbix` fonts.
- Fix crashes and deadlocks with FreeType, including `hb_ft_font_set_funcs()` on
  immutable fonts and font queries from color paint callbacks.
- Fix crashes with NULL result pointers in
  `hb_ot_metrics_get_position_with_fallback()`,
  `hb_ot_layout_get_font_extents()`, and `hb_ot_layout_get_font_extents2()`.
- Fix use-after-free in `hb_map_update()` when updating a map from itself.
- Various fixes for crashes, hangs, and memory use with malformed fonts.
- Faster subsetting of large `GSUB` and `GPOS` tables, and smaller `CFF` output.
- Partially instancing or desubroutinizing `CFF2` fonts with nested blends now
  fails instead of changing the outlines.
- Subsetting now fails if a glyph mapping assigns another glyph to glyph 0.
- Fix `hb_subset_axis_range_from_string()` reading past the given length.
- Fix subsetting beyond-64k variable fonts losing `HVAR` advance deltas.
- Various subsetting and instancing fixes, mostly for `CFF`, `CFF2`, and `COLR`.
- Fix rotated and skewed rectangle clips hiding their contents in the raster
  library, and out-of-bounds access when extents change during painting.
- Fix the vector library mirroring path clips in SVG, and writing PDFs with
  wrong page bounds and misplaced or clipped `COLR` gradients.
- Fix wrong clipping of `COLR` layers in the GPU library.
- Various Cairo integration fixes, including a memory leak per scaled font.
- Fix `hb-info --list-*` crashes on unusual fonts.
- Various build and CI fixes.

- New API:
  +hb_buffer_deserialize_glyphs2()
  +hb_buffer_deserialize_unicode2()

--===============6687187321487281451==--
