Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DADC44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 15:27:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25706.1784647616185828589
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 08:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZKEGzOmX;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XD1zRb6q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg7Wc1805639
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 15:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UKYVtDoFhPXmK5wNgXKCf4faOu+ERfedWzb
	CDtQA0Kg=; b=ZKEGzOmXKZBnaAzWXoT60uBzuV1+/oHiXA5IpkLiZlLi8HEn95q
	qYTLkTwoxBCFBvYQDok/Cjb1F+lTK2e58M2zoHBjDrGXexFvyKszbE0rUX0qEkKO
	6X0H1OgVrqXpn2x8wqh+sCAPDFl6w7gTde9/2/mSP9rNq49Q6zjh0CMR98eu0yIx
	xSRuJoi350kWru5dKNOXMuOM4f0sm2g3fZzG0FRVIyPmwnh05dBbiBN/u+2MS234
	n3y28FpFroikG+rEDFcG46nJEE81eIZKYd1Y3hqbdNktvTvQlDFpcdBs/iolD0KU
	/ERuiTy70OdrERXKTIxDoEgmHHBBKNdUqKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa9fwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 15:26:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so4550351cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 08:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784647614; x=1785252414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UKYVtDoFhPXmK5wNgXKCf4faOu+ERfedWzbCDtQA0Kg=;
        b=XD1zRb6qCHZgJBwcva3Nk5laku7oUOTU9ZhyHhOt1XcNsT05zj6uXKSHgB02RM+2Yd
         jN+GbCdhZRdJvTHvv3BVBmpQrAOjtiuoIGjojf6CoTSLf9fo90Nm302xg2yrnR9gnScz
         8lAgFI249gd45oswHVKPQvXaYyGvWOnE+wy5GeUSz9Jkcjg6VbxhdANLtSG4jhLdn5RP
         hJ9qU5nNDyz4SYZmE0MrUAFDyi2UDmTM2QdFhHq9cPgP0eS4H1917aROWTIFvfacih8X
         mto9fOkWGW1r+yR+/Aw7pEzJ/Z/a8qv8/4cYkLqgyhdnB8eKzDgtRp0skHsX5deL1AQ1
         ssYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647614; x=1785252414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UKYVtDoFhPXmK5wNgXKCf4faOu+ERfedWzbCDtQA0Kg=;
        b=E76QL+pVsnKmT45t31xPvEwrTdjeAOWwWsyilSv81MXyTyCjOjp1DNuk8LCuIhd1+s
         3XYwF01vu7mP/9TPbIlwhVfz+yRFJNEF+847DqMSGpoRoOIfd5+vCEzh3oLEp0YER9/0
         3Q7ZDGnbnIoqzg29EjWsDHx7Y46WWZIZry1ZgPv7PF2u6M1o3l230Sa6nRopu3c4+XUm
         Q4HInQSvgQXIJmZuoHpbGWunYb2YYJGxoptLzxzfLATIGr47gIh8fbYsDu26XaCWqTHQ
         ezBi7m3qU4hJukEp/SSJTrvK5G697GiA9ziu8orf5GQVYUm1qCdt+JDFIpI26GqeC0Hn
         aISA==
X-Gm-Message-State: AOJu0Yyyp1TvljIVgNjG+gYsMTJ4OR+gteWicuY5heVh1+XkwoQehSXq
	6VspbNSvUmXLfQo4zP3f/cOJmxX2Xumy2g7zx9lAJiNRbFZ1FXhPWQGRLrBfIX7gvS3jk09E7qn
	PkgWOafPgWCGADPTIaxE0nkYwHLa4aSST2h0qOwb11ZmjMQ3c/WRvQ97lpMrvBOykpGsLA1xMbH
	bBt4uO8uzzPwqZl34=
