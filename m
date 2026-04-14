Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37CBED7B98
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:11:18 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15551.1776161469580061987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s7l79555;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-671c24f23b1so1898883a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 03:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776161468; cv=none;
        d=google.com; s=arc-20240605;
        b=NA1XfznWXW+QUD8/DX5e+K0yBuOyNB9s4Iz+tbyFCRe2w2H8n0i3R+zlMpunzU6+8k
         hGpyqNkFagE/5nsoxuntygN7GA0MFmw+3HzoVqR7M4kDfJ5S0xrnPN4oJ6cv3baIsW1r
         7iFqBBsXL+uswtJw7jW5Qa2of+ogW3MdAgmcOVw8lhKxgJT8Ej3bqe5VYlqmwrtMzN+k
         xRN83NBAmBsyHONfQcgQymXsdazX8Kfh2adiyLH0kdjm1LbvU0EsJSar4nTQW14ClWWq
         t8QWnSNn1jS6y/trH1Q3jXvGugnBsHwLQlBwgHwPVkMAgkS51x/Y2HustFVyVbtc5+/C
         AKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=38LTr05+8iYcJzW86BlZq8b4Bp/Lne6b5dBfQnyZsEg=;
        fh=7wQzaFIQc1d+txBxzfk7TbASNnOH21+Gq8YvvTL+Eiw=;
        b=FtPhDAkYDdCM7YN/7ll1oSBv0Q/dlNOTQzU0rfnTvau4RSw8Rlq4aoPH1tezGfnFN+
         dttAu4WxDKmsIpqdiGGN7xsSSASrXVy1pGQPMd9uFYvtqsirGQ5y5CVNIEQatRIFTW10
         +B0JSSxqt6HnFOqnYoxlEJ/wupYSdjhy6x/Lpz+D0bib0BR++nI8XcB8bjO2Rp0+muTR
         nlNi4/tBlNrx01Ls2u9U5cbfvA3HoJFLE8SbihmIufjFY2QvkvCjEPHSdtIH44CFBUc3
         MDmFaIWZW6AslcZvfTEtiR1qAiYjH5D4twV58gkV2godn0xsLNfJ9araGPCNB/0YbVZZ
         +f9w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776161468; x=1776766268; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=38LTr05+8iYcJzW86BlZq8b4Bp/Lne6b5dBfQnyZsEg=;
        b=s7l79555WnQFYT4OahWj2njAKLCQyPrlBOXRHMB8QmjgGSUcks62Dmu6vloFxJ+NcX
         LtlT8d5s/yR9fFfCt+DahN4ZsNxyiKtfz9vCIEODjQEx+FXGfbm9vpzioQubH9gnPuXY
         84wOtPoTkEgyJNizWcd6vmjOxgOcRWpiBjY9FnEkfApvkMYNdERkte+VQ9EMJ32cc132
         bk3Ow84pXlDUGGot9parROQCVpY9/d1Trh3jm4VMDRgBR0B20NLEoijNbZtAtsoTIhVi
         WyRlzs+Rh6cFxk/IHQYHSQWoHN0jKC/b7nRYo5RmAjqXeQ2TiXm7ulPNYMyTFhIpQ76e
         +Ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161468; x=1776766268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38LTr05+8iYcJzW86BlZq8b4Bp/Lne6b5dBfQnyZsEg=;
        b=TNSWrLrjz0LRbUgcjxqeqZH1p3s6SKWj0eyGk1LEaYohEoGjfv4AotbLHiY/UWjSQp
         5iMTtVYqCJV+G11GJInB8YkaIQY50vo3g7VRE3mUNz+4yOFH0F1QWn+SZnB5WmRlMHhH
         o6dj4EHlqTbjiWrMwIEZ2+Vhnt8D8tn7Om9TG41sJPixTKxI8cYXeiPd+tsKxkUg2VFQ
         lbsnxpkFNmHgyJtsR59I2EIus6UCITwv6a3s6IvlyHxQsXhyMfDtI3FAwU66RzbhddS5
         BtJPstLmQ3FpmY4L8eF9p1fCtZNnO0hSIoHPD5flpa0GQtWn2TX5jPcKrBwuTc523qGU
         m4kA==
