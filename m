Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128.1792429856012381494
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 10:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TciG7iAp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 512312103
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 10:10:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3AC5F3F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 10:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792429855; bh=xQja0kWE0szbFZSEYLzp0vgoKpUsyJjc0m6r4c/wUxc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TciG7iApen3zTlhft6uCoH2hGTsZ5fS3IXGeELXEYw90lJYAykKpHJM9IlA4y1tE7
	 DDVPrE83lORKIGUk+d38bFSDGBENwAsk0rleRsHBfJqcTNktHttAoDjYbMhOTFeV2Y
	 S7n6W/6HW6yy3kl+Mh57vyoK1cv6uzgduUwyb+6Q=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] libical: upgrade 4.0.6 -> 4.0.7
Date: Mon, 19 Oct 2026 18:10:50 +0100
Message-ID: <20261019171050.634776-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019171050.634776-1-ross.burton@arm.com>
References: <20261019171050.634776-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 17:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248201
Content-Type: text/plain; charset="utf-8"

- libicalvcard:
  - `vcardcomponent_clone()` and friends now deep-copy TEXTLIST values (e=
.g. NICKNAME, CATEGORIES)
    and structured parameters (JSCOMPS), and keep the property group.
  - Fixed a use-after-free and a memory leak when converting a vCalendar =
procedure alarm (PALARM)
    whose attachment is a plain path name.
- libical:
  - Fix busy status of recurring events in `icalcomponent_foreach_recurre=
nce()`.
  - Fix `icalvalue_decode_ical_string()` and `icallangbind_property_eval_=
string()` reading past
    the end of a string that ends in a backslash or a newline.
  - `icaltimezone_truncate_vtimezone()` no longer reads the RRULE after f=
reeing it when the new
     DTSTART is within a year of UNTIL (RSCALE rules), and no longer uses=
 an uninitialized onset
     when no RRULE occurrence falls before the window close.
  - Fix IMAGE and STRUCTURED-DATA given by URI (with or without VALUE=3DU=
RI) parsing to a URI value,
    whose string `icalproperty_get_image()` and `icalproperty_get_structu=
reddata()` then read as
    an icalattach pointer.
  - Fix use-after-free and double free in `icalcomponent_merge_component(=
)` when both calendars
    have a VTIMEZONE with the same TZID. Every VTIMEZONE of the merged ca=
lendar is now merged,
    and a conflicting VTIMEZONE is added under a renamed TZID (e.g. "Zone=
1") that its events use.
  - Fix out-of-bounds access to the year days bitmask in the recurrence i=
terator when an RSCALE
    date falls outside the year (e.g. BYWEEKNO with a DTSTART before the =
calendar's epoch).
  - Fix `icalrecur_iterator_set_range()` for a reverse range on a rule wi=
thout UNTIL, which
    started the iteration at year 0 instead of at 'from'.
  - Fix `icalparser_clean()` for proper reuse by resetting internal struc=
ture values and clearing
    the root component to avoid a use-after-free.
  - Behavior change: The typed icalvalue getters now check that the value=
 type of the icalvalue
    uses the same union member as the expected value type of the getter, =
as the vcardvalue getters
    have done since version 4.0.6. If the type mismatches, then they retu=
rn the zero value for the
    expected value type. The typed setters error with ICAL_BADARG_ERROR i=
nstead of overwriting a
    value held in another union member.
- libicalss:
  - Fix heap-buffer-overflow in `icalspanlist_as_freebusy_matrix()` for b=
usy spans that start
    before or end after the spanlist. `icalspanlist_from_vfreebusy()` now=
 sets the spanlist
    start/end from DTSTART/DTEND and marks FBTYPE=3DFREE periods as free =
(all others as busy).
- Buildsystem changes:
  - Fix CMake command target_link_libraries() to use all-keywords as requ=
ired since CMake v4.4.4.
  - When cross-compiling, don't build/install ical-glib-src-generator w/o=
 existing binary

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libical/{libical_4.0.6.bb =3D> libical_4.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_4.0.6.bb =3D> libical_4.0.7=
.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_4.0.6.bb b/meta/recipes=
-support/libical/libical_4.0.7.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_4.0.6.bb
rename to meta/recipes-support/libical/libical_4.0.7.bb
index 7b9185c3742..cbfcb0675e6 100644
--- a/meta/recipes-support/libical/libical_4.0.6.bb
+++ b/meta/recipes-support/libical/libical_4.0.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D6d929449=
3d031c817783b0400a126c89 \
 SECTION =3D "libs"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] =3D "2e3729cb69c282d3bb17a8d2b198af6e4bc7502fd3621c9a=
df573921fe9dceb0"
+SRC_URI[sha256sum] =3D "47c05bc96e41416578cf1803bb2ba3f8d292cb17d5ac2fca=
539dee922bae8a94"
=20
 inherit cmake pkgconfig gobject-introspection vala github-releases
=20
--=20
2.43.0

