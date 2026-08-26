Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C84C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 17:01:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17344.1787763659473514500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 10:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w7ktbU4i;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so7482235e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787763658; x=1788368458; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSYYdc8JsOkKPEf8xjAgBGfkqBqzd+ocC6fzROaE4uw=;
        b=w7ktbU4iDrBmunlwh2Odg1wOxFT3qlwaAIT+clWpv8lwCcfpZe9eLZ8jISWFpkJYId
         pen4cepUz3Q16/wYGrc8reDVkws//EMisHa7ngVq23H742RE6GWXzJM1Q+niAU+6ioOa
         oteBq6EVb8zB2YMlUAkWPUD6Uawc+3Jn76+fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763658; x=1788368458;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSYYdc8JsOkKPEf8xjAgBGfkqBqzd+ocC6fzROaE4uw=;
        b=r2/vjd7OURnVEE7ofym/AL2njVTg57qEHmQXA+zovK1KoqRP48014uaqpWLGrXtQ03
         GdgkYtNplVotdtUiFeyZlT9bzAThWwdZSIyvvKt9PEzaFgA4noeAgrl5hpTzN94fr2QD
         MPQQVLfsCjGItSqSUbtDuf3xJi7WirN0j8UJo2BT5rCv5j9Sn0pjkUmAQaIiOQgyp7m0
         3WgzI7kugtY4520pMmx4Ca2Rje7uxybN8Pc7t5MeeBx+D2D1gHhx4irHd3ZMhmu3FOvc
         9VNK2CfgYUjwK1Dry1fLgDuCq66XQDSs12+Ggbv6mAR9zkg1fpRzVvwHQr/8XfIBjh/A
         /AAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvL9nYC0E1kPOk+UJyu8lbvxoa/+875yGMRO/SkBXgZyCD/oNv71Ep2nE/7vSRRT1sMU9E/YryAzfHs9dVM+MY3w==@lists.openembedded.org
X-Gm-Message-State: AFuF++nE6zUaKU1rDsWeB6BfVxsRbwxZ++FEvC/E300iCOeYRctUyEeg
	b94kiSSsXzd10c+cHcdCPwwncX5mWPuiacYUYhR0qi96kx0udBFp2dPmPdS6OBgcYZw=
X-Gm-Gg: AR+sD11EWvcuofQIIrZPMSYnNknh4X3FDSOg5CjmsxJPmsaayv/PYiGlNcPX6OXo/5g
	QophD+sXMsgLoBJp8hPx0LAj1vIkMPElc/GC9chjbQEEFsce3u68zj29JvtT4H4VJCp83rSb0ns
	N7dMZalczUt7D7Q96dNH4Ob5BQs5rpaTr3lC7EBDVr6GjN0yL9ActN9XGlqDdC3IlImcTGjG1fd
	RcUlmDIm8OgKxFXDHp/8pVOTJeUtOC30DRajcj5T+ybfQHpdEnKanPKOuMGs1Kw4bucL9wX8EYE
	M06Ca9cVW/GSuoaWJrloaay4Smghxiiy+Tnr6cIEPXQAHYjFUQpED9QcANRvpzn1sFsihszX7SR
	mQzmmMgmmoi4JKj65lbBV6fox1xMJYXEmleXqWbjsV190MG6JXpib/cUTp83EQqKFpAM5zqtthg
	asV2IpsSSRswcx5S2N2r4gqP4nRrLw/awBeaX1QU6zOVBC3hW15tzAbXkaYVYcmbwRoVCNRhmnR
	XxeumDRVNMVbvSTEAAEZCZixO7JVx0cwLi47V6CBQSjMx7bSv5U
X-Received: by 2002:a05:600c:4712:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-499dc7260e5mr78331835e9.12.1787763657681;
        Wed, 26 Aug 2026 10:00:57 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc96bf59sm32314425e9.4.2026.08.26.10.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:00:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 19:00:56 +0200
Message-Id: <DKZ1BPWA5ST8.LMT8MR4UIHP8@smile.fr>
To: "Vijay Anusuri" <vanusuri@mvista.com>,
 <openembedded-core@lists.openembedded.org>, "Fabien Thomas"
 <fabien.thomas@smile.fr>
Subject: Re: [OE-core][wrynose][patch 10/10] vim: Fix CVE-2026-59858
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260722123336.587556-1-vanusuri@mvista.com>
 <20260722123336.587556-10-vanusuri@mvista.com>
 <CANQUz188VHSccnka7WW3zvA7e7kCu4ZPF+Jeutis3mk94Hfrzw@mail.gmail.com>
In-Reply-To: <CANQUz188VHSccnka7WW3zvA7e7kCu4ZPF+Jeutis3mk94Hfrzw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 17:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244409

On Wed Aug 26, 2026 at 4:55 PM CEST, Vijay Anusuri wrote:
> Hi Team,
>
> Any update on this?

I've answered here: https://lore.kernel.org/all/DK8UE7TFOQNN.2W9IFP8L1S2MF@=
smile.fr/ :
> This patch also has indentation changes between upstream patch and this
> patch.
>=20
> I'll hold the whole series and let you check and correct the patches.
>=20
> Please send a v2 of the whole series.

Please note that in the meantime I've added another vim series to my
-nut branch (not reviewed yet)

Regards,

>
> Thanks & Regards,
> Vijay
>
> On Wed, Jul 22, 2026 at 6:04=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.co=
m> wrote:
>
>> Pick patch per [1].
>>
>> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-59858
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-59858
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../vim/files/CVE-2026-59858.patch            | 134 ++++++++++++++++++
>>  meta/recipes-support/vim/vim.inc              |   1 +
>>  2 files changed, 135 insertions(+)
>>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch
[...]

--=20
Yoann Congal
Smile ECS


