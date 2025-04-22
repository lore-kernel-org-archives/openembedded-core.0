Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AF4C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:26:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.35140.1745310381127235978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jtylt/vu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4On1d003264
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 08:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cERwPXH1Tsyhhr2QzwVhbbYfTL27t83MbCA6Tr9En1I=; b=jtylt/vugUPqwY7W
	OYwAX9f9GSKAP5+bjarqOWVNVZc+28UPOeZTUyXT91pWSaHBaPfsltacri3jgpIr
	5xKRsdn6V2vYmEStiAgJP1UJ6HegThMbW/NZyBdKNVvxCDeovrEtjtNVv7xHJjJz
	APCFutgEnyrw93ym8XSOFHUAB5+8fTHlqwsnMHJ7CDdXNRkACtsN6CtCJkmAI9iT
	X1VwSfv+4JMqTT9bGwUPM0A2vRKXr0pZZlXawhCioMWELT7yvJadVd9kmzBIOxQw
	m4s2q2/OgEL8Tf/7k5MUK8yQlngwGYqzTi6PexpVs7rYxnqCs09gfJSYHxY0mbj0
	xbLJmQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u9esjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 08:26:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e905e89798so90257236d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 01:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310379; x=1745915179;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cERwPXH1Tsyhhr2QzwVhbbYfTL27t83MbCA6Tr9En1I=;
        b=TRaP67c5qaik56cxx6989h1ZwowMtRoGGlhagk0SHFDf/O52fn5rSDcr3We++PZhdC
         UvOeEh89A/SSBGQCOZ73ka6f0ackw+hhsKJsG5CaSNDFbGOvOGcsJO9+5oSJknMq4CTS
         5ysYP8/NuMhar88AIFL94mgJbgEkGam1b2t+FYQSF+VrCBSJWn2XOUUrKYtyGONNAji6
         wvNgCWMtR5jw2QJjDSmRasBvjWqnRc61W14f7oo7867efRRGt2ztKsqX4ByuqERhBoCZ
         rzz7AAoADxCci0zlyt7zVFbwnzhJ0Vy0Zrqyo9VluZuiSEkrT8vVYFRlj+3rpDbf68xn
         LUUQ==
X-Gm-Message-State: AOJu0YwYyd97Fg+k6D6wYi5SvWyjG1a2F2h/+tzcQULykFD7INRwsNDb
	VNX5R44YLmxGTHxw6YL01jEnBXmN5W57yTUOj+wfOEOcLrMMzaJM37JEhvfo62j4tKJH/0vk8r9
	oWeLn+V7jmcwFqlUdtR8xGNbAjjEW3Vp4h6sSt43vtw2alknAVJ0JDNIhCcj/9drosc8uK86uzb
	BWdzY=
X-Gm-Gg: ASbGncv9vmM2GAunMzNtNYYUN7ZvGlbDh19kkD10fISW9XwTOfqYONssPop7EUd2Glk
	bHV5+WIWhBC9/xISgRHt8z6TsCAaDnmZd83mj2qmepfpu2/xhWQ0EWEJr/gjX9S9MK3m5hmO0OW
	lIucbfQV0QsSv9gnYazROpfnarJJ9qqspLrR4DqIOWnqsBgCOeFXHxJNTU4fsi0ofnM9B2MAYzy
	dTb+vDuWOQN9j8PWRDb3HtPjY93nilzNsXtjqNY9Le+FLNrZWq++s3ufJAbVY4aqPvW+ci/jXTA
	pDqKDUhKmKHMJQ8wolIN/1xF1c4Jfw3RJc5jDrqfpwBDojxD7P67Buu12B3anQ==
X-Received: by 2002:a05:6214:1c47:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6f2c4664a1fmr263403156d6.34.1745310379021;
        Tue, 22 Apr 2025 01:26:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6258WpLZH+YdCiPpKUItVm/i16YI3/+hIPrfMfNCF1EvV6NzNbghRNTaACE5uB5w3hwdbDw==
X-Received: by 2002:a05:6214:1c47:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6f2c4664a1fmr263402936d6.34.1745310378507;
        Tue, 22 Apr 2025 01:26:18 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efae396sm630247866b.170.2025.04.22.01.26.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:26:18 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [OE-core] [PATCH] autoconf: upgrade to final 2.72 release
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <AB3E4ECA-B3F8-4221-9988-7606C0FF1C3C@arm.com>
Date: Tue, 22 Apr 2025 10:26:07 +0200
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1487D3E-B2F6-46A6-AFA2-011D6F05FFCE@oss.qualcomm.com>
References: <20250417151813.2295435-1-ross.burton@arm.com>
 <AB3E4ECA-B3F8-4221-9988-7606C0FF1C3C@arm.com>
To: ross.burton@arm.com
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=680752ac cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=4yk-ul0jI643p9iwCyEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 7YKRMw99iMQvzNrYkVX5pBl4DIgsPmP_
X-Proofpoint-GUID: 7YKRMw99iMQvzNrYkVX5pBl4DIgsPmP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 08:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215196



> Op 17 apr 2025, om 17:19 heeft Ross Burton via lists.openembedded.org =
<ross.burton=3Darm.com@lists.openembedded.org> het volgende geschreven:
>=20
> I=E2=80=99d actually like to see this merged into walnascar: the =
changes are minimal and shipping a release and not a RC is a good thing.

