Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A60ACDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 12:22:04 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10024.1782390122872762800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 05:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FvLAdxi4;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso12033035e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782390121; x=1782994921; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weizIhjPz/LUpGDXnac7qYgz8elpwu5T6R/3lI8rrDs=;
        b=FvLAdxi4jvwLWsXcmRBf2UA/mikC/5rayIAxES9tILez/Ft0RNDG6iiz3u2fMSQv6N
         uu7M1StniNa/+gtxfuUXorkpRSRabqEOO/c3WItIcoJ3iRy5kp8PgLVxAcIxsFVHbu3z
         95rgNo3ES6pcvrvHMn4PIypHq07OUbOuDoKqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782390121; x=1782994921;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weizIhjPz/LUpGDXnac7qYgz8elpwu5T6R/3lI8rrDs=;
        b=akb9aARYMR1fgRzWIaqs58b4uUrFfhmYIvlpYiWc/MWbiz3EPmBkz+NHZbug9MdKfY
         1vFn1IKtG7LSZ7SbghtuYs4Jk1LXNoYNYEQXM6/hZEZ/+AXP8WyZBbpxEfWfOpRSAg0b
         hTOkLHFNBmqzeNGP/MF+xlkFFDMMqlaeXCLe71808wzAbzap5cxL3pLwcBpj6KgqMqd8
         Hi8nw7qtISJMswmRI8niGdo3zHBW6S4JZDaJ1VE/L3O1HQ9kNv3YRVP842JVnifKaQUZ
         hQqGR7SiMcAgqoxyoK4G8OTNwYylnv80eECcOPYOKUME5/RwT2J/wINDfyqoC/ljgW1y
         Ih8A==
X-Gm-Message-State: AOJu0Yw9drXgwekK6Y3Mb2rIsqqxM9di2TvRmJlkoQ4Iy2blcAgxX6eI
	aQFIi9mxqUycQI4KfDLsdqzizsHUJm/LADGgmoVL2zL+bV/YshUaZbb+aVY8deivEPI=
X-Gm-Gg: AfdE7cmrCYFtsauRA4hcuj2bAzbvMei0od6XHWgZWDNDDj2FoGHlwZDK2SPHuUcHfmW
	0Ojtm5rOAOCZavJUETQ9ogUYOZYg6l7HtD4UmQDWnD2eEb5KsMs1xqmqFGup7w7vicGWzcEZ1Wr
	AXv+YmjIl0EaXPG1xlhuAbOKNQh/fFMEgn9RDuL0Iyt79d6KLX82Y8BPGG/dP5JdPH4sdRWYxDK
	haCb+fGy0la4FHfRU7JZMAgyHO83duaDpUAIOOfEe8X7CQK5E4BpT2Utj1eFiF56WeWgn1QXQML
	+iGvC3zzbJag9DwZfq6WjxUI6xT0dVI3WCOyWOIQTj+vmNRS0525+JaZ8g2SSAR3d5dxMJ5tLWG
	fwh65DD4orgocISeoTw4lgsnPqZVNeaPklbO6bVSCiTwXpE4bNiDeYCtIywEkGpyoDoGs/2QHO0
	2lsQC+/j4BDaAQOrc4bhhEKkb+5UO7wGNk2cFpIQAQaBTU6o6+cZIYsCPo7n4aSwn7+YwoqO53R
	FwgziTTYoU/iuC4
X-Received: by 2002:a05:600c:45d5:b0:492:34f5:94cb with SMTP id 5b1f17b1804b1-4926689bfb0mr28588475e9.26.1782390120982;
        Thu, 25 Jun 2026 05:22:00 -0700 (PDT)
Received: from localhost (2a01cb001331aa009da164524c038470.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9da1:6452:4c03:8470])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c3bsm16566812f8f.10.2026.06.25.05.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:22:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 14:22:00 +0200
Message-Id: <DJI4KDD3OCFO.1SC80PSP0KVPI@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] cve-update-nvd2-native: allow
 setting resultsPerPage
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, "Awais B"
 <awais.b@rufilla.com>
To: "Awais Belal" <awais.belal@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260625111524.3796292-1-awais.belal@gmail.com>
 <DJI3QIVVIZ9I.3K82US4CW443J@smile.fr>
 <CAM=5AmYZ==fYHq2B9-hNOssywegYhDQ5tr6qmoukAq2ZFmER8g@mail.gmail.com>
