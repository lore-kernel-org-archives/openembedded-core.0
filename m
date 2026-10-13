Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD9ACC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:06:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3624.1791885996132489592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oj1B9b3K;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so18011775e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 03:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791885994; x=1792490794; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYMPomhyt/li0ZGwl9E433cScX2kHNgyWoOGhe/IvOY=;
        b=oj1B9b3KGwAntv6wxncsG6DLoczbCNvrJmsQeSomtPx+3SbWpBOc2cwxuDxjMMgjpK
         NMVeuvty0jbAMnWcAEiYQHsHOZVuOKo6MtScpQ1T8rONprOI4NewVKyJgVb0W46Kp1VV
         HQd0Cu0CV2FdJWreH3IkNZuR9Pp1WbQKqwPog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885994; x=1792490794;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DYMPomhyt/li0ZGwl9E433cScX2kHNgyWoOGhe/IvOY=;
        b=JaBg+QKEIMm786/fHA+kTTHQHBeVNX1+4E7Tgu2Sy9yFLv0tgPrAKYShWNtySuezJV
         WPWlMLIK8VFSc4o7z0vvyDxX1AwmRBpoK/5gX7RpfjxTO4lPS0gWOhD0LR88zi9V7g+6
         Abp5Hvzq8SvPdwqLvBYVLZs5H8MQSGDKtKZ2T2whxHxvDWlqTUda71Mb7ik1qH70Uncx
         mQthxHBJ1TwCxEufv1ozQ6d1qMktXWhelA7kbex28VdDMl0Y5hT78CJ8XXW29s0oJiEY
         tPGr25hSNV24v2pCL9ZyAUL5PrTmem+4bIiktq2gFGH77n+EOetx96GTOU0012OrICsF
         bBvQ==
X-Forwarded-Encrypted: i=1; AKwUvBynI9Awov11Ksn3mvLMLspD96ticaNkBG48Iuq1Muwvx0tDvnX69bhqNlZY/y8KBPC3NnpYS/Ru6oeKCTQfEmk0qA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJ2S5I0imKYEZtFFbHUZkaSeNeT+umP9aofDkykVUvPh1fVNZhm
	THxs7I5f3tUE402W+J8FCGgFqcjDDCtwj3S/VCFBzRdtkYQ5pHtn2qQlkPu2pOYq0u3v0QLopO0
	SyJDmrF4=
X-Gm-Gg: AYBFou3ADNcD8KY7pbBJs2LsIok1zIN1R0NOh2sBv6RCBKpFOxScK2GTwtXhsMXDCjH
	VmoagPtdl276ICXsQ4JOI6LoN7x7eTE6VDzWQIPB59b+wUhaBIAhazZHINR6jyYeUZzNtOEctVo
	s79GxL0kKVMZYmKlhItNHWIwh7LlLNFcCFnUDV9s+DxEWJ5yd8/Pc0A8tABwl9T4h/xeVqAb6oX
	t9mI1s8RlDeZafWKl6vS66XaxoKf7dSRgm4eB/snAy27rAT+T5xNGp83F0jtmgozEnN1aQ0LkuC
	vhjiK5UnxCI9k8ghEKWl3cCnz/ML1kIDqdQKmlHxEc4lyvCqB7n4AK4iGEX/3yD0mdh0McKGQKu
	m6MVLPqr4KgxSofrUylErv/UyOVwUjkWUShvvgAex5enJDu7U8I3qYuGhKLgmjv5uCD0lJ0gPFg
	2ydOo/SHqrjptRv9koez4bOA1gpqA456VcYWw89UsGQloqSoDbAws/kiL7BPKDLn9XWfHcftAto
	QctNYZdhYgEZ5G8DIIOJ11IioQ/imjAJzfKoAlzp34O9p7Ik66BLw7YBnE=
X-Received: by 2002:a05:600c:4fd5:b0:4a0:5b:7bc0 with SMTP id 5b1f17b1804b1-4a18e49a7e3mr242540495e9.21.1791885993484;
        Tue, 13 Oct 2026 03:06:33 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm403122215e9.7.2026.10.13.03.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:06:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 12:06:31 +0200
Message-Id: <DM3MKKCG1719.2JXZ54LAWVEAS@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH v3] u-boot: fix CVE-2026-29009
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Roopa.Kalmath@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261012111417.3043587-1-Roopa.Kalmath@windriver.com>
 <20261013095833.780884-1-Roopa.Kalmath@windriver.com>
In-Reply-To: <20261013095833.780884-1-Roopa.Kalmath@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 10:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247714

On Tue Oct 13, 2026 at 11:58 AM CEST, Roopa via lists.openembedded.org Kalm=
ath wrote:
> Backport commit[1] which fixes this vulnerability as mentioned NVD
> report in [2].
>
> [1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefa=
c6aae974f9cec72fd6e58f1bc
> [2] https://nvd.nist.gov/vuln/detail/cve-2026-29009
>
> Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
> ---
>  .../u-boot/files/CVE-2026-29009.patch         | 38 +++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |  4 +-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
>
> diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch b/meta/re=
cipes-bsp/u-boot/files/CVE-2026-29009.patch
> new file mode 100644
> index 0000000000..afdbc80519
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
> @@ -0,0 +1,38 @@
> +From 2b88f08722584cf235f7dacaa190af3d24deb40f Mon Sep 17 00:00:00 2001
> +From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
         ^ (again) please keep the original author

> +Date: Fri, 9 Oct 2026 08:38:23 +0000
> +Subject: net: nfs: fix buffer overflow in nfs_readlink_reply()
> +

(again) please keep the original commit message

> +CVE: CVE-2026-29009
> +
> +Upstream-Status: Backport [https://git.u-boot-project.org/u-boot/u-boot/=
-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc]
> +
> +Fixes: cf3a4f1e86 ("net: nfs: Fix CVE-2019-14195")
> +Cc: stable@vger.kernel.org
> +Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
> +Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
> +Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
--=20
Yoann Congal
Smile ECS


