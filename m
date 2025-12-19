Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE2FD7496D
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 09:25:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13511.1766136339852621819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 01:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eWxGOP8c;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EU8nOFBk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4d1Wa3320327
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 09:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NTFes4YdEtYcFkS5NjJf86Bz04vXr3eB6pjWhpR2b74=; b=eWxGOP8cm1H9K8Pc
	yz3nt5Yv3pEcPq828pkscd5HgbgO+AJ0dErYXJMfp22ep4O4y2wtTMlyBUSgzvFO
	kOi54Lan8PHQ80/dwS3aowQ3/YfrJ7EV+sQ2pn0WrgS9qdBj2aCQlQhC8nRUHJbW
	9WYMSRrijTRpM2xIE+npUofpNrF8Z24ZvgYkbpND9iBtE16pCVyuCvKsDymQd0lb
	DMeNjHfI/ALxjYxgEvANUBmi5OZOiEy3zAF/RzDWZ45eZWA9dKhL+eBW+Prt5i85
	EfnTqj6C8j+FNijLEBj5GMjvkduuM1OQsjaVzkwg9QUzi9ume+CetukGcrcRTsLk
	UxM1SA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2et29x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 09:25:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f183e4cc7bso27332361cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 01:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766136338; x=1766741138; darn=lists.openembedded.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTFes4YdEtYcFkS5NjJf86Bz04vXr3eB6pjWhpR2b74=;
        b=EU8nOFBkdi0LAqEAjPBNx7U2bmuVppSaXLMnzKTK6D9yhWn21U1ZN03T23gBESdTLp
         djv8bKEcmLZUf7Iq/rK7fH9Td//u+m971eKGmu8caYi1HcvkmAb6aLtedo0AvaQuwBDd
         WEJX5ozTgrrejX3MbhjR52SSnjcyQdyPXV2kGPqYC/d/NLvI9xUNaueZOSdvnHR3hbMP
         ZBQSd0zwNh8ed90KqbdRNptzii8Pf7zfE3MhW8ykAg4+4N+wJEszhd76QkmRaaNybP9F
         mbDPLhT19wWZDlHRITzAEgwKez3R0BfVOfPDZMhh6DpPMlIfriaKlixps1tz4mUAWJ66
         UNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136338; x=1766741138;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTFes4YdEtYcFkS5NjJf86Bz04vXr3eB6pjWhpR2b74=;
        b=F+V/yO9HChoRKeMAt8fdbcZ25/CbRJbEM5GR3LOIVU62Cl8iaearjiTYBK5hD5OrBJ
         wyudT+JyZXKfTiSfMwWqNBte9TbsHYjvB53DmLjCklfyKsgaWOoQm1ONZIFOosfBH6A6
         xTRk49dFKYbdLdq6IIS8KYLlMx7hMu4+/pfVUqvP76Gy3yPUoTKO1QsVRymMkGsdVSrJ
         CRM0m7Fa/51PhKzLmERXTjvivztKd/TZpQTWLhN8Bwo7DrDPV1RzyiVp/qAyqpONHrM3
         9EB7O1SsFs2XnKeOzaALpQRP8vNkjTzRlE23euzxk5/6jiEty8ZI4k8hwPfKm8EIgxvq
         TW4g==
X-Gm-Message-State: AOJu0YzV4gJ7lfLpK8+mU+mN6ucouugmOyYDhFZAs5P0HPlvIaonUlXl
	RGHL+Jhvt0HbmPSJqzsF+vn1VFfHpss/7v2cgESf5TQNaFzEywoSvDgzl8mlL2G3r/Uz9cgDNyn
	/k0qdwbJ6As1rru5x3Qh88W8o+yyoDzz0wBVqsTR1YNRu2xm4DN8oNJNVC/YfEh2Oytz/Dy02yV
	eZpAZhlqFDuV+M2jM=
X-Gm-Gg: AY/fxX7y4pc1vkCdYdEBrcIaFoNE+53vCUNlh4HNTXq3kHwrIah4xIvOVauWkRmcX31
	UvfkY7PzX2DWq6b4xd9YVRn+JLXHN+K5LuatC2jz0RxZfDETPU9jWUmhKxMT6KpGC5gc22ll8d3
	PpusQKFe3d8+BnUevwVpG7/y/RrAK73/A72w09VvYiu3Ugzpaw5blJMmHWVuJ3xaEJntQazpTlH
	PFKNKpIbuy4/MEbW02eg72llzD0E0KaTNGjbaPnN3IbJqHE021FBluXMJguXMV6zuiWQSFZxiSM
	iMNBD4/Ck74XnG7zvaXUh9mPId3pCcJPjs4HRKdTbOOgh9T5PWhzmuAReyTXp6Oeijba6pe3+tL
	gKqHT6i6HkJCIoZ+0o3vPAjbTNd+R7GnqYM5lP7IOUk/LFQs8IKu3yPN+NA/LaLRv
X-Received: by 2002:a05:622a:244a:b0:4ee:87a:4d0e with SMTP id d75a77b69052e-4f4abdb28bcmr29867161cf.69.1766136337845;
        Fri, 19 Dec 2025 01:25:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBtMyhyrKKxkvwf9J1A+uxGS0Eys5GVwn1sKnXGd/ix6CncE2KM4aniKyaYUG4UCy13Q/PnQ==
X-Received: by 2002:a05:622a:244a:b0:4ee:87a:4d0e with SMTP id d75a77b69052e-4f4abdb28bcmr29866991cf.69.1766136337286;
        Fri, 19 Dec 2025 01:25:37 -0800 (PST)
