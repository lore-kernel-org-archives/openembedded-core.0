Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E5BCAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 11:25:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.10694.1757417094112150648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 04:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=WhqgTP0R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LScO030500
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Sep 2025 11:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dk3JUpqEEDZREYChHMsIZyJD3e3zmghgi99
	SCTO/xn0=; b=WhqgTP0REtBL/JIDyF5R11B08xIn4H8BFRD6cwVy4sPUMvvIGpO
	8S+r47Gi/b1ZzgY55P2pCR34lhgmzEHMFCjosZ7xMz6UGE0T2pwkzAWW+FVoYVGK
	0Bb1hZ41wtmQx2GcIZjtw7Sl8hxINsllwPqwxfZAf2B3JCVdWOfTK3M1W41L1eYA
	SZBx00BKd7mSGvDnC6FQDSUJhWxBPMYLHYgzVKe/xild9XOsYB2Q2EeI5VnzbmAt
	QKwUABG80BMM9WwbXWW+UT3v7X9rPSzEoNJAqkUsaACnJaZuwcVXQRotREyKdAZf
	Mb8tykWJzkEzZRJPP2okvN3bQHXU1fPQtTg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j8460-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 11:24:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d7c7e972eso118643156d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 04:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757417092; x=1758021892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dk3JUpqEEDZREYChHMsIZyJD3e3zmghgi99SCTO/xn0=;
        b=cCoO2ZdycuK9rI2GnpipJ6aTt3rCSLbQ0qlCRpTv3uFom5PjlHPuFL0638+Jvn2UvC
         HK0KxlJvnTqWiNEDnJ1lfmrkCnk0gSNN5NFN4Y1wWs/sevMIc7/kjkQDvEZGaHNiWFF7
         jtCIxx92dovilKqeOS0CTu84H17kr+sXKAtDYZaSd+/5MoREeKr8faCUSwqr2xePzWL1
         YyXSWT/ay2828iWUqQ3Hfk4IKFJNq9g3JkKuS4rHyWyUkdDJwIQbAQBhmZvJgCz1yz0s
         qGHqt8lPQSvpiDqdJH2zxVksJ+nM6dcwntTHh6UrXbreNUaMo8xodBCpFhyiQUGMVALm
         HmRw==
X-Gm-Message-State: AOJu0YzUXVukIhvM8oGwrIjkj92FNvIU1hmpLybXS9z4/amQzjlX0Rc5
	pcRKAPLTa+v6mVokJpSnSHsY/+7gyq9GK2K04gXoMVwZwjnm4QjZH3CVAZxATd0W09BV7izGOYV
	DNkbU33ees++XnjYku2olQOXNy1r+Mq47PGjPhkCo0Kg9I10zJDIGZBRrXt0Rqic5TANwrUZt2C
	1XWVxODT0G2H1tXrWN2Q==
X-Gm-Gg: ASbGncu78fa8u5REHgoybf4e93sfqfc88Lclu6ZfNLA5QUjqhv9ueUyI2IEa7uV39Cy
	P2T0Fu2aX3Kutp/nzfZ36qYxc/fCAxh699QL1rsNaGOIXJyZb6rifux5oR2h5pBf4WB23A/F7YK
	MSIJluvicv9sPlcHEVgU+lcJ2VA83PO4faTB/zUS6yUFdITSwIDhVxfPu0ajpUKAvnoEiJ/cYDs
	4nW64fE1f0YHrqlMiZ77fhQZrk4n3jLmJpijx1Rgs5LCWH5s9pZ/58irSA93CoPHUQADhWyJGaN
	jp48h+s22jfIbbvsp2Dn09CmYbePlSMeSSkjXJ6ILE6e/rvbnLERJVXUFSPHyUk=
X-Received: by 2002:a05:6214:489:b0:726:9bc3:f8b5 with SMTP id 6a1803df08f44-7393ca9c9fbmr105380696d6.32.1757417091825;
        Tue, 09 Sep 2025 04:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxyIWuCeWlKGPocLPlOojGQk9NYWe6FNmvQruN0QjJa0XBFP8/wFIeXOam5IMrkqCi28TzeQ==
X-Received: by 2002:a05:6214:489:b0:726:9bc3:f8b5 with SMTP id 6a1803df08f44-7393ca9c9fbmr105380426d6.32.1757417091350;
        Tue, 09 Sep 2025 04:24:51 -0700 (PDT)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c018f6656sm1116575a12.36.2025.09.09.04.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:24:51 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
        Antonin Godard <antonin.godard@bootlin.com>,
        Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH] systemd: change pni-names logic to something less confusing
Date: Tue,  9 Sep 2025 13:24:48 +0200
Message-Id: <20250909112448.2811932-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfXzFyTYV9BvmU1
 saV0YZkpEH9rq0wM+CGDih6g7DT8zA5KBetv6k9KiZ5k0G/oQ+jM/4EC+hnKvIXyCRT0AVFdrUH
 6LUDcxWSXxJJjYmiijQO+ibJ8R5ETB/ua+RwiOUDegTcEtT1p70o9XQwY5YmIXglep0Ws49xSCQ
 a609CEQ/PpXZhSkpGrnJqZ//6QldDyr2E0OR3nTAttwlQBnbf4hgR2TNvRAGGWeJbASD83Hyn1c
 WBu/t+jQwDCfHYTuJchyerWYY5fOymPGY9OZ1lq/m9INOB7QJI5rbx+W4xcUnTSkqk7DlsmBn0+
 n4LNrLm6+AXMcVN28zJG78pKl0jQl8qdqWhEIKJhqPSXEifTGmRGfGAFAfvkTKfIgURoLneBqki
 Vhizxjo5
X-Proofpoint-ORIG-GUID: gebcjT3uuTcvNLMi57JexgtqbDaehd6V
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c00e85 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=j3XnPaOEJHK91jmOSywA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: gebcjT3uuTcvNLMi57JexgtqbDaehd6V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 11:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223105

Using bb.utils.contains in negative logic leads to either overly verbose
or plain confusing code, so harness the power of Ross and Antonin to
make this less verbose and slightly clearer.

This moves the negative logic from the inline python ('true if not') to
bash ('if !').

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 meta/recipes-core/systemd/systemd_257.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-core/systemd/systemd_257.8.bb
index 6399c57640..549eb7fb29 100644
--- a/meta/recipes-core/systemd/systemd_257.8.bb
+++ b/meta/recipes-core/systemd/systemd_257.8.bb
@@ -401,7 +401,7 @@ do_install() {
 	fi
 
 	# Actively disable Predictable Network Interface Names
-	if ${@ 'true' if not bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d) else 'false'}; then
+	if ! ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
 		sed -i 's/^NamePolicy=.*/NamePolicy=/;s/^AlternativeNamesPolicy=.*/AlternativeNamesPolicy=/' ${D}${nonarch_libdir}/systemd/network/99-default.link
 	fi
 }
-- 
2.34.1


