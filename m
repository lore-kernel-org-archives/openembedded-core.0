Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6F1CAC5B0
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:58:10 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.web10.23816.1758743882921940488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=pcDPPkc3;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=nisJQd3A;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 44A221400087;
	Wed, 24 Sep 2025 15:58:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 24 Sep 2025 15:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758743882;
	 x=1758830282; bh=alAyGDrm/1awlEcQIArQ3lyD+H+TpGXrO0n5pa+hrM4=; b=
	pcDPPkc36d2c/WlLyphOU4wStS++iz0lE/ULECysRy4WedZFnFoJIVNg21oKFxIh
	N2+BeSvdpWuQtyDJVrpyOVsSsEBacCmM+MQXYZzF34JtSebhbXDeEn/bXTrcuw2E
	ErqQ/sfzLKNtIGxNVbcGozghxk3WVnXixWu6NuV67+tqJ7vN5DiCH4N2Fy6hiPYP
	aw6lc1xXGIYaoba7qMM1BQl3/a8YD6Mtzv/36aDo41AqyJcgX5sofu81j/LDP1qg
	+QDhamWzF8F6C0gUil6Bv5n1ivCJOgGuGEZcGWO8/K54V3+1Kj+HFZSvAtAf4t2i
	+SMZS6MrLUlGcvGNYz4hqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758743882; x=
	1758830282; bh=alAyGDrm/1awlEcQIArQ3lyD+H+TpGXrO0n5pa+hrM4=; b=n
	isJQd3AeSuT8kd1Tm1Dtku8W7at6QDztY4oBWZm8j64ASfvUTp1to+ydDSAz4YXz
	7sfNAI2tTY50BtoxrVRDPYpYbGnG6aWymLyvSeQlJdFbcy/JFcJQcwFHkjmGvMGd
	gOVwuECCyDW/E3vmFRX6GsbvlCeCY7ZhXZp1Ljdv3zYHajLGcB4dfdrOXlHjZYkL
	T+G7qQUnOl8pOLFhct1VpMbRIS/Zh1xTp7abgGdJIe0viOGCVHyhHFEbL0IK3RcM
	ES1TOuLZIiNbJvX/HHI8zlL/M3zhRUQPX9Gj2LA0Hp+dCJmhJAXR7R7aZP2e/bQ2
	8qwXKHvAzb4kLKHTrlHOw==
X-ME-Sender: <xms:SU3UaBUWBKrhz8UWEco9cFe7eW2ThdkMRhnoadK3ndqS3od7XRbpCA>
    <xme:SU3UaE1NbtVD5ej4JqRRnZt2dI0Ba2QRx9HnSAIEyEn-O8PqUCn1Z8MYNlPDxeQOO
    4K3uwNll0ozEF2a9xYfWubja2GV4z2cYlkztVXQboHE_H2HvGnPF9E>
X-ME-Received: <xmr:SU3UaG2bMOvHhBzcRKX6R7B8gfJPWAMftZvMrQvDT9YaiI5v8TvPpqN-qYvYpF6-nlfgpQFl1O4XL6JA0oZR3zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeigeehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epjeduvefflefhfefhudejtdfhvdegjefgieeggfeuhfehffekhfdvtdejudffveejnecu
    ffhomhgrihhnpehsthgrtghkohhvvghrfhhlohifrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdgu
    vghvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    htghgrmhgslhhinhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepohhpvghnvghm
    sggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpd
    hrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:SU3UaP-WMwjp8Gd4G60XqtLqWjjlkxr2_0TS5xxycapGZC3fh0EkHg>
    <xmx:SU3UaL3lRTc5V-XcaimbV5lRLaL1RvX6IQ8FS-S4pNHAQi7fMheBew>
    <xmx:SU3UaE-pOXOaCYSmjP4K3qr8x4C86HfQK6BxWHpDallt31WNV6qG7A>
    <xmx:SU3UaDvRrNcKbAaqiqGVH-ex2QWG4qi3qFMA00nYGu-O7ksFyj5ZkA>
    <xmx:Sk3UaBo13x_QvO2yWMRtKPprzbxK2WeJuBTQRhxG00Uxm4f2lHs5ixao>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Sep 2025 15:58:01 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 24 Sep 2025 20:57:47 +0100
Subject: [PATCH 2/2] patchtest: Use raw strings for regex patterns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-minor-fixes-v1-2-affc85657a66@pbarker.dev>
References: <20250924-minor-fixes-v1-0-affc85657a66@pbarker.dev>
In-Reply-To: <20250924-minor-fixes-v1-0-affc85657a66@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4415; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=xIqYNcenqwZlKnLMFyZ0m/fPQfOAvn3GHYJhPqaMlP0=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWRc8XUXv9q0tffb629n0mu/G+up5kn1LX+5PXtv+qk0D
 Ym8s4ZeHaUsDGJcDLJiiiybe77ef9rryJsRcksBZg4rE8gQBi5OAZjIzW0M/5Q3nnj3a55abUXB
 52Q3YY7mSmahmQtyjgm7X9GMVtybcoOR4cAjscYL1n4zw71vVpSxeh68/9dB5WK1h/JT36BdV1g
 TmAE=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 19:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223985

