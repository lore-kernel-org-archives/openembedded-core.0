Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CA0EE57DF
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:37 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.35222.1726097010839642834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fJUcRw2g;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7c691c8f8dcso274812a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097010; x=1726701810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aAQM4CIC0e0/29S3FfVcAVs2Aikhtol4dEyzNdMGcE=;
        b=fJUcRw2g0JW7ypGcRGNZccYF8BWcEtIfX55X/6IyeBilobBQMhJ+alaen9Dvy8U2Qd
         Da/rNDf/hY+bB+Dxuf4e77LlQqgGYCM50SWmdEMRu4DpJy0sG0PWBIvCHNMxW1mqmCTG
         3HKIk6KY+vYikWa1Zm0QhOWryJUBWl3ja5WLDsBgxRio65ZsrzLfYdtz043mSVKYwBKA
         9y91HSp3VhJGkbnhe7in7Ktt2Aqfb0rngJfy6VWZS73L/CWDwHPDu4HB05aLBr5l6C89
         Szu0nSPRrmVLEYsCxp7OY4tQau3EnFsWK5NWzD7kOgcp8OE8VdE5Y6MRervTZ8aM0PAF
         vdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097010; x=1726701810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aAQM4CIC0e0/29S3FfVcAVs2Aikhtol4dEyzNdMGcE=;
        b=WT2dvXiUfAGGYcyehg6nho+CgCH96GXWRFLWq3MXezWuX1BCMLpTArf1SYy11u7jlH
         LN2O1mdbEm30n44PwUn7I2oh77ZyYxD2fa5H42l2wnxkLSPtg+6TZ6jwSEAplS3PQGzC
         SADksUIgW7uybalvsi7QGyTlHuOFu+jyQLQb+m+UpGrgQ/Vv+UyxfVNvyGWC/YcsI+lP
         ewjjAkaVQtcteTIIH9qMXxtocgfxEfycRI3kXG3vxQ7Orjpf9diUJ8FBJ+4wF/U8+yq4
         9OvogeTE49GjaZktwMH1lnmlxa36VsaMK+IQfQrP6J2aSFq/qapQgDEccrAtWbgFv03E
         dLLw==
X-Gm-Message-State: AOJu0YxjG9BVzd7lqedh+PkR0/tU38vMj61GmMg7/GQ86kNFY8y8uBax
	TZjbzfIB/0yHYZ3Pgyu4BiLLVDStPDkSL3wIWNmrQnL8gvlMAI+QdbNt61LLFswyAxDbeQGEvq5
	B
X-Google-Smtp-Source: AGHT+IHjcoopoTK6qB4lOwPy8r140Vo6s82RCRZYi2pCiQvy+u2nEr4RU55/TfQYKqsB0YR0MALQjQ==
X-Received: by 2002:a05:6a21:3947:b0:1cf:27bf:8e03 with SMTP id adf61e73a8af0-1cf75efd46amr1079065637.26.1726097009673;
        Wed, 11 Sep 2024 16:23:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/22] python3: fix CVE-2023-27043
Date: Wed, 11 Sep 2024 16:22:59 -0700
Message-Id: <793c22623e8b3da2ca8e28fe662d8428b0f805a7.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204396

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/python/cpython/commit/2a9273a0e4466e2f057f9ce6fe98cd8ce570331b

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2023-27043.patch       | 510 ++++++++++++++++++
 .../python/python3_3.10.14.bb                 |   1 +
 2 files changed, 511 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2023-27043.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2023-27043.patch b/meta/recipes-devtools/python/python3/CVE-2023-27043.patch