So, ehm, is introduction build breakage a good thing or better than =
shipping an RC?

ERROR: autoconf-2.72-r0 do_packagedata: QA Issue: Package version for =
package autoconf-src went backwards which would break package feeds =
(from 0:2.72e-r0 to 0:2.72-r0) [version-going-backwards]
ERROR: autoconf-2.72-r0 do_packagedata: QA Issue: Package version for =
package autoconf-dbg went backwards which would break package feeds =
(from 0:2.72e-r0 to 0:2.72-r0) [version-going-backwards]
ERROR: autoconf-2.72-r0 do_packagedata: QA Issue: Package version for =
package autoconf-staticdev went backwards which would break package =
feeds (from 0:2.72e-r0 to 0:2.72-r0) [version-going-backwards]
ERROR: autoconf-2.72-r0 do_packagedata: QA Issue: Package version for =
package autoconf-dev went backwards which would break package feeds =
(from 0:2.72e-r0 to 0:2.72-r0) [version-going-backwards]
ERROR: autoconf-2.72-r0 do_packagedata: QA Issue: Package version for =
package autoconf-doc went backwards which would break package feeds =
(from 0:2.72e-r0 to 0:2.72-r0) [version-going-backwards]
ERROR: autoconf-2.72-r0 do_packagedata: QA Issue: Package version for =
package autoconf-locale went backwards which would break package feeds =
(from 0:2.72e-r0 to 0:2.72-r0) [version-going-backwards]
ERROR: autoconf-2.72-r0 do_packagedata: QA Issue: Package version for =
package autoconf went backwards which would break package feeds (from =
0:2.72e-r0 to 0:2.72-r0) [version-going-backwards]
ERROR: autoconf-2.72-r0 do_packagedata: Fatal QA errors were found, =
failing task.

regards,

Koen

>=20
> Ross
>=20
>> On 17 Apr 2025, at 16:18, Ross Burton via lists.openembedded.org =
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>>=20
>> autoconf 2.72e was the fifth release candidate build, and whilst we =
had
>> good reason to use RCs during development we failed to notice that =
the
>> final release was made because alpha.gnu.org _only_ contains the =
release
>> candidates.
>>=20
>> There are minimal changes in the final release compared to 2.72e:
>>=20
>> 6199cff2 (tag: v2.72) Finalize NEWS for release 2.72.
>>=20
>> This is the finalisation of the release, updating documentation and
>> version numbers.
>>=20
>> e544a323 Save/restore AC_LANG setting in AC_PROG_CC_C_O.
>>=20
>> This is a bug fix, aligning behaviour of AC_PROG_CC_C_O.
>>=20
>> 634fb3e7 Remove bashism from tests/local.at.
>> 4fbe6436 Revert debugging change committed by mistake
>> 8794cd1c Address =E2=80=9Cautom4te preselections=E2=80=9D testsuite =
failure
>> e5d98f4c Avoid a spurious test failure with shells that ignore write =
errors.
>> 3fbfb13e Address =E2=80=9Cautoconf: forbidden tokens, basic=E2=80=9D =
testsuite failure
>> fdb58df6 testsuite: Skip tests that use aclocal or automake if =
they=E2=80=99re too old.
>>=20
>> These are fixes for the test suite.
>>=20
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>> .../autoconf/{autoconf_2.72e.bb =3D> autoconf_2.72.bb}          | 4 =
++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>> rename meta/recipes-devtools/autoconf/{autoconf_2.72e.bb =3D> =
autoconf_2.72.bb} (94%)
>>=20
>> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72e.bb =
b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
>> similarity index 94%
>> rename from meta/recipes-devtools/autoconf/autoconf_2.72e.bb
>> rename to meta/recipes-devtools/autoconf/autoconf_2.72.bb
>> index db374373cff..f2d2781fec9 100644
>> --- a/meta/recipes-devtools/autoconf/autoconf_2.72e.bb
>> +++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
>> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dcc3f3a7596cb558bbd9eb7fbaa3ef16c \
>>   file://COPYINGv3;md5=3D1ebbd3e34237af26da5dc08a4e440464"
>>=20
>> SRC_URI =3D " \
>> -           https://alpha.gnu.org/gnu/autoconf/${BP}.tar.gz \
>> +           ${GNU_MIRROR}/autoconf/${BP}.tar.gz \
>>           file://program_prefix.patch \
>>           file://autoreconf-exclude.patch \
>>           file://remove-usr-local-lib-from-m4.patch \
>> @@ -22,7 +22,7 @@ SRC_URI =3D " \
>> "
>> SRC_URI:append:class-native =3D " file://no-man.patch"
>>=20
>> -SRC_URI[sha256sum] =3D =
"f3478d3b597d51f5d61596fb2f6f6aba49cdd974b4b05ff0bac57f56b5cfdb39"
>> +SRC_URI[sha256sum] =3D =
"afb181a76e1ee72832f6581c0eddf8df032b83e2e0239ef79ebedc4467d92d6e"
>>=20
>> RDEPENDS:${PN} =3D "m4 gnu-config \
>> perl \
>> --=20
>> 2.43.0
>>=20
>>=20
>>=20
>>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215100): =
https://lists.openembedded.org/g/openembedded-core/message/215100
> Mute This Topic: https://lists.openembedded.org/mt/112315146/9418801
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



