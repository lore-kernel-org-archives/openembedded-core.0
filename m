Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB6AC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 15:41:51 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.1426.1720539702301840475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 08:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=J2V8xgmL;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-650cef35de3so47549057b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 08:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720539701; x=1721144501; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbDzEIGhuuzyxfC3507rw4xstnLMePHJFQZDa/FPz9A=;
        b=J2V8xgmL1seWLViexFXW1aR2+ZRwTAMldo2qo81oKfCrURlllwuo01r56NRnnC5I2r
         JnSgmdobvYTS/nfedihOyMpzEZ1pBE5TTK0oqefQdaSgRtxNtEl9WRwOa97IVYL76UFX
         9cHN3v9ytCQCC2/ACEHLJpDe892hKI2LSMOSVwBDAC6knK/ZDutJxDdYC8J0R3EnZcp6
         e0BkPCFi0TSE6vftR9leNxk6RKWRo1Fgm34QWhTE5feK0aB0rG0vInKZz47v5iP6jiOf
         C/2OFdxA9QGmRqp6DkzDFbkShKIibH1auoqWyzWo1ZdqY8vWwR7pA35ecCA51jstAcSe
         I9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720539701; x=1721144501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbDzEIGhuuzyxfC3507rw4xstnLMePHJFQZDa/FPz9A=;
        b=Y1ia/bveLLamNi97cloCV69Q8k/9yWmzulVCibsuI29Op2MRM5I7s/gsX4Ez5NrDnv
         rajFmAjIEy5qKSETDIK/Xubvsrp3RixdNtrGXWi0W54XInA4rKvaNVHYKfrYZpMh6xWb
         wtfpqbMg835biHRaRUc4Arl38pUikQpIOaPwXLF6qGbogFmF93qmygxV9voWYnhWqxp3
         5Jp9/ucjeCm9QTPipdbaooLWFkzVe3u11rJU4XG8vaL3Q/GU33C8/4XTrrlYb05G3GFV
         ynpgegCbjnGOi/61HvEPCRUVNbQDfcaWB2aDcCAuc0DWvbL96f9vEHW1L4yQ3X2fEhT3
         HKCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiNqwzBHbWWIdPaXTYtZ+gt9KBPyHMU4Lk0QnCg+58Qy4ClxjsUe9Bsp2fIZPCn0g2wuZ1QjEdJFeJOhF3yvkG7aH28GmB1sbDFtao2mqggJyIawwEHzuL
X-Gm-Message-State: AOJu0YxYaWYCfEH1hyXgMNEYyRj3msVBuc1lhGgeelku61APw4i1ejjG
	HPtoEMIYd7T6Sfn6w9mG+H1PBNFnZowP7GqilrQQ+qLvlXz4ikuIdNGhgQ52qa5oRzF4tHF5Ry6
	13PZ8lYsWqVikkkf47IpdHgG+ytYOWKhtEylqmw==
X-Google-Smtp-Source: AGHT+IH7A35sMRL/g0DrmwF+fsxyzDRuHXZ0ZKoNN5iaLqPzS6BWzfgQH2hcQO2O7VuTkxYcV21RqVSSTOuNyklIhq0=
X-Received: by 2002:a0d:f685:0:b0:631:78a1:bb5 with SMTP id
 00721157ae682-658f02f4017mr32809357b3.35.1720539701328; Tue, 09 Jul 2024
 08:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240604080621.1885249-1-ejo@pengutronix.de> <04d0dd97-6e67-4d5c-a82f-e4ec5f0465f6@amd.com>
 <e2b4f7f59893c005511f1ab7f47d2b70cf91d0a0.camel@linuxfoundation.org>
 <CAOSpxdbEBs7ZT1M-ainOu7CnEOh5T6+_db-SN+FUqX7_xpdRVQ@mail.gmail.com> <400f91a5-e614-4970-a409-cf4e32f89429@amd.com>
In-Reply-To: <400f91a5-e614-4970-a409-cf4e32f89429@amd.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 9 Jul 2024 08:41:30 -0700
Message-ID: <CAOSpxdbHQ8VoR++wbN68DfamG823Q37rKNet6e35rs=rpWTdJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] wic: engine.py: use raw string for escape sequence
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, "Hatle, Mark" <mark.hatle@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 15:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201664

On Tue, Jul 9, 2024 at 8:22=E2=80=AFAM Gundlupet Raju, Sandeep
<sandeep.gundlupet-raju@amd.com> wrote:
>
>
> On 7/9/2024 7:12 AM, Steve Sakoman wrote:
> > On Mon, Jul 8, 2024 at 2:32=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Mon, 2024-07-08 at 11:56 -0600, Gundlupet Raju, Sandeep wrote:
> >>> Hi RP,
> >>>
> >>> We do see this issue in scarthgap, Can you get this patch backported
> >>> to
> >>> scarthgap branch?
> >>>
> >>> Thanks,
> >>>
> >>> Sandeep
> >>>
> >>> On 6/4/2024 2:06 AM, Enrico J=C3=B6rns via lists.openembedded.org wro=
te:
> >>>> Fixes:
> >>>>
> >>>>> poky/scripts/lib/wic/engine.py:362: SyntaxWarning: invalid escape
> >>>>> sequence '\/'
> >>>> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> >>>> ---
> >>
> >> You need to talk to the stable maintainer for scarthgap, Steve Sakoman
> >> (copied on this reply) about that rather than me.
> > I've got it, thanks!
> Thanks RP and Steve. Steve when this will be available in scarthgap branc=
h?

It is in my current test queue (stable/scarthgap-nut), if it passes
autobuilder testing then it will be posted to the list along with the
other patches for review.  If no comments during the two business day
review period then they will be merged to scarthgap.

Steve

