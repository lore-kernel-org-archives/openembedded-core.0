Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB63FE63FF9
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 20:38:09 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23852.1775335086741009230
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 13:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R+4h/QVr;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8d65f4073bfso64900285a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 13:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775335086; x=1775939886; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pQcdW5E3yYb8/2tiHuAAntiRUyY2fbBaGfnflbG3gek=;
        b=R+4h/QVrEIy0ppEflRVU70MD89CxB5jPLE4pdMgqwDsi+bH0DXYVCYw2KdTNEq1i2f
         +UkMFSPWsFrgiQNh5Af/ElPzoUX5+edetxh+p4ZyP52WiGDD+Euq/R540wSsmIweXyZB
         jlpSZSOYDZcVDACkBLp8MFTh1TA7JmN6j461yEUbi8vaX7F24MoRpV8wWbMnEu1W3T2C
         bjIyySUxyFMrpkrd19hjKz/2IJG9MLBCRxxnpLkdzZIqs1u63eB9O1a/nAcoXdm4Vs9K
         4fXc5sFldrGgza18l43AHBy13k9nuvzz9ockx9+Xt5SQ3BMauWifLpuknbXcUeiweoeQ
         ToAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775335086; x=1775939886;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQcdW5E3yYb8/2tiHuAAntiRUyY2fbBaGfnflbG3gek=;
        b=nOjN1CqB1F+6aCMWgEp651PChCswH3O5qdZcYC0cWYimF8Cj9Uk70sh465CyuuucG/
         Vs9+wpBJ66q+8YZg/0d6AcXm9mw8bBJjceT2Xlt+D/78M3f/xXdae9dGUjtYtgjaA/kn
         M3qDI+DCRNV34c/vspS7aOB0+ppJn7qO2nINFo662JeTYJEk6KFWujeHyNqbrePBxd1k
         54RYE+B71tdhStVy1+dFGpuDO3s02K6kUhUrWkq4+3LwgOkmgn18nVKFcQ164swrYlc0
         qTKhrFbUfF/rzF0jg0FG8fLmhrsj2VkwocpZ/SQPUOEODV5y/Wg5DV0Ww0u4xWCiDUv5
         oVEQ==
X-Gm-Message-State: AOJu0YzPssYQgmLI7kGuCBopas/neBiiprTrHkoQF259SFVaW+JXXPty
	Obvga0e49urt7LKecSuBDoqivyg6qjA/PX29mCKez4Ve3ZtfSQqzTWoT
X-Gm-Gg: AeBDieu/Mb04sA3MKQ2SQqB5WDrqW/2JZc0F2MrbzHCPdJ05Yg/vxSWmdCgO/9Qqyzc
	I7qBbwcG8IdsqU76B1Wz8fc6ScvAkUJZyL+0chxJYLQmA8jaU/PIOvRoSY6NgjZW/XSrN34hhK5
	Vpzs3UtR6PreAQGYAlDXGkv442O60lAmcj0gUuBqdNhAEF0m9zMr6UFdiRqYJ4Gv0pqAvnIav1T
	HhzJVwJsGfAGlcBLYgtdp90iZb9oVOaOopFji4bAOh31uD5hBJykllvcc1UDPf0/b3LXyw/IpQV
	G4xE8zUSe0XZgoVZZ8sz3+4wGVy6Zsn/oEw+bYsKbfN1NnCfCMYJxBrp9aqH2m9Hh6LzBuaxSsp
	U3XLBlGYLQ61z7WSdML2A1wRG9TTHQ2ziP50oalcV91sSRmbzhFBdwi32uIdb4pAAsrBNHjgrd4
	iVo43o8dbcvCZeg1AK86YWHC5wFeVU27QL/XfV7WH2JtF4GD9ZW5DLBrnWLWznCLIdROBK89mzl
	WwL
X-Received: by 2002:a05:620a:298f:b0:8cf:d9a8:561b with SMTP id af79cd13be357-8d4151e5623mr1079835185a.0.1775335085683;
        Sat, 04 Apr 2026 13:38:05 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d5ce92c4d3sm173824585a.44.2026.04.04.13.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 13:38:04 -0700 (PDT)
Date: Sat, 4 Apr 2026 16:38:02 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
Message-ID: <adF2qsDHX3SzWqzy@localhost.localdomain>
References: <20260403183541.2631883-1-twoerner@gmail.com>
 <20260403183541.2631883-5-twoerner@gmail.com>
 <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
 <adA94CgwRzIvBl1R@localhost.localdomain>
 <c15be3d11d7381e0be75e56340dc985628ba513a.camel@linuxfoundation.org>
 <adEyY7c8FLpJPNkc@localhost.localdomain>
 <f366155401c254d33792e00d0f6b60b81ed34d8b.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f366155401c254d33792e00d0f6b60b81ed34d8b.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 20:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234620

