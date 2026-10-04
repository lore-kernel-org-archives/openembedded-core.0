Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E12CA5FCE
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 16:47:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1517.1791129699764730641
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 09:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KdAlld7A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: pohuchiu@qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694EdpLs2595279
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Oct 2026 15:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yWqClwiTbxN
	IrCdTY/shxLczy8XTMwq0N/2dgCsQw6s=; b=KdAlld7A39yccM8z6BLQtTIgLV2
	o3AuqyTKyCJOb/hyWsbQ5Vdrf9BXUSf6OviWm5r1xS/rChauzzZvz690ZuRP4oFm
	8W3GlttYMOPrPrQntic1yTqEs45i1G3AD2srh9z4av9vIhjlTzLRKElAWpeU1z65
	E+MUCXf5cvISiFQdCtzimv9FeTUOrZBHxmIQ1HuKuxv5n7GhxSKw0dIFjV28Yxx9
	w59LI+XF8TnktIE6QgrCbY3iXXz9bsZUmIOalkCVYCTVeLN5in9FcZr+AgY1k2ta
	kVpIoFHgghdpvh0FflOK7nr9s565AmmgN+BYw7ZWYtQUS4ORJhDyBwAK4bg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08k59w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 15:29:38 +0000 (GMT)
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-pohuchiu-lv.qualcomm.com [10.81.89.102])
	by NALASPPMTA04.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTPS id 694FTb8F2317953
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Oct 2026 15:29:37 GMT
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4703090)
	id BBB60CD8; Sun,  4 Oct 2026 08:29:37 -0700 (PDT)
From: Paddy Chiu <paddy.chiu@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/1] externalsrc: preserve source revision in PKGV
Date: Sun,  4 Oct 2026 08:29:37 -0700
Message-Id: <20261004152937.2437098-2-paddy.chiu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922092015.2428562-1-paddy.chiu@oss.qualcomm.com>
References: <20260922092015.2428562-1-paddy.chiu@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 1ANAOvYJoh_-aLiAQKAECRNq5yU5Ofm_
X-Proofpoint-GUID: 1ANAOvYJoh_-aLiAQKAECRNq5yU5Ofm_
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac270e2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=qcwxAyvGdnx3nmSoVuIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA2MSBTYWx0ZWRfXy9Uj7lNyJpnJ
 9Csep/iVY7KTvp62VvcSf/S4IeCGvPNAK2+PVRuMyY1far+1uYM/itXTVILM+5gcbC2W+CJ7nPb
 pSAfoM0qigyQtV4NT3deECZvJ02Sxto=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA2MSBTYWx0ZWRfXwwpRvA+AKEGc
 qbOyRxNkQkDb0H4zrAjlBUJ4C+N3ViV2HwH9Dgs7jKpQ6+IvTuOuZl8ypYux9r9+Vg7aEOYT8lV
 PY9goTCi5hNSoP4UqJOop6we4L5/ZOAvD22xM6vrielct7nuWpZvOmZBO0e9VQkOE65bN4YcJDu
 kUpDA0H5TbBkKULljrryx6//B+lIfCcrNLX8TBjYf3DUcFEaFv6TIdbJgYXr5JT1pIscD0nf03+
 0rdeZK2AH8wtw4I+9kWSnJ/Mkyy33cQs0RDafO377WGJ0sKrdeCnGU7iRsR6OIxtc+l4CKRcuVl
 ynenCGpwGUONwyCpev+L+VXh2bhVlOHb/whP86Ggg8kBezb4nbQgiwp3RT43KP2fV8v3XWeAcjE
 K9jxji/iQDSAWWXoAOi0ZfKCXR9fRR7gtqjlsXR+ubzvYeff/Pt8KkIhed4aAbJ9p6m6cp76yOR
 havYuWiak15xjYB+9CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040061
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 16:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247200

externalsrc removes SCM URLs from SRC_URI before packaging, so the
packaging fetcher cannot derive the source revision for devtool builds.

Capture the formatted source-version suffix before filtering and
reuse it for package version and AUTOINC PR-service handling. This
keeps the normal fetcher path unchanged and avoids restoring a copied
datastore.

Signed-off-by: Paddy Chiu <paddy.chiu@oss.qualcomm.com>
---
 meta/classes-global/package.bbclass | 8 ++++++--
 meta/classes/externalsrc.bbclass    | 3 +++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 67148fc1ac..f57397e83d 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -299,7 +299,9 @@ python package_get_auto_pr() {
                 pr = d.getVar('PR')
                 # Strip PR to make AUTOINC can increase when SRCREV is changed
                 base_ver = "AUTOINC-%s" % version[:-len(pr)]
-                srcpv = bb.fetch2.get_srcrev(d)
+                srcpv = d.getVar("EXTERNALSRC_PKGV_SUFFIX")
+                if srcpv is None:
+                    srcpv = bb.fetch2.get_srcrev(d)
                 value = conn.getPR(base_ver, pkgarch, srcpv)
                 d.setVar("PRSERV_PV_AUTOINC", str(value))
 
@@ -319,7 +321,9 @@ python package_get_auto_pr() {
 python package_setup_pkgv() {
     pkgv = d.getVar("PKGV")
     # Expand SRCPV into PKGV if not present
-    srcpv = bb.fetch.get_pkgv_string(d)
+    srcpv = d.getVar("EXTERNALSRC_PKGV_SUFFIX")
+    if srcpv is None:
+        srcpv = bb.fetch.get_pkgv_string(d)
     if srcpv and "+" in pkgv:
         d.appendVar("PKGV", srcpv)
         pkgv = d.getVar("PKGV")
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 902ff2604f..47c1b06788 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -78,6 +78,9 @@ python () {
             d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
         bb.fetch.get_hashvalue(d)
+        # Keep the source version available for packaging. SCM URLs are removed
+        # below so externalsrc does not fetch or unpack the external source.
+        d.setVar('EXTERNALSRC_PKGV_SUFFIX', bb.fetch.get_pkgv_string(d))
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
         for url in fetch.urls:
-- 
2.34.1


