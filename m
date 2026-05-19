Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28435CD4F54
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 20:26:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5.1779222371871639222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 13:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Hn2TYa6d;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Em9VSaVx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExN5e2984433
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 20:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8p6Qne+Bgs/236GLjYkBiJc/rt5ih4XoM0TvWqXUBk=; b=Hn2TYa6dgmDoHUlp
	XqCucbmQv8re++n3cFtDvzTIO18B8JWphOiW/Nq8vEBzZQfbO+auNRXPqdtAxLFC
	hTHTLBxd6IpbUvPx+9OvEdBqMArjgDzt4vbW0MRH7nlJGThX0dPZx9Ul2xbF6q+u
	TsQNuIBZuPdLZ32G5kQ5txROhOWMxvoTDUk5cM9Zz+GJBecZK0zV6KmyKPX4f7/P
	SQJVVcBvWBdX2P4aR0hmuyOdKWSQWQAdCFmQy8SRyaSNb0BXAllotikjpEkMYNIx
	V+GF7MUn1wG85HEEAFKQZdBMX15oWn9AxvYnc8jKddp0sBtpcZ0dkiZ3cNnMXQy1
	P0v+qw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t1c4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 20:26:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so43906525ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 13:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779222370; cv=none;
        d=google.com; s=arc-20240605;
        b=e61qzKHFOPdRw6ouXxGSzmGtLmo/0JfktgHBR39pCcc9Gf5W/3hgEfTcNPh1T/1RAC
         DTeznLE60+g3EkGysLp8W0xLXue8L9WCEaBCOZ58IOj/l5QskcbTYZJx5GcBmkCTZNTr
         s56mJML+I5B2gIoUOqcuc4UFHBCJmARb174/QLzt8PsjBTDYlka1bJxHY0e3Ft4CeZrD
         0qPK/cZlb9yfPvdWkRFYfpj+Pr8YK5fQxwBv0MkL4Fgsdd72t1V2mSf7/xxGZco4guAQ
         w6GQJVYWagBtS7M4CD9HPGVeDrOB3pLY/lmSe+d9XtokmiHbCaRkOQShyYd4YmRusfdI
         siqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V8p6Qne+Bgs/236GLjYkBiJc/rt5ih4XoM0TvWqXUBk=;
        fh=CK5Z4y1KgrAfYclKOg/k/g23xHKGDWYnxjmin7+0HMg=;
        b=TaY4b72soEJ9rmMrcivoDtBCMloyUv9obchdGB3T6UR9JBVZP9b3kYKCDV8m2KM31N
         d9b1pPQrAzXEYg4B12BzRpsvRZUwERBpof9iPG0VwlsSr/cX9nA1FR4LOAreO0TjvCNh
         tNKoTLG1d7fAviKBYEc+yhUpkP3VhxrTmY9RyqApmqfYJD52oT/joXGp/1DlwOaK6VkF
         CtxktVHV27NDqal3SfVwQlncCtk+qZ2KGfjVorLj80Ls/P5lBoAA//amkFxbgttJ/Z+J
         sFlScTOLa5KMJJOD/lz6pH3XnhIT4eThtQulH+2gYBbK0pAqgkRunQnAa0hlUHUk2bx+
         8GpA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779222370; x=1779827170; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8p6Qne+Bgs/236GLjYkBiJc/rt5ih4XoM0TvWqXUBk=;
        b=Em9VSaVxMUNE1eCBaSOP4Sp0pvbKi/08/b1KOSRK0nI1R1hP7juqmLHbrSCYV4ydWc
         0R1COLrqcM34HCvDD7CLvFLOqp8n8u/ZQXTkh3mF1FUK7UCrta+PPRQrwSL9IHJ5N8H8
         3SWyeB+uGVVV5EiwXtRegNmBnK2fSSMtiO2S3oYwiCtcsBG4XlSevm8UZaVj8TYTeRU1
         7qLIFw0Vji+PLuGl1PCOOllmUq9rT3O4Mb3Cxn+SCJST0PUIfp+CF51DHmRHyZ1A3kfp
         +jVjDphewaIM7X4OtjaZnXH/E3/zQQYAS+PafDHZuWpzUpFlVZeSOUrXr65yJ/F6ENsb
         f7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779222370; x=1779827170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8p6Qne+Bgs/236GLjYkBiJc/rt5ih4XoM0TvWqXUBk=;
        b=WXZ3UFSn7WBpUadz9iBVDnHMHgLSdN99AleXIcQejpKl6kRqSnEmRUUhqdYYWMbmcJ
         o4lH/JY9UyPQjlPyhkOddsTZHVTb34CJ6RXPhbYIGQ92aNqfR+ROfpl0DK5/HJN7q8Ih
         AULEwbwGSyp/MUp7MWflqGsGaKvqQmSNkIn2qHjIItyn7QkiOors/IoDM5uCJ16wIMOj
         rvrQD+Mb84LwGz2UbT8NQZYtJxWMqSMYhTl93Y0DhJXEzk9gvbax3rmjwbgRFasG24Zn
         +ncfFQW28z/MlErsbozTHkkIYEqCumjVSIsmWGmvaX4gQXBjNFNquWRZgqqYUciIH5zQ
         /8oA==
