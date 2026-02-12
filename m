Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16A5EE3697
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 15:35:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47833.1770909721528151970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 07:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=C9GoiVWK;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.128.42, mailfrom: alba@thehoodiefirm.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-482f2599980so36776305e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 07:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1770909720; x=1771514520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLZoEJSRB4Dg6Urq08lfRxIMepztcBuBDXbZhwpPdyA=;
        b=C9GoiVWKREkC/Dj5Ad0kindjSKSdaQFOQcGs271PwLuLBAKF8JX52a5ERZf2ILvCWn
         oK261FoybnDp310DkRd9hUP8RDhpsloicxDNOEg1qnc6K8h4/txwtPLWBVYwR28lNMdV
         g5M8xeLhR788pGpZTECprRq0xx7ZGRag2ZpLoeLvFK4FAhIByACCR6CeSPWFIkt1eLGt
         XW6LYeln/XL61wSftdGVfu5DevOPfu5jL6KeWPbQ1IueMk51f2VydtGAlflIVWd6NQcr
         ZRPer3lfGiGHrCKWJqEBkHoFJcEv/ZYVTMoZAhwJn9RbYgsnun4qwLRwFbTJqWlN5Gt5
         FvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770909720; x=1771514520;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YLZoEJSRB4Dg6Urq08lfRxIMepztcBuBDXbZhwpPdyA=;
        b=SKdEAkLpTKd70VxPU1BQ6fgzPDkBVMT1+Sbx60AmNBugXoXPXnnEcDahnMxTkeTE2Q
         ptV1syZxSX6tPkeVituhA1LVvrT3N9V9YC9+vytlrADNu+6i2MO9UCX7tBkHvHOVD23q
         ASUNAD8up6YdWDbrL4YMfTrHs6i0wgMPURfkcuYId/uuU4wB4C/lRbz+HJaQ70dsltzS
         n5lzed+5E7rY095p9SI7BiJA6A7Ze61LvmN7AIl/8A1maWR/jSJuY7Fz7+gSMllIhY9w
         HDH05+wFY7hlRPsaZko/3Jp+47NiPRStKJP+F4Jt0JtR1p+0fbWRQ/ocl1Ofyeh9ltA1
         hDAA==
X-Gm-Message-State: AOJu0YwTqHnqYltm0ZJ31RAOjIYfQw+jixrFoSO13EVHOxPbPGbPPdbV
	XxiYVkKRWFTL3ED8FXin7E2vpWVRSSmzGUAFlUGZGp2XWXSRh6zZ0QDOApgbd6HY4F1U7zpPYQC
	32RaweJ8=
X-Gm-Gg: AZuq6aL8IoYBSgsIIVFur0W3JxtPV2HsHuHDFlC2FSuN13lNScLEL0Zk33Qk9tKgOpL
	rktp6XEdvsjkF4NNu3DhPI/dAuzOEohFOhFFCxZPAcjE6BTMOK247Cw2ui/Ct2GS3BGP9Ie/tZM
	DuPzXxBwy3iV2VR1shSm9SGNQ4N7uU/8ZP4iO+K8ZZm/RR4879KfQXflLhKZuJRoiKXwSuEhcpP
	JvPtZ42hR7ndyPBOKCcHX8ELGegLRX0WQAeKzV8868E65YbJVSe8rHOQroa80ayqsCN2k+HoFwl
	0RmPmSo9nR2UlsJdw2lzwINlbhNtgvg1TnjI1I+OrW2JEUrLYv9NoQGGYNd/TL4vm5nlN9+sVeQ
	5PDa+JTi16hEOfkcFFMLKbflvPhk8O35LJE7MoQnbCfLIfEVZ3HakoXFTT/zMnu8NFMyqSBYRc8
	o0tAUuJ67zVk7Up3ly1UFqa1TRtg+5zsl3dl4y6zcXWehICm8b0wLfJEyWiGz0F7Wqi8A1rr8ZR
	bBCFZZWS6dzkNOOjrEpLHYrs88=
X-Received: by 2002:a05:600c:8b65:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-483670fbe23mr37629095e9.4.1770909719590;
        Thu, 12 Feb 2026 07:21:59 -0800 (PST)
