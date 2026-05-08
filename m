Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C33CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 20:57:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.362.1778273864739865365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 13:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kHDVOVxW;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=V056V04r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GTlBp145316
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 20:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gy+6RVW6ZUVI2GcKIdKp9D5hnOLGVxaSFdsAc1r+Lgo=; b=kHDVOVxWMGa1hzmA
	XEZ/WeRNDs2VV1nDjDl8rbpP8uiF1ptQcsHAFzMBmqOFafkIq7Vrja80wrJHOm2U
	C7A/7/fZaXjpl3onV9hBv9SXE+po7lMlEKgNOkMGmwrdOcRstVeZzyu1sz4tXLXc
	7Yim5j0PzENe81ZWMg3BALeBsJthTdbnvcEYYSqVWicjQLT4k+vQ2XrpZWanoNvk
	X8LLGqnJLKLGsaEtRNF8Asc8RxrX0u1oODZbPcYlzt4JP2KLmaxenU6kJ5IanW3i
	yMBYzmkRKJweRClfMCttOvrIVloRrZDGoLc6tENq6yGh0CxC2MvldY5lSdg1rE9X
	chzoBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1kdc0u68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 20:57:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4654f9bb6so26659395ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 13:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778273863; cv=none;
        d=google.com; s=arc-20240605;
        b=G8aMzw0u7e3hnQv/hU7qX1oLrZxuJS0gWqrMFGytCryC6Ad/eTrNV5GkWN0J1lrIZp
         +NIVF+aZixVH0Qb4u/dsBWl2zDIlUyYfsbKxTPfDfDUJraWCEFoXV9YQWJSkIzRzsm8s
         eAf4oCRfRhC0utywDWy9DGWsbseFBikYR2z93CEKAJbhmAkQkiTQIRE9GWg5NexMvOo+
         srI3fwxpFzt8Cz37Y+5PBpeN2syOEHCnMpov4t3gUH7nxle1kLtFIDJDUofuRJ0G/fxQ
         dc9ACtEPmBt5UERfPt5BRRDfP8A/WpWn/lZsrycIqCTwQd7eRHjpkZkc+fCqPG0APxCw
         botw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gy+6RVW6ZUVI2GcKIdKp9D5hnOLGVxaSFdsAc1r+Lgo=;
        fh=rTGO84j1pvKsikBSy1Na5n6uZ5dZD4CdQXWin5J5O/0=;
        b=kRT03QCs0BqbLsdKuXC4y5ChHV2Tl7TS4nWMIbka0gTEuuw7OW+GXHqG3m8pNiiZBT
         4ud92P7oySsnGPGsn4nbqOYWhteBr9dTDIuCge1HhHX/sXCZKv4b0BNP3w5M8zx/LkSh
         CyhWO+OJNte7hPVTVYU5eTc0//0VkGe5JPPoU5m4+LCCyV3AUVzJ5QuyYKqEA8D0wRCH
         bBBYSJ8ZIcbXn4Q0Ba7Hp8mwUOrV+iQfwTjrMehStwQnK0CON9APXf0bqXaFQnhqZ3Ic
         spk4UpDe7l8BmEhuik2pzvT3WNQRPaQ7IMLpWbOS7LpaznNvBBt89gfPujm+UFr3+ooT
         Bc0A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778273863; x=1778878663; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gy+6RVW6ZUVI2GcKIdKp9D5hnOLGVxaSFdsAc1r+Lgo=;
        b=V056V04riRnmGTBSG/94FvjpidnNPuKQWt244TXNJA9nhc6EdFci4bkZBmVkQnrkQJ
         YtdKQCu6pv3EcNdh0KDpeqfUD1soPF6Ww94z8bmxV1jhnUhd2uNI0QtzBlv64tXAKNsS
         rG5J3UokZsj1L7wptJBIHoHRMgULKzw6pItS6O/FNM5XyCgvc8pfhoiMLs65oosyrjxT
         yiC3ukRZyvQ28V9mg3+PzYHRlAc7jcdy+LTEayzREI0jbAyJTsXCMny4u0xLVG/RX2Is
         OG3vXoCBp4MJnISfYZcCfNEgYFjBMyA+1PM7mbKM2gzBG5aDynrHZvwybsdQKan/tCzM
         iyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778273863; x=1778878663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gy+6RVW6ZUVI2GcKIdKp9D5hnOLGVxaSFdsAc1r+Lgo=;
        b=KsDFY91YSGKmLlzgHKmQcZGJG4+yiL0+1Y1+gczd3v6pv5JbnHDe0lzHkT8eWauR9p
         SqoEjvf+TryVaQ1cvjDjWMVxT29E830h5oNnuBlB+dZ6TEqcTJWZVKabPvq5dOSCG7de
         YxcHhodnnWPnEzr9l3uEwi5hvga7S6ps7y6kmdHPBpfpLG12Da4SlMsoOan7Ozx5bUWb
         1FNSX0L/w1lQMoiX7lArX5/WzE3zhrTGkHvT6ShhM4pCNp1AXQiVuWo7KnBJ/fMK/ODW
         1XFW2WB9Rj4ZK/MNfQrBfZClRnGwckF26RSaN9G/mkKfUBK5mZSueYPVMZ8XUiGVn1Ml
         nGeQ==
