Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194EEE6401A
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:04:07 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34026.1775390646691142872
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MvWfLTGH;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8d7e7f48499so3020285a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775390646; x=1775995446; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SzaS4OxXiByRdDRSkGCbT6sDGGEH4nqg0+s73rETOGU=;
        b=MvWfLTGHzncS4rx3KeuRLxdkX+SXZ+WSnVClS2hmcxJH6gXLsnHYL3vDM1jOFgz79l
         wajnDE+1bsLiP56HmeRQXubj6Z6I37bgtRTio4qfvHTjyylTXtecTErMgyaTkGoIh0r8
         /d2GoGsFGGbXTzuQXfQHkHboHVCZ34Dsr1uSAhhX99AoucJFxYc5CrN5II7WG/x8JjRS
         yAElvm19qg64WoPbfAJgDidzS35HFRFJxJ7dHBvf31NddNh8po2bkHD4aKtGRg1/rWtZ
         QVU9S4XkFi76wCaMpE3cU2MHkcA08n959mUmJqnw8/yNxx0h3ZwwI8Kp5qsiMTfoDGza
         m4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775390646; x=1775995446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzaS4OxXiByRdDRSkGCbT6sDGGEH4nqg0+s73rETOGU=;
        b=suno84TPtunzMUFoy+b0hkupnNwgG9rc29SzAlY9BNw2PmqNTXMzWc9QNsax7uYuWj
         C8e8mY+ZWI/SYb2fbKM3CpmiDVmnxq9vE0gX4s8Pb+zigG0VnHaSO66XafEVyOBD4b3v
         Ze8CTEBfJv9G9Tt3lF13+f7G7V032e0Y1RjYIkIUh6c4rf7FcQ4d3F6dBl5f3bw3+CJI
         BWqxIl4SmYYoOTCaMn3XqkHNylBKjtO8dBrPVOApgLGwuGpadAKjU3BfbRMZHwAo1VSP
         8vsnz/QTnh991YgXFjqPh3rrkRrle4A09uSc3rbG2DaXspaydy5AbBvDj0t5lU/O8EKU
         7EOw==
X-Gm-Message-State: AOJu0YzOXgCaxKPt/33oSiDTApSdEuEIZ9M8BgvEtdriGuehymauqDmL
	GdfNCbD7OtvJBiqjiT9zHHm4beIhc3IBl8uIJ6K+omtqnwEZnZiq9v6/
X-Gm-Gg: AeBDieuAAmZGeIHqy4PKVoZNQf3Z6QrKy94VoQOHFEiJLuqhEDaJ8LpofPmPIuU5/zb
	Pc3qaOQxWSeyqsXOgzeQzsGPmlif2LOzvqEkFbRxXZtTslVhRIwD+BlgmJQPyetnnkPxXkX3D16
	T1nCRziMKhZa+GbSyezj7Z8TGHD09pDFr2jg+yijKRdhAVNeE1mWVxZlGizWCDp9GM7sMrenNEd
	fzfwcl7U7LP2Vlou22uqIJXviIvKsxZxWgpAoduM2yw0LHILhR5u4ivd29VxkLOqnIvUxMGM47G
	+/VN4YPMmebes8/Qt24ANl6YYJBiRa7BYAiqNeNHdbvVQuquEkFxhtPpFDOU98LBBx6QRh8VbFA
	hO8lsDmnQaDAsomHTbTxqi3GfUzCqclTo5GHkum+mgi2Cd7tg1OCjsjaPX/hRD6mdogJfw0ptNA
	Lk15nIf9kTbdj8uJmQ2zoxLatM4/84rOl2kybUcjPwugAPx4E1HPwoaY6Yd2aEndkPbtDJT/GXD
	Duy
X-Received: by 2002:a05:620a:7112:b0:8d3:ccef:b2c6 with SMTP id af79cd13be357-8d41c6b0eedmr1349323185a.24.1775390645462;
        Sun, 05 Apr 2026 05:04:05 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d3edb58da6sm626704185a.8.2026.04.05.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:04:04 -0700 (PDT)
Date: Sun, 5 Apr 2026 08:04:02 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
Message-ID: <adJPst82O73CdC9P@localhost.localdomain>
References: <20260403183541.2631883-1-twoerner@gmail.com>
 <20260403183541.2631883-5-twoerner@gmail.com>
 <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
 <adA94CgwRzIvBl1R@localhost.localdomain>
 <c15be3d11d7381e0be75e56340dc985628ba513a.camel@linuxfoundation.org>
 <adEyY7c8FLpJPNkc@localhost.localdomain>
 <f366155401c254d33792e00d0f6b60b81ed34d8b.camel@linuxfoundation.org>
 <adF2qsDHX3SzWqzy@localhost.localdomain>
 <889c5788a6c49ddf77b22859b7d82014c75ecb98.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <889c5788a6c49ddf77b22859b7d82014c75ecb98.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 12:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234626