X-Forwarded-Encrypted: i=1; AFNElJ/NirP/FmANqrT9YhkKaH5S+ZV4MYWGSA5ob2B2hDC4J7+53mqzSb7IGZ0gdVIxllZeyW69Ac0cup5Y74PWq96Kww==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtOOgKr3B/uAsbthEdRcSPZIWku6GuyHBE+NxuoZCV36tCA0Ch
	wKs/l1JcAwdsOfaWkIlDyph7ARceVFJ5eQbc/y6c6utatxmyyrJRs3d3wt/gfthOGd4JkSvYzPR
	YaFH5fx9VOpIiGBXd97ICHblLa0chJlw=
X-Gm-Gg: AeBDiesg5ADbbnGM1m4p+BOYxGKEOnM57yC1Loo3z5wm/wA1LCkJVRtk9Kl2XRRPD2g
	6WQq0Tvq8295ML9JF5tLsE0Rw6NVyUX91EY3tDaSvvAU/qTPs7aB/+JCTZZhRV7W34rNtGMRpia
	Mk3lM53ybDlJxJzzSF2Ja6NQ5CH9CqW/nKkf/KegSi6ABMWS+IWC9TOSnd9/UYCUsI8L4C3Zg6T
	urn09h6au2Q7iAIaL+2vlM2dbvPRnV7K3gBTEjnNVbntIKUIHg0Y1UrgJKZ03wbiiANfnY51+7U
	zCmmi32g
X-Received: by 2002:a17:907:981:b0:b9c:9dcb:36e8 with SMTP id
 a640c23a62f3a-b9d7294f263mr932218166b.53.1776161467351; Tue, 14 Apr 2026
 03:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260305110200.17834-1-pratik.farkase@est.tech>
 <20260318140356.7609-1-pratik.farkase@est.tech> <DH6KACIJTUKF.2I7WOQSMNY39E@bootlin.com>
 <VI6PPF734FBAD1FE9D4D1744B8CD242E774FE242@VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM>
 <AS1PR10MB5697E557D5CACB6216753B35FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DU2PPFB77F8FB199ADB8C70D1EF9FF0DF10FE242@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <DU2PPFB77F8FB199ADB8C70D1EF9FF0DF10FE242@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 14 Apr 2026 11:10:55 +0100
X-Gm-Features: AQROBzCY9zG-Z29gMJSotuZbsxMwu-UQNe5_PT20J2PdIQrzcrQJ21dFhet6elA
Message-ID: <CANPvuRmVm1CihjHVEbKekoqmc-WYo69i=WT1xtGBXe+G=70RHA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] go: add ptest support
To: pratik.farkase@est.tech
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Content-Type: multipart/alternative; boundary="000000000000534a4f064f68d1e7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 10:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235149

--000000000000534a4f064f68d1e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pratik,

Can you please rebase on the master tip that has the golang 1.26.2.

Jose

Pratik Farkase via lists.openembedded.org <pratik.farkase=3D
est.tech@lists.openembedded.org> escreveu (segunda, 13/04/2026 =C3=A0(s) 23=
:37):

