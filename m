Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAABCDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 11:43:10 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9285.1782387783977819147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 04:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FNCjrXq2;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-46e30429b10so216533f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 04:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782387782; x=1782992582; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVv4K8z8T9JX2eqn73RpKoFjiZsQ+cdBKuOEnqG4bX4=;
        b=FNCjrXq2fKqgRYdlycyF1a+E8etJLkMlO2jwxCho+kyYGiVAbXMM/Quieg0WO1yceU
         wyYO/4Xq2PaVDW4+9DdtcFryny2uC76ljeE+jApEk/DQwm/qgvqjpWmkcziou9/vbmky
         4fdGxPvejIqUj936sB96etlZt+aHUD4DTV3G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387782; x=1782992582;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oVv4K8z8T9JX2eqn73RpKoFjiZsQ+cdBKuOEnqG4bX4=;
        b=AWZewC62IfKqIAQOzgX/ZWux0v2B1b4B+U1xka6MVxf+TR1yJysFmyFhrxsc935aPo
         kpJ5L6VjOfxv0frdz2qNL6/bu6cdP+brZ2UQ0WnD/7zB98WiGuPEsXuiIfaCh5SvPUlq
         NQrYzZTHSwots18bgYGsOQ7CBh68pt3TDuxFK6Q0ZWo5CAW1BaKOoG6zLMF6EfgugmrZ
         ljLOLmmdZQU+sd112F8hjPwhj+Rg5uhHW+v5YGE5LnhTyYY83Uf+HMzfvgw9hSIh8a5F
         4Tm9i5GaStMBLzIdGLEJm8l6hAwdg3JwdMYvT3T2saRQCRI6lhhoNM97Ckb9YDu00xAF
         BfrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIKqB7OrBYiFVn6lizo/jz2/j3joE0+Dh7viKNmTnNLUcTG3ysdS4poPEbFa6YqZ9I759+pwv63a7D1iKXg/Z6sA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyXvuwpstkINldGhHvas1+Rh9v00KXIcIxmcgPlngvrmUJ3iqrH
	PoLDeeeEnxKbMWiC+UshzKI+H0VgDLtVjkMS1xOO3xF/3xipz0NQ/dCRxKnuDJ8EHhk=
X-Gm-Gg: AfdE7cmV5tCgKz+0E+bOh+pYpxKYULGFLpQLgRWuiM15LBJboWWmmgLXBEHI3OE0dna
	1OeZq9+k3OKFT/B5xam5hmMy52/tfjlLKvHpvZ2I98ADfPhGHeOuu+rYr19lBraXHbmZR3UN4X0
	mVccQ0Y1ryujb6HTon6AiFRX50X583a5ry4jQOXI/QXeSENdkeaDA+pm4byuVVHyQof0c3ehhKN
	qN9YJ0JNumcthA3T85/Pv65P55PY1Fm2CilMQrfPSg+gUW44etrUVzIklxcCDXsfYgUeMM3Gdyn
	cuG75qWKjkFI9Zmxc7/mtVMa+EwxHV5SIkJJtp3HOL2+NRBtuMGPrrq2ZTg6ykgWOszDAjzVd9/
	5m62mwrTsPp6nUjOsWzyRQTFdLwx8RSvrcAvmbVX2EY8XZpzjVRLqKbgUT3NOp8D7mpurv97W6C
	7eWBuWWi+mQT+RS02IsxZMdrj9tvWG7vgIBjtMh6BKD95v+RbYd+7vIYkiLyXL7I6YWURaK7u3S
	1bQGA==
X-Received: by 2002:a05:6000:4308:b0:46d:8e68:b757 with SMTP id ffacd0b85a97d-46dc2fe7585mr3070532f8f.39.1782387782105;
        Thu, 25 Jun 2026 04:43:02 -0700 (PDT)
Received: from localhost (2a01cb001331aa009da164524c038470.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9da1:6452:4c03:8470])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46dd5f9da4fsm4700438f8f.23.2026.06.25.04.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:43:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 13:43:01 +0200
Message-Id: <DJI3QIVVIZ9I.3K82US4CW443J@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] cve-update-nvd2-native: allow
 setting resultsPerPage
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Awais B" <awais.b@rufilla.com>
To: <awais.belal@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260625111524.3796292-1-awais.belal@gmail.com>
In-Reply-To: <20260625111524.3796292-1-awais.belal@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 11:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239555

Hello,

Thanks for looking at this!

On Thu Jun 25, 2026 at 1:15 PM CEST, Awais Belal via lists.openembedded.org=
 wrote:
> From: Awais B <awais.b@rufilla.com>
>
> It is seen that during bulk updates on the NVD side the server
> struggles to keep up with the default/max of 2000 entries per
> page and we see a lot of incomplete read errors resulting in
> proper db sync failures most of the times. Lowering the per
> page value noticably increases the reliability of the process
> and hence should ideally be configurable.

What value are you using? Especially in the last few days...

>
> Signed-off-by: Awais B <awais.b@rufilla.com>
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-core/meta/cve-update-nvd2-native.bb
> index 945bd1d927..5d8b76e62c 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -34,6 +34,11 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
>  # Number of attempts for each http query to nvd server before giving up
>  CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
> =20
> +# Maximum number of CVE records per API response. Default/max is 2000.
> +# Lowering this value can help avoid incomplete read errors during bulk =
NVD updates.
> +CVE_DB_RESULTS_PER_PAGE ?=3D ""
> +CVE_DB_RESULTS_PER_PAGE_MAX ?=3D "2000"
> +
>  CVE_CHECK_DB_DLDIR_FILE ?=3D "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAM=
E}"
>  CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
>  CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
> @@ -217,6 +222,15 @@ def update_db_file(db_tmp_file, d, database_time):
>          api_key =3D d.getVar("NVDCVE_API_KEY") or None
>          attempts =3D int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
> =20
> +        results_per_page =3D d.getVar("CVE_DB_RESULTS_PER_PAGE")
> +        results_per_page_max =3D int(d.getVar("CVE_DB_RESULTS_PER_PAGE_M=
AX"))

I'm not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake variable (I
don't see a reason for it to be configurable). Can you simplify the code
a little by making it a constant in the code instead? We already have a
handfull of hardcoded limits from NVD.

> +        if results_per_page:
> +            results_per_page =3D int(results_per_page)
> +            if results_per_page > results_per_page_max:
> +                bb.warn("CVE_DB_RESULTS_PER_PAGE exceeds maximum of %d, =
capping" % results_per_page_max)
> +                results_per_page =3D results_per_page_max
> +            req_args['resultsPerPage'] =3D results_per_page
> +
>          # Recommended by NVD
>          wait_time =3D 6
>          if api_key:


--=20
Yoann Congal
Smile ECS


