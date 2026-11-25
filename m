Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36492.1795585771384351184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hLBMuHYB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0mDFtybf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a21140846e-9e37d1a1-0021-4df5-bdd6-24f646a810ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795585770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9yNptQr8ejhPnzlp5/pHc0nDLC9NghE862F8MM2T6Kw=;
	b=hLBMuHYBGQNcQkBNlL5gzNTArSMRVP5LHeDsb8kWjWzGBeC1prbh8dZI5xSwDaSC
	qmi+ZnmnwKaBOe+cy9oz4Qww/QsBUCNPVedU1/4aepp/cG3ruusSSkxrCMGr8zEy+S7
	0WScbbYmvExNTg/l8ykmUIOsZ/alIGJe7qVgzI6A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795585770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9yNptQr8ejhPnzlp5/pHc0nDLC9NghE862F8MM2T6Kw=;
	b=0mDFtybfmKHhEj/4W9EPX8BIwLzrIj/RVtyT6Ddv/l/K4AfFlTGB/1NoNykwQtgZ
	Pe7RbxroBG9V2H1s51sDFMM0G1zKM3YEilPY1lMT2DJ2syeiTbdJO0Bw1U7i+tb+IYD
	c/wTyae47vI4xUVHeg6O3aoCGZR9udfGJAxQ1sAY=
Content-Type: multipart/mixed; boundary="===============1320286275655918616=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-tomlkit: upgrading to 0.15.3 SUCCEEDED
Message-ID: <010101a21140846e-9e37d1a1-0021-4df5-bdd6-24f646a810ad-000000@us-west-2.amazonses.com>
Date: Wed, 25 Nov 2026 05:49:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251154

--===============1320286275655918616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-tomlkit* to *0.15.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-tomlkit-upgrade-0.15.2-0.15.3.patch
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
From 7758eca3304d4e0d7e614dc8a7fd3f9b5a5d9302 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 25 Nov 2026 05:27:26 +0000
Subject: [PATCH] python3-tomlkit: upgrade 0.15.2 -> 0.15.3

## [0.15.3] - 2026-11-24
### Changed

