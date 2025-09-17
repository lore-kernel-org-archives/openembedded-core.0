Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B999ACAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 09:21:31 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.18530.1758100877599034548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 02:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mnlK7ft9;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f7039aa1eso6758669e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 02:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758100876; x=1758705676; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3D6MyNZBBoNiObUowIiir84d5IF/cKmB8u6z7hShY6Y=;
        b=mnlK7ft9aWatgZYhuBRAa5PPppVqY1MkT2+Ice4Jiq3/R6WMxpN2Po+ERFC3BXXC3J
         iuEJIaunEyoVv1EGeiFxTMI1GKFq7Pahoy1XgwI5OIUWT+mQ3XqAAxLlfnlk/erLSDOS
         yWICrGvOZ9qcOB2Qi3V3MAqwQ8o0L32xPo+ulbgicXmibAHs4TnsfxTMI7hWhZAikkBz
         UHE3TQ16yxgqBYy6gfOKVO4qyKLza8gC+TKod20uSwniNJZHsWNd04EJ4TEdwtNQRO6O
         SMf4muL8X2lxhgIKRq15gNQgiWSI1KEF9VYjs21/EdIX5vVEuG1KFHVcTYi9i6XqPpx/
         g1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758100876; x=1758705676;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3D6MyNZBBoNiObUowIiir84d5IF/cKmB8u6z7hShY6Y=;
        b=vXka/oAEOmD1YWqY78pbfITOFlsfWw+dgh251hCKPPKjtXsnXqoqK6U2VHP1eNbaIa
         WVZlugiqaWahbYw0FurAT5wNwpurZ/qN5JETiO722IkeZDPGYRjXngBadfOT9H99V/wQ
         bd1iNxfWY1aidNB1//iWprGO5BTS8lXCClD4LHTrDUKd66N/ScLETgllcWJoCjV5oD5W
         MNNAflIRtX+7EON+gIVWtkYnrqFLEf9Iivf3muz1lxlVh4rBAwunptU/wz83nQRuYPGK
         c6F9ZoLySxqlzapkFAwgKnh+phXp+I+5lf8VK/m9ARkA4kJZqFkvYQVF2pUayUESdi3X
         oxmQ==
X-Gm-Message-State: AOJu0YxLyf5VacI5hWtkOhMEaplSStnkVmfzcbtbqF0XcrxNC2pfAKOo
	bdpkG0WOpqaQqs0SNT9ezbxdxrM7Lv4h3uv4fkTlostlZuo3QBMNCIXP1+BDa9eK2OI=
X-Gm-Gg: ASbGncvjj3jvKkEf7L84EnedgnRMoet2lzPCodN/SIqi1wWZ1JeMNnC2M77rpr8ZjFr
	icBgC1MLAo76CAdlo9sY4uxvNBA6gznZqU4noTIGaXBSihWLlxSEmHJ4Fyq/8LJCqJcrjehAeZi
	fFYjEToPvqWGRJ8qK/o8g5RyIwgbXxXIajq3pOgQ60mDg4CT5FPuMCibvgAXQsHsSmJfhN3zE2q
	TlTY5E4YQC3C0jwBoXy4sZ1OjBr+NaeztTwmVZc/IeFQ8VwVjpIRxrACG548dCb99ECLLscM3wj
	UQ6XOi2AAttVvdiarRke28hw0KCaNHZcnxcegZ0XwiS4P+ZNyeYE/3mwS1EX5PhDrjkP8LLes52
	31InrSQ/q2KKcNd8U+21ANdqJhA826qjtusqluKep65vBlot4T6T3bXk=
X-Google-Smtp-Source: AGHT+IHqt9zCt/TL1oqQMgtG0NepuGs5noQ+IZXHaILFZC9ECKLJ0qsc3ncZDtUh+bd6dm054CSvQA==
X-Received: by 2002:a05:6512:ea9:b0:569:1e0a:40f4 with SMTP id 2adb3069b0e04-57796879a62mr475328e87.7.1758100875653;
        Wed, 17 Sep 2025 02:21:15 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-577f659ea05sm157591e87.78.2025.09.17.02.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 02:21:15 -0700 (PDT)
