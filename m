Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5579C76188
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 23:02:07 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.87392.1680562927028598929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 16:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=MOJM1c4b;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id t4so25686184wra.7
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 16:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680562925; x=1683154925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jlcF14kqO3+taUeaYgZyzk55AMBY0xvY1N/5N6LQ7us=;
        b=MOJM1c4b7pEZ8Dia0Q6kvjisrf5EWvgIcqT9RoB/K/vahhSn5ax6VkAH4OM97oBfc/
         dU9+pyfpOQhRZeKldyuus5kj0B9f1ufx5UZE7nfKnzpW1byAgzI4gAhX0wXUofgB+ID4
         LLkYUWDLPty3zBcO227pe7ev5BCo7MwC1mWgvu/jRWNTL7+b5c3Tqw0ukuUQbk55q57o
         ekOQFl+qN1P/Qbvk5f7rXidD4hFd9h486stuMmDidicdyey6QdpMTW8OUVPYoHpv+3ng
         2FYDwY4SCiSDgBMxEB8QCWiq13m1N1Kf1ZzFDEW5InMf32Golf3DqHrqHucHjNF/i6OO
         f+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680562925; x=1683154925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlcF14kqO3+taUeaYgZyzk55AMBY0xvY1N/5N6LQ7us=;
        b=XMp6kMXuzcoH+JIJvZBU4/qBOXHUS4uEgh0iMthIALWXM8/M0ram8ec3jek/NGhEdF
         pRaEVhWZRQr32J+oVbBkiLWoY/JGzKl2wdSiAfoSfKbTDbqN/CUOvkNNOtFn9p7Zqz/H
         WJ9CCRy71LNuIu1EIEJWuh8pTPOdaRv1BHS5P7JPovGr5J1FkZpttlM2ggGcAqYBs7vJ
         X6A2Nw3V5QNY7wB7oE5zK22PQE2R2KyGQSbSHgLZknY3pNiP4SM6xSi0KBYBruIUOlLE
         aLlO5s5K/GIX7KDAqCfmhD9Oir8QpjGP3m5KRRh9jxUIpnDChCdkT9RoI+juecywcZ2u
         r0vA==
X-Gm-Message-State: AAQBX9djfrnXRLq3Sd/uM4RQt2ox/MVXUnikk+V2Ffl2LyHLLZFa0/MT
	1hQ3Ii1erH1qJZTslerNs+xcKOrjhlA7671xlRA=
X-Google-Smtp-Source: AKy350bbgZzxnoX30unHl0ptgIgw7gzUriKO5H+TewRV7YQ7v6ZuTc+8tXykNCBoheM7b2AknL7vopjCkktWQrsowMg=
X-Received: by 2002:adf:f78d:0:b0:2e4:cbfe:da3e with SMTP id
 q13-20020adff78d000000b002e4cbfeda3emr42682wrp.1.1680562925255; Mon, 03 Apr
 2023 16:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdaW3zZM83eQ+_R5q4L-vsHKPJ0Nn0jsktauLPx1mEAagg@mail.gmail.com>
 <6415.1680541213641212478@lists.openembedded.org> <CAOSpxdYPskA5Ryfi2VyB1aLxKFPyKQoeFAiBfpFCxCCyp3+V6g@mail.gmail.com>
In-Reply-To: <CAOSpxdYPskA5Ryfi2VyB1aLxKFPyKQoeFAiBfpFCxCCyp3+V6g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Apr 2023 01:01:49 +0200
Message-ID: <CA+chaQfH50Wn8oSTYyt5twxOsYBgU8QxKvEqGwYoBBxF-CWhWA@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
To: Steve Sakoman <steve@sakoman.com>
Cc: Pawan Badganchi <badganchipv@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002ebf6805f8768cca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 23:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179656

--0000000000002ebf6805f8768cca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: I was building from contrib/stable/kirkstone-nut today and I'm seeing
the same as Steve:

meta                 =3D
"stable/kirkstone-nut:14a050c06f25ac643582223ea29abee744cf74ea"
...
ERROR: curl-native-7.82.0-r0 do_patch: Fuzz detected:

