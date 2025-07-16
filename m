Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBDBC83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 15:16:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.24951.1752678967157360766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 08:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=ROPuAKlB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD2eQb023598
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 15:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+mGaZOFL6fcdOyUJP6JwmeE9sg1PFAQoUDNDcukom8=; b=ROPuAKlBWJpIVwuK
	n556Llr8ciIXvF6lNqmwSJKWZBX8yqNBkSoyFGYfMRMVpo1e1OHAMkX4W/wTB/pj
	9W5sIzY5ORNuZPx+iuRfK54XmJwQ7reAMoqyTr++pYNPlwlgoUkrep9+NZaG5m6J
	YQUBtL3qSXxUYQr7+Z6N1mhLanGafATaGs8W76aIA2XmYKRD2mLBsx6B9srJxpFV
	V9RYsm8u6So+v5z5E6q4fLwtg4VdY8G9VzsR+rsjSRA1ONJtJ9oj54mpeB9AGJrL
	qU7UUtHMTGIXMGv+BJVYt7Lo1lX3fq6LpR9cINGZ288fQuiyjJcViwYcbNCEe7h8
	701UiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrun70m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 15:16:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceb5b5140eso1241285985a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 08:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678965; x=1753283765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+mGaZOFL6fcdOyUJP6JwmeE9sg1PFAQoUDNDcukom8=;
        b=Hb3ZS+eyK3AbhLVAJY87aPRsTAaNs6jPD3pP6WSrDr9/HU18/SOdLaBANIkwo+psJo
         +Vrh5izWTjsnmveYsQiifJCS5GS9cQ24JZB+EE+oHYYmRjQFUnH/gtKdxzd7rAP3hn7Z
         A0PUYe1o40wldk8jOorXE746X8q6UgwSgeSoOhd+Pq7wo0TsG6lxAyO9zz9eBy9thnDr
         LRdProGRPyRDYpIgBbq0z8JzXMIxnukkiyzzLHXv2CfZxkuwKIN5tcSnNBgvjTpFHsGI
         VBkF4NPY5qkigeXWlx9KLoQH+gdPLKuNTfkQkoaYA0Fvn1mw/lNWiLDMVVICXrJ4gOed
         gQyw==
X-Gm-Message-State: AOJu0YwQUo3/S1NwrYgoGAkzgyhnbiWTO/aE1sX6YNJ2ispo2vuXxh4K
	rXXjMcFM/rf3R1i/mUu9iQv9TCUsIXK067LPV9y8rSwHBvEC4+YBMyBcyM5Nj4B+LvkVPhfwN7n
	/TxhcFFwZ7oWBM+d6g2ZghfcRjNjR4WNt17cTbaQNKfNt0eGdJuC12FmZ3s47ZRrw1xG5z2oupi
	eL2PE7DEY=
X-Gm-Gg: ASbGnct3lWCmCIsANWg+3aacQxS8Q7V/W9A6yn9ocA+REq8khXrx9b16htK21MuMvu5
	9rCmx4smDOQ3+frSUbriPtWRRf9+N5Tv35RD3zUZ/R2uMU+KzLx18dGffDeCJN+tg9jJ6AL9BFm
	FQGFp1E5TfvKMtr7MNnOwy/uj0qDEZx0Corlte1klJp5s2a4uQWPyqXG1aLJDQP59bWIaOh59QO
	EXPrpwwN/8fSm+cXPDfV0NAzenolpBeWs28CCcoWN9bbOB5D94kwauZ4OdpN0PCstW/9+P1PK+3
	GeDATJhJTrenXOeLJhF6ivp7Sl2ppMvMT68BtxnUUlNh5JWRqDMrfOMMKP5HXrZMqsazV6LlinN
	gv3Y/38sbtx2se3k=
X-Received: by 2002:a05:620a:801a:b0:7d5:d2ac:bbf7 with SMTP id af79cd13be357-7e342b36ca2mr577574985a.36.1752678964093;
        Wed, 16 Jul 2025 08:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4bIonwJcWhD5ZyspJt+ofOA9bYs1PlM8SS3Uq0YVmd7/5CRGYMwjgJ7nB1J0XzQIYX93BwQ==
X-Received: by 2002:a05:620a:801a:b0:7d5:d2ac:bbf7 with SMTP id af79cd13be357-7e342b36ca2mr577558785a.36.1752678963438;
        Wed, 16 Jul 2025 08:16:03 -0700 (PDT)
