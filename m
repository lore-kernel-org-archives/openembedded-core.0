Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90DCC55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 16:16:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43912.1785946572694692047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 09:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kr71rVKc;
 spf=pass (domain: konsulko.com, ip: 209.85.210.169, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84e27035206so917846b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785946572; x=1786551372; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vKpG6vXkmjajyL5oCoInVBvY6xjaBbTupLrFaLZqrw=;
        b=kr71rVKcNNGliKorYK4pCbQm5oSzA4Ub3kXq8szdXmci6LCAsP6IIV8Ey2IG/6j2HQ
         Q05ayaPf/ib9sPyUn59037UldUrf0PkSkrLpqvwZA9Fokx7lcCc1L8hu0J71i7Bt3lJS
         1jOmHbpTPjdTCBdUle4nITMOfmdijQmwy81H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946572; x=1786551372;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0vKpG6vXkmjajyL5oCoInVBvY6xjaBbTupLrFaLZqrw=;
        b=bHZalIWaSYYXdwCWE1ED80Cg6MCF8idCSOtWq04fejFFPiKSEK80sH0ls+Ku8WP7gj
         t4ri+MeL9vNpQs9qvGGb+tKzhEpXGOxZgiUc9nKN1QHSI0Duu5Wiv8HZ6qTkJ2vemNIL
         81JUIsLlknFRJV5PEtmDhVTV+imFGxrcO9drGsTFW1rzygtt7aAK8DEKni5wXmqb58Af
         IycPCj0ilsIKhNR5xEVGW4eVRRh0xxbU7xWb/OTA7l9yCYoldxfKltzs8jSMm8ExsfyO
         zq8ELO/TLywwdAfcS5J/A6g1LpcU6K6Na/ReeBudYgyYYMwg/UlPBgBhFxUujpT+Qd2l
         70qA==
X-Gm-Message-State: AOJu0YyjHJiVkk2H1EGEKoDWCo7I0PgLE06AEI3sAmLYT6SJ2ZsnoPx/
	81jUbxgc4n9GQd+r8cMK5J09iirUCn36W5ruw5tmylqdvpFa2RAwDtV7fcuC8P4XeWOoq/wr4YP
	fM7Qw
X-Gm-Gg: AR+sD11Cu1z265BnNFwPJLrI6SSCUbvZkypSpK36ts8ANOx5RhW82JTbGFgjihYl6ww
	y+KzUjr+KxPBl61cyfP0+iN3aVkcnyOYW/yhyyBNmz6NKYtYEIQsg9j2ovQ6xckKCfurqquDdMK
	XW37CN/h/oFZOThsxnrpsiAJ1ino/jcqm6CNwb2T/gDgtiBQwU4UK3Q1taO7c96T12JCf8FHgOE
	NM1NPe6d7uEIs/dKNJSWPN0z+BlsD0uuRyGL+FJpYpabQ+MR4x4+imyg/PE+9Bs2TKJDg+uQske
	6iZbZimOdPGlQC+++nmbBFTPO3/maSd32Ew7rmNb0jVGi5t1xwroZQqPMIzzVz2U5Dop6ellGW3
	uKRbhXrkDot7jOXc7RDf8Rih4fkbUWLKRvDIDAWTMN/kZI2r/rSQj3eYTuDdRxcuaBq2xj/qTma
	yvehRahIkK7lfip5hwAxXcCQo821Gc8U9iyrH/tjiRCXsJp8WDbT+bMmF10rvINcYa5dT6/2CIN
	lNQUQ==
X-Received: by 2002:a05:6a00:1388:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-84f2e017478mr8972662b3a.22.1785946571982;
        Wed, 05 Aug 2026 09:16:11 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:86b7:5676:fe01:99c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e2c5df7sm1105532b3a.8.2026.08.05.09.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:16:11 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-packaging: upgrade 26.2 -> 26.3
Date: Wed,  5 Aug 2026 09:15:21 -0700
Message-ID: <20260805161520.1960651-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 16:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242876

From: Tim Orling <tim.orling@konsulko.com>

For full comparison of changes (134 commits, 73 files changed), see:
https://github.com/pypa/packaging/compare/26.2...26.3

Upstream release notes:
https://packaging.pypa.io/en/stable/changelog.html
26.3 - 2026-08-03

Features:

* Add a public VersionRange API and SpecifierSet.to_range(), representing
  the versions a specifier set accepts as an interval set that supports
  intersection, union, difference, complement, set relations, membership
  tests, and filtering. to_specifier_set() converts a range back to a
  SpecifierSet where a PEP 440 form exists. (PR #1267, PR #1270, PR #1298)
* PEP 808: accept Metadata-Version: 2.6. (PR #1194)
* Add a limit argument to parse_tag() for compressed tag sets. (#1220)
* Add a prefer_sdist_predicate argument to Pylock.select() to prefer
  source distributions over wheels for selected packages. (PR #1334)
* Add pure_python_tags() to generate the pure-Python tags for a Python
  version without touching the running platform. (PR #1346)
* Add SpecifierSet.is_subset(), is_superset(), and is_disjoint(), which
  compare the versions two specifier sets accept. (PR #1313)

Behavior adaptations:

* Drop support for Python 3.8; packaging now requires Python 3.9 or
  later. (PR #1157)
* Prefer native linux_* platform tags over manylinux and musllinux tags
  on Linux. (#160)

Fixes for versions and specifiers:

* Raise InvalidVersion instead of TypeError when Version is given a
  non-string. (PR #1319)
* Raise InvalidVersion for non-string pre-release letters passed to
  Version.from_parts. (PR #1241)
* Fix an AttributeError when hashing internally trimmed versions.
  (PR #1242)
* Fix SpecifierSet.is_unsatisfiable for post-release boundary
  intersections. (PR #1257)

Fixes for requirements and markers:

* Make Requirement.__hash__ consistent with __eq__ for
  trailing-zero-equivalent specifiers (e.g. foo==1.0.0 and foo==1.0.0.0),
  so equal requirements hash equal and deduplicate in sets and dicts.
  (PR #1232)
* Normalize requested extra names before comparing or hashing
  requirements. (#644)
* Preserve a Requirement’s specifier prereleases override across a pickle
  round trip. (#1204)
* Raise InvalidRequirement instead of InvalidSpecifier when a requirement
  contains an invalid specifier. (PR #1332)
* Clarify the error for post-release prefix wildcards like ==1.0.post1.*.
  (PR #1299)
* Preserve quoting semantics when serializing marker values, so
  round-tripped markers parse back to the same marker. (PR #1213)
* Keep the parentheses of a nested group when serializing markers.
  (PR #1316)
* Normalize extra and dependency_groups values in nested markers at parse
  time. (PR #1246, PR #1310)
* Raise UndefinedComparison when a set-valued variable like extras is used
  outside the membership form. (PR #1265)
* Raise UndefinedEnvironmentName (a KeyError subclass) for missing
  environment keys during marker evaluation. (PR #1276)
* Wrap malformed string literal errors in InvalidMarker /
  InvalidRequirement instead of leaking a low-level error. (PR #1249)
* Reject requirements and markers with a trailing line break. (PR #1345)

Fixes for metadata and licenses:

* Collect all from_email validation errors into one ExceptionGroup instead
  of raising the first. (PR #1268)
* Accept the UTF-8 charset case-insensitively in email payloads. (PR #1330)
* Reject malformed Description-Content-Type values. (PR #1329)
* Don’t rewrite user values that contain {field} placeholders in error
  messages. (PR #1327)
* Route multipart email payloads to unparsed instead of asserting.
  (PR #1247)
* Make InvalidMetadata and CyclicDependencyGroup picklable. (PR #1328)
* Fold every line boundary str.splitlines recognizes when writing a header
  with RFC822Message. (PR #1356)
* Raise InvalidLicenseExpression for misplaced WITH clauses and empty
  LicenseRef- names. (PR #1266)
* Raise InvalidLicenseExpression instead of KeyError for a LicenseRef-
  with a + suffix. (PR #1219)

Fixes for tags and filenames:

* Raise InvalidTag from parse_tag() for tags with the wrong number of
  components. (PR #1238)
* Reject empty tag components in parse_wheel_filename() and parse_tag().
  (PR #1234)
* Reject an empty project name in the wheel and sdist filename parsers.
  (PR #1305)
* Reject wheel filenames with a trailing newline. (PR #1341)
* Reject wheel tags whose interpreter component is not an identifier.
  (#577)
* is_normalized_name now rejects names with collapsed double hyphens
  like a--b. (PR #1230)
* Fix duplicate explicit abi3t tags. (PR #1245)
* Forward the warn argument to generic_tags() in sys_tags(). (PR #1264)
* Raise SystemError for an empty or malformed CPython EXT_SUFFIX.
  (PR #1271, PR #1301)
* Fix a typo in the macOS fat3 architecture name (was fat32). (PR #1199)
* Fixes for pylock, direct URLs, and dependency groups:
* Percent-decode pylock artifact file names derived from a url so that
  local versions (e.g. a wheel with 2.12.1+cu130 encoded as
  2.12.1%2Bcu130) yield a valid file name. (PR #1314)
* Use an explicitly empty tags sequence in Pylock.select() instead of
  falling back to sys_tags(). (PR #1349)
* Fix Pylock.select() on Python builds that report a non-PEP 440
  python_full_version (e.g. 3.15.0+). (PR #1179)
* Reject TOML booleans where integers are expected in pylock files.
  (PR #1244)
* Add PylockSelectError to packaging.pylock.__all__.
  (PR #1202)
* Fix DirectUrl credential stripping for passwords containing @.
  (PR #1218)
* Parse the URL scheme case-insensitively when checking for file URLs in
  direct_url. (PR #1240)
* Require absolute file URLs for local directories in direct_url.
  (PR #1297)
* Collect InvalidRequirement errors while resolving dependency groups
  instead of leaking them. (PR #1302)
* Don’t cache malformed dependency group parses. (PR #1248)

[Truncated, see "Upstream release notes" link above for the full changelog]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemux86-64 for core-image-ptest-python3-packaging

Testsuite summary
TOTAL: 62785
PASS: 62785
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 425

 .../{python3-packaging_26.2.bb => python3-packaging_26.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_26.2.bb => python3-packaging_26.3.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-packaging_26.2.bb b/meta/recipes-devtools/python/python3-packaging_26.3.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-packaging_26.2.bb
rename to meta/recipes-devtools/python/python3-packaging_26.3.bb
index 81ae6f2732..a0d80d21f0 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.2.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 OR BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661"
+SRC_URI[sha256sum] = "94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.47.3


