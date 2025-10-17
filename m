Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E30ECCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:33 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.3202.1760733563471431081
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nUhfz/kp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a226a0798cso851998b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733563; x=1761338363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4l6JnvrucqqF0PS0GbdZA9SQcqcgayzR/qIg9hPXRs=;
        b=nUhfz/kpF+Ezc0syESQa2iOKixxc5eqBe3k9nXFV3nO4AEJa4pKzIplWWa67UyIwPg
         idbis05Cz0iUhNa9HjJkub45YTbN6ozofcAyVBlK3Ox1Slnpw/MxMRH38EcAtxmeHdVW
         qOKex8c7Zj49YkRcsrFnSkeLd4LYH/2tsYcOpKYfuawr1IsTP65QCz+OT29gwOj0U/8m
         hTT0rzPUl6QccBu9q6G+Tmq3ZIU0X8hpGqPer/kz0ZgMvcGC7cZ/L9y1CVqxIUw4lN+P
         1r0RC9MHCO6TJRVoOl6T8cqf4VfR2SdnCpGSd+UynMYUyBGCrYIZJSWuX6tgHAxrXsYp
         dfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733563; x=1761338363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4l6JnvrucqqF0PS0GbdZA9SQcqcgayzR/qIg9hPXRs=;
        b=b0rpBI5u7R1enLTZh8N0Z4dCZngBoVpbb5JteXBDuCJSt7sfhp6eqsZFor7wXm5W6r
         zeDCoSrdz4EYWLyhC47vSH128HJRZmXuw+jtJL5cQ4Zifg7XRjYdmUNbF6/TfmIcpkSo
         5reazfg1Re+9tO0ZaX6FDOWfiErpb0ZrMPJSiEGPpe8rVZObr7VO1ZQ1C+pQiEMoeF43
         ptRO2CArjR1/a9HljreyRomfCfKMewYvmWBJGJ2HR9rAKN75BGIVSEoFk4G4o/rBFZrP
         CVIxG/0QL1ODaOOL7WGiPeUOWR7TEaV0M67liDCHVfBHX/WOPKyXky+TsdKsgYxM3Xdx
         f99A==
X-Gm-Message-State: AOJu0Yzvax3DLAwW/BWbDvJj/8iG0+RFv4hFNOy694K0Tvkh06xpe1Kr
	4S9Xw6XMLzvkcqCfBBRt/y+ofcywooDi+06U5nzB8n2d57FILkTVfo0fYaF40+SX/VrTGIPfWMy
	dLcBn4lk=
X-Gm-Gg: ASbGnct7nkXZCjrgEMhg5qLCDFTKwuK2kzAPu83Kxh/18FSOivYXoxn0A1vo0740TF0
	EXxfTgw5hzLxzX4Nqpk3yiL6d89+nbL6XEoutWjHYAshfZqUbHznMkIm7N7rj5z+h86mvoTsrJi
	MGdAvpvcazQAwqaw0Wwzu56Yz0LrrHtHlaLv70De2SMAhCzJjjwGndkyeHfvdhQWR0mzu2Tihaw
	aZjV6HadGIEq6GUexL93O3eqJ86FLyntSwGXKbCb46YUaFwTipPYxSKuTPezVVEu9FBP4Elxj5s
	d2zB0bYtyOTTbySqez2AGKMGOsvQH2yHs7+sobQ+EMNNMmjGB/WWiWQdH/wZh5OTtlmaoShxPWr
	233uwtf4VX82fsD/b+EDP9dkBN0r6UtQEtBxx5ObXd/ejnPOsmeCXPPw5kQofhxJLHAg7GsgZCf
	ICcAbzDqL2HKM=
X-Google-Smtp-Source: AGHT+IFnUFkB0hB903dHDdBvtMDTkLxbbr6Z/6X1Sphhzbg4ADtqQlEkcc1s2+PCxvX/sLCSau0HoA==
X-Received: by 2002:a05:6a00:b8b:b0:781:1562:1f9e with SMTP id d2e1a72fcca58-7a220b25a74mr6605889b3a.32.1760733562632;
        Fri, 17 Oct 2025 13:39:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/26] python3-xmltodict: fix CVE-2025-9375
Date: Fri, 17 Oct 2025 13:38:45 -0700
Message-ID: <30624cce634cade0b030aa71a03be754abbf3da9.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225036

From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>

Reference:
	https://nvd.nist.gov/vuln/detail/CVE-2025-9375
	https://security-tracker.debian.org/tracker/CVE-2025-9375
	https://git.launchpad.net/ubuntu/+source/python-xmltodict/commit/?id=e8110a20e00d80db31d5fc9f8f4577328385d6b6

