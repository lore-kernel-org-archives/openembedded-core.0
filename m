Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B05EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 11:58:56 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.11917.1689767934637364286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 04:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UiZxR4A8;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-34637e55d8dso30001995ab.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 04:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689767934; x=1692359934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCCR/CEOZqux0PL4K403Y/tIN9c8FOkaWJvJXmIyRNE=;
        b=UiZxR4A8p4u8LTx6Dcknw19reXSDhYZEhmFRxD6F5hh/U8172hUNfl3azD/6gpkUMV
         6iAvY3dIqaJkmiEDs3DzgsUTJp/kLtqAc7VtYWdyR5ElOxlMYroTtUcY9IEMo+Q5PRP0
         CodDo0aj4WUnDUAv9mDk0MoXTGY8VuSAPg14t34CSc35wMBHxSuHSxy5mpfKhKCnDqgE
         gizGrcGeuSi01UgnMRFctutQSN54Xdy+63TvvDTutfy63N+wQVwYhFnH0d9qE9vQJ1e7
         ONfUz/IhG1WXVxTfh6Y7NEJedxscE/pfQxFmSnsBFBAMHAYR1coz6mZGjihFJOUo4t41
         iztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689767934; x=1692359934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCCR/CEOZqux0PL4K403Y/tIN9c8FOkaWJvJXmIyRNE=;
        b=FQTctRRYZ2wB+LPYlHwzdmvfRYJIyKmrxyNkr+R1enqoz/6v6qVcL2cLc0hturscfV
         46pbJsIRo85QgYQHqIfjr3CAZJz5xY5pPCyKqUuAMd+iS9wPuwDOILA65wZTO7B+z4In
         bH6769T67RnxrSFbv2op8qWwZ++/fmgcB3eRacmx4piY0aMgcb8XuMW0eGIll2mRJwXJ
         aYoaxx2Srova0stRAgi23jrTnuxLT+dmY63ENg8SHaZXsQJzi11NrEf986V572AYBbI8
         Kh4vVX2OS/1yFdlMI6w3iZZHQ5z8uIqIviIH60CRK1GDDz/dyYsEyZLCjMhbIc5I6KrI
         +dMA==
X-Gm-Message-State: ABy/qLaSGj7Y2QQfJ9GzbrGfLIknyMdjgewMJKLeNKSAX2FjJPHX4uRN
	vS0agP0KvOXsrL7zqPQ4gpmAbjH5z0/uvg1oYsw=
X-Google-Smtp-Source: APBJJlETqqBy72ybXM9mtnXiA/Ft8N30v5bmfWLdnznjoBz6kgM5uzXoT5Ow7M4g43/C9gCIWoD0tKrx8w3jXmULlxM=
X-Received: by 2002:a05:6e02:174e:b0:348:814b:e4b6 with SMTP id
 y14-20020a056e02174e00b00348814be4b6mr2619293ill.16.1689767933611; Wed, 19
 Jul 2023 04:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <efa2be27-b66e-3ec5-dc5c-872e4480055a@windriver.com>
 <CH2PR11MB44707BB142B48AA62AB5FF5A89499@CH2PR11MB4470.namprd11.prod.outlook.com>
 <SJ1PR11MB6129C95690F5CECB834AF2EBEB5BA@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <2023061619564473739a2d@mail.local> <2023061809292129ae9b9e@mail.local>
 <SJ1PR11MB6129BF560606CCE63FF83457EB23A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <365cabd0-72a1-6ec8-d7be-fff24311934c@windriver.com> <d6c84ad89f53c685be3defa3f8ac9fa6a19c889c.camel@linuxfoundation.org>
 <20230630131626130a658b@mail.local> <SJ1PR11MB6129783A802FD0B5B8713D64EB36A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20230717143459f37f8da6@mail.local> <8d7b610d82cb606aebba1bc582176b072375f3ed.camel@linuxfoundation.org>
 <910f3165b7ba14fdd89e1ce89e3a70b9b5cbc014.camel@linuxfoundation.org>
