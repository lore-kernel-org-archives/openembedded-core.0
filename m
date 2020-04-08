Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.2111.1586390370010862746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 16:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YX1bCghU;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id o15so2138305qvl.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 16:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w90u2fl1QcFWL2GzJROpYOmY7q4SDdCc1Op4jaQQjQA=;
        b=YX1bCghU0E9b5WTDsaKtnvZ07Eiz74TE8diI0odW21i6DDeY3Cljy5usoaAq9LShQd
         laX9Xm2RSyiA3NLo6fn4l1ZLKcX991g052GHNe7KhnUqCZNq+skyzRejccmHftGVGyPs
         GMCp6WRDJ7obLRoRWPLhnVl1ULAiAANYzbkY6aRUx46wpWI4rYbZzS+RYYFl/lJoSRrS
         dpQLZJ/o/x0p6XqWDflvDau+Sk5zNwHOeE5mPES3cPgh0HmmUgSnwudf0Oqt+RMaqZpE
         jromQNT4+GihrHytA3XJY3/f7VUbhdZ8TlsQ9D5rN2+f5lZX+UdZt398ZsrybzgYeLw3
         UaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w90u2fl1QcFWL2GzJROpYOmY7q4SDdCc1Op4jaQQjQA=;
        b=itWZPHfbtEok6+FRYvRjHwaualhNxtTL/Jr8/9l3VbJ7XfJWU2KN1UVyl2ojENRBgY
         4ftfsi9TDjmEfScXv+NnHXPhyGCue1k8Zy79ZQp/qImPYSTUIwwDeBBd6/zMq5xOYBfF
         ckhfarUl9ARR5USrEFd610OkQrIKjpNOE4Jr4DJPFxdOeSj2jW8EWjIwOXiVZ1naGuRz
         6ADbZYjfNzCIfg6dO4l1GIDfviWRGoV3ciFEttO9PiHTCMc27pqH4EmVv1SdFn+/Eug5
         UUCSuEV+TIh4lAP7FYXXxZshc2FoTgrvkXk/lh7nqSLwEpDKBZlvZdzEckQFmkKd5ZYn
         bprg==
X-Gm-Message-State: AGi0PuYBBRzpoaq/XXz+nDSWK7nck64U9dOTTr88CIWBNWL5FN8ajZg8
	jdclbvBnO2CwVZZXGmKgWJEL3zTU+oYMEIFx3dQ=
X-Google-Smtp-Source: APiQypK8p4sW/GOHOfbsSiwT6W/N85mJUv1OadaTme5ri36dJN5mAWOLuBzpC+WTyCekeqrq6uZof3Q3XHB006lTHXQ=
X-Received: by 2002:a0c:b78e:: with SMTP id l14mr10287885qve.4.1586390368958;
 Wed, 08 Apr 2020 16:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200408231808.393685-1-richard.purdie@linuxfoundation.org> <CAMKF1srJ72-knr8BJxGcJ6Mct=y_Dt4DtZWMhs5UM+eoCf4i6A@mail.gmail.com>
In-Reply-To: <CAMKF1srJ72-knr8BJxGcJ6Mct=y_Dt4DtZWMhs5UM+eoCf4i6A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 8 Apr 2020 16:59:01 -0700
Message-ID: <CAMKF1sox5DY7Zh5EN5onjGArv0ZTH=+L6+H8dQZtmcHCgFru2A@mail.gmail.com>
Subject: Re: [PATCH] musl: Show error when used with multilibs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 8, 2020 at 4:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Apr 8, 2020 at 4:18 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > As discussed in the bugzilla entry, musl is not compatible with multilibs
> > and has no plans to support this. Therefore tell users this from the
> > recipe rather than letting them run into build failures.
> >
>
> I dont think thats the case anymore, I have sent patches to fix
> multilib on musl.
> this seems a broad brush. What are you trying to fix ?
>

I see the bug list a fix that was done last year as a workaround to
disable multilib headers that should be reverted something like this

diff --git a/meta/classes/multilib_header.bbclass
b/meta/classes/multilib_header.bbclass
index e03f5b13b2..48f231eed0 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -6,13 +6,6 @@ inherit siteinfo
# all of the ABI variants for that given architecture.
#
oe_multilib_header() {
-
-       case ${HOST_OS} in
-       *-musl*)
-               return
-               ;;
-       *)
-       esac
# For MIPS: "n32" is a special case, which needs to be
# distinct from both 64-bit and 32-bit.
case ${TARGET_ARCH} in

would be more appropriate now a days.

> > [YOCTO #13122]
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-core/musl/musl.inc | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
> > index bdce412162c..f2f3d3d054b 100644
> > --- a/meta/recipes-core/musl/musl.inc
> > +++ b/meta/recipes-core/musl/musl.inc
> > @@ -29,3 +29,9 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
> >  B = "${WORKDIR}/build"
> >
> >  do_configure[cleandirs] = "${B}"
> > +
> > +python () {
> > +    multilibs = d.getVar("MULTILIBS")
> > +    if multilibs:
> > +        raise bb.parse.SkipRecipe("musl is not compatible with multilibs")
> > +}
> > --
> > 2.25.1
> >