- Speed up looking up and replacing keys in tables: string lookups no longer
  build a temporary key, and replacing an existing value no longer scans every
  key in the table, which made updating many keys of a large table quadratic.
  ([#704]( ))
- Speed up repeated array appends by keeping existing indexes instead of
  rebuilding them. ([#666]( ))
- Speed up creating string values and keys, e.g. when building a document from
  Python data and dumping it: strings are escaped in one pass instead of per
  character, and the escape and bare-key character sets are built once. ([#709](
  ))
- `comment()`, `Item.comment()` and `Array.add_line(..., comment=...)` now raise
  `ValueError` for control characters that TOML forbids in comments (anything
  but tab, plus `DEL`), including a bare carriage return; `comment()` still
  accepts LF and CRLF line breaks. Previously such comments were written out and
  produced a document that could not be parsed back. ([#705]( ))
- `date()` now raises `ValueError` when given a datetime string such as
  `"1979-05-13T12:34:56"` instead of returning a datetime. ([#673]( ))
- `Array.sort()` now reorders the serialized values too, keeping the array's
  formatting and comments in place; previously `list.sort()` only reordered the
  Python list, so `dumps()` still wrote the old order. ([#644]( ))

### Fixed

- `dumps(..., sort_keys=True)` now sorts the keys of a parsed document
  recursively, matching the behavior on a plain `dict`; previously only the top-
  level keys were sorted while nested tables, inline tables, arrays of tables
  and inline tables inside an array kept their original order. ([#614]( ))
- Allow `Table.setdefault()` and `InlineTable.setdefault()` to retrieve existing
  values without supplying a default, matching document and mapping behavior.
  ([#710]( ))
- Fix `item()` and `dumps()` writing a `datetime` whose UTC offset is not a
  whole number of minutes (e.g. the historical LMT offsets `zoneinfo` gives,
  such as `-00:44:30`) as invalid TOML like `1900-01-01T12:00:00Z:30`, which no
  parser accepts. Such a value is now written as the same instant in UTC; this
  also covers `DateTime.replace()` and `astimezone()`. ([#701]( ))
- Allow `DateTime.astimezone()` to use the local timezone when no timezone
  argument is supplied, matching `datetime.datetime`. ([#651]( ))
- Arithmetic and `replace()` results for `Integer`, `Float`, `String`,
  `DateTime`, `Date` and `Time` no longer share the original item's `Trivia`, so
  changing the result's comment or indentation no longer rewrites the item still
  stored in the document. ([#683]( ))
- Fix `round()` on a `Float` without `ndigits` returning a `Float` (e.g. `2.0`)
  instead of an `Integer`, matching `round()` on a plain `float`. ([#695]( ))
- Fix a regression in 0.15.1 where `string(..., multiline=True, escape=False)`
  added an extra newline to a value starting with a newline, making it
  impossible to write such a raw string verbatim; with `escape=False` the value
  is now used as given again. ([#655]( ))
- Preserve single-line literal quotes when replacing a table field with a plain
  string, falling back to basic quoting when the value requires escaping.
  ([#325]( ))
- Fix invalid output after deleting the last key under a dotted key inside an
  inline table; the emptied table now renders as `b = {}`. ([#664]( ))
- Fix valid TOML being rejected as a duplicate when an out-of-order table header
  extends a table built from several dotted keys, e.g. `[a]` with `b.c = 1` and
  `b.d = 2`, then `[a.b.e]` after another table. ([#632]( ))
- Fix an `AttributeError` when a table is defined out of order under an indented
  header nested four or more levels deep, e.g. ` [a.b.c.d]` then `[a.b.c]`.
  ([#663]( ))
- Fix an out-of-order table being moved when it is separated from its sibling by
  an array of tables (e.g. `[tool.poetry]`, `[[plugins]]`, `[tool.other]`), so
  the document no longer round-trips unchanged. ([#702]( ))
- Fix `update()` on an out-of-order table dropping sibling keys stored in its
  other fragments when one of the updated keys appears in a later fragment.
  ([#675]( ))
- Fix deleting, popping or replacing a key that was newly added to an out-of-
  order table. ([#699]( ))
- Fix `TOMLDocument.value` and comparisons keeping only the last fragment of an
  array of tables split by other tables; all entries are now included, matching
  `unwrap()`. ([#697]( ))
- Fix assigning plain dicts to a slice of an array of tables (e.g. `doc["a"][:1]
  = [{"x": 4}]`) producing invalid output and leaving `unwrap()` and
  `json.dumps()` out of sync; an extended slice of the wrong length now raises
  before changing the document. ([#631]( ))
- Assigning a value that is not a table to an item or slice of an array of
  tables now raises `ValueError` before changing the document. ([#712]( ))
- Fix a `RecursionError` when parsing a dotted key at the maximum nesting depth
  followed by ano

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../{python3-tomlkit_0.15.2.bb => python3-tomlkit_0.15.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-tomlkit_0.15.2.bb => python3-tomlkit_0.15.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb b/meta/recipes-devtools/python/python3-tomlkit_0.15.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb
rename to meta/recipes-devtools/python/python3-tomlkit_0.15.3.bb
index cf67cea552..40b5112bf2 100644
--- a/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb
+++ b/meta/recipes-devtools/python/python3-tomlkit_0.15.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "83e32755ba1d20d9340bd069ee97e9f6232ba2346b63ffcba425de01f7e327a6"
+SRC_URI[sha256sum] = "b3c3020ec1a4bd469d12e31fb4da938e7f6ba758cdbec3fd9047db63120eaf81"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-- 
2.47.1


--===============1320286275655918616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-tomlkit: PV changed from "0.15.2" to "0.15.3"
packages/x86-64-v3-poky-linux/python3-tomlkit: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/tomlkit/tomlkit-0.15.2.tar.gz" to "https://files.pythonhosted.org/packages/source/t/tomlkit/tomlkit-0.15.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-dbg: PV changed from "0.15.2" to "0.15.3"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-dbg: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-dev: PV changed from "0.15.2" to "0.15.3"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-dev: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-doc: PV changed from "0.15.2" to "0.15.3"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-doc: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-locale: PV changed from "0.15.2" to "0.15.3"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-locale: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-ptest: PV changed from "0.15.2" to "0.15.3"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-ptest: FILELIST: added "/usr/lib/python3-tomlkit/ptest/tests/test_array_appends.py /usr/lib/python3-tomlkit/ptest/tests/test_encoder_dispatch.py /usr/lib/python3-tomlkit/ptest/tests/test_container_updates.py"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-ptest: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-ptest: PKGSIZE changed from 470383 to 504043 (+7%)
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-src: PV changed from "0.15.2" to "0.15.3"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-src: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-staticdev: PV changed from "0.15.2" to "0.15.3"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-staticdev: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit: PV changed from "0.15.2" to "0.15.3"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit: FILELIST: directory renamed /usr/lib/python3.15/site-packages/tomlkit-0.15.2.dist-info/licenses -> /usr/lib/python3.15/site-packages/tomlkit-0.15.3.dist-info/licenses, directory renamed /usr/lib/python3.15/site-packages/tomlkit-0.15.2.dist-info -> /usr/lib/python3.15/site-packages/tomlkit-0.15.3.dist-info
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit: PKGSIZE changed from 565502 to 590057 (+4%)
Changes to packages/x86-64-v3-poky-linux/python3-tomlkit (sysroot):
  /usr/lib/python3.15/site-packages/tomlkit-0.15.2.dist-info moved to /usr/lib/python3.15/site-packages/tomlkit-0.15.3.dist-info

--===============1320286275655918616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-ptest: FILELIST: added "/usr/lib/python3-tomlkit/ptest/tests/test_container_updates.py /usr/lib/python3-tomlkit/ptest/tests/test_array_appends.py /usr/lib/python3-tomlkit/ptest/tests/test_encoder_dispatch.py"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit: FILELIST: directory renamed /usr/lib/python3.15/site-packages/tomlkit-0.15.2.dist-info -> /usr/lib/python3.15/site-packages/tomlkit-0.15.3.dist-info, directory renamed /usr/lib/python3.15/site-packages/tomlkit-0.15.2.dist-info/licenses -> /usr/lib/python3.15/site-packages/tomlkit-0.15.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-tomlkit (sysroot):
  /usr/lib/python3.15/site-packages/tomlkit-0.15.2.dist-info moved to /usr/lib/python3.15/site-packages/tomlkit-0.15.3.dist-info

--===============1320286275655918616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-tomlkit-changelog.txt"

## [0.15.3] - 2026-11-24
### Changed

- Speed up looking up and replacing keys in tables: string lookups no longer
  build a temporary key, and replacing an existing value no longer scans every
  key in the table, which made updating many keys of a large table quadratic.
  ([#704]( ))
- Speed up repeated array appends by keeping existing indexes instead of
  rebuilding them. ([#666]( ))
- Speed up creating string values and keys, e.g. when building a document from
  Python data and dumping it: strings are escaped in one pass instead of per
  character, and the escape and bare-key character sets are built once. ([#709](
  ))
- `comment()`, `Item.comment()` and `Array.add_line(..., comment=...)` now raise
  `ValueError` for control characters that TOML forbids in comments (anything
  but tab, plus `DEL`), including a bare carriage return; `comment()` still
  accepts LF and CRLF line breaks. Previously such comments were written out and
  produced a document that could not be parsed back. ([#705]( ))
- `date()` now raises `ValueError` when given a datetime string such as
  `"1979-05-13T12:34:56"` instead of returning a datetime. ([#673]( ))
- `Array.sort()` now reorders the serialized values too, keeping the array's
  formatting and comments in place; previously `list.sort()` only reordered the
  Python list, so `dumps()` still wrote the old order. ([#644]( ))

### Fixed

- `dumps(..., sort_keys=True)` now sorts the keys of a parsed document
  recursively, matching the behavior on a plain `dict`; previously only the top-
  level keys were sorted while nested tables, inline tables, arrays of tables
  and inline tables inside an array kept their original order. ([#614]( ))
- Allow `Table.setdefault()` and `InlineTable.setdefault()` to retrieve existing
  values without supplying a default, matching document and mapping behavior.
  ([#710]( ))
- Fix `item()` and `dumps()` writing a `datetime` whose UTC offset is not a
  whole number of minutes (e.g. the historical LMT offsets `zoneinfo` gives,
  such as `-00:44:30`) as invalid TOML like `1900-01-01T12:00:00Z:30`, which no
  parser accepts. Such a value is now written as the same instant in UTC; this
  also covers `DateTime.replace()` and `astimezone()`. ([#701]( ))
- Allow `DateTime.astimezone()` to use the local timezone when no timezone
  argument is supplied, matching `datetime.datetime`. ([#651]( ))
- Arithmetic and `replace()` results for `Integer`, `Float`, `String`,
  `DateTime`, `Date` and `Time` no longer share the original item's `Trivia`, so
  changing the result's comment or indentation no longer rewrites the item still
  stored in the document. ([#683]( ))
- Fix `round()` on a `Float` without `ndigits` returning a `Float` (e.g. `2.0`)
  instead of an `Integer`, matching `round()` on a plain `float`. ([#695]( ))
- Fix a regression in 0.15.1 where `string(..., multiline=True, escape=False)`
  added an extra newline to a value starting with a newline, making it
  impossible to write such a raw string verbatim; with `escape=False` the value
  is now used as given again. ([#655]( ))
- Preserve single-line literal quotes when replacing a table field with a plain
  string, falling back to basic quoting when the value requires escaping.
  ([#325]( ))
- Fix invalid output after deleting the last key under a dotted key inside an
  inline table; the emptied table now renders as `b = {}`. ([#664]( ))
- Fix valid TOML being rejected as a duplicate when an out-of-order table header
  extends a table built from several dotted keys, e.g. `[a]` with `b.c = 1` and
  `b.d = 2`, then `[a.b.e]` after another table. ([#632]( ))
- Fix an `AttributeError` when a table is defined out of order under an indented
  header nested four or more levels deep, e.g. ` [a.b.c.d]` then `[a.b.c]`.
  ([#663]( ))
- Fix an out-of-order table being moved when it is separated from its sibling by
  an array of tables (e.g. `[tool.poetry]`, `[[plugins]]`, `[tool.other]`), so
  the document no longer round-trips unchanged. ([#702]( ))
- Fix `update()` on an out-of-order table dropping sibling keys stored in its
  other fragments when one of the updated keys appears in a later fragment.
  ([#675]( ))
- Fix deleting, popping or replacing a key that was newly added to an out-of-
  order table. ([#699]( ))
- Fix `TOMLDocument.value` and comparisons keeping only the last fragment of an
  array of tables split by other tables; all entries are now included, matching
  `unwrap()`. ([#697]( ))
- Fix assigning plain dicts to a slice of an array of tables (e.g. `doc["a"][:1]
  = [{"x": 4}]`) producing invalid output and leaving `unwrap()` and
  `json.dumps()` out of sync; an extended slice of the wrong length now raises
  before changing the document. ([#631]( ))
- Assigning a value that is not a table to an item or slice of an array of
  tables now raises `ValueError` before changing the document. ([#712]( ))
- Fix a `RecursionError` when parsing a dotted key at the maximum nesting depth
  followed by another key under the same prefix; `Container`, `Table` and
  `InlineTable` now implement `__deepcopy__`, and errors while assembling tables
  are reported as `ParseError`. ([#714]( ))
- Custom encoders registered with `register_encoder()` now receive only the
  `_parent` and `_sort_keys` keyword arguments they declare (or both when they
  accept `**kwargs`); previously an encoder declaring `_parent` but not
  `_sort_keys` failed with `TypeError`, and one declaring only `_sort_keys`
  never received it. ([#698]( ))

[unreleased]: https://github.com/python-poetry/tomlkit/compare/0.15.3...master
[0.15.3]: https://github.com/python-poetry/tomlkit/releases/tag/0.15.3

--===============1320286275655918616==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-tomlkit-upgrade-0.15.2-0.15.3.patch"

RnJvbSA3NzU4ZWNhMzMwNGQ0ZTBkN2U2MTRkYzhhN2ZkM2Y5YjVhNWQ5MzAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjUgTm92IDIwMjYgMDU6Mjc6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRvbWxraXQ6IHVwZ3JhZGUgMC4xNS4yIC0+IDAuMTUuMwoKIyMgWzAuMTUuM10gLSAy
MDI2LTExLTI0CiMjIyBDaGFuZ2VkCgotIFNwZWVkIHVwIGxvb2tpbmcgdXAgYW5kIHJlcGxhY2lu
ZyBrZXlzIGluIHRhYmxlczogc3RyaW5nIGxvb2t1cHMgbm8gbG9uZ2VyCiAgYnVpbGQgYSB0ZW1w
b3Jhcnkga2V5LCBhbmQgcmVwbGFjaW5nIGFuIGV4aXN0aW5nIHZhbHVlIG5vIGxvbmdlciBzY2Fu
cyBldmVyeQogIGtleSBpbiB0aGUgdGFibGUsIHdoaWNoIG1hZGUgdXBkYXRpbmcgbWFueSBrZXlz
IG9mIGEgbGFyZ2UgdGFibGUgcXVhZHJhdGljLgogIChbIzcwNF0oICkpCi0gU3BlZWQgdXAgcmVw
ZWF0ZWQgYXJyYXkgYXBwZW5kcyBieSBrZWVwaW5nIGV4aXN0aW5nIGluZGV4ZXMgaW5zdGVhZCBv
ZgogIHJlYnVpbGRpbmcgdGhlbS4gKFsjNjY2XSggKSkKLSBTcGVlZCB1cCBjcmVhdGluZyBzdHJp
bmcgdmFsdWVzIGFuZCBrZXlzLCBlLmcuIHdoZW4gYnVpbGRpbmcgYSBkb2N1bWVudCBmcm9tCiAg
UHl0aG9uIGRhdGEgYW5kIGR1bXBpbmcgaXQ6IHN0cmluZ3MgYXJlIGVzY2FwZWQgaW4gb25lIHBh
c3MgaW5zdGVhZCBvZiBwZXIKICBjaGFyYWN0ZXIsIGFuZCB0aGUgZXNjYXBlIGFuZCBiYXJlLWtl
eSBjaGFyYWN0ZXIgc2V0cyBhcmUgYnVpbHQgb25jZS4gKFsjNzA5XSgKICApKQotIGBjb21tZW50
KClgLCBgSXRlbS5jb21tZW50KClgIGFuZCBgQXJyYXkuYWRkX2xpbmUoLi4uLCBjb21tZW50PS4u
LilgIG5vdyByYWlzZQogIGBWYWx1ZUVycm9yYCBmb3IgY29udHJvbCBjaGFyYWN0ZXJzIHRoYXQg
VE9NTCBmb3JiaWRzIGluIGNvbW1lbnRzIChhbnl0aGluZwogIGJ1dCB0YWIsIHBsdXMgYERFTGAp
LCBpbmNsdWRpbmcgYSBiYXJlIGNhcnJpYWdlIHJldHVybjsgYGNvbW1lbnQoKWAgc3RpbGwKICBh
Y2NlcHRzIExGIGFuZCBDUkxGIGxpbmUgYnJlYWtzLiBQcmV2aW91c2x5IHN1Y2ggY29tbWVudHMg
d2VyZSB3cml0dGVuIG91dCBhbmQKICBwcm9kdWNlZCBhIGRvY3VtZW50IHRoYXQgY291bGQgbm90
IGJlIHBhcnNlZCBiYWNrLiAoWyM3MDVdKCApKQotIGBkYXRlKClgIG5vdyByYWlzZXMgYFZhbHVl
RXJyb3JgIHdoZW4gZ2l2ZW4gYSBkYXRldGltZSBzdHJpbmcgc3VjaCBhcwogIGAiMTk3OS0wNS0x
M1QxMjozNDo1NiJgIGluc3RlYWQgb2YgcmV0dXJuaW5nIGEgZGF0ZXRpbWUuIChbIzY3M10oICkp
Ci0gYEFycmF5LnNvcnQoKWAgbm93IHJlb3JkZXJzIHRoZSBzZXJpYWxpemVkIHZhbHVlcyB0b28s
IGtlZXBpbmcgdGhlIGFycmF5J3MKICBmb3JtYXR0aW5nIGFuZCBjb21tZW50cyBpbiBwbGFjZTsg
cHJldmlvdXNseSBgbGlzdC5zb3J0KClgIG9ubHkgcmVvcmRlcmVkIHRoZQogIFB5dGhvbiBsaXN0
LCBzbyBgZHVtcHMoKWAgc3RpbGwgd3JvdGUgdGhlIG9sZCBvcmRlci4gKFsjNjQ0XSggKSkKCiMj
IyBGaXhlZAoKLSBgZHVtcHMoLi4uLCBzb3J0X2tleXM9VHJ1ZSlgIG5vdyBzb3J0cyB0aGUga2V5
cyBvZiBhIHBhcnNlZCBkb2N1bWVudAogIHJlY3Vyc2l2ZWx5LCBtYXRjaGluZyB0aGUgYmVoYXZp
b3Igb24gYSBwbGFpbiBgZGljdGA7IHByZXZpb3VzbHkgb25seSB0aGUgdG9wLQogIGxldmVsIGtl
eXMgd2VyZSBzb3J0ZWQgd2hpbGUgbmVzdGVkIHRhYmxlcywgaW5saW5lIHRhYmxlcywgYXJyYXlz
IG9mIHRhYmxlcwogIGFuZCBpbmxpbmUgdGFibGVzIGluc2lkZSBhbiBhcnJheSBrZXB0IHRoZWly
IG9yaWdpbmFsIG9yZGVyLiAoWyM2MTRdKCApKQotIEFsbG93IGBUYWJsZS5zZXRkZWZhdWx0KClg
IGFuZCBgSW5saW5lVGFibGUuc2V0ZGVmYXVsdCgpYCB0byByZXRyaWV2ZSBleGlzdGluZwogIHZh
bHVlcyB3aXRob3V0IHN1cHBseWluZyBhIGRlZmF1bHQsIG1hdGNoaW5nIGRvY3VtZW50IGFuZCBt
YXBwaW5nIGJlaGF2aW9yLgogIChbIzcxMF0oICkpCi0gRml4IGBpdGVtKClgIGFuZCBgZHVtcHMo
KWAgd3JpdGluZyBhIGBkYXRldGltZWAgd2hvc2UgVVRDIG9mZnNldCBpcyBub3QgYQogIHdob2xl
IG51bWJlciBvZiBtaW51dGVzIChlLmcuIHRoZSBoaXN0b3JpY2FsIExNVCBvZmZzZXRzIGB6b25l
aW5mb2AgZ2l2ZXMsCiAgc3VjaCBhcyBgLTAwOjQ0OjMwYCkgYXMgaW52YWxpZCBUT01MIGxpa2Ug
YDE5MDAtMDEtMDFUMTI6MDA6MDBaOjMwYCwgd2hpY2ggbm8KICBwYXJzZXIgYWNjZXB0cy4gU3Vj
aCBhIHZhbHVlIGlzIG5vdyB3cml0dGVuIGFzIHRoZSBzYW1lIGluc3RhbnQgaW4gVVRDOyB0aGlz
CiAgYWxzbyBjb3ZlcnMgYERhdGVUaW1lLnJlcGxhY2UoKWAgYW5kIGBhc3RpbWV6b25lKClgLiAo
WyM3MDFdKCApKQotIEFsbG93IGBEYXRlVGltZS5hc3RpbWV6b25lKClgIHRvIHVzZSB0aGUgbG9j
YWwgdGltZXpvbmUgd2hlbiBubyB0aW1lem9uZQogIGFyZ3VtZW50IGlzIHN1cHBsaWVkLCBtYXRj
aGluZyBgZGF0ZXRpbWUuZGF0ZXRpbWVgLiAoWyM2NTFdKCApKQotIEFyaXRobWV0aWMgYW5kIGBy
ZXBsYWNlKClgIHJlc3VsdHMgZm9yIGBJbnRlZ2VyYCwgYEZsb2F0YCwgYFN0cmluZ2AsCiAgYERh
dGVUaW1lYCwgYERhdGVgIGFuZCBgVGltZWAgbm8gbG9uZ2VyIHNoYXJlIHRoZSBvcmlnaW5hbCBp
dGVtJ3MgYFRyaXZpYWAsIHNvCiAgY2hhbmdpbmcgdGhlIHJlc3VsdCdzIGNvbW1lbnQgb3IgaW5k
ZW50YXRpb24gbm8gbG9uZ2VyIHJld3JpdGVzIHRoZSBpdGVtIHN0aWxsCiAgc3RvcmVkIGluIHRo
ZSBkb2N1bWVudC4gKFsjNjgzXSggKSkKLSBGaXggYHJvdW5kKClgIG9uIGEgYEZsb2F0YCB3aXRo
b3V0IGBuZGlnaXRzYCByZXR1cm5pbmcgYSBgRmxvYXRgIChlLmcuIGAyLjBgKQogIGluc3RlYWQg
b2YgYW4gYEludGVnZXJgLCBtYXRjaGluZyBgcm91bmQoKWAgb24gYSBwbGFpbiBgZmxvYXRgLiAo
WyM2OTVdKCApKQotIEZpeCBhIHJlZ3Jlc3Npb24gaW4gMC4xNS4xIHdoZXJlIGBzdHJpbmcoLi4u
LCBtdWx0aWxpbmU9VHJ1ZSwgZXNjYXBlPUZhbHNlKWAKICBhZGRlZCBhbiBleHRyYSBuZXdsaW5l
IHRvIGEgdmFsdWUgc3RhcnRpbmcgd2l0aCBhIG5ld2xpbmUsIG1ha2luZyBpdAogIGltcG9zc2li
bGUgdG8gd3JpdGUgc3VjaCBhIHJhdyBzdHJpbmcgdmVyYmF0aW07IHdpdGggYGVzY2FwZT1GYWxz
ZWAgdGhlIHZhbHVlCiAgaXMgbm93IHVzZWQgYXMgZ2l2ZW4gYWdhaW4uIChbIzY1NV0oICkpCi0g
UHJlc2VydmUgc2luZ2xlLWxpbmUgbGl0ZXJhbCBxdW90ZXMgd2hlbiByZXBsYWNpbmcgYSB0YWJs
ZSBmaWVsZCB3aXRoIGEgcGxhaW4KICBzdHJpbmcsIGZhbGxpbmcgYmFjayB0byBiYXNpYyBxdW90
aW5nIHdoZW4gdGhlIHZhbHVlIHJlcXVpcmVzIGVzY2FwaW5nLgogIChbIzMyNV0oICkpCi0gRml4
IGludmFsaWQgb3V0cHV0IGFmdGVyIGRlbGV0aW5nIHRoZSBsYXN0IGtleSB1bmRlciBhIGRvdHRl
ZCBrZXkgaW5zaWRlIGFuCiAgaW5saW5lIHRhYmxlOyB0aGUgZW1wdGllZCB0YWJsZSBub3cgcmVu
ZGVycyBhcyBgYiA9IHt9YC4gKFsjNjY0XSggKSkKLSBGaXggdmFsaWQgVE9NTCBiZWluZyByZWpl
Y3RlZCBhcyBhIGR1cGxpY2F0ZSB3aGVuIGFuIG91dC1vZi1vcmRlciB0YWJsZSBoZWFkZXIKICBl
eHRlbmRzIGEgdGFibGUgYnVpbHQgZnJvbSBzZXZlcmFsIGRvdHRlZCBrZXlzLCBlLmcuIGBbYV1g
IHdpdGggYGIuYyA9IDFgIGFuZAogIGBiLmQgPSAyYCwgdGhlbiBgW2EuYi5lXWAgYWZ0ZXIgYW5v
dGhlciB0YWJsZS4gKFsjNjMyXSggKSkKLSBGaXggYW4gYEF0dHJpYnV0ZUVycm9yYCB3aGVuIGEg
dGFibGUgaXMgZGVmaW5lZCBvdXQgb2Ygb3JkZXIgdW5kZXIgYW4gaW5kZW50ZWQKICBoZWFkZXIg
bmVzdGVkIGZvdXIgb3IgbW9yZSBsZXZlbHMgZGVlcCwgZS5nLiBgIFthLmIuYy5kXWAgdGhlbiBg
W2EuYi5jXWAuCiAgKFsjNjYzXSggKSkKLSBGaXggYW4gb3V0LW9mLW9yZGVyIHRhYmxlIGJlaW5n
IG1vdmVkIHdoZW4gaXQgaXMgc2VwYXJhdGVkIGZyb20gaXRzIHNpYmxpbmcgYnkKICBhbiBhcnJh
eSBvZiB0YWJsZXMgKGUuZy4gYFt0b29sLnBvZXRyeV1gLCBgW1twbHVnaW5zXV1gLCBgW3Rvb2wu
b3RoZXJdYCksIHNvCiAgdGhlIGRvY3VtZW50IG5vIGxvbmdlciByb3VuZC10cmlwcyB1bmNoYW5n
ZWQuIChbIzcwMl0oICkpCi0gRml4IGB1cGRhdGUoKWAgb24gYW4gb3V0LW9mLW9yZGVyIHRhYmxl
IGRyb3BwaW5nIHNpYmxpbmcga2V5cyBzdG9yZWQgaW4gaXRzCiAgb3RoZXIgZnJhZ21lbnRzIHdo
ZW4gb25lIG9mIHRoZSB1cGRhdGVkIGtleXMgYXBwZWFycyBpbiBhIGxhdGVyIGZyYWdtZW50Lgog
IChbIzY3NV0oICkpCi0gRml4IGRlbGV0aW5nLCBwb3BwaW5nIG9yIHJlcGxhY2luZyBhIGtleSB0
aGF0IHdhcyBuZXdseSBhZGRlZCB0byBhbiBvdXQtb2YtCiAgb3JkZXIgdGFibGUuIChbIzY5OV0o
ICkpCi0gRml4IGBUT01MRG9jdW1lbnQudmFsdWVgIGFuZCBjb21wYXJpc29ucyBrZWVwaW5nIG9u
bHkgdGhlIGxhc3QgZnJhZ21lbnQgb2YgYW4KICBhcnJheSBvZiB0YWJsZXMgc3BsaXQgYnkgb3Ro
ZXIgdGFibGVzOyBhbGwgZW50cmllcyBhcmUgbm93IGluY2x1ZGVkLCBtYXRjaGluZwogIGB1bndy
YXAoKWAuIChbIzY5N10oICkpCi0gRml4IGFzc2lnbmluZyBwbGFpbiBkaWN0cyB0byBhIHNsaWNl
IG9mIGFuIGFycmF5IG9mIHRhYmxlcyAoZS5nLiBgZG9jWyJhIl1bOjFdCiAgPSBbeyJ4IjogNH1d
YCkgcHJvZHVjaW5nIGludmFsaWQgb3V0cHV0IGFuZCBsZWF2aW5nIGB1bndyYXAoKWAgYW5kCiAg
YGpzb24uZHVtcHMoKWAgb3V0IG9mIHN5bmM7IGFuIGV4dGVuZGVkIHNsaWNlIG9mIHRoZSB3cm9u
ZyBsZW5ndGggbm93IHJhaXNlcwogIGJlZm9yZSBjaGFuZ2luZyB0aGUgZG9jdW1lbnQuIChbIzYz
MV0oICkpCi0gQXNzaWduaW5nIGEgdmFsdWUgdGhhdCBpcyBub3QgYSB0YWJsZSB0byBhbiBpdGVt
IG9yIHNsaWNlIG9mIGFuIGFycmF5IG9mCiAgdGFibGVzIG5vdyByYWlzZXMgYFZhbHVlRXJyb3Jg
IGJlZm9yZSBjaGFuZ2luZyB0aGUgZG9jdW1lbnQuIChbIzcxMl0oICkpCi0gRml4IGEgYFJlY3Vy
c2lvbkVycm9yYCB3aGVuIHBhcnNpbmcgYSBkb3R0ZWQga2V5IGF0IHRoZSBtYXhpbXVtIG5lc3Rp
bmcgZGVwdGgKICBmb2xsb3dlZCBieSBhbm8KCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4
Y2VlZHMgNTAwMCBjaGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGlu
IGFuIGF0dGFjaG1lbnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi4ve3B5dGhvbjMtdG9tbGtp
dF8wLjE1LjIuYmIgPT4gcHl0aG9uMy10b21sa2l0XzAuMTUuMy5iYn0gICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRvbWxraXRfMC4xNS4yLmJiID0+IHB5dGhv
bjMtdG9tbGtpdF8wLjE1LjMuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXRvbWxraXRfMC4xNS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXRvbWxraXRfMC4xNS4zLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10b21s
a2l0XzAuMTUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXRvbWxraXRfMC4xNS4zLmJiCmluZGV4IGNmNjdjZWE1NTIuLjQwYjUxMTJiZjIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10b21sa2l0XzAuMTUu
Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdG9tbGtpdF8w
LjE1LjMuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJv
amVjdC90b21sa2l0LyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRTttZDU9MzFhYWMwZGJjMWJhYmQyNzhkNTM4NmRhZGI3ZjhlODIiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4M2UzMjc1NWJhMWQyMGQ5MzQwYmQwNjllZTk3ZTlmNjIzMmJhMjM0
NmI2M2ZmY2JhNDI1ZGUwMWY3ZTMyN2E2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIzYzMwMjBl
YzFhNGJkNDY5ZDEyZTMxZmI0ZGE5MzhlN2Y2YmE3NThjZGJlYzNmZDkwNDdkYjYzMTIwZWFmODEi
CiAKIGluaGVyaXQgcHlwaSBweXRob25fcG9ldHJ5X2NvcmUgcHRlc3QtcHl0aG9uLXB5dGVzdAog
Ci0tIAoyLjQ3LjEKCg==

--===============1320286275655918616==--
