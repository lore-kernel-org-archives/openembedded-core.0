Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39891C531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 20:55:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17881.1785099302213190942
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 13:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nXYXSYxS;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so19073545e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 13:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785099300; x=1785704100; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nzpp6XJjOzzCzSarDuwa2ugG9SLYKO0KhHb8q8a5blY=;
        b=nXYXSYxS0QiT9Sh1wq+6TsrS//0D9b1KhOg3kUdpQvcflgBI/yOTym++Px1vHarjrU
         pIh184HhRMSDs3S+z3CcxPTyioGgsuPBwycIsp3DqKY9ehs89+D9ut66oinCT6SLYdA+
         mP9dwDBGLkeS+89oJNcKT3Qp7m2BitlKH75MQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785099300; x=1785704100;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzpp6XJjOzzCzSarDuwa2ugG9SLYKO0KhHb8q8a5blY=;
        b=UaUJXdaOj19odwMjy6xQPkG0kJiE6U7HifNcYUbcGQnCgG75MMXUwsy+ERHH1SZfvJ
         2anGeZyEu+1oFGPbKEOKDvaUrRoX7k5TSbG4KzmbXT3F8T/DASB+JfTmHi5oQMZM9Goy
         +sURpcK6M9tBD8UVfTsGc5kkTg2dJlVgZtAowLsoWqQpZecHD7pF6rQItXbvf+fsDyFL
         gZnmxP5Ct2qpmeyP5vWgcXS1e5p3/epLtV8xWKBIq/OB6Kl/hwuwKbG/p3zpOobxmtHe
         vvHR3C/JvywsiVk1IDgyhvuodZkxkhKDvI07rEo3PZNHmf4C443hV3QaDjcdHZbNrWk7
         dOZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGi+qD49NLsBnaeoxYngla4MO5Ox7WWQ5OCKHBwNl/T4Qd1Bo6v6oD+z9m53VqhsOzGP+i1GIRAw8Y1URqzSGWoA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyV8w8FYIsEPZ5KTFrVFLycUfWTB8leXUZ859WEAGkojRwIHJUr
	z8jG09bBra9nGx/Pu38SN9GyiaAgPNLCey3PLVPjWaPZ38ox7lPJr7eLAIjb7Hmwfmk=
X-Gm-Gg: AR+sD13sB5xwq1nP64wSdXkgSjhZAdP7XO3WFa+92rQZjjPTHMgJg5dibwVNivfOtoX
	j+Kl8HuJgd9nh92PobCdMu5ibNkAOo+cNTAg2QFEy25RJ3aib+t+Awp/htk4R/jEbDsyuqwgoYv
	cc83+u5/usdZYXlq6NTDYcQ3a32SdFaaGIkve4HgL+oFcDNoI3j2XLv2lKS8MXrfSzSixSrcfwg
	dSTCz6QIq7T7CjanDIyTJARbA41TxtkqKx+6mlH5t+xVjEkA1ufl1Arht1QXncW9dK2Kc7wJcuG
	VQsDx03PS5OPMMt5JRx0uC8MEPsTC1bKLbEWDWFSdbD2We/3vOfpCA9zTNcaJ30Nj6E/IZK8VL+
	QNBDoPyaKhRKFEdxwzmOfdtbBYyPh04md72ekPA1GHUvPLy/c7FYPa6GKKshJFuR2qjU9FkbpDc
	W6uJWhoXykqYsxSX7yPaXdxBzCeH//3OWtShHDj4tMYIKEwFqg7XLb9rhFoz6/QSCSZw==
X-Received: by 2002:a05:600c:4ed0:b0:495:6713:9a40 with SMTP id 5b1f17b1804b1-496b56f99b4mr73666425e9.18.1785099300347;
        Sun, 26 Jul 2026 13:55:00 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9928fdsm197883235e9.1.2026.07.26.13.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 13:55:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 22:54:59 +0200
Message-Id: <DK8SW185OH0D.23S9EU4S3NXCK@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/4] wget: Fix CVE-2026-58469
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
To: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <hthakar@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260722100754.1568842-1-hthakar@cisco.com>
 <DK5A9LUHCWGD.3GUNQMOARHVNU@smile.fr>
 <PH7PR11MB8598AB8F89B7886FD3EC9148ADC02@PH7PR11MB8598.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB8598AB8F89B7886FD3EC9148ADC02@PH7PR11MB8598.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 20:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242020

On Thu Jul 23, 2026 at 10:44 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) wrote:
> Hi,
>
> I reviewed the earlier series.
> It looks like the follow-up upstream regression fixes for
> CVE-2026-58469 and CVE-2026-58472 were not included in the backport.
> These follow-up commits are required to complete the backport, and I
> have included them in my series .
> I kindly request you to review my series as well.
>
> Thanks,
> Hetvi Thakar

Hello,

I can choose to continue with your series indeed but it lacks a
corresponding master series.
Amaury's series[0] on master has the same issue as this one. So I doubt it
will merge in this v1 state.

Can you help review/fix the series on master? Then, I'll consider your
series.

Thanks!

[0]: https://lore.kernel.org/openembedded-core/20260722081709.14764-1-amaur=
y.couderc@est.tech/T/#t

>
>
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoan=
n.congal=3Dsmile.fr@lists.openembedded.org>
> Sent: Wednesday, July 22, 2026 23:11
> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hth=
akar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-cor=
e@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> Subject: Re: [OE-core][wrynose][PATCH 1/4] wget: Fix CVE-2026-58469
>
> On Wed Jul 22, 2026 at 12:07 PM CEST, Hetvi Thakar -X (hthakar - E INFOCH=
IPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Hetvi Thakar <hthakar@cisco.com>
>>
>> This patch applies the upstream fix as referenced in [2],
>> using the commit shown in [1].
>>
>> It also includes the upstream follow-up fixes referenced in [3]
>> and [4]. These correct the trailing whitespace check introduced
>> by the original fix and add the required <ctype.h> include for
>> isspace().
>>
>> [1] https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a=
7a4fb0b6f7826
>> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58469
>> [3] https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8=
a00386c3f3bcf
>> [4] https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aa=
c298c24fe00a1
>>
>> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
>
> Hello,
>
> I received another similar series 2 hours before yours:
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D48992
> Can you help review it?
>
> Regards,
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


