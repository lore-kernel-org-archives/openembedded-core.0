Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19206C369B1
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 22:09:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.38811.1744409362669767144
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 15:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ori3lkUz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFiSiR019629
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u6UG6ZM5UrXTCK3/sjn3Hg7Znll8PCBtcru2pFnUQlA=; b=Ori3lkUzTuSRCCwU
	T3DcTeXsUkqjzI8lR5m6Af6C9bhaKtGUetHIZQAcddGK4SgJnk+0zUwnwMxBP41e
	Ps2YKTz98iTUvtETejkibYFB4sF0fNbuXi7YLnn6xMXCLEoQRqaJdRPY3RcDCcOf
	d1QIqxCR4ZRvFU5mvZfVNRtS/MEBPU8nLKnGhDysAdWa4ReDF/Q1FVSTg3B5nq9i
	SmSolWXfyn64Gv0+rh5Bwg2xXuhmjH6Wo3srTSxvNcbEuoFJnyBKkmdIO3RthbVm
	gXEUm/dLe0vdW3p4e42vW82MXsrLbWqZELtiCs/lz0yO0G/F5C7sX4bu+IBvCPV4
	vDmqmA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcruvay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so695808985a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 15:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744409360; x=1745014160;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6UG6ZM5UrXTCK3/sjn3Hg7Znll8PCBtcru2pFnUQlA=;
        b=FuaywPxrJWnM9DKjrGZRqv6XEizIK0DP7cJt36rZjLF5muCbkRBZPtZVM6JsoN4BGw
         uhXzeQW4dU1TMRj5Pp4XoY5Z92Vo1t2TLjpMdgFP8zfRNayBE/SN5gVOAcnTqOg2Qd1g
         PhHZ49Y5lcAl2gBmcbu9yOzeO8F5OPNf5te9FlqjWu9FsuX5zASvnBy5uflGqCD1luqy
         awjkzJeZK7peUy4H83ZmOHN8xzRjyoWx2GXvQsd31OLpjeoq3B19zUKngDzsejPq0cCW
         cj56+JYKiDhOcr2EXpxadzuxMyj3p/ifRYojJiobJYwl6IyVlY/86hotBC6qoTqPrVlj
         UDyQ==
X-Gm-Message-State: AOJu0YwfoUv1SQAJ8dumcsW4YoZwWeOT47o9lmm6+l84vzvPIpnD7LSv
	/8zV/rKt9bR1Q4kKaQTRq7aDUaqRBu1BhNVe7R6CWHcXzLjT1/g8TnvXzbsh1G3OWODw7G5O9cA
	MWwx7r/4buRJo1gtdkgIOr/EXagZOe+7f5Px8Py2QRfjo2dDFcwx1difFoufTmICJZgXvEojjyJ
	BsqsdxulbiEbw=
X-Gm-Gg: ASbGnctmA7TUb8t4K+o3WColE+K95FI53GCp8MnKAf+CRwC0iGYjlYTnU5ug/shzBA1
	+GkQzhGlxUub8eE/UmgkLj6n7XGllhB62Nuc2rW7TnFIU4wfGuYo+IZDdj+3vi97CkTpUbzcg2l
	xD4sotI5Mc5p2ajMJ5+jkNiGk9aUXCYpqJ+kcn6o52Hy3aImJsD5G0tmfi6Fl5lpkwP1PAkpsdA
	PkAjwD8R8jQdZaSLF4V/t9P5CokgtOScvz4pv7nxRYWmlZ8c3P39nTw3r47Nab4dszo6TPgoEwP
	8UQE2A3Ze/mgB560H3fZX7iO9ipGV+6Qi4N6YEqbrjNLNzWBp8XCDosfweWEzGRfeBo3dl92ibe
	oQVXMtW5Lg5PFyj346j8Hn5Iy
X-Received: by 2002:a05:620a:3949:b0:7c5:994a:7f62 with SMTP id af79cd13be357-7c7af11f4cbmr699399685a.41.1744409360757;
        Fri, 11 Apr 2025 15:09:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8dGjM+3+/29IlETM3hfVhoZSBG3XvuTk1iZt7OjYxLXQuRSckcBHQC4ddelR46XeFQpPXbg==
X-Received: by 2002:a05:620a:3949:b0:7c5:994a:7f62 with SMTP id af79cd13be357-7c7af11f4cbmr699396385a.41.1744409360365;
        Fri, 11 Apr 2025 15:09:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510076sm518432e87.175.2025.04.11.15.09.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:09:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 01:09:11 +0300
Subject: [PATCH 2/7] meson: pass -target and -I to bindgen calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-mesa-25-fixes-v1-2-791840391271@oss.qualcomm.com>
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
In-Reply-To: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IHpEZaEk5c5V//eNaDaKFBkCrlcHIGS7GMwYlkAQQZU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn+ZMGMj4VCIwrsf1bgH1gb28dRp93ZwSWpVniq
 XtAGIrT5y6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/mTBgAKCRCLPIo+Aiko
 1TXlB/9WeVW583HDpXwxmBU9MSbdZCyoBmtEZxTaHb/Tr3ym68yMKWm5SL1PYG4C0wF4L2il6y8
 vU6G4+XjkDGyVojMIgEjYy4Hmm8YZbyPWhoeapRIosT0oeOwEQuUk1pgt3JDlWysCXaycz1Jebr
 XlholDO2xqDlnteJ96qHpPi1NjRi084e7sTL2AkgiE5DTRJ1oEyiJoxYL/G880Lu7ik8eOPk370
 /P20cCpkE/uEpH2LmUXnpPfQwT25z0Aoqe84FJrqQSAqyXlz8Pybwfq96ifeMKdEyZ+Y/UiF7n/
 Eb248GW5ZZtnJYK2UISLAFW3MLktl4G7A04LiATFQxhBivx4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 2AgDV8t2_GiUCjNToQtLVO1Z6_6K6DR_
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f99311 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=E226iTZLpvBttkJnM84A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2AgDV8t2_GiUCjNToQtLVO1Z6_6K6DR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=671 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214764

In order to properly generate Rust bindings for the target systems, we
need to pass '-taget foo-linux-gnueabi' flags and a correct include
target include path (${STAGING_INCDIR}) to the bindgen. Add those
flags to the generated meson target file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/classes-recipe/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index cbfc45b94bbd076735847134a0976b6b30784d50..ef45a034a767e979a45553ba08e46dc90e34f33f 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -93,6 +93,7 @@ cpp_link_args = ${@meson_array('LDFLAGS', d)}
 [properties]
 needs_exe_wrapper = true
 sys_root = '${STAGING_DIR_HOST}'
+bindgen_clang_arguments = ['-target', '${@d.getVar('RUST_HOST_SYS')}', '-I${STAGING_INCDIR}']
 
 [host_machine]
 system = '${@meson_operating_system('HOST_OS', d)}'

-- 
2.39.5


