Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE568EE4998
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 19:05:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70588.1767121514560140105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 11:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=SZV2Pe4u;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=BixlWrAh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU8p28K2286074
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 19:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uVxwMLF6rS59YQaXgj0LRr
	+dsmjWXLw0xRwBodY77AE=; b=SZV2Pe4utkuY1E92yJtfqEYXkvIZD1d5Q6UR89
	Kf1EmnRAnII6Ecy+noj68uAxypc6OXpSu3EmtFRFBUY75SSoizBJDV5IZAzYLdW/
	V9qw22bSC5oikKFtjexks1mXYwjrPjyKYJLI2Lhl+XP7MRn705CtdBrzTytIwVNE
	s0S4pIqF3EOY8Iq8hL+UjC+Nvxr8tfQ7I8f4u/eXp5v2StWZGib0ktWxv/ynUWmH
	V/JBlOvQk4iQhwI14x5Hw2Dz63q3zUhap1Qb+xyZkFejod6+HIpoLnzjI2RF7iOj
	5SUH/QUgAW43X4jwb0c8zlYRXDVgh8T6KvNRQB04HYA2wFjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gttys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 19:05:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed69f9ce96so358253411cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 11:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767121513; x=1767726313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uVxwMLF6rS59YQaXgj0LRr+dsmjWXLw0xRwBodY77AE=;
        b=BixlWrAhlvH4OiUEs+wjftfNw6Y1mTyjaXj9cUiyKTif6RiE4Q8RoxHdDSMSfgKWvg
         gUog7sX0VKVixnIfwQC14GYe9uIcR+0kKYk8pZSEyRj6AeDXuK5gk88S0HAq0pQ0hYBo
         RhvTIWfpDzakqu7KJSPemwCBbzID6ZGF7a9KnaCMoyikf502tN1+8n2J55nE37y8i4YR
         pKmonWqSGvFR1rh6W8dHr+mgCTYqrJEJGq1kEaolcjM4ygTj5Ouj4YWHn1vhPzbvI0m+
         5SaVU7ab02K5M0NvgDulFqW7Bcb6v+l7o4UvJq1SYBTosITSBzCYUpcOGwO3UgvYTW24
         j9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767121513; x=1767726313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVxwMLF6rS59YQaXgj0LRr+dsmjWXLw0xRwBodY77AE=;
        b=NFSHqwylAn65gtRt/FCc0jY4vm5rGsfgVZbJdQqhj594KCTmoaKiQcRED4TIR9qY4B
         w+ca6HlMxDa5DA1jxQ90qbR+OAxZ2z/Cwp2CLC3f64/RnCET9xUyGRMB6lmfwtorqw65
         qy17NoffLlwH3ZGnaAQpJoUPya+WAClBLy1jGkpoBoN1LaGvhuwG2TKl+a2KrxkoejLJ
         Xi+rbBS1MkRAXDDzE6yUzUoBoPC3PKionZn5rlAqllsxj2rXWRroZMBP2vwc1MyN+TFF
         T83/aH6ybN8rMV+Ql21faf66aMsYrXo6b5Go1xD1CiTDPCKJgFcsG9QAEGmGHb9ewY68
         RlEA==
X-Gm-Message-State: AOJu0YyeGWVTfMfylFVT3GpNN7sKRvrEP/EVwLG7dMw2//Z9OW2tZ5UI
	1+2GtA1VE+fO4vOYhPNMfwUdFFKN3yUW2CSLTRenP8N8sCM+nNCCIMNGaxOFql9OR9ER7OuSv+1
	1ZfmE3w/5F9aDpX4kzXPTCRT6jre0l0OrZEqWSoeqPxg6v3JBsZy2k2mjhLLCcHlvB15BuanyDK
	tB7mGx8S+Py9QJ4TM=
X-Gm-Gg: AY/fxX4/+Trk1NcDEBuvan0u8OXuZ7DZAvuH5OG1qVDqHq0f12SfC0kd2jRjVIkOunc
	io6HE6WAAH9AplEeFYje97rI6dKMglk6AzeTqO6oejj1RAZWmPCiMIrRw3M38jY9PZEzaM4+TfN
	BJDWENiB9Pljkcca4NFqPS0rIFLBLCI91rAmOpvUzu4fdU1TDsK1CAcNTXVdeuLzs+BJElYt4eF
	OLtPRJxBmeUB+Y1TAX3pu8HLG5aJ3SzarRdiEBdjVP5JBQ324xgCPQjZhnj/jAM5SDTRFw8uAx2
	5LDAIr1x3TIm5lOi+QQhsD4az1XzPilNXkpcm0c7EPFr8bu0enl5FPqpRq5W8khobGtGKW+HRWZ
	s4n/MEyCBSrg1EKt8YgE4y1hZmZ3xnl/y5jHPmn3/whLsXBS6qOXEFOkh3+e4wK6pUOvS59HEja
	xwSTgr2iovUbTFdO8F3xfStu4=