X-Forwarded-Encrypted: i=1; AFNElJ+78M5lbCMvTJcInFM5kMI7GOh4BFNLGAn/mx1T1EH9A6pGRy1hpnjeiu1eUbV0PcuvBWYDK+AwUqKHf2xY9AElGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz5rJoKGk+MD5ppmKiL05ks+UfIEodfKUWBthSSGHBZfas4dLLj
	WW6WkZm6h2haz7CDP5DLS4zjmTdyHYLtNGKszOJBUL7Q1807Rz1SuOp/UEgRsWhpfat4ctEkVr+
	qduCxBHm+8Acu8Je45TIv7l3R8/KfC0rgV+GFzUei4ZrFZ3Z6FF/NX7RXiE+c5B4R0zOiK9NECJ
	afnBYrbQA6LFp3jdTZ3KAS5tl9RRPsHlTYkmSGEWGMb8atD1Ozd776pITlIw==
X-Gm-Gg: Acq92OEs6etSyL1V/m65/tg2RSfSIczgUGmOsw+/oMaQ5JacDvWmMr6w8FJwiva+C10
	O352nvTcHsNUh9Kzu7DtjbeI+vapemp07E8oA8JR2qwtivJNM+Pcl4jjHM2IwtNxustMGbb1Vuo
	knt11Ta08sW7IryYgSTez80LOLs4ss1//99bgMwSO+Lrf7zpnc8TBxdCASqHNlUkV9OhozZFQzf
	Wy26Q==
X-Received: by 2002:a17:902:7484:b0:2bc:ac76:c1d3 with SMTP id d9443c01a7336-2bd7e9af975mr159948505ad.29.1779222370422;
        Tue, 19 May 2026 13:26:10 -0700 (PDT)
X-Received: by 2002:a17:902:7484:b0:2bc:ac76:c1d3 with SMTP id
 d9443c01a7336-2bd7e9af975mr159948285ad.29.1779222369842; Tue, 19 May 2026
 13:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
 <gnsndbzzgdnp4q5bqmccwxy5njtkj22btgpedstktykczupbfk@chm5coxohwxo>
 <f531466a-fbd8-472b-a2b1-e487eea6d51a@bootlin.com> <9dc8c3b7-c358-4a7d-af1a-c1aec83906af@rootcommit.com>
 <e8674aa9-a98b-4d39-bc9f-a525516d3c24@bootlin.com> <8fb4098a-0831-44d5-a852-3759d59f2433@rootcommit.com>
 <CAA_5yovGUPcCN1KE4ZzCY03amL5vKOM0f1P+78ntaqr3MKhBPQ@mail.gmail.com>
