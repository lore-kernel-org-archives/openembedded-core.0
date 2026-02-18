Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70672E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 14:43:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13186.1771425778551560964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 06:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FU9tBzvG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4327790c4e9so4006599f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 06:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771425776; x=1772030576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aiwrUpgKRgirmP1//irKI8oSZMgziV2GzvMZFn4iqGA=;
        b=FU9tBzvGG99M04U5tGqNC3gHBE4UP/TmlZG0hvQ9JKK121MCUPr3O0+3HKZaFq8aV4
         uQFj6aLs8/Xcqv/Ipv0du4XLZyBqSFzR3XYLQOlRjlndZ0XlYaVJLCz3ore2xbi5tEyQ
         h12omT3e5MmrPbq4V0WbMvJoYglR4ohLG1/Wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771425776; x=1772030576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiwrUpgKRgirmP1//irKI8oSZMgziV2GzvMZFn4iqGA=;
        b=IgknI1DnNytrJieBPWk61dMI2sai1mgYgQEdJsukJY/WwbHQqLy0nkjYgLvKog8BWF
         FW165tkqOhSWrvNIEPOOE2A7CYJvrt9dZoaiiJrr9rK5rTh2YJ9ILvuyJj5+mETQw0cY
         hdg2c8jgO5iAFG7oFTajWFM87jPxLoWllYT+UNYnfVezxg0Wa/Xfjuptqvdm0JzrT1np
         Vwc6bceUH4VCxhmXLaKnEI4AN2s6esGaoKBeSsnYh2ugy79bFbiqEmWEM7ikhoW2lcAt
         dz/EzD7w6RX11F/eR1mDFAk+FNvYWiCALSohdX0L3EywP8m295ETlwUjybM9z3YL0YrF
         UCgA==
X-Gm-Message-State: AOJu0YwrS5QaGEkh1HnjGBB6srpyV5aEktbFMDYUp8jj22T624EMuUc/
	CpQ/IqAl992MvP8HWYjN4ugGf7zw2ku07zyfpJ2Y0ze/jtsNEYTo+q+onTjIk7YjoGeqkJnz7H4
	pJTCl49U=
X-Gm-Gg: AZuq6aLVUdZvPCoEkYbSRjD8gh/83UvwqrVTlqQ4itRWJJRb22xjrgZFUFvUxs+iSNg
	HmJrNB4i7oDOVQ6XI9SIYq48HFHl3FBhJ/ysAJhkSTfhTWS0yWYlBdejZGrUxNFzH4iTaxxG/II
	3oRQg9t8AtDvF2gAmasAV29OuFb6UJb9V0AToa1zpZ+y7lBscIXPgf5GtX+1IP4O/b4F7VJISBY
	R5YtRo9hcIUvofT6jzeSVtJrCJj4tKmptOHjfrwzuvS4MK+8Tm+p2j/ajP1dEVKgt9r6OC2j3Yl
	fVow1cb+STeKVUGZ5V4hiuj6cwh7C6YSMIVKEgk7zTayZPi1ibeNHmeUNADhlmRQeetrSCEh/Ug
	Rf/TG3P5ao1ihbAZtNvMJ6L0iSrcyq+tAEnx42el3edpxTdzQW0GurtbYnfQAtz3yayi26I+MvE
	fhszf0Pn2bY8xALjarViRpjjUoFyRS9JAbufUPq/ck55pFVI7IRvs=
X-Received: by 2002:a05:6000:2310:b0:436:2fef:fe5c with SMTP id ffacd0b85a97d-43796ac2012mr32390957f8f.20.1771425776138;
        Wed, 18 Feb 2026 06:42:56 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9512:ec90:a2a2:6501])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm40733893f8f.34.2026.02.18.06.42.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 06:42:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] native: Replace e.data with d
Date: Wed, 18 Feb 2026 14:42:54 +0000
Message-ID: <20260218144254.2680160-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 14:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231309

e.data was deprecated a while ago, replace the remaining references with
d, they are the same thing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/native.bbclass | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 98466b1902d..65b5b97c690 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -122,10 +122,10 @@ INHIBIT_SYSROOT_STRIP ??= ""
 
 python native_virtclass_handler () {
     import re
-    pn = e.data.getVar("PN")
+    pn = d.getVar("PN")
     if not pn.endswith("-native"):
         return
-    bpn = e.data.getVar("BPN")
+    bpn = d.getVar("BPN")
 
     # Set features here to prevent appends and distro features backfill
     # from modifying native distro features
@@ -135,7 +135,7 @@ python native_virtclass_handler () {
     d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
     d.setVar("DISTRO_FEATURES_BACKFILL", "")
 
-    classextend = e.data.getVar('BBCLASSEXTEND') or ""
+    classextend = d.getVar('BBCLASSEXTEND') or ""
     if "native" not in classextend:
         return
 
@@ -157,11 +157,11 @@ python native_virtclass_handler () {
     for pkg in re.split(r"\${@(?:{.*?}|.)+?}|\s", d.getVar("PACKAGES", False)):
         if not pkg:
             continue
-        map_dependencies("RDEPENDS", e.data, pkg)
-        map_dependencies("RRECOMMENDS", e.data, pkg)
-        map_dependencies("RSUGGESTS", e.data, pkg)
-        map_dependencies("RPROVIDES", e.data, pkg)
-        map_dependencies("RREPLACES", e.data, pkg)
+        map_dependencies("RDEPENDS", d, pkg)
+        map_dependencies("RRECOMMENDS", d, pkg)
+        map_dependencies("RSUGGESTS", d, pkg)
+        map_dependencies("RPROVIDES", d, pkg)
+        map_dependencies("RREPLACES", d, pkg)
 
     d.setVarFilter("PACKAGES", "native_filter(val, '" + pn + "', '" + bpn + "')")
     d.setVarFilter("PACKAGES_DYNAMIC", "native_filter(val, '" + pn + "', '" + bpn + "', regex=True)")

