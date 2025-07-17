Return-Path: <nicolas.dechesne@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C218EC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 17:17:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.1050.1752772639610017494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 10:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YkVqdkbz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: nicolas.dechesne@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBsJHi022444
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 17:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ReMpUb1CdSxqXNRQLMUIfQ0udjqZ9Au9XKU2zUR1alI=; b=YkVqdkbz1DxUZrs/
	rEKNy6dd8Z64VaTpL0nuEr5f2tzXzr82F5hB00ftmOCRVsi7ubWEO45njqf9nFJy
	QSIXyirr5/nwkkKimkLXoz7tBB2Ry7xIlLhtEWw6BcCIZPwT2ZjX0naXrLKGlahk
	+MFnZpjecg/bZSqX/XJ1YTJa3r3lb0Jss5RwWq8kgrQTVUsZ6zGNeoZ3FG6Oa4In
	pGlc0cYPsBRO24kxpZwh4yQA9+HrIUm6Dj01LpGWxOC4pcSXevZ1PHV0Pzt598ZW
	WeTDf12E6G/p0T56u9Og0hQv+sT1uV/aWjqXhzgukSEO9saX0Jx3wfOF77ZdghiF
	MOnFqg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy8jge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 17:17:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb50d92061so17535736d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 10:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752772637; x=1753377437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReMpUb1CdSxqXNRQLMUIfQ0udjqZ9Au9XKU2zUR1alI=;
        b=gAA5QClfVeEgAkduoznbScL5Gd3mn7dogdvkCAp81EwDpKjN6hKehAnVLV3iqDw9l+
         xR1mDms9egeju5SeNAlh5alaAbHxsS/dpibfwgk+BVkkJx0foIGrftGaRZxg+F7rcHbg
         ffTtJNocZdv3g2bn0PbpwbtFrrf0RBj0Q97DwG/9u8GuNtF7kEKYzKZilcr5YOnceSKF
         aMVmCBD7lxOkFfxR3BslG/iGHIZi5JhcNvDZ+RvnTABHPOFZ5kUHI3TtxqeRkOz07ngZ
         sMnQjcbZlO1Fi9/GtXehthC6DDAMGRyzjqvWUHcaEyjxgO9nkVU5kQyZu/t4XY/77g3l
         FfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhB5q1j61k83sMjIaMDgPVoETz1QZybDS+rYYPe7H01n7Vafy78raFZq9H8Gdcxg3CCAuvZBypJjluSllzrN88Pw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzqC1Au9i42q/bDy9COrD/9ivUXvaL30vEOCoQZpfEYstCgSZ6D
	GlqI5yQpZNAQ5Y9EbOakpwXpLxAPl1vMKnBZ5oEHpfFqDm4ZvnjO4SvgwC/q4qZMvwktt7FJFH8
	yfD6ZilGdTEkCf/PnfZIcjijUwifJ5vDtS6UD82qHQYlqvOjq9mZ2QH6Zo/l3qL8PiXj0ZovBuU
	OuFrleYG+voyDpUy4dN/mhW/Rrj9+LknjsJpBvRlh1xDumPZl6+zoVsNA5OQ==
X-Gm-Gg: ASbGncuzEy9XeOwHpLHiTPkZzI0tnczllFqXw92sJw+Al6D09VX3x/C5WD/Lyq5CMd4
	ikwbzY0cac1STFju/ekNuKKXfQwZAE0DFImuZvRpSzwB+djmqzSJ6RT/kjNm5ceu/hX3B2Hun3L
	fGOlV2gTfpCo9+wSFYw4bWYw==
X-Received: by 2002:a05:6214:4f09:b0:705:218:d62e with SMTP id 6a1803df08f44-7050218de08mr58991936d6.46.1752772637365;
        Thu, 17 Jul 2025 10:17:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiuisd1OfMctIzTRGU44xQc7UAPvXlpte4ed1W1NcscxbaZuSr7B+pVeh1Kljc3UNguoorU3ICc3xc+5SFEmg=
X-Received: by 2002:a05:6214:4f09:b0:705:218:d62e with SMTP id
 6a1803df08f44-7050218de08mr58990786d6.46.1752772635453; Thu, 17 Jul 2025
 10:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250716144749.1880959-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAMKF1sqkK1o3e=ehvMhkBGTFVuvPMQF0LusEYYDURfdgxLitmw@mail.gmail.com>
 <CA+chaQeEQ2EKt8RdZrDiae54NE0Tidq1_md2zHQJATpX7=5X6Q@mail.gmail.com>
 <27vjhf4ojfpwvsbdxkboo5hgoaaj7ongeax5icelqv7trobh5c@vfj4cn4mm5h2>
 <1a2f4fc1cc4dc0b911968695c4ccb60764f8bf6d.camel@linuxfoundation.org> <6fa096c2-856d-4ef2-93d0-da4c5022a354@oss.qualcomm.com>
