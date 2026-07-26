Return-Path: <igor.opaniuk@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE898C531CC
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:52:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7644.1785055954191707620
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eGD41+O1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NOAZlFuz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: igor.opaniuk@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q8Goqr4066992
	for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35KkZw1kBUumJ7ZvhcyKs6ywgYn1GKkBNVNuqVwhBfY=; b=eGD41+O16sZIXX9r
	mlFKkSqf0HOIb7HFj+Fo6G0fGn89QxVN1cQ/thOAi3QaKsUe1pxb30C+frWBHbme
	QSpVn0B2UjpJN3doOAIzOvvrQs+mel57G+RCQR34o7Dp8pqMro5FsTNwnydipJQo
	Vy936b0BI0EQatUaP3gvLuHFyBg2amBSd07PZruLSIK2cy5SJRZ8ivjcynXbqU47
	Y23RAbHzCsqwkLhP2iyHvtkVztiWshpW3IiD+KSWvnbY2UskmiUOxIY0bDB8hGXg
	1b+csshYrfANeaHgSYleZVwfR4zDLdmACRaaMgLf7H2B+WIPo5maa3rYlPerRPeR
	VFRt3g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpeeae6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:52:33 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6651da40ecbso4659042d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785055952; cv=none;
        d=google.com; s=arc-20260327;
        b=JL7OggOUVx5OXuOAXIuW1UNg+5nrX7nBHRAEUmn+KJDt7hXPthf6PJMNRZDeDSTdXJ
         oL5kPyQB0OssbflIHLXtjW34QjNLhXSJZxDKwLmTLdvFkTRfe7N7OJGIrTwNgaH1zrkc
         IpzpuMS9MdT4FDkwZT69qrU33SR+fNkNJ5LK+alSrnmGlDFO8tYpZHuABgjIXAcQD1ij
         YOQE1oc+Q7aS+9NTgi9U02OK/PT05FsQQBkgE2qwy08bD786x7Wi4d1WRw8KGrH/Ud81
         w7gM1xlcn9YmvnxlcTeBbHdxXNBeUyydV6G0pDC44WmrUcv6tio0xzND100LNtbwSysD
         KlPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=35KkZw1kBUumJ7ZvhcyKs6ywgYn1GKkBNVNuqVwhBfY=;
        fh=7rMzT1PtCpWpWKhXLYzxtdgx9p6ECOnwFD+x10T+1uI=;
        b=gnqkC/TlozmZB5Dv79YjC0qsqqpZdsrgxocc2xTKlTYB0Hnw81IzRtKBw6ilpJHmxk
         n9aWniQbaY7LGpllaryMhfFiR6VqjiejkLhMCq+3BIvdIl45om+uO8UbeDR71LO3n5Ck
         n46dT3xrKSEi4q0zgt7UOC6n1OSLhuRQqW7nksvhL7OhuXrw0D6KE3y3BSN3bFUhXgZE
         Ovgo9/yEHgznsl7dlWiOcI/1jHS0/kEkbBZH1XWvyyk7IHpIcjZfxekblssPRo4Y/hF0
         fxprNz+1MRdqCcwlnzacoFYG4CtizhgeG91dKYWN5q1ELyk3hxGoJZ+sXRJ9r3TLu5r+
         GHog==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785055952; x=1785660752; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=35KkZw1kBUumJ7ZvhcyKs6ywgYn1GKkBNVNuqVwhBfY=;
        b=NOAZlFuzaUvxpTQRMJS9seqOn4JYVDTFCHyfpMpx9D/SkSshInnLArWV+AvDouVl4/
         RcThzOWP8VXYWg3NVl7HAMZWf0/UfWX6rmHUKTc9ksD5F+NWt4nmJ7DIFfknYhETUONF
         8QT3ECniiZagwvXf1bS4A1vmDatkqJ37KnhBZd8rBQyj15/Jbx1BERbSfYm8BGQZra7R
         m9Pwglnj3FKg5c5TOElHlXz+lyNPEZBCPMLxB/YQp9lF7Qje1NqMSo2ONJ719QfEUjey
         J2ctx4uoun1nclH/ljW07yJbFLdnHrC1iEK2fW/qy4dMIIHXhMlnLeagCqbI5I3Sqyu/
         eigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785055952; x=1785660752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35KkZw1kBUumJ7ZvhcyKs6ywgYn1GKkBNVNuqVwhBfY=;
        b=m/M9HGMXtMOLJl1izkFeKDZzJv0fx97xFE0kU5h+ARx0i3aPAZvEXmhDjfiyo/Hq1L
         lw6C04vHDQrZe6AOSovn5gRNS+gScYcke0BEC6xsnFkfOr5WGNSJGU3cCSBZ3KFSpac9
         LDys3NfT8zK8PmvIMBv4Fmj8d5uBvB4fESbsRH5mRFJseg+B91aM8RyuQR2iTza6/xEm
         XHpnCA46fudXeh2QiBbnpexmSJancz0+PHOMLq43Hji3tWAgpqissq/xecoh9B84StXW
         Vut8hGA+58Vf/t/HZ6WaB1/fJ7Ck1kol3wrjwVvOtA0kszdkE6aMv/7i2K0FjWONBs08
         zvqg==