X-Gm-Message-State: AOJu0YxhjBVKDYvfvx6apBNrO9KPRLOI+xrtBc3axWpc7+hnmTOafNgR
	zOM3HZ7ZRtQtCWMvJ+gMtOzcY61RRIW20P8SHDUn972UaOz6rhrKmraz64KX7SInzh5Dg7gIExM
	M/o9E0nrz1n+miI2o/eKj+e3R6vImHRvVuoXHYGjx7s+26CoaUkWB1iqS2Sx7pxWgmribowBLgS
	9OGnHMZ+/14EZbD7/naOepZy6j1lY5A8r+XpZ2r6HGKgbU5yskJWSQ666Fkw==
X-Gm-Gg: Acq92OGj8GvikW5CWnorNBCbu/VwzYo5Ut+XOE4vBj4f8xoUZTqug2lgZKWb/PX8A8/
	53UDN2Lak3eZ0gNalDNeN0WtRZKFqdE3KE+oREEmor2JvZx9n2aGTIFj39fWUifYITD//u5vKic
	eu3KPcN4HM8JRlvIr0zJPzFn0Ca2yd2P6QJqnmUJ4EejDRtdLXk5UJeKUdQVqeZYkOOp8xjp8rL
	2PNNoVvSBLemm22S14=
X-Received: by 2002:a17:903:903:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2ba78f7320amr143156425ad.16.1778273863266;
        Fri, 08 May 2026 13:57:43 -0700 (PDT)
X-Received: by 2002:a17:903:903:b0:2b0:5d60:7f3f with SMTP id
 d9443c01a7336-2ba78f7320amr143156245ad.16.1778273862634; Fri, 08 May 2026
 13:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com> <gnsndbzzgdnp4q5bqmccwxy5njtkj22btgpedstktykczupbfk@chm5coxohwxo>
In-Reply-To: <gnsndbzzgdnp4q5bqmccwxy5njtkj22btgpedstktykczupbfk@chm5coxohwxo>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Fri, 8 May 2026 17:57:05 -0300
X-Gm-Features: AVHnY4LNO4dwJYjtj82bhWfVFm9CKWAccgAPcixCLRlLvIS0yLm1i9I-AEsnFlY
Message-ID: <CAA_5youaEHLfqqq_T_Xx6Fnc4kAyOhaf99nnPSTX1MmV-jvjuQ@mail.gmail.com>
Subject: Re: [PATCH] u-boot: move DT validation yaml removal patch to common SRC_URI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIwNyBTYWx0ZWRfX1u1h/zY9Pi+7
 jmfT7t7hnO4bNMzcABcjurJhnQjIsJuF3xsa9dhLyU2a59q7V2yEkId6GmD7DXVROSiHCR0sohv
 HgfVUzwQS3e4MPdH8UteEP9ROPM44pXSNo6Akb28kUxM3M5Y85tDrUoYnwsS9HUVBpZCqPmjoFz
 nzA3ig0Hi44NDWP8ZvSYmtHurgR6HuMjTpyNYLE8MT39fsvSBl5mzzTd9bGx/IMpqH/7almkqrO
 VDDDcWPnkkWyrzaTtpKZkeUf5GJ442iCYUhC5aVt6jWN0he1e8m6OjXm7OZwWAKlclx/hG4vIXJ
 +i/XASxcafFjfRSNrzADIsy4HDq5Q/IOGCUxYnfRDUt2s46zVdrDeBG5+yC/39e5rgCEQ8c8zOf
 Rtd6dn09vvpzMyWgcCAbEtAItpbIRGpX7zewBP3qRMlggz7uUZqvvnUULqEL5WSZhFGDwvJ9R14
 GG0Ss0dc0+/ZWHsnczw==
X-Authority-Analysis: v=2.4 cv=RZOgzVtv c=1 sm=1 tr=0 ts=69fe4e48 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=EpkwXz23naU3gmWUXyMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Zhu8Czz18qfqzEpLrSSNUh04bgQeH2rc
X-Proofpoint-ORIG-GUID: Zhu8Czz18qfqzEpLrSSNUh04bgQeH2rc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 20:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236739

On Fri, May 8, 2026 at 4:09=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Thu, May 07, 2026 at 05:40:18PM -0300, Ricardo Salveti wrote:
> > Commit 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation") added =
the
> > backport through SRC_URI_RISCV, so only RISC-V u-boot builds picked it =
up.
> >
> > This issue is because the v1 of the patch was merged instead the v2 (wh=
ich
> > is also not fully correct as it is not patching u-boot-tools). Drop the
> > patch from SRC_URI_RISCV and move it to u-boot-common.inc so it is appl=
ied
> > consistently to both u-boot and u-boot-tools.
> >
> > Fixes: 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation")
> > Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot-common.inc | 5 ++++-
> >  meta/recipes-bsp/u-boot/u-boot_2026.04.bb | 1 -
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-b=
sp/u-boot/u-boot-common.inc
> > index 574768b9f8..15e94a4e37 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > @@ -14,7 +14,10 @@ PE =3D "1"
> >  # repo during parse
> >  SRCREV =3D "88dc2788777babfd6322fa655df549a019aa1e69"
> >
> > -SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;b=
ranch=3Dmaster;tag=3Dv${PV}"
> > +SRC_URI =3D "\
> > +    git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;branch=3Dm=
aster;tag=3Dv${PV} \
> > +    file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch \
>
> We are fetching the source basing on the PV. The patch might be
> applicable or might not. I'd suggest listing the patch twice: in the
> u-boot_2026.04.bb and u-boot-tools_2026.04.bb.

But the SRCREV is part of u-boot-common.inc, so it is aligned with it
anyway (and it was also how patches were managed before here).

If we move the patch it might be better to move everything related to
the version used, and at that point we would end up duplicating most
entries from it anyway.

Cheers,

Ricardo

