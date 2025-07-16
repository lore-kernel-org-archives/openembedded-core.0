Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CD2C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 14:47:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.24174.1752677274164773772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 07:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gc70NNvI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GDFLnt008209
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 14:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s4fGUVGwkOqLk0+Gp3aXeLnrLd8i/fQyHFr
	HmO1aG8U=; b=gc70NNvIPpm36CJx/aUi4haFRaCOtCe3H0subRYkeqfCDR41UnW
	0IntETmSCFJZyC2Ox/Hh8oiEzbz86hOKPmimh9J108IHPM0fnlap/rqz/iLjROMB
	klfYZER2fwp97FPoo754euoYvU/mieOeK7/MMjJHpHEgz529pePvIpinsVNxfI5W
	AuTwS5NXghSz8c+IOXjllLy3AvGg7wQ65pySYSBLr7YThwyCQaOn/E7w8R5XTUqE
	kqa3mFGknOozUWCJdSUcE9KllkOP0x6EzAGWKZqirJ9EdMPzxNdL1D1EmrzUlYza
	K1viLKV7Oud/u5BiAIiUaoSVV2tLXvNMKqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5vhbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 14:47:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so1245606885a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 07:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677272; x=1753282072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4fGUVGwkOqLk0+Gp3aXeLnrLd8i/fQyHFrHmO1aG8U=;
        b=GEDh4ObHPsSRpn5NFm5OK8Vhxeb9OHLS3xGRuFDxjiJkz58Rd6mrwpmafEovF8sxig
         9gfdx3hXHv6fNdGn+lnh68sV+WBBf8JvAHVY68+Dsy6L6pAYSm7FJ/drjeAdHx/cTiHg
         bybjDcTYsjhhDODKLFyiHijxnVq9Nb9mgy5po74J0AMO9c1HVmOA2iQceT69j177AVZQ
         9c/fzeM7gIopJYbObNwLhHRKxNVKs2NSZMKqoabfwOIU2J7cuDtKK8BI6zsUPTX1qgcb
         kHGSbpKOAEJObXAi/1mCXKtxl+0BmcZsDoMuLtMVhxAR8b3+j92lPUEsFi7LT4GKpB2B
         E9GA==
X-Gm-Message-State: AOJu0YxUwZPU0FFtjAcir7EhXO7xpTHi6oEDrHMcF2mOTpgoGzC56rAL
	oXxsrdymqvAnivpHo21OsSCyn2oxpJ1G7bwyzW/6+IEScvg25b7U9KBuykSZVbAH6hAtnefuJ4K
	/jFclXUjAMVtYFREJ42PL654veipnkxwg7/uvO5ep49dc3hHRWGt3f3gHgeiKveUIAlRH8fTR4G
	4TMEb3NzTD1K1jezA=
X-Gm-Gg: ASbGncvXRrZLk3oSqcOm7P2tMfK5pbSH/LdDTNA70X2blEC4jqSTzlNfDbWZ9i+sS3U
	o91uvUco6QmAUBeO3g2RebINaBIBu3v4JlTrOFPTtMD7BoiJd3sHh8BWKZo8p3LqPTFtjd+9Xdw
	njEE2y6jdtgR17OjPoZ73gra8LmU4CBmwqju9oTHX8k2h8xMjeA0n37pI+XViSyfGiyIQdSLJLb
	b8Mpmv5jeDnG8RNJvYGdHEQqFQqrxTpRVTYMsO5wNZq/8Xsl+9uifpTK18mXSou5QBjv+kosCvt
	PgOLSWZbpKCfipK70VblxKvk0FOLkcADPIoeF94ArGQBkGzmHua/+y7rPN2OK0adGAMifxH3X3V
	8pCjbjXY8zIPm7bDQPN08yYI/G9exfpZHn4pNkwZOmU+MQVuL4K4N
X-Received: by 2002:a05:620a:2b8a:b0:7e3:2ee5:71b4 with SMTP id af79cd13be357-7e343350d76mr424406785a.8.1752677271661;
        Wed, 16 Jul 2025 07:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHldpTH+VdrLbH2IUjWhzgJJxPOINJvrQC/HWgog94p0tbceX82noM7i2DEdqj8nLG7RbnCrA==
X-Received: by 2002:a05:620a:2b8a:b0:7e3:2ee5:71b4 with SMTP id af79cd13be357-7e343350d76mr424400685a.8.1752677270941;
        Wed, 16 Jul 2025 07:47:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab916bebsm20755231fa.105.2025.07.16.07.47.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:47:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] spirv-llvm-translator: drop tag from the SRC_URI
