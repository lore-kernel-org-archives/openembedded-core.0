Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19874C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 18:12:24 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.11125.1655921543079421725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 11:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout12.t-online.de (Postfix) with SMTP id 30F4C11221;
	Wed, 22 Jun 2022 20:12:20 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.39.186]) by fwd72.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o44pv-26E21B0; Wed, 22 Jun 2022 20:12:19 +0200
Content-Type: multipart/alternative;
 boundary="------------b3xwM4Y6CvbHGuIu6a6wFGQc"
Message-ID: <1e812c58-6db5-9cd0-f56d-30f52225abb7@t-online.de>
Date: Wed, 22 Jun 2022 20:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] Easyish reproducibility issue for someone?
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: 
 <31700e81f90027d7359c688ac8b3d5bdf914a0f9.camel@linuxfoundation.org>
 <1df0fc03-e1f3-de99-bf81-f19c022e9fa7@weidmueller.com>
 <679be2d1-4311-41af-d2e5-4132c96b3421@t-online.de>
 <976357c9-f919-bf53-afe6-dbf71ee2c75f@weidmueller.com>
 <4f80bb16-6601-f3b7-fe37-d8fa545e5dce@t-online.de>
 <CANPvuRkDaGHrggCtEMGszEtvWrQh=-KKHzHp7gawDja5W-EU5w@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CANPvuRkDaGHrggCtEMGszEtvWrQh=-KKHzHp7gawDja5W-EU5w@mail.gmail.com>
X-TOI-EXPURGATEID: 150726::1655921539-01439E5E-46DC3DB7/0/0 CLEAN NORMAL
X-TOI-MSGID: 839506fa-651d-4184-99ba-9a3ee47d3718
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 18:12:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167248

This is a multi-part message in MIME format.
--------------b3xwM4Y6CvbHGuIu6a6wFGQc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Jose,

as far as I can see, it works like this. With an empty PACKAGECONFIG it=20
is disabled:

~/build/poky/build-intel/tmp/work/corei7-64-poky-linux/llvm/14.0.4-r0/bui=
ld$=20
grep -r LLVM_HAVE_OPT_VIEWER_MODULES .
./lib/cmake/llvm/LLVMConfig.cmake:set(LLVM_HAVE_OPT_VIEWER_MODULES 0)
./cmake/modules/CMakeFiles/LLVMConfig.cmake:set(LLVM_HAVE_OPT_VIEWER_MODU=
LES=20
0)

and if taking the option it gets set to 1.

And you are right about that we need to provide python3-native. If done=20
so do_configure.log looks like this:

-- Found Python module pygments
-- Could NOT find Python module pygments.lexers.c_cpp
-- Found Python module yaml

and LLVM_HAVE_OPT_VIEWER_MODULES gets set to 0 also.

If its just about to avoid building OPT_VIEWER_MODULES it would be=20
enough to just use the second patch i've sent.

Markus


