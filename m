Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02016CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:52:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.41737.1760356369834310201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 04:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oTAky/lR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2381f1bef8=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59D4nt7q1261366
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jhzrwQATSA58sAs2jGLG
	a4PW2TvPjfsUN2AGrcRF35Y=; b=oTAky/lR3Ta9A4yCqBB0Ve0lPHEQVKWiP9N7
	esS1fH+wHcvH8ZRk+XF0q+R/wwgiGrCQlvJmr+PbsSNJWvQfqXJ9RIIq+kKtQkXB
	uwj5iZNPN6c/8cf8bBKbXt+FQpFGO0WDO9ZH80flHNZGpqvuOtEPaKkqPNGHi1Xe
	sOzs6YOJdGd03+hDDR08AjV4KLJ5+mwOuCh84xPbEeTMSn06qhdtS7qZvx9oVqY6
	6EyskFh67hE/Kx7C9P+aus0dxl6lYBRQzHtGTf24oMLOd8MS1jx0QfPyRbjYMxl3
	klzz5LuSpvDI1k/gfOPRz8akz0/eFz2RbyL12tsmaM1Bf0hFCA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewhsrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:52:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 13 Oct 2025 04:52:47 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 13 Oct 2025 04:52:46 -0700
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH V2 1/1] python3-xmltodict: fix CVE-2025-9375
Date: Mon, 13 Oct 2025 17:22:44 +0530
Message-ID: <20251013115244.2276644-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PCKYFttDcqxqNULjb4ml8wdSf7fPW398
X-Proofpoint-ORIG-GUID: PCKYFttDcqxqNULjb4ml8wdSf7fPW398
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA1MyBTYWx0ZWRfXxPohEI++p5rH
 0WezKxbcit9YmbducjsuzLvkIRjoVoBSC1owHnqDpWJkNI+DDtLLX5Jgm0tNsehJfjVWC0B19Hu
 uEa791O5BuAdDIGWWZbHFvCi6n/0dwq7CeTUm4mtaR20+WWzmB5GeH6mVzoRVwJg4xIAmZQy8R4
 I47FkaEkOlnivctIDLtDpgAXI56lzixrvl/SsScIsVYIJ7ZpztyCfb0Np6WSb9LYRQuEQIV8GnQ
 cvPS3+oaELY5cpugeg96XjD67eofmT6Bo91GeQrnutZZlNWF1HxBkLAPnjGew4rEzNV1z2rJRUA
 jShkx8QzCmapGci9z/DJu5BTlqOtEQn05O0R0S4z90C8pn+zJkNGMEl1B7mKHFbp2KFsfmvOJ0I
 qud5DuFTz6tucORDBYtE1dK29tnw6A==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ece810 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=danhDmx_AAAA:8
 a=NEAV23lmAAAA:8 a=yEquWHxyAAAA:8 a=A1X0JdhQAAAA:8 a=t7CeM3EgAAAA:8
 a=d8oaZizm7QLjo4qtjSwA:9 a=s5zKW874KtQA:10 a=_j3XSMEICZ-j_p4bQif0:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Soy3cZ2v3rD3IzUh-QDm:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510130053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224779

Reference:
	https://nvd.nist.gov/vuln/detail/CVE-2025-9375
	https://security-tracker.debian.org/tracker/CVE-2025-9375
	https://git.launchpad.net/ubuntu/+source/python-xmltodict/commit/?id=e8110a20e00d80db31d5fc9f8f4577328385d6b6

Upstream-patch:
	https://github.com/martinblech/xmltodict/commit/ecd456ab88d379514b116ef9293318b74e5ed3ee
	https://github.com/martinblech/xmltodict/commit/f98c90f071228ed73df997807298e1df4f790c33

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
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
2.44.3


