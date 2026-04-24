Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE832FF8841
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:01 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31971.1777064211878994980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iktwrI+W;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso113197835e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064210; x=1777669010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YvIPmB8lPugDIpjyrF9hiCVTsMemgecDbGvGhKJGJU=;
        b=iktwrI+W7mX/hJ8flS3PM35hHDyjNA00ATxty1nlEU75+y0oY+JufHF5uXGINVmbS/
         itRS/6RGQ7oN9be5kLdYW1jgkNXZ+8m9COBNeKeKueiduRP9ppzpJLFf3dC+1086b72h
         6z1j4PpnV6Dwpp3eRmXpQ/Zdeo014K38MjXNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064210; x=1777669010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8YvIPmB8lPugDIpjyrF9hiCVTsMemgecDbGvGhKJGJU=;
        b=hj6BaDwTWrTLf8FDZj6jYckEQNxSmeuCLJwp73dLwa6h53WRYv4xBp/rwFJ1ptZRni
         GJMDGR+BGamc+O9sNXPeTuIURCWxCjH2jnpLokOw/1Oe6YScW+8lG7+AdU/mM1OrBqWt
         OFrFqHs/RQjKrP6vjBKjttMACBHjZKBRa1WitPbh6nE/oW4r6bOW3XHdbkhKmxGIyBfm
         SrmUGqk5w9GvCskfhdSC0MS1ZPZvwZgbgdECdqLbRN1I3jjPL4ooT2wE/a8bb7NHkuqd
         HbIA7qI20w7oEYREQIQRPftqUsa2c27EIrRjuPEAhBAYgZtmLQ2sfqTDGQXHEdfCDyou
         5rzQ==
X-Gm-Message-State: AOJu0Yypqjt2kefSILB+7caa0Vgo2hAa1NapZTewhA8sE2UAVEHlAS3v
	YYpOR6Q9d+FjtVIC74HXQN1b+f15w/Has91I6q382bGx5ChD+K2oUJflRwm7EPTCR9sl19fExHG
	H/GGRMcMHfGCM
X-Gm-Gg: AeBDietO87AhgyWQtj0IrxOrQIBl9vo2Msl+N9l6Qt1OTKAXv2TcQZgNuuf1FVA7BE/
	NmXatAHjaCHmVNbDFWh0ncomVeC2cLMbcwpkkEiiBGZGsFzEmAPFdfKINuFkun2kmVk98Z8DCju
	lh82KHvV+fhFWKfOq4G9CHt1wjKtGzZA+rAHLcvr+3dHrw4Skzu06I4lQZ1z8rv8W2Coj1rQKqP
	q6FEpomYJteEloM3hNrCon6FvIFhsEKTN2ofL2E+cjLuYY84MYqy8vK9scbSx/4WzjZO/oAV1iv
	wTu+SnfM2ZcljXqfoJ1BXWbGAaH4+npSG8/QGwd9BjyUO2IasJuWJn1D6D5cr97g6Nxp1v+Z6+v
	w1kF/Oeq3roX0PUoVEeRfpw3aoI5t80h1PhLEy80izb/y1DqA6gi889ka+hozToWCtQzP8JPKVF
	H7kZ3hGziEXq3h8Kk6HQC3tvMGdooTu92rkwxH+t3hUw+IabobGfsqLxJFzkQQJKJlQEVsmPgp2
	AYEY4AFYeVAZZGXhKYpu9Oa0oGuIflSWot8qSXrTc/5kNpb
X-Received: by 2002:a05:600c:1f83:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-488fb787afemr469121365e9.24.1777064210012;
        Fri, 24 Apr 2026 13:56:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/66] gi-docgen: fix CVE-2025-11687
Date: Fri, 24 Apr 2026 22:55:21 +0200
Message-ID: <76c1f08fadad94098bd265d662eb5a0408c95efc.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235895

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-11687:
A flaw was found in the gi-docgen. This vulnerability allows arbitrary JavaScript execution in the
context of the page — enabling DOM access, session cookie theft and other client-side attacks — via
a crafted URL that supplies a malicious value to the q GET parameter (reflected DOM XSS).

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-11687]