Am 22.06.22 um 19:52 schrieb Jose Quaresma:
> Hi=C2=A0Markus,
>
> Markus Volk <f_l_k@t-online.de> escreveu no dia quarta, 22/06/2022=20
> =C3=A0(s) 16:28:
>
>     I had not tried it, but in the meantime I did and it works with
>
>     PACKAGECONFIG ?=3D ""
>     PACKAGECONFIG[optviewer] =3D "-DPY_PYGMENTS_FOUND=3DON
>     -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DON
>     -DPY_YAML_FOUND=3DON,-DPY_PYGMENTS_FOUND=3DOFF,,python3-pygments
>     python3-pyyaml"
>
>
> As said previously and if it is contaminated by the host python=20
> packages we need to provide=C2=A0the native version
> so=C2=A0cmake will search for it on native systroot. if the tools are n=
ot=20
> there it will use the host version again.
> Is this=C2=A0right or=C2=A0I missing something?
>
> Jose
>
>
>     Markus
>
>     Am 22.06.22 um 17:06 schrieb Stefan Herbrechtsmeier:
>     > Hi Markus,
>     >
>     > Am 22.06.2022 um 16:18 schrieb Markus Volk via
>     lists.openembedded.org <http://lists.openembedded.org>:
>     >> Hi,
>     >>
>     >> couldn't we just do it like this?
>     >>
>     >> PACKAGECONFIG ?=3D ""
>     >> PACKAGECONFIG[optviewer] =3D
>     >>
>     "-DLLVM_HAVE_OPT_VIEWER_MODULES=3DON,-DLLVM_HAVE_OPT_VIEWER_MODULES=
=3DOFF,,python3-pygments
>
>     >> python3-pyyaml"
>     >>
>     >> Depending on wether the PACKAGECONFIG option is taken it looks
>     like
>     >> this in CMakeCache.txt:
>     >>
>     >> //No help, variable specified on the command line.
>     >> LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DOFF
>     >>
>     >> //No help, variable specified on the command line.
>     >> LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DON
>     >
>     > Have you test it? The config-ix.cmake file sets the
>     > LLVM_HAVE_OPT_VIEWER_MODULES variable [1].
>     >
>     > Instead of LLVM_HAVE_OPT_VIEWER_MODULES I would set
>     PY_PYGMENTS_FOUND,
>     > PY_PYGMENTS_LEXERS_C_CPP_FOUND and PY_YAML_FOUND.
>     >
>     > [1]
>     >
>     https://github.com/llvm/llvm-project/blob/main/llvm/cmake/config-ix=
.cmake#L693
>     >
>     > Regards
>     > =C2=A0 Stefan
>     >
>     >> Am 22.06.22 um 15:54 schrieb Stefan Herbrechtsmeier:
>     >>> Hi Richard,
>     >>>
>     >>> Am 22.06.2022 um 15:10 schrieb Richard Purdie via
>     >>> lists.openembedded.org <http://lists.openembedded.org>:
>     >>>> There is a reproducibility issue which shouldn't be too hard
>     to fix if
>     >>>> someone had a few minutes to help out:
>     >>>>
>     >>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14845
>     >>>>
>     >>>> It is in llvm and is a cmake configuration issue. Rather than
>     setting
>     >>>> that option based on the presence of python modules (with
>     python from
>     >>>> the host), we should add a configuration option to force it to=
 be