Received: from [10.143.245.182] (87-95-12-98.bb.dnainternet.fi. [87.95.12.98])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bbb52sm2680549e87.43.2025.07.16.08.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 08:16:02 -0700 (PDT)
Message-ID: <f36f22df-2afc-4c42-89e1-eb8cb0592471@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 18:16:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] spirv-llvm-translator: drop tag from the
 SRC_URI
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250716144749.1880959-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAMKF1sqkK1o3e=ehvMhkBGTFVuvPMQF0LusEYYDURfdgxLitmw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAMKF1sqkK1o3e=ehvMhkBGTFVuvPMQF0LusEYYDURfdgxLitmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-GUID: NHrGe6y7aY5kI1BWQD0TBZqwU4e8cVfb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX5fzyrC/6Vymh
 ZcLogwj7xwOhUg8jTQ6xEcAiDlSf0kEFSn7cIhQ6qwqQsq9QBeOox01yNSjByV1CaKx2lARMGvv
 vbaMcOYxI47USHY3S2OYIqHyrJ7ypvREg4tiR+QmZKuM9571Kt2O64zJYb6fShVX/oXm1K3nAlB
 ElJMrtdnpexF1Q7txcrs6MD0Bo00MVlPIcC9Otca5dMAuVY5RrNnkymXGP845zjpFwigynuZYfv
 L3DF+gMFqJF3Ib+n+wzlqFOGrgPNzD2Bmqt4hIQ1D8T/VWIiG0fupGoQi4JhKzov+mQ0ToP7ST4
 TNday0RdjXAmLH7PcNt8ahXfzFVVKZZg2EjnL3Kv6ThUrFCyswvriojCu75mpDo87/WIYvu9h+r
 9gsRA6sX95IkxYsseboKkAkfI7+mjMP9aoUvKj6z25Hwi/Oc82K4hF4Cgn8W0ud51wPCW13f
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=6877c236 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G1XBu1ow44TIBf0dtryxDQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=yk6llASYAAAA:8
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=BrSqj6rpX6RkF8N05C8A:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=z2U-W3hJrleVIN9YIjzO:22 a=NFOGd7dJGGMPyQGDc5-O:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=djwjnU9VZWk50pS01Q9E:22
X-Proofpoint-ORIG-GUID: NHrGe6y7aY5kI1BWQD0TBZqwU4e8cVfb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160138
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 56GD2eQb023598
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 15:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220471

On 16/07/2025 17:56, Khem Raj wrote:
>=20
>=20
> On Wed, Jul 16, 2025 at 7:47=E2=80=AFAM Dmitry Baryshkov via=20
> lists.openembedded.org <http://lists.openembedded.org>=20
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org=20
> <mailto:oss.qualcomm.com@lists.openembedded.org>> wrote:
>=20
>     It seems under some circumstances the tag in SRC_URI can prevent th=
e
>     recipe from being unpacked correctly. Drop it in order to let bitba=
ke
>     handle the recipe correctly.
>=20
>=20
> I think we should look more into underlying problem. I have seen=20
> projects create release tags that do not belong to any branches and can=
=20
> create fetching issues using nobranch=3D1 helped in such cases

I have no idea, because locally (and without kas) everything seems to=20
work. I suspect this might be some mis-interaction between SRCREV, tag=3D=
=20
and kas fetching sources.

>=20
>=20
>=20
>     2025-07-16T02:15:12.1679756Z 2025-07-16 02:15:12 - ERROR=C2=A0 =C2=A0=
 - ERROR:
