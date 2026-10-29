Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17331.1793294314338368236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Tc6zGxd2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202610291718328a4e1b7b900002078f-uwsmnt@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202610291718328a4e1b7b900002078f
        for <openembedded-core@lists.openembedded.org>;
        Thu, 29 Oct 2026 18:18:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=n/q4++jztABydhSzHObSRTDN+BH9URleRN0wiVlEwis=;
 b=Tc6zGxd2hxLohT+IFhCD7NUY1httAkT80W4+0JK8YYfRs05zeTgikpnA83qb9DfPY+8XwF
 6zKpDR0wXxgmHgRoQoxEPOtDdPOhjdF+sQqgPPaNNUL+dFBsTaa/6/flpJ2JEkZbXKARXYYn
 MwgRY4Me0eE0eUiZjLeQRNLCXOIOsJXF09/gV4CEeMSMiWWeETwSdnON0CRv7BMECFkpi7xW
 StfVIolw04qRuEdLY6gcdlHNua51Zin6iDg4vipuewlKk2+DSpeYovZPq43jSMy2ze9K7FFM
 PF3MD0gZoiO51TIJ3CPINpBk3qd2FMRKPXQe7dHowj+43Qu+6ZKLINxw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 8/8] libical: upgrade 4.0.6 -> 4.0.7
Date: Thu, 29 Oct 2026 18:17:06 +0100
Message-ID: <20261029171709.2842512-8-peter.marko@siemens.com>
In-Reply-To: <20261029171709.2842512-1-peter.marko@siemens.com>
References: <20261029171709.2842512-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248964
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

- libicalvcard:
  - `vcardcomponent_clone()` and friends now deep-copy TEXTLIST values (e.g. NICKNAME, CATEGORIES)
    and structured parameters (JSCOMPS), and keep the property group.
  - Fixed a use-after-free and a memory leak when converting a vCalendar procedure alarm (PALARM)
    whose attachment is a plain path name.
- libical:
  - Fix busy status of recurring events in `icalcomponent_foreach_recurrence()`.
  - Fix `icalvalue_decode_ical_string()` and `icallangbind_property_eval_string()` reading past
    the end of a string that ends in a backslash or a newline.
  - `icaltimezone_truncate_vtimezone()` no longer reads the RRULE after freeing it when the new
     DTSTART is within a year of UNTIL (RSCALE rules), and no longer uses an uninitialized onset
     when no RRULE occurrence falls before the window close.
  - Fix IMAGE and STRUCTURED-DATA given by URI (with or without VALUE=URI) parsing to a URI value,
    whose string `icalproperty_get_image()` and `icalproperty_get_structureddata()` then read as
    an icalattach pointer.
  - Fix use-after-free and double free in `icalcomponent_merge_component()` when both calendars
    have a VTIMEZONE with the same TZID. Every VTIMEZONE of the merged calendar is now merged,
    and a conflicting VTIMEZONE is added under a renamed TZID (e.g. "Zone1") that its events use.
  - Fix out-of-bounds access to the year days bitmask in the recurrence iterator when an RSCALE
    date falls outside the year (e.g. BYWEEKNO with a DTSTART before the calendar's epoch).
  - Fix `icalrecur_iterator_set_range()` for a reverse range on a rule without UNTIL, which
    started the iteration at year 0 instead of at 'from'.
  - Fix `icalparser_clean()` for proper reuse by resetting internal structure values and clearing
    the root component to avoid a use-after-free.
  - Behavior change: The typed icalvalue getters now check that the value type of the icalvalue
    uses the same union member as the expected value type of the getter, as the vcardvalue getters
    have done since version 4.0.6. If the type mismatches, then they return the zero value for the
    expected value type. The typed setters error with ICAL_BADARG_ERROR instead of overwriting a
    value held in another union member.
- libicalss:
  - Fix heap-buffer-overflow in `icalspanlist_as_freebusy_matrix()` for busy spans that start
    before or end after the spanlist. `icalspanlist_from_vfreebusy()` now sets the spanlist
    start/end from DTSTART/DTEND and marks FBTYPE=FREE periods as free (all others as busy).
- Buildsystem changes:
  - Fix CMake command target_link_libraries() to use all-keywords as required since CMake v4.4.4.
  - When cross-compiling, don't build/install ical-glib-src-generator w/o existing binary

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 0646b1d8b6ad5a4c49afd72487e2f28b7fa7b6c3)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libical/{libical_4.0.6.bb => libical_4.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_4.0.6.bb => libical_4.0.7.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_4.0.6.bb b/meta/recipes-support/libical/libical_4.0.7.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_4.0.6.bb
rename to meta/recipes-support/libical/libical_4.0.7.bb
index 7b9185c374..cbfcb0675e 100644
--- a/meta/recipes-support/libical/libical_4.0.6.bb
+++ b/meta/recipes-support/libical/libical_4.0.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6d9294493d031c817783b0400a126c89 \
 SECTION = "libs"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "2e3729cb69c282d3bb17a8d2b198af6e4bc7502fd3621c9adf573921fe9dceb0"
+SRC_URI[sha256sum] = "47c05bc96e41416578cf1803bb2ba3f8d292cb17d5ac2fca539dee922bae8a94"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