Date: Wed, 16 Jul 2025 17:47:49 +0300
Message-Id: <20250716144749.1880959-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6877bb99 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=Fac8mkbmCVA-2DE_Y2kA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BxeQc13LFSUEzti78tIC8Io0X_Ci7PF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzMyBTYWx0ZWRfXxstmIM43ZLno
 raR7SWC08yFsi7r10wITNV5UdBUP0wNU17n+RjJ8JyVEKrMdyIJFid0u7xs3mB9qngLbzmvUdfs
 dfz1A+dD6F4z6uOQTW2ktmXNptLZMnifINKp/Aihx1ozetvZmYdJbp9G4iafraYgYAluqPzpEEa
 DE57PdQC7SSmwYKD5N7ZSKQsTPo9ziM3DKxt/xtRvqv6xvf+Yz3wZff+5M66olAZkdl+gIJ429x
 x2ec/P+Ec3Fu1AeehEpcDuYjnEuEBWCqtUsOw/lUs5/gY/pnIHtw8ts/qJX0PJmYEmdkjncF+fA
 ELbj66w57cw8R24Ye7APx6blWmAOLsVeWrqYlbBS5WIXhnAaoKt/LqvLbrDTFIEMcsceoAebqzq
 oViu4OWpiBVHVgWDNoBCyD8WcfzYjDQD9ueiGbQvV5wig50mEhZyKisJrI5oNX/TKPqcTiFf
X-Proofpoint-ORIG-GUID: BxeQc13LFSUEzti78tIC8Io0X_Ci7PF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 14:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220464

It seems under some circumstances the tag in SRC_URI can prevent the
recipe from being unpacked correctly. Drop it in order to let bitbake
handle the recipe correctly.

2025-07-16T02:15:12.1679756Z 2025-07-16 02:15:12 - ERROR    - ERROR: spirv-=
llvm-translator-native-20.1.4-r0 do_unpack: Bitbake Fetcher Error: FetchErr=
or('Fetch command export PSEUDO_DISABLED=3D1; export GIT_PROXY_COMMAND=3D"o=
e-git-proxy"; export NO_PROXY=3D"*"; export PATH=3D"/work/oe-core/scripts/n=
ative-intercept:/work/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/wo=
rk/build/tmp/work/x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-s=
ysroot-native/usr/bin/python3-native:/work/oe-core/scripts:/work/build/tmp/=
work/x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-native=
/usr/bin/x86_64-linux:/work/build/tmp/work/x86_64-linux/spirv-llvm-translat=
or-native/20.1.4/recipe-sysroot-native/usr/bin:/work/build/tmp/work/x86_64-=
linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-native/usr/sbin:/w=
ork/build/tmp/work/x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-=
sysroot-native/usr/bin:/work/build/tmp/work/x86_64-linux/spirv-llvm-transla=
tor-native/20.1.4/recipe-sysroot-native/sbin:/work/build/tmp/work/x86_64-li=
nux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-native/bin:/work/bit=
bake/bin:/work/build/tmp/hosttools"; export HOME=3D"/tmp/tmppvfb2ln5"; git =
-c gc.autoDetach=3Dfalse -c core.pager=3Dcat -c safe.bareRepository=3Dall -=
c clone.defaultRemoteName=3Dorigin rev-list -n 1 v20.1.4 failed with exit c=
ode 128, output:\nfatal: ambiguous argument \'v20.1.4\': unknown revision o=
r path not in the working tree.\nUse \'--\' to separate paths from revision=
s, like this:\n\'git <command> [<revision>...] -- [<file>...]\'\n', None)
2025-07-16T02:15:12.1686736Z 2025-07-16 02:15:12 - ERROR    - ERROR: Logfil=
e of failure stored in: /work/build/tmp/work/x86_64-linux/spirv-llvm-transl=
ator-native/20.1.4/temp/log.do_unpack.75654
2025-07-16T02:15:12.1687492Z 2025-07-16 02:15:12 - INFO     - NOTE: recipe =
spirv-llvm-translator-native-20.1.4-r0: task do_unpack: Failed
2025-07-16T02:15:12.1748425Z 2025-07-16 02:15:12 - ERROR    - ERROR: Task (=
virtual:native:/work/build/../oe-core/meta/recipes-graphics/spir/spirv-llvm=
-translator_20.1.4.bb:do_unpack) failed

Fixes: e3890983dbf4 ("spirv-llvm-translator: upgrade 20.1.2 -> 20.1.4")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb b/m=
eta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
index 14e4bb74ace4..e6c6cbd69d27 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D47e311aa9cae=
dd1b3abf098bd7814d1d"
 SPIRV_BRANCH =3D "llvm_release_${@oe.utils.trim_version('${PV}', 1).replac=
e('.', '')}0"
 SRCREV =3D "74843f2186bb63b6802758222084da17fcbe603c"
 SRC_URI =3D " \
-    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;t=
ag=3Dv${PV};branch=3D${SPIRV_BRANCH} \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;b=
ranch=3D${SPIRV_BRANCH} \
 "
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
--=20
2.39.5