X-Gm-Message-State: AOJu0YyHUFUsU7Ay4ndV9YzISKm12zl1eMspAUcE3knS3Axz+6axmrge
	qjVH5N3gaja0+xzbLDg8u+kDNYEWpK7rFRbUu4gg0QMQifl9krtBU5x+iHtqezzsTRMgmSjP8bC
	j2nh11tOb583bV90O3tMepeaBEZ03kXaYkk6PIHzl7wecta04sB2V7kir/H3XH1YDrcR3qUIru2
	NY0UaO57u9aH2WwdCYNyCDiuFn12ye2jtdXiaAm7H7BtXiPHlgtLtXIW1wyw==
X-Gm-Gg: AR+sD105snmFLx59z/umratLBmwDvaHk00+joCUMotaKqFG/tD7fV3HTzw1uQBzKh0V
	OHGafdx8LDPLFaw7yx1Jc9qvi7fMIArEU9B1WOVnIlgKspfBbQvODBDSxV4a/HcWbabLtSU4Y9e
	JHV1p1fT60wwgdKLZBjijFxk6B1Vj1dQFgxKEZRB2gKJTv1cVQ4VFsF43zqQ==
X-Received: by 2002:a05:690e:1388:b0:668:4420:4fbe with SMTP id 956f58d0204a3-668bfecc322mr1771931d50.38.1785055952415;
        Sun, 26 Jul 2026 01:52:32 -0700 (PDT)
X-Received: by 2002:a05:690e:1388:b0:668:4420:4fbe with SMTP id
 956f58d0204a3-668bfecc322mr1771926d50.38.1785055951944; Sun, 26 Jul 2026
 01:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260724131537.1058940-1-igor.opaniuk@oss.qualcomm.com> <CAMKF1soaRXaijmYs7cG6d_GdebSG9fo=QX4v3s66RMmKBQQuUw@mail.gmail.com>
In-Reply-To: <CAMKF1soaRXaijmYs7cG6d_GdebSG9fo=QX4v3s66RMmKBQQuUw@mail.gmail.com>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 10:52:21 +0200
X-Gm-Features: AUfX_mzB1i4EzCVBYvyESPy_a8TfVXYys6bXpWlPyS2kPnSkvbrWns7CggMJvro
Message-ID: <CAPzfCAYi4=8otpkHyFvPxXgFoCJkEhzGxJ0RJeSTC0aJfrd_gA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libzip: import recipe from meta-oe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        dmitry.baryshkov@oss.qualcomm.com, ricardo.salveti@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Jr3Bas4C c=1 sm=1 tr=0 ts=6a65cad1 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8 a=MlrH0q0GAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iGHA9ds3AAAA:8 a=omOdbC7AAAAA:8
 a=OSUSFbRNUHSvsVuUTVkA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=rsQC-oSfGZFnTtIp--5P:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA4NyBTYWx0ZWRfX4gGfb+mp8Vg5
 bRcyTzK2K2eUZ6vU4Uexu+5oFP5SOWzJ2Lc6NYJh0EBMB2zuKxSdqivLoXba2NItV7gm6xSYP2C
 g30Jrsu74xN//RxYJrXO8PF17as2j8Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA4NyBTYWx0ZWRfX2xICpgnne2VX
 /2H+V7m4oTlwOpSo8wY+q5kMbqelCGqqiY3z/j8U8pzLPVN/u8jOCTJicmPxH6oOj8Dkf6cAgxD
 XZYbOgCruMp0mBxEe4qfCOQ/J6Kkt5xVGalaPfTtgrDEgs0WLJEqBT/rkH4nPQR9KIA0YUQPSds
 gOw6p1M6o2Q1Gm5l6MN5gRhurny3B1altURK3sjtAFlhyihZWjz78cz2nfqr5MDXQ6BhkjevwSv
 f7K4KxNQ58oss9zIoXzSeXvipsJBvGzcDjusNw1jmsLcXtqJPukAhyxdbBgpj2uyHTbRLI4GBFL
 Hq73aekDhIhuAEGRiboQkLpzfsHAd+6atECSSdQGSG+xebyhwd2xOUKgzPjjlYZhVnZNFEd5jHO
 8HQLcIqH/aMHuak3yMpDQEjDAkhTBPkMV5MMXMtWkY2Y96JDaqSdjbk4wobRvvsoQoUnnD9afLC
 bqy7HBiTNh6RPp800Pw==