Date: Wed, 17 Sep 2025 12:21:13 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Barne Carstensen <barne.carstensen@danfoss.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: Re: [OE-core] [PATCH] Fixes [YOCTO #15965]
Message-ID: <aMp9iVBiighRL-fL@nuoska>
References: <20250916122517.1965-1-barne.carstensen@danfoss.com>
 <1865C555FCF7D165.11775@lists.openembedded.org>
 <aMlo-hknGOEJqrGP@nuoska>
 <DB9PR01MB721006FC2064A4FF2F7AA6288717A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB9PR01MB721006FC2064A4FF2F7AA6288717A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 09:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223586

Hi,

On Wed, Sep 17, 2025 at 07:26:49AM +0000, Barne Carstensen wrote:
> Hello,
> 
> Okay sorry, was my first time sending a patch and in the manual (https://docs.yoctoproject.org/contributor-guide/submit-changes.html#implement-and-commit-changes) was written to use that form. I am a bit in doubt, which branch should I use as reference? The target milestone of the bug is set to 5.3

Is this for master branch or some other? The bug references 5.0 which is scarthgap but
5.3 is for master branch. In master branch this bug should not exist anymore since
e5e8f2aa0a63d fixes this, and 05e97d5e6e24b and 2d900c3061e12 improve
testexport.bbclass usage even more, on par with testimage.bbclass used in
Auto Builder (AB) testing in oe-core/yocto upstream.

> >Since the commits are bit scattered, these from master branch would be needed if not already in the relevant branch:
> 
> >e5e8f2aa0a63d testexport.bbclass oe-test: capture all tests and data from all layers 05e97d5e6e24b oeqa context.py: use TEST_SUITES if set
> >2d900c3061e12 oeqa/runtime: set self.runner and handle None
> 
> I cannot find these commits, but do you ask me to cherry pick these as well?

Yes, the commits are in master branch. They can be cherry-picked to other
branches and hopefully there are not many other changes or adaptations
needed. Then these need to be proposed for that branch on mailing list.

Cheers,

-Mikko

> Thanks for the help and sorry again for the inconvenience. I will try to send the patch again with the right subject and reference branch 😊
>
> Barne
> 
> 
> Classified as Business
> -----Original Message-----
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
> Sent: Dienstag, 16. September 2025 15:41
> To: Barne Carstensen <barne.carstensen@danfoss.com>; openembedded-core@lists.openembedded.org; randy.macleod@windriver.com
> Subject: Re: [OE-core] [PATCH] Fixes [YOCTO #15965]
> 
> [You don't often get email from mikko.rapeli@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi,
> 
> On Tue, Sep 16, 2025 at 04:09:58PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > This is not for master branch and subject line should be something
> > like "[branch name][PATCH] testexport.bbclass: always capture ignore files"
> >
> > On Tue, Sep 16, 2025 at 12:25:22PM +0000, Barne Carstensen via lists.openembedded.org wrote:
> > > Copy all the parselogs-ignores file so that they are always packed
> > > into the testexport.tar.gz (even when testsuite parselog is not
> > > selected)
> > >
> > > Signed-off-by: Barne Carstensen <barne.carstensen@danfoss.com>
> > > CC: randy.macleod@windriver.com
> > > ---
> > >  meta/classes-recipe/testexport.bbclass | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/meta/classes-recipe/testexport.bbclass
> > > b/meta/classes-recipe/testexport.bbclass
> > > index 843d777e3b..2f473a8811 100644
> > > --- a/meta/classes-recipe/testexport.bbclass
> > > +++ b/meta/classes-recipe/testexport.bbclass
> > > @@ -79,6 +79,7 @@ def testexport_main(d):
> > >  def copy_needed_files(d, tc):
> > >      import shutil
> > >      import oe.path
> > > +    import glob
> > >
> > >      from oeqa.utils.package_manager import _get_json_file
> > >      from oeqa.core.utils.test import getSuiteCasesFiles @@ -120,6
> > > +121,11 @@ def copy_needed_files(d, tc):
> > >                      oe.path.copytree(src, dst)
> > >                  else:
> > >                      shutil.copy2(src, dst)
> > > +
> > > +    # Copy all parselogs-ignores files
> > > +    parselogs_ignores = glob.glob(os.path.join(corebase_path, 'meta', 'lib', 'oeqa', 'runtime', 'cases', 'parselogs-ignores-*.txt'))
> > > +    for f in parselogs_ignores:
> > > +         shutil.copy2(f, cases_path)
> >
> > Master branch is quite different. There the tests and their data files
> > are now copied from all enabled layers, not just core.
> > So I would rather port those fixes to relevant branches to avoid
> > duplicating maitenance.
> 
> Since the commits are bit scattered, these from master branch would be needed if not already in the relevant branch:
> 
> e5e8f2aa0a63d testexport.bbclass oe-test: capture all tests and data from all layers 05e97d5e6e24b oeqa context.py: use TEST_SUITES if set
> 2d900c3061e12 oeqa/runtime: set self.runner and handle None
> 
> Cheers,
> 
> -Mikko

