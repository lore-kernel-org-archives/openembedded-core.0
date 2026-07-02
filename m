Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B76C44502
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 15:22:29 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71772.1783005747949964092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 08:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=O4ncmTpK;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c0cea8883so5877361cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783005747; x=1783610547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23PeNl+BtZJMAJKTvvQbmucnGGqLskt4uYBC8lFe+4Y=;
        b=O4ncmTpKqelQbmf4JHEw4ANadGB5rYJ73kjmxQcwyZqeLmNwEGEopQm1ScBYGpdytp
         SLP/R632d6Yu7KlM3LOMuUWPSwsuliOmSTu1uFAJJ3e38ZVr8CKg1xMoul9PcAod97as
         IGl9Z1AXeD8c5UimdncSmERk3S8gFMhzr875rFDgeJ/hp5QGhg2nt9ob1vbnPmIN+3Dh
         RWXwnhKra6WCFR1jM2U0mmPCnEFQK7ceqSwFZSzFyFuUDrWpX2xKZyMkw1WRPXGNiWv2
         gleFC4GnFQ1cOjg+P0oEdvJJ03mc/gHB7K9efQuFiZ5FGWMd1YXwUaf5o3fOEW4XhIT1
         0k3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005747; x=1783610547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=23PeNl+BtZJMAJKTvvQbmucnGGqLskt4uYBC8lFe+4Y=;
        b=VukLSWR98w63dfHHMjHUTjB4qEKxsuBLkiJBxRCUzINAGaqsX8GjbQMdbvhvwr4Z2v
         3xJ/5I3mQs6ZEZve6aLcbed9Rq+wJ25xP8+we8lEvEH+w59RJIyg7V3UmPrm1rEo40CZ
         eusgULjZ18jX27yDPq6R/+kDJzFc2FQVJU9EPRx/QDyqik5CaLAS+UeAiK0Rmq9bACo6
         II/pHXuzhjLNICrJu8RIp1PEjHtHOTCztnfVNiuyPDB2YLGbGC5nkS5fzyY9v+ZXu9/M
         oKv8VR930nI3J3pm4MGIGeoHdgH3Sb0h1w2SqRfrplc1kf9zvkhdmsIENAVoxoPaIqod
         wOTA==
X-Gm-Message-State: AOJu0YwbWRj8+VsTgWT1r7z5x0KZmppd7vV5bvsxj+fGkGLvDUcJUtuA
	tRq2yT8UeIU9QVP+WFSII3WZv1vuUxOVk2XoNFyyovObcpysbdRtlZQHVV6VS7+bpdagSGP2V8n
	tJARq7qZ+PA==
X-Gm-Gg: AfdE7cm0yk6WLSMUMM2E7mQLnWoPBCsTkPLLWWTpy2DVU500eh7CJ4DDU7lB/GjbuqZ
	Gha6Fq1mgd3uRAB1VR8iErPYDtPTDj7X7DRu30v/f2X4gaTgaMPjyCufCQ/khEeulheLz2ZsdDY
	8uz0MWyPF0eUrQgxT2fNGBizGEp+2cDnThHztKdlf4uVQythxCaXfIkYIMStGIceC6KZgyYCBOD
	Yl6jtKOK4vtni76xUc1xfgXt1XRmIMj8V86gp0UD60ROtdssfpVi/Em0rQnGtamOZl40E9sReLM
	vci910vpzHRY1LlvuAtU7FXilK4MO849efy41+BgxkdboZ8HzdlJjuPwf1KEXBHcSetOAMAvAwj
	B8Hq5YdnJyu9ihi9adbcG5CP94OuRD725ZR8LH21LlpBTWMFFyjHIMyo1LgOqmWTbODYrzYrGVP
	SolExQ9jVwliaC/Lyr
X-Received: by 2002:a05:622a:1823:b0:50b:29da:ec58 with SMTP id d75a77b69052e-51c3c05863dmr4873921cf.8.1783005746731;
        Thu, 02 Jul 2026 08:22:26 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c30c654b7sm16204441cf.29.2026.07.02.08.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:22:24 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 4/6] patchtest: tests: test_patch.py: simplify source patch and upstream status checking
