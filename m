Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7527E98FB9
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:16:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126099.1775715404442123858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=bZFDvHxF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63948OPn1662422
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Apr 2026 06:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=O0atI0YBIUf5UUpSsNLMkiaZDMWy+ZeiX2TibGvfJ94=; b=bZFDvHxF3GCe
	2Ctqcu1iwP0dXwSoAQLf4HtDODHY+rsOa8Xmwi8K3o4ZFU+4oZWJ1hgRS4mnYIQs
	JTP8In45PReJWVzvY6zxz0DhDyywuZi7f5VYgdb7/Ah3Hd4KiSmY5uMwd6C2n+pO
	lYTH3EEAlNXCe0KG0jwblV6awHr2Alq90619P2PLWxxWl6jjEoi8yK1QVXYBbQPj
	2N1lQeAqHNmNHbW9J0b+tsYlYV0BDT4RyFqf9ab4+YG7M2wf+fhctCCIlY16nPkY
	iNiVZE4GX3nsIKkXYp3CrFoBih6RWQBUlpALRxflYFdA6SoBspTkTHfl0IIcDqTA
	HRorRwXQog==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrybr21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:43 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:41 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:41 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 01/12] gi-docgen: fix CVE-2025-11687
Date: Thu, 9 Apr 2026 14:16:28 +0800
Message-ID: <20260409061639.1688205-2-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d7444b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=GHR8O2WEAAAA:20 a=mE7JM0AAAAAA:8 a=9WG0oirIAAAA:20 a=t7CeM3EgAAAA:8
 a=aiIX5UjjAAAA:8 a=gMDw5KYKaQC5Ptm7dMgA:9 a=GRBoTcyLz6O0_h67:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=sjx5D4xYqjbV_PqBlxw0:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: a0pSlOcvj7_im2nYDLJ_tIHl-kYDH8mQ
X-Proofpoint-ORIG-GUID: a0pSlOcvj7_im2nYDLJ_tIHl-kYDH8mQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX+gAUxvi5zo5B
 Xexh4lFOxwRdUL9xcEWFDkA5IJhhrzvEC3Fye8SbmrL4jZGNpVr/5Md+CsZNVapSN+xy4/qAwzA
 j/ERCg53dKGSHkAN5wfZCq0waZtORz6PH+5GQAtOE5gSPdiOgR4JJbdNAIZnhcfu/E7Lf0ze+qu
 +D79vjJ6SVBVVOA8NSVgkXW6i7kpTZasPzpIRoxGFdVH3JmuBFZnz/JtxwblTRbkpWvm9UhHCZG
 pVLfpim6OFMlkbx4B4OyzEC+jW5FMqGjEbIc5JGJxcCkA+PKIQClSLD9Q5++OvRmoNIWEhdQ/1p
 ePYLwf3B7qaZ6QkIlPIYCdOeifZHl0j3qpPE0zTP5Y/6LYpNIoDG+YTm/28ho5hdHpCBPrG5odd
 KKoLMROo7Az0MGrpHRe4N39APgiZxE5Ue2CPfsYiG1sQs86YVw1wYbpWY0E9lizFRgip5lvtnrY
 ChydJp12b9BenGTk8ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63948OPn1662422
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234877

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-11687:
A flaw was found in the gi-docgen. This vulnerability allows arbitrary Ja=
vaScript execution in the
context of the page =E2=80=94 enabling DOM access, session cookie theft a=
nd other client-side attacks =E2=80=94 via
a crafted URL that supplies a malicious value to the q GET parameter (ref=
lected DOM XSS).

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-11687]

Upstream patch:
[https://gitlab.gnome.org/GNOME/gi-docgen/-/commit/c53d2640bfa5823bbdf336=
83d95c160267c0ec68]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../gi-docgen/files/CVE-2025-11687.patch      | 90 +++++++++++++++++++
 .../gi-docgen/gi-docgen_2023.3.bb             |  5 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gi-docgen/files/CVE-2025-11687.pat=
ch

