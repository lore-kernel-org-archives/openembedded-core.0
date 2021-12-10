Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9299C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:07:36 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.7661.1639145256023968085
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K5WAmgIP;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id q3so15110558wru.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2k/BtI59JDRwgBPFU63HwktOUYwG2B2yT2/pEoYYgfY=;
        b=K5WAmgIPs4quqZ63/7Bq81HkqoylQZkf343wxoAhn9NR0Wiojur+y/1XbwQGE0Ta5O
         d5VX9lM+voFpR/GGePizhlD1e6iHATkUnmA9SRIWUCLko03VPmpOi5csvFhrKG8pRuOC
         MkxTDdIgRosdi6+DqeeuMnhvviRMzMjGhp0T1Nvl3yxV44/pkTRg0s+f3oMILqBn4WGz
         25Wipor72pLmrR0b+CcdK7czjqFzOoxMbq4MUJjdffb8MrfXzoh9+g37Rk1OYN2c8Ah/
         uIYBU1MghBPjHqepiXh6eHFqFHFyQNwhjkaX9oO5drUfdyxqp1eK5pkfOqoOqAAAl1JA
         9PRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2k/BtI59JDRwgBPFU63HwktOUYwG2B2yT2/pEoYYgfY=;
        b=UQQuzl3hpjY0/OhR8AhyJnKRiP+7dRFuEVRIjVzQD3yEbGAQUzXCFZ2uKOGEdK4r5X
         7OvRuHgOQVxky+asM5lXf1jPY27tkCwhjU3GxqBccrmzNdwDuc6tD9SrekK4cPW+G8Mr
         OG6uLDHU7hxEc3H1CVuwW+N3r2QmXVxAR04VIP0+Coi4H53RrKiWrcQ2kpS8zbS14pze
         JuPPIgzB3pm/0/u/NVwY4idRBrkhodBaIg59QPuSW0ZZsntGdQ9g1p7FpKbXy9BWZz8D
         gUSdq/NdwWn8pGNjmcQL+oasAGwOE7S349sMUXTZZo7wlGUSiMJVIVOFw+U4DvuNECLF
         apSA==
X-Gm-Message-State: AOAM530flrYCR2kYxFUEbgVKk3biNmkSU0QFBcA09eodiZiZ7RL3KDCZ
	wja2I2H0sw/i8Oy0cj9bla0=
X-Google-Smtp-Source: 
 ABdhPJzYytrhQL+uBss5ZhxMc1nIZn3x0v6nzGd26np73IhnnTgRFZqSyYTyc1RUJy9W4mBtTLKqAw==
X-Received: by 2002:a05:6000:11cd:: with SMTP id
 i13mr14622574wrx.524.1639145254392;
        Fri, 10 Dec 2021 06:07:34 -0800 (PST)
Received: from Saturn.fritz.box ([194.191.225.82])
        by smtp.googlemail.com with ESMTPSA id
 f8sm12502439wmf.2.2021.12.10.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 06:07:34 -0800 (PST)
Message-ID: <31430c24ef2cea6758e70cafdc6f1cd85c95e9e6.camel@gmail.com>
Subject: Re: [oe][OE-core][Patch 1/2] lib/oe/patch.py: apply patches from
 src_uri specified directories
From: Max <max.oss.09@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Konrad Weihmann
	 <kweihmann@outlook.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Max Krummenacher
	 <max.krummenacher@toradex.com>
Date: Fri, 10 Dec 2021 15:07:33 +0100
In-Reply-To: 
 <CADkTA4NKr0WjukbqH4FQoze8-L5Jn3F9QekfV-hOcL1wU-VZOg@mail.gmail.com>
References: <20211210130458.39716-1-max.krummenacher@toradex.com>
	 <20211210130458.39716-2-max.krummenacher@toradex.com>
	 <AM9PR09MB4642CCF54F9D741CB4A00772A8719@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <CADkTA4NKr0WjukbqH4FQoze8-L5Jn3F9QekfV-hOcL1wU-VZOg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:07:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159525

