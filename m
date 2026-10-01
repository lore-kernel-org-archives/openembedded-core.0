Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD1FCA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 09:29:29 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7167.1790846966471196167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 02:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bBkeAO2q;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso31968795e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790846964; x=1791451764; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTE4MCC6Tm8crDHJdv1M0MUz0Ef/2XFT1w+hsG1njKw=;
        b=bBkeAO2q5qdULZo4cxt41mpq/4p4g3SkivXjWJbU8KM9f5uJfCTSzm8aIm8zeyV5Jd
         NoieLrlcQqs0ajSxs4l8H2iIdOUetriyPeQ+xisVQvNS11m/kEf4XQ76OmiUJZxED9ye
         3+ruaMcSMshnkqmoOnkMmmMPcdIFWOQAoPDC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846964; x=1791451764;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTE4MCC6Tm8crDHJdv1M0MUz0Ef/2XFT1w+hsG1njKw=;
        b=RYsvbrkHsVPnlrT19eIcADhw4SWkV4pEd9Q2L6zVwqeVE+BvSNoZ4vxVlA/pzYWOnw
         eYMuDE/9EwyyDmsZAFSofLVFnaTZM5v5CW1AVBnzx3vuO5tFmLlBBecemvJqfIVdNovM
         XzZ/taAqjNy+afeO/FaWFjwFFe925+XhkgByNUa3qXRf1erTzfDoBApitNmW6vuTSszy
         p6HKbSbDPg74fOgPz3TJiu03IEeOZ12wfBRqUlfo8N7uyqBZW34vJSfixQ+cvCxt8i4v
         dBAnlLRocnrch5pJ5r+MzrhM0E2cCCmWhuMTJSnV0+IA3LYcjKCpMYo6lxkHwA6w8gIN
         A0CA==
X-Forwarded-Encrypted: i=1; AKwUvBx7gcSvazr0GN1IHJmjF4D+lvuRoK7A9oNY7pW2farc1y2Rpj2yBdss1OHiDPpZ5D4tZu4DP0WsC3hA6zSBRd+3Nw==@lists.openembedded.org
X-Gm-Message-State: AFuF++lW56OFZ+v+h76Kr7eIZBUw3AI2E8myQSZPdZBt79UolmShKVEc
	8zWVE6A/8vvNSEHI2SM48NoCXeipfpAwWX31wW72qutWl61iOzzVbBoAC2KN8aKb4cwtmaHotcf
	uU7FiAMo=
X-Gm-Gg: AYBFou3EYA0WWdqalD5K6wIF4zmQhD5ZekTcpNhJoqejAGB8Rxd6nMhpGtk1Zz0osHv
	ibUeoOgjYk/n1Z1TpG9oEfiO0JDq40Gd2XIxQBaoJ2WS7nr/1ZNCG1gqj/P7R4plHWURDgFBYfY
	2sUOzuqP+CuCg5LInRjXVKMobq18lO4cSwubs8NX69zgzutdTn50dPqkhGi+RUzttgL4UbFlORA
	70EL2BF/1/5Pp6OTfE7icIukqAcRxCON6jsPGIrDmkXarajQPgXeIqmslPhN5rO9+EsHL6UzqmY
	0vou8YrV3/C313U6vhzn540u9JbHYIFlF9CeKtVpYg6i/iku2tmXsXNK5g5EFIOAvm7pZE/MD1E
	nSlDfO+hpLhgVH5wZB8+gdOB/fHz1nHAQCIokxnJ6KZn4JavbFYM28TxChjh21UgjfWsZ7qkP62
	DKCQfT0eiF6euOM+/k3jV8DZMQnLGmbCOj5O6iFulE95PQAvTWnS7WCljxJ7ZOUG9qDgbJdJzJq
	pWBwxXfjtMIVqtVJwz8+OjcxFBL7MTRrc4tNCrQFP59YhGg36kCHq3ddgHbwg==
X-Received: by 2002:a05:600d:6402:10b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a01b14e2a8mr52154235e9.1.1790846964486;
        Thu, 01 Oct 2026 02:29:24 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2d642sm4680226f8f.32.2026.10.01.02.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 02:29:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 11:29:23 +0200
Message-Id: <DLTE9LNQFZ57.3RIK7ZCN2R07Q@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] vim: fix backport format for
 CVE-2026-73076
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260923043000.8731-1-hprajapati@mvista.com>
In-Reply-To: <20260923043000.8731-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 09:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247022

On Wed Sep 23, 2026 at 6:30 AM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> updated Backport format as per CVE guidelines.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  meta/recipes-support/vim/files/CVE-2026-73076.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-73076.patch
> index 92c9e10c4a..9ef6aec99a 100644
> --- a/meta/recipes-support/vim/files/CVE-2026-73076.patch
> +++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
> @@ -15,7 +15,7 @@ https://github.com/vim/vim/security/advisories/GHSA-r22=
p-fhw4-84p2
>  Signed-off-by: Christian Brabandt <cb@256bit.org>
> =20
>  CVE: CVE-2026-73076
> -Upstream-Status: Backport from https://github.com/vim/vim/commit/581a2f3=
ac9c6f96a26324f6b2c8c11415fd0d452
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/581a2f3ac9c=
6f96a26324f6b2c8c11415fd0d452]
>  Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>  ---
>   runtime/autoload/vimball.vim | 58 ++++++++++++++++++++++--------------

Hello,

Please send an updated CVE-2026-73076 patch v2 that include this fix
squashed.

Thanks!
--=20
Yoann Congal
Smile ECS


