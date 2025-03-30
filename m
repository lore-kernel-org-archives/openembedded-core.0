Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77349C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 14:32:14 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.31192.1743345127125544955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 07:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mr7agrjj;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ff4faf858cso26746467b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743345126; x=1743949926; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTD9KXeHZrsPcXUW5ISWv5+NhNutdtyn0UC01aRdsao=;
        b=mr7agrjjytWjsLGRda3xb4ayglB/uzqhlxvVDxswenwUWZcF9IJpWQlQXVB3NGNAnr
         pf+w/m8rWAEOj3G/OogGCqRd+Kcx6BHgkLNER3RB1FItlVTV6+9lo0Xqge/ZUtL+e3cK
         IUdzoFnX2WrvwWPWCc7zPzPtVT3qL5Lrrk5EgNnApBURiAOKgqpLy3GQKt8RNFAWz7kP
         vsQKxBS9oVw5ZwXJ2PdZjygP3S/C4UdOUciIk9lE36pl0JcTv2DfeZ7VDADlfEDB1tgU
         qMSK2iXbMft4i/ZFxfH6yn7lDtmgCFZGk7Gktoe9EKimF40sWLmcmMsPrUF574xXhCEh
         3vYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743345126; x=1743949926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTD9KXeHZrsPcXUW5ISWv5+NhNutdtyn0UC01aRdsao=;
        b=Dm2blqdqqACf43P78wakh+D9YBx9PHCAth8hKXZsFSVJ2l7EsV6ReUts8I+kjNNLkt
         k6dObL3Jctd7KPVfPqBsnEnNy3uVEWsamJXOwE9ECZ/FVmmPjazAb4eObeRSeyNPMcPT
         /WFjsESE1ayWmdZluyMgwpGJsRlGR03sHMzZgtmr4mUx05RRzGF0cy/Mg75YjVy8TZ0v
         1yB35cA7WW3TfbU398X4z7I3YU6jFKmtUxbaj1gBHpl1knmI9vXiuCf4a4cbfOjtWWjU
         oQX15Ot3UJMxH8C1gy5eOdCFRl2qGgsDKv0gQKZnd70wrMK30fOBG1i8wRRx8P7Hs+v5
         QSsA==
X-Gm-Message-State: AOJu0YxUzVGSC6u6rdXIALM3TtHKler3o8PkSbbdoyRDWBQBTtafo8uw
	EucKRh3E2BPl9blXCN6fI0x5IQyQz6qAHWfrdVM/Mmf+7G/pum6RR1q/DWqZ/ibXO9t+vo290xG
	CObikAUiLlq0YD8DCIbmW8VtiBAh0Kg==
X-Gm-Gg: ASbGncuAm0mN4ECAAadeQBgsSD6EbqWwf0jLm9hCM1zTBYMlgcyTR+4jAHGajRrUmqH
	HweY6fZ1iChbdR45hnAA1JbekzH6CPn+J4N1e5j9C+97Y9N+lB6AknlYK/OV7CekTFyzltzIS5k
	3gcun5X0i/hI5doa8TXYYs/hqXUXbii4og9G1R1C6hgBin6oey/43FsmGxHUE=
X-Google-Smtp-Source: AGHT+IHS/K+l9gY2sarAw6qaG7B8HXm7gXmx6fe3l+mG8kQ91hgb7XMozgBN2bFqixrGN/y+gEQ0D+zt5h0W3kejgkA=
X-Received: by 2002:a05:690c:4d84:b0:6f9:50aa:8605 with SMTP id
 00721157ae682-70257328743mr80381917b3.34.1743345126207; Sun, 30 Mar 2025
 07:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250330101938.2634400-1-jan.vermaete@gmail.com> <dbaeb44938c460c2a14c388ac9807476684e140c.camel@linuxfoundation.org>
In-Reply-To: <dbaeb44938c460c2a14c388ac9807476684e140c.camel@linuxfoundation.org>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 30 Mar 2025 16:31:55 +0200
X-Gm-Features: AQ5f1JoIrjtMK8gd6D2XyB-sjBbADAVgHh1a3m1yAjeVvezwlqcMb2JF3Mdhz0M
Message-ID: <CABF_=ygQUzCs0m+4NXF_fGVFcEnabAf7dk4+ofARuPBiumY27g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-breathe: new recipe version 4.36.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 14:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213919

Hi Richard,

I thought because python3-breath and python3-exhale are closely
related to python3-sphinx.  And that one is in oe-core.

On Sun, Mar 30, 2025 at 4:00=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2025-03-30 at 12:19 +0200, Jan Vermaete via lists.openembedded.or=
g wrote:
> > Breathe is a Sphinx plugin providing beautifully integrated Doxygen out=
put in your user-facing documentation
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  .../python/python3-breathe/run-ptest          |  3 +++
> >  .../python/python3-breathe_4.36.0.bb          | 22 +++++++++++++++++++
> >  3 files changed, 26 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3-breathe/run-pt=
est
> >  create mode 100644 meta/recipes-devtools/python/python3-breathe_4.36.0=
.bb
>
> A key question is whether this is needed in OE-Core? Are there recipes
> in core that are going to need to depend upon this soon? Or is there
> some other reason we need it here rather than in some other layer?
>
> Cheers,
>
> Richard
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

