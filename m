Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57B5C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:26:34 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155558.1783358793155116709
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZaIz2Oc9;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so36468875e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783358791; x=1783963591; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8ZMwjQCXZc0G5cGRu+Pa1CQ45k6IzvdczuLkWrNP4E=;
        b=ZaIz2Oc9kEnQThRRga4qNVneXbU37GUueckuCLCcq/DlPU7/yWs7DnZkDAd0tvS/Jc
         evaHVx9eylbdxBaKLwmv+mLGBDO12LT46Jwv706tOBKaaBfdVbEOBHvjv8I1dfjcW3dQ
         C6REWH5UvYNdM2zFLnWG1CQ8Y+AAn1/6oyzVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358791; x=1783963591;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8ZMwjQCXZc0G5cGRu+Pa1CQ45k6IzvdczuLkWrNP4E=;
        b=IDgdM2DYkxpAsTRQlmM/guaEP5koSgs7H4Ort0vPNciEvzgBMfBlQRohhXn3L3B+wM
         MIvakKiNQ8fUoBbwXKzQdZ+5fmUOfltU5xA0t+1XHB3SjRp0fKWsKSjlvmjP8K33b0ZV
         RavUmqcEUFMMQ9sbpJoR18jBY8M3xkZGh/oxNk+hp8qKoPWrf3Phcs34etJ66gIg/ffe
         nAz8MDGX7ZNIFMaF2HNcjqk9BBr+FIyymgGzqP6pXWyBL6yr7uU0Z82w5FXxpn0v4fk5
         pKcPjFkW22VTqvZm2nYL1qv8zEeLuN+06nR59JxA4lDkaPG8v8NYCJTPmNZdqLKyYnie
         0jRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp641sbI876jUsI6HSzOnL0q5xCYb9t1WnF5g7qoQLjGWNDYlnl6pEro4tuJ2NfP+EvVNpWKc5ApOAMIt7IovMwUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkrUlRQIbHfXC9pXfY2C8Xlc2zhHuOeA3U6NFSKFEhuJF6UUne
	0E9wbASPmyGB8JkrbH1bkSgna/e2NgqZIq/0jtym8sJdjzaVkp82I4g7E4y82DlOiU8=
X-Gm-Gg: AfdE7clwGP24BMLTlqx4SDysMaVS7Vf2K2aEnjuYrNDW+VwV1l0xSC/tyFK7+tNme7H
	eRLtrqkoSQMb6e0nQfhEwgxc9mZJUiZLTFCkhPgdlShwD5MJo62z2M9PspHd+ibZOQ2GQ7mm2Rg
	nJ3qAVOJSYIbKne6lqmjawS1gfD4bOUvAFEvmS/mRhybTytsV6qrSVzMUVXjawcrei/vxiAQ4ay
	6lnldsNpWyI61LE0RiddTyJzqhTy8ok5U6rrqMgzGuqhSR/DqiVtz+oHpPYHzmlRnfm/fDn65Ts
	Oo1Otj0zCYiffzgo2zZM+WjezSUgEImN11wxWdijPln2GjBbkVY2Sf7i2W+qNih6GjVnRPW8yYp
	OcNNB7TVu36kUc6fzLzw1YTT5xSgheTdaePv5bFgivfx9Mou3l2NojXn8Fjcs56erIdC4K8KcVM
	Ifwb9qU9lbfP07KtZjeH3oNw==
X-Received: by 2002:a05:600d:110:b0:493:c337:db18 with SMTP id 5b1f17b1804b1-493df042299mr12379545e9.16.1783358791292;
        Mon, 06 Jul 2026 10:26:31 -0700 (PDT)
Received: from localhost ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493df703cb2sm6414925e9.1.2026.07.06.10.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 10:26:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 19:26:29 +0200
Message-Id: <DJRNXI1MR0G3.NRVNAMF6V3KW@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] gnutls: set status for
 CVE-2026-3832
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <sudumbha@cisco.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260613102520.3703528-1-sudumbha@cisco.com>
 <DJFO0C5H4J4B.2E5D9ZA8FAU4F@smile.fr>
In-Reply-To: <DJFO0C5H4J4B.2E5D9ZA8FAU4F@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240333

On Mon Jun 22, 2026 at 4:58 PM CEST, Yoann Congal wrote:
> On Sat Jun 13, 2026 at 12:25 PM CEST, Sudhir Dumbhare via lists.openembed=
ded.org wrote:
>> From: Sudhir Dumbhare <sudumbha@cisco.com>
>>
>> Analysis:
>>   - CVE-2026-3832 affects GnuTLS OCSP multi-record response handling.
>>   - The vulnerable OCSP response handling code was introduced in GnuTLS =
3.8.8.
>>   - This vulnerable code is not present in the current GnuTLS 3.8.4.
>>   - Hence ignoring the CVE for this version.
>>
>> Reference:
>> https://nvd.nist.gov/vuln/detail/CVE-2026-3832
>> https://security-tracker.debian.org/tracker/CVE-2026-3832
>> https://gitlab.com/gnutls/gnutls/-/issues/1801
>>
>> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> ---
>
> I think the CVE applies to wrynose. Can you send a fix there, and then,
> ping back here?

Hello,

Gentle ping for this series. Do you plan to send the needed wrynose
patches?

Regards,

>
> Thanks!
>
>>  meta/recipes-support/gnutls/gnutls_3.8.4.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.4.bb
>> index ccb6a2b4b2..6d43c58df2 100644
>> --- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
>> +++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
>> @@ -124,3 +124,5 @@ pkg_postinst_ontarget:${PN}-fips () {
>>          ${bindir}/fipshmac ${libdir}/libhogweed.so.6.* > ${libdir}/.lib=
hogweed.so.6.hmac
>>      fi
>>  }
>> +
>> +CVE_STATUS[CVE-2026-3832] =3D "fixed-version: vulnerable multi-record O=
CSP response handling was introduced in 3.8.8 and is not present in 3.8.4"


--=20
Yoann Congal
Smile ECS


