Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC87BC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 07:31:09 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.14670.1713252665227436181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 00:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l7QozLTl;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d715638540so48547291fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 00:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713252663; x=1713857463; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VGcv1EOruNwYXv/terkCH/8x3A+aaNgewJ8iTnGQqtw=;
        b=l7QozLTlIbmwXF+plyTVPKyZ6jyEuAfXtvRQgDcMXClVa16zLX5AM48fg7EdcoVw8v
         RqCP463MN0cfFJFRLy/J6Y6RxsgWqq1wPI+OYfUmeQIkr+0ake39lOzPNjzEGC4bD8KC
         mn9DkOSk26NEiLSNbaubx/Ag8gGUDfBqiYvvMRc3KCdoEIHoy/O5uGl+zB3AMpnXKZY+
         Y6dvE0yAylYJ4TIQeVOn3IzpqDSfd65pEN8fzPlPnCRVgS6wStMEphMswF30oz5RfCd6
         viAesodr4ifG4jp702phVdQ5HLohFyTN5MGRBDPfK8h8a78vp4k7mA4bzQQUyMuEK2e1
         kQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713252663; x=1713857463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGcv1EOruNwYXv/terkCH/8x3A+aaNgewJ8iTnGQqtw=;
        b=IlAfRYNUPhX9dKRYgr+8jgMgcO8Vzi3rXGc4rdYv/DxC2dPr8kKKZL4lg13hjUClhK
         TeO4yP15q21BQ0atpOVsPeircJrcK/lVPdMXcarGjTEuN8QluKVPswqY27wWVZzejrbC
         LCZPLFnqAcXQ6XLJH9T+fFZtPGjEiqbR0dgTjrAgfFsg/hBIXG4+upIxqBmbKgZOSQWk
         u97GIVJmfzpB99eLmHtaxpWoY7lpDBYRMeOaD1nyNXbpH34jDZhnjyrvmL8uJdwxORzK
         sEtTbnfmkfWWRWir8NEM0nvWFsL7ykrkuwcVPis/hxex5Bk4oislFP/X1BaV99slw4bn
         tXgw==
X-Forwarded-Encrypted: i=1; AJvYcCX+rbe+yd8juus6C/ML6aqN4dcbAVvuSscG6TIb0Sz8OrF0AwAb1kIHsgonodWLAN9lc+6or3R0TXhDkBdxfrtAxVuQZVx6T1au2TfuBtKiU5MSyuIXeSxL
X-Gm-Message-State: AOJu0Yx2BDPR8rpejwtVf8aCV1+7D9fItmtRvnP4L/3d3hQ5kSAvTAkN
	IBHALoEjhKy9S7ygX2wzOmlLAHE4q2GN95B8EXZXEqHMT51Ze+hSFuIole4bgTdI2qIlWW6+F97
	VYb1mCb1JAevdBXqScG8FXId7Y/BdBQ==
X-Google-Smtp-Source: AGHT+IEWjsIB9DasGJk2AWQBB9s7hBKnBQUjk6HudZQ29bxRAz6rTIxgMO9ENgz3FDzM1tXBjOeNrgIMFHZ81wOkCpM=
X-Received: by 2002:a2e:998a:0:b0:2d7:61ac:b392 with SMTP id
 w10-20020a2e998a000000b002d761acb392mr8195491lji.29.1713252662795; Tue, 16
 Apr 2024 00:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240415083019.1867284-1-changqing.li@windriver.com>
 <7440987a5a3496bd4f88931728c7d7f686099c62.camel@linuxfoundation.org> <eee97336-9137-446c-b37f-c4b5bc0f9604@windriver.com>
In-Reply-To: <eee97336-9137-446c-b37f-c4b5bc0f9604@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Apr 2024 09:30:51 +0200
Message-ID: <CANNYZj_N0oJwp_vZvVdaDEFtHnTPi+RG8YFx1qu=B0QHkJZjSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base.bbclass: make do_fetch depends on
 PREMIRRORS MIRRORS
To: changqing.li@eng.windriver.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 07:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198433

I'm not sure why files in DL_DIR would symlink to the local
(pre)mirrors instead of making an independent copy? Mirrors can indeed
move or disappear altogether.

Can you look into where the symlinking happens, and whether that can
be modified or configured differently (maybe also the git history for
that code)?

Alex

On Tue, 16 Apr 2024 at 03:48, Changqing Li via lists.openembedded.org
<changqing.li=eng.windriver.com@lists.openembedded.org> wrote:
>
>
> On 4/15/24 18:05, Richard Purdie wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> >
> > On Mon, 2024-04-15 at 16:30 +0800, Changqing Li via lists.openembedded.org wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> When there are tarballs in local mirror file://, do_fetch will
> >> create symlink under DL_DIR, eg:
> >> pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorA/pseudo-prebuilt-2.33.tar.xz
> >> after user update path from localmirrorA to localmirrorB, because
> >> do_fetch don't depends on PREMIRRORS/MIRRORS, do_fetch will not
> >> be rerun, so the symlink will not update to:
> >> pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorB/pseudo-prebuilt-2.33.tar.xz
> >> then, do_upack will failed since the tarball cannot be found.
> >>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   meta/classes-global/base.bbclass | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
> >> index 0999b42daa..5094a1540e 100644
> >> --- a/meta/classes-global/base.bbclass
> >> +++ b/meta/classes-global/base.bbclass
> >> @@ -139,6 +139,7 @@ do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
> >>   do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
> >>   do_fetch[prefuncs] += "fetcher_hashes_dummyfunc"
> >>   do_fetch[network] = "1"
> >> +do_fetch[vardeps] += "PREMIRRORS MIRRORS"
> >>   python base_do_fetch() {
> >>
> >>       src_uri = (d.getVar('SRC_URI') or "").split()
> >>
> > Changing PREMIRRORS or MIRRORS should not change the output of the
> > task, ever, so do_fetch shouldn't depend upon them.
>
> The failure case I met is like this:
>
> I have a project with PREMIRRORS setting, and the tarballs are under it.
>
> PREMIRRORS:append = "file:///project/path/to/localmirrorA"
>
> after first bitbake pseudo-native, there will a symlink under DL_DIR:
>
> pseudo-prebuilt-2.33.tar.xz ->
> /project/path/to/localmirrorA/pseudo-prebuilt-2.33.tar.xz
>
> Then, Since all the tarballs are moved to /project/path/to/localmirrorB
>
> I changed PREMIRRORS:append = "file:///project/path/to/localmirrorB"
>
> Then bitbake pseudo-native again,   do_fetch  will not rerun since no
> signature change.
>
> do_unpack rerun since one dependency  change, it will try to unpack
> ${DL_DIR}/pseudo-prebuilt-2.33.tar.xz,
>
> but since do_fetch not rerun, ${DL_DIR}/pseudo-prebuilt-2.33.tar.xz
> still point to localmirrorA, but localmirrorA not exist
>
> since localmirrorB replace it.  Then will cause do_unpck failure:
>
> NOTE: Unpacking /build/downloads/pseudo-prebuilt-2.33.tar.xz to
> /build/tmp-glibc/work/x86_64-linux/pseudo-native/1.9.0+git xz:
> /build/downloads/pseudo-prebuilt-2.33.tar.xz: No such file or directory
>
> So this is why I want to add this depends,  and want to make do_fetch
> rerun and resymlink to /project/path/to/localmirrorB
>
> Regards
>
> Changqing
>
> >
> > Cheers,
> >
> > Richard
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198246): https://lists.openembedded.org/g/openembedded-core/message/198246
> Mute This Topic: https://lists.openembedded.org/mt/105532159/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