X-Received: by 2002:ac8:6f0d:0:b0:4f0:2d78:b965 with SMTP id d75a77b69052e-4f4abcb8c8dmr460935021cf.9.1767121512618;
        Tue, 30 Dec 2025 11:05:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDp8KnzEt/lT9s+1cGGotPsyNoPTBkCwGOCKDV7gCBicjCURaIgLaKUCpbpoZdnnGBwkkbiw==
X-Received: by 2002:ac8:6f0d:0:b0:4f0:2d78:b965 with SMTP id d75a77b69052e-4f4abcb8c8dmr460934411cf.9.1767121512033;
        Tue, 30 Dec 2025 11:05:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f659sm10381354e87.75.2025.12.30.11.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 11:05:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH] systemd: fix excess systemd -> ukify -> python dependency
Date: Tue, 30 Dec 2025 21:05:10 +0200
Message-ID: <20251230190510.1097045-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-ORIG-GUID: loJgLI2XqjKkPTlhK5j9tcgt_OESrWLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE3MSBTYWx0ZWRfX5bLtr34Wl8z/
 6aYJsNLCnUNLHTuFfI9LVbjSsBX54tCJjzUw8mkiirWHT3mv02UcQkftULW+2fj1vQZsWsYy4Oe
 w2IEdCXxLNEc/ONb/b5OmbJBaCC0c7z3BNilJATcCuxRMY7ltc64Vbhl4HCQsIToneIV3z94YF5
 g7Klwp11DMHMvsiVrm/c8GY2EX7g7iO7U/bwlekyCJsEmBVvZb4xbUAFYkhwScuNPEFqSQBQqfJ
 Tc9MMBEJWEnR31HMOb+oDW8yf1lSyj6+jLtQRdwWUF9yMl0OBWeuMVIylJ27m0ag2wu4ghDahIY
 31fzigTkQB27ylBmJ+vsosid+9qIg2up4+5Iul1QGeq0r/fvo00w/yh4KIYOdP27yreF3iF6suW
 ModPUXLCc26lbasBbAl2KI5CiS8th0j+zTTStSQa5nft6205r9PApE/BqMo1kT1q1Eip1QxLmKH
 66L/S/jEV+DFHKlpHcg==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=69542269 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Gk7gGtQiGRs1Ikr-YFwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: loJgLI2XqjKkPTlhK5j9tcgt_OESrWLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_03,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300171
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5BU8p28K2286074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 19:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228690

The systemd package contains a symlink to ukify binary under the
libdir/systemd. This symlink forces the systemd -> systemd-ukify
dependency, which also pulls in a set of python packages, which might be
undesirable for the small isntallations. Move the symlink to the
systemd-ukify package, removing this dependency and preventing the
excess growth of the rootfs / initramfst.

Fixes: e92427496210 ("systemd: package 'ukify' seperately")
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-core/systemd/systemd_258.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-co=
re/systemd/systemd_258.1.bb
index 70414b03a481..410396f30834 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -633,7 +633,10 @@ FILES:${PN}-udev-rules =3D "\
=20
 SUMMARY:${PN}-ukify =3D "Create and inspect Unified Kernel Images (UKIs)=
"
 DESCRIPTION:${PN}-ukify =3D "ukify is a tool whose primary purpose is to=
 combine components (usually a kernel, an initrd, and a UEFI boot stub) t=
o create a Unified Kernel Image (UKI) =E2=80=94 a PE binary that can be e=
xecuted by the firmware to start the embedded linux kernel."
-FILES:${PN}-ukify =3D "${bindir}/ukify"
+FILES:${PN}-ukify =3D " \
+    ${bindir}/ukify \
+    ${nonarch_libdir}/systemd/ukify \
+"
 RDEPENDS:${PN}-ukify =3D " \
                         python3-compression \
                         python3-core \
--=20
2.47.3


