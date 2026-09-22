Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028D9C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 10:56:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6389.1790070954682230800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=m4FU37I+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: pohuchiu@qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7DYiX3044434
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/ONhmNX3ilQM64p1yjWrx0ws3ZymG7PBmA6
	jEmN8wq0=; b=m4FU37I+WEQeUKhELQPi3btKVZKQDT3ZDzVvE+rBiqFBKHrvxuE
	iEO0+kaPbiym1C+d7w/RvhMRW8zAsERqeTyofyQSi6DXJ+ERoKeqg8RcqV6UqDtp
	bz918wtN8moJFNOidpaTNtQx3GVvP7duWhuhavGJ1P/3GUVERKaSCDXCcFyT0CTg
	i5oWLdkOTa3dcqkkMnIct8ypsKw3BNlDypQWXnz4e/qgTk+29nPMTafxjYoPVHuI
	r/M2EuYGCkUmJmkgaro8Y7oe52XE0V6Ag5DQJJBtFilNhJ3pwjYJTpBaXOHM9zbr
	YyNOlJPM45gN222EH18jnEGxUu279ZunX9g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbastka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:20:20 +0000 (GMT)
Received: from pps.filterd (nalasppmta01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9KJKe1791062;
	Tue, 22 Sep 2026 09:20:19 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-pohuchiu-lv.qualcomm.com [10.81.89.102])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 68M9KJ5M1791051
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:20:19 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4703090)
	id 0E1C8BF5; Tue, 22 Sep 2026 02:20:19 -0700 (PDT)
From: Paddy Chiu <paddy.chiu@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: jose.quaresma@oss.qualcomm.com, Paddy Chiu <paddy.chiu@oss.qualcomm.com>
Subject: [PATCH] externalsrc: fix PKGV for devtool build
Date: Tue, 22 Sep 2026 02:20:15 -0700
Message-Id: <20260922092015.2428562-1-paddy.chiu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzNCBTYWx0ZWRfX5PM0zCbdDtNJ
 Tp04014GE5peBhXjLdQL7slSRVZKvMgUR0eD2RMSKmXJbtXezBGl+oWmEju5gBfqwm1HWBjKoZG
 UO/pptCeKsm3gi+P2DFj1Irn0o/3GUPcfQ/GB9YdZBDqYIVFSxhT2hZ1AsrSBquHHlxsVQOqdLi
 IzJs4fvFUhq62dKme558puLPPPJTMaytvzm7xnT/hsVxODg4FVZU1BOE8IPH9WCknY878YOjJ5G
 QDBKDg8lJBtgbSsku0C4TBUNiNAVAe+EOvEKH7vGAi17Vvpb5ev5cC7aR4CqKMoFqdnmxF09Seq
 RBhHgHe3wT+93rDto0Z1PNUD2wOhCGOAdMC2vFXsJIpeRioA3yryAQ1SYa3iDIlmCvfKHpxIkEY
 rmTJbpgXtI0FfUVThSm/yXWK2LLv9eYQm/VHdDc86XroKe/twWImldUHxAr3Zm36kmoqwdpbXIl
 ymbW04OprRy9bQhDBHA==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab24854 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=qcwxAyvGdnx3nmSoVuIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzNCBTYWx0ZWRfXw5mkdFt4UH0F
 Sk4EKMHHx3TIA0fUeGXt2mUfoPH2a4Iku2KE18Q/G0mucnTZ+bg57sfAfvCZ93NY80SypLCl1AC
 waX/b/Gnb++58bUafWGRnGL/jD3BW8g=
X-Proofpoint-ORIG-GUID: XAfQUGqJfUydij08A-HO6y9Rg7WBLH61
X-Proofpoint-GUID: XAfQUGqJfUydij08A-HO6y9Rg7WBLH61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220134
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 10:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246402

Without this fix, PKGV will be the same as PV when using devtool build.
Since SRC_URI is set to local_srcuri in externalsrc.bbclass and consequently cause missing git commit hash in PKGV.
This fix can prevent buildhistory package-version QA failures in devtool build.
---
 meta/classes-global/package.bbclass | 12 ++++++++++--
 meta/classes/externalsrc.bbclass    |  4 ++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 67148fc1ac..c5f8b2136f 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -242,6 +242,14 @@ python () {
         d.appendVarFlag('do_package', 'deptask', " do_packagedata")
 }
 
+def package_get_srcdata(d):
+    srcuri = d.getVar("EXTERNALSRC_ORIG_SRC_URI")
+    if not srcuri:
+        return d
+
+    srcdata = d.createCopy()
+    srcdata.setVar("SRC_URI", srcuri)
+    return srcdata
 
 PRSERV_ACTIVE = "${@bool(d.getVar("PRSERV_HOST"))}"
 PRSERV_ACTIVE[vardepvalue] = "${PRSERV_ACTIVE}"
@@ -299,7 +307,7 @@ python package_get_auto_pr() {
                 pr = d.getVar('PR')
                 # Strip PR to make AUTOINC can increase when SRCREV is changed
                 base_ver = "AUTOINC-%s" % version[:-len(pr)]
-                srcpv = bb.fetch2.get_srcrev(d)
+                srcpv = bb.fetch2.get_srcrev(package_get_srcdata(d))
                 value = conn.getPR(base_ver, pkgarch, srcpv)
                 d.setVar("PRSERV_PV_AUTOINC", str(value))
 
@@ -319,7 +327,7 @@ python package_get_auto_pr() {
 python package_setup_pkgv() {
     pkgv = d.getVar("PKGV")
     # Expand SRCPV into PKGV if not present
-    srcpv = bb.fetch.get_pkgv_string(d)
+    srcpv = bb.fetch.get_pkgv_string(package_get_srcdata(d))
     if srcpv and "+" in pkgv:
         d.appendVar("PKGV", srcpv)
         pkgv = d.getVar("PKGV")
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 902ff2604f..a1bb92a418 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -78,6 +78,10 @@ python () {
             d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
         bb.fetch.get_hashvalue(d)
+        # Keep the original URI available for packaging. SCM URLs are removed
+        # below so externalsrc does not fetch or unpack the external source,
+        # but package_setup_pkgv() still needs them to derive PKGV.
+        d.setVar('EXTERNALSRC_ORIG_SRC_URI', d.getVar('SRC_URI'))
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
         for url in fetch.urls:
-- 
2.34.1