In-Reply-To: <CAA_5yovGUPcCN1KE4ZzCY03amL5vKOM0f1P+78ntaqr3MKhBPQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 23:25:58 +0300
X-Gm-Features: AVHnY4K0t6c_3X6USdptMSGOn4hTxud_OWCZkauNeQKoaGgGu8vjMKafL_EmlSw
Message-ID: <CAO9ioeVefEkaL7zrbmBymk_1n-TLtibTpMsd6DN+V_=WBS5hmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: move DT validation yaml removal patch
 to common SRC_URI
To: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
        Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
        openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0cc763 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=d70CFdQeAAAA:8
 a=9xnRkU1d2pGwXR3Ryu0A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=NcxpMcIZDGm-g932nG_k:22
X-Proofpoint-ORIG-GUID: BLbojyS_UMv0dZyDGDk21kSFo-qPdNYo
X-Proofpoint-GUID: BLbojyS_UMv0dZyDGDk21kSFo-qPdNYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIwMiBTYWx0ZWRfX3U+yGX/0btvB
 lS/qARUGySWCk3LBMRe7iY+uEBj9lkAxRTQ2TXh0DO+OyoR0J3pC3bggLtJanX/t3tsPHS1k8eM
 1hAi3R2xy/IYJ2A0j2o3GLWC3SKQ9/Jo1T9xT1PHdsKnPt6aFmOCtPqnpWNV442uTwVjAtY8m4J
 Q8pKF9ACkfe/opXQc1qReN52WdcQaskAF4rXb6Kw7Bmtkp0ymdNSR2QuNgBJ5BWWGsbGYvKk6hE
 oCYB8kNerSWwNj6Iuo3YdGS+3yKRZV17fQg0i3zpgA2/TrB33FuyPxLUWSj0wjl3WSy9YVk9/y6
 1jIF3QOf/MMLtP+GB0yjMx0SLFqPpRrjAoxN38G0vs71hzDp2Q4XHPkMgPPrKru770qmtOmCTQc
 K/RNMWPdGyJ0BJRseosmiPtPZxmPPrTz3shXvWznBm3pIz4y7+ae+JmxggPKH+3wW5hYbCp7UtD
 1VgcZsvUQUi7JHPMV3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 20:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237344

On Tue, 19 May 2026 at 20:02, Ricardo de Araujo (Salveti)
<ricardo.salveti@oss.qualcomm.com> wrote:
>
> On Tue, May 19, 2026 at 1:29=E2=80=AFPM Michael Opdenacker
> <michael.opdenacker@rootcommit.com> wrote:
> > On 5/19/26 1:59 PM, Joao Marcos Costa wrote:
> > >>
> > >>
> > >> Any update on this patch?
> > >> Building u-boot-tools on master for the "qemuriscv64" machine is
> > >> still broken.
> > >>
> > >> For people facing this too, a workaround is the add back
> > >> "libyaml-native" to depends in meta/recipes-bsp/u-boot/u-boot-common=
.inc
> > >>
> > >> How come the autobuilder didn't catch this issue on one of our
> > >> officially supported machines?
> > >> Cheers
> > >> Michael.
> > >>
> > >
> > > The same patch [1] must be applied to u-boot-tools' sources to fix
> > > this, rather than adding back the dependency.
> > >
> > > That said, unfortunately I don't know what is the current status of
> > > Ricardo's patch, nor how come the autobuilder didn't catch this issue=
.
> > >
> > > [1]
> > > meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-valida=
tion.patch
> > >
> >  From what I understood, his patch was rejected.
>
> It wasn't really rejected, we have basically 3 options to solve the
> issue, and the one I decided to use was basically the same one we
> already had before here, as I believe adding another common file or
> duplicating the patch line just to reuse the common file is not really
> that great either.
>
> But I can send another version duplicating the patch line in both
> repos, if that is preferred by everyone.

I think that's the best option.

--=20
With best wishes
Dmitry