X-Proofpoint-ORIG-GUID: cH2dr7RQ4zqHgFoLIV6xxvNrR3t36dkS
X-Proofpoint-GUID: cH2dr7RQ4zqHgFoLIV6xxvNrR3t36dkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242014

Hi Khem,

On Sat, Jul 25, 2026 at 1:44=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> I am good with this moving to core, it justifies its existence there. Cou=
ple of things I would ask for.
> Please look into adding ptest support, it does have unit tests. I assume =
you will send a removal patch to oe-devel
> once its merged here.

Thank you for taking a look at this.

I looked into adding ptest support. It turns out libzip's test suite
can't be run with ctest alone:
all 182 test cases are declarative .test files executed by nihtest
[1], a test driver written by the
libzip author. CMake hard-disables the suite when nihtest is not found
(find_program(NIHTEST nihtest) ->
"nihtest not found, regression testing disabled"), and every
add_test() entry the suite registers
is just an invocation of nihtest -v <case>.test.

So ptest support for libzip implies a bit of overhead - pulling one
more package into OE-Core:
a python3-nihtest recipe (pure Python, around 1.5k LOC, no
dependencies beyond the python3 stdlib,
BSD-3-Clause). It also means the ptest image needs python3 to test a C libr=
ary.

Are you fine with the additional recipe? If so, I'll send a v2 as a
two-patch series (python3-nihtest +
libzip with ptest support).

Regarding the removal patch to oe-devel - sure, this is already in my todo =
list.

[1] https://github.com/nih-at/nihtest

