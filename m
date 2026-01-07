Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E1AD0D157
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12507.1767808900330431156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mqbgyTXC;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Fu9jriVO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607FxAhj1979560
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jan 2026 18:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9HsloniewYl8MKnfmvd7AhrQXuZ4u41mCXflrqMicI=; b=mqbgyTXCpocPWdsN
	siTeSxdzHcHaQX2LJ1BIMbUt9YiihGUU1/5kwUnzhBodxYpW8Zw2RlEyWuC8IjBI
	gF19LzL3UmiZu/S9AQHGw/QzE0zVZByKJ+Qy/gz/mCliJ3LrbM/j3m0w288J/6Nz
	IEhyRuI/4EOy9xzMkIIdSnqErKBGAlreN0kwzXXiaBeReJOu+9yn5iMBKKj059OO
	qolTJuuk4rHN7v43y4Dca58vJcgeqbzpmMvZIu5RY2EAvLm7c3Peoq1S9mcHbRhp
	KfPDt6EodzqnQeOq7TiT4fewRvDv28d/z8f+ewN36XakZujACTuOuyVjIihgvwvF
	Rh+cNw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavk4cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 18:01:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5634817781dso904920e0c.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767808898; x=1768413698; darn=lists.openembedded.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9HsloniewYl8MKnfmvd7AhrQXuZ4u41mCXflrqMicI=;
        b=Fu9jriVOCpQpAHvY2AEe4H0cA+K2QY1TeNN0K7uj3ntfxHiFW4S+T3scND8EFcZ/T2
         kHplPfotVTvLVJuebRqOeK/4FPf15w0HOngtrXAMDnoFebKrESax/6C2U8S0GBw7fuuh
         6nHxJ6SI5YQRdLRSQU7Rr/kNhvZ5J8K+zlFD7cYK1k+R48utJSd2PJYOPW1LSIyB8uW0
         +0Bc+um8LxXNhRpVxrLDLpsCHbuK/OJB6dUEFK+SNpubKagDyjkBfkFtLCrpy3K/3eM0
         nsHhOzk2bHGY+S4ksGVdA/y9WJsz648mls5CzchBJQx27iMW2uaGjn0/+/3fvaYHfA9/
         7LsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767808898; x=1768413698;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G9HsloniewYl8MKnfmvd7AhrQXuZ4u41mCXflrqMicI=;
        b=AbqASOGJM4TYJphuhGmniLkU4RzWslBgEqZFYrK2gfP+8WAc7wVKE2zcXzlORJUY2f
         +wuaNHpM1l8JlmgnkGPrSEApfCJG1nJPI9ZMenwyIgiJk0aCJPUoRB4co+7Fz0HnY19H
         +tIG7K+wGkc5GdcEOyd7nZg45FcaI5+gMvSesIYY5gmKf6q8O/qCkhikJGrRk9OUPO2o
         gaiX76ZlmUVRYDauBUmwaeOhvQyCg1PO7xivQsQpywt7w4d+LVchAy5i3B89t8gSHV4i
         xMSU7hlaw4NWZn+4hezcTw7SJjX+7bRw0HwS4R7fkspIsRzzYUcSgOUh05Ks78jWxFWe
         MmHQ==
X-Gm-Message-State: AOJu0YxE/CSYxPhnlUUJGvcfL/eRbJwp3Yyv7nHnm0sxb7lp1RR1VQKk
	gDSCb+Po+uJIiCKISkytsOjfqYoNYW5k0U+DCC8jM/ql2F1+1Jhm+M6viL9CGpfxQyVWIVb80kb
	zA75ig1XQrDwcOEG4Ba3WCupfagZrE28fJs9F5+QOEMaRzplXzsFAD4fqFTHld3ozNdLsHIcdIH
	rjLS0oWPxUMhvvFCA=
