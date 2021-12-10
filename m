Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40033C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:13:17 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.7598.1639145596285693423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dVfNHnKa;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 13so13881951ljj.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GzKhRF5257kBcP27/Z5jw/MWjGOgqmCKNNzU07PrYXY=;
        b=dVfNHnKaGWzREWKNZYINKelC2k9R3aSVAldPnEfHpSMNMRXZqSGXhMPwt0DGiexf9z
         ItHIHtBBLwrtF0erzyxMkcqaNdpZ/GaUhKRJYvkL61NxQkYwBQJYiFHoM72HBVOb1Vk9
         60SbjWGII21A3XTLlP2XDRVUWIbDIYfCrIAV69eye6NeviibyuRKYWF9WiNE3TwGz81/
         30W0nl0dk0m7aJRslwq9FL6jMldD+/hbZoDWj8r2ZWvniIDRZEc0rxzuq/HhcV5qCIhQ
         1IIsb1nSp61E4dEi56Wy9qhME4FyChahXpl/JKQrmuNFK10nhJvWOttXjF23+CU6iJeA
         EDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GzKhRF5257kBcP27/Z5jw/MWjGOgqmCKNNzU07PrYXY=;
        b=1OIZZA0MTH8PZ6iKCp13CDLq1AiXf6c2mea3NhxBcHbrizkw7Nirv7nrZaCgC5Y+t/
         J4JuxwlUIM/Kan9l5MVtlU+/A9v+AbVfRqEN2db5ROSH8jzvIbWuNMD02JakteXNdEpT
         cCSo23cJCu18gH8LEqWHNpJW7gbmOkOSbIoQxFTUO+8xUGtYt8E+y3e/JcOpoZzSJY/B
         joRL13LvBLGP7zKNie4eojRiMCi2dEwQ3nJXP3+/L2tEzA/LoLJhcWbSTqOv29NehVgU
         cywM661xHnSqWxnP4yPmVgjBeMiw1hPxHpIsEEkwvTBr5z/RPxUGmqz75xQYJsSsWzgO
         XDZw==
X-Gm-Message-State: AOAM532nGx4YfFVxLOfWqdoQ2xir2x5rdR9Hh0Rsvp/5DHYUTWixZCDZ
	Y8bfJkBTfPOL7RywmG1M6WQuqdQ5OfYinpmUmEs=
X-Google-Smtp-Source: 
 ABdhPJxbafRRYLEDiaEmut163wjEoRdg8KR8PoaVRjVSn5DzjAqguR/coTrpLxj0frQY9qTod/qh2b1d5DXtG/Tvf9w=
X-Received: by 2002:a05:651c:1791:: with SMTP id
 bn17mr13228137ljb.525.1639145594122;
 Fri, 10 Dec 2021 06:13:14 -0800 (PST)
MIME-Version: 1.0
References: <20211210130458.39716-1-max.krummenacher@toradex.com>
 <20211210130458.39716-2-max.krummenacher@toradex.com>
 <AM9PR09MB4642CCF54F9D741CB4A00772A8719@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CADkTA4NKr0WjukbqH4FQoze8-L5Jn3F9QekfV-hOcL1wU-VZOg@mail.gmail.com>
 <31430c24ef2cea6758e70cafdc6f1cd85c95e9e6.camel@gmail.com>
In-Reply-To: <31430c24ef2cea6758e70cafdc6f1cd85c95e9e6.camel@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Dec 2021 09:13:02 -0500
Message-ID: 
 <CADkTA4OcbROwiPNdMM_grJCnHzobvtj34W=WGSoU3bGu7EgFhw@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 1/2] lib/oe/patch.py: apply patches from
 src_uri specified directories
To: Max <max.oss.09@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:13:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159526