> Hi Peter,
>
> Thanks for the suggestion to use QB_MEM override in core-image-ptest.bb!
> Great to have these multiconfig settings already which i was not aware of=
.
> I have sent a v5 patch after testing it locally. It will run full go
> testsuite and the total run time is around ~66 minutes.
>
> Attached the test results here along with qemu boot log.
>
> Best Regards,
> Pratik
>
> ________________________________________
> From: Marko, Peter <Peter.Marko@siemens.com>
> Sent: Monday, April 13, 2026 2:27 PM
> To: Pratik Farkase; Mathieu Dubois-Briand;
> openembedded-core@lists.openembedded.org
> Cc: pratik.farkase@ericsson.com
> Subject: RE: [OE-core][PATCH v3] go: add ptest support
>
> Hello Pratik,
>
> I think that better is to run the full testsuite and increase QB_MEM for
> virtclass-mcextend-go under
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/ima=
ges/core-image-ptest.bb#n36
>
> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Pratik Farkase
> > Sent: Monday, April 13, 2026 2:05 PM
> > To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>;
> openembedded-
> > core@lists.openembedded.org
> > Cc: pratik.farkase@ericsson.com
> > Subject: Re: [OE-core][PATCH v3] go: add ptest support
> >
> > Hi Mathieu,
> >
> > Apologies for getting back bit late and thanks for testing v3 and
> identifying the OOM
> > issue.
> >
> > The root cause is that Go's test suite performs on-the-fly compilation
> during
> > test execution. Even with the autobuilder's 1GB RAM (QB_MEM =3D '-m 102=
4'),
> > attempting all 253 stdlib packages causes OOM kills as compilation
> processes
> > consume ~1.5GB.
> >
> > For v4, I've switched to a curated subset of 17 core packages that
> complete
> > successfully within the 1GB constraint:
> >
> > Test results on qemux86-64 with 1GB RAM: 17/17 pass (100%) in ~6-7
> minutes.
> >
> > Best Regards,
> > Pratik
> >
> > ________________________________________
> > From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> > Sent: Thursday, March 19, 2026 7:57 AM
> > To: Pratik Farkase; openembedded-core@lists.openembedded.org
> > Cc: pratik.farkase@ericsson.com
> > Subject: Re: [OE-core][PATCH v3] go: add ptest support
> >
> > On Wed Mar 18, 2026 at 3:03 PM CET, Pratik Farkase wrote:
> > > Add ptest infrastructure to test the Go standard library.
> > >
> > > - Run 'go test -short std' via run-ptest script
> > > - Install source tree and pkg/include headers
> > > - Create VERSION file for architecture detection
> > > - Exclude multi-arch binary testdata to avoid QA errors
> > >
> > > Test results: 237/253 pass (93.7%) on qemux86-64.
> > >
> > > Known issues:
> > > - debug/elf, debug/pe, debug/plan9obj, internal/xcoff: missing binary
> testdata
> > > - time: requires embedded timezone data
> > > - net/http: requires unstripped go binary
> > > - testing, go/types: minor edge cases
> > >
> > > Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> > > ---
> > > Changes in v3:
> > > - Move go from PTESTS_FAST to PTESTS_SLOW (~45min runtime)
> > >   inside ptest-packagelists.inc
> > >
> > > Changes in v2:
> > > - Exclude .elf* files to fix QA arch errors on all architectures
> > > - Exclude *-x86-64* files to fix additional arch-specific test binari=
es
> > > - Tested on x86-64, x86, aarch64, and arm builds
> > > ---
> >
> > Hi Pratik,
> >
> > Thanks for the new version, but we still have some failures:
> >
> > WARNING: core-image-ptest-go-1.0-r0 do_testimage: There were failing
> ptests.
> > Traceback (most recent call last):
> >   File
> "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembedded-
> > core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File
> "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembedded-
> > core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File
> "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembedded-
> > core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File
> "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembedded-
> > core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in
> test_ptestrunner_expectfail
> >     self.do_ptestrunner()
> >     ~~~~~~~~~~~~~~~~~~~^^
> >   File
> "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembedded-
> > core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestrunner
> >     self.fail(failmsg)
> >     ~~~~~~~~~^^^^^^^^^
> > AssertionError: ERROR: Processes were killed by the OOM Killer:
> > [  132.843492] Out of memory: Killed process 769 (compile)
> total-vm:1553664kB,
> > anon-rss:256564kB, file-rss:0kB, shmem-rss:128kB, UID:0 pgtables:644kB
> > oom_score_adj:0
> >
> >
> > Failed ptests:
> > {'go': ['archive/tar',
> >         'archive/zip',
> >         'bufio',
> >         'bytes',
> >         'cmp',
> >         'compress/bzip2',
> >         'compress
> >         ...
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3319
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3294
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1277
> >
> > Thanks,
> > Mathieu
> >
> > --
> > Mathieu Dubois-Briand, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235132):
> https://lists.openembedded.org/g/openembedded-core/message/235132
> Mute This Topic: https://lists.openembedded.org/mt/118383123/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000534a4f064f68d1e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Pratik,<br><br></div>=
<div>Can you please rebase on the master tip that has the golang 1.26.2.<di=
v><br></div><div>Jose<br></div></div></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Pratik Farkase v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;pratik.farkase=3D<a href=3D"mailto:est.tech@lists.openembedded.org">est.te=
ch@lists.openembedded.org</a>&gt; escreveu (segunda, 13/04/2026 =C3=A0(s) 2=
3:37):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Peter,=
<br>
<br>
Thanks for the suggestion to use QB_MEM override in <a href=3D"http://core-=
image-ptest.bb" rel=3D"noreferrer" target=3D"_blank">core-image-ptest.bb</a=
>! Great to have these multiconfig settings already which i was not aware o=
f. I have sent a v5 patch after testing it locally. It will run full go tes=
tsuite and the total run time is around ~66 minutes.<br>
<br>
Attached the test results here along with qemu boot log.<br>
<br>
Best Regards,<br>
Pratik<br>
<br>
________________________________________<br>
From: Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com" target=3D=
"_blank">Peter.Marko@siemens.com</a>&gt;<br>
Sent: Monday, April 13, 2026 2:27 PM<br>
To: Pratik Farkase; Mathieu Dubois-Briand; <a href=3D"mailto:openembedded-c=
ore@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.opene=
mbedded.org</a><br>
Cc: <a href=3D"mailto:pratik.farkase@ericsson.com" target=3D"_blank">pratik=
.farkase@ericsson.com</a><br>
Subject: RE: [OE-core][PATCH v3] go: add ptest support<br>
<br>
Hello Pratik,<br>
<br>
I think that better is to run the full testsuite and increase QB_MEM for vi=
rtclass-mcextend-go under<br>
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-core/images/core-image-ptest.bb#n36" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/image=
s/core-image-ptest.bb#n36</a><br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Pratik Farkase<br>
&gt; Sent: Monday, April 13, 2026 2:05 PM<br>
&gt; To: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@=
bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt;; o=
penembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a><br>
&gt; Cc: <a href=3D"mailto:pratik.farkase@ericsson.com" target=3D"_blank">p=
ratik.farkase@ericsson.com</a><br>
&gt; Subject: Re: [OE-core][PATCH v3] go: add ptest support<br>
&gt;<br>
&gt; Hi Mathieu,<br>
&gt;<br>
&gt; Apologies for getting back bit late and thanks for testing v3 and iden=
tifying the OOM<br>
&gt; issue.<br>
&gt;<br>
&gt; The root cause is that Go&#39;s test suite performs on-the-fly compila=
tion during<br>
&gt; test execution. Even with the autobuilder&#39;s 1GB RAM (QB_MEM =3D &#=
39;-m 1024&#39;),<br>
&gt; attempting all 253 stdlib packages causes OOM kills as compilation pro=
cesses<br>
&gt; consume ~1.5GB.<br>
&gt;<br>
&gt; For v4, I&#39;ve switched to a curated subset of 17 core packages that=
 complete<br>
&gt; successfully within the 1GB constraint:<br>
&gt;<br>
&gt; Test results on qemux86-64 with 1GB RAM: 17/17 pass (100%) in ~6-7 min=
utes.<br>
&gt;<br>
&gt; Best Regards,<br>
&gt; Pratik<br>
&gt;<br>
&gt; ________________________________________<br>
&gt; From: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-brian=
d@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt;<=
br>
&gt; Sent: Thursday, March 19, 2026 7:57 AM<br>
&gt; To: Pratik Farkase; <a href=3D"mailto:openembedded-core@lists.openembe=
dded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br=
>
&gt; Cc: <a href=3D"mailto:pratik.farkase@ericsson.com" target=3D"_blank">p=
ratik.farkase@ericsson.com</a><br>
&gt; Subject: Re: [OE-core][PATCH v3] go: add ptest support<br>
&gt;<br>
&gt; On Wed Mar 18, 2026 at 3:03 PM CET, Pratik Farkase wrote:<br>
&gt; &gt; Add ptest infrastructure to test the Go standard library.<br>
&gt; &gt;<br>
&gt; &gt; - Run &#39;go test -short std&#39; via run-ptest script<br>
&gt; &gt; - Install source tree and pkg/include headers<br>
&gt; &gt; - Create VERSION file for architecture detection<br>
&gt; &gt; - Exclude multi-arch binary testdata to avoid QA errors<br>
&gt; &gt;<br>
&gt; &gt; Test results: 237/253 pass (93.7%) on qemux86-64.<br>
&gt; &gt;<br>
&gt; &gt; Known issues:<br>
&gt; &gt; - debug/elf, debug/pe, debug/plan9obj, internal/xcoff: missing bi=
nary testdata<br>
&gt; &gt; - time: requires embedded timezone data<br>
&gt; &gt; - net/http: requires unstripped go binary<br>
&gt; &gt; - testing, go/types: minor edge cases<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Pratik Farkase &lt;pratik.farkase@est.tech&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; Changes in v3:<br>
&gt; &gt; - Move go from PTESTS_FAST to PTESTS_SLOW (~45min runtime)<br>
&gt; &gt;=C2=A0 =C2=A0inside ptest-packagelists.inc<br>
&gt; &gt;<br>
&gt; &gt; Changes in v2:<br>
&gt; &gt; - Exclude .elf* files to fix QA arch errors on all architectures<=
br>
&gt; &gt; - Exclude *-x86-64* files to fix additional arch-specific test bi=
naries<br>
&gt; &gt; - Tested on x86-64, x86, aarch64, and arm builds<br>
&gt; &gt; ---<br>
&gt;<br>
&gt; Hi Pratik,<br>
&gt;<br>
&gt; Thanks for the new version, but we still have some failures:<br>
&gt;<br>
&gt; WARNING: core-image-ptest-go-1.0-r0 do_testimage: There were failing p=
tests.<br>
&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/qemux86-64-ptest/bu=
ild/layers/openembedded-<br>
&gt; core/meta/lib/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapp=
ed_f<br>
&gt;=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
&gt;=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/qemux86-64-ptest/bu=
ild/layers/openembedded-<br>
&gt; core/meta/lib/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapp=
ed_f<br>
&gt;=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
&gt;=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/qemux86-64-ptest/bu=
ild/layers/openembedded-<br>
&gt; core/meta/lib/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapp=
ed_f<br>
&gt;=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
&gt;=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/qemux86-64-ptest/bu=
ild/layers/openembedded-<br>
&gt; core/meta/lib/oeqa/runtime/cases/ptest.py&quot;, line 27, in test_ptes=
trunner_expectfail<br>
&gt;=C2=A0 =C2=A0 =C2=A0self.do_ptestrunner()<br>
&gt;=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~~~^^<br>
&gt;=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/qemux86-64-ptest/bu=
ild/layers/openembedded-<br>
&gt; core/meta/lib/oeqa/runtime/cases/ptest.py&quot;, line 121, in do_ptest=
runner<br>
&gt;=C2=A0 =C2=A0 =C2=A0self.fail(failmsg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0~~~~~~~~~^^^^^^^^^<br>
&gt; AssertionError: ERROR: Processes were killed by the OOM Killer:<br>
&gt; [=C2=A0 132.843492] Out of memory: Killed process 769 (compile) total-=
vm:1553664kB,<br>
&gt; anon-rss:256564kB, file-rss:0kB, shmem-rss:128kB, UID:0 pgtables:644kB=
<br>
&gt; oom_score_adj:0<br>
&gt;<br>
&gt;<br>
&gt; Failed ptests:<br>
&gt; {&#39;go&#39;: [&#39;archive/tar&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;archive/zip&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bufio&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bytes&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;cmp&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;compress/bzip2&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;compress<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73=
/builds/3319" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/73/builds/3319</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61=
/builds/3294" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/61/builds/3294</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/56=
/builds/1277" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/56/builds/1277</a><br>
&gt;<br>
&gt; Thanks,<br>
&gt; Mathieu<br>
&gt;<br>
&gt; --<br>
&gt; Mathieu Dubois-Briand, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#235132): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/235132" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/235132</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118383123/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118383123/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000534a4f064f68d1e7--

