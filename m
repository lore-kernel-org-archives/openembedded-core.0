Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83692C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 16:21:30 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.29103.1654878088009334944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 09:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cjX/djSU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id z9so7343383wmf.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 09:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=XXIwBm6olf5WOAJsQS4S4NOZwiO6kF0IhfBlO71omBg=;
        b=cjX/djSUXsoswu6JjKEyYFJ4Vhq2ZXsrqbDOwACsYSuC7fcqVYjjhmqdFR+ni/hhU9
         VaHwdzt6tq+kqjxcut7J77+fCbyzwcQjosn1tCTG4sCO8+YJfGzviYle1ckOT/DcgJJu
         SsCR7pX+qQyL6u8ks4g91GJ6DxrKxqwYkrd9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=XXIwBm6olf5WOAJsQS4S4NOZwiO6kF0IhfBlO71omBg=;
        b=2z7SBk0Cc3v1TkGBpeN7GjhoXHV1ZXZJbwe9uedKYBLVErdfvRGgE9mcWpetMh4SJ9
         Fas9vlgDOJs23C9NMoak65SGxN8AbYkpM773ZxP9pwfzMdt5yd8atcUsc+2SXNyk7qIp
         WwjYijmCpwNcLxj8ICnAf6HkB8vsCrCGDtOjN/WKjykKV+39KjHNy+oJGCEcNy0bOuZL
         fye6EAXQRJ260/M/K1q87ET03IGo/KkBYiE79TWK3srCIFlGiD2oJL58A7eJNx8yzu6T
         QxOBUklibjN0fM/foP9ahAJwQ9XhHpoBQ8wdXcEz5MKmW+oXe8MgQ92EUB+PPItc+Ukc
         X1rg==
X-Gm-Message-State: AOAM532wXG7MhzDCliU7M0L5Tig3gZDKAQuW5/8fKZHqCF8Y7xS+BdZb
	mn2v2dJ4l9HUIzlYhHcnIvi5Kg==
X-Google-Smtp-Source: 
 ABdhPJzSqF0l137yx4i8z90z/bFrfuNhIoCJQOYeigIoZmi4hcC6quniwz9WT+Q1uX7Mgox6yFkYyQ==
X-Received: by 2002:a05:600c:4ed4:b0:39a:de6b:40e4 with SMTP id
 g20-20020a05600c4ed400b0039ade6b40e4mr560127wmq.100.1654878086430;
        Fri, 10 Jun 2022 09:21:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:95f1:dc46:f4d5:b14b?
 ([2001:8b0:aba:5f3c:95f1:dc46:f4d5:b14b])
        by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c050700b0039749b01ea7sm4114162wmc.32.2022.06.10.09.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 09:21:25 -0700 (PDT)
Message-ID: 
 <298ee680759a67b3d243619aee3a123c261684ae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5] classes/buildcfg: Move git/layer revision
 code into new OE module buildcfg
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2022 17:21:24 +0100
In-Reply-To: <20220610161408.34a3a6a4@booty>
References: <20220609113732.43566-1-richard.purdie@linuxfoundation.org>
	 <20220610161408.34a3a6a4@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 16:21:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166810

