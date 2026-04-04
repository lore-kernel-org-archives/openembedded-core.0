Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7D4E7E34C
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 15:46:48 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18773.1775317607450112863
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 08:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CCBqueAb;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8a56ca653ceso27751456d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775317606; x=1775922406; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NsC0Xe6ClVCpuJDqRtJ6MOrNt31GxHkSWJbalqw8P7I=;
        b=CCBqueAbUECPO/CpKD4Vlw0MgAgvi+EKS2s6Mono1BrWCWUZEk8U0wtsCaJ+D4F3Fd
         T18tymX127O9IWmiCHKLlpU9L6hXIIVtEBfTrjYqZhSsVvFDeoc6J3TEgRzwejgA2ft5
         sd3LFC+w+yB8FNwwtwimQ3+5iFB5/vQb6bu2tttgdkyh0RSBKPONtTB+SMjiVViO8gC1
         z6/BLvm1PzyRM2LGKp5NAu/TUyxXp/tN1Z6nkZpdP1OMQhzeZtwl+kB0pmK0dwq4s4vn
         BhP5+DaqML25CEbSZcyChed9kDC0IUT43dyV+Cht280lYDyHMQ6S9aHGwMKiFxvzvjzj
         +leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775317606; x=1775922406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsC0Xe6ClVCpuJDqRtJ6MOrNt31GxHkSWJbalqw8P7I=;
        b=q+RD0FKvOII875x018Tgx220QH5txtHEZIQJ1pqToSIKKZQKk/vVF+o6s4FO5TiWiA
         NeUeqySTkDHxCrSsmXYAdqzOEQcOMh3DfHjNo6ECdFb5feYqqxr+B1GBpcIn7VfigF4k
         hJlyRgp011qZP0wKDISGJfwp3/TO/SuiQSBoJkKLEely5pwA7qsHKXQl5p6AvxMba672
         STRB1owXiCPE+Vzs1UTgqB7FL/Ydej3scR7UeG4pVnXE9+rkZ6CWLtSL/4c9tjODV5KI
         qPs/RBUbfUE1kyxegjb5hZ7frcf1ZFabEQHRH7r8rPeoBvUylJdcY+VYLCZmCvov4qhG
         fGYA==
X-Gm-Message-State: AOJu0YxdbhOaf8IBe9sx5qUiIvG7rYHeJgvdCS9MivtEEFZsSaQ/GvrG
	z37O0p25i3Fk/kO2GxDt19vW03SIseGiNzhtxgrW3fucNlFpt2eNKTrk
X-Gm-Gg: AeBDievNLGInLEN6g9J9E/FxyG9ewRP2lnvmh+Z+4Sc+0sWe5sbjbUhyKjOa0Ff3Lqg
	F8wMU4Xxi4ASPm7+iwBIOQL0br0ndcj1i6ZdEm1VphsLl0bWGAngw0l708SGAtDnDjqPYVJyi0o
	FtYR/1jIin8bqCu9zfPtmWZJU66tYEeAWRsIl/aqh7weYdo4FVPrRGz6g1eIM2MqBuxXsD3qHz+
	4fC/yJ9cTXBPojX74q/qEqZxjQqqQZCPe1Tk0m1YBz9fNa4xAPcXAHYNcFT5/uIhpRnafIA5IsU
	LrvRDrVJ+FeHowffYrSK8Qf68XDObjxY6T+osX4qTITmozSfDo+TnZAEZTXED2lJL3HeWuQNnU3
	6p9e+V6VVvV5gEG6lDx5YMi6Mwqg9ANOVyjGuaS9R5azjvuC3EhRmEBTjuUHUkLykEIe40lzs0K
	5NHtNnjx8Jpg/5zQadzOYsYmL90YusC0YqbQEx8luancouR4EOjudMBrCyDqH6A0P8SQ==
X-Received: by 2002:a05:6214:4c8b:b0:89a:116b:e67c with SMTP id 6a1803df08f44-8a83ba60ecdmr55946926d6.45.1775317606327;
        Sat, 04 Apr 2026 08:46:46 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596e03dc6sm87299016d6.34.2026.04.04.08.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 08:46:45 -0700 (PDT)
Date: Sat, 4 Apr 2026 11:46:43 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
Message-ID: <adEyY7c8FLpJPNkc@localhost.localdomain>
References: <20260403183541.2631883-1-twoerner@gmail.com>
 <20260403183541.2631883-5-twoerner@gmail.com>
 <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
 <adA94CgwRzIvBl1R@localhost.localdomain>
 <c15be3d11d7381e0be75e56340dc985628ba513a.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c15be3d11d7381e0be75e56340dc985628ba513a.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 15:46:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234613