Am Freitag, den 10.12.2021, 09:01 -0500 schrieb Bruce Ashfield:
> On Fri, Dec 10, 2021 at 8:29 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
> > 
> > 
> > On 10.12.21 14:04, Max Krummenacher wrote:
> > > The current developer manual specifies that patches that are
> > > part of a directory which is given in SRC_URI are applied by
> > > the do_patch task. However that is not implemented in the
> > > current code.
> > > 
> > > Implement part of it with two differences:
> > > - The implementation requires the parameter "apply=yes" and
> > >    adds all files as patches, not only files ending in .patch
> > >    and .diff.
> > >    This keeps recipes which depend on the current implementation
> > >    working.
> > > - The possibility to exclude a file in that directory from being
> > >    applied by a follow up entry with "apply=no" is dropped.
> > > 
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > ---
> > >   meta/lib/oe/patch.py | 98 ++++++++++++++++++++++++++------------------
> > >   1 file changed, 59 insertions(+), 39 deletions(-)
> > > 
> > > diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> > > index 950fe723dc..0d2afab2f9 100644
> > > --- a/meta/lib/oe/patch.py
> > > +++ b/meta/lib/oe/patch.py
> > > @@ -794,68 +794,88 @@ class UserResolver(Resolver):
> > >               raise
> > >           os.chdir(olddir)
> > > 
> > > -
> > > -def patch_path(url, fetch, workdir, expand=True):
> > > -    """Return the local path of a patch, or return nothing if this isn't a patch"""
> > > -
> > > -    local = fetch.localpath(url)
> > > -    if os.path.isdir(local):
> > > -        return
> > > +def is_patch(local, workdir, apply_all, expand):
> > >       base, ext = os.path.splitext(os.path.basename(local))
> > >       if ext in ('.gz', '.bz2', '.xz', '.Z'):
> > >           if expand:
> > >               local = os.path.join(workdir, base)
> > >           ext = os.path.splitext(base)[1]
> > > 
> > > -    urldata = fetch.ud[url]
> > > +    if ext in (".diff", ".patch") or apply_all:
> > > +        return True
> > > +    return False
> > > +
> > > +def patch_path(local, urldata, fetch, workdir, expand=True):
> > > +    """Return a list of local paths of patches or return an empty list if there are no
> > > patches"""
> > > +    patches = []
> > > +
> > > +    apply_all = False
> > >       if "apply" in urldata.parm:
> > >           apply = oe.types.boolean(urldata.parm["apply"])
> > >           if not apply:
> > > -            return
> > > -    elif ext not in (".diff", ".patch"):
> > > -        return
> > > +            return patches
> > > +        else:
> > > +            apply_all = True
> > > +
> > > +    if os.path.isdir(local) and apply_all:
> > > +        for f in sorted(os.listdir(local)):
> > 
> > This assumes that patches can be ordered (in here alphabetically) -
> > which isn't the case for most of the projects I worked with - I think it
> > was also a reason why one has to specify the order and inclusion in SRC_URI.
> 
> This was immediately my concern as well when I read the 0/N for the series.
> 
> I'd be more inclined to remove the documentation, rather than trying
> to deal with sorting and sequencing issues. Since it hasn't been
> working until now, there wouldn't be any users to annoy with dropped
> functionality.
> 
> (That being said, we could make the argument that anyone attempting to
> just point at a directory full of patches knows enough that they need
> to have them named in a way to keep them sorted and applied in order).
> 

This now implemented feature is not meant to replace the current way
of specifying patches. So if you cannot change the patch filenames
to specify the order then don't use it.

One use case I envision is a patchset in flight while upstreaming to
the upstream project. Apply such a patchset as the content of a
directory. For that use case the patches are sorted with their
000x-*.patch naming from generating them by default.
If you want to mix apples and orange patches, then I agree that the
directory approach is probably the wrong one.

> Cheers,
> 
> Bruce
> 
> 
> > > +            sublocal = local + '/' + f
> > 
> > Wouldn't be a sorted glob be more suitable here?