X-Gm-Gg: AY/fxX4VUgOT8wF+YtYJS3PjfqecvGEqBMWKGfJTv1jM6orRkzpwOJWgefYozdILBvq
	yV/6UpIHhR9xckzAkuQronuJ/hlx18P4vPvUn6ZlOo4sWNIzWTD+D1z74g4joH+BVmHB/8BbkyP
	zw24gU2OeqJFNzuh9ZFqDBrWSbUCEYM5hs2jj1Pp8SRR4YInLZy8WATIqK0Now4uFD/kmGEc+9c
	74hNtXlD6FkX72pdBfMV/zuCp5LWhbBpbYC1jsckmzR/LkBFaXsb6ayPZ6cCaZMypHyzvr9WdRO
	DHmAnKwFd3A4OP+pKDXHrDj6TYjJO+zedlquHS/ZvkIL91+rZfGy4/2SSnCLeW8bUbab5HCYeI2
	TCjJ8ohbz29s7GK7IdinO2HlrbhRxcuXlTcOCAlsgsmNgqKGgHalLh8HUMjXYBkV3
X-Received: by 2002:a05:6122:208a:b0:55b:305b:4e45 with SMTP id 71dfb90a1353d-56347fddcbemr1126260e0c.17.1767808896204;
        Wed, 07 Jan 2026 10:01:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeaWLkYTBnarB80Hu7WTtTHkKZYg3IPs2eYQrz2+mg2rql3KC7NV3nAZs7JdGz33hHE74uJg==
X-Received: by 2002:a05:6122:208a:b0:55b:305b:4e45 with SMTP id 71dfb90a1353d-56347fddcbemr1125326e0c.17.1767808891775;
        Wed, 07 Jan 2026 10:01:31 -0800 (PST)