This fixes several 'SyntaxWarning: invalid escape sequence' messages
printed when running patchtest.

Cc: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/patchtest/patchtest_patterns.py | 20 ++++++++++----------
 meta/lib/patchtest/tests/test_mbox.py    |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/lib/patchtest/patchtest_patterns.py b/meta/lib/patchtest/patchtest_patterns.py
index 655ecfd049191b9b5e1990c31ad1bb7c96811fa6..1a8db92aa5372c481164604c0dee2c2367c9fd87 100644
--- a/meta/lib/patchtest/patchtest_patterns.py
+++ b/meta/lib/patchtest/patchtest_patterns.py
@@ -33,7 +33,7 @@ closed   = 'CLOSED'
 lictag_re  = pyparsing.AtLineStart("License-Update:")
 lic_chksum_added = pyparsing.AtLineStart("+" + metadata_chksum)
 lic_chksum_removed = pyparsing.AtLineStart("-" + metadata_chksum)
-add_mark = pyparsing.Regex('\\+ ')
+add_mark = pyparsing.Regex(r'\+ ')
 patch_max_line_length = 200
 metadata_src_uri = "SRC_URI"
 metadata_summary = "SUMMARY"
@@ -51,20 +51,20 @@ auh_email = 'auh@yoctoproject.org'
 
 invalid_submitters = [pyparsing.Regex("^Upgrade Helper.+"),
             pyparsing.Regex(auh_email),
-            pyparsing.Regex("uh@not\.set"),
-            pyparsing.Regex("\S+@example\.com")]
+            pyparsing.Regex(r"uh@not\.set"),
+            pyparsing.Regex(r"\S+@example\.com")]
 
-mbox_bugzilla = pyparsing.Regex('\[\s?YOCTO.*\]')
-mbox_bugzilla_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
-mbox_revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
+mbox_bugzilla = pyparsing.Regex(r'\[\s?YOCTO.*\]')
+mbox_bugzilla_validation = pyparsing.Regex(r'\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
+mbox_revert_shortlog_regex = pyparsing.Regex(r'Revert\s+".*"')
 mbox_shortlog_maxlength = 90
 # based on https://stackoverflow.com/questions/30281026/regex-parsing-github-usernames-javascript
-mbox_github_username = pyparsing.Regex('\B(?<!\${)@([a-z0-9](?:-(?=[a-z0-9])|[a-z0-9]){0,38}(?<=[a-z0-9]))')
+mbox_github_username = pyparsing.Regex(r'\B(?<!\${)@([a-z0-9](?:-(?=[a-z0-9])|[a-z0-9]){0,38}(?<=[a-z0-9]))')
 
 # patch
 
-cve = pyparsing.Regex("CVE\-\d{4}\-\d+")
-cve_payload_tag = pyparsing.Regex("\+CVE:(\s+CVE\-\d{4}\-\d+)+")
+cve = pyparsing.Regex(r"CVE\-\d{4}\-\d+")
+cve_payload_tag = pyparsing.Regex(r"\+CVE:(\s+CVE\-\d{4}\-\d+)+")
 upstream_status_regex = pyparsing.AtLineStart("+" + "Upstream-Status")
 
 # shortlog
@@ -78,7 +78,7 @@ shortlog = line_start + shortlog_target + colon + shortlog_summary + line_end
 email_pattern = pyparsing.Regex(r"(?P<user>[A-Za-z0-9._%+-]+)@(?P<hostname>[A-Za-z0-9.-]+)\.(?P<domain>[A-Za-z]{2,})")
 
 signed_off_by_prefix = pyparsing.Literal("Signed-off-by:")
-signed_off_by_name = pyparsing.Regex('\S+.*(?= <)')
+signed_off_by_name = pyparsing.Regex(r'\S+.*(?= <)')
 signed_off_by_email = lessthan + email_pattern + greaterthan
 signed_off_by = pyparsing.AtLineStart(signed_off_by_prefix + signed_off_by_name + signed_off_by_email)
 patch_signed_off_by = pyparsing.AtLineStart("+" + signed_off_by_prefix + signed_off_by_name + signed_off_by_email)
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index 714c9b30af5c7ad705079a67903e038354de0195..5cf02af7bd5e761ed3f08254897861ec401841b8 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -71,7 +71,7 @@ class TestMbox(base.Base):
     def test_shortlog_length(self):
         for commit in self.commits:
             # no reason to re-check on revert shortlogs
-            shortlog = re.sub('^(\[.*?\])+ ', '', commit.shortlog)
+            shortlog = re.sub(r'^(\[.*?\])+ ', '', commit.shortlog)
             if shortlog.startswith('Revert "'):
                 continue
             l = len(shortlog)
@@ -109,7 +109,7 @@ class TestMbox(base.Base):
 
         # a meta project may be indicted in the message subject, if this is the case, just fail
         # TODO: there may be other project with no-meta prefix, we also need to detect these
-        project_regex = pyparsing.Regex("\[(?P<project>meta-.+)\]")
+        project_regex = pyparsing.Regex(r"\[(?P<project>meta-.+)\]")
         for commit in self.commits:
             match = project_regex.search_string(commit.subject)
             if match:

-- 
2.51.0