I'll look into it.

Max

> > 
> > > +            # Also search in subdirs
> > > +            if os.path.isdir(sublocal):
> > > +                patches = patches + patch_path(sublocal, urldata, fetch, workdir, expand)
> > > +            else:
> > > +                if is_patch(sublocal, workdir, apply_all, expand):
> > > +                    patches.append(sublocal)
> > > +    else:
> > > +        if is_patch(local, workdir, apply_all, expand):
> > > +            patches.append(local)
> > > 
> > > -    return local
> > > +    return patches
> > > 
> > >   def src_patches(d, all=False, expand=True):
> > > +    """Return a list of local paths from SRC_URI. With all=False all patches targeting
> > > do_patch, with all=True all other local paths"""
> > >       workdir = d.getVar('WORKDIR')
> > >       fetch = bb.fetch2.Fetch([], d)
> > >       patches = []
> > >       sources = []
> > > -    for url in fetch.urls:
> > > -        local = patch_path(url, fetch, workdir, expand)
> > > -        if not local:
> > > -            if all:
> > > -                local = fetch.localpath(url)
> > > -                sources.append(local)
> > > -            continue
> > > 
> > > +    for url in fetch.urls:
> > > +        local = fetch.localpath(url)
> > >           urldata = fetch.ud[url]
> > > -        parm = urldata.parm
> > > -        patchname = parm.get('pname') or os.path.basename(local)
> > > +        locals = []
> > > +        locals = locals + patch_path(local, urldata, fetch, workdir, expand)
> > > 
> > > -        apply, reason = should_apply(parm, d)
> > > -        if not apply:
> > > -            if reason:
> > > -                bb.note("Patch %s %s" % (patchname, reason))
> > > +        if not locals:
> > > +            if all:
> > > +                sources.append(local)
> > >               continue
> > > -
> > > -        patchparm = {'patchname': patchname}
> > > -        if "striplevel" in parm:
> > > -            striplevel = parm["striplevel"]
> > > -        elif "pnum" in parm:
> > > -            #bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in '%s', please use
> > > 'striplevel'" % url)
> > > -            striplevel = parm["pnum"]
> > >           else:
> > > -            striplevel = '1'
> > > -        patchparm['striplevel'] = striplevel
> > > +            for patch in locals:
> > > +                parm = urldata.parm
> > > +                patchname = parm.get('pname') or os.path.basename(patch)
> > > +
> > > +                apply, reason = should_apply(parm, d)
> > > +                if not apply:
> > > +                    if reason:
> > > +                        bb.note("Patch %s %s" % (patchname, reason))
> > > +                    continue
> > > +
> > > +                patchparm = {'patchname': patchname}
> > > +                if "striplevel" in parm:
> > > +                    striplevel = parm["striplevel"]
> > > +                elif "pnum" in parm:
> > > +                    #bb.warn("Deprecated usage of 'pnum' url parameter in '%s', please use
> > > 'striplevel'" % url)
> > > +                    striplevel = parm["pnum"]
> > > +                else:
> > > +                    striplevel = '1'
> > > +                patchparm['striplevel'] = striplevel
> > > 
> > > -        patchdir = parm.get('patchdir')
> > > -        if patchdir:
> > > -            patchparm['patchdir'] = patchdir
> > > +                patchdir = parm.get('patchdir')
> > > +                if patchdir:
> > > +                    patchparm['patchdir'] = patchdir
> > > 
> > > -        localurl = bb.fetch.encodeurl(('file', '', local, '', '', patchparm))
> > > -        patches.append(localurl)
> > > +                localurl = bb.fetch.encodeurl(('file', '', patch, '', '', patchparm))
> > > +                patches.append(localurl)
> > > 
> > >       if all:
> > >           return sources
> > > 
> > > 
> > > 
> > > 
> > > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159521): https://lists.openembedded.org/g/openembedded-core/message/159521
> > Mute This Topic: https://lists.openembedded.org/mt/87635233/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


