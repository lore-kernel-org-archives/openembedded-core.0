Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3014.1794721856430542263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 21:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=t95gBmZS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WBlHnsJO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1ddc2382f-472e6246-6f10-4118-9a84-c6389afa7523-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794721855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AoR2bJ72pcTDsImymlCFSa/1cfeZkp1rxKeNpyiJAYA=;
	b=t95gBmZS+e3JxbXJOOtB9dpqhMNMG/NPJqd7d8ZqSPnoBT8WMbUknS7nv4Gm44ku
	HjuTVLIsdnLD/YIfidO8TWzNN71XVTfl+rbry+zv/VkafFTsWKqMShnwttyVpGnuHDK
	J1YO3rhtWqsGaspr1IBVadEm5oXsztkd4VBQVw6s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794721855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AoR2bJ72pcTDsImymlCFSa/1cfeZkp1rxKeNpyiJAYA=;
	b=WBlHnsJOdSGiiAFHKNZn7FOeKAZOaudog2QBmN6Ej+Htrs9L/cSfdMi9JCNEdLfV
	JM9oSRV0Gp3qNaOfwkib/zoM7aUIFp/QJabl0iEJOB08/n4XeWrG42rtHKBa6XaUvnn
	9qLuUJ/bUmr051G47SqrgB5TnKpnlQBgEsEb9WMg=
Content-Type: multipart/mixed; boundary="===============4642263250656226439=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 4.0.8 SUCCEEDED
Message-ID: <010101a1ddc2382f-472e6246-6f10-4118-9a84-c6389afa7523-000000@us-west-2.amazonses.com>
Date: Sun, 15 Nov 2026 05:50:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 05:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250230

--===============4642263250656226439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libical* to *4.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libical-upgrade-4.0.7-4.0.8.patch
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
From 76e9425e16f39b6d5df4a397ae252ac707cc0344 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Nov 2026 05:48:08 +0000
Subject: [PATCH] libical: upgrade 4.0.7 -> 4.0.8

# Libical v4.0.7
## Overview

This is a patch release and is fully source and binary compatible with version
4.0.0.

[Note: the libicalvcard is a released as a *Technical Preview*. As such,
its API is not finalized and no source or binary compatibility is guaranteed
with that library in the 4.0.x series.]

## ReleaseNotes

- libicalvcard:
  - `vcardcomponent_clone()` and friends now deep-copy TEXTLIST values (e.g.
    NICKNAME, CATEGORIES)
    and structured parameters (JSCOMPS), and keep the property group. Previously
    the clone shared
    them with the original, so freeing both freed the same memory twice.
  - Fixed a use-after-free and a memory leak when converting a vCalendar
    procedure alarm (PALARM)
    whose attachment is a plain path name.