diff --git a/meta/recipes-gnome/gi-docgen/files/CVE-2025-11687.patch b/me=
ta/recipes-gnome/gi-docgen/files/CVE-2025-11687.patch
new file mode 100644
index 0000000000..8a0c15e4a8
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
+See: https://cheatsheetseries.owasp.org/cheatsheets/DOM_based_XSS_Preven=
tion_Cheat_Sheet.html
+
+Fixes: #228
+
+CVE: CVE-2025-11687
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gi-docgen/-/co=
mmit/c53d2640bfa5823bbdf33683d95c160267c0ec68]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ gidocgen/templates/basic/search.js | 30 +++++++++++++++++++-----------
+ 1 file changed, 19 insertions(+), 11 deletions(-)
+
+diff --git a/gidocgen/templates/basic/search.js b/gidocgen/templates/bas=
ic/search.js
+index 29c204f..628f0a6 100644
+--- a/gidocgen/templates/basic/search.js
++++ b/gidocgen/templates/basic/search.js
+@@ -182,17 +182,24 @@ function hideSearchResults() {
+     }
+ }
+=20
+-function renderResults(query, results) {
+-    let html =3D "";
++function createResultsTitle(query, n_results) {
++    // Ensure we're returning an escaped query string, to ensure we
++    // prevent XSS vulnerabilities
++    let h1 =3D document.createElement("h1");
++    let text =3D document.createTextNode("Results for =E2=80=9C" + quer=
y + "=E2=80=9D (" + n_results + ")");
++    h1.appendChild(text)
++    return h1;
++}
+=20
+-    html +=3D "<h1>Results for &quot;" + query + "&quot; (" + results.l=
ength + ")</h1>" +
+-                "<div id=3D\"search-results\">"
++function createResultsContent(results) {
++    let search_results =3D document.createElement("div");
++    search_results.setAttribute("id", "search-results");
+=20
+     if (results.length =3D=3D=3D 0) {
+-        html +=3D "No results found.";
++        search_results.textContent =3D "No results found.";
+     }
+     else {
+-        html +=3D "<div class=3D\"results\"><dl>";
++        let html =3D "<div class=3D\"results\"><dl>";
+         results.forEach(function(item) {
+             html +=3D "<dt class=3D\"result " + TYPE_CLASSES[item.type]=
 + "\">" +
+                       "<a href=3D\"" + item.href + "\">" + item.text + =
"</a>" +
+@@ -204,11 +211,11 @@ function renderResults(query, results) {
+                     "<dd>" + item.summary + "</dd>";
+         });
+         html +=3D "</dl></div>";
+-    }
+=20
+-    html +=3D "</div>";
++        search_results.innerHTML =3D html;
++    }
+=20
+-    return html;
++    return search_results;
+ }
+=20
+ function showResults(query, results) {
+@@ -218,9 +225,10 @@ function showResults(query, results) {
+         window.history.replaceState(refs.input.value, "", baseUrl + ext=
ra + window.location.hash);
+     }
+=20
+-    window.title =3D "Results for: " + query;
++    window.title =3D "Results for =E2=80=9C" + query + "=E2=80=9D (" + =
results.length + ")";
+     window.scroll({ top: 0 })
+-    refs.search.innerHTML =3D renderResults(query, results);
++    refs.search.appendChild(createResultsTitle(query, results.length));
++    refs.search.appendChild(createResultsContent(results));
+     showSearchResults(search);
+ }
+=20
+--=20
+2.50.0
+
diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb b/meta/reci=
pes-gnome/gi-docgen/gi-docgen_2023.3.bb
index 54d7ef7513..53641bcbe3 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
@@ -8,7 +8,10 @@ HOMEPAGE =3D "https://gnome.pages.gitlab.gnome.org/gi-do=
cgen/"
 LICENSE =3D "GPL-3.0-or-later & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://gi-docgen.py;beginline=3D1;endline=3D5;md5=3D=
2dc0f1f01202478cfe813c0e7f80b326"
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=3Dhttps=
;branch=3Dmain"
+SRC_URI =3D "\
+          git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=3Dhttps;br=
anch=3Dmain \
+          file://CVE-2025-11687.patch \
+          "
=20
 SRCREV =3D "96f2e9b93e1d8a5338eb05b87fd879856ab7b3cc"
=20
--=20
2.34.1