On Sat 2026-04-04 @ 08:27:13 AM, Richard Purdie wrote:
> On Fri, 2026-04-03 at 18:23 -0400, Trevor Woerner wrote:
> > On Fri 2026-04-03 @ 10:13:00 PM, Richard Purdie wrote:
> > > On Fri, 2026-04-03 at 14:35 -0400, Trevor Woerner via lists.openembedded.org wrote:
> > > > When "wic create ..." is invoked with a bare *wks name (i.e. without the
> > > > `.wks` extension), wic calls engine.py:find_canned_images() to find the
> > > > fully qualified *wks file. This function searches every directory formed by:
> > > >     - permutating all BBLAYERS with `/wic`
> > > >     - permutating all BBLAYERS with `/scripts/lib/wic/canned-wks`
> > > >     - checking `<scripts_path>/lib/wic/canned-wks`
> > > > Where `<scripts_path>` is the directory containing the wic program.
> > > 
> > > It doesn't. I just looked at the code and it uses BBPATH. That can be
> > > similar to BBLAYERS but it is different and the commit messages really
> > > should refer to BBPATH.
> > 
> > In the oe-selftest wic tests, most of the "wic create ..." commands
> > are called with bare *wks files (i.e. *wks files without the `.wks`
> > extension). When this happens, as "wic create..." is called, it starts
> > by running the code found here:
> > 
> > 	https://git.openembedded.org/openembedded-core/tree/scripts/wic#n206
> > 
> > which calls:
> > 
> > 	https://git.openembedded.org/openembedded-core/tree/scripts/lib/wic/engine.py#n46
> > 
> > which follows the algorithm that I have described above.
> > 
> > So for the oe-selftests to pass I wanted to move them.
> 
> You are right, it is using BBLAYERS. This is very confusing since the
> wks files are using BBPATH, which is similar but subtly different. 
> 
> Is there any reason it can't use BBPATH to match?
> 
> I agree the files need to move but I'd like them to end up in
> meta/files/wic, not meta/wic. Whilst it complicates the migration a
> little, I think it would be best to move them once and get them into
> the right place.
> 
> The questions are then firstly, how to do that simply, then secondly,
> how to clean up the rest of this (and when to do that).
> 
> Adding files/wic into the search path is trivial. Deprecating the
> existing search paths with appropriate warnings is a bit trickier and
> there is the question of when we should do that, before or after the
> current release. "after" would seem more obvious, but it will mean two
> different behaviours before and after release and with a standalone
> tool, this does become harder.

I'm only guessing here, but it looks like someone wrote "wic create" to
run two different ways: with the wks file specified with or without the
".wks" extension.

If ".wks" is not given (e.g. "wic create directdisk-gpt ...", which is
what occurs in the oe-selftest tests, i.e. when wic is run independently
without being part of a bitbake build) then wic invokes its own search
algorithm to try to find the wks file using BBLAYERS and script_dir. In
this case the wks file is specified without the ".wks" and no path
information is given on the cmdline. It is up to wic to find the actual
wks file itself.

If the ".wks" is included (which is what happens when wic is called as
part of a bitbake build and therefore the image_types_wic.bbclass is
used) then the class adds the ".wks" at the end, and also gives wic the
path to the wks file which it finds using WKS_SEARCH_PATH which is based
on BBPATH and COREBASE.

Assuming the persona of someone who wants to use this new, independent
wic tool, and who knows nothing about The Yocto Project or bitbake, I
think having wic look in "magical" places for the wks file would be hard
to understand and surprising. As an independent tool I think the user
should provide the path to the actual wks file (with the ".wks"
extension) and if that file can't be found as specified on the cmdline,
wic should simply fail with an error.

As part of making wic an independent tool, I think wic's code to search
for a wks file if the ".wks" is not provided should be removed. This
means that, as part of the transition, I would have to modify each "wic
create" test in oe-core's oe-selftests. I'm fine with that. That could
be done cleanly if I write a little function to find the wks file in
the wic.py oe-selftest itself using the same logic as is used in the
image_types_wic.bbclass.

To summarize: in my opinion, wic shouldn't have search logic. From wic's
point of view the wks file should be specified on the cmdline in a way
that wic will find the file the user wants to use (or not find it).
The oe-selftests should be updated to use the same search logic from
the image_types_wic.bbclass so that when it invokes "wic create" it is
providing wic with the path to a wks file that has a ".wks" extension
(which is how bitbake invokes wic) instead of specifying a bare wks file
and hoping wic will find it.

I'm happy to add "files/wic" as another location for
image_types_wic.bbclass to search for wks files.

> > > I don't understand why these need to move given WKS_SEARCH_PATH remains
> > > unchanged, unless wic is going to ignore WKS_SEARCH_PATH going forward?
> > 
> > As an independent tool, these *wks files are rather oe-core-specific,
> > so I thought they should stay with the oe-core/meta layer, the same way
> > that, say, raspberry pi-specific *wks files stay in the raspberry pi
> > layer.
> > 
> > My first thought was to remove them from the standalone wic repository
> > altogether, but then decided I could keep them as examples.
> > 
> > I thought it would be dangerous to leave them in the wic source
> > tree where the above algorithm could find them. If I leave them in
> > src/wic/canned-wks, someone uses the tool and creates a *wks file with a
> > similar name to one of the canned-wks files, but they have a typo and
> > the canned one gets used instead of theirs...
> > 
> > ...maybe I'm overthinking it?
> 
> It is definitely dangerous to leave them in the search paths so I agree
> with that. The files do belong in OE-Core too. It is still a little
> dangerous having files lying around which have the same names as the
> ones in core since this kind of duplication still can confuse people
> when they edit the wrong file. We have bigger issues I guess but some
> renaming of the examples might help.
> 
> Cheers,
> 
> Richard
> 
> 

