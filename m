Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DD8CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:03:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15771.1792130599097332097
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KvoQsTYQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kM9OewC/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1434ec55d-91dac833-cc8c-4afa-ac27-fd8a7165da74-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792130598;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vbdaGE2g0qO7+ZJ2U1o8gIYlALQqsM/PihcX9DsX74I=;
	b=KvoQsTYQcx0nqJJgm7frmJrXXs1GSY7MY7Dk1HEWTfzGdcdra9Crws9UwR9pJ826
	p5MYkEAaLUg86nEtpiEjNVTEVy/wg9kPTLE0RlKYAh1yPujR7F96gOoclUEgsK8efK2
	jQ+14IuqGimq9Dw/j2dBxuVv+e+oTCMtQb0Cnp34=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792130598;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vbdaGE2g0qO7+ZJ2U1o8gIYlALQqsM/PihcX9DsX74I=;
	b=kM9OewC/lR8S07ZkI67ImiZYzAc3i/oyEfoXPZdRFqgt4LcCHW2GASnUtU6GbBGP
	6dH7cIJzBrgmjsdYTPLx0k+meUPcNTFdIfotP6kuMssRrcSJpIkgiPLpPXvK/yhpkzf
	1yhlv5/MHFN+hS3pjWmsJ9jxrk8BRfWzO8gdO4mk=
Content-Type: multipart/mixed; boundary="===============7151308449903322751=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.8.0 SUCCEEDED
Message-ID: <010101a1434ec55d-91dac833-cc8c-4afa-ac27-fd8a7165da74-000000@us-west-2.amazonses.com>
Date: Fri, 16 Oct 2026 06:03:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247964

--===============7151308449903322751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysklogd* to *2.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.7.2-2.8.0.patch
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
From 9e181049996eb341d245c0af7c400dd0f17d7b58 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Oct 2026 06:03:11 +0000
Subject: [PATCH] sysklogd: upgrade 2.7.2 -> 2.8.0

[v2.8.0][] - 2026-10-15
-----------------------

### Changes
- Add `pri` action option, e.g. `*.* /var/log/messages ;pri`, to always print
  the message priority in the header, in the format in use (RFC3164 or
  RFC5424).  By Gavin D. Howard.  The NetBSD-style `+` destination prefix is
  an equivalent alternative, e.g. `*.* +/var/log/messages`, and combines with
  the `-` no-sync prefix as `+-`
- Add `hostname=NAME` action option to replace the hostname in messages
  logged by that action, e.g. to forward under a fixed name from a system
  whose hostname changes
- Add `sd=[SD-ELEMENT]` action option to append a structured data element
  to every message logged by that action.  RFC5424 format only
- `logger` now parses a leading `<LEVEL>` (PRI) in input messages, e.g. for
  systemd-style `daemon --foreground 2>&1 | logger` redirection
- Add security policy for reporting vulnerabilities

### Fixes
- Fix #105: UTF-8 handling with the `-8` flag.  Multi-byte sequences, e.g.,
  em-dash, were corrupted by byte-by-byte sanitization; complete valid UTF-8
  sequences are now preserved, including the RFC 5424 BOM
- Unescape Linux `/dev/kmsg` C-style `\xHH` encoding before sanitization, so
  UTF-8 in kernel messages is preserved with the `-8` flag
- Fix #104: RFC 3164 tag parsing of parenthesized tags.  Surrounding parens are
  stripped from complete tags, `(polkit-agent):` becomes `polkit-agent`, while
  partial tags like `app(version):` are preserved
- `logger`: fix evaluation order violation, found by Coverity Scan