Received: from localhost.localdomain (253.red-83-57-139.dynamicip.rima-tde.net. [83.57.139.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836131d506sm40853105e9.32.2026.02.12.07.21.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Feb 2026 07:21:59 -0800 (PST)
Sender: =?UTF-8?B?QWxiYSBIZXJyZXLDrWFzIFJhbcOtcmV6?= <alba@thehoodiefirm.com>
From: =?UTF-8?B?QWxiYSBIZXJyZXLDrWFz?= <alba@thehoodiefirm.com>
X-Google-Original-From: Alba Herrerias <albaherreriasdev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ross.Burton@arm.com,
	Alex Feyerke <alex@neighbourhood.ie>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBidWlsZF9wZXJmOiBkb27igJl0IGJha2UgY29tbWl0IGFubm90YXRpb25zIGludG8gaHRtbCwgYWx3YXlzIGZldGNoIGR5bmFtaWNhbGx5Lg==?=
Date: Thu, 12 Feb 2026 15:20:23 +0000
Message-Id: <20260212152023.30604-1-albaherreriasdev@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <F8985EDB-2808-485E-954C-685E56F9E526@arm.com>
References: <F8985EDB-2808-485E-954C-685E56F9E526@arm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 15:35:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231036

From: Alex Feyerke <alex@neighbourhood.ie>

Signed-off-by: Alex Feyerke <alex@neighbourhood.ie>
---
 scripts/lib/build_perf/html/report.html | 20 ++++++++++++++++++--
 scripts/oe-build-perf-report            | 13 -------------
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/build_perf/html/report.html b/scripts/lib/build_perf/html/report.html
index 4b37893cd0..779aa55573 100644
--- a/scripts/lib/build_perf/html/report.html
+++ b/scripts/lib/build_perf/html/report.html
@@ -140,6 +140,11 @@ button:hover {
   max-width: 30em;
   text-wrap: auto;
 }
+
+.annotation-container:not(:empty) {
+  display: inline-block;
+}
+
 @media (prefers-color-scheme: dark) {
   :root {
     --text: #e9e8fa;
@@ -198,8 +203,8 @@ button:hover {
       <tr>
         <th>{{ item.title }}</th>
         {%if key == 'commit' %}
-          <td>{{ poky_link(item.value) }}{%if metadata.commit_annotation and metadata.commit_annotation.value %}<br>{{metadata.commit_annotation.value}}{% endif %}</td>
-          <td>{{ poky_link(item.value_old) }}{%if metadata.commit_annotation and metadata.commit_annotation.value %}<br>{{metadata.commit_annotation.value_old}}{% endif %}</td>
+          <td>{{ poky_link(item.value) }}<span class="annotation-container" data-commit="{{ item.value }}"></span></td>
+          <td>{{ poky_link(item.value_old) }}<span class="annotation-container" data-commit="{{ item.value_old }}"></span></td>
         {% elif key == 'commit_annotation' %}
         {% else %}
           <td>{{ item.value }}</td>
@@ -529,6 +534,17 @@ chartData.forEach(test => {
     drawChart(measurement.chart_elem_start_time_id, startTimeChartConfig)
     drawChart(measurement.chart_elem_commit_count_id, commitCountChartConfig)
   })
+
+  // Splice commit annotations into the table at the top of the page
+  if (commitAnnotations) {
+    document.querySelectorAll("[data-commit]").forEach((item) => {
+      const commitNumber = item.getAttribute("data-commit")
+      const matchingAnnotation = commitAnnotations[commitNumber]
+      if (matchingAnnotation) {
+        item.innerText = matchingAnnotation
+      }
+    })
+  }
 })
 
 
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index f9bdef2712..02da745a6c 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -432,19 +432,6 @@ def print_html_report(data, id_comp, buildstats):
     try:
         response = urlopen(commitAnnotationsURL)
         commitAnnotationsJSON = json.loads(response.read())
-        # Splice the annotations into the metadata
-        commit = metadata.get('commit', {})
-        annotations_out = {}
-
-        if (h := commit.get('value')) in commitAnnotationsJSON:
-            annotations_out['value'] = commitAnnotationsJSON[h]
-
-        if (h := commit.get('value_old')) in commitAnnotationsJSON:
-            annotations_out['value_old'] = commitAnnotationsJSON[h]
-
-        if annotations_out:
-            metadata['commit_annotation'] = annotations_out
-            metadata['commit_annotation']['title'] = "Commit annotation"
 
     except error.URLError as e:
         logging.debug(f"Couldn't find any commit annotations at {commitAnnotationsURL}, reason: {e.reason}.")
-- 
2.40.1


