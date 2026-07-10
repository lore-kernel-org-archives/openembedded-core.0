Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2CEC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 09:18:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8916.1783675126089267756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 02:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ckHJCZF5;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-475417f010dso335655f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 02:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783675124; x=1784279924; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HEeXrlt9PqFpV25hlXldsiP1i/ieK5xHUl6ijsnLnDc=;
        b=ckHJCZF5S57P536YOemcTOuC770TgZqMsTsrdt7Ml3eliSy43uVasIEMQB3dM+FERC
         xMMGhFAB+/mmQrHZm/erqPhEQrQfTI32pwjbscMmwxcCtRz8TGcMPd5ziRrR6Nt8Vqhm
         mLyn9PqsLfqM9pwUMdcmzLrD/phhLFaHXoZEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675124; x=1784279924;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEeXrlt9PqFpV25hlXldsiP1i/ieK5xHUl6ijsnLnDc=;
        b=bVYHHq1JIV83nBnEdmpc+KJR5M5FCrMFmMOOcNgEE0C5p0XVA9muto55+RFs7k9qtP
         +AVmcSkFM/XyIxk40M1Kkobo3uLdcjFg2qhluButWyY/1oaCBo4/fuprvLbLQh/CCWeT
         k3O+Vmw9H/rH5lY2ch3+bZEZ3jvaea77LpDD3vKE0inZM+LT5c9J1s/MDsesiJ3h0qV8
         DBOk+VOoCm047LFJrrW/PpYMp5076vRoLjhTVSi/hd6nTstN2l6wLubHa64358U7cbF0
         cEmiNP/w67ISff5VMJR4ovyIuHV3m86r56fYyV8/r3CDkZALEdFR0SJ/EqgVxWX9n7/b
         YP7Q==
X-Gm-Message-State: AOJu0YwUaGkLFMrZzj7KrznFWBNw8Lx4rsMN3PcQhxxc9Dxr9nXviN+d
	lVj2z/MyngEPMy76ld9JNwdou4f+B+3wgqEagHnr6i3gk9W0za1xzP90oYQ8VgNkrnY=
X-Gm-Gg: AfdE7clzAVjwmAKU595l7L/ffayDEQr6kfe4Ek7fVVgUrOIPRZtTJV+zaRC9VtYbvOQ
	4ji9MU2IrMRpJCxDIaJXM+1uRDEyrtZCJBXDMvdh+aLnlzRz6sOXRgOOfBtWeR4Q0t8mmRtHJKg
	R7OCVQ6zrqTXreSWFGt44Ofw/1I9vg6lTJ7qG50fLLQl0yJQSbSXZJ6mQG2VOFKHYk4Ykiq9V21
	YWqwqluWDMlgc8VF27CcjzSD0xXSDmeiz4IJJc+/PRr8l9bk+Gltkj4l/fKVq2jk4h9hq3plyJ+
	CoDVjuwXoIiMTgvHFZQ0Z5rwAPwnEEy1sJf9od/PRXdFymILb+ekz5xBYEF0KBG8M8bMvDabLFB
	g/YkIaTyjZsD12AWNXpO60QJfg+9XTmGmN8OX/u1mzCOgajJAmvs1NbxnEFkR+wXdYfDmdKNlOb
	HGm1wv8iVS6emtlPWbqRQbf2TXN4cPBlVTv/CUcwu7NXPisA4TXKCLuS3O8DK/wcbjEf2sERR62
	GieLg==
X-Received: by 2002:a05:600c:4594:b0:493:bc4a:d5f5 with SMTP id 5b1f17b1804b1-493e68809aamr101929985e9.39.1783675124098;
        Fri, 10 Jul 2026 02:18:44 -0700 (PDT)
Received: from localhost (2a01cb001331aa005f82d0ccbe50ecf8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:5f82:d0cc:be50:ecf8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2e0f165sm33214445e9.0.2026.07.10.02.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:18:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 11:18:43 +0200
Message-Id: <DJUS27MD8A2B.2AAYOAN4O4ELF@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Mike Crowe" <mac@mcrowe.com>, "Alex Kiernan" <alex.kiernan@gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] dropbear: Disable DSS correctly
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260629165056.2489582-1-mac@mcrowe.com>
 <DJS7O5671XMZ.OZRLCFBNZFYP@smile.fr> <ak_xh2CM7n4X8_c_@mcrowe.com>
 <CAO5Uq5Sh7MuFmb=xhQ=kaeyZcBaCDgjfTZ-Uwa25+swo66e3TA@mail.gmail.com>
 <DJUPP65UURBF.TY8K27J2AQTP@smile.fr> <alC2XjkPiCD1RpJV@mcrowe.com>
In-Reply-To: <alC2XjkPiCD1RpJV@mcrowe.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240623

On Fri Jul 10, 2026 at 11:07 AM CEST, Mike Crowe wrote:
> On Friday 10 July 2026 at 09:27:39 +0200, Yoann Congal wrote:
>> On Thu Jul 9, 2026 at 9:33 PM CEST, Alex Kiernan wrote:
>> > On Thu, Jul 9, 2026 at 8:07=E2=80=AFPM Mike Crowe via lists.openembedd=
ed.org
>> > <mac=3Dmcrowe.com@lists.openembedded.org> wrote:
>> >> I wasn't aware that I was expected to add one to the patch itself for=
 a
>> >> backport.
>> >>
>> >> https://docs.yoctoproject.org/scarthgap/contributor-guide/recipe-styl=
e-guide.html
>> >> doesn't seem to say that a SoB should be added to the patch. It does =
say:
>> >>
>> >> | Of course, if another person later takes care of submitting this pa=
tch
>> >> | upstream, the status should be changed to Submitted [where], and an
>> >> | additional Signed-off-by: line should be added to the patch by the =
person
>> >> | claiming responsibility for upstreaming.
>> >>
>> >> which sort of implies that a SoB should be added for original patches=
 that
>> >> are suitable for upstreaming but this patch is a backport which origi=
nated
>> >> upstream (without a SoB) which isn't the same thing.
>> >>
>> >> Adding a SoB to an unmodified upstream backport patch feels like
>> >> appropriation on my part, but I can do so if that's the policy.
>
>> > You're certifying that the patch you're submitting is appropriately
>> > licensed; it says nothing about who authored it.
>
>> I agree with Alex: As the one requesting the backport, you are the one
>> signing-off on this particular operation. The original author had
>> nothing to do with that.
>
> I thought that I did that with the signed-off-by in the openembedded-core
> commit message.
>
>> I created a bug to request clarification in the doc on this point:
>> 16356 =E2=80=93 Clarify trailers usage (Signed-off-by, ...) in imported =
patches
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16356
>
> Thanks. It feels like this needs an equivalent of
> oe.qa.check_upstream_status(). Such a check would currently fail since
> there are lots of existing patches that lack signed-off-bys and adding th=
em
> would be significant work because each one would need to be manually
> checked. :( I suppose the check could also allow "Not-signed-off-by:
> <openembedded-core@lists.openembedded.org>" or similar as a workaround fo=
r
> existing patches with a plan to eventually remove it as the patches are
> updated.

We do have some kind of test in place, in patchtest:
https://git.openembedded.org/openembedded-core/tree/meta/lib/patchtest/test=
s/test_patch.py#n142
A proper check would be really hard to do without false-positive.

>
> v2 sent with signed-off-by in the patch.

Thanks! That's appreciated :)

>
> Thanks.
>
> Mike.
--=20
Yoann Congal
Smile ECS


