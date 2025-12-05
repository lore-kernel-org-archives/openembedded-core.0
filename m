Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45603D2CE1B
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 03:41:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62529.1764906075844606863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 19:41:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ny3SMUx2;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=WBwgxgyV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B52eeE83172960
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Dec 2025 03:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbOjFBJGv78qX78PgByvn5x5sUjpCrhHKlGyIqrIwbM=; b=ny3SMUx2ODkH0mGq
	Y0QyeQr6LgNj1WekUyRHM+8IbR+XGNYr4Hd7JzXBGa609lhXAiTsTMx4TyDMc6zY
	A6jtIxytyZ9D12oUKCpz2S/923RY0eT2gSm4xmffVokqceIw5HgRh7McxljZLVci
	RGP7Ja3hRtP7Ybz4TtY6YOorqRy3xS2Du7exuiehshlHBolGBegdgejUEWuj+n2K
	8fn+WautwzkZKf2+WkBFTbd9SA+RTdHn4ZcnufEfMQ9JFEBSgyLOFpbIBrjanyKw
	LW7X5Rill6SLPdqyGTXzXTCOc0D10xa3271FXK/e5OxYBg+MG2VmlykFommAZygZ
	mETWTg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auptqr4ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 03:41:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88249865db8so37346106d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 19:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764906073; x=1765510873; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbOjFBJGv78qX78PgByvn5x5sUjpCrhHKlGyIqrIwbM=;
        b=WBwgxgyV4bsY4j9kD4eFmAWGgG0sheb5+f6+p0BAp+rAqjue+7JxooAoM8ML5/BSQ3
         EscZ0DSD85d/EXQsGh6WrcR79WTmkifLxIqz2edMm3EoTdIfmk/6GwXDMsArF3wHxhAU
         jm+F7vTOnhlKn71LjZvN3lajva7vJGVGRqO3MwWNx9EJtgQZZjGl85LG0dZGjrtZXOvD
         gmlF7z/jbFa6lgE9KgSbHlD3VcAOMuWBpGauSde/NWLA0NmidpBUwFVISRv0Nb8PODbf
         yF43Qde9TUPAtjxDByr2NMue92EvZoUOBmSDNGA10JuV0orv6dzMRMSpsv4hOMIEvqOM
         MFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764906073; x=1765510873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MbOjFBJGv78qX78PgByvn5x5sUjpCrhHKlGyIqrIwbM=;
        b=lK3idwhaeTkFSNRGAfjjsqwlL9lL7eClJAekeCu4t+RUVw17w6Ycd5FZ4V46TPrWTd
         bX9za0WUHiskj5LpWX31hq/MHzabTkaKAbJ1/sOQ7KdLx1TupE2PYd9EcydiRe3kaVCD
         u+YYiVNyK90klvEzoEQORTA8xwK/JULfGdtogljzUtrjZCkwRDtg5Aas8PP/p8gwzTbf
         OS1PnV6ATly2QMGArKH2jofcYGPEFNXqahRQIlnCaH7wnGJ1zRbEso2f4h6+IKaNKFY1
         lbUZuCkZem1Z42wdjzvRdNA65c8fxmpqXASQxVUsXL6EXpz8lbd7eMZuLo1Myrj4Xg52
         hLag==
X-Forwarded-Encrypted: i=1; AJvYcCXErKkFyEJZ7ezp7ogGuymUsD16gLW+XxYLj37GnDLuk+7yaF8DThHRZYDhb2v4t+0aPWrOe9KPoh2o9uqdK47h5Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzBljbrAHVaGAzIXUXpD5IUr6N1gLNd+J34Sjx0V5Kf4o/aVLN5
	bj5g6s/7ETrPvRNfA+0MheKcLoC1Ps3HiXLXzQc5LgkE14b4n7UetboU51Tg5MEF/emNbWHN06d
	BTq9FQyi1kWfN987UjC9sqyFU7zONbdO2aGDRfs7CgLZFb9aDRAprxtApK760v/tOFWm92kffJM
	OVaZggJJ9lB9f6clBqNokCP0PhcihONngbp9MtqaD++P44F1Ou1l/3LfBEqUrqIUJewnms
X-Gm-Gg: ASbGncubmZ2tT/KqzwOIhzOShJS/Gs0atM2MpeJqYbCwecG5ikOYjIRNotKXUonZJcW
	2hQagvvte+AaiExGn4joiBjY0dCvcWl5osq06BuCDmuvT8+okj8exxTToS2uE+FLKhZNE1APFCW
	pTevaAXDVIEXL8JVQEtehzdG0mFlBl8VAv3+fY/8Sf07zyUv9fliCKNs/6WAKnlzVsFPA=
X-Received: by 2002:a05:6214:27e2:b0:765:1642:2ca0 with SMTP id 6a1803df08f44-88824520a9fmr84729346d6.8.1764906073442;
        Thu, 04 Dec 2025 19:41:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8L8pCeTWEpGmY5QZ9fXT1L9+1O8fCRn3xUcE+LwboMcNtQDfQAnKFI6DsPPr3kA4I4zTxKUNnBCWqHAIRcnA=