Applying patch CVE-2023-23916.patch
patching file lib/content_encoding.c
patching file lib/urldata.h
patching file tests/data/Makefile.inc
Hunk #1 succeeded at 68 with fuzz 2 (offset 2 lines).
patching file tests/data/test418


The context lines in the patches can be updated with devtool:

    devtool modify curl-native
    devtool finish --force-patch-refresh curl-native <layer_path>

Don't forget to review changes done by devtool!

ERROR: curl-native-7.82.0-r0 do_patch: QA Issue: Patch log indicates that
patches do not apply cleanly. [patch-fuzz]

It might be useful if you compare your local MyTopic14
with 14a050c06f25ac643582223ea29abee744cf74ea in oe-core-contrib to see the
diff.

On Mon, Apr 3, 2023 at 7:45=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:

> > Could you please build again
>
> OK, but as expected it still fails!
>
> steve@hexa ~/test $ git clone https://git.yoctoproject.org/poky
> Cloning into 'poky'...
> remote: Enumerating objects: 598292, done.
> remote: Counting objects: 100% (607/607), done.
> remote: Compressing objects: 100% (329/329), done.
> remote: Total 598292 (delta 412), reused 338 (delta 274), pack-reused
> 597685
> Receiving objects: 100% (598292/598292), 190.71 MiB | 11.72 MiB/s, done.
> Resolving deltas: 100% (435720/435720), done.
>
> steve@hexa ~/test $ cd poky/
>
> steve@hexa ~/test/poky (master) $ git checkout origin/kirkstone
> Note: switching to 'origin/kirkstone'.
> <snip>
> HEAD is now at 407c3e0237 systemd: fix wrong nobody-group assignment
>
> steve@hexa ~/test/poky ((HEAD detached at origin/kirkstone)) $ git am
> -3 ~/Downloads/meta-kirkstone-2-2-curl-Add-fix-for-CVE-2023-23916.patch
> Applying: curl: Add fix for CVE-2023-23916
>
> steve@hexa ~/test/poky ((HEAD detached from origin/kirkstone)) $
> source oe-init-build-env
> <snip>
>
> steve@hexa ~/test/poky/build ((HEAD detached from origin/kirkstone)) $
> bitbake curl
> Loading cache: 100% |
>
>
>
>                   | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> Parsing recipes: 100%
>
> |########################################################################=
###########################################################################=
###########################################################################=
##########################################################|
> Time: 0:00:19
> Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642
> targets, 44 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.0.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "ubuntu-22.04"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "4.0.8"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "HEAD:005e7dbceb28cc9925e5756d8828c898f0761bdc"
>
> NOTE: Fetching uninative binary shim
>
> http://downloads.yoctoproject.org/releases/uninative/3.7/x86_64-nativesdk=
-libc-3.7.tar.xz;sha256sum=3Db110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856=
a3594e51eb2aea0570
> (will check PREMIRRORS first)
> Initialising tasks: 100%
>
> |########################################################################=
###########################################################################=
###########################################################################=
#######################################################|
> Time: 0:00:01
> Sstate summary: Wanted 186 Local 0 Mirrors 0 Missed 186 Current 0 (0%
> match, 0% complete)
> NOTE: Executing Tasks
> WARNING: curl-native-7.82.0-r0 do_patch: Fuzz detected:
>
> Applying patch CVE-2023-23916.patch
> patching file lib/content_encoding.c
> patching file lib/urldata.h
> patching file tests/data/Makefile.inc
> Hunk #1 succeeded at 68 with fuzz 2 (offset 2 lines).
> patching file tests/data/test418
>
>
> The context lines in the patches can be updated with devtool:
>
>     devtool modify curl-native
>     devtool finish --force-patch-refresh curl-native <layer_path>
>
> Don't forget to review changes done by devtool!
>
> WARNING: curl-native-7.82.0-r0 do_patch: QA Issue: Patch log indicates
> that patches do not apply cleanly. [patch-fuzz]
> WARNING: curl-7.82.0-r0 do_patch: Fuzz detected:
>
> Applying patch CVE-2023-23916.patch
> patching file lib/content_encoding.c
> patching file lib/urldata.h
> patching file tests/data/Makefile.inc
> Hunk #1 succeeded at 68 with fuzz 2 (offset 2 lines).
> patching file tests/data/test418
>
>
> The context lines in the patches can be updated with devtool:
>
>     devtool modify curl
>     devtool finish --force-patch-refresh curl <layer_path>
>
> Don't forget to review changes done by devtool!
>
> WARNING: curl-7.82.0-r0 do_patch: QA Issue: Patch log indicates that
> patches do not apply cleanly. [patch-fuzz]
> NOTE: Tasks Summary: Attempted 746 tasks of which 0 didn't need to be
> rerun and all succeeded.
>
> Summary: There were 4 WARNING messages.
>
> On Mon, Apr 3, 2023 at 7:00=E2=80=AFAM Pawan Badganchi <badganchipv@gmail=
.com>
> wrote:
> >
> > Hi Steve,
> > I have built with bitbake curl, it got built with no fuzz warnings.
> > Could you please build again. Please find the attached screenshot  belo=
w.
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179648):
> https://lists.openembedded.org/g/openembedded-core/message/179648
> Mute This Topic: https://lists.openembedded.org/mt/97818991/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002ebf6805f8768cca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I was building from contrib/stable/kirkstone-nut tod=
ay and I&#39;m seeing the same as Steve:<div><br><div>meta =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;stable/kirkstone-nut:14=
a050c06f25ac643582223ea29abee744cf74ea&quot;<br></div></div><div>...</div><=
div>ERROR: curl-native-7.82.0-r0 do_patch: Fuzz detected:<br><br>Applying p=
atch CVE-2023-23916.patch<br>patching file lib/content_encoding.c<br>patchi=
ng file lib/urldata.h<br>patching file tests/data/Makefile.inc<br>Hunk #1 s=
ucceeded at 68 with fuzz 2 (offset 2 lines).<br>patching file tests/data/te=
st418<br><br><br>The context lines in the patches can be updated with devto=
ol:<br><br>=C2=A0 =C2=A0 devtool modify curl-native<br>=C2=A0 =C2=A0 devtoo=
l finish --force-patch-refresh curl-native &lt;layer_path&gt;<br><br>Don&#3=
9;t forget to review changes done by devtool!<br><br>ERROR: curl-native-7.8=
2.0-r0 do_patch: QA Issue: Patch log indicates that patches do not apply cl=
eanly. [patch-fuzz]<br></div><div><br></div><div>It might be useful if you =
compare your local MyTopic14 with=C2=A014a050c06f25ac643582223ea29abee744cf=
74ea in oe-core-contrib to see the diff.</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 3, 2023 at 7:45=
=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sa=
koman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt; Could you please build again<br>
<br>
OK, but as expected it still fails!<br>
<br>
steve@hexa ~/test $ git clone <a href=3D"https://git.yoctoproject.org/poky"=
 rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky</a>=