> On Fri, Jul 24, 2026 at 6:15=E2=80=AFAM Igor Opaniuk via lists.openembedd=
ed.org <igor.opaniuk=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> Recent versions of the qdl tool [1], used for flashing and provisioning
>> Qualcomm-based boards, depend on libzip in order to flash images
>> directly from zip-compressed flat builds without unpacking them: the
>> device requests individual images on demand (in Sahara/Firehose
>> device-driven order), which requires random access to archive members
>> by name. Neither zlib (byte-stream compression only, no container
>> format support) nor libarchive (streaming, sequential access only)
>> covers this use case.
>>
>> qdl recipes are provided by the Qualcomm BSP layer (e.g. meta-qcom [2])
>> and board flashing is core BSP functionality. Recipes from other layers
>> also depend on libzip (libsigrok, idevicerestore and php in meta-oe,
>> localsearch in meta-gnome), so it makes sense to move libzip to
>> OE-Core in order to reduce inter-layer dependencies, following the
>> example of commit 1a0196a794 ("libconfig: import recipe from meta-oe").
>>
>> Changes between meta-oe and this recipe:
>> - Added SUMMARY, BUGTRACKER and SECTION
>> - Fixed the tools and examples PACKAGECONFIGs to use the actual
>>   BUILD_TOOLS and BUILD_EXAMPLES CMake options (ENABLE_TOOLS and
>>   ENABLE_EXAMPLES do not exist and were silently ignored)
>> - Fixed the tests PACKAGECONFIG to use BUILD_REGRESS consistently
>> - Dropped the mbedtls PACKAGECONFIG, as mbedtls is not in OE-Core
>> - Extended BBCLASSEXTEND with nativesdk
>>
>> [1] https://github.com/linux-msm/qdl
>> [2] https://github.com/qualcomm-linux/meta-qcom
>> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
>> ---
>>  meta/conf/distro/include/maintainers.inc      |  1 +
>>  meta/recipes-extended/libzip/libzip_1.11.4.bb | 30 +++++++++++++++++++
>>  2 files changed, 31 insertions(+)
>>  create mode 100644 meta/recipes-extended/libzip/libzip_1.11.4.bb
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro=
/include/maintainers.inc
>> index b49386a27d..eac288126a 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -469,6 +469,7 @@ RECIPE_MAINTAINER:pn-libxv =3D "Unassigned <unassign=
ed@yoctoproject.org>"
>>  RECIPE_MAINTAINER:pn-libxvmc =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>>  RECIPE_MAINTAINER:pn-libxxf86vm =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
>>  RECIPE_MAINTAINER:pn-libyaml =3D "Wang Mingyu <wangmy@fujitsu.com>"
>> +RECIPE_MAINTAINER:pn-libzip =3D "Igor Opaniuk <igor.opaniuk@oss.qualcom=
m.com>"
>>  RECIPE_MAINTAINER:pn-lighttpd =3D "Unassigned <unassigned@yoctoproject.=
org>"
>>  RECIPE_MAINTAINER:pn-linux-dummy =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
>>  RECIPE_MAINTAINER:pn-linux-firmware =3D "Vivek Puar <vpuar@qti.qualcomm=
.com>"
>> diff --git a/meta/recipes-extended/libzip/libzip_1.11.4.bb b/meta/recipe=
s-extended/libzip/libzip_1.11.4.bb
>> new file mode 100644
>> index 0000000000..36f7d1faf5
>> --- /dev/null
>> +++ b/meta/recipes-extended/libzip/libzip_1.11.4.bb
>> @@ -0,0 +1,30 @@
>> +SUMMARY =3D "C library for reading, creating, and modifying zip archive=
s"
>> +DESCRIPTION =3D "libzip is a C library for reading, creating, and modif=
ying \
>> +zip archives. Files can be added from data buffers, files, or compresse=
d \
>> +data copied directly from other zip archives. Changes made without clos=
ing \
>> +the archive can be reverted."
>> +HOMEPAGE =3D "https://libzip.org/"
>> +BUGTRACKER =3D "https://github.com/nih-at/libzip/issues"
>> +SECTION =3D "libs"
>> +
>> +LICENSE =3D "BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd8a9d2078f35e61cf1122ccd4406=
87cf"
>> +
>> +DEPENDS =3D "zlib bzip2"
>> +
>> +SRC_URI =3D "https://libzip.org/download/libzip-${PV}.tar.xz"
>> +SRC_URI[sha256sum] =3D "8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec=
608d893180ed7097b"
>> +
>> +inherit cmake
>> +
>> +PACKAGECONFIG ?=3D "ssl lzma tools examples"
>> +
>> +PACKAGECONFIG[ssl] =3D "-DENABLE_OPENSSL=3DON,-DENABLE_OPENSSL=3DOFF,op=
enssl"
>> +PACKAGECONFIG[gnutls] =3D "-DENABLE_GNUTLS=3DON,-DENABLE_GNUTLS=3DOFF,g=
nutls nettle"
>> +PACKAGECONFIG[lzma] =3D "-DENABLE_LZMA=3DON,-DENABLE_LZMA=3DOFF,xz"
>> +PACKAGECONFIG[zstd] =3D "-DENABLE_ZSTD=3DON,-DENABLE_ZSTD=3DOFF,zstd"
>> +PACKAGECONFIG[tools] =3D "-DBUILD_TOOLS=3DON,-DBUILD_TOOLS=3DOFF"
>> +PACKAGECONFIG[examples] =3D "-DBUILD_EXAMPLES=3DON,-DBUILD_EXAMPLES=3DO=
FF"
>> +PACKAGECONFIG[tests] =3D "-DBUILD_REGRESS=3DON,-DBUILD_REGRESS=3DOFF"
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.53.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#241932): https://lists.openembedded.org/g/openembedd=
ed-core/message/241932
>> Mute This Topic: https://lists.openembedded.org/mt/120425404/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
aj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

Best regards,
Igor