>     spirv-llvm-translator-native-20.1.4-r0 do_unpack: Bitbake Fetcher
>     Error: FetchError('Fetch command export PSEUDO_DISABLED=3D1; export
>     GIT_PROXY_COMMAND=3D"oe-git-proxy"; export NO_PROXY=3D"*"; export
>     PATH=3D"/work/oe-core/scripts/native-intercept:/work/build/tmp/
>     sysroots-uninative/x86_64-linux/usr/bin:/work/build/tmp/work/x86_64=
-
>     linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-native/usr=
/
>     bin/python3-native:/work/oe-core/scripts:/work/build/tmp/work/
>     x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-
>     native/usr/bin/x86_64-linux:/work/build/tmp/work/x86_64-linux/spirv=
-
>     llvm-translator-native/20.1.4/recipe-sysroot-native/usr/bin:/work/
>     build/tmp/work/x86_64-linux/spirv-llvm-translator-native/20.1.4/
>     recipe-sysroot-native/usr/sbin:/work/build/tmp/work/x86_64-linux/
>     spirv-llvm-translator-native/20.1.4/recipe-sysroot-native/usr/bin:/
>     work/build/tmp/work/x86_64-linux/spirv-llvm-translator-
>     native/20.1.4/recipe-sysroot-native/sbin:/work/build/tmp/work/
>     x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-
>     native/bin:/work/bitbake/bin:/work/build/tmp/hosttools"; export
>     HOME=3D"/tmp/tmppvfb2ln5"; git -c gc.autoDetach=3Dfalse -c
>     core.pager=3Dcat -c safe.bareRepository=3Dall -c
>     clone.defaultRemoteName=3Dorigin rev-list -n 1 v20.1.4 failed with
>     exit code 128, output:\nfatal: ambiguous argument \'v20.1.4\':
>     unknown revision or path not in the working tree.\nUse \'--\' to
>     separate paths from revisions, like this:\n\'git <command>
>     [<revision>...] -- [<file>...]\'\n', None)
>     2025-07-16T02:15:12.1686736Z 2025-07-16 02:15:12 - ERROR=C2=A0 =C2=A0=
 - ERROR:
>     Logfile of failure stored in: /work/build/tmp/work/x86_64-linux/
>     spirv-llvm-translator-native/20.1.4/temp/log.do_unpack.75654
>     2025-07-16T02:15:12.1687492Z 2025-07-16 02:15:12 - INFO=C2=A0 =C2=A0=
 =C2=A0- NOTE:
>     recipe spirv-llvm-translator-native-20.1.4-r0: task do_unpack: Fail=
ed
>     2025-07-16T02:15:12.1748425Z 2025-07-16 02:15:12 - ERROR=C2=A0 =C2=A0=
 - ERROR:
>     Task (virtual:native:/work/build/../oe-core/meta/recipes-graphics/
>     spir/spirv-llvm-translator_20.1.4.bb:do_unpack) failed
>=20
>     Fixes: e3890983dbf4 ("spirv-llvm-translator: upgrade 20.1.2 -> 20.1=
.4")
>     Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com
>     <mailto:dmitry.baryshkov@oss.qualcomm.com>>
>     ---
>      =C2=A0meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
>     <http://spirv-llvm-translator_20.1.4.bb> | 2 +-
>      =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>     diff --git a/meta/recipes-graphics/spir/spirv-llvm-
>     translator_20.1.4.bb <http://spirv-llvm-translator_20.1.4.bb> b/
>     meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb <http://
>     spirv-llvm-translator_20.1.4.bb>
>     index 14e4bb74ace4..e6c6cbd69d27 100644
>     --- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
>     <http://spirv-llvm-translator_20.1.4.bb>
>     +++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
>     <http://spirv-llvm-translator_20.1.4.bb>
>     @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://
>     LICENSE.TXT;md5=3D47e311aa9caedd1b3abf098bd7814d1d"
>      =C2=A0SPIRV_BRANCH =3D "llvm_release_${@oe.utils.trim_version('${P=
V}',
>     1).replace('.', '')}0"
>      =C2=A0SRCREV =3D "74843f2186bb63b6802758222084da17fcbe603c"
>      =C2=A0SRC_URI =3D " \
>     -=C2=A0 =C2=A0 git://github.com/KhronosGroup/SPIRV-LLVM-
>     Translator;protocol=3Dhttps;tag=3Dv${PV};branch=3D${SPIRV_BRANCH} <=
http://
>     github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;tag=3D=
v$
>     %7BPV%7D;branch=3D$%7BSPIRV_BRANCH%7D> \
>     +=C2=A0 =C2=A0 git://github.com/KhronosGroup/SPIRV-LLVM-
>     Translator;protocol=3Dhttps;branch=3D${SPIRV_BRANCH} <http://github=
.com/
>     KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;branch=3D$
>     %7BSPIRV_BRANCH%7D> \
>      =C2=A0"
>=20
>      =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>     --=20
>     2.39.5
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#220464): https://lists.openembedded.org/g/
>     openembedded-core/message/220464 <https://lists.openembedded.org/g/
>     openembedded-core/message/220464>
>     Mute This Topic: https://lists.openembedded.org/mt/114186099/199791=
4
>     <https://lists.openembedded.org/mt/114186099/1997914>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/
>     unsub <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
With best wishes
Dmitry

