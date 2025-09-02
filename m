Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63232CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 09:09:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.72760.1756804172056869536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 02:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=N1/1QKZ1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RphE012533
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Sep 2025 09:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Gt2q6xqA3oWjYeVpvPtktM9INLdDkdO8pSq
	nQN6lW/k=; b=N1/1QKZ1Qs7BByQocmOTz+Mwc+0eC85zOReDRcWHjmvxdBkIHYb
	uWv2tKqrofhONCWHarkSBObVtmtYsTZBMBudPszg1gPMgVS5k9x1faERpIfLIjz+
	83GsK0o7FDPtb2CR+1qb+e2o/ocCbWl4729+KpfxmJYPDaWplRGC2KUbeOsn1tjB
	sAWDW3V4+YLmyw/LCnGYw0nsgvFuUSd0Ed/Xoj8FYmkqV0dHWpt7XK+J/aGeceXV
	zUggWbZYrIsjYX/p9oHyTtBv2Nnersjm3vKfhBC9x5/jw7H8lto21xHTbKKc5SfM
	EG14jp4wp22jenikODbJlTSdfUcTsoBf4kw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0efc4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 09:09:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70fa9206690so46537046d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804170; x=1757408970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gt2q6xqA3oWjYeVpvPtktM9INLdDkdO8pSqnQN6lW/k=;
        b=w/IFYZtUMPSevGQUcQQfjtEQyxRpbVy2XKKLb8C6h6mKzJrPqUMHOzuX6O6DJI/23e
         wY2vOw78XuDwsJY+5Jspgjx7lbDkNObAeMUo8AAlEPCMTPVBA+HIwuGCapI/t3U4W3zq
         eyESfgAQh+1xfzjRdDQkHErMax0cTKioYiQT5NobwriG1PE6xpQ++OLhJtESelrk3SyG
         t8NnRq+B99RLKtHRe/iMQZWEKKta9Zk24uWTlhsJA+maUpu8FrxbA/vA1fDz6XAM0Tkz
         KdHz392YGGaKJJV56HMT4KvizaFqaQOtgfP8fxSW5r1GVB2LOqg/BamCgebfGBh0xXwl
         e8Rg==
X-Gm-Message-State: AOJu0YwoWSQvi/URkLro/+bYzyMYdy6atOeo9697EBIEixgxiZ4eu+Zj
	xHN038SKXxXtLPrvPpXbDQzdaJuM7003BTNxijko+3bDC52XU66LWkyYuaV6qiTw7iE3dqz4wV2
	wZjxXMUTg9dIjogfC5udPC3yTO1mRrh126fDIvYYRDHaPkrH8WQfLoVa3yzmbhg+El5+8TTqeVY
	ePQFmJ1H5zzA0XhDYe4Q==
X-Gm-Gg: ASbGncuUdFZkRsHlHnvZ76QHznRCidOk8NfPdQNCarRmu4ECtwqF7icGvRQ+9lJas75
	Bk8TQ8ESEcIdk+wVt0Heda2RcteGZZhAqAtdKL9NvJbApMiO3QI0bC0wAKsYxNiSjJ7jPgjtleV
	n+EPVxNHS7kNsG1827LkFvcX8y2HjKmaXke+kAwKSt4JoGUoH7QHf2oEu5e+QMN6+5nBwKQ9TbI
	9404Lieu573AtnCvf4dzQGcrLRzTUx67qasjYJiZC5s2UH3aslboszG3buyexIikbF6qX0a059G
	4E7EZ92yy95k+PpBKgcNlCj+I7Gdp2A0EiIc137iKvtYysRVssJgk5iDtIwTXVc=
X-Received: by 2002:a05:622a:1449:b0:4b3:1861:f0bb with SMTP id d75a77b69052e-4b31ba1dfbbmr123198051cf.42.1756804169810;
        Tue, 02 Sep 2025 02:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj5KFhc5fm7VfxZrQV7Qxm8xTeuJhXeHonViO4aZCBSBgzDxb1iC+iwrqdPnFaMWlsTkyR1Q==
X-Received: by 2002:a05:622a:1449:b0:4b3:1861:f0bb with SMTP id d75a77b69052e-4b31ba1dfbbmr123197731cf.42.1756804169263;
        Tue, 02 Sep 2025 02:09:29 -0700 (PDT)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b018fe7c638sm816854066b.6.2025.09.02.02.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:09:28 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
        Peter Marko <peter.marko@siemens.com>,
        Ross Burton <ross.burton@arm.com>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
        Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH] systemd: stop enabling non-standard MAC policy when using the 'pni-names' DISTRO_FEATURE
Date: Tue,  2 Sep 2025 11:09:25 +0200
Message-Id: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LU_tiz-YYF4Z27i3yrDWJsNqsXqT-VPa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX7bIan9z2VdvN
 am3xZBlNoMTmhmSt18jOt1Q7Cggbpk2cCncloFK3hu/4fOP/orw8jWIEre6SlSFXE9gwkqeCh28
 nxkvUydKKWIYIh07dZzUMLRPNDi6gzEfgaEIw511GN12ZXOltNJYdY9qpX3krNOiStHqBNPTN2S
 ECrp/lpYH1m9I/HH2gjDfyE5IRRGZ1UugIyxeJEmTaJ6lsSZV0H0u04PuK7Qx1Ddd3E9VXbzWb8
 ws8EbTZ443O7sg3+CCzIhvcMv5l56jxqhMDvrnJ55WQmN5UPMXRbjD1XWUkNDqgv4HoOACTHYcf
 2thg1gsb80pdVoSNvDaDmpkVWW8MAj0vZXt6hEQ9qZhEVzrhtxVaINMO/4rYQH2n7KPXw6S1GCN
 JofivBUj
X-Proofpoint-ORIG-GUID: LU_tiz-YYF4Z27i3yrDWJsNqsXqT-VPa
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b6b44b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=szheEyiwS1V7Q1GT_VYA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 09:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222717

This recipe enabled an additional, non-standard policy for predictable
network names: the MAC policy. This is a deviation from upstream
policies and in cases where no MAC address is available, it makes it
actively worse by changing the name(s) every boot.

Change the logic to disable predictable naming when the DISTRO_FEATURE
isn't enabled and only use upstream logic with it *is* enabled.

For DISTROs that wish to use non-standard policies, a DISTRO layer is the correct place.
E.g. in DISTRO_LAYER/recipes-core/systemd/systemd_%.bbappend:

do_install:append:DISTRO() {
       if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
               if ! grep -q '^NamePolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
                       sed -i '/^NamePolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
               fi
               if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
                       sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
               fi
}

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 meta/recipes-core/systemd/systemd_257.8.bb | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-core/systemd/systemd_257.8.bb
index 174372be03..6399c57640 100644
--- a/meta/recipes-core/systemd/systemd_257.8.bb
+++ b/meta/recipes-core/systemd/systemd_257.8.bb
@@ -400,15 +400,8 @@ do_install() {
 			${D}/${sysconfdir}/systemd/system.conf
 	fi
 
-	if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
-		if ! grep -q '^NamePolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
-			sed -i '/^NamePolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
-		fi
-		if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
-			sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
-		fi
-	else
-		# Actively disable Predictable Network Interface Names
+	# Actively disable Predictable Network Interface Names
+	if ${@ 'true' if not bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d) else 'false'}; then
 		sed -i 's/^NamePolicy=.*/NamePolicy=/;s/^AlternativeNamesPolicy=.*/AlternativeNamesPolicy=/' ${D}${nonarch_libdir}/systemd/network/99-default.link
 	fi
 }
-- 
2.34.1