In-Reply-To: <910f3165b7ba14fdd89e1ce89e3a70b9b5cbc014.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 19 Jul 2023 12:58:42 +0100
Message-ID: <CAO5Uq5RCBj7YC1iML5ZRuOxBvfgNMGmtvHbanOnasCYgL0JaSw@mail.gmail.com>
Subject: Re: [OE-core] Rust Oe-Selftest implementation V15 Testing
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"Shinde, Yash" <Yash.Shinde@windriver.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"Gowda, Naveen" <Naveen.Gowda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 11:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184579

On Wed, Jul 19, 2023 at 11:49=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-07-17 at 16:08 +0100, Richard Purdie wrote:
> > On Mon, 2023-07-17 at 16:34 +0200, Alexandre Belloni wrote:
> > > Hello,
> > >
> > > I got some feedback from RP:
> > >
> > > http://autobuilder.yocto.io/pub/non-release/20230716-18/testresults/t=
estresult-report.txt
> > >
> > > This shows warnings for duplicate tests and he also asks being where =
the
> > > qemuarm64 went, both issues being probably related.
> >
> > I had a look and you probably need to add a:
> >
> > @OETestTag("toolchain-user")
> > @OETestTag("runqemu")
> > class RustSelfTestBase(RustSelfTestSystemEmulated):
> >     def test_check(self):
> >         self.test_rust()
> >
> > section to the tests to allow the tests to run for the non-IA
> > architectures that use usermode emulation for the other tests which
> > rust can't.
> >
> > That then just brings the question of why there are duplicate tests
> > results being reported. This is where the result for an ID is being
> > reported more than once. I haven't looked into why that might be
> > happening.
>
> I really do want to get this rust test suite issue resolved so I went
> digging into the code to find out what is really going on.
>
> Firstly, the duplicate test results. The issue is that you defined the
> core class like this:
>
>  class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCa=
se):
>      def test_rust
>
> and python unittest has a convention where anything starting "test_" is
> a test.
>
> This meant that the rust test ran unguarded in all the oe-selftest
> targets on the autobuilder and not just in the toolchain-system
> filtered section.
>
> The easiest fix is to drop the RustSelfTestBase class and move the
> toolchain-system decorator to RustSelfTestSystemEmulated. That will
> resolve the duplicate test warnings and ensure things run where they
> should. You could have worked out this issue by finding that there were
> rust test results in oe-selftest-* testresults.json files, e.g. here:
>
> http://autobuilder.yocto.io/pub/non-release/20230716-18/testresults/oe-se=
lftest-centos/oeqa/testresults.json
>
> Moving on, the test result names really don't look good with the
> "[ui]  " and similar prefixes in the results file. I've patched a tweak
> in to drop that.
>
> I also noticed that there were no skipped tests being reported in the
> results. This was due to "SKIP" being used instead of "SKIPPED" which
> resulttool looks for.
>
> We need to also add the toolchain-user decorator to make sure that the
> tests run for the "user" architectures since we don't have any user
> mode rust test equivalent.
>
> I've rolled all these changes into a patch on master-next:
>
> https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D46ab84785d=
a15ac156ee0b4a693ce8bb5ccf8c22
>
> which I'll put into testing.
>
> Looking to the future, I have concerns about the ease of maintenance of
> this huge patch to rust to disable failing tests. I'd propose we change
> this to a hardcoded list of tests to ignore in the result parsing code
> which will be easier to maintain in the future.
>

That feels far more maintainable - the scale of the  patch really
concerned me. Also I guess if it's just a list, then running with
everything enabled on upgrade to see what passes/fails would be a
relatively easy option.


> We may want to take that as a subsequent follow up patch.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184576): https://lists.openembedded.org/g/openembedde=
d-core/message/184576
> Mute This Topic: https://lists.openembedded.org/mt/100232853/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alex Kiernan