On Fri, Dec 10, 2021 at 9:07 AM Max <max.oss.09@gmail.com> wrote:
>
> Am Freitag, den 10.12.2021, 09:01 -0500 schrieb Bruce Ashfield:
> > On Fri, Dec 10, 2021 at 8:29 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
> > >
> > >
> > > On 10.12.21 14:04, Max Krummenacher wrote:
> > > > The current developer manual specifies that patches that are
> > > > part of a directory which is given in SRC_URI are applied by
> > > > the do_patch task. However that is not implemented in the
> > > > current code.
> > > >
> > > > Implement part of it with two differences:
> > > > - The implementation requires the parameter "apply=yes" and
> > > >    adds all files as patches, not only files ending in .patch
> > > >    and .diff.
> > > >    This keeps recipes which depend on the current implementation
> > > >    working.
> > > > - The possibility to exclude a file in that directory from being
> > > >    applied by a follow up entry with "apply=no" is dropped.
> > > >
> > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > ---
> > > >   meta/lib/oe/patch.py | 98 ++++++++++++++++++++++++++------------------
> > > >   1 file changed, 59 insertions(+), 39 deletions(-)
> > > >
> > > > diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> > > > index 950fe723dc..0d2afab2f9 100644
> > > > --- a/meta/lib/oe/patch.py
> > > > +++ b/meta/lib/oe/patch.py
> > > > @@ -794,68 +794,88 @@ class UserResolver(Resolver):
> > > >               raise
> > > >           os.chdir(olddir)
> > > >
> > > > -
> > > > -def patch_path(url, fetch, workdir, expand=True):
> > > > -    """Return the local path of a patch, or return nothing if this isn't a patch"""
> > > > -
> > > > -    local = fetch.localpath(url)
> > > > -    if os.path.isdir(local):
> > > > -        return
> > > > +def is_patch(local, workdir, apply_all, expand):
> > > >       base, ext = os.path.splitext(os.path.basename(local))
> > > >       if ext in ('.gz', '.bz2', '.xz', '.Z'):
> > > >           if expand:
> > > >               local = os.path.join(workdir, base)
> > > >           ext = os.path.splitext(base)[1]
> > > >
> > > > -    urldata = fetch.ud[url]
> > > > +    if ext in (".diff", ".patch") or apply_all:
> > > > +        return True
> > > > +    return False
> > > > +
> > > > +def patch_path(local, urldata, fetch, workdir, expand=True):
> > > > +    """Return a list of local paths of patches or return an empty list if there are no
> > > > patches"""
> > > > +    patches = []
> > > > +
> > > > +    apply_all = False
> > > >       if "apply" in urldata.parm:
> > > >           apply = oe.types.boolean(urldata.parm["apply"])
> > > >           if not apply:
> > > > -            return
> > > > -    elif ext not in (".diff", ".patch"):
> > > > -        return
> > > > +            return patches
> > > > +        else:
> > > > +            apply_all = True
> > > > +
> > > > +    if os.path.isdir(local) and apply_all:
> > > > +        for f in sorted(os.listdir(local)):
> > >
> > > This assumes that patches can be ordered (in here alphabetically) -
> > > which isn't the case for most of the projects I worked with - I think it
> > > was also a reason why one has to specify the order and inclusion in SRC_URI.
> >
> > This was immediately my concern as well when I read the 0/N for the series.
> >
> > I'd be more inclined to remove the documentation, rather than trying
> > to deal with sorting and sequencing issues. Since it hasn't been
> > working until now, there wouldn't be any users to annoy with dropped
> > functionality.
> >
> > (That being said, we could make the argument that anyone attempting to
> > just point at a directory full of patches knows enough that they need
> > to have them named in a way to keep them sorted and applied in order).
> >
>
> This now implemented feature is not meant to replace the current way
> of specifying patches. So if you cannot change the patch filenames
> to specify the order then don't use it.

Well yes, that is obvious.  I can't imagine why anyone would want to
even use potentially unordered directories of patches, so making it
a replacement would be unwise :D

>
> One use case I envision is a patchset in flight while upstreaming to
> the upstream project. Apply such a patchset as the content of a
> directory. For that use case the patches are sorted with their
> 000x-*.patch naming from generating them by default.
> If you want to mix apples and orange patches, then I agree that the
> directory approach is probably the wrong one.

Agreed. If someone is dumping patches from git, they get numerical
ordering. Practice shows that even nicely ordered patches start to
get a strange ordering as more are added, some are removed (and
people forget to specify start-number when dumping the new patches).

I'm sure someone might use the functionality, and it is true that it has
no impact on the main workflows, so there's no risk there. It is just
more code to support (and we should probably have a test added for
it) .. and Richard probably knows better than me the risks and if it
will actually be used.

Cheers,

Bruce

