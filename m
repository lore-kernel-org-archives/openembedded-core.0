Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF889CF9C73
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:23 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.36181.1727097253816892876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uU+++s+6;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.45, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-27d045a73easo2325873fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097253; x=1727702053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulhwF09YPhjiNXIyLprhpwk/bBSqC0jfC2+LrfhS0+0=;
        b=uU+++s+6dRyfQVdUqbejGLhgo++tvl3/88BoynvHYq63dbmyDXNd875gmhW+u+xELO
         eKeBf9xpBJBaf5HFM1Hgh+5BbitTStj1Z08H9jrdpqua7ddDtJ08e6OVWD2oJa8NRF8R
         2hH/Skuj8cdp7fGMxHboQ/+lt+mIvDj+gNCNopSBDc/PdljIkyLZXLWYbjIEmhcK7ywQ
         2SxdFB58YrMIAzy12iV/imkQy3dM8Tn/a4Iqyx/N2M3WyowEuyElVvlN7Fly1kj6CVzA
         Z6hpWzpQlGWhSGeoVpegROMWJdiibPjymE13+v0lqzgWEmcqHdoh3lU49WwXkMaef2hl
         G25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097253; x=1727702053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulhwF09YPhjiNXIyLprhpwk/bBSqC0jfC2+LrfhS0+0=;
        b=P5BUtl6FiUXwGs7PW/swScU6v0fOFpY7e1fZn8CnVBI/Yk/mG5/h+oCiycRxl9uPtn
         6g/CBgUVn21JwZB8e40mlRn+lDcRqKBiF20d+71zOclmmhB/A5+t2QfnbMQYy+aMDkhQ
         X3+QaswRFsdMLUTFqmq9c5pUapSEtbiQ8A1Id1+A2P+iUZbCBrlkoekBxA+vaK3RAEBj
         OxqRX7YSe+krl7nVXVEskUMlNxqG38z2OFXrrADtejeeeiqtWETk00BUczHC5KkkpM61
         FQjOu9x1Uq7eTJsabHcNA++7cfCC0y5kCJe0Qey+iPtYECgc7i0kF9uruIXDRdwqOA+L
         vChg==
X-Gm-Message-State: AOJu0Yxsg10l3tmqL2s0dtGQnriVY303IsAtwWZTkRN5Vn77iFIa43pu
	qM+p0HJeBhSpXzJs1PkNjb/yf0WBOs8FeJoAacnoOoXd6AGbvuLdNFYup8mf78WDbo4UFVkOUGX
	EYYQ=
X-Google-Smtp-Source: AGHT+IFVd7k/zgX9WFi0m+3lE8hSKJevx6kDMDU9bZ5/CP0c0QMD4+9iSLp1miMo1sa4BH4bFbp34w==
X-Received: by 2002:a05:6870:f112:b0:254:7f9f:3f21 with SMTP id 586e51a60fabf-2803cf8a094mr6656320fac.27.1727097251939;
        Mon, 23 Sep 2024 06:14:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/15] python3: Upgrade 3.10.14 -> 3.10.15
Date: Mon, 23 Sep 2024 06:13:47 -0700
Message-Id: <e64ead97ae3d680f97bf85422f777cd77ae7c434.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204812

From: Divya Chellam <divya.chellam@windriver.com>

Includes security fixes for CVE-2024-4030, CVE-2024-7592, CVE-2024-4032, CVE-2024-8088
CVE-2024-6232, CVE-2024-6923, CVE-2023-27043 and other bug fixes.

Removed below patches, as the fixes included in 3.10.15 upgrade:
1. CVE-2023-27043.patch
2. CVE-2024-6232.patch
3. CVE-2024-7592.patch
4. CVE-2024-8088.patch