On Sat 2026-04-04 @ 07:36:05 PM, Richard Purdie wrote:
> On Sat, 2026-04-04 at 11:46 -0400, Trevor Woerner wrote:
> > On Sat 2026-04-04 @ 08:27:13 AM, Richard Purdie wrote:
> > > On Fri, 2026-04-03 at 18:23 -0400, Trevor Woerner wrote:
> > > > On Fri 2026-04-03 @ 10:13:00 PM, Richard Purdie wrote:
> > > > > On Fri, 2026-04-03 at 14:35 -0400, Trevor Woerner via lists.openembedded.org wrote:
> > > > > > When "wic create ..." is invoked with a bare *wks name (i.e. without the
> > > > > > `.wks` extension), wic calls engine.py:find_canned_images() to find the
> > > > > > fully qualified *wks file. This function searches every directory formed by:
> > > > > >     - permutating all BBLAYERS with `/wic`
> > > > > >     - permutating all BBLAYERS with `/scripts/lib/wic/canned-wks`
> > > > > >     - checking `<scripts_path>/lib/wic/canned-wks`
> > > > > > Where `<scripts_path>` is the directory containing the wic program.
> > > > > 
> > > > > It doesn't. I just looked at the code and it uses BBPATH. That can be
> > > > > similar to BBLAYERS but it is different and the commit messages really
> > > > > should refer to BBPATH.
> > > > 
> > > > In the oe-selftest wic tests, most of the "wic create ..." commands
> > > > are called with bare *wks files (i.e. *wks files without the `.wks`
> > > > extension). When this happens, as "wic create..." is called, it starts
> > > > by running the code found here:
> > > > 
> > > > 	https://git.openembedded.org/openembedded-core/tree/scripts/wic#n206
> > > > 
> > > > which calls:
> > > > 
> > > > 	https://git.openembedded.org/openembedded-core/tree/scripts/lib/wic/engine.py#n46
> > > > 
> > > > which follows the algorithm that I have described above.
> > > > 
> > > > So for the oe-selftests to pass I wanted to move them.
> > > 
> > > You are right, it is using BBLAYERS. This is very confusing since the
> > > wks files are using BBPATH, which is similar but subtly different. 
> > > 
> > > Is there any reason it can't use BBPATH to match?
> > > 
> > > I agree the files need to move but I'd like them to end up in
> > > meta/files/wic, not meta/wic. Whilst it complicates the migration a
> > > little, I think it would be best to move them once and get them into
> > > the right place.
> > > 
> > > The questions are then firstly, how to do that simply, then secondly,
> > > how to clean up the rest of this (and when to do that).
> > > 
> > > Adding files/wic into the search path is trivial. Deprecating the
> > > existing search paths with appropriate warnings is a bit trickier and
> > > there is the question of when we should do that, before or after the
> > > current release. "after" would seem more obvious, but it will mean two
> > > different behaviours before and after release and with a standalone
> > > tool, this does become harder.
> > 
> > I'm only guessing here, but it looks like someone wrote "wic create" to
> > run two different ways: with the wks file specified with or without the
> > ".wks" extension.
> > 
> > If ".wks" is not given (e.g. "wic create directdisk-gpt ...", which is
> > what occurs in the oe-selftest tests, i.e. when wic is run independently
> > without being part of a bitbake build) then wic invokes its own search
> > algorithm to try to find the wks file using BBLAYERS and script_dir. In
> > this case the wks file is specified without the ".wks" and no path
> > information is given on the cmdline. It is up to wic to find the actual
> > wks file itself.
> > 
> > If the ".wks" is included (which is what happens when wic is called as
> > part of a bitbake build and therefore the image_types_wic.bbclass is
> > used) then the class adds the ".wks" at the end, and also gives wic the
> > path to the wks file which it finds using WKS_SEARCH_PATH which is based
> > on BBPATH and COREBASE.
> > 
> > Assuming the persona of someone who wants to use this new, independent
> > wic tool, and who knows nothing about The Yocto Project or bitbake, I
> > think having wic look in "magical" places for the wks file would be hard
> > to understand and surprising. As an independent tool I think the user
> > should provide the path to the actual wks file (with the ".wks"
> > extension) and if that file can't be found as specified on the cmdline,
> > wic should simply fail with an error.
> > 
> > As part of making wic an independent tool, I think wic's code to search
> > for a wks file if the ".wks" is not provided should be removed. This
> > means that, as part of the transition, I would have to modify each "wic
> > create" test in oe-core's oe-selftests. I'm fine with that. That could
> > be done cleanly if I write a little function to find the wks file in
> > the wic.py oe-selftest itself using the same logic as is used in the
> > image_types_wic.bbclass.
> > 
> > To summarize: in my opinion, wic shouldn't have search logic. From wic's
> > point of view the wks file should be specified on the cmdline in a way
> > that wic will find the file the user wants to use (or not find it).
> > The oe-selftests should be updated to use the same search logic from
> > the image_types_wic.bbclass so that when it invokes "wic create" it is
> > providing wic with the path to a wks file that has a ".wks" extension
> > (which is how bitbake invokes wic) instead of specifying a bare wks file
> > and hoping wic will find it.
> > 
> > I'm happy to add "files/wic" as another location for
> > image_types_wic.bbclass to search for wks files.
> 
> I guess the first question is are we going to take this for wrynose or
> not? I'm not particularly happy with the files a top level wic
> directory, I think it needs to be meta/files/wic. To make that work, we
> need to tweak the search paths in wic and in image_types_wic.bbclass.
> If we can resolve that issue, we're probably good to move forward with
> merging.
> 
> I agree that the search path logic should be tidied up. Whether you can
> provide a search path to wic or whether that has to be done in metadata
> is an open question. I do see your perspective, equally, if you are
> using wic within OE, having some search knowledge may be ok. I would
> want to see it basically using files/wic from BBPATH  with everything
> else removed. There is a question of how you warn users about old
> paths. This piece is too late for the release though.
> 
> So I'd propose we add files/wic to the search path, move the files
> there and that lets us at least get some of the changes into the
> release?

Sounds perfect, thanks!

> Cheers,
> 
> Richard
> 

