Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666E1CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 13:57:44 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.38684.1712239054004089667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 06:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jx+CIAzr;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7e3f939cb94so295500241.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712239053; x=1712843853; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IRzNK4w24Jha3WTScCPBL5qy03G4jTxph4OLy47rqno=;
        b=jx+CIAzrdtFMnA0Uo2/fn454hXtbBZ/tb5wClbRuJO/N6UQmAlv85SPtROU7EACYFa
         XcrVMZY0rzKRPwXdpIlDTk6XfTT6/nZ7nl5XFDGHuJYWuEosFurGgTl2MZgSMhScuQc2
         z/NANGrxghBv+8lO74FMYfLZ0AISpZMzeJiQlHGR0BCO1fWKPMyzb27agxDVNLxLF0Jy
         3ot3sFHXFDuMj33RVIDq2Biujz8ndpUbWxVlHTysd64HR6Tza1QdA70TmlLGczxAxwB5
         U/4d+9ITCUhwltbRUu6FGvhNcoCUpc1T7IKOWscCvbDSUbNJWYQipYU5KAW7jizDv6kZ
         WjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712239053; x=1712843853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRzNK4w24Jha3WTScCPBL5qy03G4jTxph4OLy47rqno=;
        b=IC33j1M3AgI6n6+/WGk0dEZjOnwJFbDvJLoJXcxeUebst+lpqvqAM+HvqC3LYmdgLI
         VmZzg6acc1BNAWAuK73IHJ+G19Ep8rwjgg+uWYEqwVbDxtHSVRvQOYNJ2BwoteBdBumq
         NrFjQAGZLbmZsbGab8Qa9cqg9u5HkzxNrHpFttS3P3PaIV/8foyxELuP79eC0PVOTWwB
         t/fYbSjySFxhlt5WVEyhiY6Ocg04qAtXu3+KISYGbZjUD1CvN4cUHurMYonjyIm2TaHU
         7CKhdZew5E7BgDFay5hR2zt48fgqYqv2vrovyPCEHCmUpF2um5wbmDJP1m0MlDEkmQgH
         1Xzg==
X-Gm-Message-State: AOJu0Yy8fY9QMXdcwziefTTU0ISU/LTGGjTL7+yOD/1vZP/ecw3hTpXj
	BjyAa8MlkfwFFMd6jE0dxkfrFvvusYmNZANUOgnbnBuBubdd3uybD5IRZQd/3x2nnJyeKVBF26B
	4JEFwF4f1R6ehhrBkkTnKzb2Uo0M=
X-Google-Smtp-Source: AGHT+IF3ysf6IE7t1ViaO3fg1KQn1JwKld3W7r/Bh8zusA8X0sv2Pdn0ACqMIeMtl8NOFbvNA1HGwkxdFNFafCGyBXI=
X-Received: by 2002:a05:6102:4a7:b0:478:4118:8be2 with SMTP id
 r7-20020a05610204a700b0047841188be2mr2214201vsa.20.1712239051693; Thu, 04 Apr
 2024 06:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240404132902.68631-1-mikko.rapeli@linaro.org> <20240404132902.68631-2-mikko.rapeli@linaro.org>
In-Reply-To: <20240404132902.68631-2-mikko.rapeli@linaro.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 4 Apr 2024 14:57:20 +0100
Message-ID: <CANPvuRnAhHTg8rftCLuHzcWh5Cdy9P0gdZByD1+s6MV8r7kzmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] curl: disable ca-certificates.crt path
 setting for native build
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007265b7061545b893"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 13:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197965

--0000000000007265b7061545b893
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikko,

Did you test with the below change already merged on master?
Looks like it was to fix the same issue.

git: git-replacement-native: depend on ca-certificate
https://git.yoctoproject.org/poky/commit/meta/recipes-devtools/git?id=3D421=
083c46c97bf758496b8c58402aea5d74aa097

Jose

Mikko Rapeli <mikko.rapeli@linaro.org> escreveu (quinta, 4/04/2024 =C3=A0(s=
)
14:29):