X-Received: by 2002:a05:6214:27e2:b0:765:1642:2ca0 with SMTP id
 6a1803df08f44-88824520a9fmr84729226d6.8.1764906072983; Thu, 04 Dec 2025
 19:41:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764713862.git.steve@sakoman.com> <ce604b9bf682e404baa15800fcdbc01abd6a66e1.1764713862.git.steve@sakoman.com>
 <b0caac3f-5a60-48e4-bd89-15fb3654a91e@gmail.com> <CAOSpxdbBg_g6=LKqs58LnZnTG9SGSuXUUudvz=kiwVoTD-W_6w@mail.gmail.com>
 <a895de24-e46b-4966-a091-b95f1df6f767@windriver.com>
In-Reply-To: <a895de24-e46b-4966-a091-b95f1df6f767@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 09:11:01 +0530
X-Gm-Features: AQt7F2rJOs-oCcg4rgKvf51_e48giv2Q_6yTu5h0sG0Of4OcpNhxzM6y_hx57YA
Message-ID: <CA+s=J=z-d13udWyvARTW9hgMFpzDkNQi=CS7dPhcW2qMaQoLFQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/8] libmicrohttpd: fix CVE-2025-59777, CVE-2025-62689
To: changqing.li@windriver.com
Cc: Steve Sakoman <steve@sakoman.com>, Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: llWcdIKuR3hNoTFAUnJu0axfSGNhQX6Q
X-Proofpoint-ORIG-GUID: llWcdIKuR3hNoTFAUnJu0axfSGNhQX6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDAyOCBTYWx0ZWRfXzG/u1T7z7qRv
 p5nTH39cCNhBD2yAzSbSQqEloSSk+YD59wgIyj0hzwDtaWpTqom4Rq4Pn0/ewKNVNS+N1V47QwC
 l8Hx1GkJ30IXmDiLrybk/chkCoqBWIPA6ZnSFtMPkqB/bojBlkOwdBTZai4CckKiHMK7MVtgHkT
 x/qdq4HVlZYl79T2s4ernThuEeSJY0QUN1FbWVQmD2gOFpJpdbePgusrF+6qbwRJ+k3AN0uwq25
 IA788idwFPyx3e6jL9FHYZD2cODxKD1+l5kVX119OQ4qkEr3vrk+cLigGTUxZsEWhKDrPCoHxJx
 UQug6M5WpPGNQBAgTaxMcYovbwcS+4RGaLPWe/zSn9jn8n/KIVJUDFMcb84i03uE1CqEWamWBgU
 E5Qc7qY2V6uTSe//VMqRwOFbRGJGCg==
X-Authority-Analysis: v=2.4 cv=fKQ0HJae c=1 sm=1 tr=0 ts=6932545a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=bSLyaIA1Gojbr5zygQ8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 03:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227330

On Fri, Dec 5, 2025 at 8:22=E2=80=AFAM Changqing Li via lists.openembedded.=
org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
>
> On 12/5/25 01:59, Steve Sakoman wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Wed, Dec 3, 2025 at 12:25=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail=
.com> wrote:
>
> This is quite a big change in the middle of an LTS release... not that I
> have a better solution. But maybe a warning in the docs would be
> appropriate about this removed feature and its reason (not sure who
> takes care of these).
>
> You are quite correct, this is a large change and deserves further
> discussion since it is removing a (admittedly experimental) feature.
>
> I will remove this from this series pending further discussion on list.
>
> Hi,
>
> This vulnerability exists in libmicrohttpd_ws.so, which is generated when=
 building with the --enable-experimental option, rather than in widely used=
 libmicrohttpd.so.
>
> We don't enable this option by default,  also we don't provide PACKAGECON=
FIG for it.
>
> How about we still keep the patch for fixing CVE-2025-59777, CVE-2025-626=
89, and add the following warning in libmicrohttpd_1.0.2.bb
>
> +python do_warn_experimental() {
> +    if '--enable-experimental' in d.getVar('EXTRA_OECONF') and '0001-Rem=
ove-broken-experimental-code.patch' in d.getVar('SRC_URI'):
> +        bb.warn("This option is removed for CVE-2025-59777, CVE-2025-626=
89, if you insist to use it, please remove patch 0001-Remove-broken-experim=
ental-code.patch")
> +}
> +addtask warn_experimental before do_configure
> +
>
> if the user enable '--enable-experimental' , warning is it removed. if us=
er insist to use it,  they can remove patch 0001-Remove-broken-experimental=
-code.patch locally,  then
>
> warning will disappear.

I think it should be the other way around. If we don't enable the
option and don't have a tunable PACKAGECONFIG for it, why complicate
and patch? If someone did enable it knowingly, they should fix it in
their append or recipe.

Thanks,

Anuj