<br>
Cloning into &#39;poky&#39;...<br>
remote: Enumerating objects: 598292, done.<br>
remote: Counting objects: 100% (607/607), done.<br>
remote: Compressing objects: 100% (329/329), done.<br>
remote: Total 598292 (delta 412), reused 338 (delta 274), pack-reused 59768=
5<br>
Receiving objects: 100% (598292/598292), 190.71 MiB | 11.72 MiB/s, done.<br=
>
Resolving deltas: 100% (435720/435720), done.<br>
<br>
steve@hexa ~/test $ cd poky/<br>
<br>
steve@hexa ~/test/poky (master) $ git checkout origin/kirkstone<br>
Note: switching to &#39;origin/kirkstone&#39;.<br>
&lt;snip&gt;<br>
HEAD is now at 407c3e0237 systemd: fix wrong nobody-group assignment<br>
<br>
steve@hexa ~/test/poky ((HEAD detached at origin/kirkstone)) $ git am<br>
-3 ~/Downloads/meta-kirkstone-2-2-curl-Add-fix-for-CVE-2023-23916.patch<br>
Applying: curl: Add fix for CVE-2023-23916<br>
<br>
steve@hexa ~/test/poky ((HEAD detached from origin/kirkstone)) $<br>
source oe-init-build-env<br>
&lt;snip&gt;<br>
<br>
steve@hexa ~/test/poky/build ((HEAD detached from origin/kirkstone)) $<br>
bitbake curl<br>
Loading cache: 100% |<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0=
 --:--:--<br>
