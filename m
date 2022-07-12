Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549ADC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 22:37:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.15606.1657665434825816732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 15:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gLsqo8mq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id a5so13084096wrx.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=p56aenaHVa2LJlRAZ8g0bgWbFRaX8QQqqGGDDu4DpME=;
        b=gLsqo8mqNs8YFF3rZHsRS5pUrJSMnRKCOP9tjNmkdzPhsHYeuczFrsGGfKNFzOPzOS
         Kt/5n1cEvTXzFUqlywrL7tBG7Zlt3i9ynGKynqtYPIc/FsmyZzibhcxJUeenbO9RlbyO
         yiybHuKUQ6p74n8pApURZT+B1gHMYbPLr6ZQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=p56aenaHVa2LJlRAZ8g0bgWbFRaX8QQqqGGDDu4DpME=;
        b=p3XQ0u6tlvsqyYrjIwTER3hMhknRorWqZhw97rby0g/5kl5wg5IOwJnShqubBLcBNy
         ZXoyqhvKPHt1zbzayzIeZjOeIHjtkMy4jMitB0X8zgUCkPEZ9xgVhFatBR6STYzu6WBJ
         A30V5Etm3E9Rx4MOfOlNQMLIUmbJTmXKG6wg89j/TsDKsY+Aqoafae02SFZvRksYvNMe
         P2DVmShcgz/cVC87u0IiOJiWfza38SHCYiHVhGVspF+jYAFMyEqHRnDOTDYf0HsTvIU8
         o4E044NKxsfRO3s57cdIRu/W7vqFtW05zq0mihcQKIaIp5DN1oWsNiT7dMttdvdV5Cy9
         v9Ag==
X-Gm-Message-State: AJIora9FFsNquZo7uQIhfeCjZDDUnzRCzFY8e9eMo5z4wZ7Tx6MS8Z04
	Rbs1Uj6ZHAG2eth4OJzTx4ePdg==
X-Google-Smtp-Source: 
 AGRyM1tl/JxjsS6lPmn9F4EK6iQwtdWttVb6iXiwOp19OtrlWokEmJ66iWkjrDy7bjBLNnaIRrwa+g==
X-Received: by 2002:a05:6000:1789:b0:21d:7279:f455 with SMTP id
 e9-20020a056000178900b0021d7279f455mr214301wrg.542.1657665433239;
        Tue, 12 Jul 2022 15:37:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d1c:2bb3:e975:b527?
 ([2001:8b0:aba:5f3c:5d1c:2bb3:e975:b527])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b0039c747a1e8fsm294532wms.7.2022.07.12.15.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 15:37:12 -0700 (PDT)
Message-ID: 
 <e29b5fb39a9901db4176b4055ae82530a523d5a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] package.bbclass: Avoid stripping signed
 kernel modules in splitdebuginfo
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christoph Lauer <christoph.lauer@email.de>,
	openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Date: Tue, 12 Jul 2022 23:37:11 +0100
In-Reply-To: <20220712222937.62542-1-christoph.lauer@email.de>
References: <20220712222937.62542-1-christoph.lauer@email.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 22:37:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167946

On Wed, 2022-07-13 at 00:29 +0200, Christoph Lauer wrote:
> From: Christoph Lauer <christoph.lauer@xtronic.de>
>=20
> Since commit d756b346f248df47b0540644adb1d0f17bcc4b6e kernel modules are =
stripped by the functions 'runstrip' and 'splitdebuginfo'. Signed modules m=
ust not be stripped. Function 'runstrip' avoids this by running is_kernel_m=
odule_signed. Apply the same check to splitdebuginfo.
>=20
> Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> ---
>  meta/classes/package.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 4850134022..78ec96df85 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -382,6 +382,11 @@ def splitdebuginfo(file, dvar, dv, d):
>      debugfile =3D dvar + dest
>      sources =3D []
>=20
> +    if oe.package.is_elf(file)[1] & 16:
> +        if oe.package.is_kernel_module_signed(file):
> +            bb.debug(1, "Skip strip on signed module %s" % file)
> +            return (file, sources)
> +
>      # Split the file...
>      bb.utils.mkdirhier(os.path.dirname(debugfile))
>      #bb.note("Split %s -> %s" % (file, debugfile))

That is better but I think we can do better still. splitdebuginfo is
called as:

results =3D oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d,=
 extraargs=3D(dvar, dv, d))

and earlier in the function there is also:

results =3D oe.utils.multiprocess_launch(oe.package.is_elf, checkelf.keys()=
, d)

i.e. we already probably called is_elf() which isn't a cheap operation eith=
er.

I think we can tweak things so we reuse that data?

Cheers,

Richard