> If linux-yocto-dev is compiled without specific SRCREV, it uses
> AUTOREV which tries to update to latest available commit. This is
> currently failing with these steps:
>
> $ rm -rf tmp*/work/*/linux-yocto-dev && \
> bitbake -c do_configure mc:machine:linux-yocto-dev ; \
> bitbake -c do_clean mc:machine:linux-yocto-dev
> ...
> Parsing recipes...WARNING:
> /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/
> linux-yocto-dev.bb: Exception during build_dependencies for
> fetcher_hashes_dummyfunc
> WARNING: /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/
> linux-yocto-dev.bb: Error during finalise of
> /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/
> linux-yocto-dev.bb
> WARNING: /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/
> linux-yocto-dev.bb: Exception during build_dependencies for
> fetcher_hashes_dummyfunc
> WARNING: /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/
> linux-yocto-dev.bb: Error during finalise of
> mc:poky:/home/builder/src/base/build/../poky/meta/recipes-kernel/linux/
> linux-yocto-dev.bb
> ERROR: ExpansionError during parsing
> /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/
> linux-yocto-dev.bb
> Traceback (most recent call last):
>   File "/home/builder/src/base/poky/bitbake/lib/bb/fetch2/__init__.py",
> line 1245, in srcrev_internal_helper(ud=3D<bb.fetch2.FetchData object at
> 0x7f34e5f61330>, d=3D<bb.data_smart.DataSmart object at 0x7f34e5ff22f0>,
> name=3D'machine'):
>              d.setVar("__BBAUTOREV_ACTED_UPON", True)
>     >        srcrev =3D ud.method.latest_revision(ud, d, name)
>
>   File "/home/builder/src/base/poky/bitbake/lib/bb/fetch2/__init__.py",
> line 1667, in Git.latest_revision(ud=3D<bb.fetch2.FetchData object at
> 0x7f34e5f61330>, d=3D<bb.data_smart.DataSmart object at 0x7f34e5ff22f0>,
> name=3D'machine'):
>              except KeyError:
>     >            revs[key] =3D rev =3D self._latest_revision(ud, d, name)
>                  return rev
>   File "/home/builder/src/base/poky/bitbake/lib/bb/fetch2/git.py", line
> 850, in Git._latest_revision(ud=3D<bb.fetch2.FetchData object at
> 0x7f34e5f61330>, d=3D<bb.data_smart.DataSmart object at 0x7f34e5ff22f0>,
> name=3D'machine'):
>
>     >        output =3D self._lsremote(ud, d, "")
>              # Tags of the form ^{} may not work, need to fallback to
> other form
>   File "/home/builder/src/base/poky/bitbake/lib/bb/fetch2/git.py", line
> 833, in Git._lsremote(ud=3D<bb.fetch2.FetchData object at 0x7f34e5f61330>=
,
> d=3D<bb.data_smart.DataSmart object at 0x7f34e5ff22f0>, search=3D''):
>                      bb.fetch2.check_network_access(d, cmd, repourl)
>     >            output =3D runfetchcmd(cmd, d, True)
>                  if not output:
>   File "/home/builder/src/base/poky/bitbake/lib/bb/fetch2/__init__.py",
> line 957, in runfetchcmd(cmd=3D'export PSEUDO_DISABLED=3D1; export
> DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/15818/bus"; export
> PATH=3D"/home/builder/src/base/build/tmp_poky/sysroots-uninative/x86_64-l=
inux/usr/bin:/home/builder/src/base/poky/scripts:/home/builder/src/base/bui=
ld/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-nat=
ive/usr/bin/aarch64-poky-linux:/home/builder/src/base/build/tmp_poky/work/p=
oky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot/usr/bin/crossscripts:=
/home/builder/src/base/build/tmp_poky/work/poky-poky-linux/linux-yocto-dev/=
6.8+git/recipe-sysroot-native/usr/sbin:/home/builder/src/base/build/tmp_pok=
y/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-native/usr/bi=
n:/home/builder/src/base/build/tmp_poky/work/poky-poky-linux/linux-yocto-de=
v/6.8+git/recipe-sysroot-native/sbin:/home/builder/src/base/build/tmp_poky/=
work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-native/bin:/hom=
e/builder/src/base/poky/bitbake/bin:/home/builder/src/base/build/tmp_poky/h=
osttools";
> export HOME=3D"/home/builder"; git -c gc.autoDetach=3Dfalse -c core.pager=
=3Dcat
> -c safe.bareRepository=3Dall ls-remote
> https://git.yoctoproject.org/linux-yocto-dev.git ',
> d=3D<bb.data_smart.DataSmart object at 0x7f34e5ff22f0>, quiet=3DTrue,
> cleanup=3D[], log=3DNone, workdir=3DNone):
>
>     >        raise FetchError(error_message)
>
> bb.data_smart.ExpansionError: Failure expanding variable
> fetcher_hashes_dummyfunc[vardepvalue], expression was
> ${@bb.fetch.get_hashvalue(d)} which triggered exception FetchError: Fetch=
er
> failure: Fetch command export PSEUDO_DISABLED=3D1; export
> DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/15818/bus"; export
> PATH=3D"/home/builder/src/base/build/tmp_poky/sysroots-uninative/x86_64-l=
inux/usr/bin:/home/builder/src/base/poky/scripts:/home/builder/src/base/bui=
ld/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-nat=
ive/usr/bin/aarch64-poky-linux:/home/builder/src/base/build/tmp_poky/work/p=
oky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot/usr/bin/crossscripts:=
/home/builder/src/base/build/tmp_poky/work/poky-poky-linux/linux-yocto-dev/=
6.8+git/recipe-sysroot-native/usr/sbin:/home/builder/src/base/build/tmp_pok=
y/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-native/usr/bi=
n:/home/builder/src/base/build/tmp_poky/work/poky-poky-linux/linux-yocto-de=
v/6.8+git/recipe-sysroot-native/sbin:/home/builder/src/base/build/tmp_poky/=
work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-native/bin:/hom=
e/builder/src/base/poky/bitbake/bin:/home/builder/src/base/build/tmp_poky/h=
osttools";
> export HOME=3D"/home/builder"; git -c gc.autoDetach=3Dfalse -c core.pager=
=3Dcat
> -c safe.bareRepository=3Dall ls-remote
> https://git.yoctoproject.org/linux-yocto-dev.git  failed with exit code
> 128, output:
> fatal: unable to access 'https://git.yoctoproject.org/linux-yocto-dev.git=
/':
> error setting certificate file:
> /home/builder/src/base/build/tmp_poky/work/x86_64-linux/curl-native/8.6.0=
/recipe-sysroot-native/etc/ssl/certs/ca-certificates.crt
>
> The variable dependency chain for the failure is:
> fetcher_hashes_dummyfunc[vardepvalue]
>
> ERROR: Parsing halted due to errors, see error messages above
>
> Summary: There were 6 WARNING messages.
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
>
> This state is not recoverable with bitbake calls. All of them fail from
> now on.
> "rm -rf tmp/work/*/linux-yocto-dev" recovers the situation
> and bitbake commands work again.
>
> Root cause is curl-native, dependency of git-native, which
> has --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt
> which for native build target is wrong and points to curl-native build
> directory path
>
> /home/builder/src/base/build/tmp_poky/work/x86_64-linux/curl-native/8.6.0=
/recipe-sysroot-native/etc/ssl/certs/ca-certificates.crt
>
> Since git is a build time host package dependency listed in
> https://docs.yoctoproject.org/dev/singleindex.html#build-host-packages
> then its dependencies like curl and ca-certificates are too, it should
> be safe for curl-native to use the default host ca-certificates path
> instead of the one in recipe specific sysroots which would need to be set
> with complicated
> environment variables. Set non-default ca-certificates path only for
> target and nativesdk builds.
>
> Reported-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/recipes-support/curl/curl_8.6.0.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/curl/curl_8.6.0.bb
> b/meta/recipes-support/curl/curl_8.6.0.bb
> index 49ba0cb4a7..da5571ca14 100644
> --- a/meta/recipes-support/curl/curl_8.6.0.bb
> +++ b/meta/recipes-support/curl/curl_8.6.0.bb
> @@ -73,11 +73,16 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,z=
std"
>  EXTRA_OECONF =3D " \
>      --disable-libcurl-option \
>      --disable-ntlm-wb \
> -    --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
>      --without-libpsl \
>      --enable-optimize \
>      ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls
> mbedtls openssl', d) =3D=3D '') else ''} \
>  "
> +EXTRA_OECONF:class-target =3D " \
> +    --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
> +"
> +EXTRA_OECONF:class-nativesdk =3D " \
> +    --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
> +"
>
>  fix_absolute_paths () {
>         # cleanup buildpaths from curl-config
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197964):
> https://lists.openembedded.org/g/openembedded-core/message/197964
> Mute This Topic: https://lists.openembedded.org/mt/105328588/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007265b7061545b893
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mikko,<br><br></div><div>Did you test with the bel=
ow change already merged=C2=A0on master?<br></div><div><div>Looks like it w=
as to fix the same=C2=A0issue.<br><br>git: git-replacement-native: depend o=
n ca-certificate<br></div><div><a href=3D"https://git.yoctoproject.org/poky=
/commit/meta/recipes-devtools/git?id=3D421083c46c97bf758496b8c58402aea5d74a=
a097" target=3D"_blank">https://git.yoctoproject.org/poky/commit/meta/recip=
es-devtools/git?id=3D421083c46c97bf758496b8c58402aea5d74aa097</a><br></div>=
<div><br></div></div>Jose<div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@lin=
aro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt; escreveu (quinta=
, 4/04/2024 =C3=A0(s) 14:29):<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">If linux-yocto-dev is compiled without specific SRCREV, it us=
es<br>
AUTOREV which tries to update to latest available commit. This is<br>
currently failing with these steps:<br>
<br>
$ rm -rf tmp*/work/*/linux-yocto-dev &amp;&amp; \<br>
bitbake -c do_configure mc:machine:linux-yocto-dev ; \<br>
bitbake -c do_clean mc:machine:linux-yocto-dev<br>
...<br>
Parsing recipes...WARNING: /home/builder/src/base/build/../poky/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto-dev.bb</a>: Exception during build_dependencies =
for fetcher_hashes_dummyfunc<br>
WARNING: /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/<a =
href=3D"http://linux-yocto-dev.bb" rel=3D"noreferrer" target=3D"_blank">lin=
ux-yocto-dev.bb</a>: Error during finalise of /home/builder/src/base/build/=
../poky/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
WARNING: /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/<a =
href=3D"http://linux-yocto-dev.bb" rel=3D"noreferrer" target=3D"_blank">lin=
ux-yocto-dev.bb</a>: Exception during build_dependencies for fetcher_hashes=
_dummyfunc<br>
WARNING: /home/builder/src/base/build/../poky/meta/recipes-kernel/linux/<a =
href=3D"http://linux-yocto-dev.bb" rel=3D"noreferrer" target=3D"_blank">lin=
ux-yocto-dev.bb</a>: Error during finalise of mc:poky:/home/builder/src/bas=
e/build/../poky/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
ERROR: ExpansionError during parsing /home/builder/src/base/build/../poky/m=
eta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=3D"noref=
errer" target=3D"_blank">linux-yocto-dev.bb</a><br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/builder/src/base/poky/bitbake/lib/bb/fetch2/__init_=
_.py&quot;, line 1245, in srcrev_internal_helper(ud=3D&lt;bb.fetch2.FetchDa=
ta object at 0x7f34e5f61330&gt;, d=3D&lt;bb.data_smart.DataSmart object at =
0x7f34e5ff22f0&gt;, name=3D&#39;machine&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;__BBAUTOREV_=
ACTED_UPON&quot;, True)<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcrev =3D ud.method.latest_r=
evision(ud, d, name)<br>
<br>
=C2=A0 File &quot;/home/builder/src/base/poky/bitbake/lib/bb/fetch2/__init_=
_.py&quot;, line 1667, in Git.latest_revision(ud=3D&lt;bb.fetch2.FetchData =
object at 0x7f34e5f61330&gt;, d=3D&lt;bb.data_smart.DataSmart object at 0x7=
f34e5ff22f0&gt;, name=3D&#39;machine&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except KeyError:<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 revs[key] =3D r=
ev =3D self._latest_revision(ud, d, name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rev<br=
>
=C2=A0 File &quot;/home/builder/src/base/poky/bitbake/lib/bb/fetch2/git.py&=
quot;, line 850, in Git._latest_revision(ud=3D&lt;bb.fetch2.FetchData objec=
t at 0x7f34e5f61330&gt;, d=3D&lt;bb.data_smart.DataSmart object at 0x7f34e5=
ff22f0&gt;, name=3D&#39;machine&#39;):<br>
<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D self._lsremote(ud,=
 d, &quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Tags of the form ^{} may =
not work, need to fallback to other form<br>
=C2=A0 File &quot;/home/builder/src/base/poky/bitbake/lib/bb/fetch2/git.py&=
quot;, line 833, in Git._lsremote(ud=3D&lt;bb.fetch2.FetchData object at 0x=
7f34e5f61330&gt;, d=3D&lt;bb.data_smart.DataSmart object at 0x7f34e5ff22f0&=
gt;, search=3D&#39;&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.fetch2.check_network_access(d, cmd, repourl)<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D runf=
etchcmd(cmd, d, True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not output=
:<br>
=C2=A0 File &quot;/home/builder/src/base/poky/bitbake/lib/bb/fetch2/__init_=
_.py&quot;, line 957, in runfetchcmd(cmd=3D&#39;export PSEUDO_DISABLED=3D1;=
 export DBUS_SESSION_BUS_ADDRESS=3D&quot;unix:path=3D/run/user/15818/bus&qu=
ot;; export PATH=3D&quot;/home/builder/src/base/build/tmp_poky/sysroots-uni=
native/x86_64-linux/usr/bin:/home/builder/src/base/poky/scripts:/home/build=
er/src/base/build/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/rec=
ipe-sysroot-native/usr/bin/aarch64-poky-linux:/home/builder/src/base/build/=
tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot/usr/bi=
n/crossscripts:/home/builder/src/base/build/tmp_poky/work/poky-poky-linux/l=
inux-yocto-dev/6.8+git/recipe-sysroot-native/usr/sbin:/home/builder/src/bas=
e/build/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroo=
t-native/usr/bin:/home/builder/src/base/build/tmp_poky/work/poky-poky-linux=
/linux-yocto-dev/6.8+git/recipe-sysroot-native/sbin:/home/builder/src/base/=
build/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-=
native/bin:/home/builder/src/base/poky/bitbake/bin:/home/builder/src/base/b=
uild/tmp_poky/hosttools&quot;; export HOME=3D&quot;/home/builder&quot;; git=
 -c gc.autoDetach=3Dfalse -c core.pager=3Dcat -c safe.bareRepository=3Dall =
ls-remote <a href=3D"https://git.yoctoproject.org/linux-yocto-dev.git" rel=
=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/linux-yocto-=
dev.git</a> &#39;, d=3D&lt;bb.data_smart.DataSmart object at 0x7f34e5ff22f0=
&gt;, quiet=3DTrue, cleanup=3D[], log=3DNone, workdir=3DNone):<br>
<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise FetchError(error_messag=
e)<br>
<br>
bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_dum=
myfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which tri=
ggered exception FetchError: Fetcher failure: Fetch command export PSEUDO_D=
ISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D&quot;unix:path=3D/run/user/=
15818/bus&quot;; export PATH=3D&quot;/home/builder/src/base/build/tmp_poky/=
sysroots-uninative/x86_64-linux/usr/bin:/home/builder/src/base/poky/scripts=
:/home/builder/src/base/build/tmp_poky/work/poky-poky-linux/linux-yocto-dev=
/6.8+git/recipe-sysroot-native/usr/bin/aarch64-poky-linux:/home/builder/src=
/base/build/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/recipe-sy=
sroot/usr/bin/crossscripts:/home/builder/src/base/build/tmp_poky/work/poky-=
poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-native/usr/sbin:/home/bui=
lder/src/base/build/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/r=
ecipe-sysroot-native/usr/bin:/home/builder/src/base/build/tmp_poky/work/pok=
y-poky-linux/linux-yocto-dev/6.8+git/recipe-sysroot-native/sbin:/home/build=
er/src/base/build/tmp_poky/work/poky-poky-linux/linux-yocto-dev/6.8+git/rec=
ipe-sysroot-native/bin:/home/builder/src/base/poky/bitbake/bin:/home/builde=
r/src/base/build/tmp_poky/hosttools&quot;; export HOME=3D&quot;/home/builde=
r&quot;; git -c gc.autoDetach=3Dfalse -c core.pager=3Dcat -c safe.bareRepos=
itory=3Dall ls-remote <a href=3D"https://git.yoctoproject.org/linux-yocto-d=
ev.git" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/l=
inux-yocto-dev.git</a>=C2=A0 failed with exit code 128, output:<br>
fatal: unable to access &#39;<a href=3D"https://git.yoctoproject.org/linux-=
yocto-dev.git/" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproje=
ct.org/linux-yocto-dev.git/</a>&#39;: error setting certificate file: /home=
/builder/src/base/build/tmp_poky/work/x86_64-linux/curl-native/8.6.0/recipe=
-sysroot-native/etc/ssl/certs/ca-certificates.crt<br>
<br>
The variable dependency chain for the failure is: fetcher_hashes_dummyfunc[=
vardepvalue]<br>
<br>
ERROR: Parsing halted due to errors, see error messages above<br>
<br>
Summary: There were 6 WARNING messages.<br>
Summary: There were 2 ERROR messages, returning a non-zero exit code.<br>
<br>
This state is not recoverable with bitbake calls. All of them fail from now=
 on.<br>
&quot;rm -rf tmp/work/*/linux-yocto-dev&quot; recovers the situation<br>
and bitbake commands work again.<br>
<br>
Root cause is curl-native, dependency of git-native, which<br>
has --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt<br>
which for native build target is wrong and points to curl-native build<br>
directory path<br>
/home/builder/src/base/build/tmp_poky/work/x86_64-linux/curl-native/8.6.0/r=
ecipe-sysroot-native/etc/ssl/certs/ca-certificates.crt<br>
<br>
Since git is a build time host package dependency listed in<br>
<a href=3D"https://docs.yoctoproject.org/dev/singleindex.html#build-host-pa=
ckages" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/=
dev/singleindex.html#build-host-packages</a><br>
then its dependencies like curl and ca-certificates are too, it should<br>
be safe for curl-native to use the default host ca-certificates path<br>
instead of the one in recipe specific sysroots which would need to be set w=
ith complicated<br>
environment variables. Set non-default ca-certificates path only for<br>
target and nativesdk builds.<br>
<br>
Reported-by: Mathieu Poirier &lt;<a href=3D"mailto:mathieu.poirier@linaro.o=
rg" target=3D"_blank">mathieu.poirier@linaro.org</a>&gt;<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_8.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.6.0.bb</a> | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_8.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_8.6.0.bb</a> b/meta/recipes-support/=
curl/<a href=3D"http://curl_8.6.0.bb" rel=3D"noreferrer" target=3D"_blank">=
curl_8.6.0.bb</a><br>
index 49ba0cb4a7..da5571ca14 100644<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_8.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.6.0.bb</a><br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_8.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.6.0.bb</a><br>
@@ -73,11 +73,16 @@ PACKAGECONFIG[zstd] =3D &quot;--with-zstd,--without-zst=
d,zstd&quot;<br>
=C2=A0EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--disable-libcurl-option \<br>
=C2=A0 =C2=A0 =C2=A0--disable-ntlm-wb \<br>
-=C2=A0 =C2=A0 --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.c=
rt \<br>
=C2=A0 =C2=A0 =C2=A0--without-libpsl \<br>
=C2=A0 =C2=A0 =C2=A0--enable-optimize \<br>
=C2=A0 =C2=A0 =C2=A0${@&#39;--without-ssl&#39; if (bb.utils.filter(&#39;PAC=
KAGECONFIG&#39;, &#39;gnutls mbedtls openssl&#39;, d) =3D=3D &#39;&#39;) el=
se &#39;&#39;} \<br>
=C2=A0&quot;<br>
+EXTRA_OECONF:class-target =3D &quot; \<br>
+=C2=A0 =C2=A0 --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.c=
rt \<br>
+&quot;<br>
+EXTRA_OECONF:class-nativesdk =3D &quot; \<br>
+=C2=A0 =C2=A0 --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.c=
rt \<br>
+&quot;<br>
<br>
=C2=A0fix_absolute_paths () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cleanup buildpaths from curl-config<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197964): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197964" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197964</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105328588/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105328588/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div></div>

--0000000000007265b7061545b893--

