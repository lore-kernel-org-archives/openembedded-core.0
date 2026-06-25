Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDE1CDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 12:52:04 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10581.1782391920134937768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 05:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qa2+mR6I;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1488126f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782391918; x=1782996718; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsnsIVeFudFL5LVIhFKBpu9yZcWF/4t2jhJGEZxpQL0=;
        b=qa2+mR6IWJHvfv2aPqcXflHAcD7wKsBtGCg6SWtCpWP+EDFKT5bqT0Odv7xx5ir5T6
         8vd9w+AidRszg63kMYM0b41B5A5nPdFa1II7OsjroecrHmJWnt9rJSxQnc6HcdxdHRNs
         GSCzZB+Ttc7o6mgRc4q8cnNbO7PHNqZgMlHPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782391918; x=1782996718;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CsnsIVeFudFL5LVIhFKBpu9yZcWF/4t2jhJGEZxpQL0=;
        b=bCVO429tHQeowpWArCiGHOHnWF3wwRfG3K5jALcPCOF29Zonuoj/cEiHpms8MOIISE
         /TdXPuI69lKrzYJZaxOAj3jTKWFLEhvlDCZpcwI4SFzPTt+JiU6qBkapvLdpsEF5JSXD
         uutWRCCfbWqvG6aPCGi+dO+tKyQJtlEBOzzqc+ZIZ6lQfMm96sgu5Qp7lKbOQnvq+b7I
         sjRpn1fyZFkQ+ethKHszHiM3Ud0xYvyJCOWLzckPG6D6KYV7cELJEjaDtdb24bSxTGdM
         eckrgvHCHUPgJwYnSS+N70IIAmXNiRibv/Dyfcj2Oy9WMxSa8YRxxJ2JVRGEvtVBsimZ
         7JVA==
X-Gm-Message-State: AOJu0YyUSYUG2LuZ8viVFaEzDj1sKhLfFm63bRity8g24u6aW08v6Tbb
	aVsYJI39pOiSZS+KNdwn0oVaRglqEJNJ4spKXCO2J2oNV9GH9SqUAbN1ZuwZqttNuAg=
X-Gm-Gg: AfdE7cn52tV25+4uKhr0RVOD69odnHu/Xp5UJ9dVVa2BqSrJmGQGJYao4C8VkAWUkud
	0RfSAIh2j5OhTX7hnw7qMnMoGjyZJMnwD8d0fubUrgQSC+CnKjn2SObev4tzIUHxANTdhBdKrR5
	O/Kk2ZJR3c5SuMY4dvk9ij+uqYcxNQgTjby5+qrT/nwV6z4PHoS05jGc5Pe3Utx7IKiEZYcE5wl
	eM7CVOIeESfZ0d9G7H1gBOSc4IXR1RsmhGl9hVo6vZjIMPsjNJ1Z1Cd9jWGvJOI3/5u9XQzqvUz
	fuZYtFlHHuskmFN+gvjaqUiOyZScTGwZWYw/mKi/MMtjQMd40hfW0/2aQYP9BaHH74b3lMBjeOS
	EApf7qoDI0LwDZv61TOExJrOpYe62i+zaqbB8FYs56wUOoSOsjFc8IdFy7XXYkHiRbqiGy8BaNf
	LW/Q4fSLIdAH8jqEOQYH1W8ypcftgZLWcrlc/Oa/Vt1Tr4BhwZsLBGbD5ar5DyK6047LGZvJfQj
	UalXg==
X-Received: by 2002:a05:6000:460f:b0:45e:eaed:afd2 with SMTP id ffacd0b85a97d-46dbc1bc950mr3822907f8f.0.1782391918031;
        Thu, 25 Jun 2026 05:51:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa009da164524c038470.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9da1:6452:4c03:8470])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c2279b7d7sm14936238f8f.31.2026.06.25.05.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:51:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 14:51:57 +0200
Message-Id: <DJI57AX8H6WR.3T0T8K3Q6VH89@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, "Awais B"
 <awais.b@rufilla.com>
To: "Awais Belal" <awais.belal@gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] cve-update-nvd2-native: allow
 setting resultsPerPage
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260625111524.3796292-1-awais.belal@gmail.com>
 <DJI3QIVVIZ9I.3K82US4CW443J@smile.fr>
 <CAM=5AmYZ==fYHq2B9-hNOssywegYhDQ5tr6qmoukAq2ZFmER8g@mail.gmail.com>
 <DJI4KDD3OCFO.1SC80PSP0KVPI@smile.fr>
 <CAM=5Amb7kc=q5s=x-0G8REWEVsTzWvhEP8h_=J6eLdskcK-5pA@mail.gmail.com>
In-Reply-To: <CAM=5Amb7kc=q5s=x-0G8REWEVsTzWvhEP8h_=J6eLdskcK-5pA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 12:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239559

On Thu Jun 25, 2026 at 2:29 PM CEST, Awais Belal wrote:
>> I was questionning why CVE_DB_RESULTS_PER_PAGE*_MAX* (notice the _MAX)
>> should be. Seems to me that this is a limit imposed by NVD itself and I
>> don't see a reason to set it to a different value than 2000 (as given by
>> NVD).
>
> Ah, sorry for misreading your comment earlier. I went with a configurable
> max for flexibility purposes as well. Consider a scenario where someone
> would want to limit the max as well for whatever reason. Even in this
> scenario if the NVD limits change all we'd need to do is update a single
> variable rather than having to change multiple locations, we could also u=
se
> a local var for that but then it won't cover point 1. Still if you think
> this is over engineered please let me know.