Release Notes:
https://www.python.org/downloads/release/python-31015/

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2023-27043.patch       | 510 ------------------
 .../python/python3/CVE-2024-6232.patch        | 251 ---------
 .../python/python3/CVE-2024-7592.patch        | 140 -----
 .../python/python3/CVE-2024-8088.patch        | 124 -----
 ...{python3_3.10.14.bb => python3_3.10.15.bb} |   6 +-
 5 files changed, 1 insertion(+), 1030 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2023-27043.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-6232.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-8088.patch
 rename meta/recipes-devtools/python/{python3_3.10.14.bb => python3_3.10.15.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2023-27043.patch b/meta/recipes-devtools/python/python3/CVE-2023-27043.patch
deleted file mode 100644
index d27afc41a9..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2023-27043.patch
+++ /dev/null
@@ -1,510 +0,0 @@
-From 2a9273a0e4466e2f057f9ce6fe98cd8ce570331b Mon Sep 17 00:00:00 2001
-From: Petr Viktorin <encukou@gmail.com>
-Date: Fri, 6 Sep 2024 13:14:22 +0200
-Subject: [PATCH] [3.10] [CVE-2023-27043] gh-102988: Reject malformed addresses
- in email.parseaddr() (GH-111116) (#123768)
-
-Detect email address parsing errors and return empty tuple to
-indicate the parsing error (old API). Add an optional 'strict'
-parameter to getaddresses() and parseaddr() functions. Patch by
-Thomas Dwyer.
-
-(cherry picked from commit 4a153a1d3b18803a684cd1bcc2cdf3ede3dbae19)
-
-Co-authored-by: Victor Stinner <vstinner@python.org>
-Co-Authored-By: Thomas Dwyer <github@tomd.tel>
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/2a9273a0e4466e2f057f9ce6fe98cd8ce570331b]
-CVE: CVE-2023-27043
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- Doc/library/email.utils.rst                   |  19 +-
- Lib/email/utils.py                            | 151 ++++++++++++-
- Lib/test/test_email/test_email.py             | 204 +++++++++++++++++-
- ...-10-20-15-28-08.gh-issue-102988.dStNO7.rst |   8 +
- 4 files changed, 361 insertions(+), 21 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issue-102988.dStNO7.rst
-
-diff --git a/Doc/library/email.utils.rst b/Doc/library/email.utils.rst
-index 0e266b6..65948fb 100644
---- a/Doc/library/email.utils.rst
-+++ b/Doc/library/email.utils.rst
-@@ -60,13 +60,18 @@ of the new API.
-    begins with angle brackets, they are stripped off.
- 
- 
--.. function:: parseaddr(address)
-+.. function:: parseaddr(address, *, strict=True)
- 
-    Parse address -- which should be the value of some address-containing field such
-    as :mailheader:`To` or :mailheader:`Cc` -- into its constituent *realname* and
-    *email address* parts.  Returns a tuple of that information, unless the parse
-    fails, in which case a 2-tuple of ``('', '')`` is returned.
- 
-+   If *strict* is true, use a strict parser which rejects malformed inputs.
-+
-+   .. versionchanged:: 3.10.15
-+      Add *strict* optional parameter and reject malformed inputs by default.
-+
- 
- .. function:: formataddr(pair, charset='utf-8')
- 
-@@ -84,12 +89,15 @@ of the new API.
-       Added the *charset* option.
- 
- 
--.. function:: getaddresses(fieldvalues)
-+.. function:: getaddresses(fieldvalues, *, strict=True)
- 
-    This method returns a list of 2-tuples of the form returned by ``parseaddr()``.
-    *fieldvalues* is a sequence of header field values as might be returned by
--   :meth:`Message.get_all <email.message.Message.get_all>`.  Here's a simple
--   example that gets all the recipients of a message::
-+   :meth:`Message.get_all <email.message.Message.get_all>`.
-+
-+   If *strict* is true, use a strict parser which rejects malformed inputs.
-+
-+   Here's a simple example that gets all the recipients of a message::
- 
-       from email.utils import getaddresses
- 
-@@ -99,6 +107,9 @@ of the new API.
-       resent_ccs = msg.get_all('resent-cc', [])
-       all_recipients = getaddresses(tos + ccs + resent_tos + resent_ccs)
- 
-+   .. versionchanged:: 3.10.15
-+      Add *strict* optional parameter and reject malformed inputs by default.
-+
- 
- .. function:: parsedate(date)
- 
-diff --git a/Lib/email/utils.py b/Lib/email/utils.py
-index cfdfeb3..9522341 100644
---- a/Lib/email/utils.py
-+++ b/Lib/email/utils.py
-@@ -48,6 +48,7 @@ TICK = "'"
- specialsre = re.compile(r'[][\\()<>@,:;".]')
- escapesre = re.compile(r'[\\"]')
- 
-+
- def _has_surrogates(s):
-     """Return True if s contains surrogate-escaped binary data."""
-     # This check is based on the fact that unless there are surrogates, utf8
-@@ -106,12 +107,127 @@ def formataddr(pair, charset='utf-8'):
-     return address
- 
- 
-+def _iter_escaped_chars(addr):
-+    pos = 0
-+    escape = False
-+    for pos, ch in enumerate(addr):
-+        if escape:
-+            yield (pos, '\\' + ch)
-+            escape = False
-+        elif ch == '\\':
-+            escape = True
-+        else:
-+            yield (pos, ch)
-+    if escape:
-+        yield (pos, '\\')
-+
-+
-+def _strip_quoted_realnames(addr):
-+    """Strip real names between quotes."""
-+    if '"' not in addr:
-+        # Fast path
-+        return addr
-+
-+    start = 0
-+    open_pos = None
-+    result = []
-+    for pos, ch in _iter_escaped_chars(addr):
-+        if ch == '"':
-+            if open_pos is None:
-+                open_pos = pos
-+            else:
-+                if start != open_pos:
-+                    result.append(addr[start:open_pos])
-+                start = pos + 1
-+                open_pos = None
-+
-+    if start < len(addr):
-+        result.append(addr[start:])
-+
-+    return ''.join(result)
- 
--def getaddresses(fieldvalues):
--    """Return a list of (REALNAME, EMAIL) for each fieldvalue."""
--    all = COMMASPACE.join(str(v) for v in fieldvalues)
--    a = _AddressList(all)
--    return a.addresslist
-+
-+supports_strict_parsing = True
-+
-+def getaddresses(fieldvalues, *, strict=True):
-+    """Return a list of (REALNAME, EMAIL) or ('','') for each fieldvalue.
-+
-+    When parsing fails for a fieldvalue, a 2-tuple of ('', '') is returned in
-+    its place.
-+
-+    If strict is true, use a strict parser which rejects malformed inputs.
-+    """
-+
-+    # If strict is true, if the resulting list of parsed addresses is greater
-+    # than the number of fieldvalues in the input list, a parsing error has
-+    # occurred and consequently a list containing a single empty 2-tuple [('',
-+    # '')] is returned in its place. This is done to avoid invalid output.
-+    #
-+    # Malformed input: getaddresses(['alice@example.com <bob@example.com>'])
-+    # Invalid output: [('', 'alice@example.com'), ('', 'bob@example.com')]
-+    # Safe output: [('', '')]
-+
-+    if not strict:
-+        all = COMMASPACE.join(str(v) for v in fieldvalues)
-+        a = _AddressList(all)
-+        return a.addresslist
-+
-+    fieldvalues = [str(v) for v in fieldvalues]
-+    fieldvalues = _pre_parse_validation(fieldvalues)
-+    addr = COMMASPACE.join(fieldvalues)
-+    a = _AddressList(addr)
-+    result = _post_parse_validation(a.addresslist)
-+
-+    # Treat output as invalid if the number of addresses is not equal to the
-+    # expected number of addresses.
-+    n = 0
-+    for v in fieldvalues:
-+        # When a comma is used in the Real Name part it is not a deliminator.
-+        # So strip those out before counting the commas.
-+        v = _strip_quoted_realnames(v)
-+        # Expected number of addresses: 1 + number of commas
-+        n += 1 + v.count(',')
-+    if len(result) != n:
-+        return [('', '')]
-+
-+    return result
-+
-+
-+def _check_parenthesis(addr):
-+    # Ignore parenthesis in quoted real names.
-+    addr = _strip_quoted_realnames(addr)
-+
-+    opens = 0
-+    for pos, ch in _iter_escaped_chars(addr):
-+        if ch == '(':
-+            opens += 1
-+        elif ch == ')':
-+            opens -= 1
-+            if opens < 0:
-+                return False
-+    return (opens == 0)
-+
-+
-+def _pre_parse_validation(email_header_fields):
-+    accepted_values = []
-+    for v in email_header_fields:
-+        if not _check_parenthesis(v):
-+            v = "('', '')"
-+        accepted_values.append(v)
-+
-+    return accepted_values
-+
-+
-+def _post_parse_validation(parsed_email_header_tuples):
-+    accepted_values = []
-+    # The parser would have parsed a correctly formatted domain-literal
-+    # The existence of an [ after parsing indicates a parsing failure
-+    for v in parsed_email_header_tuples:
-+        if '[' in v[1]:
-+            v = ('', '')
-+        accepted_values.append(v)
-+
-+    return accepted_values
- 
- 
- def _format_timetuple_and_zone(timetuple, zone):
-@@ -205,16 +321,33 @@ def parsedate_to_datetime(data):
-             tzinfo=datetime.timezone(datetime.timedelta(seconds=tz)))
- 
- 
--def parseaddr(addr):
-+def parseaddr(addr, *, strict=True):
-     """
-     Parse addr into its constituent realname and email address parts.
- 
-     Return a tuple of realname and email address, unless the parse fails, in
-     which case return a 2-tuple of ('', '').
-+
-+    If strict is True, use a strict parser which rejects malformed inputs.
-     """
--    addrs = _AddressList(addr).addresslist
--    if not addrs:
--        return '', ''
-+    if not strict:
-+        addrs = _AddressList(addr).addresslist
-+        if not addrs:
-+            return ('', '')
-+        return addrs[0]
-+
-+    if isinstance(addr, list):
-+        addr = addr[0]
-+
-+    if not isinstance(addr, str):
-+        return ('', '')
-+
-+    addr = _pre_parse_validation([addr])[0]
-+    addrs = _post_parse_validation(_AddressList(addr).addresslist)
-+
-+    if not addrs or len(addrs) > 1:
-+        return ('', '')
-+
-     return addrs[0]
- 
- 
-diff --git a/Lib/test/test_email/test_email.py b/Lib/test/test_email/test_email.py
-index 8b16cca..5b19bb3 100644
---- a/Lib/test/test_email/test_email.py
-+++ b/Lib/test/test_email/test_email.py
-@@ -16,6 +16,7 @@ from unittest.mock import patch
- 
- import email
- import email.policy
-+import email.utils
- 
- from email.charset import Charset
- from email.generator import Generator, DecodedGenerator, BytesGenerator
-@@ -3288,15 +3289,154 @@ Foo
-            [('Al Person', 'aperson@dom.ain'),
-             ('Bud Person', 'bperson@dom.ain')])
- 
-+    def test_getaddresses_comma_in_name(self):
-+        """GH-106669 regression test."""
-+        self.assertEqual(
-+            utils.getaddresses(
-+                [
-+                    '"Bud, Person" <bperson@dom.ain>',
-+                    'aperson@dom.ain (Al Person)',
-+                    '"Mariusz Felisiak" <to@example.com>',
-+                ]
-+            ),
-+            [
-+                ('Bud, Person', 'bperson@dom.ain'),
-+                ('Al Person', 'aperson@dom.ain'),
-+                ('Mariusz Felisiak', 'to@example.com'),
-+            ],
-+        )
-+
-+    def test_parsing_errors(self):
-+        """Test for parsing errors from CVE-2023-27043 and CVE-2019-16056"""
-+        alice = 'alice@example.org'
-+        bob = 'bob@example.com'
-+        empty = ('', '')
-+
-+        # Test utils.getaddresses() and utils.parseaddr() on malformed email
-+        # addresses: default behavior (strict=True) rejects malformed address,
-+        # and strict=False which tolerates malformed address.
-+        for invalid_separator, expected_non_strict in (
-+            ('(', [(f'<{bob}>', alice)]),
-+            (')', [('', alice), empty, ('', bob)]),
-+            ('<', [('', alice), empty, ('', bob), empty]),
-+            ('>', [('', alice), empty, ('', bob)]),
-+            ('[', [('', f'{alice}[<{bob}>]')]),
-+            (']', [('', alice), empty, ('', bob)]),
-+            ('@', [empty, empty, ('', bob)]),
-+            (';', [('', alice), empty, ('', bob)]),
-+            (':', [('', alice), ('', bob)]),
-+            ('.', [('', alice + '.'), ('', bob)]),
-+            ('"', [('', alice), ('', f'<{bob}>')]),
-+        ):
-+            address = f'{alice}{invalid_separator}<{bob}>'
-+            with self.subTest(address=address):
-+                self.assertEqual(utils.getaddresses([address]),
-+                                 [empty])
-+                self.assertEqual(utils.getaddresses([address], strict=False),
-+                                 expected_non_strict)
-+
-+                self.assertEqual(utils.parseaddr([address]),
-+                                 empty)
-+                self.assertEqual(utils.parseaddr([address], strict=False),
-+                                 ('', address))
-+
-+        # Comma (',') is treated differently depending on strict parameter.
-+        # Comma without quotes.
-+        address = f'{alice},<{bob}>'
-+        self.assertEqual(utils.getaddresses([address]),
-+                         [('', alice), ('', bob)])
-+        self.assertEqual(utils.getaddresses([address], strict=False),
-+                         [('', alice), ('', bob)])
-+        self.assertEqual(utils.parseaddr([address]),
-+                         empty)
-+        self.assertEqual(utils.parseaddr([address], strict=False),
-+                         ('', address))
-+
-+        # Real name between quotes containing comma.
-+        address = '"Alice, alice@example.org" <bob@example.com>'
-+        expected_strict = ('Alice, alice@example.org', 'bob@example.com')
-+        self.assertEqual(utils.getaddresses([address]), [expected_strict])
-+        self.assertEqual(utils.getaddresses([address], strict=False), [expected_strict])
-+        self.assertEqual(utils.parseaddr([address]), expected_strict)
-+        self.assertEqual(utils.parseaddr([address], strict=False),
-+                         ('', address))
-+
-+        # Valid parenthesis in comments.
-+        address = 'alice@example.org (Alice)'
-+        expected_strict = ('Alice', 'alice@example.org')
-+        self.assertEqual(utils.getaddresses([address]), [expected_strict])
-+        self.assertEqual(utils.getaddresses([address], strict=False), [expected_strict])
-+        self.assertEqual(utils.parseaddr([address]), expected_strict)
-+        self.assertEqual(utils.parseaddr([address], strict=False),
-+                         ('', address))
-+
-+        # Invalid parenthesis in comments.
-+        address = 'alice@example.org )Alice('
-+        self.assertEqual(utils.getaddresses([address]), [empty])
-+        self.assertEqual(utils.getaddresses([address], strict=False),
-+                         [('', 'alice@example.org'), ('', ''), ('', 'Alice')])
-+        self.assertEqual(utils.parseaddr([address]), empty)
-+        self.assertEqual(utils.parseaddr([address], strict=False),
-+                         ('', address))
-+
-+        # Two addresses with quotes separated by comma.
-+        address = '"Jane Doe" <jane@example.net>, "John Doe" <john@example.net>'
-+        self.assertEqual(utils.getaddresses([address]),
-+                         [('Jane Doe', 'jane@example.net'),
-+                          ('John Doe', 'john@example.net')])
-+        self.assertEqual(utils.getaddresses([address], strict=False),
-+                         [('Jane Doe', 'jane@example.net'),
-+                          ('John Doe', 'john@example.net')])
-+        self.assertEqual(utils.parseaddr([address]), empty)
-+        self.assertEqual(utils.parseaddr([address], strict=False),
-+                         ('', address))
-+
-+        # Test email.utils.supports_strict_parsing attribute
-+        self.assertEqual(email.utils.supports_strict_parsing, True)
-+
-     def test_getaddresses_nasty(self):
--        eq = self.assertEqual
--        eq(utils.getaddresses(['foo: ;']), [('', '')])
--        eq(utils.getaddresses(
--           ['[]*-- =~$']),
--           [('', ''), ('', ''), ('', '*--')])
--        eq(utils.getaddresses(
--           ['foo: ;', '"Jason R. Mastaler" <jason@dom.ain>']),
--           [('', ''), ('Jason R. Mastaler', 'jason@dom.ain')])
-+        for addresses, expected in (
-+            (['"Sürname, Firstname" <to@example.com>'],
-+             [('Sürname, Firstname', 'to@example.com')]),
-+
-+            (['foo: ;'],
-+             [('', '')]),
-+
-+            (['foo: ;', '"Jason R. Mastaler" <jason@dom.ain>'],
-+             [('', ''), ('Jason R. Mastaler', 'jason@dom.ain')]),
-+
-+            ([r'Pete(A nice \) chap) <pete(his account)@silly.test(his host)>'],
-+             [('Pete (A nice ) chap his account his host)', 'pete@silly.test')]),
-+
-+            (['(Empty list)(start)Undisclosed recipients  :(nobody(I know))'],
-+             [('', '')]),
-+
-+            (['Mary <@machine.tld:mary@example.net>, , jdoe@test   . example'],
-+             [('Mary', 'mary@example.net'), ('', ''), ('', 'jdoe@test.example')]),
-+
-+            (['John Doe <jdoe@machine(comment).  example>'],
-+             [('John Doe (comment)', 'jdoe@machine.example')]),
-+
-+            (['"Mary Smith: Personal Account" <smith@home.example>'],
-+             [('Mary Smith: Personal Account', 'smith@home.example')]),
-+
-+            (['Undisclosed recipients:;'],
-+             [('', '')]),
-+
-+            ([r'<boss@nil.test>, "Giant; \"Big\" Box" <bob@example.net>'],
-+             [('', 'boss@nil.test'), ('Giant; "Big" Box', 'bob@example.net')]),
-+        ):
-+            with self.subTest(addresses=addresses):
-+                self.assertEqual(utils.getaddresses(addresses),
-+                                 expected)
-+                self.assertEqual(utils.getaddresses(addresses, strict=False),
-+                                 expected)
-+
-+        addresses = ['[]*-- =~$']
-+        self.assertEqual(utils.getaddresses(addresses),
-+                         [('', '')])
-+        self.assertEqual(utils.getaddresses(addresses, strict=False),
-+                         [('', ''), ('', ''), ('', '*--')])
- 
-     def test_getaddresses_embedded_comment(self):
-         """Test proper handling of a nested comment"""
-@@ -3485,6 +3625,54 @@ multipart/report
-                 m = cls(*constructor, policy=email.policy.default)
-                 self.assertIs(m.policy, email.policy.default)
- 
-+    def test_iter_escaped_chars(self):
-+        self.assertEqual(list(utils._iter_escaped_chars(r'a\\b\"c\\"d')),
-+                         [(0, 'a'),
-+                          (2, '\\\\'),
-+                          (3, 'b'),
-+                          (5, '\\"'),
-+                          (6, 'c'),
-+                          (8, '\\\\'),
-+                          (9, '"'),
-+                          (10, 'd')])
-+        self.assertEqual(list(utils._iter_escaped_chars('a\\')),
-+                         [(0, 'a'), (1, '\\')])
-+
-+    def test_strip_quoted_realnames(self):
-+        def check(addr, expected):
-+            self.assertEqual(utils._strip_quoted_realnames(addr), expected)
-+
-+        check('"Jane Doe" <jane@example.net>, "John Doe" <john@example.net>',
-+              ' <jane@example.net>,  <john@example.net>')
-+        check(r'"Jane \"Doe\"." <jane@example.net>',
-+              ' <jane@example.net>')
-+
-+        # special cases
-+        check(r'before"name"after', 'beforeafter')
-+        check(r'before"name"', 'before')
-+        check(r'b"name"', 'b')  # single char
-+        check(r'"name"after', 'after')
-+        check(r'"name"a', 'a')  # single char
-+        check(r'"name"', '')
-+
-+        # no change
-+        for addr in (
-+            'Jane Doe <jane@example.net>, John Doe <john@example.net>',
-+            'lone " quote',
-+        ):
-+            self.assertEqual(utils._strip_quoted_realnames(addr), addr)
-+
-+
-+    def test_check_parenthesis(self):
-+        addr = 'alice@example.net'
-+        self.assertTrue(utils._check_parenthesis(f'{addr} (Alice)'))
-+        self.assertFalse(utils._check_parenthesis(f'{addr} )Alice('))
-+        self.assertFalse(utils._check_parenthesis(f'{addr} (Alice))'))
-+        self.assertFalse(utils._check_parenthesis(f'{addr} ((Alice)'))
-+
-+        # Ignore real name between quotes
-+        self.assertTrue(utils._check_parenthesis(f'")Alice((" {addr}'))
-+
- 
- # Test the iterator/generators
- class TestIterators(TestEmailBase):
-diff --git a/Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issue-102988.dStNO7.rst b/Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issue-102988.dStNO7.rst
-new file mode 100644
-index 0000000..3d0e9e4
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issue-102988.dStNO7.rst
-@@ -0,0 +1,8 @@
-+:func:`email.utils.getaddresses` and :func:`email.utils.parseaddr` now
-+return ``('', '')`` 2-tuples in more situations where invalid email
-+addresses are encountered instead of potentially inaccurate values. Add
-+optional *strict* parameter to these two functions: use ``strict=False`` to
-+get the old behavior, accept malformed inputs.
-+``getattr(email.utils, 'supports_strict_parsing', False)`` can be use to check
-+if the *strict* paramater is available. Patch by Thomas Dwyer and Victor
-+Stinner to improve the CVE-2023-27043 fix.
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2024-6232.patch b/meta/recipes-devtools/python/python3/CVE-2024-6232.patch
deleted file mode 100644
index 874cbfe40c..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2024-6232.patch
+++ /dev/null
@@ -1,251 +0,0 @@
-From 3a22dc1079be5a75750d24dc6992956e7b84b5a0 Mon Sep 17 00:00:00 2001
-From: Seth Michael Larson <seth@python.org>
-Date: Tue, 3 Sep 2024 10:07:53 -0500
-Subject: [PATCH 2/2] [3.10] gh-121285: Remove backtracking when parsing
- tarfile headers (GH-121286) (#123640)
-
-* Remove backtracking when parsing tarfile headers
-* Rewrite PAX header parsing to be stricter
-* Optimize parsing of GNU extended sparse headers v0.0
-
-(cherry picked from commit 34ddb64d088dd7ccc321f6103d23153256caa5d4)
-
-Upstream-Status: Backport from https://github.com/python/cpython/commit/743acbe872485dc18df4d8ab2dc7895187f062c4
-CVE: CVE-2024-6232
-
-Co-authored-by: Kirill Podoprigora <kirill.bast9@mail.ru>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
----
- Lib/tarfile.py                                | 105 +++++++++++-------
- Lib/test/test_tarfile.py                      |  42 +++++++
- ...-07-02-13-39-20.gh-issue-121285.hrl-yI.rst |   2 +
- 3 files changed, 111 insertions(+), 38 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 495349f08f9..3ab6811d633 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -841,6 +841,9 @@ def data_filter(member, dest_path):
- # Sentinel for replace() defaults, meaning "don't change the attribute"
- _KEEP = object()
- 
-+# Header length is digits followed by a space.
-+_header_length_prefix_re = re.compile(br"([0-9]{1,20}) ")
-+
- class TarInfo(object):
-     """Informational class which holds the details about an
-        archive member given by a tar header block.
-@@ -1410,41 +1413,59 @@ def _proc_pax(self, tarfile):
-         else:
-             pax_headers = tarfile.pax_headers.copy()
- 
--        # Check if the pax header contains a hdrcharset field. This tells us
--        # the encoding of the path, linkpath, uname and gname fields. Normally,
--        # these fields are UTF-8 encoded but since POSIX.1-2008 tar
--        # implementations are allowed to store them as raw binary strings if
--        # the translation to UTF-8 fails.
--        match = re.search(br"\d+ hdrcharset=([^\n]+)\n", buf)
--        if match is not None:
--            pax_headers["hdrcharset"] = match.group(1).decode("utf-8")
--
--        # For the time being, we don't care about anything other than "BINARY".
--        # The only other value that is currently allowed by the standard is
--        # "ISO-IR 10646 2000 UTF-8" in other words UTF-8.
--        hdrcharset = pax_headers.get("hdrcharset")
--        if hdrcharset == "BINARY":
--            encoding = tarfile.encoding
--        else:
--            encoding = "utf-8"
--
-         # Parse pax header information. A record looks like that:
-         # "%d %s=%s\n" % (length, keyword, value). length is the size
-         # of the complete record including the length field itself and
--        # the newline. keyword and value are both UTF-8 encoded strings.
--        regex = re.compile(br"(\d+) ([^=]+)=")
-+        # the newline.
-         pos = 0
--        while True:
--            match = regex.match(buf, pos)
--            if not match:
--                break
-+        encoding = None
-+        raw_headers = []
-+        while len(buf) > pos and buf[pos] != 0x00:
-+            if not (match := _header_length_prefix_re.match(buf, pos)):
-+                raise InvalidHeaderError("invalid header")
-+            try:
-+                length = int(match.group(1))
-+            except ValueError:
-+                raise InvalidHeaderError("invalid header")
-+            # Headers must be at least 5 bytes, shortest being '5 x=\n'.
-+            # Value is allowed to be empty.
-+            if length < 5:
-+                raise InvalidHeaderError("invalid header")
-+            if pos + length > len(buf):
-+                raise InvalidHeaderError("invalid header")
- 
--            length, keyword = match.groups()
--            length = int(length)
--            if length == 0:
-+            header_value_end_offset = match.start(1) + length - 1  # Last byte of the header
-+            keyword_and_value = buf[match.end(1) + 1:header_value_end_offset]
-+            raw_keyword, equals, raw_value = keyword_and_value.partition(b"=")
-+
-+            # Check the framing of the header. The last character must be '\n' (0x0A)
-+            if not raw_keyword or equals != b"=" or buf[header_value_end_offset] != 0x0A:
-                 raise InvalidHeaderError("invalid header")
--            value = buf[match.end(2) + 1:match.start(1) + length - 1]
-+            raw_headers.append((length, raw_keyword, raw_value))
-+
-+            # Check if the pax header contains a hdrcharset field. This tells us
-+            # the encoding of the path, linkpath, uname and gname fields. Normally,
-+            # these fields are UTF-8 encoded but since POSIX.1-2008 tar
-+            # implementations are allowed to store them as raw binary strings if
-+            # the translation to UTF-8 fails. For the time being, we don't care about
-+            # anything other than "BINARY". The only other value that is currently
-+            # allowed by the standard is "ISO-IR 10646 2000 UTF-8" in other words UTF-8.
-+            # Note that we only follow the initial 'hdrcharset' setting to preserve
-+            # the initial behavior of the 'tarfile' module.
-+            if raw_keyword == b"hdrcharset" and encoding is None:
-+                if raw_value == b"BINARY":
-+                    encoding = tarfile.encoding
-+                else:  # This branch ensures only the first 'hdrcharset' header is used.
-+                    encoding = "utf-8"
-+
-+            pos += length
- 
-+        # If no explicit hdrcharset is set, we use UTF-8 as a default.
-+        if encoding is None:
-+            encoding = "utf-8"
-+
-+        # After parsing the raw headers we can decode them to text.
-+        for length, raw_keyword, raw_value in raw_headers:
-             # Normally, we could just use "utf-8" as the encoding and "strict"
-             # as the error handler, but we better not take the risk. For
-             # example, GNU tar <= 1.23 is known to store filenames it cannot
-@@ -1452,17 +1473,16 @@ def _proc_pax(self, tarfile):
-             # hdrcharset=BINARY header).
-             # We first try the strict standard encoding, and if that fails we
-             # fall back on the user's encoding and error handler.
--            keyword = self._decode_pax_field(keyword, "utf-8", "utf-8",
-+            keyword = self._decode_pax_field(raw_keyword, "utf-8", "utf-8",
-                     tarfile.errors)
-             if keyword in PAX_NAME_FIELDS:
--                value = self._decode_pax_field(value, encoding, tarfile.encoding,
-+                value = self._decode_pax_field(raw_value, encoding, tarfile.encoding,
-                         tarfile.errors)
-             else:
--                value = self._decode_pax_field(value, "utf-8", "utf-8",
-+                value = self._decode_pax_field(raw_value, "utf-8", "utf-8",
-                         tarfile.errors)
- 
-             pax_headers[keyword] = value
--            pos += length
- 
-         # Fetch the next header.
-         try:
-@@ -1477,7 +1497,7 @@ def _proc_pax(self, tarfile):
- 
-         elif "GNU.sparse.size" in pax_headers:
-             # GNU extended sparse format version 0.0.
--            self._proc_gnusparse_00(next, pax_headers, buf)
-+            self._proc_gnusparse_00(next, raw_headers)
- 
-         elif pax_headers.get("GNU.sparse.major") == "1" and pax_headers.get("GNU.sparse.minor") == "0":
-             # GNU extended sparse format version 1.0.
-@@ -1499,15 +1519,24 @@ def _proc_pax(self, tarfile):
- 
-         return next
- 
--    def _proc_gnusparse_00(self, next, pax_headers, buf):
-+    def _proc_gnusparse_00(self, next, raw_headers):
-         """Process a GNU tar extended sparse header, version 0.0.
-         """
-         offsets = []
--        for match in re.finditer(br"\d+ GNU.sparse.offset=(\d+)\n", buf):
--            offsets.append(int(match.group(1)))
-         numbytes = []
--        for match in re.finditer(br"\d+ GNU.sparse.numbytes=(\d+)\n", buf):
--            numbytes.append(int(match.group(1)))
-+        for _, keyword, value in raw_headers:
-+            if keyword == b"GNU.sparse.offset":
-+                try:
-+                    offsets.append(int(value.decode()))
-+                except ValueError:
-+                    raise InvalidHeaderError("invalid header")
-+
-+            elif keyword == b"GNU.sparse.numbytes":
-+                try:
-+                    numbytes.append(int(value.decode()))
-+                except ValueError:
-+                    raise InvalidHeaderError("invalid header")
-+
-         next.sparse = list(zip(offsets, numbytes))
- 
-     def _proc_gnusparse_01(self, next, pax_headers):
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index cfc13bccb20..007c3e94acb 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -1139,6 +1139,48 @@ def test_pax_number_fields(self):
-         finally:
-             tar.close()
- 
-+    def test_pax_header_bad_formats(self):
-+        # The fields from the pax header have priority over the
-+        # TarInfo.
-+        pax_header_replacements = (
-+            b" foo=bar\n",
-+            b"0 \n",
-+            b"1 \n",
-+            b"2 \n",
-+            b"3 =\n",
-+            b"4 =a\n",
-+            b"1000000 foo=bar\n",
-+            b"0 foo=bar\n",
-+            b"-12 foo=bar\n",
-+            b"000000000000000000000000036 foo=bar\n",
-+        )
-+        pax_headers = {"foo": "bar"}
-+
-+        for replacement in pax_header_replacements:
-+            with self.subTest(header=replacement):
-+                tar = tarfile.open(tmpname, "w", format=tarfile.PAX_FORMAT,
-+                                   encoding="iso8859-1")
-+                try:
-+                    t = tarfile.TarInfo()
-+                    t.name = "pax"  # non-ASCII
-+                    t.uid = 1
-+                    t.pax_headers = pax_headers
-+                    tar.addfile(t)
-+                finally:
-+                    tar.close()
-+
-+                with open(tmpname, "rb") as f:
-+                    data = f.read()
-+                    self.assertIn(b"11 foo=bar\n", data)
-+                    data = data.replace(b"11 foo=bar\n", replacement)
-+
-+                with open(tmpname, "wb") as f:
-+                    f.truncate()
-+                    f.write(data)
-+
-+                with self.assertRaisesRegex(tarfile.ReadError, r"method tar: ReadError\('invalid header'\)"):
-+                    tarfile.open(tmpname, encoding="iso8859-1")
-+
- 
- class WriteTestBase(TarTest):
-     # Put all write tests in here that are supposed to be tested
-diff --git a/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
-new file mode 100644
-index 00000000000..81f918bfe2b
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
-@@ -0,0 +1,2 @@
-+Remove backtracking from tarfile header parsing for ``hdrcharset``, PAX, and
-+GNU sparse headers.
--- 
-2.46.0
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch b/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
deleted file mode 100644
index 7303a41e20..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 3c15b8437f57fe1027171b34af88bf791cf1868c Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Wed, 4 Sep 2024 17:50:36 +0200
-Subject: [PATCH 1/2] [3.10] gh-123067: Fix quadratic complexity in parsing
- "-quoted cookie values with backslashes (GH-123075) (#123106)
-
-This fixes CVE-2024-7592.
-(cherry picked from commit 44e458357fca05ca0ae2658d62c8c595b048b5ef)
-
-Upstream-Status: Backport from https://github.com/python/cpython/commit/b2f11ca7667e4d57c71c1c88b255115f16042d9a
-CVE: CVE-2024-7592
-
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
----
- Lib/http/cookies.py                           | 34 ++++-------------
- Lib/test/test_http_cookies.py                 | 38 +++++++++++++++++++
- ...-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst |  1 +
- 3 files changed, 47 insertions(+), 26 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
-
-diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
-index 35ac2dc6ae2..2c1f021d0ab 100644
---- a/Lib/http/cookies.py
-+++ b/Lib/http/cookies.py
-@@ -184,8 +184,13 @@ def _quote(str):
-         return '"' + str.translate(_Translator) + '"'
- 
- 
--_OctalPatt = re.compile(r"\\[0-3][0-7][0-7]")
--_QuotePatt = re.compile(r"[\\].")
-+_unquote_sub = re.compile(r'\\(?:([0-3][0-7][0-7])|(.))').sub
-+
-+def _unquote_replace(m):
-+    if m[1]:
-+        return chr(int(m[1], 8))
-+    else:
-+        return m[2]
- 
- def _unquote(str):
-     # If there aren't any doublequotes,
-@@ -205,30 +210,7 @@ def _unquote(str):
-     #    \012 --> \n
-     #    \"   --> "
-     #
--    i = 0
--    n = len(str)
--    res = []
--    while 0 <= i < n:
--        o_match = _OctalPatt.search(str, i)
--        q_match = _QuotePatt.search(str, i)
--        if not o_match and not q_match:              # Neither matched
--            res.append(str[i:])
--            break
--        # else:
--        j = k = -1
--        if o_match:
--            j = o_match.start(0)
--        if q_match:
--            k = q_match.start(0)
--        if q_match and (not o_match or k < j):     # QuotePatt matched
--            res.append(str[i:k])
--            res.append(str[k+1])
--            i = k + 2
--        else:                                      # OctalPatt matched
--            res.append(str[i:j])
--            res.append(chr(int(str[j+1:j+4], 8)))
--            i = j + 4
--    return _nulljoin(res)
-+    return _unquote_sub(_unquote_replace, str)
- 
- # The _getdate() routine is used to set the expiration time in the cookie's HTTP
- # header.  By default, _getdate() returns the current time in the appropriate
-diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
-index 6072c7e15e9..644e75cd5b7 100644
---- a/Lib/test/test_http_cookies.py
-+++ b/Lib/test/test_http_cookies.py
-@@ -5,6 +5,7 @@
- import unittest
- from http import cookies
- import pickle
-+from test import support
- 
- 
- class CookieTests(unittest.TestCase):
-@@ -58,6 +59,43 @@ def test_basic(self):
-             for k, v in sorted(case['dict'].items()):
-                 self.assertEqual(C[k].value, v)
- 
-+    def test_unquote(self):
-+        cases = [
-+            (r'a="b=\""', 'b="'),
-+            (r'a="b=\\"', 'b=\\'),
-+            (r'a="b=\="', 'b=='),
-+            (r'a="b=\n"', 'b=n'),
-+            (r'a="b=\042"', 'b="'),
-+            (r'a="b=\134"', 'b=\\'),
-+            (r'a="b=\377"', 'b=\xff'),
-+            (r'a="b=\400"', 'b=400'),
-+            (r'a="b=\42"', 'b=42'),
-+            (r'a="b=\\042"', 'b=\\042'),
-+            (r'a="b=\\134"', 'b=\\134'),
-+            (r'a="b=\\\""', 'b=\\"'),
-+            (r'a="b=\\\042"', 'b=\\"'),
-+            (r'a="b=\134\""', 'b=\\"'),
-+            (r'a="b=\134\042"', 'b=\\"'),
-+        ]
-+        for encoded, decoded in cases:
-+            with self.subTest(encoded):
-+                C = cookies.SimpleCookie()
-+                C.load(encoded)
-+                self.assertEqual(C['a'].value, decoded)
-+
-+    @support.requires_resource('cpu')
-+    def test_unquote_large(self):
-+        n = 10**6
-+        for encoded in r'\\', r'\134':
-+            with self.subTest(encoded):
-+                data = 'a="b=' + encoded*n + ';"'
-+                C = cookies.SimpleCookie()
-+                C.load(data)
-+                value = C['a'].value
-+                self.assertEqual(value[:3], 'b=\\')
-+                self.assertEqual(value[-2:], '\\;')
-+                self.assertEqual(len(value), n + 3)
-+
-     def test_load(self):
-         C = cookies.SimpleCookie()
-         C.load('Customer="WILE_E_COYOTE"; Version=1; Path=/acme')
-diff --git a/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
-new file mode 100644
-index 00000000000..6a234561fe3
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
-@@ -0,0 +1 @@
-+Fix quadratic complexity in parsing ``"``-quoted cookie values with backslashes by :mod:`http.cookies`.
--- 
-2.46.0
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2024-8088.patch b/meta/recipes-devtools/python/python3/CVE-2024-8088.patch
deleted file mode 100644
index 10d28a9e65..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2024-8088.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From e0264a61119d551658d9445af38323ba94fc16db Mon Sep 17 00:00:00 2001
-From: "Jason R. Coombs" <jaraco@jaraco.com>
-Date: Thu, 22 Aug 2024 19:24:33 -0400
-Subject: [PATCH] CVE-2024-8088: Sanitize names in zipfile.Path. (GH-122906)
-
-Upstream-Status: Backport from https://github.com/python/cpython/commit/e0264a61119d551658d9445af38323ba94fc16db
-CVE: CVE-2024-8088
-
-Signed-off-by: Rohini Sangam <rsangam@mvista.com>
----
- Lib/test/test_zipfile.py   | 17 ++++++
- Lib/zipfile.py             | 61 ++++++++++++++++++-
- 2 files changed, 77 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/test/test_zipfile.py b/Lib/test/test_zipfile.py
-index 32c0170..a60dc11 100644
---- a/Lib/test/test_zipfile.py
-+++ b/Lib/test/test_zipfile.py
-@@ -3280,6 +3280,23 @@ with zipfile.ZipFile(io.BytesIO(), "w") as zf:
-         zipfile.Path(zf)
-         zf.extractall(source_path.parent)
- 
-+    def test_malformed_paths(self):
-+        """
-+        Path should handle malformed paths.
-+        """
-+        data = io.BytesIO()
-+        zf = zipfile.ZipFile(data, "w")
-+        zf.writestr("/one-slash.txt", b"content")
-+        zf.writestr("//two-slash.txt", b"content")
-+        zf.writestr("../parent.txt", b"content")
-+        zf.filename = ''
-+        root = zipfile.Path(zf)
-+        assert list(map(str, root.iterdir())) == [
-+            'one-slash.txt',
-+            'two-slash.txt',
-+            'parent.txt',
-+        ]
-+
- 
- class StripExtraTests(unittest.TestCase):
-     # Note: all of the "z" characters are technically invalid, but up
-diff --git a/Lib/zipfile.py b/Lib/zipfile.py
-index 7d18bc2..cbac8d9 100644
---- a/Lib/zipfile.py
-+++ b/Lib/zipfile.py
-@@ -9,6 +9,7 @@ import io
- import itertools
- import os
- import posixpath
-+import re
- import shutil
- import stat
- import struct
-@@ -2182,7 +2183,65 @@ def _difference(minuend, subtrahend):
-     return itertools.filterfalse(set(subtrahend).__contains__, minuend)
- 
- 
--class CompleteDirs(ZipFile):
-+class SanitizedNames:
-+    """
-+    ZipFile mix-in to ensure names are sanitized.
-+    """
-+
-+    def namelist(self):
-+        return list(map(self._sanitize, super().namelist()))
-+
-+    @staticmethod
-+    def _sanitize(name):
-+        r"""
-+        Ensure a relative path with posix separators and no dot names.
-+        Modeled after
-+        https://github.com/python/cpython/blob/bcc1be39cb1d04ad9fc0bd1b9193d3972835a57c/Lib/zipfile/__init__.py#L1799-L1813
-+        but provides consistent cross-platform behavior.
-+        >>> san = SanitizedNames._sanitize
-+        >>> san('/foo/bar')
-+        'foo/bar'
-+        >>> san('//foo.txt')
-+        'foo.txt'
-+        >>> san('foo/.././bar.txt')
-+        'foo/bar.txt'
-+        >>> san('foo../.bar.txt')
-+        'foo../.bar.txt'
-+        >>> san('\\foo\\bar.txt')
-+        'foo/bar.txt'
-+        >>> san('D:\\foo.txt')
-+        'D/foo.txt'
-+        >>> san('\\\\server\\share\\file.txt')
-+        'server/share/file.txt'
-+        >>> san('\\\\?\\GLOBALROOT\\Volume3')
-+        '?/GLOBALROOT/Volume3'
-+        >>> san('\\\\.\\PhysicalDrive1\\root')
-+        'PhysicalDrive1/root'
-+        Retain any trailing slash.
-+        >>> san('abc/')
-+        'abc/'
-+        Raises a ValueError if the result is empty.
-+        >>> san('../..')
-+        Traceback (most recent call last):
-+        ...
-+        ValueError: Empty filename
-+        """
-+
-+        def allowed(part):
-+            return part and part not in {'..', '.'}
-+
-+        # Remove the drive letter.
-+        # Don't use ntpath.splitdrive, because that also strips UNC paths
-+        bare = re.sub('^([A-Z]):', r'\1', name, flags=re.IGNORECASE)
-+        clean = bare.replace('\\', '/')
-+        parts = clean.split('/')
-+        joined = '/'.join(filter(allowed, parts))
-+        if not joined:
-+            raise ValueError("Empty filename")
-+        return joined + '/' * name.endswith('/')
-+
-+
-+class CompleteDirs(SanitizedNames, ZipFile):
-     """
-     A ZipFile subclass that ensures that implied directories
-     are always included in the namelist.
--- 
-2.35.7
-
diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recipes-devtools/python/python3_3.10.15.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.10.14.bb
rename to meta/recipes-devtools/python/python3_3.10.15.bb
index 8f6a15701f..4157b8cb83 100644
--- a/meta/recipes-devtools/python/python3_3.10.14.bb
+++ b/meta/recipes-devtools/python/python3_3.10.15.bb
@@ -36,10 +36,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
-	   file://CVE-2024-8088.patch \
-           file://CVE-2024-7592.patch \
-           file://CVE-2024-6232.patch \
-           file://CVE-2023-27043.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -48,7 +44,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "9c50481faa8c2832329ba0fc8868d0a606a680fc4f60ec48d26ce8e076751fda"
+SRC_URI[sha256sum] = "aab0950817735172601879872d937c1e4928a57c409ae02369ec3d91dccebe79"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