On Fri, 2022-06-10 at 16:14 +0200, Luca Ceresoli wrote:
> Hello Richard,
>=20
> On Thu,  9 Jun 2022 12:37:28 +0100
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
>=20
> > There is a load of duplicated git/layer/revision code which makes
> > most sesne as a python library, not bbclass code. Start to refactor as =
such.
>=20
> s/sesne/sense/
>=20
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/base.bbclass            |  9 +++---
> >  meta/classes/buildhistory.bbclass    |  4 +--
> >  meta/classes/image-buildinfo.bbclass |  4 +--
> >  meta/classes/metadata_scm.bbclass    | 43 ++--------------------------
> >  meta/lib/oe/buildcfg.py              | 40 ++++++++++++++++++++++++++
> >  5 files changed, 51 insertions(+), 49 deletions(-)
> >  create mode 100644 meta/lib/oe/buildcfg.py
> >=20
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index bdb3ac33c67..f59e95fef06 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -7,12 +7,11 @@ inherit staging
> >  inherit mirrors
> >  inherit utils
> >  inherit utility-tasks
> > -inherit metadata_scm
> >  inherit logging
> > =20
> >  OE_EXTRA_IMPORTS ?=3D ""
> > =20
> > -OE_IMPORTS +=3D "os sys time oe.path oe.utils oe.types oe.package oe.p=
ackagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproduci=
ble oe.rust ${OE_EXTRA_IMPORTS}"
> > +OE_IMPORTS +=3D "os sys time oe.path oe.utils oe.types oe.package oe.p=
ackagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproduci=
ble oe.rust oe.buildcfg ${OE_EXTRA_IMPORTS}"
> >  OE_IMPORTS[type] =3D "list"
> > =20
> >  PACKAGECONFIG_CONFARGS ??=3D ""
> > @@ -35,6 +34,8 @@ def oe_import(d):
> >  # We need the oe module name space early (before INHERITs get added)
> >  OE_IMPORTED :=3D "${@oe_import(d)}"
> > =20
> > +inherit metadata_scm
> > +
> >  def lsb_distro_identifier(d):
> >      adjust =3D d.getVar('LSB_DISTRO_ADJUST')
> >      adjust_func =3D None
> > @@ -219,8 +220,8 @@ def get_source_date_epoch_value(d):
> >  def get_layers_branch_rev(d):
> >      layers =3D (d.getVar("BBLAYERS") or "").split()
> >      layers_branch_rev =3D ["%-20s =3D \"%s:%s\"" % (os.path.basename(i=
), \
> > -        base_get_metadata_git_branch(i, None).strip(), \
> > -        base_get_metadata_git_revision(i, None)) \
> > +        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
> > +        oe.buildcfg.get_metadata_git_revision(i, None)) \
> >              for i in layers]
> >      i =3D len(layers_branch_rev)-1
> >      p1 =3D layers_branch_rev[i].find("=3D")
> > diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhist=
ory.bbclass
> > index 4345ffc6939..f2493b3765a 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -761,8 +761,8 @@ def buildhistory_get_metadata_revs(d):
> >      # We want an easily machine-readable format here, so get_layers_br=
anch_rev isn't quite what we want
> >      layers =3D (d.getVar("BBLAYERS") or "").split()
> >      medadata_revs =3D ["%-17s =3D %s:%s%s" % (os.path.basename(i), \
> > -        base_get_metadata_git_branch(i, None).strip(), \
> > -        base_get_metadata_git_revision(i, None), \
> > +        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
> > +        oe.buildcfg.get_metadata_git_revision(i, None), \
> >          buildhistory_get_modified(i)) \
> >              for i in layers]
> >      return '\n'.join(medadata_revs)
> > diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-=
buildinfo.bbclass
> > index 94c585d4cd9..25ca8d8fe6b 100644
> > --- a/meta/classes/image-buildinfo.bbclass
> > +++ b/meta/classes/image-buildinfo.bbclass
> > @@ -46,8 +46,8 @@ def get_layer_git_status(path):
> >  def get_layer_revs(d):
> >      layers =3D (d.getVar("BBLAYERS") or "").split()
> >      medadata_revs =3D ["%-17s =3D %s:%s %s" % (os.path.basename(i), \
> > -        base_get_metadata_git_branch(i, None).strip(), \
> > -        base_get_metadata_git_revision(i, None), \
> > +        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
> > +        oe.buildcfg.get_metadata_git_revision(i, None), \
> >          get_layer_git_status(i)) \
> >              for i in layers]
> >      return '\n'.join(medadata_revs)
> > diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_=
scm.bbclass
> > index 47cb969b8d8..f646b3159a4 100644
> > --- a/meta/classes/metadata_scm.bbclass
> > +++ b/meta/classes/metadata_scm.bbclass
> > @@ -1,44 +1,5 @@
> > -def base_detect_revision(d):
> > -    path =3D base_get_scmbasepath(d)
> > -    return base_get_metadata_git_revision(path, d)
> > =20
> > -def base_detect_branch(d):
> > -    path =3D base_get_scmbasepath(d)
> > -    return base_get_metadata_git_branch(path, d)
>=20
> This causes failures because there still a user of base_detect_branch()
> in meta/classes/report-error.bbclass
>=20
> NameError: name 'base_detect_branch' is not defined
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2527/s=
teps/13/logs/stdio

You're right, sorry about that. Version in master-next updated.

Cheers,

Richard


