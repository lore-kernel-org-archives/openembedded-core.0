Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F272C54791
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 21:04:08 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.21308.1710018246392003699
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Mar 2024 13:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=COhBihwq;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c1ea5b42e7so1100233b6e.2
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 13:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710018245; x=1710623045; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zfx0QFdQ8HwCeqjGsLEqCZZg88WMA6dh6HoqlOzj9Hc=;
        b=COhBihwqcac6pMlTwCKgme4QNZI1f4IaoHwyZQBF2X/6KvpGSCwiQRkQtmjL4e+YY5
         uQpE8CqRvZ9KwCHxCqF529hK2UGpEOJwNNO8d4cOs6TSNItan6sJraPxpIk2cE4h4PnQ
         AxI0A7ukdsH4L4e7HL7ePS3kLBNAdztBcts/kLWq9RaPlrJefQwZTsG3xTV64qf+vmPp
         V0f7yTFl+DJLXADzrORh06bWlPajlveQOC1/D3QfsX+gb3g4by2KStdE79vIPl77PxyX
         HGs/tyiiCIlQN3RNnn3rcL6pfQYmIiVtyps3kf3lsLqKJMXaK6oMx/ynwTOLbZGcTSzT
         q+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710018245; x=1710623045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zfx0QFdQ8HwCeqjGsLEqCZZg88WMA6dh6HoqlOzj9Hc=;
        b=IXOKi6IDlBymrRIn33dBN9+C4nEn0gI06VwHIDgv6VGDFwk4ZZSsfbJjeVrBJaiMt7
         fmXNii/DhrWCsUnRsUpYXCOZx0b05lszQs2qzgAiUl48d8ryI8qu6BHimNOub6guw0LE
         9j2DHME+zPJ5At9SPj7ipxCJmRv46PoWqUfxUiPIU6bFH+sCUIaJFDMlT2uktn2NL3J+
         n+MDukCrcPKxSx+Q3BsKdG9sWgKRg4EnG+nU795GfzfACjxCm0GIk/S0FHkAEbBVQB82
         AtoPHfgRpo5XVkQKYijrpCbLKixzHlpDDdzs78Lliza9kEorOL4ll4kF4ulbSrYxWxHJ
         SR/Q==
X-Gm-Message-State: AOJu0YwQ9QrXIBEOKVX8uaDzVdrKWKsN6qzAWmmCuyj3igaOHGa3PYsm
	WCON3J8029QfoKyZpboYrpYzMYwX7rp2rMC9hA7r2KkKRNHYgUyZJdb5CcOquX9vsxQVXcU3l2w
	WPzUr8FCqt+cHvOn0zgKPSp1hAl8=
X-Google-Smtp-Source: AGHT+IFBA2WDy5rfndkCFrdCwmxNol4fvZjfj79ESqo7H7OaRKENVzK1YtrNnc9o9Cno9ydW+N1HhD489fV7NPAOjTI=
X-Received: by 2002:a54:4091:0:b0:3c2:1865:a8a4 with SMTP id
 i17-20020a544091000000b003c21865a8a4mr3138797oii.33.1710018245480; Sat, 09
 Mar 2024 13:04:05 -0800 (PST)
MIME-Version: 1.0
References: <20240309175750.2621579-1-max.oss.09@gmail.com>
In-Reply-To: <20240309175750.2621579-1-max.oss.09@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 9 Mar 2024 16:03:53 -0500
Message-ID: <CADkTA4PBJDhGub=P0JbuhKHj0d2tXt8kx2SXDyvXRy6c2M7iww@mail.gmail.com>
Subject: Re: [REGRESSION] linux (git/curl-native) and autorev
To: max.oss.09@gmail.com, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 21:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196873