[UNRELEASED]: https://github.com/troglobit/sysklogd/compare/v2.8.0...HEAD
[v2.8.0]:     https://github.com/troglobit/sysklogd/compare/v2.7.2...v2.8.0
---
 .../sysklogd/{sysklogd_2.7.2.bb => sysklogd_2.8.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.7.2.bb => sysklogd_2.8.0.bb} (91%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.8.0.bb
similarity index 91%
rename from meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.8.0.bb
index c436153d1b..79e2612653 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.8.0.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5b4be4b2549338526758ef479c040943 \
 
 inherit update-rc.d update-alternatives systemd autotools
 
-SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https;tag=v${PV} \
+SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=v2.x;protocol=https;tag=v${PV} \
            file://sysklogd \
            "
 
-SRCREV = "5fb314cb9060afa3bd4eed2f0be3200f02f729e9"
+SRCREV = "e2c0c1d9585e88b1a85e3634c4dc230517f68f0e"
 
 EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --without-logger"
 
-- 
2.47.1


--===============7151308449903322751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="sysklogd-changelog.txt"

[v2.8.0][] - 2026-10-15
-----------------------

### Changes
- Add `pri` action option, e.g. `*.* /var/log/messages ;pri`, to always print
  the message priority in the header, in the format in use (RFC3164 or
  RFC5424).  By Gavin D. Howard.  The NetBSD-style `+` destination prefix is
  an equivalent alternative, e.g. `*.* +/var/log/messages`, and combines with
  the `-` no-sync prefix as `+-`
- Add `hostname=NAME` action option to replace the hostname in messages
  logged by that action, e.g. to forward under a fixed name from a system
  whose hostname changes
- Add `sd=[SD-ELEMENT]` action option to append a structured data element
  to every message logged by that action.  RFC5424 format only
- `logger` now parses a leading `<LEVEL>` (PRI) in input messages, e.g. for
  systemd-style `daemon --foreground 2>&1 | logger` redirection
- Add security policy for reporting vulnerabilities

### Fixes
- Fix #105: UTF-8 handling with the `-8` flag.  Multi-byte sequences, e.g.,
  em-dash, were corrupted by byte-by-byte sanitization; complete valid UTF-8
  sequences are now preserved, including the RFC 5424 BOM
- Unescape Linux `/dev/kmsg` C-style `\xHH` encoding before sanitization, so
  UTF-8 in kernel messages is preserved with the `-8` flag
- Fix #104: RFC 3164 tag parsing of parenthesized tags.  Surrounding parens are
  stripped from complete tags, `(polkit-agent):` becomes `polkit-agent`, while
  partial tags like `app(version):` are preserved
- `logger`: fix evaluation order violation, found by Coverity Scan

[UNRELEASED]: https://github.com/troglobit/sysklogd/compare/v2.8.0...HEAD
[v2.8.0]:     https://github.com/troglobit/sysklogd/compare/v2.7.2...v2.8.0

--===============7151308449903322751==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.7.2-2.8.0.patch"

RnJvbSA5ZTE4MTA0OTk5NmViMzQxZDI0NWMwYWY3YzQwMGRkMGYxN2Q3YjU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgT2N0IDIwMjYgMDY6MDM6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNrbG9nZDogdXBncmFkZSAyLjcuMiAtPiAyLjguMAoKW3YyLjguMF1bXSAtIDIwMjYtMTAtMTUK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCiMjIyBDaGFuZ2VzCi0gQWRkIGBwcmlgIGFjdGlvbiBv
cHRpb24sIGUuZy4gYCouKiAvdmFyL2xvZy9tZXNzYWdlcyA7cHJpYCwgdG8gYWx3YXlzIHByaW50
CiAgdGhlIG1lc3NhZ2UgcHJpb3JpdHkgaW4gdGhlIGhlYWRlciwgaW4gdGhlIGZvcm1hdCBpbiB1
c2UgKFJGQzMxNjQgb3IKICBSRkM1NDI0KS4gIEJ5IEdhdmluIEQuIEhvd2FyZC4gIFRoZSBOZXRC
U0Qtc3R5bGUgYCtgIGRlc3RpbmF0aW9uIHByZWZpeCBpcwogIGFuIGVxdWl2YWxlbnQgYWx0ZXJu
YXRpdmUsIGUuZy4gYCouKiArL3Zhci9sb2cvbWVzc2FnZXNgLCBhbmQgY29tYmluZXMgd2l0aAog
IHRoZSBgLWAgbm8tc3luYyBwcmVmaXggYXMgYCstYAotIEFkZCBgaG9zdG5hbWU9TkFNRWAgYWN0
aW9uIG9wdGlvbiB0byByZXBsYWNlIHRoZSBob3N0bmFtZSBpbiBtZXNzYWdlcwogIGxvZ2dlZCBi
eSB0aGF0IGFjdGlvbiwgZS5nLiB0byBmb3J3YXJkIHVuZGVyIGEgZml4ZWQgbmFtZSBmcm9tIGEg
c3lzdGVtCiAgd2hvc2UgaG9zdG5hbWUgY2hhbmdlcwotIEFkZCBgc2Q9W1NELUVMRU1FTlRdYCBh
Y3Rpb24gb3B0aW9uIHRvIGFwcGVuZCBhIHN0cnVjdHVyZWQgZGF0YSBlbGVtZW50CiAgdG8gZXZl
cnkgbWVzc2FnZSBsb2dnZWQgYnkgdGhhdCBhY3Rpb24uICBSRkM1NDI0IGZvcm1hdCBvbmx5Ci0g
YGxvZ2dlcmAgbm93IHBhcnNlcyBhIGxlYWRpbmcgYDxMRVZFTD5gIChQUkkpIGluIGlucHV0IG1l
c3NhZ2VzLCBlLmcuIGZvcgogIHN5c3RlbWQtc3R5bGUgYGRhZW1vbiAtLWZvcmVncm91bmQgMj4m
MSB8IGxvZ2dlcmAgcmVkaXJlY3Rpb24KLSBBZGQgc2VjdXJpdHkgcG9saWN5IGZvciByZXBvcnRp
bmcgdnVsbmVyYWJpbGl0aWVzCgojIyMgRml4ZXMKLSBGaXggIzEwNTogVVRGLTggaGFuZGxpbmcg
d2l0aCB0aGUgYC04YCBmbGFnLiAgTXVsdGktYnl0ZSBzZXF1ZW5jZXMsIGUuZy4sCiAgZW0tZGFz
aCwgd2VyZSBjb3JydXB0ZWQgYnkgYnl0ZS1ieS1ieXRlIHNhbml0aXphdGlvbjsgY29tcGxldGUg
dmFsaWQgVVRGLTgKICBzZXF1ZW5jZXMgYXJlIG5vdyBwcmVzZXJ2ZWQsIGluY2x1ZGluZyB0aGUg
UkZDIDU0MjQgQk9NCi0gVW5lc2NhcGUgTGludXggYC9kZXYva21zZ2AgQy1zdHlsZSBgXHhISGAg
ZW5jb2RpbmcgYmVmb3JlIHNhbml0aXphdGlvbiwgc28KICBVVEYtOCBpbiBrZXJuZWwgbWVzc2Fn
ZXMgaXMgcHJlc2VydmVkIHdpdGggdGhlIGAtOGAgZmxhZwotIEZpeCAjMTA0OiBSRkMgMzE2NCB0
YWcgcGFyc2luZyBvZiBwYXJlbnRoZXNpemVkIHRhZ3MuICBTdXJyb3VuZGluZyBwYXJlbnMgYXJl
CiAgc3RyaXBwZWQgZnJvbSBjb21wbGV0ZSB0YWdzLCBgKHBvbGtpdC1hZ2VudCk6YCBiZWNvbWVz
IGBwb2xraXQtYWdlbnRgLCB3aGlsZQogIHBhcnRpYWwgdGFncyBsaWtlIGBhcHAodmVyc2lvbik6
YCBhcmUgcHJlc2VydmVkCi0gYGxvZ2dlcmA6IGZpeCBldmFsdWF0aW9uIG9yZGVyIHZpb2xhdGlv
biwgZm91bmQgYnkgQ292ZXJpdHkgU2NhbgoKW1VOUkVMRUFTRURdOiBodHRwczovL2dpdGh1Yi5j
b20vdHJvZ2xvYml0L3N5c2tsb2dkL2NvbXBhcmUvdjIuOC4wLi4uSEVBRApbdjIuOC4wXTogICAg
IGh0dHBzOi8vZ2l0aHViLmNvbS90cm9nbG9iaXQvc3lza2xvZ2QvY29tcGFyZS92Mi43LjIuLi52
Mi44LjAKLS0tCiAuLi4vc3lza2xvZ2Qve3N5c2tsb2dkXzIuNy4yLmJiID0+IHN5c2tsb2dkXzIu
OC4wLmJifSAgICAgICAgIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC97
c3lza2xvZ2RfMi43LjIuYmIgPT4gc3lza2xvZ2RfMi44LjAuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2tsb2dkXzIuNy4yLmJiIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5c2tsb2dkXzIuOC4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNr
bG9nZF8yLjcuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5
c2tsb2dkXzIuOC4wLmJiCmluZGV4IGM0MzYxNTNkMWIuLjc5ZTI2MTI2NTMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjcuMi5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lza2xvZ2RfMi44LjAuYmIKQEAgLTEwLDEx
ICsxMCwxMSBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01YjRiZTRi
MjU0OTMzODUyNjc1OGVmNDc5YzA0MDk0MyBcCiAKIGluaGVyaXQgdXBkYXRlLXJjLmQgdXBkYXRl
LWFsdGVybmF0aXZlcyBzeXN0ZW1kIGF1dG90b29scwogCi1TUkNfVVJJID0gImdpdDovL2dpdGh1
Yi5jb20vdHJvZ2xvYml0L3N5c2tsb2dkLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBz
O3RhZz12JHtQVn0gXAorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3Ryb2dsb2JpdC9zeXNr
bG9nZC5naXQ7YnJhbmNoPXYyLng7cHJvdG9jb2w9aHR0cHM7dGFnPXYke1BWfSBcCiAgICAgICAg
ICAgIGZpbGU6Ly9zeXNrbG9nZCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gIjVmYjMxNGNi
OTA2MGFmYTNiZDRlZWQyZjBiZTMyMDBmMDJmNzI5ZTkiCitTUkNSRVYgPSAiZTJjMGMxZDk1ODVl
ODhiMWE4NWUzNjM0YzRkYzIzMDUxN2Y2OGYwZSIKIAogRVhUUkFfT0VDT05GID0gIi0td2l0aC1z
eXN0ZW1kPSR7c3lzdGVtZF9zeXN0ZW1fdW5pdGRpcn0gLS13aXRob3V0LWxvZ2dlciIKIAotLSAK
Mi40Ny4xCgo=

--===============7151308449903322751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/sysklogd: SRC_URI changed from "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https;tag=v2.7.2 file://sysklogd" to "git://github.com/troglobit/sysklogd.git;branch=v2.x;protocol=https;tag=v2.8.0 file://sysklogd"
packages/x86-64-v3-poky-linux/sysklogd: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/sysklogd: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 262632 to 271344 (+3%)
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 111420 to 115474 (+4%)
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-src: FILELIST: directory renamed /usr/src/debug/sysklogd/2.7.2/src -> /usr/src/debug/sysklogd/2.8.0/src, directory renamed /usr/src/debug/sysklogd/2.7.2/lib -> /usr/src/debug/sysklogd/2.8.0/lib
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 168754 to 175225 (+4%)
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-src: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/sysklogd/sysklogd: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/sysklogd/sysklogd: PV changed from "2.7.2" to "2.8.0"

--===============7151308449903322751==--