new file mode 100644
index 0000000000..d27afc41a9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2023-27043.patch
@@ -0,0 +1,510 @@
+From 2a9273a0e4466e2f057f9ce6fe98cd8ce570331b Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Fri, 6 Sep 2024 13:14:22 +0200
+Subject: [PATCH] [3.10] [CVE-2023-27043] gh-102988: Reject malformed addresses
+ in email.parseaddr() (GH-111116) (#123768)
+
+Detect email address parsing errors and return empty tuple to
+indicate the parsing error (old API). Add an optional 'strict'
+parameter to getaddresses() and parseaddr() functions. Patch by
+Thomas Dwyer.
+
+(cherry picked from commit 4a153a1d3b18803a684cd1bcc2cdf3ede3dbae19)
+
+Co-authored-by: Victor Stinner <vstinner@python.org>
+Co-Authored-By: Thomas Dwyer <github@tomd.tel>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/2a9273a0e4466e2f057f9ce6fe98cd8ce570331b]
+CVE: CVE-2023-27043
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Doc/library/email.utils.rst                   |  19 +-
+ Lib/email/utils.py                            | 151 ++++++++++++-
+ Lib/test/test_email/test_email.py             | 204 +++++++++++++++++-
+ ...-10-20-15-28-08.gh-issue-102988.dStNO7.rst |   8 +
+ 4 files changed, 361 insertions(+), 21 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issue-102988.dStNO7.rst
+
+diff --git a/Doc/library/email.utils.rst b/Doc/library/email.utils.rst
+index 0e266b6..65948fb 100644
+--- a/Doc/library/email.utils.rst
++++ b/Doc/library/email.utils.rst
+@@ -60,13 +60,18 @@ of the new API.
+    begins with angle brackets, they are stripped off.
+ 
+ 
+-.. function:: parseaddr(address)
++.. function:: parseaddr(address, *, strict=True)
+ 
+    Parse address -- which should be the value of some address-containing field such
+    as :mailheader:`To` or :mailheader:`Cc` -- into its constituent *realname* and
+    *email address* parts.  Returns a tuple of that information, unless the parse
+    fails, in which case a 2-tuple of ``('', '')`` is returned.
+ 
++   If *strict* is true, use a strict parser which rejects malformed inputs.
++
++   .. versionchanged:: 3.10.15
++      Add *strict* optional parameter and reject malformed inputs by default.
++
+ 
+ .. function:: formataddr(pair, charset='utf-8')
+ 
+@@ -84,12 +89,15 @@ of the new API.
+       Added the *charset* option.
+ 
+ 
+-.. function:: getaddresses(fieldvalues)
++.. function:: getaddresses(fieldvalues, *, strict=True)
+ 
+    This method returns a list of 2-tuples of the form returned by ``parseaddr()``.
+    *fieldvalues* is a sequence of header field values as might be returned by
+-   :meth:`Message.get_all <email.message.Message.get_all>`.  Here's a simple
+-   example that gets all the recipients of a message::
++   :meth:`Message.get_all <email.message.Message.get_all>`.
++
++   If *strict* is true, use a strict parser which rejects malformed inputs.
++
++   Here's a simple example that gets all the recipients of a message::
+ 
+       from email.utils import getaddresses
+ 
+@@ -99,6 +107,9 @@ of the new API.
+       resent_ccs = msg.get_all('resent-cc', [])
+       all_recipients = getaddresses(tos + ccs + resent_tos + resent_ccs)
+ 
++   .. versionchanged:: 3.10.15
++      Add *strict* optional parameter and reject malformed inputs by default.
++
+ 
+ .. function:: parsedate(date)
+ 
+diff --git a/Lib/email/utils.py b/Lib/email/utils.py
+index cfdfeb3..9522341 100644
+--- a/Lib/email/utils.py
++++ b/Lib/email/utils.py
+@@ -48,6 +48,7 @@ TICK = "'"
+ specialsre = re.compile(r'[][\\()<>@,:;".]')
+ escapesre = re.compile(r'[\\"]')
+ 
++
+ def _has_surrogates(s):
+     """Return True if s contains surrogate-escaped binary data."""
+     # This check is based on the fact that unless there are surrogates, utf8
+@@ -106,12 +107,127 @@ def formataddr(pair, charset='utf-8'):
+     return address
+ 
+ 
++def _iter_escaped_chars(addr):
++    pos = 0
++    escape = False
++    for pos, ch in enumerate(addr):
++        if escape:
++            yield (pos, '\\' + ch)
++            escape = False
++        elif ch == '\\':
++            escape = True
++        else:
++            yield (pos, ch)
++    if escape:
++        yield (pos, '\\')
++
++
++def _strip_quoted_realnames(addr):
++    """Strip real names between quotes."""
++    if '"' not in addr:
++        # Fast path
++        return addr
++
++    start = 0
++    open_pos = None
++    result = []
++    for pos, ch in _iter_escaped_chars(addr):
++        if ch == '"':
++            if open_pos is None:
++                open_pos = pos
++            else:
++                if start != open_pos:
++                    result.append(addr[start:open_pos])
++                start = pos + 1
++                open_pos = None
++
++    if start < len(addr):
++        result.append(addr[start:])
++
++    return ''.join(result)
+ 
+-def getaddresses(fieldvalues):
+-    """Return a list of (REALNAME, EMAIL) for each fieldvalue."""
+-    all = COMMASPACE.join(str(v) for v in fieldvalues)
+-    a = _AddressList(all)
+-    return a.addresslist
++
++supports_strict_parsing = True
++
++def getaddresses(fieldvalues, *, strict=True):
++    """Return a list of (REALNAME, EMAIL) or ('','') for each fieldvalue.
++
++    When parsing fails for a fieldvalue, a 2-tuple of ('', '') is returned in
++    its place.
++
++    If strict is true, use a strict parser which rejects malformed inputs.
++    """
++
++    # If strict is true, if the resulting list of parsed addresses is greater
++    # than the number of fieldvalues in the input list, a parsing error has
++    # occurred and consequently a list containing a single empty 2-tuple [('',
++    # '')] is returned in its place. This is done to avoid invalid output.
++    #
++    # Malformed input: getaddresses(['alice@example.com <bob@example.com>'])
++    # Invalid output: [('', 'alice@example.com'), ('', 'bob@example.com')]
++    # Safe output: [('', '')]
++
++    if not strict:
++        all = COMMASPACE.join(str(v) for v in fieldvalues)
++        a = _AddressList(all)
++        return a.addresslist
++
++    fieldvalues = [str(v) for v in fieldvalues]
++    fieldvalues = _pre_parse_validation(fieldvalues)
++    addr = COMMASPACE.join(fieldvalues)
++    a = _AddressList(addr)
++    result = _post_parse_validation(a.addresslist)
++
++    # Treat output as invalid if the number of addresses is not equal to the
++    # expected number of addresses.
++    n = 0
++    for v in fieldvalues:
++        # When a comma is used in the Real Name part it is not a deliminator.
++        # So strip those out before counting the commas.
++        v = _strip_quoted_realnames(v)
++        # Expected number of addresses: 1 + number of commas
++        n += 1 + v.count(',')
++    if len(result) != n:
++        return [('', '')]
++
++    return result
++
++
++def _check_parenthesis(addr):
++    # Ignore parenthesis in quoted real names.
++    addr = _strip_quoted_realnames(addr)
++
++    opens = 0
++    for pos, ch in _iter_escaped_chars(addr):
++        if ch == '(':
++            opens += 1
++        elif ch == ')':
++            opens -= 1
++            if opens < 0:
++                return False
++    return (opens == 0)
++
++
++def _pre_parse_validation(email_header_fields):
++    accepted_values = []
++    for v in email_header_fields:
++        if not _check_parenthesis(v):
++            v = "('', '')"
++        accepted_values.append(v)
++
++    return accepted_values
++
++
++def _post_parse_validation(parsed_email_header_tuples):
++    accepted_values = []
++    # The parser would have parsed a correctly formatted domain-literal
++    # The existence of an [ after parsing indicates a parsing failure
++    for v in parsed_email_header_tuples:
++        if '[' in v[1]:
++            v = ('', '')
++        accepted_values.append(v)
++
++    return accepted_values
+ 
+ 
+ def _format_timetuple_and_zone(timetuple, zone):
+@@ -205,16 +321,33 @@ def parsedate_to_datetime(data):
+             tzinfo=datetime.timezone(datetime.timedelta(seconds=tz)))
+ 
+ 
+-def parseaddr(addr):
++def parseaddr(addr, *, strict=True):
+     """
+     Parse addr into its constituent realname and email address parts.
+ 
+     Return a tuple of realname and email address, unless the parse fails, in
+     which case return a 2-tuple of ('', '').
++
++    If strict is True, use a strict parser which rejects malformed inputs.
+     """
+-    addrs = _AddressList(addr).addresslist
+-    if not addrs:
+-        return '', ''
++    if not strict:
++        addrs = _AddressList(addr).addresslist
++        if not addrs:
++            return ('', '')
++        return addrs[0]
++
++    if isinstance(addr, list):
++        addr = addr[0]
++
++    if not isinstance(addr, str):
++        return ('', '')
++
++    addr = _pre_parse_validation([addr])[0]
++    addrs = _post_parse_validation(_AddressList(addr).addresslist)
++
++    if not addrs or len(addrs) > 1:
++        return ('', '')
++
+     return addrs[0]
+ 
+ 
+diff --git a/Lib/test/test_email/test_email.py b/Lib/test/test_email/test_email.py
+index 8b16cca..5b19bb3 100644
+--- a/Lib/test/test_email/test_email.py
++++ b/Lib/test/test_email/test_email.py
+@@ -16,6 +16,7 @@ from unittest.mock import patch
+ 
+ import email
+ import email.policy
++import email.utils
+ 
+ from email.charset import Charset
+ from email.generator import Generator, DecodedGenerator, BytesGenerator
+@@ -3288,15 +3289,154 @@ Foo
+            [('Al Person', 'aperson@dom.ain'),
+             ('Bud Person', 'bperson@dom.ain')])
+ 
++    def test_getaddresses_comma_in_name(self):
++        """GH-106669 regression test."""
++        self.assertEqual(
++            utils.getaddresses(
++                [
++                    '"Bud, Person" <bperson@dom.ain>',
++                    'aperson@dom.ain (Al Person)',
++                    '"Mariusz Felisiak" <to@example.com>',
++                ]
++            ),
++            [
++                ('Bud, Person', 'bperson@dom.ain'),
++                ('Al Person', 'aperson@dom.ain'),
++                ('Mariusz Felisiak', 'to@example.com'),
++            ],
++        )
++
++    def test_parsing_errors(self):
++        """Test for parsing errors from CVE-2023-27043 and CVE-2019-16056"""
++        alice = 'alice@example.org'
++        bob = 'bob@example.com'
++        empty = ('', '')
++
++        # Test utils.getaddresses() and utils.parseaddr() on malformed email
++        # addresses: default behavior (strict=True) rejects malformed address,
++        # and strict=False which tolerates malformed address.
++        for invalid_separator, expected_non_strict in (
++            ('(', [(f'<{bob}>', alice)]),
++            (')', [('', alice), empty, ('', bob)]),
++            ('<', [('', alice), empty, ('', bob), empty]),
++            ('>', [('', alice), empty, ('', bob)]),
++            ('[', [('', f'{alice}[<{bob}>]')]),
++            (']', [('', alice), empty, ('', bob)]),
++            ('@', [empty, empty, ('', bob)]),
++            (';', [('', alice), empty, ('', bob)]),
++            (':', [('', alice), ('', bob)]),
++            ('.', [('', alice + '.'), ('', bob)]),
++            ('"', [('', alice), ('', f'<{bob}>')]),
++        ):
++            address = f'{alice}{invalid_separator}<{bob}>'
++            with self.subTest(address=address):
++                self.assertEqual(utils.getaddresses([address]),
++                                 [empty])
++                self.assertEqual(utils.getaddresses([address], strict=False),
++                                 expected_non_strict)
++
++                self.assertEqual(utils.parseaddr([address]),
++                                 empty)
++                self.assertEqual(utils.parseaddr([address], strict=False),
++                                 ('', address))
++
++        # Comma (',') is treated differently depending on strict parameter.
++        # Comma without quotes.
++        address = f'{alice},<{bob}>'
++        self.assertEqual(utils.getaddresses([address]),
++                         [('', alice), ('', bob)])
++        self.assertEqual(utils.getaddresses([address], strict=False),
++                         [('', alice), ('', bob)])
++        self.assertEqual(utils.parseaddr([address]),
++                         empty)
++        self.assertEqual(utils.parseaddr([address], strict=False),
++                         ('', address))
++
++        # Real name between quotes containing comma.
++        address = '"Alice, alice@example.org" <bob@example.com>'
++        expected_strict = ('Alice, alice@example.org', 'bob@example.com')
++        self.assertEqual(utils.getaddresses([address]), [expected_strict])
++        self.assertEqual(utils.getaddresses([address], strict=False), [expected_strict])
++        self.assertEqual(utils.parseaddr([address]), expected_strict)
++        self.assertEqual(utils.parseaddr([address], strict=False),
++                         ('', address))
++
++        # Valid parenthesis in comments.
++        address = 'alice@example.org (Alice)'
++        expected_strict = ('Alice', 'alice@example.org')
++        self.assertEqual(utils.getaddresses([address]), [expected_strict])
++        self.assertEqual(utils.getaddresses([address], strict=False), [expected_strict])
++        self.assertEqual(utils.parseaddr([address]), expected_strict)
++        self.assertEqual(utils.parseaddr([address], strict=False),
++                         ('', address))
++
++        # Invalid parenthesis in comments.
++        address = 'alice@example.org )Alice('
++        self.assertEqual(utils.getaddresses([address]), [empty])
++        self.assertEqual(utils.getaddresses([address], strict=False),
++                         [('', 'alice@example.org'), ('', ''), ('', 'Alice')])
++        self.assertEqual(utils.parseaddr([address]), empty)
++        self.assertEqual(utils.parseaddr([address], strict=False),
++                         ('', address))
++
++        # Two addresses with quotes separated by comma.
++        address = '"Jane Doe" <jane@example.net>, "John Doe" <john@example.net>'
++        self.assertEqual(utils.getaddresses([address]),
++                         [('Jane Doe', 'jane@example.net'),
++                          ('John Doe', 'john@example.net')])
++        self.assertEqual(utils.getaddresses([address], strict=False),
++                         [('Jane Doe', 'jane@example.net'),
++                          ('John Doe', 'john@example.net')])
++        self.assertEqual(utils.parseaddr([address]), empty)
++        self.assertEqual(utils.parseaddr([address], strict=False),
++                         ('', address))
++
++        # Test email.utils.supports_strict_parsing attribute
++        self.assertEqual(email.utils.supports_strict_parsing, True)
++
+     def test_getaddresses_nasty(self):
+-        eq = self.assertEqual
+-        eq(utils.getaddresses(['foo: ;']), [('', '')])
+-        eq(utils.getaddresses(
+-           ['[]*-- =~$']),
+-           [('', ''), ('', ''), ('', '*--')])
+-        eq(utils.getaddresses(
+-           ['foo: ;', '"Jason R. Mastaler" <jason@dom.ain>']),
+-           [('', ''), ('Jason R. Mastaler', 'jason@dom.ain')])
++        for addresses, expected in (
++            (['"Sürname, Firstname" <to@example.com>'],
++             [('Sürname, Firstname', 'to@example.com')]),
++
++            (['foo: ;'],
++             [('', '')]),
++
++            (['foo: ;', '"Jason R. Mastaler" <jason@dom.ain>'],
++             [('', ''), ('Jason R. Mastaler', 'jason@dom.ain')]),
++
++            ([r'Pete(A nice \) chap) <pete(his account)@silly.test(his host)>'],
++             [('Pete (A nice ) chap his account his host)', 'pete@silly.test')]),
++
++            (['(Empty list)(start)Undisclosed recipients  :(nobody(I know))'],
++             [('', '')]),
++
++            (['Mary <@machine.tld:mary@example.net>, , jdoe@test   . example'],
++             [('Mary', 'mary@example.net'), ('', ''), ('', 'jdoe@test.example')]),
++
++            (['John Doe <jdoe@machine(comment).  example>'],
++             [('John Doe (comment)', 'jdoe@machine.example')]),
++
++            (['"Mary Smith: Personal Account" <smith@home.example>'],
++             [('Mary Smith: Personal Account', 'smith@home.example')]),
++
++            (['Undisclosed recipients:;'],
++             [('', '')]),
++
++            ([r'<boss@nil.test>, "Giant; \"Big\" Box" <bob@example.net>'],
++             [('', 'boss@nil.test'), ('Giant; "Big" Box', 'bob@example.net')]),
++        ):
++            with self.subTest(addresses=addresses):
++                self.assertEqual(utils.getaddresses(addresses),
++                                 expected)
++                self.assertEqual(utils.getaddresses(addresses, strict=False),
++                                 expected)
++
++        addresses = ['[]*-- =~$']
++        self.assertEqual(utils.getaddresses(addresses),
++                         [('', '')])
++        self.assertEqual(utils.getaddresses(addresses, strict=False),
++                         [('', ''), ('', ''), ('', '*--')])
+ 
+     def test_getaddresses_embedded_comment(self):
+         """Test proper handling of a nested comment"""
+@@ -3485,6 +3625,54 @@ multipart/report
+                 m = cls(*constructor, policy=email.policy.default)
+                 self.assertIs(m.policy, email.policy.default)
+ 
++    def test_iter_escaped_chars(self):
++        self.assertEqual(list(utils._iter_escaped_chars(r'a\\b\"c\\"d')),
++                         [(0, 'a'),
++                          (2, '\\\\'),
++                          (3, 'b'),
++                          (5, '\\"'),
++                          (6, 'c'),
++                          (8, '\\\\'),
++                          (9, '"'),
++                          (10, 'd')])
++        self.assertEqual(list(utils._iter_escaped_chars('a\\')),
++                         [(0, 'a'), (1, '\\')])
++
++    def test_strip_quoted_realnames(self):
++        def check(addr, expected):
++            self.assertEqual(utils._strip_quoted_realnames(addr), expected)
++
++        check('"Jane Doe" <jane@example.net>, "John Doe" <john@example.net>',
++              ' <jane@example.net>,  <john@example.net>')
++        check(r'"Jane \"Doe\"." <jane@example.net>',
++              ' <jane@example.net>')
++
++        # special cases
++        check(r'before"name"after', 'beforeafter')
++        check(r'before"name"', 'before')
++        check(r'b"name"', 'b')  # single char
++        check(r'"name"after', 'after')
++        check(r'"name"a', 'a')  # single char
++        check(r'"name"', '')
++
++        # no change
++        for addr in (
++            'Jane Doe <jane@example.net>, John Doe <john@example.net>',
++            'lone " quote',
++        ):
++            self.assertEqual(utils._strip_quoted_realnames(addr), addr)
++
++
++    def test_check_parenthesis(self):
++        addr = 'alice@example.net'
++        self.assertTrue(utils._check_parenthesis(f'{addr} (Alice)'))
++        self.assertFalse(utils._check_parenthesis(f'{addr} )Alice('))
++        self.assertFalse(utils._check_parenthesis(f'{addr} (Alice))'))
++        self.assertFalse(utils._check_parenthesis(f'{addr} ((Alice)'))
++
++        # Ignore real name between quotes
++        self.assertTrue(utils._check_parenthesis(f'")Alice((" {addr}'))
++
+ 
+ # Test the iterator/generators
+ class TestIterators(TestEmailBase):
+diff --git a/Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issue-102988.dStNO7.rst b/Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issue-102988.dStNO7.rst
+new file mode 100644
+index 0000000..3d0e9e4
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issue-102988.dStNO7.rst
+@@ -0,0 +1,8 @@
++:func:`email.utils.getaddresses` and :func:`email.utils.parseaddr` now
++return ``('', '')`` 2-tuples in more situations where invalid email
++addresses are encountered instead of potentially inaccurate values. Add
++optional *strict* parameter to these two functions: use ``strict=False`` to
++get the old behavior, accept malformed inputs.
++``getattr(email.utils, 'supports_strict_parsing', False)`` can be use to check
++if the *strict* paramater is available. Patch by Thomas Dwyer and Victor
++Stinner to improve the CVE-2023-27043 fix.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recipes-devtools/python/python3_3.10.14.bb
index c337dfe450..8f6a15701f 100644
--- a/meta/recipes-devtools/python/python3_3.10.14.bb
+++ b/meta/recipes-devtools/python/python3_3.10.14.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://CVE-2024-8088.patch \
            file://CVE-2024-7592.patch \
            file://CVE-2024-6232.patch \
+           file://CVE-2023-27043.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


