Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02771D39003
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:43:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16254.1768412602502413831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:43:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=mlCHrbK7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EE0hT52081607
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:43:22 GMT
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58vgpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:43:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a08cbeb87eso733705ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1768412601; x=1769017401; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpSmW0jMUjX3BhBbMv1zC6fX3U3x84LNRSIPUF1idZU=;
        b=mlCHrbK7DqgW2r0IamcZ3RFrL3Ydw2lesbMkUtJpF8Rq34Z/VT731hYniQW8sOkHD0
         3IBBCyReIAxXG0Sy2zrEuhJnOqxbsX450fM4ZDRm9lUYeyLV/H7pKf51CQ5BLuqZ5GmJ
         /PlpLLuScfWmu78ubKrw7aG43OMsZOji/AKmE7uoG5E/i7r2nHi9ZfIkvEoM/LCMrIR/
         BCqIeQSDLbZi4y2FpOjUUnEAmPmgVv3S+QxpNI+Ckx4hNfSXsjs1pXhNTqwR7ttSyCC4
         8nmCIb6ow4i6Z176n1bTckubxOh5YNsvQIEkY0wTh7sqgN/abDnfpTbYpE+WAat+WAsh
         HKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768412601; x=1769017401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lpSmW0jMUjX3BhBbMv1zC6fX3U3x84LNRSIPUF1idZU=;
        b=ktMJ7hYyUg1+Dwx6m+yzdc6AEkU0nv3oQNeS+TJghfMB3ME0y8bW44otmValIf6E59
         Nuvue+uKuNQzHsQquowBbGXwYsq2crSeoDyemsHiYNOmTiRuIu7877XHJBvs9E00TEiA
         D4JlRrA3eIKCKJxjQi/8wt1Ss1Tm3ZoVPYjWPOecz/TRRVn2BGGW97wEHohrl1LgS3Vx
         c/ntDDDWMcWvtycYd9vbvfFakzA4zqBuigJ79v9pjgCde8i7YZk8L5El8W/oKHHgWgw6
         7YSZaIuAVWolRqjEN+zYFX3wWYpB0fV06m5dlK9X5MFgJ/d+M3czjhO9mCvIAYqh+4Ke
         4w/A==
X-Forwarded-Encrypted: i=1; AJvYcCUQfZssX6TKeXg5jZMHvU7CNmoQY88nl9bW6JX3tyhAUtS7dd7mV51/Y+jYR41GU2yqcNuD95juXaZpmzA4NjklmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYEZkFGRrUtnuhDSXQguHrv/OaHuwu0lAVA2SO4mzjslJNvwB5
	NeOyCKfyccsYBqnxL8nC3hhpaeczl00CxrX2tABULspsQmUVdS86PV2f1gq8MJbhHD9P+sptper
	dYjvYQJH0luidcwl8R0Mk647qLjL0ZogoroIq7qJrwFAk5ITnb3hLFrRIOWr+oLDFtRUS7scMOb
	MxDqIArbFxlLOnNjKtYuG6U5M0CWp23a+XKP2ZuucZ4t7cGu/4AYJqHJFbV448+uyAAHQ=
X-Gm-Gg: AY/fxX7s1qdlT5UgQHy0VbFajDwKII7ZydBQRof5R/dttVA1WtZeezH5CoMg0lpem+2
	42u49zwLqSG5HoJxlL+3wbNBq8qTrUggWy59VPVPXSENDPrE+yJGWZ/vNCLKRINnDK00X9bYMHp
	pcBlfXUGiAdyOcqe0O4J+um6UeTAOUZecx6ueXAxtOUzqqssx53fCeHCxpkW+ULqO5OZA=
X-Received: by 2002:a17:903:22d2:b0:2a0:9e6f:2ce2 with SMTP id d9443c01a7336-2a599e4ab1cmr33999595ad.41.1768412600540;
        Wed, 14 Jan 2026 09:43:20 -0800 (PST)
X-Received: by 2002:a17:903:22d2:b0:2a0:9e6f:2ce2 with SMTP id
 d9443c01a7336-2a599e4ab1cmr33999375ad.41.1768412600143; Wed, 14 Jan 2026
 09:43:20 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKowQqn-VuqaT1w3cXCWGfBeMtG2rHR9HXBFqxSfttAk4Q@mail.gmail.com>
 <CANNYZj_ERuqEY6w49NRKO5OsBr-HqG8hDSHiAB-e55LVhZq=cQ@mail.gmail.com>