I still think this is over engineered. I can't imagine a reason in
"whatever reason".=20

To be clear, what I suggest is:
  RESULTS_PER_PAGE_MAX =3D 2000 # imposed by NVD
  if results_per_page > RESULTS_PER_PAGE_MAX:
      ...
(2000 only writen once, no "multiple locations" to update)



>
> On Thu, Jun 25, 2026 at 5:22=E2=80=AFPM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>
>> On Thu Jun 25, 2026 at 1:54 PM CEST, Awais Belal wrote:
>> > Hi Yoann,
>> >
>> > Thanks for picking this up
>> >
>> >> What value are you using? Especially in the last few days...
>> >
>> > I've seen much better results with a cap of 500/1000 than the default =
of
>> > 2000.
>> >
>> >> I'm not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake variable=
 (I
>> >> don't see a reason for it to be configurable). Can you simplify the c=
ode
>> >> a little by making it a constant in the code instead? We already have=
 a
>> >> handfull of hardcoded limits from NVD.
>> >
>> > Well it is a valid request parameter for starters. This allows the use=
rs
>> to
>> > control it from the configurations rather than hard coding to any limi=
ts
>> > someone sees fitting for their environment so more flexibility. Not
>> setting
>> > the variable defaults to the limits recommended by NVD however my
>> analysis
>> > shows that these days due to bulk updates on the NVD side the fetch ha=
s
>> > failed most of the time due to an "incomplete read" error.
>>
>> I agree that a configurable CVE_DB_RESULTS_PER_PAGE looks like a good id=
ea.
>>
>> I was questionning why CVE_DB_RESULTS_PER_PAGE*_MAX* (notice the _MAX)
>> should be. Seems to me that this is a limit imposed by NVD itself and I
>> don't see a reason to set it to a different value than 2000 (as given by
>> NVD).
>>
>> >
>> > On Thu, Jun 25, 2026 at 4:43=E2=80=AFPM Yoann Congal <yoann.congal@smi=
le.fr>
>> wrote:
>> >
>> >> Hello,
>> >>
>> >> Thanks for looking at this!
>> >>
>> >> On Thu Jun 25, 2026 at 1:15 PM CEST, Awais Belal via
>> >> lists.openembedded.org wrote:
>> >> > From: Awais B <awais.b@rufilla.com>
>> >> >
>> >> > It is seen that during bulk updates on the NVD side the server
>> >> > struggles to keep up with the default/max of 2000 entries per
>> >> > page and we see a lot of incomplete read errors resulting in
>> >> > proper db sync failures most of the times. Lowering the per
>> >> > page value noticably increases the reliability of the process
>> >> > and hence should ideally be configurable.
>> >>
>> >> What value are you using? Especially in the last few days...
>> >>
>> >> >
>> >> > Signed-off-by: Awais B <awais.b@rufilla.com>
>> >> > ---
>> >> >  meta/recipes-core/meta/cve-update-nvd2-native.bb | 14 ++++++++++++=
++
>> >> >  1 file changed, 14 insertions(+)
>> >> >
>> >> > diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> >> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> >> > index 945bd1d927..5d8b76e62c 100644
>> >> > --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> >> > +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> >> > @@ -34,6 +34,11 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
>> >> >  # Number of attempts for each http query to nvd server before givi=
ng
>> up
>> >> >  CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
>> >> >
>> >> > +# Maximum number of CVE records per API response. Default/max is
>> 2000.
>> >> > +# Lowering this value can help avoid incomplete read errors during
>> bulk
>> >> NVD updates.
>> >> > +CVE_DB_RESULTS_PER_PAGE ?=3D ""
>> >> > +CVE_DB_RESULTS_PER_PAGE_MAX ?=3D "2000"
>> >> > +
>> >> >  CVE_CHECK_DB_DLDIR_FILE ?=3D
>> >> "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}"
>> >> >  CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
>> >> >  CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
>> >> > @@ -217,6 +222,15 @@ def update_db_file(db_tmp_file, d,
>> database_time):
>> >> >          api_key =3D d.getVar("NVDCVE_API_KEY") or None
>> >> >          attempts =3D int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
>> >> >
>> >> > +        results_per_page =3D d.getVar("CVE_DB_RESULTS_PER_PAGE")
>> >> > +        results_per_page_max =3D
>> >> int(d.getVar("CVE_DB_RESULTS_PER_PAGE_MAX"))
>> >>
>> >> I'm not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake variable=
 (I
>> >> don't see a reason for it to be configurable). Can you simplify the c=
ode
>> >> a little by making it a constant in the code instead? We already have=
 a
>> >> handfull of hardcoded limits from NVD.
>> >>
>> >> > +        if results_per_page:
>> >> > +            results_per_page =3D int(results_per_page)
>> >> > +            if results_per_page > results_per_page_max:
>> >> > +                bb.warn("CVE_DB_RESULTS_PER_PAGE exceeds maximum o=
f
>> %d,
>> >> capping" % results_per_page_max)
>> >> > +                results_per_page =3D results_per_page_max
>> >> > +            req_args['resultsPerPage'] =3D results_per_page
>> >> > +
>> >> >          # Recommended by NVD
>> >> >          wait_time =3D 6
>> >> >          if api_key:
>> >>
>> >>
>> >> --
>> >> Yoann Congal
>> >> Smile ECS
>> >>
>> >>
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


