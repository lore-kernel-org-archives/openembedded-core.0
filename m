Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99462C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 12:21:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.4843.1657196505136739758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 05:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e9wbQ6tF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id h17so12912670wrx.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=TaDqcTopFkuqpfjqIQhu1I/GChzYu9wOqNkUskg8DmY=;
        b=e9wbQ6tFpzE9HEBkwQrnoTlZqENTq2quVyff8KQp7PUhjVhmf7TZmKf3JamFgA0rf9
         buq1zJOyCoqGVRLpwlMLtbJGj1shwFMwOxabz0aJC4bn1LIWe6tRG3CT2GnSJspm690r
         wfKagn3ChEpa4wPgPzfVlBhgkHDNSPVUgaSWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=TaDqcTopFkuqpfjqIQhu1I/GChzYu9wOqNkUskg8DmY=;
        b=797xa9ea3n7e0a3n8y98ft868f/y8jgxOdont4KnnBeok7LVknrYswrqW/jFKQV7z/
         X6fmhIm8X6rQ8YfVaLNeuk6iwLwUW6FE5r7T7wZ4t4QMocikVGH1+0fo5UME60qqrlg3
         DzTVZiFCHL6CN1XoLtYgisi0wCZeVH2xQkiapYuO+ObXfzlmGbkMub3bstGO8rwmlv9p
         dXu66xeH7KO8Hqgp1dM+vnIuTgPriW/wyyvy8ypsNEF/c4xvgiUaogcKKorP+GbrCt6n
         hgXDNSFHQz95jth1bMtwYVATUxqIsZlVEVwdQSwg4a1ifuY92JlJJLGLq9HiaMQ9IK5b
         v4TA==
X-Gm-Message-State: AJIora9TgJsv9VW8qp3hEOpLbmMysEQhkz742C/zGtBGDD9Pmr1FsAVU
	Oil5of2I4W48c4WZ4nLFJTdejw==
X-Google-Smtp-Source: 
 AGRyM1uzBACSEfk/GmUvsk6PX6vLJDMnLthBjFgABGEhVc7hC0O5rQhqS02bm6YJW5E6sb3mbfx9gg==
X-Received: by 2002:a5d:5984:0:b0:21d:7f3a:a153 with SMTP id
 n4-20020a5d5984000000b0021d7f3aa153mr6998272wri.568.1657196503415;
        Thu, 07 Jul 2022 05:21:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:638d:2ed5:49c5:993f?
 ([2001:8b0:aba:5f3c:638d:2ed5:49c5:993f])
        by smtp.gmail.com with ESMTPSA id
 i30-20020a1c541e000000b003a032c88877sm25097422wmb.15.2022.07.07.05.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 05:21:42 -0700 (PDT)
Message-ID: 
 <6b201cfd12ceade39184c42c898210bdc466791b.camel@linuxfoundation.org>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 07 Jul 2022 13:21:40 +0100
In-Reply-To: 
 <CAO5Uq5SPMd3FZwF8StQ6ofSustJiVFC2LLOe8RLTzMyyHXK5pQ@mail.gmail.com>
References: <16FE039DA287E43E.1980@lists.openembedded.org>
	 <16FEA3B3CA900B93.1980@lists.openembedded.org>
	 <16FEBD90A08F81A5.1980@lists.openembedded.org>
	 <5b8c809573b0ecb0039333edcbeb1936b40db564.camel@linuxfoundation.org>
	 <CAO5Uq5SPMd3FZwF8StQ6ofSustJiVFC2LLOe8RLTzMyyHXK5pQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 12:21:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167773

On Thu, 2022-07-07 at 12:14 +0100, Alex Kiernan wrote:
> On Wed, Jul 6, 2022 at 5:40 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Mon, 2022-07-04 at 22:28 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Mon, 2022-07-04 at 14:34 +0100, Richard Purdie via
> > > > > With docs enabled:
> > > > > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: Fil=
e /usr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPD=
IR [buildpaths]
> > > > > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /us=
r/lib64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [b=
uildpaths]
> > > > > stdio: WARNING: lib32-gtk-doc-1.33.2-r0 do_package_qa: QA Issue: =
File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package lib32-gtk-d=
oc contains reference to TMPDIR [buildpaths]
> > > > > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr=
/bin/vapigen-wrapper in package vala contains reference to TMPDIR [buildpat=
hs]
> > > > > stdio: WARNING: gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /=
usr/share/gtk-doc/python/gtkdoc/config_data.py in package gtk-doc contains =
reference to TMPDIR [buildpaths]
> >=20
> > I think I have fixes out for rpm (via lua) and vala. gtk-doc remains.
> >=20
> > > > These still remain. In addition we also have:
> > > >=20
> > > > A musl ltp issue:
> > > > stdio: WARNING: ltp-20220527-r0 do_package_qa: QA Issue: File /opt/=
ltp/testcases/open_posix_testsuite/logfile.conformance-all in package ltp c=
ontains reference to TMPDIR [buildpaths]
> >=20
> > Still remaining.
> >=20
> > > >=20
> > > > Some multilib issues:
> > > > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File =
/usr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR=
 [buildpaths]
> > > > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/b=
in/vapigen-wrapper in package vala contains reference to TMPDIR [buildpaths=
]
> > > > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/=
lib64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [bui=
ldpaths]
> >=20
> > These are probably fixed.
> >=20
> > > > qemuarm64:
> > > > stdio: WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File =
/lib/modules/5.15.44-yocto-standard/build/include/generated/.vdso-offsets.h=
.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
> >=20
> > Fix out from Bruce (thanks!)
> >=20
> > > >=20
> > > > meta-gplv2 issue:
> > > > stdio: WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/li=
bexec/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR=
 [buildpaths]
> > > > stdio: WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/=
debug/tar/1.17-r3/build/lib/string.h in package tar-src contains reference =
to TMPDIR
> >=20
> > This may be the end of meta-gplv2 since nobody cares.
> >=20
>=20
> Much as I'd rather this just wasn't necessary, I'm taking a look.

Ross has linked to some discussion about it.  I'd just delete mc to be
honest, I can't see it being useful there.

I think we need data on the use cases people are using it for and
seeing whether it really is still necessary or just an easy way out.

Cheers,

Richard
> > >=20