In-Reply-To: <CAM=5AmYZ==fYHq2B9-hNOssywegYhDQ5tr6qmoukAq2ZFmER8g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 12:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239557

On Thu Jun 25, 2026 at 1:54 PM CEST, Awais Belal wrote:
> Hi Yoann,
>
> Thanks for picking this up
>
>> What value are you using? Especially in the last few days...
>
> I've seen much better results with a cap of 500/1000 than the default of
> 2000.
>
>> I'm not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake variable (I
>> don't see a reason for it to be configurable). Can you simplify the code
>> a little by making it a constant in the code instead? We already have a
>> handfull of hardcoded limits from NVD.
>
> Well it is a valid request parameter for starters. This allows the users =
to
> control it from the configurations rather than hard coding to any limits
> someone sees fitting for their environment so more flexibility. Not setti=
ng
> the variable defaults to the limits recommended by NVD however my analysi=
s
> shows that these days due to bulk updates on the NVD side the fetch has
> failed most of the time due to an "incomplete read" error.

I agree that a configurable CVE_DB_RESULTS_PER_PAGE looks like a good idea.

I was questionning why CVE_DB_RESULTS_PER_PAGE*_MAX* (notice the _MAX)
should be. Seems to me that this is a limit imposed by NVD itself and I
don't see a reason to set it to a different value than 2000 (as given by
NVD).

>
> On Thu, Jun 25, 2026 at 4:43=E2=80=AFPM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>
>> Hello,
>>
>> Thanks for looking at this!
>>
>> On Thu Jun 25, 2026 at 1:15 PM CEST, Awais Belal via
>> lists.openembedded.org wrote:
>> > From: Awais B <awais.b@rufilla.com>
>> >
>> > It is seen that during bulk updates on the NVD side the server
>> > struggles to keep up with the default/max of 2000 entries per
>> > page and we see a lot of incomplete read errors resulting in
>> > proper db sync failures most of the times. Lowering the per
>> > page value noticably increases the reliability of the process
>> > and hence should ideally be configurable.
>>
>> What value are you using? Especially in the last few days...
>>
>> >
>> > Signed-off-by: Awais B <awais.b@rufilla.com>
>> > ---
>> >  meta/recipes-core/meta/cve-update-nvd2-native.bb | 14 ++++++++++++++
>> >  1 file changed, 14 insertions(+)
>> >
>> > diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> > index 945bd1d927..5d8b76e62c 100644
>> > --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> > +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> > @@ -34,6 +34,11 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
>> >  # Number of attempts for each http query to nvd server before giving =
up
>> >  CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
>> >
>> > +# Maximum number of CVE records per API response. Default/max is 2000=
.
>> > +# Lowering this value can help avoid incomplete read errors during bu=
lk
>> NVD updates.
>> > +CVE_DB_RESULTS_PER_PAGE ?=3D ""
>> > +CVE_DB_RESULTS_PER_PAGE_MAX ?=3D "2000"
>> > +
>> >  CVE_CHECK_DB_DLDIR_FILE ?=3D
>> "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}"
>> >  CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
>> >  CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
>> > @@ -217,6 +222,15 @@ def update_db_file(db_tmp_file, d, database_time)=
:
>> >          api_key =3D d.getVar("NVDCVE_API_KEY") or None
>> >          attempts =3D int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
>> >
>> > +        results_per_page =3D d.getVar("CVE_DB_RESULTS_PER_PAGE")
>> > +        results_per_page_max =3D
>> int(d.getVar("CVE_DB_RESULTS_PER_PAGE_MAX"))
>>
>> I'm not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake variable (I
>> don't see a reason for it to be configurable). Can you simplify the code
>> a little by making it a constant in the code instead? We already have a
>> handfull of hardcoded limits from NVD.
>>
>> > +        if results_per_page:
>> > +            results_per_page =3D int(results_per_page)
>> > +            if results_per_page > results_per_page_max:
>> > +                bb.warn("CVE_DB_RESULTS_PER_PAGE exceeds maximum of %=
d,
>> capping" % results_per_page_max)
>> > +                results_per_page =3D results_per_page_max
>> > +            req_args['resultsPerPage'] =3D results_per_page
>> > +
>> >          # Recommended by NVD
>> >          wait_time =3D 6
>> >          if api_key:
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>


--=20
Yoann Congal
Smile ECS