On Sat, Mar 9, 2024 at 12:58=E2=80=AFPM <max.oss.09@gmail.com> wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> Hello
>
> If one builds a kernel using AUTOREV invoking bitbake only works once.
> Any subsequent bitbake invocation fails parsing the meta data.
>
> Reproducable with:
> - latest poky, b5624ee564
> - Kernel with SRCREV =3D "AUTOREV", e.g. in local.conf
>   `SRCREV_machine:pn-linux-yocto:forcevariable =3D "${AUTOREV}"`
> - bitbake virtual/kernel; bitbake virtual/kernel
>
> On the second invocation parsing fails when the fetcher tries to
> evaluate the latest SRCREV:
>
> | ERROR: ExpansionError during parsing meta/recipes-kernel/linux/linux-yo=
cto_6.6.bb
> | Traceback (most recent call last):
> |   File "bitbake/lib/bb/fetch2/__init__.py", line 1245, in srcrev_intern=
al_helper(ud=3D<bb.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.data=
_smart.DataSmart object at 0x7f8e26195890>, name=3D'machine'):
> |              d.setVar("__BBAUTOREV_ACTED_UPON", True)
> |     >        srcrev =3D ud.method.latest_revision(ud, d, name)
> |
> |   File "bitbake/lib/bb/fetch2/__init__.py", line 1667, in Git.latest_re=
vision(ud=3D<bb.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.data_sm=
art.DataSmart object at 0x7f8e26195890>, name=3D'machine'):
> |              except KeyError:
> |     >            revs[key] =3D rev =3D self._latest_revision(ud, d, nam=
e)
> |                  return rev
> |   File "bitbake/lib/bb/fetch2/git.py", line 850, in Git._latest_revisio=
n(ud=3D<bb.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.data_smart.D=
ataSmart object at 0x7f8e26195890>, name=3D'machine'):
> |
> |     >        output =3D self._lsremote(ud, d, "")
> |              # Tags of the form ^{} may not work, need to fallback to o=
ther form
> |   File "bitbake/lib/bb/fetch2/git.py", line 833, in Git._lsremote(ud=3D=
<bb.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmar=
t object at 0x7f8e26195890>, search=3D''):
> |                      bb.fetch2.check_network_access(d, cmd, repourl)
> |     >            output =3D runfetchcmd(cmd, d, True)
> |                  if not output:
> |   File "bitbake/lib/bb/fetch2/__init__.py", line 957, in runfetchcmd(cm=
d=3D'export PSEUDO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D"unix:pa=
th=3D/run/user/1003/bus"; export PATH=3D"build/tmp/sysroots-uninative/x86_6=
4-linux/usr/bin:scripts:build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.=
6.20+git/recipe-sysroot-native/usr/bin/x86_64-poky-linux:build/tmp/work/qem=
ux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot/usr/bin/crossscrip=
ts:build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysro=
ot-native/usr/sbin:build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+=
git/recipe-sysroot-native/usr/bin:build/tmp/work/qemux86_64-poky-linux/linu=
x-yocto/6.6.20+git/recipe-sysroot-native/sbin:build/tmp/work/qemux86_64-pok=
y-linux/linux-yocto/6.6.20+git/recipe-sysroot-native/bin:bitbake/bin:build/=
tmp/hosttools"; export HOME=3D"/home/krm"; git -c gc.autoDetach=3Dfalse -c =
core.pager=3Dcat -c safe.bareRepository=3Dall ls-remote https://git.yoctopr=
oject.org/linux-yocto.git ', d=3D<bb.data_smart.DataSmart object at 0x7f8e2=
6195890>, quiet=3DTrue, cleanup=3D[], log=3DNone, workdir=3DNone):
> |
> |     >        raise FetchError(error_message)
> |
> | bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes=
_dummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which=
 triggered exception FetchError: Fetcher failure: Fetch command export PSEU=
DO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1=
003/bus"; export PATH=3D"build/tmp/sysroots-uninative/x86_64-linux/usr/bin:=
scripts:/var/home/krm/build/poky/build/tmp/work/qemux86_64-poky-linux/linux=
-yocto/6.6.20+git/recipe-sysroot-native/usr/bin/x86_64-poky-linux:build/tmp=
/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot/usr/bin/c=
rossscripts:build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/rec=
ipe-sysroot-native/usr/sbin:build/tmp/work/qemux86_64-poky-linux/linux-yoct=
o/6.6.20+git/recipe-sysroot-native/usr/bin:build/tmp/work/qemux86_64-poky-l=
inux/linux-yocto/6.6.20+git/recipe-sysroot-native/sbin:build/tmp/work/qemux=
86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot-native/bin:bitbake/b=
in:build/tmp/hosttools"; export HOME=3D"/home/krm"; git -c gc.autoDetach=3D=
false -c core.pager=3Dcat -c safe.bareRepository=3Dall ls-remote https://gi=
t.yoctoproject.org/linux-yocto.git  failed with exit code 128, output:
> | fatal: unable to access 'https://git.yoctoproject.org/linux-yocto.git/'=
: error setting certificate file: build/tmp/work/x86_64-linux/curl-native/8=
.6.0/recipe-sysroot-native/etc/ssl/certs/ca-certificates.crt
> |
> | The variable dependency chain for the failure is: fetcher_hashes_dummyf=
unc[vardepvalue]
>
> Note:
> One gets out of that parser error by deleting the git binary in the
> kernel's work recipe-sysroot-native
> `rm tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot-=
native/usr/bin/git`
>
> Bisecting poky leads to commit
> f7fa98cca8 ("kern-tools: depend on git-replacement-native")
> Reverting it on top of b5624ee564 makes the parsing pass.
>
> I assume that `git-replacement-native` does not work with https, the
> fetch error also goes away if changing in SRC_URI from https to git.
>
> Any comments?

I didn't even know that curl was coming into play :)

Adding DEPENDS:class-native +=3D "ca-certificates" to the curl recipe
should resolve the issue.

I also tried exporting the SSL_CERT_DIR in the git-native wrapper, but
that didn't help
since of course it is curl that is looking for the certs.

I also thought we could export the SSL_CERT_DIR from within the
kern-tools, but really,
it does seem like curl should know that this is a dependency when used
as a native
tool (it already has ca-certficates as a RRECOMMENDS).

I haven't done a patch for it, because the intricacies of the native
classes and where
we should actually add that depends is someone lost on me.

Richard will likely know the right place to fix it .. and then I'm
happy to spin a patch.

Bruce

>
> Cheers
> Max




--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