Received: from smtpclient.apple (185-047-135-246.jonaz.nl. [185.47.135.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d1c61sm564941366b.35.2026.01.07.10.01.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jan 2026 10:01:31 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [OE-core][PATCH] python3-pyzstd: upgrade 0.17.0 -> 0.19.1
Date: Wed, 7 Jan 2026 19:01:20 +0100
References: <20260107090744.844-1-liuyd.fnst@fujitsu.com>
 <DFIJ09ZSDBHO.216DO8W5SDGE1@bootlin.com>
 <DFIJ1YYREQ2V.3041A1DCKFC6M@bootlin.com>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <DFIJ1YYREQ2V.3041A1DCKFC6M@bootlin.com>
Message-Id: <B5EDA89D-D76F-4BB7-83AA-D483BD776843@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0MiBTYWx0ZWRfX201ii5sDVvt0
 acHvBoxy5Fnk+VWFVxzT1gNUeHpSzcNRndToS8b4r6r1M2FcrPAyDGpJoIpjETyj29V80kK4RSb
 uxQsCruKS69eOxpmo9HKe5h4DteqXU5VDTiukLgkomBlvjjDosenYu77/QdBp+x0A3s5J1DYxmT
 p0iDlQjQWKjweRZwpBZkT/vMQ4IGOxkYarfH2lPlJfYZq6aQ1/BDOegjIYBWUvPOGWB2G2JX263
 1PX6w1bTFzlhPC6OgJRVp7jqIppy7FG7EMjqJnYM26ja7M+PaX82/KFNnVeshnxkbJ/DNjdof9L
 FHcG4wtMDa59O2uXUmF30eKOpPVVPj7zLBWfGkdFVQ7pH54LfoiBOhmL+MYJEJ2KoLKXl6aXf02
 7A/HV2eoHx+SLQhIRiRoloTbnjnjrcN53crnUOlW7sF+OkjUDTuIHoz+WpelF97mosCltrcUTAK
 UV294v2uqZ5QGGPMKYw==
X-Proofpoint-ORIG-GUID: 8_lKXtphBoLBWu2WBJgKwyX2MPXhxTtZ
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e9f83 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=/kpjpRmFdjEkggKB3J9tkg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=omOdbC7AAAAA:8 a=EUspDBNiAAAA:8 a=dRA_G4uNoHF93LMvDzEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 8_lKXtphBoLBWu2WBJgKwyX2MPXhxTtZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 18:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229019



> Op 7 jan 2026, om 18:19 heeft Mathieu Dubois-Briand via =
lists.openembedded.org =
<mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> het =
volgende geschreven:
>=20
> On Wed Jan 7, 2026 at 6:17 PM CET, Mathieu Dubois-Briand wrote:
>> On Wed Jan 7, 2026 at 10:07 AM CET, Yiding Liu (Fujitsu) via =
lists.openembedded.org wrote:
>>> 1.Changelog:
>>>  Fix SeekableZstdFile write table entries on 32-bits architectures =
when there is a huge number of entries.
>>>=20
>>> 2.Remove 0001-Remove-setuptools-version-limit-of-74.patch as =
setuptools was removed in pyproject.toml.
>>>=20
>>> 3.Remove do_configure:append as there is no setup.py in 0.19.1
>>>=20
>>> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>>> ---
>>=20
>> Hi Liu,
>>=20
>> Thanks for your patch.
>>=20
>> It looks like the ptests are failing:
>>=20
>> Failed ptests:
>> {'python3-pyzstd': 'START: ptest-runner\n'
>>                   '2026-01-07T17:04\n'
>>                   '\n'
>>                   'ImportError while importing test module '
>>                   =
"'/usr/lib/python3-pyzstd/ptest/tests/test_seekable.py'.\n"
>>                   'Hint: make sure your test modules/packages have =
valid '
>>                   'Python names.\n'
>>                   'Traceback:\n'
>>                   '../../python3.13/importlib/__init__.py:88: in '
>>                   'import_module\n'
>>                   '    return _bootstrap._gcd_import(name[level:], =
package, '
>>                   'level)\n'
>>                   '           '
>>                   =
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>>                   'tests/test_seekable.py:17: in <module>\n'
>>                   '    from pyzstd import (\n'
>>                   =
'../../python3.13/site-packages/pyzstd/__init__.py:19: in '
>>                   '<module>\n'
>>                   '    from backports import zstd\n'
>>                   "E   ModuleNotFoundError: No module named =
'backports'\n"
>>                   'ERROR: =
tests/test_seekable.py:tests/test_seekable.py\n'
>>                   '\n'
>>                   'ImportError while importing test module '
>>                   =
"'/usr/lib/python3-pyzstd/ptest/tests/test_zstd.py'.\n"
>>                   'Hint: make sure your test modules/packages have =
valid '
>>                   'Python names.\n'
>>                   'Traceback:\n'
>>                   '../../python3.13/importlib/__init__.py:88: in '
>>                   'import_module\n'
>>                   '    return _bootstrap._gcd_import(name[level:], =
package, '
>>                   'level)\n'
>>                   '           '
>>                   =
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>>                   'tests/test_zstd.py:19: in <module>\n'
>>                   '    from pyzstd import ZstdCompressor, '
>>                   'RichMemZstdCompressor, \\\n'
>>                   =
'../../python3.13/site-packages/pyzstd/__init__.py:19: in '
>>                   '<module>\n'
>>                   '    from backports import zstd\n'
>>                   "E   ModuleNotFoundError: No module named =
'backports'\n"
>>                   'ERROR: tests/test_zstd.py:tests/test_zstd.py\n'
>>                   =
'=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D\n'
>>                   'Testsuite summary\n'
>>                   '# TOTAL: 2\n'
>>                   '# PASS: 0\n'
>>                   '# SKIP: 0\n'
>>                   '# XFAIL: 0\n'
>>                   '# FAIL: 0\n'
>>                   '# XPASS: 0\n'
>>                   '# ERROR: 2\n'
>>                   '\n'
>>                   'ERROR: Exit status is 2\n'
>>                   'DURATION: 1\n'}
>>=20
>> ptests which had no test results:
>> ['python3-pyzstd']
>>=20
>> Can you have a look at this issue?
>>=20
>> Thanks,
>> Mathieu
>=20
> Sorry, I was too quick again... Here is the link to the failure:
>=20
> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2881

I suspect that will resolve itself when python 3.14.x gets merged, but =
it would be good to see if it can be fixed to work with the current =
3.13.x. And I really should enable ptests in my DISTROs....

regards,

Koen

>=20
>=20
> --=20
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229016): =
https://lists.openembedded.org/g/openembedded-core/message/229016
> Mute This Topic: https://lists.openembedded.org/mt/117131419/9418801
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



