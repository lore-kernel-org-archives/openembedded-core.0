Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.1241.1617059428257814080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 16:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WGobcRGR;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id o10so20858517lfb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VICP/Uq/+UaYJ0taocjlqLxDwhMinnaDTJsWYtMyat0=;
        b=WGobcRGRV+CofoU45TdXxzm0NHeyYQMldZ6MuurAe1lTrdH6k5fHida2alGTOaOOMR
         ouYQb+ojusAh7c+1t7u15kTdZSPmwuIDlZl1y5jiO9qjGzglqetryPBfAABiKh9OO9HE
         AVwSTZTvV9vxsffUeSsa0rJ2IdmeNK6jOtsITiRxww9MyQa81gaEFUrD3MwytTGqg9oh
         HkALf639tIteLuBq4LYAzNXUc/3At2tKqdfEZLXj5a9JeQilppzxIy7i49TzJjEU8KqT
         6s11ZA8OMU7+A1Ze5HIcVB0vZIiAbkbpdkkynqW3khOf+sEpwT3E7fEs8sX3a48syhoe
         e+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VICP/Uq/+UaYJ0taocjlqLxDwhMinnaDTJsWYtMyat0=;
        b=EvRQSeDOexPkXw4RrBApqBs+q1y03iCfbgk3LECBKzRfJxamMRT3L1PA3xozJSExoF
         ivAChcMCFgvxzPJJJEn3jhH7MU083XM9RGJO9hzyIt/fnISfSbcu8QyyQ440Tq6Az42K
         X6qNRUGSDNKxtKZwwNg92VTC5xrcAcbfRCENcNIFe1o0t8xykBg6WDIG0TCqA5mjo7lo
         /4AKNL7mdS4z0hrCIR5lTlAbDAR+v11S7RZL+KSTQUvwp9dJm5ZtkdYVwma2/7+J4C8r
         72q+6kv3hVXGNwil4PyyVXGKit/QC6AbNMFkq13YQrlD6KFrSRlVsFtUvoOeLK9iCQZH
         vnvA==
X-Gm-Message-State: AOAM5322uNVczKRpFFtaW01J90nczO0jS7zyvCjyKMo5NfVS7971qYvm
	TlpGjsc8uaBsCd6+IgUjpDox+uqt8ax3/F4y06k=
X-Google-Smtp-Source: ABdhPJzyL3PBKuKHzr8zZGgeGQn8VGvZGr8uQH4SUoI9WUchEPHG6naWi9KfXh9tfXYbkU/I4DapHPxT71QHoWSlir0=
X-Received: by 2002:a05:6512:3e20:: with SMTP id i32mr18139325lfv.257.1617059426589;
 Mon, 29 Mar 2021 16:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org>
 <CBEFAFBB-3A73-41E2-A177-BBE047E615D1@gmail.com> <CAJ86T=Xn9tLHWrqqr1ZV9rAwZD7sG6x0QsyVRkUSKLwiGQKL8g@mail.gmail.com>
 <D5D63158-3A18-4F86-9262-9280A587D4C2@gmail.com>
In-Reply-To: <D5D63158-3A18-4F86-9262-9280A587D4C2@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 29 Mar 2021 16:10:15 -0700
Message-ID: <CAJ86T=W52t-GtrNgPEg5AiJWYPCKFu9H9+PfxRGNUqMJCDJt=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
To: Devendra Tewari <devendra.tewari@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 4:07 PM Devendra Tewari
<devendra.tewari@gmail.com> wrote:
>
> I did try that but got an error that does not happen when we try os.renam=
e first. I'll try to reproduce it again.
>
> I suspect there may be subtle differences in os.rename vs shutil.move wit=
h respect to what happens when origin and/or destination do not exist or ar=
e invalid.

If there are subtle issues which you don't yet understand then that's
all the more reason for not hiding the new shutil.move code behind a
test which will pass for 99.9% of users. Please figure that out before
sending another version of the patch.

> > On 29 Mar 2021, at 20:00, Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari
> > <devendra.tewari@gmail.com> wrote:
> >>
> >> Thanks! My bad. The example I looked up in Python docs had a break and=
 I just realized it was a looping example.
> >>
> >> Here=E2=80=99s the updated patch (or should I submit it again via git =
send-email?)
> >
> > It would be better to use shutil.move unconditionally in all cases,
> > rather than have a separate shutil.move code path which only gets
> > tested by people doing incremental builds in docker.
>
