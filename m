Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54346C61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:49:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.96812.1749584974397808901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GD3ED43c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPw40012150
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeNbptd2tTasA6k3NDaoCtcSicchuvptidntsNOt2wc=; b=GD3ED43cGAX7kQFr
	k/r1Ik2baP0XHpaQOUYw+u6pBKVuW+y+nVUYJaycPIJs+3+PwPKOzbJXHj4FdABK
	4zvs04IcQtPuPDoRuzpOC1A6G+eeZNuNv2EAHKP8/jqh3/LZAcDXvmvW1ShyoyRS
	QVGzmolJGjHFAJRKXPAAeCvid86ttOjZcEnO+uRod2yc06niGVvk3ICZUj4UEQLH
	XAwpturqVkn/mlmB6hYc61Er8C9o+UlY9aPFzDZwhf77oada3ifQb+nk4eA+g0G7
	f23LNH6j17owXNJl40Z+78bUpmCxnySWy0E5hOWRoLvG3gHE8koZ358nEHBzU7YK
	rug4NQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxtx5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:49:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so5351170a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584972; x=1750189772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeNbptd2tTasA6k3NDaoCtcSicchuvptidntsNOt2wc=;
        b=ReR0yviNVOZgVxWdlSCbc3kffDhP1Ssz8Chr19/VMImDR7KamLMYnBG5JqJz6NU1Fh
         Z1t+636c1Vj1u4nmBE3zHpa63ht3mIMlp/PoXW9RLmttXpYXS/BDXbTG6fme3YU81NNB
         9SL1uwmf8MZrP2Jb/h+Bp//ygkJpcbFGugKDli35KCuWmsToYb/CFfXPYQbNUIZE4+Wx
         C3Eh29xoqqDWOsWpc9zH/8Urz0ecr7g+3iYLLg9SAYk7f2A2/lL8mr5Blnti4omstC+f
         4d2SS5EmITfDovL11sNKEjw0h/QG6sdWbD6dxoT8pDHhkAz4webaSzDnrcvHTSUdZZXp
         6nAA==
X-Gm-Message-State: AOJu0Yw1pWpOyNDJpHuUaukR6Obe5Uu2f9t795CpaCyGvPTljozaknHi
	kIC+1Mbr/0eX2X5EGtSWWM4KGIR2aZPngmsUCY25wK53RrRY00BJX4ekeTwRt0D7u7BaXMZ15yg
	1cKQz6yI+B0xWp12CZkenuTecQpM6L8QQ7+x5TzPzSMToGbQN4hPIB8Z4TbYXifT9SICX6lnLTq
	ozCP8Q/e1aUswSA3oOU3uLMMEka0eaxkte96dkFDsU+vdEvVO1TBef68ZB+w==
X-Gm-Gg: ASbGncuGYuScQbH+To+PJff5UJglPA8M60bECvW7sy3DIDPyizg2anhjliddlgfkEUg
	c52NpdUzk3k5gN+XzyhxVeN+qL2mVOI5ThHhZk+ENp648eVZtGQ9dWNiot0zLQPt1IWaLkAUyFC
	koTLDv4H1MnmP7rybVIg==
X-Received: by 2002:a17:90b:4d07:b0:312:f2ee:a895 with SMTP id 98e67ed59e1d1-313af28cc77mr1001036a91.31.1749584972012;
        Tue, 10 Jun 2025 12:49:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwD1tNczDyx8mNtn70OWS12uz1DCDmRJv/aaEMdMV99QdM5Fy6ERTl2zbX7Ap4CKNcfwvpnuMDeV7pyzz80nM=
X-Received: by 2002:a17:90b:4d07:b0:312:f2ee:a895 with SMTP id
 98e67ed59e1d1-313af28cc77mr1001016a91.31.1749584971603; Tue, 10 Jun 2025
 12:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250610142413.681911-1-zboszor@gmail.com>
In-Reply-To: <20250610142413.681911-1-zboszor@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 22:49:20 +0300
X-Gm-Features: AX0GCFvr5IgKA04AqpLY3NkmBjNuzgEv36O_dS1pu86uNrk9BUIsuw2xn-prhYI
Message-ID: <CAO9ioeUn24ndJqaH1O8B0G+mB8JKx_JcROXhzJqrw36L84bmNw@mail.gmail.com>
Subject: Re: [PATCH] mesa: Fix bindgen includes
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: bG-nf4KKt7mfjrnvYEDuhSk-jcHgRHkX
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=68488c4d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=pGLkceISAAAA:8 a=WTPc9SigC0jj7FfOCiUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: bG-nf4KKt7mfjrnvYEDuhSk-jcHgRHkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE2MSBTYWx0ZWRfX4UPKFPaRD4mC
 oWH3MzAkm/fOUF3QT3VCvidfQN7+oEVwR2HeEZct39rDitRgeZkh4wFuig5zNOBGyanHn2yRC6N
 7+erWeZuOCHTCrPy1qhySwYDmNiiDl1JnovCV24lxJ48hFK4rYpx9l2F20dP+yI27U7UdJ8b1Re
 YFZu/etwTURjJWNQ6OiQ1ZUsedg+1ishiWMnkYAHuYrrQRcxI8rBECt7aYfFcm1fgynvnv4gaFe
 gZsM+E0jQepcKXKJZ13UmiFb7MDDEj2IZkzG28VMNvwWijHJoISqfmJxr5VETHZGfiJqhh3d5JX
 tahibZPesnshQv/L0VVngnSLZih9YQKODoMVroA4rBpmVegAL88fpmU0SkTae4IEcpGDcjwBdV/
 KrCAyG0kRqnruNIl8rLxUfgjXA8xC+DTMJy6wWJWMGXhwZ21X/wkoeSVg6EYd/XNtvNLxKa/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_09,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=618 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218438

On Tue, 10 Jun 2025 at 17:24, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbosz=
or@gmail.com> wrote:
>
> Add a patch to fix bindgen errors due to not finding headers
> in the system, like:
>
> |...
> | ../mesa-25.1.2/src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:=
1:10: fatal error: 'clang/Basic/Version.h' file not found
> | Unable to generate bindings: clang diagnosed error: ../mesa-25.1.2/src/=
gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:1:10: fatal error: 'cla=
ng/Basic/Version.h' file not found
> |...
> | .../work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./GL/glx.h:=
30:10: fatal error: 'X11/Xlib.h' file not found
> | Unable to generate bindings: clang diagnosed error: /data2/dtd-yocto-5.=
2/tmp-sicom/work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./GL/gl=
x.h:30:10: fatal error: 'X11/Xlib.h' file not found

Can we fix this on the meson side by passing additional include path
through the cross file?

>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  ...w-build-option-for-extra-bindgen-inc.patch | 57 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  3 +-
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-Add-a-n=
ew-build-option-for-extra-bindgen-inc.patch
>


--=20
With best wishes
Dmitry