>
> > Cheers,
> >
> > Bruce
> >
> >
> > > > +            sublocal = local + '/' + f
> > >
> > > Wouldn't be a sorted glob be more suitable here?
>
> I'll look into it.
>
> Max
>
> > >
> > > > +            # Also search in subdirs
> > > > +            if os.path.isdir(sublocal):
> > > > +                patches = patches + patch_path(sublocal, urldata, fetch, workdir, expand)
> > > > +            else:
> > > > +                if is_patch(sublocal, workdir, apply_all, expand):
> > > > +                    patches.append(sublocal)
> > > > +    else:
> > > > +        if is_patch(local, workdir, apply_all, expand):
> > > > +            patches.append(local)
> > > >
> > > > -    return local
> > > > +    return patches
> > > >
> > > >   def src_patches(d, all=False, expand=True):
> > > > +    """Return a list of local paths from SRC_URI. With all=False all patches targeting
> > > > do_patch, with all=True all other local paths"""
> > > >       workdir = d.getVar('WORKDIR')
> > > >       fetch = bb.fetch2.Fetch([], d)
> > > >       patches = []
> > > >       sources = []
> > > > -    for url in fetch.urls:
> > > > -        local = patch_path(url, fetch, workdir, expand)
> > > > -        if not local:
> > > > -            if all:
> > > > -                local = fetch.localpath(url)
> > > > -                sources.append(local)
> > > > -            continue
> > > >
> > > > +    for url in fetch.urls:
> > > > +        local = fetch.localpath(url)
> > > >           urldata = fetch.ud[url]
> > > > -        parm = urldata.parm
> > > > -        patchname = parm.get('pname') or os.path.basename(local)
> > > > +        locals = []
> > > > +        locals = locals + patch_path(local, urldata, fetch, workdir, expand)
> > > >
> > > > -        apply, reason = should_apply(parm, d)
> > > > -        if not apply:
> > > > -            if reason:
> > > > -                bb.note("Patch %s %s" % (patchname, reason))
> > > > +        if not locals:
> > > > +            if all:
> > > > +                sources.append(local)
> > > >               continue
> > > > -
> > > > -        patchparm = {'patchname': patchname}
> > > > -        if "striplevel" in parm:
> > > > -            striplevel = parm["striplevel"]
> > > > -        elif "pnum" in parm:
> > > > -            #bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in '%s', please use
> > > > 'striplevel'" % url)
> > > > -            striplevel = parm["pnum"]
> > > >           else:
> > > > -            striplevel = '1'
> > > > -        patchparm['striplevel'] = striplevel
> > > > +            for patch in locals:
> > > > +                parm = urldata.parm
> > > > +                patchname = parm.get('pname') or os.path.basename(patch)
> > > > +
> > > > +                apply, reason = should_apply(parm, d)
> > > > +                if not apply:
> > > > +                    if reason:
> > > > +                        bb.note("Patch %s %s" % (patchname, reason))
> > > > +                    continue
> > > > +
> > > > +                patchparm = {'patchname': patchname}
> > > > +                if "striplevel" in parm:
> > > > +                    striplevel = parm["striplevel"]
> > > > +                elif "pnum" in parm:
> > > > +                    #bb.warn("Deprecated usage of 'pnum' url parameter in '%s', please use
> > > > 'striplevel'" % url)
> > > > +                    striplevel = parm["pnum"]
> > > > +                else:
> > > > +                    striplevel = '1'
> > > > +                patchparm['striplevel'] = striplevel
> > > >
> > > > -        patchdir = parm.get('patchdir')
> > > > -        if patchdir:
> > > > -            patchparm['patchdir'] = patchdir
> > > > +                patchdir = parm.get('patchdir')
> > > > +                if patchdir:
> > > > +                    patchparm['patchdir'] = patchdir
> > > >
> > > > -        localurl = bb.fetch.encodeurl(('file', '', local, '', '', patchparm))
> > > > -        patches.append(localurl)
> > > > +                localurl = bb.fetch.encodeurl(('file', '', patch, '', '', patchparm))
> > > > +                patches.append(localurl)
> > > >
> > > >       if all:
> > > >           return sources
> > > >
> > > >
> > > >
> > > >
> > > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#159521): https://lists.openembedded.org/g/openembedded-core/message/159521
> > > Mute This Topic: https://lists.openembedded.org/mt/87635233/1050810
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