Loaded 0 entries from dependency cache.<br>
Parsing recipes: 100%<br>
|##########################################################################=
###########################################################################=
###########################################################################=
########################################################|<br>
Time: 0:00:19<br>
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642<br>
targets, 44 skipped, 0 masked, 0 errors.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.0.0&quot;<br=
>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;ubuntu-22.04&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;4.0.8&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta<br>
meta-poky<br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:005e7dbceb28cc9925e=
5756d8828c898f0761bdc&quot;<br>
<br>
NOTE: Fetching uninative binary shim<br>
<a href=3D"http://downloads.yoctoproject.org/releases/uninative/3.7/x86_64-=
nativesdk-libc-3.7.tar.xz;sha256sum=3Db110bf2e10fe420f5ca2f3ec55f048ee5f0a5=
4c7e34856a3594e51eb2aea0570" rel=3D"noreferrer" target=3D"_blank">http://do=
wnloads.yoctoproject.org/releases/uninative/3.7/x86_64-nativesdk-libc-3.7.t=
ar.xz;sha256sum=3Db110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856a3594e51eb2=
aea0570</a><br>
(will check PREMIRRORS first)<br>
Initialising tasks: 100%<br>
|##########################################################################=
###########################################################################=
###########################################################################=
#####################################################|<br>
Time: 0:00:01<br>
Sstate summary: Wanted 186 Local 0 Mirrors 0 Missed 186 Current 0 (0%<br>
match, 0% complete)<br>
NOTE: Executing Tasks<br>
WARNING: curl-native-7.82.0-r0 do_patch: Fuzz detected:<br>
<br>
Applying patch CVE-2023-23916.patch<br>
patching file lib/content_encoding.c<br>
patching file lib/urldata.h<br>
patching file tests/data/Makefile.inc<br>
Hunk #1 succeeded at 68 with fuzz 2 (offset 2 lines).<br>
patching file tests/data/test418<br>
<br>
<br>
The context lines in the patches can be updated with devtool:<br>
<br>
=C2=A0 =C2=A0 devtool modify curl-native<br>
=C2=A0 =C2=A0 devtool finish --force-patch-refresh curl-native &lt;layer_pa=
th&gt;<br>
<br>
Don&#39;t forget to review changes done by devtool!<br>
<br>
WARNING: curl-native-7.82.0-r0 do_patch: QA Issue: Patch log indicates<br>
that patches do not apply cleanly. [patch-fuzz]<br>
WARNING: curl-7.82.0-r0 do_patch: Fuzz detected:<br>
<br>
Applying patch CVE-2023-23916.patch<br>
patching file lib/content_encoding.c<br>
patching file lib/urldata.h<br>
patching file tests/data/Makefile.inc<br>
Hunk #1 succeeded at 68 with fuzz 2 (offset 2 lines).<br>
patching file tests/data/test418<br>
<br>
<br>
The context lines in the patches can be updated with devtool:<br>
<br>
=C2=A0 =C2=A0 devtool modify curl<br>
=C2=A0 =C2=A0 devtool finish --force-patch-refresh curl &lt;layer_path&gt;<=
br>
<br>
Don&#39;t forget to review changes done by devtool!<br>
<br>
WARNING: curl-7.82.0-r0 do_patch: QA Issue: Patch log indicates that<br>
patches do not apply cleanly. [patch-fuzz]<br>
NOTE: Tasks Summary: Attempted 746 tasks of which 0 didn&#39;t need to be<b=
r>
rerun and all succeeded.<br>
<br>
Summary: There were 4 WARNING messages.<br>
<br>
On Mon, Apr 3, 2023 at 7:00=E2=80=AFAM Pawan Badganchi &lt;<a href=3D"mailt=
o:badganchipv@gmail.com" target=3D"_blank">badganchipv@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; Hi Steve,<br>
&gt; I have built with bitbake curl, it got built with no fuzz warnings.<br=
>
&gt; Could you please build again. Please find the attached screenshot=C2=
=A0 below.<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179648): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179648" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179648</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97818991/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97818991/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002ebf6805f8768cca--