- libical:
  - Fix busy status of recurring events in `icalcomponent_foreach_recurrence()`.
  - Fix `icalvalue_decode_ical_string()` and
    `icallangbind_property_eval_string()` reading past
    the end of a string that ends in a backslash or a newline.
  - `icaltimezone_truncate_vtimezone()` no longer reads the RRULE after freeing
    it when the new
     DTSTART is within a year of UNTIL (RSCALE rules), and no longer uses an
     uninitialized onset
     when no RRULE occurrence falls before the window close.
  - Fix IMAGE and STRUCTURED-DATA given by URI (with or without VALUE=URI)
    parsing to a URI value,
    whose string `icalproperty_get_image()` and
    `icalproperty_get_structureddata()` then read as
    an icalattach pointer.
  - Fix use-after-free and double free in `icalcomponent_merge_component()` when
    both calendars
    have a VTIMEZONE with the same TZID. Every VTIMEZONE of the merged calendar
    is now merged,
    and a conflicting VTIMEZONE is added under a renamed TZID (e.g. "Zone1")
    that its events use.
  - Fix out-of-bounds access to the year days bitmask in the recurrence iterator
    when an RSCALE
    date falls outside the year (e.g. BYWEEKNO with a DTSTART before the
    calendar's epoch).
  - Fix `icalrecur_iterator_set_range()` for a reverse range on a rule without
    UNTIL, which
    started the iteration at year 0 instead of at 'from'.
  - Fix `icalparser_clean()` for proper reuse by resetting internal structure
    values and clearing
    the root component to avoid a use-after-free.
  - Behavior change: The typed icalvalue getters now check that the value type
    of the icalvalue
    uses the same union member as the expected value type of the getter, as the
    vcardvalue getters
    have done since version 4.0.6. If the type mismatches, then they return the
    zero value for the
    expected value type. The typed setters error with ICAL_BADARG_ERROR instead
    of overwriting a
    value held in another union member.
- libicalss:
  - Fix heap-buffer-overflow in `icalspanlist_as_freebusy_matrix()` for busy
    spans that start
    before or end after the spanlist. `icalspanlist_from_vfreebusy()` now sets
    the spanlist
    start/end from DTSTART/DTEND and marks FBTYPE=FREE periods as free (all
    others as busy).
- Buildsystem changes:
  - Fix CMake command target_link_libraries() to use all-keywords as required
    since CMake v4.4.4.
  - When cross-compiling, don't build/install ical-glib-src-generator w/o
    existing binary

Please see the
[CHANGELOG](https://github.com/libical/libical/blob/4.0/CHANGELOG.md) for more.

# Libical v4.0.8
## Overview

This is a patch release and is fully source and binary compatible with version
4.0.0.

Version 4.0.8 will likely be the last release in the 4.0.x series.
Version 4.1.0 is on our planning board for the next release.

[Note: the libicalvcard is a released as a *Technical Preview*. As such,
its API is not finalized and no source or binary compatibility is guaranteed
with that library in the 4.0.x series.]

## ReleaseNotes
- Built-in timezones updated to tzdata2026f.

- libicalvcard:
  - BDAY, ANNIVERSARY and DEATHDATE with a timestamp value, such as
    `19531015T231000Z`, were written
    with `VALUE=TIMESTAMP`. RFC 6350 does not allow TIMESTAMP for these
    properties, but a TIMESTAMP
    is a valid DATE-TIME value. The VALUE parameter is now omitted.
  - Various fixes for fuzzer issues (OOM and cpu time).

- libicalvcal:
  - Fix an out-of-bounds write when decoding a BASE64 value whose padding
    contains more than
    two `=` characters. The decoder computed the output length as `3 - pad`,
    which wrapped
    to a huge value when `pad` exceeded 3 and was then used as the size of a
    `memcpy`.
  - Reject a vCalendar RRULE/EXRULE interval of 0 or one that does not fit in a
    short.
    Such an interval was converted into an iCalendar RRULE that never advances,
    so expanding it
    (e.g. with `icalcomponent_foreach_recurrence()`) looped forever.
  - Fix an out-of-bounds read in the lexer. When a value folded across lines put
    a newline at the
    last slot of the lookahead ring buffer, `lexLookahead()` peeked at the next
    character with
    `lexB

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../libical/{libical_4.0.7.bb => libical_4.0.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_4.0.7.bb => libical_4.0.8.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_4.0.7.bb b/meta/recipes-support/libical/libical_4.0.8.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_4.0.7.bb
rename to meta/recipes-support/libical/libical_4.0.8.bb
index cbfcb0675e..fcd49b176c 100644
--- a/meta/recipes-support/libical/libical_4.0.7.bb
+++ b/meta/recipes-support/libical/libical_4.0.8.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6d9294493d031c817783b0400a126c89 \
 SECTION = "libs"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "47c05bc96e41416578cf1803bb2ba3f8d292cb17d5ac2fca539dee922bae8a94"
+SRC_URI[sha256sum] = "cd486bb3ece8256c34f1a236e174992c66ecb46b592a65f3f55d24d49eb66a5d"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.47.1


--===============4642263250656226439==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libical-upgrade-4.0.7-4.0.8.patch"

RnJvbSA3NmU5NDI1ZTE2ZjM5YjZkNWRmNGEzOTdhZTI1MmFjNzA3Y2MwMzQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTm92IDIwMjYgMDU6NDg6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpY2FsOiB1cGdyYWRlIDQuMC43IC0+IDQuMC44CgojIExpYmljYWwgdjQuMC43CiMjIE92ZXJ2
aWV3CgpUaGlzIGlzIGEgcGF0Y2ggcmVsZWFzZSBhbmQgaXMgZnVsbHkgc291cmNlIGFuZCBiaW5h
cnkgY29tcGF0aWJsZSB3aXRoIHZlcnNpb24KNC4wLjAuCgpbTm90ZTogdGhlIGxpYmljYWx2Y2Fy
ZCBpcyBhIHJlbGVhc2VkIGFzIGEgKlRlY2huaWNhbCBQcmV2aWV3Ki4gQXMgc3VjaCwKaXRzIEFQ
SSBpcyBub3QgZmluYWxpemVkIGFuZCBubyBzb3VyY2Ugb3IgYmluYXJ5IGNvbXBhdGliaWxpdHkg
aXMgZ3VhcmFudGVlZAp3aXRoIHRoYXQgbGlicmFyeSBpbiB0aGUgNC4wLnggc2VyaWVzLl0KCiMj
IFJlbGVhc2VOb3RlcwoKLSBsaWJpY2FsdmNhcmQ6CiAgLSBgdmNhcmRjb21wb25lbnRfY2xvbmUo
KWAgYW5kIGZyaWVuZHMgbm93IGRlZXAtY29weSBURVhUTElTVCB2YWx1ZXMgKGUuZy4KICAgIE5J
Q0tOQU1FLCBDQVRFR09SSUVTKQogICAgYW5kIHN0cnVjdHVyZWQgcGFyYW1ldGVycyAoSlNDT01Q
UyksIGFuZCBrZWVwIHRoZSBwcm9wZXJ0eSBncm91cC4gUHJldmlvdXNseQogICAgdGhlIGNsb25l
IHNoYXJlZAogICAgdGhlbSB3aXRoIHRoZSBvcmlnaW5hbCwgc28gZnJlZWluZyBib3RoIGZyZWVk
IHRoZSBzYW1lIG1lbW9yeSB0d2ljZS4KICAtIEZpeGVkIGEgdXNlLWFmdGVyLWZyZWUgYW5kIGEg
bWVtb3J5IGxlYWsgd2hlbiBjb252ZXJ0aW5nIGEgdkNhbGVuZGFyCiAgICBwcm9jZWR1cmUgYWxh
cm0gKFBBTEFSTSkKICAgIHdob3NlIGF0dGFjaG1lbnQgaXMgYSBwbGFpbiBwYXRoIG5hbWUuCi0g
bGliaWNhbDoKICAtIEZpeCBidXN5IHN0YXR1cyBvZiByZWN1cnJpbmcgZXZlbnRzIGluIGBpY2Fs
Y29tcG9uZW50X2ZvcmVhY2hfcmVjdXJyZW5jZSgpYC4KICAtIEZpeCBgaWNhbHZhbHVlX2RlY29k
ZV9pY2FsX3N0cmluZygpYCBhbmQKICAgIGBpY2FsbGFuZ2JpbmRfcHJvcGVydHlfZXZhbF9zdHJp
bmcoKWAgcmVhZGluZyBwYXN0CiAgICB0aGUgZW5kIG9mIGEgc3RyaW5nIHRoYXQgZW5kcyBpbiBh
IGJhY2tzbGFzaCBvciBhIG5ld2xpbmUuCiAgLSBgaWNhbHRpbWV6b25lX3RydW5jYXRlX3Z0aW1l
em9uZSgpYCBubyBsb25nZXIgcmVhZHMgdGhlIFJSVUxFIGFmdGVyIGZyZWVpbmcKICAgIGl0IHdo
ZW4gdGhlIG5ldwogICAgIERUU1RBUlQgaXMgd2l0aGluIGEgeWVhciBvZiBVTlRJTCAoUlNDQUxF
IHJ1bGVzKSwgYW5kIG5vIGxvbmdlciB1c2VzIGFuCiAgICAgdW5pbml0aWFsaXplZCBvbnNldAog
ICAgIHdoZW4gbm8gUlJVTEUgb2NjdXJyZW5jZSBmYWxscyBiZWZvcmUgdGhlIHdpbmRvdyBjbG9z
ZS4KICAtIEZpeCBJTUFHRSBhbmQgU1RSVUNUVVJFRC1EQVRBIGdpdmVuIGJ5IFVSSSAod2l0aCBv
ciB3aXRob3V0IFZBTFVFPVVSSSkKICAgIHBhcnNpbmcgdG8gYSBVUkkgdmFsdWUsCiAgICB3aG9z
ZSBzdHJpbmcgYGljYWxwcm9wZXJ0eV9nZXRfaW1hZ2UoKWAgYW5kCiAgICBgaWNhbHByb3BlcnR5
X2dldF9zdHJ1Y3R1cmVkZGF0YSgpYCB0aGVuIHJlYWQgYXMKICAgIGFuIGljYWxhdHRhY2ggcG9p
bnRlci4KICAtIEZpeCB1c2UtYWZ0ZXItZnJlZSBhbmQgZG91YmxlIGZyZWUgaW4gYGljYWxjb21w
b25lbnRfbWVyZ2VfY29tcG9uZW50KClgIHdoZW4KICAgIGJvdGggY2FsZW5kYXJzCiAgICBoYXZl
IGEgVlRJTUVaT05FIHdpdGggdGhlIHNhbWUgVFpJRC4gRXZlcnkgVlRJTUVaT05FIG9mIHRoZSBt
ZXJnZWQgY2FsZW5kYXIKICAgIGlzIG5vdyBtZXJnZWQsCiAgICBhbmQgYSBjb25mbGljdGluZyBW
VElNRVpPTkUgaXMgYWRkZWQgdW5kZXIgYSByZW5hbWVkIFRaSUQgKGUuZy4gIlpvbmUxIikKICAg
IHRoYXQgaXRzIGV2ZW50cyB1c2UuCiAgLSBGaXggb3V0LW9mLWJvdW5kcyBhY2Nlc3MgdG8gdGhl
IHllYXIgZGF5cyBiaXRtYXNrIGluIHRoZSByZWN1cnJlbmNlIGl0ZXJhdG9yCiAgICB3aGVuIGFu
IFJTQ0FMRQogICAgZGF0ZSBmYWxscyBvdXRzaWRlIHRoZSB5ZWFyIChlLmcuIEJZV0VFS05PIHdp
dGggYSBEVFNUQVJUIGJlZm9yZSB0aGUKICAgIGNhbGVuZGFyJ3MgZXBvY2gpLgogIC0gRml4IGBp
Y2FscmVjdXJfaXRlcmF0b3Jfc2V0X3JhbmdlKClgIGZvciBhIHJldmVyc2UgcmFuZ2Ugb24gYSBy
dWxlIHdpdGhvdXQKICAgIFVOVElMLCB3aGljaAogICAgc3RhcnRlZCB0aGUgaXRlcmF0aW9uIGF0
IHllYXIgMCBpbnN0ZWFkIG9mIGF0ICdmcm9tJy4KICAtIEZpeCBgaWNhbHBhcnNlcl9jbGVhbigp
YCBmb3IgcHJvcGVyIHJldXNlIGJ5IHJlc2V0dGluZyBpbnRlcm5hbCBzdHJ1Y3R1cmUKICAgIHZh
bHVlcyBhbmQgY2xlYXJpbmcKICAgIHRoZSByb290IGNvbXBvbmVudCB0byBhdm9pZCBhIHVzZS1h
ZnRlci1mcmVlLgogIC0gQmVoYXZpb3IgY2hhbmdlOiBUaGUgdHlwZWQgaWNhbHZhbHVlIGdldHRl
cnMgbm93IGNoZWNrIHRoYXQgdGhlIHZhbHVlIHR5cGUKICAgIG9mIHRoZSBpY2FsdmFsdWUKICAg
IHVzZXMgdGhlIHNhbWUgdW5pb24gbWVtYmVyIGFzIHRoZSBleHBlY3RlZCB2YWx1ZSB0eXBlIG9m
IHRoZSBnZXR0ZXIsIGFzIHRoZQogICAgdmNhcmR2YWx1ZSBnZXR0ZXJzCiAgICBoYXZlIGRvbmUg
c2luY2UgdmVyc2lvbiA0LjAuNi4gSWYgdGhlIHR5cGUgbWlzbWF0Y2hlcywgdGhlbiB0aGV5IHJl
dHVybiB0aGUKICAgIHplcm8gdmFsdWUgZm9yIHRoZQogICAgZXhwZWN0ZWQgdmFsdWUgdHlwZS4g
VGhlIHR5cGVkIHNldHRlcnMgZXJyb3Igd2l0aCBJQ0FMX0JBREFSR19FUlJPUiBpbnN0ZWFkCiAg
ICBvZiBvdmVyd3JpdGluZyBhCiAgICB2YWx1ZSBoZWxkIGluIGFub3RoZXIgdW5pb24gbWVtYmVy
LgotIGxpYmljYWxzczoKICAtIEZpeCBoZWFwLWJ1ZmZlci1vdmVyZmxvdyBpbiBgaWNhbHNwYW5s
aXN0X2FzX2ZyZWVidXN5X21hdHJpeCgpYCBmb3IgYnVzeQogICAgc3BhbnMgdGhhdCBzdGFydAog
ICAgYmVmb3JlIG9yIGVuZCBhZnRlciB0aGUgc3Bhbmxpc3QuIGBpY2Fsc3Bhbmxpc3RfZnJvbV92
ZnJlZWJ1c3koKWAgbm93IHNldHMKICAgIHRoZSBzcGFubGlzdAogICAgc3RhcnQvZW5kIGZyb20g
RFRTVEFSVC9EVEVORCBhbmQgbWFya3MgRkJUWVBFPUZSRUUgcGVyaW9kcyBhcyBmcmVlIChhbGwK
ICAgIG90aGVycyBhcyBidXN5KS4KLSBCdWlsZHN5c3RlbSBjaGFuZ2VzOgogIC0gRml4IENNYWtl
IGNvbW1hbmQgdGFyZ2V0X2xpbmtfbGlicmFyaWVzKCkgdG8gdXNlIGFsbC1rZXl3b3JkcyBhcyBy
ZXF1aXJlZAogICAgc2luY2UgQ01ha2UgdjQuNC40LgogIC0gV2hlbiBjcm9zcy1jb21waWxpbmcs
IGRvbid0IGJ1aWxkL2luc3RhbGwgaWNhbC1nbGliLXNyYy1nZW5lcmF0b3Igdy9vCiAgICBleGlz
dGluZyBiaW5hcnkKClBsZWFzZSBzZWUgdGhlCltDSEFOR0VMT0ddKGh0dHBzOi8vZ2l0aHViLmNv
bS9saWJpY2FsL2xpYmljYWwvYmxvYi80LjAvQ0hBTkdFTE9HLm1kKSBmb3IgbW9yZS4KCiMgTGli
aWNhbCB2NC4wLjgKIyMgT3ZlcnZpZXcKClRoaXMgaXMgYSBwYXRjaCByZWxlYXNlIGFuZCBpcyBm
dWxseSBzb3VyY2UgYW5kIGJpbmFyeSBjb21wYXRpYmxlIHdpdGggdmVyc2lvbgo0LjAuMC4KClZl
cnNpb24gNC4wLjggd2lsbCBsaWtlbHkgYmUgdGhlIGxhc3QgcmVsZWFzZSBpbiB0aGUgNC4wLngg
c2VyaWVzLgpWZXJzaW9uIDQuMS4wIGlzIG9uIG91ciBwbGFubmluZyBib2FyZCBmb3IgdGhlIG5l
eHQgcmVsZWFzZS4KCltOb3RlOiB0aGUgbGliaWNhbHZjYXJkIGlzIGEgcmVsZWFzZWQgYXMgYSAq
VGVjaG5pY2FsIFByZXZpZXcqLiBBcyBzdWNoLAppdHMgQVBJIGlzIG5vdCBmaW5hbGl6ZWQgYW5k
IG5vIHNvdXJjZSBvciBiaW5hcnkgY29tcGF0aWJpbGl0eSBpcyBndWFyYW50ZWVkCndpdGggdGhh
dCBsaWJyYXJ5IGluIHRoZSA0LjAueCBzZXJpZXMuXQoKIyMgUmVsZWFzZU5vdGVzCi0gQnVpbHQt
aW4gdGltZXpvbmVzIHVwZGF0ZWQgdG8gdHpkYXRhMjAyNmYuCgotIGxpYmljYWx2Y2FyZDoKICAt
IEJEQVksIEFOTklWRVJTQVJZIGFuZCBERUFUSERBVEUgd2l0aCBhIHRpbWVzdGFtcCB2YWx1ZSwg
c3VjaCBhcwogICAgYDE5NTMxMDE1VDIzMTAwMFpgLCB3ZXJlIHdyaXR0ZW4KICAgIHdpdGggYFZB
TFVFPVRJTUVTVEFNUGAuIFJGQyA2MzUwIGRvZXMgbm90IGFsbG93IFRJTUVTVEFNUCBmb3IgdGhl
c2UKICAgIHByb3BlcnRpZXMsIGJ1dCBhIFRJTUVTVEFNUAogICAgaXMgYSB2YWxpZCBEQVRFLVRJ
TUUgdmFsdWUuIFRoZSBWQUxVRSBwYXJhbWV0ZXIgaXMgbm93IG9taXR0ZWQuCiAgLSBWYXJpb3Vz
IGZpeGVzIGZvciBmdXp6ZXIgaXNzdWVzIChPT00gYW5kIGNwdSB0aW1lKS4KCi0gbGliaWNhbHZj
YWw6CiAgLSBGaXggYW4gb3V0LW9mLWJvdW5kcyB3cml0ZSB3aGVuIGRlY29kaW5nIGEgQkFTRTY0
IHZhbHVlIHdob3NlIHBhZGRpbmcKICAgIGNvbnRhaW5zIG1vcmUgdGhhbgogICAgdHdvIGA9YCBj
aGFyYWN0ZXJzLiBUaGUgZGVjb2RlciBjb21wdXRlZCB0aGUgb3V0cHV0IGxlbmd0aCBhcyBgMyAt
IHBhZGAsCiAgICB3aGljaCB3cmFwcGVkCiAgICB0byBhIGh1Z2UgdmFsdWUgd2hlbiBgcGFkYCBl
eGNlZWRlZCAzIGFuZCB3YXMgdGhlbiB1c2VkIGFzIHRoZSBzaXplIG9mIGEKICAgIGBtZW1jcHlg
LgogIC0gUmVqZWN0IGEgdkNhbGVuZGFyIFJSVUxFL0VYUlVMRSBpbnRlcnZhbCBvZiAwIG9yIG9u
ZSB0aGF0IGRvZXMgbm90IGZpdCBpbiBhCiAgICBzaG9ydC4KICAgIFN1Y2ggYW4gaW50ZXJ2YWwg
d2FzIGNvbnZlcnRlZCBpbnRvIGFuIGlDYWxlbmRhciBSUlVMRSB0aGF0IG5ldmVyIGFkdmFuY2Vz
LAogICAgc28gZXhwYW5kaW5nIGl0CiAgICAoZS5nLiB3aXRoIGBpY2FsY29tcG9uZW50X2ZvcmVh
Y2hfcmVjdXJyZW5jZSgpYCkgbG9vcGVkIGZvcmV2ZXIuCiAgLSBGaXggYW4gb3V0LW9mLWJvdW5k
cyByZWFkIGluIHRoZSBsZXhlci4gV2hlbiBhIHZhbHVlIGZvbGRlZCBhY3Jvc3MgbGluZXMgcHV0
CiAgICBhIG5ld2xpbmUgYXQgdGhlCiAgICBsYXN0IHNsb3Qgb2YgdGhlIGxvb2thaGVhZCByaW5n
IGJ1ZmZlciwgYGxleExvb2thaGVhZCgpYCBwZWVrZWQgYXQgdGhlIG5leHQKICAgIGNoYXJhY3Rl
ciB3aXRoCiAgICBgbGV4QgoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyA1MDAw
IGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNo
bWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9saWJpY2FsL3tsaWJpY2FsXzQuMC43LmJi
ID0+IGxpYmljYWxfNC4wLjguYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmljYWwve2xpYmljYWxfNC4wLjcuYmIgPT4gbGliaWNhbF80LjAuOC5iYn0gKDk2JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWxfNC4wLjcu
YmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWxfNC4wLjguYmIKc2ltaWxh
cml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9s
aWJpY2FsXzQuMC43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xp
YmljYWxfNC4wLjguYmIKaW5kZXggY2JmY2IwNjc1ZS4uZmNkNDliMTc2YyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsXzQuMC43LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbF80LjAuOC5iYgpAQCAtMTEsNyArMTEsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NmQ5Mjk0NDkzZDAz
MWM4MTc3ODNiMDQwMGExMjZjODkgXAogU0VDVElPTiA9ICJsaWJzIgogCiBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmd6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjQ3YzA1YmM5NmU0MTQxNjU3OGNmMTgwM2JiMmJhM2Y4ZDI5MmNiMTdkNWFj
MmZjYTUzOWRlZTkyMmJhZThhOTQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2Q0ODZiYjNlY2U4
MjU2YzM0ZjFhMjM2ZTE3NDk5MmM2NmVjYjQ2YjU5MmE2NWYzZjU1ZDI0ZDQ5ZWI2NmE1ZCIKIAog
aW5oZXJpdCBjbWFrZSBwa2djb25maWcgZ29iamVjdC1pbnRyb3NwZWN0aW9uIHZhbGEgZ2l0aHVi
LXJlbGVhc2VzCiAKLS0gCjIuNDcuMQoK

--===============4642263250656226439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libical: SRC_URI changed from "https://github.com/libical/libical/releases//download/v4.0.7/libical-4.0.7.tar.gz" to "https://github.com/libical/libical/releases//download/v4.0.8/libical-4.0.8.tar.gz"
packages/x86-64-v3-poky-linux/libical: PV changed from "4.0.7" to "4.0.8"
packages/x86-64-v3-poky-linux/libical: PKGV changed from 4.0.7 [default] to 4.0.8 [default]
packages/x86-64-v3-poky-linux/libical/libical-dbg: FILELIST: removed "/usr/lib/.debug/libicalss_cxx.so.4.0.7 /usr/lib/.debug/libical.so.4.0.7 /usr/lib/.debug/libicalvcal.so.4.0.7 /usr/lib/.debug/libical_cxx.so.4.0.7 /usr/lib/.debug/libicalvcard.so.4.0.7 /usr/lib/.debug/libicalss.so.4.0.7 /usr/lib/.debug/libical-glib.so.4.0.7", added "/usr/lib/.debug/libical_cxx.so.4.0.8 /usr/lib/.debug/libicalvcal.so.4.0.8 /usr/lib/.debug/libicalss_cxx.so.4.0.8 /usr/lib/.debug/libical-glib.so.4.0.8 /usr/lib/.debug/libical.so.4.0.8 /usr/lib/.debug/libicalss.so.4.0.8 /usr/lib/.debug/libicalvcard.so.4.0.8"
packages/x86-64-v3-poky-linux/libical/libical-dbg: PV changed from "4.0.7" to "4.0.8"
packages/x86-64-v3-poky-linux/libical/libical-dbg: PKGV changed from 4.0.7 [default] to 4.0.8 [default]
packages/x86-64-v3-poky-linux/libical/libical-dbg: PKGSIZE changed from 5057296 to 5066768 (+0%)
packages/x86-64-v3-poky-linux/libical/libical-dev: FILELIST: added "/usr/include/libical/libical_ical_cxx_export.h /usr/include/libical-glib/libical_glib_export.h /usr/include/libical/libical_icalss_cxx_export.h"
packages/x86-64-v3-poky-linux/libical/libical-dev: PV changed from "4.0.7" to "4.0.8"
packages/x86-64-v3-poky-linux/libical/libical-dev: PKGV changed from 4.0.7 [default] to 4.0.8 [default]
packages/x86-64-v3-poky-linux/libical/libical-dev: PKGSIZE changed from 4524210 to 4529916 (+0%)
packages/x86-64-v3-poky-linux/libical/libical-doc: PV changed from "4.0.7" to "4.0.8"
packages/x86-64-v3-poky-linux/libical/libical-doc: PKGV changed from 4.0.7 [default] to 4.0.8 [default]
packages/x86-64-v3-poky-linux/libical/libical-locale: PV changed from "4.0.7" to "4.0.8"
packages/x86-64-v3-poky-linux/libical/libical-locale: PKGV changed from 4.0.7 [default] to 4.0.8 [default]
packages/x86-64-v3-poky-linux/libical/libical-src: FILELIST: directory renamed /usr/src/debug/libical/4.0.7/src/libical-glib -> /usr/src/debug/libical/4.0.8/src/libical-glib, directory renamed /usr/src/debug/libical/4.0.7/src/libicalvcal -> /usr/src/debug/libical/4.0.8/src/libicalvcal, directory renamed /usr/src/debug/libical/4.0.7/src/libicalvcard -> /usr/src/debug/libical/4.0.8/src/libicalvcard, directory renamed /usr/src/debug/libical/4.0.7/src/libical -> /usr/src/debug/libical/4.0.8/src/libical, directory renamed /usr/src/debug/libical/4.0.7 -> /usr/src/debug/libical/4.0.8, directory renamed /usr/src/debug/libical/4.0.7/src/libicalss -> /usr/src/debug/libical/4.0.8/src/libicalss
packages/x86-64-v3-poky-linux/libical/libical-src: PV changed from "4.0.7" to "4.0.8"
packages/x86-64-v3-poky-linux/libical/libical-src: PKGV changed from 4.0.7 [default] to 4.0.8 [default]
packages/x86-64-v3-poky-linux/libical/libical-src: PKGSIZE changed from 4453467 to 4462633 (+0%)
packages/x86-64-v3-poky-linux/libical/libical-staticdev: PV changed from "4.0.7" to "4.0.8"
packages/x86-64-v3-poky-linux/libical/libical-staticdev: PKGV changed from 4.0.7 [default] to 4.0.8 [default]
packages/x86-64-v3-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libicalss.so.4.0.7 /usr/lib/libicalvcal.so.4.0.7 /usr/lib/libicalvcard.so.4.0.7 /usr/lib/libicalss_cxx.so.4.0.7 /usr/lib/libical-glib.so.4.0.7 /usr/lib/libical.so.4.0.7 /usr/lib/libical_cxx.so.4.0.7", added "/usr/lib/libicalss_cxx.so.4.0.8 /usr/lib/libicalvcard.so.4.0.8 /usr/lib/libicalvcal.so.4.0.8 /usr/lib/libicalss.so.4.0.8 /usr/lib/libical_cxx.so.4.0.8 /usr/lib/libical-glib.so.4.0.8 /usr/lib/libical.so.4.0.8"
packages/x86-64-v3-poky-linux/libical/libical: PV changed from "4.0.7" to "4.0.8"
packages/x86-64-v3-poky-linux/libical/libical: PKGV changed from 4.0.7 [default] to 4.0.8 [default]
Changes to packages/x86-64-v3-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.4.0 changed symlink target from libical_cxx.so.4.0.7 to libical_cxx.so.4.0.8
  /usr/lib/libical-glib.so.4.0 changed symlink target from libical-glib.so.4.0.7 to libical-glib.so.4.0.8
  /usr/lib/libical.so.4.0 changed symlink target from libical.so.4.0.7 to libical.so.4.0.8
  /usr/lib/libicalss_cxx.so.4.0 changed symlink target from libicalss_cxx.so.4.0.7 to libicalss_cxx.so.4.0.8
  /usr/lib/libicalss.so.4.0 changed symlink target from libicalss.so.4.0.7 to libicalss.so.4.0.8
  /usr/lib/libicalvcal.so.4.0 changed symlink target from libicalvcal.so.4.0.7 to libicalvcal.so.4.0.8
  /usr/lib/libicalvcard.so.4.0 changed symlink target from libicalvcard.so.4.0.7 to libicalvcard.so.4.0.8
  /usr/lib/libical_cxx.so.4.0.7 moved to /usr/lib/libical_cxx.so.4.0.8
  /usr/lib/libical-glib.so.4.0.7 moved to /usr/lib/libical-glib.so.4.0.8
  /usr/lib/libical.so.4.0.7 moved to /usr/lib/libical.so.4.0.8
  /usr/lib/libicalss_cxx.so.4.0.7 moved to /usr/lib/libicalss_cxx.so.4.0.8
  /usr/lib/libicalss.so.4.0.7 moved to /usr/lib/libicalss.so.4.0.8
  /usr/lib/libicalvcal.so.4.0.7 moved to /usr/lib/libicalvcal.so.4.0.8
  /usr/lib/libicalvcard.so.4.0.7 moved to /usr/lib/libicalvcard.so.4.0.8
  /usr/include/libical-glib/libical_glib_export.h was added
  /usr/include/libical/libical_ical_cxx_export.h was added
  /usr/include/libical/libical_icalss_cxx_export.h was added

--===============4642263250656226439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libical-changelog.txt"

# Libical v4.0.7
## Overview

This is a patch release and is fully source and binary compatible with version
4.0.0.

[Note: the libicalvcard is a released as a *Technical Preview*. As such,
its API is not finalized and no source or binary compatibility is guaranteed
with that library in the 4.0.x series.]

## ReleaseNotes

- libicalvcard:
  - `vcardcomponent_clone()` and friends now deep-copy TEXTLIST values (e.g.
    NICKNAME, CATEGORIES)
    and structured parameters (JSCOMPS), and keep the property group. Previously
    the clone shared
    them with the original, so freeing both freed the same memory twice.
  - Fixed a use-after-free and a memory leak when converting a vCalendar
    procedure alarm (PALARM)
    whose attachment is a plain path name.
- libical:
  - Fix busy status of recurring events in `icalcomponent_foreach_recurrence()`.
  - Fix `icalvalue_decode_ical_string()` and
    `icallangbind_property_eval_string()` reading past
    the end of a string that ends in a backslash or a newline.
  - `icaltimezone_truncate_vtimezone()` no longer reads the RRULE after freeing
    it when the new
     DTSTART is within a year of UNTIL (RSCALE rules), and no longer uses an
     uninitialized onset
     when no RRULE occurrence falls before the window close.
  - Fix IMAGE and STRUCTURED-DATA given by URI (with or without VALUE=URI)
    parsing to a URI value,
    whose string `icalproperty_get_image()` and
    `icalproperty_get_structureddata()` then read as
    an icalattach pointer.
  - Fix use-after-free and double free in `icalcomponent_merge_component()` when
    both calendars
    have a VTIMEZONE with the same TZID. Every VTIMEZONE of the merged calendar
    is now merged,
    and a conflicting VTIMEZONE is added under a renamed TZID (e.g. "Zone1")
    that its events use.
  - Fix out-of-bounds access to the year days bitmask in the recurrence iterator
    when an RSCALE
    date falls outside the year (e.g. BYWEEKNO with a DTSTART before the
    calendar's epoch).
  - Fix `icalrecur_iterator_set_range()` for a reverse range on a rule without
    UNTIL, which
    started the iteration at year 0 instead of at 'from'.
  - Fix `icalparser_clean()` for proper reuse by resetting internal structure
    values and clearing
    the root component to avoid a use-after-free.
  - Behavior change: The typed icalvalue getters now check that the value type
    of the icalvalue
    uses the same union member as the expected value type of the getter, as the
    vcardvalue getters
    have done since version 4.0.6. If the type mismatches, then they return the
    zero value for the
    expected value type. The typed setters error with ICAL_BADARG_ERROR instead
    of overwriting a
    value held in another union member.
- libicalss:
  - Fix heap-buffer-overflow in `icalspanlist_as_freebusy_matrix()` for busy
    spans that start
    before or end after the spanlist. `icalspanlist_from_vfreebusy()` now sets
    the spanlist
    start/end from DTSTART/DTEND and marks FBTYPE=FREE periods as free (all
    others as busy).
- Buildsystem changes:
  - Fix CMake command target_link_libraries() to use all-keywords as required
    since CMake v4.4.4.
  - When cross-compiling, don't build/install ical-glib-src-generator w/o
    existing binary

Please see the
[CHANGELOG](https://github.com/libical/libical/blob/4.0/CHANGELOG.md) for more.

# Libical v4.0.8
## Overview

This is a patch release and is fully source and binary compatible with version
4.0.0.

Version 4.0.8 will likely be the last release in the 4.0.x series.
Version 4.1.0 is on our planning board for the next release.

[Note: the libicalvcard is a released as a *Technical Preview*. As such,
its API is not finalized and no source or binary compatibility is guaranteed
with that library in the 4.0.x series.]

## ReleaseNotes
- Built-in timezones updated to tzdata2026f.

- libicalvcard:
  - BDAY, ANNIVERSARY and DEATHDATE with a timestamp value, such as
    `19531015T231000Z`, were written
    with `VALUE=TIMESTAMP`. RFC 6350 does not allow TIMESTAMP for these
    properties, but a TIMESTAMP
    is a valid DATE-TIME value. The VALUE parameter is now omitted.
  - Various fixes for fuzzer issues (OOM and cpu time).

- libicalvcal:
  - Fix an out-of-bounds write when decoding a BASE64 value whose padding
    contains more than
    two `=` characters. The decoder computed the output length as `3 - pad`,
    which wrapped
    to a huge value when `pad` exceeded 3 and was then used as the size of a
    `memcpy`.
  - Reject a vCalendar RRULE/EXRULE interval of 0 or one that does not fit in a
    short.
    Such an interval was converted into an iCalendar RRULE that never advances,
    so expanding it
    (e.g. with `icalcomponent_foreach_recurrence()`) looped forever.
  - Fix an out-of-bounds read in the lexer. When a value folded across lines put
    a newline at the
    last slot of the lookahead ring buffer, `lexLookahead()` peeked at the next
    character with
    `lexBuf.buf[lexBuf.getPtr+1]` without wrapping the index, reading one
    element
    past the buffer. The sibling carriage-return branch already wrapped with `%
    MAX_LEX_LOOKAHEAD`.
  - Fix an endless loop with unbounded memory growth when parsing a QUOTED-
    PRINTABLE value with
    an `=` that is not followed by two hex digits, or a BASE64 or QUOTED-
    PRINTABLE value that runs
    to the end of the input. A bare `=` is now kept as is.

- libical:
  - A UID can no longer contain non-printable characters.
  - Fix unbounded recursion when parsing too many (100 or more) nested
    components
  - Reject a timezone location containing a `..` path component or an absolute
    path when resolving
    a VTIMEZONE TZID to a file under the zone directory (builds that read on-
    disk zoneinfo rather
    than the builtin data). A crafted TZID such as `../../some/file` could
    otherwise make
    `icaltimezone_fetch_timezone()` open a file outside the configured zone
    directory.
  - Drop CR and LF when writing values that are output without escaping (URI,
    CAL-ADDRESS, ATTACH URLs
    and enum x-values). A vCal quoted-printable value could decode to a line
    break that
    was written out verbatim, ending the content line early and injecting
    another property.
  - In builds with ICU, recurrences with a DAILY or longer frequency no longer
    move to a later time
    of day after an occurrence or DTSTART falls in a DST gap. For example, a
    weekly 02:30 Europe/Berlin
    event returned 03:30 for the week after the spring change too.
  - Fix `BYWEEKNO` with `BYDAY` at the ends of the week-numbering year. The last
    days of the last
    week were dropped when week 1 starts after January 1, days of the next
    year's week 1 were added
    (e.g. a 53rd week in a 52-week year), and with a WKST other than Monday the
    number of weeks in the
    year, and so negative `BYWEEKNO` values, followed ISO weeks.
  - Fix `RSCALE SKIP:` dates moved into another month are dropped when BYDAY is
    present. Also covers
    dates moved backward across a month boundary.
  - Fix heap-buffer-overflow read in `icalrecur_iterator_prev()` after the
    iteration of an HOURLY,
    MINUTELY or SECONDLY rule with a matching BYHOUR, BYMINUTE or BYSECOND
    reached the last supported
    year, which left the BY index past the end of the BY data.
  - `icalrecur_iterator_new()` rejects a SECONDLY, MINUTELY or HOURLY rule with
    a DATE DTSTART.
    Such a rule never advanced past DTSTART, so
    `icalcomponent_foreach_recurrence()` looped
    forever on e.g. `DTSTART;VALUE=DATE:20260101` with `RRULE:FREQ=HOURLY`, and
    `icalrecur_iterator_prev()` hung.
  - `FREQ=WEEKLY` recurrences with `INTERVAL` greater than 1 and a WKST other
    than Sunday (including
    the default Monday) now count weeks from the week that contains DTSTART when
    DTSTART is not the
    first BYDAY day of its week. For example, `FREQ=WEEKLY;INTERVAL=2;BYDAY=SU`
    with a Tuesday DTSTART
    used to skip the first Sunday and put every occurrence in the other weeks.
  - Various fixes for fuzzer issues (OOM and cputime).

- Buildsystem changes:
  - Generate export headers with CMake, fixing Windows static linking without
    requiring consumers
    to define `LIBICAL_*_STATIC_DEFINE`.
  - Give ical_cxx and ical_glib and icalss_cxx their own export macros to
    distinguish their symbols
    from those imported from the underlying libraries.

Please see the
[CHANGELOG](https://github.com/libical/libical/blob/4.0/CHANGELOG.md) for more.

--===============4642263250656226439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libical/libical-dev: FILELIST: added "/usr/include/libical/libical_ical_cxx_export.h /usr/include/libical/libical_icalss_cxx_export.h /usr/include/libical-glib/libical_glib_export.h"
packages/x86-64-v3-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libical.so.4.0.7 /usr/lib/libical-glib.so.4.0.7 /usr/lib/libical_cxx.so.4.0.7 /usr/lib/libicalss.so.4.0.7 /usr/lib/libicalvcal.so.4.0.7 /usr/lib/libicalvcard.so.4.0.7 /usr/lib/libicalss_cxx.so.4.0.7", added "/usr/lib/libical_cxx.so.4.0.8 /usr/lib/libical-glib.so.4.0.8 /usr/lib/libical.so.4.0.8 /usr/lib/libicalss_cxx.so.4.0.8 /usr/lib/libicalvcard.so.4.0.8 /usr/lib/libicalvcal.so.4.0.8 /usr/lib/libicalss.so.4.0.8"
Changes to packages/x86-64-v3-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.4.0 changed symlink target from libical_cxx.so.4.0.7 to libical_cxx.so.4.0.8
  /usr/lib/libical-glib.so.4.0 changed symlink target from libical-glib.so.4.0.7 to libical-glib.so.4.0.8
  /usr/lib/libical.so.4.0 changed symlink target from libical.so.4.0.7 to libical.so.4.0.8
  /usr/lib/libicalss_cxx.so.4.0 changed symlink target from libicalss_cxx.so.4.0.7 to libicalss_cxx.so.4.0.8
  /usr/lib/libicalss.so.4.0 changed symlink target from libicalss.so.4.0.7 to libicalss.so.4.0.8
  /usr/lib/libicalvcal.so.4.0 changed symlink target from libicalvcal.so.4.0.7 to libicalvcal.so.4.0.8
  /usr/lib/libicalvcard.so.4.0 changed symlink target from libicalvcard.so.4.0.7 to libicalvcard.so.4.0.8
  /usr/lib/libical_cxx.so.4.0.7 moved to /usr/lib/libical_cxx.so.4.0.8
  /usr/lib/libical-glib.so.4.0.7 moved to /usr/lib/libical-glib.so.4.0.8
  /usr/lib/libical.so.4.0.7 moved to /usr/lib/libical.so.4.0.8
  /usr/lib/libicalss_cxx.so.4.0.7 moved to /usr/lib/libicalss_cxx.so.4.0.8
  /usr/lib/libicalss.so.4.0.7 moved to /usr/lib/libicalss.so.4.0.8
  /usr/lib/libicalvcal.so.4.0.7 moved to /usr/lib/libicalvcal.so.4.0.8
  /usr/lib/libicalvcard.so.4.0.7 moved to /usr/lib/libicalvcard.so.4.0.8
  /usr/include/libical-glib/libical_glib_export.h was added
  /usr/include/libical/libical_ical_cxx_export.h was added
  /usr/include/libical/libical_icalss_cxx_export.h was added

--===============4642263250656226439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-1444d0ad5658bebb1801c3924a0f27fbe6fa0b86"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:1444d0ad5658bebb1801c3924a0f27fbe6fa0b86"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 288 Local 265 Mirrors 0 Missed 23 Current 336 (92% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 353 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_populate_lic_setscene)
NOTE: Running setscene task 391 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 401 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 410 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libical-4.0.8-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-79.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-4.0.8-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 906 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_recipe_qa)
NOTE: recipe icu-79.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 908 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_fetch)
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 412 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 413 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 415 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 419 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 420 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-4.0.8-r0: task do_recipe_qa: Started
NOTE: recipe icu-79.1-r0: task do_fetch: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 910 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_fetch)
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 421 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 422 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 423 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libical-4.0.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 426 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 427 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_spdx_setscene)
NOTE: Running task 911 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_fetch)
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_fetch: Started
NOTE: Running setscene task 429 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_fetch: Succeeded
NOTE: Running task 912 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-4.0.8-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-4.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 913 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 431 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 432 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.19-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 433 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: Running setscene task 435 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 436 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 437 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 439 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 440 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 441 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_spdx_setscene)
NOTE: recipe libical-4.0.8-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.49-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 443 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 445 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 447 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 448 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-4.0.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 449 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 450 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 453 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 455 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 456 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 458 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 459 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 460 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 461 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 462 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 464 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 465 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.19-r0: task do_unpack: Succeeded
NOTE: Running setscene task 466 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 467 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 468 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 469 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_packagedata_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 925 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_patch)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 472 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 474 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_patch: Started
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 933 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 479 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 480 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 481 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-4.0.8-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 482 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 485 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 486 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libical-4.0.8-r0: task do_patch: Succeeded
NOTE: Running task 940 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 941 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_generate_toolchain_file)
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 495 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-4.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-4.0.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-4.0.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 497 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 501 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 504 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libffi/3.8.0/temp/log.do_packagedata_setscene.4094227
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 505 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 507 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 509 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-4.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 513 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 515 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 520 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 522 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 529 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 531 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_package_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 533 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 536 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 539 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 544 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 545 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 546 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 553 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 559 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 561 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 563 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running setscene task 566 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: Running setscene task 567 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 577 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 579 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 580 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 581 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 582 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_package_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1162 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_create_recipe_spdx)
NOTE: Running task 1163 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_recipe_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe icu-79.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libffi-3.8.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 586 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe icu-79.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1170 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_create_recipe_spdx)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-4.0.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 591 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-4.0.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 609 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 624 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1438 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata)
NOTE: Running task 1480 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-79.1-r0: task do_fetch: Succeeded
NOTE: Running task 1512 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_unpack)
NOTE: Running task 1513 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1514 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_configure)
NOTE: recipe icu-79.1-r0: task do_unpack: Started
NOTE: recipe icu-79.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.19-r0: task do_configure: Started
NOTE: recipe icu-79.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-79.1-r0: task do_unpack: Succeeded
NOTE: Running task 1515 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_patch)
NOTE: recipe icu-79.1-r0: task do_patch: Started
NOTE: recipe icu-79.1-r0: task do_patch: Succeeded
NOTE: Running task 1516 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1517 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_make_icudata)
NOTE: recipe icu-79.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-79.1-r0: task do_make_icudata: Started
NOTE: recipe icu-79.1-r0: task do_make_icudata: Succeeded
NOTE: recipe icu-79.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_deploy_source_date_epoch unihash changed to 016152a54d24197a5b5f9851eee728311b6c0af5753fb8e9fa1924958e93e7f7
NOTE: Setscene tasks completed
NOTE: Running task 1518 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_configure)
NOTE: recipe icu-79.1-r0: task do_configure: Started
NOTE: recipe icu-79.1-r0: task do_configure: Succeeded
NOTE: Running task 1519 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_configure_ptest_base)
NOTE: recipe icu-79.1-r0: task do_configure_ptest_base: Started
NOTE: recipe icu-79.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1520 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_compile)
NOTE: recipe icu-79.1-r0: task do_compile: Started
NOTE: recipe vala-0.56.19-r0: task do_configure: Succeeded
NOTE: Running task 1521 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_compile)
NOTE: recipe vala-0.56.19-r0: task do_compile: Started
NOTE: recipe vala-0.56.19-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_install)
NOTE: recipe vala-0.56.19-r0: task do_install: Started
NOTE: recipe vala-0.56.19-r0: task do_install: Succeeded
NOTE: Running task 1523 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_package)
NOTE: Running task 1524 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.19-r0: task do_package: Started
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_package: Succeeded
NOTE: Running task 1525 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_packagedata)
NOTE: recipe vala-0.56.19-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.19-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_packagedata unihash changed to 30b08612729941613688f718a431ea20e4ec95fcc6cc701b38d63e438ea4d400
NOTE: Setscene tasks completed
NOTE: Running task 1526 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_spdx)
NOTE: recipe vala-0.56.19-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.19-r0: task do_create_spdx: Succeeded
NOTE: recipe icu-79.1-r0: task do_compile: Succeeded
NOTE: Running task 1527 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_compile_ptest_base)
NOTE: recipe icu-79.1-r0: task do_compile_ptest_base: Started
NOTE: recipe icu-79.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1528 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_install)
NOTE: recipe icu-79.1-r0: task do_install: Started
NOTE: recipe icu-79.1-r0: task do_install: Succeeded
NOTE: Running task 1529 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_install_ptest_base)
NOTE: recipe icu-79.1-r0: task do_install_ptest_base: Started
NOTE: recipe icu-79.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1530 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_package)
NOTE: Running task 1531 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_populate_sysroot)
NOTE: recipe icu-79.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-79.1-r0: task do_package: Started
NOTE: recipe icu-79.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1532 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-4.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-4.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1533 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_configure)
NOTE: recipe libical-4.0.8-r0: task do_configure: Started
NOTE: recipe icu-79.1-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_packagedata)
NOTE: recipe icu-79.1-r0: task do_packagedata: Started
NOTE: recipe icu-79.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1535 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_create_spdx)
NOTE: recipe icu-79.1-r0: task do_create_spdx: Started
NOTE: recipe libical-4.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1536 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_compile)
NOTE: recipe libical-4.0.8-r0: task do_compile: Started
NOTE: recipe icu-79.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libical-4.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1537 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_install)
NOTE: recipe libical-4.0.8-r0: task do_install: Started
NOTE: recipe libical-4.0.8-r0: task do_install: Succeeded
NOTE: Running task 1538 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_package)
NOTE: Running task 1539 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_populate_sysroot)
NOTE: recipe libical-4.0.8-r0: task do_package: Started
NOTE: recipe libical-4.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe libical-4.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-4.0.8-r0: task do_package: Succeeded
NOTE: Running task 1540 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_packagedata)
NOTE: recipe libical-4.0.8-r0: task do_packagedata: Started
NOTE: recipe libical-4.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1541 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_create_spdx)
NOTE: Running task 1542 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_package_write_ipk)
NOTE: Running task 1543 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_package_write_deb)
NOTE: Running task 1544 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_package_write_rpm)
NOTE: Running task 1545 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_package_qa)
NOTE: recipe libical-4.0.8-r0: task do_create_spdx: Started
NOTE: recipe libical-4.0.8-r0: task do_package_write_ipk: Started
NOTE: recipe libical-4.0.8-r0: task do_package_write_deb: Started
NOTE: recipe libical-4.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libical-4.0.8-r0: task do_package_qa: Started
NOTE: recipe libical-4.0.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 1546 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_create_package_spdx)
NOTE: recipe libical-4.0.8-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libical-4.0.8-r0: task do_create_package_spdx: Started
NOTE: recipe libical-4.0.8-r0: task do_package_qa: Succeeded
NOTE: recipe libical-4.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-4.0.8-r0: task do_create_package_spdx: Succeeded
NOTE: recipe libical-4.0.8-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1547 of 1547 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.8.bb:do_build)
NOTE: Tasks Summary: Attempted 1547 tasks of which 1496 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libffi-3.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-src went backwards which would break package feeds (from 0:3.8.1-r0 to 0:3.8.0-r0) [version-going-backwards]
ERROR: libffi-3.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dbg went backwards which would break package feeds (from 0:3.8.1-r0 to 0:3.8.0-r0) [version-going-backwards]
ERROR: libffi-3.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-staticdev went backwards which would break package feeds (from 0:3.8.1-r0 to 0:3.8.0-r0) [version-going-backwards]
ERROR: libffi-3.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dev went backwards which would break package feeds (from 0:3.8.1-r0 to 0:3.8.0-r0) [version-going-backwards]
ERROR: libffi-3.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-doc went backwards which would break package feeds (from 0:3.8.1-r0 to 0:3.8.0-r0) [version-going-backwards]
ERROR: libffi-3.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-locale went backwards which would break package feeds (from 0:3.8.1-r0 to 0:3.8.0-r0) [version-going-backwards]
ERROR: libffi-3.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi went backwards which would break package feeds (from 0:3.8.1-r0 to 0:3.8.0-r0) [version-going-backwards]
ERROR: libffi-3.8.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4642263250656226439==--