Received: from smtpclient.apple (185-047-135-246.jonaz.nl. [185.47.135.246])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9d8sm1673059a12.11.2025.12.19.01.25.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Dec 2025 01:25:36 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [OE-core] [PATCH v3 1/3] python3-pyzstd: import 0.17.0 from
 meta-python
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <DF1DVBTU8KF4.DKISQQI02FOC@bootlin.com>
Date: Fri, 19 Dec 2025 10:25:26 +0100
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <936DC46D-57B0-46B1-9E73-A8DF5570433F@oss.qualcomm.com>
References: <20251217150828.1044438-1-koen.kooi@oss.qualcomm.com>
 <20251217150828.1044438-2-koen.kooi@oss.qualcomm.com>
 <DF1DVBTU8KF4.DKISQQI02FOC@bootlin.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Proofpoint-GUID: obZ3CKkRq-CWS0O6qZtBGkCHFuhIar0Z
X-Proofpoint-ORIG-GUID: obZ3CKkRq-CWS0O6qZtBGkCHFuhIar0Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3NyBTYWx0ZWRfX0rvY/Age6EhT
 Sa9s05PnRfpVAzyttrOtYg0adAnZNNZAm/ALjkEeZXeTU4Pg3+ZfxRgLgxPVg/qxxSCmkXrTEuR
 QUehUuIcRBWzfq8dv1JNcUaePdiRv231BUDgcuXEQ/bf8I1J5SSOMk9FpmHOuvl1DA0KkmAf3Jq
 vfkK7pz5qxYdpYYsU+KzIuf636P0tYc6BMhHT+Ac8mHlcdgOWpbuhIx3vJYM9t5S0NcGazDp9YL
 8/WRUW+xO1mmYqRjHj7If36Z8Y61OX7EJlaYBMi1PBHhQqhJEpQJRnLMLuaT+K6uqKFDFnCR24s
 mcnfTDd0vJMoBO2pM6b8EQNGmUI+zvPU7xnPrX/pVfuw1z5CwI1b/HHO7rS3+I+DaehsG4sV/7F
 m98I7Etsqvt++Kg/kNb7gi9G4JGlCnmawc9i5ZnrmJ/nq6HZliUWTFqJSiFikO57RtQRZBFC59+
 brE9SaLJE2dPR5R19iA==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=69451a12 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=/kpjpRmFdjEkggKB3J9tkg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=6BPq8Yz1vv-tA3dOffMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 09:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228200



> Op 18 dec 2025, om 14:40 heeft Mathieu Dubois-Briand =
<mathieu.dubois-briand@bootlin.com> het volgende geschreven:
>=20
> On Wed Dec 17, 2025 at 4:08 PM CET, Koen Kooi via =
lists.openembedded.org wrote:
>> =46rom the upstream website:
>> Pyzstd module provides classes and functions for compressing and
>> decompressing data, using Facebook's Zstandard (or zstd as short =
name)
>> algorithm.
>>=20
>> This recipe is being moved over for systemd 258.x, the 'ukify' tool
>> depends on this.
>>=20
>> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
>> ---
>=20
> Hi Koen,
>=20
> Thanks for the new version.
>=20
>> diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb =
b/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
>> new file mode 100644
>> index 0000000000..0ed6cd47c7
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
>=20
> A new entry should be added in =
meta/conf/distro/include/maintainers.inc
> for this recipe:
>=20
> 2025-12-18 08:49:56,223 - oe-selftest - INFO - =
distrodata.Distrodata.test_maintainers (subunit.RemotedTestCase)
> 2025-12-18 08:49:56,223 - oe-selftest - INFO -  ... FAIL
> ...
> 2025-12-18 08:49:56,224 - oe-selftest - INFO - =
testtools.testresult.real._StringException: Traceback (most recent call =
last):
>  File =
"/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembedded-=
core/meta/lib/oeqa/selftest/cases/distrodata.py", line 105, in =
test_maintainers
>    self.fail("""
>  File "/usr/lib64/python3.9/unittest/case.py", line 676, in fail
>    raise self.failureException(msg)
> AssertionError:
> The following recipes do not have a maintainer assigned to them. =
Please add an entry to meta/conf/distro/include/maintainers.inc file.
> python3-pyzstd =
(/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembedded-=
core/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb)
>=20
> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2854
> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2747
>=20
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION =3D "Pyzstd module provides classes and functions for =
compressing and \
>> +decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as =
short name) algorithm."
>> +HOMEPAGE =3D "https://github.com/animalize/pyzstd"
>> +SECTION =3D "devel/python"
>> +
>=20
> You also need to add a SUMMARY line here. QA complains:
>=20
> WARNING: python3-pyzstd-0.17.0-r0 do_recipe_qa: QA Issue: Recipe =
python3-pyzstd in =
/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembedded-co=
re/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb does not =
contain a SUMMARY. Please add an entry. [missing-metadata]
> WARNING: python3-pyzstd-0.17.0-r0 do_recipe_qa: QA Issue: Recipe =
python3-pyzstd in =
/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembedded-co=
re/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb does not have =
an assigned maintainer. Please add an entry into =
meta/conf/distro/include/maintainers.inc. [missing-maintainer]
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/848
>=20
> Aside of this, other tests are succeeding.

Thanks! I'll try to send a v4 before heading out for the holidays, I =
appreciate your feedback and help with this. It has been a looooooong =
time since I had to add a new recipe to OE-core.

regards,

Koen

>=20
> Thanks,
> Mathieu
>=20
> --=20
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20