Date: Thu,  2 Jul 2026 11:22:11 -0400
Message-ID: <20260702152213.1439717-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702152213.1439717-1-tgamblin@baylibre.com>
References: <20260702152213.1439717-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 15:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240062

- Only check for new patches once in setUp(), rather than in each
  function
- Fix misleading "CVE" messages when we're really looking for any new
  source patches which are added
- Move patterns for checking patch upstream status into the relevant
  test

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_patch.py | 37 +++++++++-----------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index 3b33b5a199..34e580500b 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -28,20 +28,12 @@ class TestPatch(base.Base):
     def setUp(self):
         if self.unidiff_parse_error:
             self.skip('Parse error %s' % self.unidiff_parse_error)
-
-        self.valid_status = ", ".join(patchtest_patterns.upstream_status_nonliteral_valid_status)
-        self.standard_format = "Upstream-Status: <Valid status>"
-
-        # we are just interested in series that introduce CVE patches, thus discard other
-        # possibilities: modification to current CVEs, patch directly introduced into the
-        # recipe, upgrades already including the CVE, etc.
-        new_cves = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
-        if not new_cves:
-            self.skip('No new CVE patches introduced')
+        if not TestPatch.newpatches:
+            self.skip('No new source patches introduced')
 
     def test_upstream_status_presence_format(self):
-        if not TestPatch.newpatches:
-            self.skip("There are no new software patches, no reason to test Upstream-Status presence/format")
+        valid_status = ", ".join(patchtest_patterns.upstream_status_nonliteral_valid_status)
+        standard_format = "Upstream-Status: <Valid status>"
 
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
@@ -71,16 +63,16 @@ class TestPatch(base.Base):
                         'Upstream-Status is present only after the patch scissors. '
                         "It must be placed in the patch header before the scissors line.",
                         data=[
-                            ("Standard format", self.standard_format),
-                            ("Valid status", self.valid_status),
+                            ("Standard format", standard_format),
+                            ("Valid status", valid_status),
                         ],
                     )
                 else:
                     self.fail(
                         "Added patch file is missing Upstream-Status: <Valid status> in the commit message",
                         data=[
-                            ("Standard format", self.standard_format),
-                            ("Valid status", self.valid_status),
+                            ("Standard format", standard_format),
+                            ("Valid status", valid_status),
                         ],
                     )
 
@@ -97,8 +89,8 @@ class TestPatch(base.Base):
                         "but was found afterwards.",
                         data=[
                             ("Current", line.lstrip("+")),
-                            ("Standard format", self.standard_format),
-                            ("Valid status", self.valid_status),
+                            ("Standard format", standard_format),
+                            ("Valid status", valid_status),
                         ],
                     )
 
@@ -142,15 +134,12 @@ class TestPatch(base.Base):
                             "Upstream-Status is in incorrect format",
                             data=[
                                 ("Current", pe.pstr),
-                                ("Standard format", self.standard_format),
-                                ("Valid status", self.valid_status),
+                                ("Standard format", standard_format),
+                                ("Valid status", valid_status),
                             ],
                         )
 
     def test_signed_off_by_presence(self):
-        if not TestPatch.newpatches:
-            self.skip("There are no new software patches, no reason to test %s presence" % PatchSignedOffBy.mark)
-
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
             for line in payload.splitlines():
@@ -162,7 +151,7 @@ class TestPatch(base.Base):
                 self.fail('A patch file has been added without a Signed-off-by tag: \'%s\'' % os.path.basename(newpatch.path))
 
     def test_cve_tag_format(self):
-        for commit in TestPatch.commits:
+        for commit in self.commits:
             if patchtest_patterns.cve.search_string(
                 commit.shortlog
             ) or patchtest_patterns.cve.search_string(commit.commit_message):
-- 
2.54.0