Upstream patch:
[https://gitlab.gnome.org/GNOME/gi-docgen/-/commit/c53d2640bfa5823bbdf33683d95c160267c0ec68]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gi-docgen/files/CVE-2025-11687.patch      | 90 +++++++++++++++++++
 .../gi-docgen/gi-docgen_2023.3.bb             |  5 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gi-docgen/files/CVE-2025-11687.patch

diff --git a/meta/recipes-gnome/gi-docgen/files/CVE-2025-11687.patch b/meta/recipes-gnome/gi-docgen/files/CVE-2025-11687.patch
new file mode 100644
index 00000000000..8a0c15e4a88
--- /dev/null
+++ b/meta/recipes-gnome/gi-docgen/files/CVE-2025-11687.patch
@@ -0,0 +1,90 @@
+From 0e97b155ff1b15bc3173118561316d8ea28ec9b7 Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Fri, 10 Oct 2025 17:06:22 +0100
+Subject: [PATCH] Make sure to escape query strings
+
+Unescaped query strings should not be passed to the HTML parser, to
+avoid unwanted execution of JavaScript.
+
+The query is shown in the header of the search results, so we can easily
+split the header from the results; then we use a plain text node to
+represent the query, and let the browser escape it.
+
+See: https://cheatsheetseries.owasp.org/cheatsheets/DOM_based_XSS_Prevention_Cheat_Sheet.html
+
+Fixes: #228
+
+CVE: CVE-2025-11687
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gi-docgen/-/commit/c53d2640bfa5823bbdf33683d95c160267c0ec68]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ gidocgen/templates/basic/search.js | 30 +++++++++++++++++++-----------
+ 1 file changed, 19 insertions(+), 11 deletions(-)
+
+diff --git a/gidocgen/templates/basic/search.js b/gidocgen/templates/basic/search.js
+index 29c204f..628f0a6 100644
+--- a/gidocgen/templates/basic/search.js
++++ b/gidocgen/templates/basic/search.js
+@@ -182,17 +182,24 @@ function hideSearchResults() {
+     }
+ }
+ 
+-function renderResults(query, results) {
+-    let html = "";
++function createResultsTitle(query, n_results) {
++    // Ensure we're returning an escaped query string, to ensure we
++    // prevent XSS vulnerabilities
++    let h1 = document.createElement("h1");
++    let text = document.createTextNode("Results for “" + query + "” (" + n_results + ")");
++    h1.appendChild(text)
++    return h1;
++}
+ 
+-    html += "<h1>Results for &quot;" + query + "&quot; (" + results.length + ")</h1>" +
+-                "<div id=\"search-results\">"
++function createResultsContent(results) {
++    let search_results = document.createElement("div");
++    search_results.setAttribute("id", "search-results");
+ 
+     if (results.length === 0) {
+-        html += "No results found.";
++        search_results.textContent = "No results found.";
+     }
+     else {
+-        html += "<div class=\"results\"><dl>";
++        let html = "<div class=\"results\"><dl>";
+         results.forEach(function(item) {
+             html += "<dt class=\"result " + TYPE_CLASSES[item.type] + "\">" +
+                       "<a href=\"" + item.href + "\">" + item.text + "</a>" +
+@@ -204,11 +211,11 @@ function renderResults(query, results) {
+                     "<dd>" + item.summary + "</dd>";
+         });
+         html += "</dl></div>";
+-    }
+ 
+-    html += "</div>";
++        search_results.innerHTML = html;
++    }
+ 
+-    return html;
++    return search_results;
+ }
+ 
+ function showResults(query, results) {
+@@ -218,9 +225,10 @@ function showResults(query, results) {
+         window.history.replaceState(refs.input.value, "", baseUrl + extra + window.location.hash);
+     }
+ 
+-    window.title = "Results for: " + query;
++    window.title = "Results for “" + query + "” (" + results.length + ")";
+     window.scroll({ top: 0 })
+-    refs.search.innerHTML = renderResults(query, results);
++    refs.search.appendChild(createResultsTitle(query, results.length));
++    refs.search.appendChild(createResultsContent(results));
+     showSearchResults(search);
+ }
+ 
+-- 
+2.50.0
+
diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
index 54d7ef75136..53641bcbe33 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
@@ -8,7 +8,10 @@ HOMEPAGE = "https://gnome.pages.gitlab.gnome.org/gi-docgen/"
 LICENSE = "GPL-3.0-or-later & Apache-2.0"
 LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f01202478cfe813c0e7f80b326"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
+SRC_URI = "\
+          git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main \
+          file://CVE-2025-11687.patch \
+          "
 
 SRCREV = "96f2e9b93e1d8a5338eb05b87fd879856ab7b3cc"
 

