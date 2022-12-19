Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84306C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 14:38:46 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.23399.1671460719931461607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 06:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B0+imTHI;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id y25so13913855lfa.9
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 06:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1eoj2wajSJV6+myP7kauKQX3iekgEvA5yJSem1TtnOY=;
        b=B0+imTHIDg9C8RoEhZPuVyW4h60ba44XaxCKLlJEKDbuQrWeNxHfPDCA2cnz2U/Hn7
         9z0tPnT+tgFGyuCGh9EI52QRkF6HMYEWsx5O9TZBKLB9rpwOVX4QVx/LaZdaasFcgmpn
         cW6GqV0zVnARM3qsCQvN7LU7DfNf9nXjhzmuZJev/yX+HKG4X+/cbHEmm9+NF8w3y01f
         nWgqzvm1S8Ocw3+JW9C02dlNQxhytO2ZqPK2wGmXpGT2nFNX5/5LGPePc3qfjLC+XSnA
         oKTpJ1rci5TZxBa8NkX0yE9b0bIoDgbaPnhK0LrYcQOxhHZj2Ij14WYLQ3M4vEBqCnat
         z4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eoj2wajSJV6+myP7kauKQX3iekgEvA5yJSem1TtnOY=;
        b=X1mrr9Cigvr4nfiYbpQeQWABHnRMDbVcBBkz504/fW9Ivk/sn+nt95B8tQG71vZCms
         ma0LP2AzdbUqHVYw1MvtJ0+8m7o8X3KWur6yMiSrkN6s86szIW1cYe7rC5r8sGQDc4bJ
         SLaruruGQBpuqCw93haqgZaDKpf5ieyD81n1p/x2GEmsEVnQxR9n9J5zul1unwkv+59y
         eoqiQ0KGUPBjG5zFES7xt1s9daSHIbOlxumL6gEVX/pHElzyYHwMRpLxNYLzlnerb3EB
         YJB+TI2MbevzKFxn00VXzvVZ7LONNV0BOb4f11aDG07ElE51L/cA9913Su5O+AwPQ1kX
         AodQ==
X-Gm-Message-State: ANoB5pluO8XaosDX8tgYtgFsJ7ZkHZR7Y7tiYnHRFPsoegcAxp2bAswJ
	Jczy67eFXhytm/FVYvHNSs5d+2ZxRUv6E5zg0OE=
X-Google-Smtp-Source: AA0mqf4T6b4CtWWI6w9KcqGuBcIOF4n7rLHFK9ZkotMm5LeS4iIuy3f+3xi+chEmZQWFsPCo4ldQtKVoVJFF8Epiw+c=
X-Received: by 2002:a05:6512:39d0:b0:4b7:13b:259e with SMTP id
 k16-20020a05651239d000b004b7013b259emr1954058lfu.131.1671460717969; Mon, 19
 Dec 2022 06:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20221219141840.26358-1-alex.kiernan@gmail.com>
 <CAO5Uq5T20q0wVhM0wQrOMu-GcoAaKFTOGCMxDxCOLXoUS+sLxQ@mail.gmail.com> <edd6881dda3b935165f95093da2cbafcd42fc2e8.camel@linuxfoundation.org>
In-Reply-To: <edd6881dda3b935165f95093da2cbafcd42fc2e8.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Dec 2022 15:38:26 +0100
Message-ID: <CANNYZj8vkH2iunZd8mkj+7C5uSQckXtiNe+pdHbKjbFQsG-MKg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] oeqa/runtime/rust: Add basic compile/run test
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 14:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174817

But we need to add rust to core-image-sato-sdk then, if it's not there yet.

Alex

On Mon, 19 Dec 2022 at 15:32, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-12-19 at 14:28 +0000, Alex Kiernan wrote:
> > On Mon, Dec 19, 2022 at 2:19 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >  meta/lib/oeqa/files/test.rs         |  2 ++
> > >  meta/lib/oeqa/runtime/cases/rust.py | 24 ++++++++++++++++++++++++
> > >  2 files changed, 26 insertions(+)
> > >  create mode 100644 meta/lib/oeqa/files/test.rs
> > >
> > > diff --git a/meta/lib/oeqa/files/test.rs b/meta/lib/oeqa/files/test.rs
> > > new file mode 100644
> > > index 000000000000..f79c691f0853
> > > --- /dev/null
> > > +++ b/meta/lib/oeqa/files/test.rs
> > > @@ -0,0 +1,2 @@
> > > +fn main() {
> > > +}
> > > diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtime/cases/rust.py
> > > index 55b280d61d8a..186bb0d79e15 100644
> > > --- a/meta/lib/oeqa/runtime/cases/rust.py
> > > +++ b/meta/lib/oeqa/runtime/cases/rust.py
> > > @@ -8,6 +8,30 @@ from oeqa.runtime.case import OERuntimeTestCase
> > >  from oeqa.core.decorator.depends import OETestDepends
> > >  from oeqa.runtime.decorator.package import OEHasPackage
> > >
> > > +class RustCompileTest(OERuntimeTestCase):
> > > +
> > > +    @classmethod
> > > +    def setUp(cls):
> > > +        dst = '/tmp/'
> > > +        src = os.path.join(cls.tc.files_dir, 'test.rs')
> > > +        cls.tc.target.copyTo(src, dst)
> > > +
> > > +    @classmethod
> > > +    def tearDown(cls):
> > > +        files = '/tmp/test.rs /tmp/test'
> > > +        cls.tc.target.run('rm %s' % files)
> > > +
> > > +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> > > +    @OEHasPackage(['rust'])
> > > +    def test_rust_compile(self):
> > > +        status, output = self.target.run('rustc /tmp/test.rs -o /tmp/test')
> > > +        msg = 'rust compile failed, output: %s' % output
> > > +        self.assertEqual(status, 0, msg=msg)
> > > +
> > > +        status, output = self.target.run('/tmp/test')
> > > +        msg = 'running compiled file failed, output: %s' % output
> > > +        self.assertEqual(status, 0, msg=msg)
> > > +
> > >  class RustHelloworldTest(OERuntimeTestCase):
> > >      @OETestDepends(['ssh.SSHTest.test_ssh'])
> > >      @OEHasPackage(['rust-hello-world'])
> >
> > One thing I wasn't clear on with this, is how I ensure that rust is
> > actually installed on the test image during CI, so this test runs?
>
> Isn't that what you're doing with:
>
> @OEHasPackage(['rust'])
>
> ?
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174816): https://lists.openembedded.org/g/openembedded-core/message/174816
> Mute This Topic: https://lists.openembedded.org/mt/95765437/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