X-Gm-Gg: AfdE7clN+hTyNYwdkIsvWy0RZXcjy+yMNK7e9Hnw8IQ196vrm+YknHVLV0k5cIfN/cH
	m8oTkZi6RfwKt2fXjaU1MzbeYtIWPaLohm14dS8ojuZEeykhV+JDK+Lld95bE1MZKIYU7cPC0ZT
	id/oNyonxg7kxFVlOGciv7B3z4+yP1aJJHUWxmoLsyFOR5IPJnEojEJOTe9sBXvjH+Yze9raS2c
	Gz4WT799zHzFfigdsjpW4484DBOMWIBFaE9a4hrnXwgfdmRyLF0jtUFkR8yoTNasEVVIE45DY6y
	eNrlC8hS7oLKW8rTW0PB/RFm/FGXEPLQQuI92iz9wuLyui8l4QDnPkybeUrOZwjXLBP2Dog1vjg
	qGYQkEgztn2vq8lhVJDsB8p/Dc0mNx5hMkGkoBzcEmoe3LyL8KW+0LLWp2CwOYLh6/TK6oMrfiS
	agLsi9DW+sPZZzqA==
X-Received: by 2002:a05:622a:2592:b0:51c:1daf:1978 with SMTP id d75a77b69052e-5213cad9223mr184779051cf.54.1784647554399;
        Tue, 21 Jul 2026 08:25:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2592:b0:51c:1daf:1978 with SMTP id d75a77b69052e-5213cad9223mr184772431cf.54.1784647545940;
        Tue, 21 Jul 2026 08:25:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bb46e7sm8015e87.36.2026.07.21.08.25.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:25:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] license: fix list_licenses() crash on CLOSED and empty licenses
Date: Tue, 21 Jul 2026 18:25:43 +0300
Message-ID: <20260721152543.3468210-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Vc-fWd7HeWxChXiycjprLxzJYppS3cxp
X-Proofpoint-ORIG-GUID: Vc-fWd7HeWxChXiycjprLxzJYppS3cxp
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f8fbe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=HV8pP60MivRTSA27ca4A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX8Fgky0aOh8rR
 n7Zm3iR9ODJUgMf7xi/B9S0MUL5oTQ0yYi+UJ8iXC2Hff5Pn0BD/sMrwI2XbZrvEo+j4zgfYeCi
 3c9jjURSn3+C5Ip/TyYAUz2xIvf70DN/MoOnZN8rMmT8lwyjdZv6viZCAIiuXPmfVQJfXsmqZUF
 T4P7agtF0Gr3VsOOUgb9v2WaP/VRM+XKzbrW8kJOQ98R6rcsHvnRmEh8DDYPBgUqogPPlb0SSDD
 mIW/4qulbwepz7zr8jUliBucDtReurUnHwwzqo1GFhIWUIrfTPSIEFb6kBhvF4J4I9uDocZnjCo
 clwhnE4uy/A1+Y7USV8hj86H2DW3JTiMYWU5mn9nx5hfCYuvqBcAGKIS6wkNe0oI5/2YHKjzs6R
 lqaBnVwE6zEpEmrpE+acnsRAFKVy7+QQhP5NJdlR2EUhZWCNLDRQXoTt1VECbLS4m6RQwWhd2vy
 Xq5I9wuLz7leUUGJTKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX+AGmGaOwiQb3
 3hlpmYbDkKlzqMUHHRDReAA2BgI/7PxCS8vu7657GdckH6VBi4hZPyZ3YwWGqmEg46FHjY4MuRF
 Vffs9+eUMBCtUkA5DnP6/iqSiOEnPH4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210163
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 15:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241552

oe.license.list_licenses() passes the result of parse_legacy_license()
straight into walk_license(), which unconditionally iterates
node.children. For LICENSE = "CLOSED" (and for an empty license string)
parse_legacy_license() returns None, so walk_license(None) dereferences
None.children and aborts do_package_qa with:

  AttributeError: 'NoneType' object has no attribute 'children'

This breaks packaging for every CLOSED-licensed recipe reaching the
obsolete-license QA check.

Guard the walk against a None node, mirroring the existing "if node:"
check in the neighbouring apply_pkg_license_exclusion().

Fixes: e9d424738d6f ("classes/conf/lib: Parse LICENSE as SPDX Expression")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/lib/oe/license.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index a1dce143dd20..adcfc827cfc0 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -235,7 +235,9 @@ def list_licenses(licensestr, d):
         for child in node.children:
             walk_license(child)
 
-    walk_license(parse_legacy_license(d, licensestr))
+    node = parse_legacy_license(d, licensestr)
+    if node:
+        walk_license(node)
     return set(licenses)
 
 def return_spdx(d, license):
-- 
2.47.3