On Sun 2026-04-05 @ 10:17:40 AM, Richard Purdie wrote:
> On Sat, 2026-04-04 at 16:38 -0400, Trevor Woerner wrote:
> > On Sat 2026-04-04 @ 07:36:05 PM, Richard Purdie wrote:
> > > On Sat, 2026-04-04 at 11:46 -0400, Trevor Woerner wrote:
> > > > On Sat 2026-04-04 @ 08:27:13 AM, Richard Purdie wrote:
> > > > 
> > > > I'm only guessing here, but it looks like someone wrote "wic create" to
> > > > run two different ways: with the wks file specified with or without the
> > > > ".wks" extension.
> > > > 
> > > > If ".wks" is not given (e.g. "wic create directdisk-gpt ...", which is
> > > > what occurs in the oe-selftest tests, i.e. when wic is run independently
> > > > without being part of a bitbake build) then wic invokes its own search
> > > > algorithm to try to find the wks file using BBLAYERS and script_dir. In
> > > > this case the wks file is specified without the ".wks" and no path
> > > > information is given on the cmdline. It is up to wic to find the actual
> > > > wks file itself.
> > > > 
> > > > If the ".wks" is included (which is what happens when wic is called as
> > > > part of a bitbake build and therefore the image_types_wic.bbclass is
> > > > used) then the class adds the ".wks" at the end, and also gives wic the
> > > > path to the wks file which it finds using WKS_SEARCH_PATH which is based
> > > > on BBPATH and COREBASE.
> > > > 
> > > > Assuming the persona of someone who wants to use this new, independent
> > > > wic tool, and who knows nothing about The Yocto Project or bitbake, I
> > > > think having wic look in "magical" places for the wks file would be hard
> > > > to understand and surprising. As an independent tool I think the user
> > > > should provide the path to the actual wks file (with the ".wks"
> > > > extension) and if that file can't be found as specified on the cmdline,
> > > > wic should simply fail with an error.
> > > > 
> > > > As part of making wic an independent tool, I think wic's code to search
> > > > for a wks file if the ".wks" is not provided should be removed. This
> > > > means that, as part of the transition, I would have to modify each "wic
> > > > create" test in oe-core's oe-selftests. I'm fine with that. That could
> > > > be done cleanly if I write a little function to find the wks file in
> > > > the wic.py oe-selftest itself using the same logic as is used in the
> > > > image_types_wic.bbclass.
> > > > 
> > > > To summarize: in my opinion, wic shouldn't have search logic. From wic's
> > > > point of view the wks file should be specified on the cmdline in a way
> > > > that wic will find the file the user wants to use (or not find it).
> > > > The oe-selftests should be updated to use the same search logic from
> > > > the image_types_wic.bbclass so that when it invokes "wic create" it is
> > > > providing wic with the path to a wks file that has a ".wks" extension
> > > > (which is how bitbake invokes wic) instead of specifying a bare wks file
> > > > and hoping wic will find it.
> > > > 
> > > > I'm happy to add "files/wic" as another location for
> > > > image_types_wic.bbclass to search for wks files.
> > > 
> > > I guess the first question is are we going to take this for wrynose or
> > > not? I'm not particularly happy with the files a top level wic
> > > directory, I think it needs to be meta/files/wic. To make that work, we
> > > need to tweak the search paths in wic and in image_types_wic.bbclass.
> > > If we can resolve that issue, we're probably good to move forward with
> > > merging.
> > > 
> > > I agree that the search path logic should be tidied up. Whether you can
> > > provide a search path to wic or whether that has to be done in metadata
> > > is an open question. I do see your perspective, equally, if you are
> > > using wic within OE, having some search knowledge may be ok. I would
> > > want to see it basically using files/wic from BBPATH  with everything
> > > else removed. There is a question of how you warn users about old
> > > paths. This piece is too late for the release though.
> > > 
> > > So I'd propose we add files/wic to the search path, move the files
> > > there and that lets us at least get some of the changes into the
> > > release?
> > 
> > Sounds perfect, thanks!
> 
> Since we're running out of time and I really don't want to have to
> think about this too much more/again, I've:
> 
> * written a patch to add files/wic as a search path in wic
> * written a patch to add files/wic as a search path in the class
> * dropped wic and the canned-wks paths in wic
> * dropped wic and the canned-wks paths in the class
> * converted wic to use BBPATH instead of BBLAYERS
> * added a sanity test to detect the old paths and error
> * pushed a contrib/rpurdie branch into the wic repo with the patches
> 
> This is going to mean people have to update layers to use "files/wic"
> but we can clearly tell people they need to do it. If we went with
> either of the other locations and changed BBLAYERS -> BBPATH, there
> could be corner cases we miss in the detection.
> 
> Autobuilder testing shows this will break a few layers but it is a
> clear error which people can easily fix.
> 
> How does that look to people?

Sounds great to me!

Presumably we will move the contrib/rpurdie branch to master in
git.yoctoproject.org/wic and the SRC_URI of the wic recipe in oe-core
will need a tweak before making it official?


> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 