In-Reply-To: <CANNYZj_ERuqEY6w49NRKO5OsBr-HqG8hDSHiAB-e55LVhZq=cQ@mail.gmail.com>
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Wed, 14 Jan 2026 14:43:08 -0300
X-Gm-Features: AZwV_QhwTLjkobBrQulW-sDQ2M_4TsXJT2dqNmshtmH_Q4zFw0PThstSxizplug
Message-ID: <CA+HEL78C8y7fgiw1GVkGovT-rEBObyqF1+eRy62suE-wHHW-og@mail.gmail.com>
Subject: Re: [bitbake-devel] [RFC] bitbake-setup: Documentation terminology
 and tooling suggestions
To: alex.kanavin@gmail.com
Cc: otavio.salvador@ossystems.com.br, bitbake-devel@lists.openembedded.org,
        Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE0OCBTYWx0ZWRfXx73QVNug6fxU
 w7y2e+78Ky7QbQpISMPpBA+2LKvpbKz0jrukIJpGpKTFgzh5OgHhnVQIB+t/crGuLwRLGKoEzVp
 nc8pvGM0ZROJvD07dw/N6BpTQp3o2uqCY8RpCCfC2trE8CANPDI8vcWU5i2RpUaCdVWTPF9w3eV
 nJmja4MxiyAIed1LVB9DBHUEGaalgqO0/TK1CP9kcv9pQCthrNE+4CMc4Kh1T/WJddbWYZmCeCP
 lc3QnW/sH3yONA7l99YQ/CEkxlf32wCmsFa/2xXeJMV6otDch+qNLWrXBaKQwAKivCODyjnot9Y
 6e5TDtmOE6LHK/kQkBXVuZ09Gvu+PBPxtta0dXGGSVXeTL5xuNrxoQeWZoBwiStegXwifXYdNlc
 0mjmHZq5WkPCXGKVvAS1nWYtqEGAB/bVuoLRVey6XwvJx6mty/ZBDpMbLcUl+VOcZRsYAKp4MBp
 pIVKYUMrsx4U2bvIkZg==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6967d5ba cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=cpenunzqXUXvdi5TAeYA:9 a=QEXdDO2ut3YA:10 a=o03EqElSOXwA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: nlg4MXWQTbKmTjo5kcgOYS9Ms0DzoQp_
X-Proofpoint-GUID: nlg4MXWQTbKmTjo5kcgOYS9Ms0DzoQp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229365

On Wed, Jan 14, 2026 at 2:25=E2=80=AFPM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
>
> The only issue I don't quite understand yet is "allow empty variants in t=
emplates".
>
Let me frase this in another way. My project has all and every
configuration needed into a distro conf file. I want to create a
.conf.json to share. Can I create one file without any
variant/fragment/bitbake configuration?

Or, Why is the variant "poky" empty? [1]

Or, why is there "two pokys" for me to choose?

```
Available configurations:
1. poky-master  Poky - The Yocto Project testing distribution
configurations and hardware test platforms

Available bitbake configurations:
1. poky Poky - The Yocto Project testing distribution
```
from the iterative `bitbake-setup init` output, from [2]

I may have made mistakes with the concepts, but those were the
questions I made myself when I first started trying to understand
`bitbake-setup` and I'm not a newcomer, so I assume for the newcomer
it will be even more confusing.

And when I created the draft `conf.json` for meta-freescale I realized
I could just choose none of the variants (because the base is the
DISTRO and I might want only that)

I'm not sure it makes sense, please help me understand

[1] https://git.openembedded.org/bitbake/tree/default-registry/configuratio=
ns/poky-master.conf.json#n66
[2] https://docs.yoctoproject.org/singleindex.html#use-git-to-clone-bitbake=
-setup

Daiane

> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18762): https://lists.openembedded.org/g/bitbake-deve=
l/message/18762
> Mute This Topic: https://lists.openembedded.org/mt/117253653/5992125
> Group Owner: bitbake-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/bitbake-devel/unsub [daiane=
.angolini@foundries.io]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