In-Reply-To: <6fa096c2-856d-4ef2-93d0-da4c5022a354@oss.qualcomm.com>
From: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 19:17:04 +0200
X-Gm-Features: Ac12FXwEtTG6TxC6Amh6PzHJTs1bnPZYKNXOpSmF77636PVckwCpO0oSJNHAxY8
Message-ID: <CABWbsgCUOCbvpzM3ucvP1=NqmeX1PTC2-p+w8FnZSXJ_AMTvtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spirv-llvm-translator: drop tag from the SRC_URI
To: dmitry.baryshkov@oss.qualcomm.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Martin Jansa <martin.jansa@gmail.com>, raj.khem@gmail.com,
        openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE1MyBTYWx0ZWRfX18sKqVKlXpuB
 1T65B/HyVJRsWUm6uaTYPbUS8p/CAvIZJtc4rVyiPGMEzpkFE/EWYtK7dXjde+45Z8lMinAHopN
 DWy7dukk32o5TQJsJhJj47uLmGQ9W4+wH16CTRGy8M8/M+WoLl6AukcG1WwcznftN1l3SIsOYLs
 tSVx9VAhmrwCZ8HbeEarRDuictLevNkHz6R2A92m79/zLk3rJFtSQ3LS6tq9yllRnDKbFKSBKLX
 qK5Ne8VEVIxHqDXT2lxvHorx9pLeEOWadNgx6MLdYK2IQRn9sso/hFLZGuMmkFQpgbJVdn76vw/
 dhZtVdPzA0rDPsJEFYSIaX+NeN/XzgXZN2eCXAEIejidHO1OkU1KdBR87S44R1jAeQyPvYGn7ar
 djecE5ZHubFX2Dtq9t9fmoDJL4vnmiXhEnVsyj9tTEf2lsV5rm8fd1aNjkOkzdgQ+6w+0WuL
X-Proofpoint-GUID: lCLLV3C6w5Fyau4Xe_HXWqNEX9zMI445
X-Proofpoint-ORIG-GUID: lCLLV3C6w5Fyau4Xe_HXWqNEX9zMI445
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6879301e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=1VxgI6EHtDtDECUiyRAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 17:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220558

On Thu, Jul 17, 2025 at 4:17=E2=80=AFPM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> On 17/07/2025 16:17, Richard Purdie wrote:
> > On Thu, 2025-07-17 at 16:00 +0300, Dmitry Baryshkov via lists.openembed=
ded.org wrote:
> >> On Wed, Jul 16, 2025 at 05:14:34PM +0200, Martin Jansa wrote:
> >>> On Wed, Jul 16, 2025 at 4:56=E2=80=AFPM Khem Raj via lists.openembedd=
ed.org
> >>> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On Wed, Jul 16, 2025 at 7:47=E2=80=AFAM Dmitry Baryshkov via lists.o=
penembedded.org <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org=
> wrote:
> >>>>>
> >>>>> It seems under some circumstances the tag in SRC_URI can prevent th=
e
> >>>>> recipe from being unpacked correctly. Drop it in order to let bitba=
ke
> >>>>> handle the recipe correctly.
> >>>>
> >>>>
> >>>> I think we should look more into underlying problem. I have seen pro=
jects create release tags that do not belong to any branches and can create=
 fetching issues using nobranch=3D1 helped in such cases
> >>>
> >>> I think this happens when the git repo tarball already has the
> >>> revision from SRCREV but not the tag yet.
> >>
> >> Most likely. I don't follow exact timeline of the repo, so it well mig=
ht
> >> be possible that the tag was pushed way later than the commit.
> >>
> >>> Adding tag param to SRC_URI only when upgrading the version helps in
> >>> some cases, but not when the tarball was already created with the
> >>> right SRCREV.
> >>>
> >>> The only work around which worked for us in webOS builds is enforcing
> >>> to use annotated tags and using SRCREV of that annotated tag (not the
> >>> SHA of the code it points to), then either both (SHA and tag) exist i=
n
> >>> the tarball or neither and the repo is updated before the tag check.
> >>
> >> This might work, but not all repos apear to be using annotated tags.
> >> Maybe we should extend bitbake to check for the tags in Fetch code too=
?
> >>
> >> Khem, Richard, can we please pick this patch?
> >
> > I'm not keen to start dropping tags without understanding what the
> > issue is. The fetcher should notice things need updating and pull in
> > the right pieces. If that isn't working, that is the issue we need to
> > fix.
>
> If the analysys is correct, the SRCREV is present in the fetched
> sources, but the tag that is used in SRC_URI doesn't. So do_fetch
> doesn't perform any additional fetching, but the do_unpack fails as it
> can not find the tag.
>

While it's not a full proof.. we ran a 'cleanall task of
spirv-llvm-translator' on our CI which exhibited this issue in the
first place, and it now builds fine, after it fetched again the tree..

> >
> > Cheers,
> >
> > Richard
>
>
> --
> With best wishes
> Dmitry
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220547): https://lists.openembedded.org/g/openembedde=
d-core/message/220547
> Mute This Topic: https://lists.openembedded.org/mt/114186099/9005974
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ni=
colas.dechesne@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