Upstream-patch:
	https://github.com/martinblech/xmltodict/commit/ecd456ab88d379514b116ef9293318b74e5ed3ee
	https://github.com/martinblech/xmltodict/commit/f98c90f071228ed73df997807298e1df4f790c33

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3-xmltodict/CVE-2025-9375-1.patch   | 111 +++++++++++
 .../python3-xmltodict/CVE-2025-9375-2.patch   | 176 ++++++++++++++++++
 .../python/python3-xmltodict_0.13.0.bb        |   2 +
 3 files changed, 289 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-1.patch
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-2.patch

diff --git a/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-1.patch b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-1.patch
new file mode 100644
index 0000000000..e8977dd2ea
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-1.patch
@@ -0,0 +1,111 @@
+From ecd456ab88d379514b116ef9293318b74e5ed3ee Mon Sep 17 00:00:00 2001
+From: Martin Blech <78768+martinblech@users.noreply.github.com>
+Date: Thu, 4 Sep 2025 17:25:39 -0700
+Subject: [PATCH] Prevent XML injection: reject '<'/'>' in element/attr names
+ (incl. @xmlns)
+
+* Add tests for tag names, attribute names, and @xmlns prefixes; confirm attr values are escaped.
+
+CVE: CVE-2025-9375
+
+Upstream-Status: Backport
+https://github.com/martinblech/xmltodict/commit/ecd456ab88d379514b116ef9293318b74e5ed3ee
+https://git.launchpad.net/ubuntu/+source/python-xmltodict/commit/?id=e8110a20e00d80db31d5fc9f8f4577328385d6b6
+
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+
+---
+ tests/test_dicttoxml.py | 32 ++++++++++++++++++++++++++++++++
+ xmltodict.py            | 20 +++++++++++++++++++-
+ 2 files changed, 51 insertions(+), 1 deletion(-)
+
+Index: python-xmltodict-0.13.0/tests/test_dicttoxml.py
+===================================================================
+--- python-xmltodict-0.13.0.orig/tests/test_dicttoxml.py
++++ python-xmltodict-0.13.0/tests/test_dicttoxml.py
+@@ -213,3 +213,35 @@ xmlns:b="http://b.com/"><x a:attr="val">
+         expected_xml = '<?xml version="1.0" encoding="utf-8"?>\n<x>false</x>'
+         xml = unparse(dict(x=False))
+         self.assertEqual(xml, expected_xml)
++
++    def test_rejects_tag_name_with_angle_brackets(self):
++        # Minimal guard: disallow '<' or '>' to prevent breaking tag context
++        with self.assertRaises(ValueError):
++            unparse({"m><tag>content</tag": "unsafe"}, full_document=False)
++
++    def test_rejects_attribute_name_with_angle_brackets(self):
++        # Now we expect bad attribute names to be rejected
++        with self.assertRaises(ValueError):
++            unparse(
++                {"a": {"@m><tag>content</tag": "unsafe", "#text": "x"}},
++                full_document=False,
++            )
++
++    def test_rejects_malicious_xmlns_prefix(self):
++        # xmlns prefixes go under @xmlns mapping; reject angle brackets in prefix
++        with self.assertRaises(ValueError):
++            unparse(
++                {
++                    "a": {
++                        "@xmlns": {"m><bad": "http://example.com/"},
++                        "#text": "x",
++                    }
++                },
++                full_document=False,
++            )
++
++    def test_attribute_values_with_angle_brackets_are_escaped(self):
++        # Attribute values should be escaped by XMLGenerator
++        xml = unparse({"a": {"@attr": "1<middle>2", "#text": "x"}}, full_document=False)
++        # The generated XML should contain escaped '<' and '>' within the attribute value
++        self.assertIn('attr="1&lt;middle&gt;2"', xml)
+Index: python-xmltodict-0.13.0/xmltodict.py
+===================================================================
+--- python-xmltodict-0.13.0.orig/xmltodict.py
++++ python-xmltodict-0.13.0/xmltodict.py
+@@ -379,6 +379,14 @@ def parse(xml_input, encoding=None, expa
+     return handler.item
+ 
+ 
++def _has_angle_brackets(value):
++    """Return True if value (a str) contains '<' or '>'.
++
++    Non-string values return False. Uses fast substring checks implemented in C.
++    """
++    return isinstance(value, str) and ("<" in value or ">" in value)
++
++
+ def _process_namespace(name, namespaces, ns_sep=':', attr_prefix='@'):
+     if not namespaces:
+         return name
+@@ -412,6 +420,9 @@ def _emit(key, value, content_handler,
+         if result is None:
+             return
+         key, value = result
++    # Minimal validation to avoid breaking out of tag context
++    if _has_angle_brackets(key):
++        raise ValueError('Invalid element name: "<" or ">" not allowed')
+     if (not hasattr(value, '__iter__')
+             or isinstance(value, _basestring)
+             or isinstance(value, dict)):
+@@ -445,12 +456,19 @@ def _emit(key, value, content_handler,
+                                         attr_prefix)
+                 if ik == '@xmlns' and isinstance(iv, dict):
+                     for k, v in iv.items():
++                        if _has_angle_brackets(k):
++                            raise ValueError(
++                                'Invalid attribute name: "<" or ">" not allowed'
++                            )
+                         attr = 'xmlns{}'.format(':{}'.format(k) if k else '')
+                         attrs[attr] = _unicode(v)
+                     continue
+                 if not isinstance(iv, _unicode):
+                     iv = _unicode(iv)
+-                attrs[ik[len(attr_prefix):]] = iv
++                attr_name = ik[len(attr_prefix) :]
++                if _has_angle_brackets(attr_name):
++                    raise ValueError('Invalid attribute name: "<" or ">" not allowed')
++                attrs[attr_name] = iv
+                 continue
+             children.append((ik, iv))
+         if pretty:
diff --git a/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-2.patch b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-2.patch
new file mode 100644
index 0000000000..1be22cff6e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-2.patch
@@ -0,0 +1,176 @@
+From f98c90f071228ed73df997807298e1df4f790c33 Mon Sep 17 00:00:00 2001
+From: Martin Blech <78768+martinblech@users.noreply.github.com>
+Date: Mon, 8 Sep 2025 11:18:33 -0700
+Subject: [PATCH] Enhance unparse() XML name validation with stricter rules and
+ tests
+
+Extend existing validation (previously only for "<" and ">") to also
+reject element, attribute, and xmlns prefix names that are non-string,
+start with "?" or "!", or contain "/", spaces, tabs, or newlines.
+Update _emit and namespace handling to use _validate_name. Add tests
+covering these new invalid name cases.
+
+CVE: CVE-2025-9375
+
+Upstream-Status: Backport
+https://github.com/martinblech/xmltodict/commit/f98c90f071228ed73df997807298e1df4f790c33
+https://git.launchpad.net/ubuntu/+source/python-xmltodict/commit/?id=e8110a20e00d80db31d5fc9f8f4577328385d6b6
+
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com
+---
+ tests/test_dicttoxml.py | 60 +++++++++++++++++++++++++++++++++++++++++
+ xmltodict.py            | 48 ++++++++++++++++++++++++++-------
+ 2 files changed, 99 insertions(+), 9 deletions(-)
+
+Index: python-xmltodict-0.13.0/tests/test_dicttoxml.py
+===================================================================
+--- python-xmltodict-0.13.0.orig/tests/test_dicttoxml.py
++++ python-xmltodict-0.13.0/tests/test_dicttoxml.py
+@@ -245,3 +245,63 @@ xmlns:b="http://b.com/"><x a:attr="val">
+         xml = unparse({"a": {"@attr": "1<middle>2", "#text": "x"}}, full_document=False)
+         # The generated XML should contain escaped '<' and '>' within the attribute value
+         self.assertIn('attr="1&lt;middle&gt;2"', xml)
++
++    def test_rejects_tag_name_starting_with_question(self):
++        with self.assertRaises(ValueError):
++            unparse({"?pi": "data"}, full_document=False)
++
++    def test_rejects_tag_name_starting_with_bang(self):
++        with self.assertRaises(ValueError):
++            unparse({"!decl": "data"}, full_document=False)
++
++    def test_rejects_attribute_name_starting_with_question(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@?weird": "x"}}, full_document=False)
++
++    def test_rejects_attribute_name_starting_with_bang(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@!weird": "x"}}, full_document=False)
++
++    def test_rejects_xmlns_prefix_starting_with_question_or_bang(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"?p": "http://e/"}}}, full_document=False)
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"!p": "http://e/"}}}, full_document=False)
++
++    def test_rejects_non_string_names(self):
++        class Weird:
++            def __str__(self):
++                return "bad>name"
++
++        # Non-string element key
++        with self.assertRaises(ValueError):
++            unparse({Weird(): "x"}, full_document=False)
++        # Non-string attribute key
++        with self.assertRaises(ValueError):
++            unparse({"a": {Weird(): "x"}}, full_document=False)
++
++    def test_rejects_tag_name_with_slash(self):
++        with self.assertRaises(ValueError):
++            unparse({"bad/name": "x"}, full_document=False)
++
++    def test_rejects_tag_name_with_whitespace(self):
++        for name in ["bad name", "bad\tname", "bad\nname"]:
++            with self.assertRaises(ValueError):
++                unparse({name: "x"}, full_document=False)
++
++    def test_rejects_attribute_name_with_slash(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@bad/name": "x"}}, full_document=False)
++
++    def test_rejects_attribute_name_with_whitespace(self):
++        for name in ["@bad name", "@bad\tname", "@bad\nname"]:
++            with self.assertRaises(ValueError):
++                unparse({"a": {name: "x"}}, full_document=False)
++
++    def test_rejects_xmlns_prefix_with_slash_or_whitespace(self):
++        # Slash
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"bad/prefix": "http://e/"}}}, full_document=False)
++        # Whitespace
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"bad prefix": "http://e/"}}}, full_document=False)
+Index: python-xmltodict-0.13.0/xmltodict.py
+===================================================================
+--- python-xmltodict-0.13.0.orig/xmltodict.py
++++ python-xmltodict-0.13.0/xmltodict.py
+@@ -387,7 +387,42 @@ def _has_angle_brackets(value):
+     return isinstance(value, str) and ("<" in value or ">" in value)
+ 
+ 
++def _has_invalid_name_chars(value):
++    """Return True if value (a str) contains any disallowed name characters.
++
++    Disallowed: '<', '>', '/', or any whitespace character.
++    Non-string values return False.
++    """
++    if not isinstance(value, str):
++        return False
++    if "<" in value or ">" in value or "/" in value:
++        return True
++    # Check for any whitespace (spaces, tabs, newlines, etc.)
++    return any(ch.isspace() for ch in value)
++
++
++def _validate_name(value, kind):
++    """Validate an element/attribute name for XML safety.
++
++    Raises ValueError with a specific reason when invalid.
++
++    kind: 'element' or 'attribute' (used in error messages)
++    """
++    if not isinstance(value, str):
++        raise ValueError(f"{kind} name must be a string")
++    if value.startswith("?") or value.startswith("!"):
++        raise ValueError(f'Invalid {kind} name: cannot start with "?" or "!"')
++    if "<" in value or ">" in value:
++        raise ValueError(f'Invalid {kind} name: "<" or ">" not allowed')
++    if "/" in value:
++        raise ValueError(f'Invalid {kind} name: "/" not allowed')
++    if any(ch.isspace() for ch in value):
++        raise ValueError(f"Invalid {kind} name: whitespace not allowed")
++
++
+ def _process_namespace(name, namespaces, ns_sep=':', attr_prefix='@'):
++    if not isinstance(name, str):
++        return name
+     if not namespaces:
+         return name
+     try:
+@@ -421,8 +456,7 @@ def _emit(key, value, content_handler,
+             return
+         key, value = result
+     # Minimal validation to avoid breaking out of tag context
+-    if _has_angle_brackets(key):
+-        raise ValueError('Invalid element name: "<" or ">" not allowed')
++    _validate_name(key, "element")
+     if (not hasattr(value, '__iter__')
+             or isinstance(value, _basestring)
+             or isinstance(value, dict)):
+@@ -451,23 +485,19 @@ def _emit(key, value, content_handler,
+             if ik == cdata_key:
+                 cdata = iv
+                 continue
+-            if ik.startswith(attr_prefix):
++            if isinstance(ik, str) and ik.startswith(attr_prefix):
+                 ik = _process_namespace(ik, namespaces, namespace_separator,
+                                         attr_prefix)
+                 if ik == '@xmlns' and isinstance(iv, dict):
+                     for k, v in iv.items():
+-                        if _has_angle_brackets(k):
+-                            raise ValueError(
+-                                'Invalid attribute name: "<" or ">" not allowed'
+-                            )
++                        _validate_name(k, "attribute")
+                         attr = 'xmlns{}'.format(':{}'.format(k) if k else '')
+                         attrs[attr] = _unicode(v)
+                     continue
+                 if not isinstance(iv, _unicode):
+                     iv = _unicode(iv)
+                 attr_name = ik[len(attr_prefix) :]
+-                if _has_angle_brackets(attr_name):
+-                    raise ValueError('Invalid attribute name: "<" or ">" not allowed')
++                _validate_name(attr_name, "attribute")
+                 attrs[attr_name] = iv
+                 continue
+             children.append((ik, iv))
diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb b/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
index e8e275647c..9a308a29d2 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
@@ -13,6 +13,8 @@ inherit pypi setuptools3 ptest
 
 SRC_URI += " \
 	file://run-ptest \
+	file://CVE-2025-9375-1.patch \
+	file://CVE-2025-9375-2.patch \
 "
 
 RDEPENDS:${PN} += " \
-- 
2.43.0