>     >>>> disabled in our case. Should be upstreamable with the right
>     patch.
>     >>>
>     >>> I'm not able to test it at the moment but it should be
>     possible to
>     >>> set the variables (PY_PYGMENTS_FOUND,
>     PY_PYGMENTS_LEXERS_C_CPP_FOUND
>     >>> and PY_YAML_FOUND) to OFF via EXTRA_OECMAKE:
>     >>>
>     >>> -DPY_PYGMENTS_FOUND=3DOFF
>     >>>
>     >>> The find_python_module function in config-ix.cmake returns
>     early if
>     >>> the variable PY_${module_upper}_FOUND is defined.
>     >>>
>     >>> Regards
>     >>> =C2=A0 Stefan
>     >>>
>     >
>     >
>     >
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#167242):
>     https://lists.openembedded.org/g/openembedded-core/message/167242
>     Mute This Topic: https://lists.openembedded.org/mt/91921251/5052612
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     [quaresma.jose@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> Best regards,
>
> Jos=C3=A9 Quaresma
--------------b3xwM4Y6CvbHGuIu6a6wFGQc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Jose,</p>
    <p>as far as I can see, it works like this. With an empty
      PACKAGECONFIG it is disabled:</p>
    <p>~/build/poky/build-intel/tmp/work/corei7-64-poky-linux/llvm/14.0.4=
-r0/build$
      grep -r LLVM_HAVE_OPT_VIEWER_MODULES .<br>
      ./lib/cmake/llvm/LLVMConfig.cmake:set(LLVM_HAVE_OPT_VIEWER_MODULES
      0)<br>
./cmake/modules/CMakeFiles/LLVMConfig.cmake:set(LLVM_HAVE_OPT_VIEWER_MODU=
LES
      0)<br>
    </p>
    <p>and if taking the option it gets set to 1.<br>
    </p>
    <p>And you are right about that we need to provide python3-native.
      If done so do_configure.log looks like this:</p>
    <p>-- Found Python module pygments<br>
      -- Could NOT find Python module pygments.lexers.c_cpp<br>
      -- Found Python module yaml</p>
    <p>and LLVM_HAVE_OPT_VIEWER_MODULES gets set to 0 also.</p>
    <p>If its just about to avoid building OPT_VIEWER_MODULES it would
      be enough to just use the second patch i've sent.</p>
    <p>Markus<br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">Am 22.06.22 um 19:52 schrieb Jose
      Quaresma:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANPvuRkDaGHrggCtEMGszEtvWrQh=3D-KKHzHp7gawDja5W-EU5w@mail.gm=
ail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div dir=3D"ltr">Hi=C2=A0Markus,</div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">Markus Volk &lt;<a
              href=3D"mailto:f_l_k@t-online.de" moz-do-not-send=3D"true"
              class=3D"moz-txt-link-freetext">f_l_k@t-online.de</a>&gt;
            escreveu no dia quarta, 22/06/2022 =C3=A0(s) 16:28:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">I had not tried it, but
            in the meantime I did and it works with<br>
            <br>
            PACKAGECONFIG ?=3D ""<br>
            PACKAGECONFIG[optviewer] =3D "-DPY_PYGMENTS_FOUND=3DON <br>
            -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DON <br>
            -DPY_YAML_FOUND=3DON,-DPY_PYGMENTS_FOUND=3DOFF,,python3-pygme=
nts
            python3-pyyaml"<br>
          </blockquote>
          <div><br>
          </div>
          <div>As said previously and if it is contaminated by the host
            python packages we need to provide=C2=A0the native version</d=
iv>
          <div>so=C2=A0cmake will search for it on native systroot. if th=
e
            tools are not there it will use the host version again.<br>
            Is this=C2=A0right or=C2=A0I missing something?</div>
          <div><br>
          </div>
          <div>Jose</div>
          <div><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            Markus<br>
            <br>
            Am 22.06.22 um 17:06 schrieb Stefan Herbrechtsmeier:<br>
            &gt; Hi Markus,<br>
            &gt;<br>
            &gt; Am 22.06.2022 um 16:18 schrieb Markus Volk via <a
              href=3D"http://lists.openembedded.org" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">lists.openembedd=
ed.org</a>:<br>
            &gt;&gt; Hi,<br>
            &gt;&gt;<br>
            &gt;&gt; couldn't we just do it like this?<br>
            &gt;&gt;<br>
            &gt;&gt; PACKAGECONFIG ?=3D ""<br>
            &gt;&gt; PACKAGECONFIG[optviewer] =3D <br>
            &gt;&gt;
"-DLLVM_HAVE_OPT_VIEWER_MODULES=3DON,-DLLVM_HAVE_OPT_VIEWER_MODULES=3DOFF=
,,python3-pygments
            <br>
            &gt;&gt; python3-pyyaml"<br>
            &gt;&gt;<br>
            &gt;&gt; Depending on wether the PACKAGECONFIG option is
            taken it looks like <br>
            &gt;&gt; this in CMakeCache.txt:<br>
            &gt;&gt;<br>
            &gt;&gt; //No help, variable specified on the command line.<b=
r>
            &gt;&gt; LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DOFF<br>
            &gt;&gt;<br>
            &gt;&gt; //No help, variable specified on the command line.<b=
r>
            &gt;&gt; LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DON<br>
            &gt;<br>
            &gt; Have you test it? The config-ix.cmake file sets the <br>
            &gt; LLVM_HAVE_OPT_VIEWER_MODULES variable [1].<br>
            &gt;<br>
            &gt; Instead of LLVM_HAVE_OPT_VIEWER_MODULES I would set
            PY_PYGMENTS_FOUND, <br>
            &gt; PY_PYGMENTS_LEXERS_C_CPP_FOUND and PY_YAML_FOUND.<br>
            &gt;<br>
            &gt; [1] <br>
            &gt; <a
href=3D"https://github.com/llvm/llvm-project/blob/main/llvm/cmake/config-=
ix.cmake#L693"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e"
              class=3D"moz-txt-link-freetext">https://github.com/llvm/llv=
m-project/blob/main/llvm/cmake/config-ix.cmake#L693</a><br>
            &gt;<br>
            &gt; Regards<br>
            &gt; =C2=A0 Stefan<br>
            &gt;<br>
            &gt;&gt; Am 22.06.22 um 15:54 schrieb Stefan
            Herbrechtsmeier:<br>
            &gt;&gt;&gt; Hi Richard,<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Am 22.06.2022 um 15:10 schrieb Richard Purdie
            via <br>
            &gt;&gt;&gt; <a href=3D"http://lists.openembedded.org"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">lists.openembedded.org</a>:<br>
            &gt;&gt;&gt;&gt; There is a reproducibility issue which
            shouldn't be too hard to fix if<br>
            &gt;&gt;&gt;&gt; someone had a few minutes to help out:<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; <a
              href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
14845"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e"
              class=3D"moz-txt-link-freetext">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D14845</a><br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; It is in llvm and is a cmake configuration
            issue. Rather than setting<br>
            &gt;&gt;&gt;&gt; that option based on the presence of python
            modules (with python from<br>
            &gt;&gt;&gt;&gt; the host), we should add a configuration
            option to force it to be<br>
            &gt;&gt;&gt;&gt; disabled in our case. Should be
            upstreamable with the right patch.<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; I'm not able to test it at the moment but it
            should be possible to <br>
            &gt;&gt;&gt; set the variables (PY_PYGMENTS_FOUND,
            PY_PYGMENTS_LEXERS_C_CPP_FOUND <br>
            &gt;&gt;&gt; and PY_YAML_FOUND) to OFF via EXTRA_OECMAKE:<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; -DPY_PYGMENTS_FOUND=3DOFF<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; The find_python_module function in
            config-ix.cmake returns early if <br>
            &gt;&gt;&gt; the variable PY_${module_upper}_FOUND is
            defined.<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Regards<br>
            &gt;&gt;&gt; =C2=A0 Stefan<br>
            &gt;&gt;&gt;<br>
            &gt;<br>
            &gt; <br>
            &gt;<br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#167242): <a
              href=3D"https://lists.openembedded.org/g/openembedded-core/=
message/167242"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e"
              class=3D"moz-txt-link-freetext">https://lists.openembedded.=
org/g/openembedded-core/message/167242</a><br>
            Mute This Topic: <a
              href=3D"https://lists.openembedded.org/mt/91921251/5052612"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e"
              class=3D"moz-txt-link-freetext">https://lists.openembedded.=
org/mt/91921251/5052612</a><br>
            Group Owner: <a
              href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org"
              target=3D"_blank" moz-do-not-send=3D"true">openembedded-cor=
e+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a
              href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e"
              class=3D"moz-txt-link-freetext">https://lists.openembedded.=
org/g/openembedded-core/unsub</a>
            [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank"
              moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">qu=
aresma.jose@gmail.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
        <br clear=3D"all">
        <div><br>
        </div>
        -- <br>
        <div dir=3D"ltr" class=3D"gmail_signature">
          <div dir=3D"ltr">Best regards,
            <div><br>
              Jos=C3=A9 Quaresma</div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------b3xwM4Y6CvbHGuIu6a6wFGQc--

