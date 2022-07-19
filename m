Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CE9C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 12:54:19 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.40064.1658235258050501249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 05:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cUxwhIC/;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id e16so7109586qka.5;
        Tue, 19 Jul 2022 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y5lBRtVC52KtDlPLt8BoFi93MMhMQVUjNQ45VxmXuts=;
        b=cUxwhIC/RCmfhB6/c+8cmoViLHXUVxM89GfdI+Ju+SUdkKbtR9uKNepCAjTrWbtiyp
         0HW5Gt4uqM52s/23B8lVst+w2JRhWgwV9ytSL38+UGaGJY28OESXSb9LmyuVWXxNlaX5
         2jH2IzemmrK292JM0d2GggLE0jUrFA6dPa/goiRvDSfhUdR/3eL4WW6jtwiNDPR13REH
         F4WR3v7c0fXTq4M16TpcndU85njxpObdrUQMjF/4IvW1GUd3iRWyRJOYfwacNQIEn7sb
         uGZ48Z7Wms5A2fYk/RFGPANdUlEfPBSIzFUi/GPDSeWLV8Hy/xJt4wJ03WpSmSqiO2nn
         a02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y5lBRtVC52KtDlPLt8BoFi93MMhMQVUjNQ45VxmXuts=;
        b=qMBQo+lvZjaItRAv7YT5Wtit4CXgfbYVFU8aCZxJcq6F4wdkskYT3QU80kST06Bxx1
         +O20AfmH592mu5WdW9N8pADVBKaXWkc7RN2xWBca/hYvtjx71ItMWBLLj1uQ+1XB1PQ9
         Vs2XBLi3HO0wlCGTHPWsR7uK25IqM5TZH2RMkgef6BRedjgttJgCcP5H5SINxbF59HRL
         Q3jOwRlAdOEtx9e262jekvPXudF968hl4gVjrTzJ3havlhZwvzXZykx3VT6kLugKGMJo
         swtxECsqLIfmZGq7KTcA5hpkz04VkJqSFJV6T26pVmNya/X+wVCXptQJ6f0JXoKjg9IS
         mNQw==
X-Gm-Message-State: AJIora8So2iI0mqWb43iM0t4jqfgZz8SdPnBTFOPfhUJRN1KWGMl8kUq
	kDfVAv8Rj1muj54fvkgWqz6LVUjViGLQJS+oyJA=
X-Google-Smtp-Source: 
 AGRyM1ss6+IUFRvjgSMGK/f64X0v6EAZ99UcUwGlMS6yUivgtZ9sf6ge7lop/AXLbl47hLsZ2I/lVAMqw2YWjyFSC2Y=
X-Received: by 2002:a05:620a:f85:b0:6b5:e2be:1d04 with SMTP id
 b5-20020a05620a0f8500b006b5e2be1d04mr8197446qkn.72.1658235257118; Tue, 19 Jul
 2022 05:54:17 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
 <YtWrKcR6y1jWSFtC@kudzu.us>
 <CAMKF1sqZh=fPoYHqh-uuJL6oftkmGoDHHcZkTgivoKapFFerAQ@mail.gmail.com>
 <CAPoiz9zRWPGLSUNaeTQDO=E60cGD4zRVmnZmHFkSdVLrkx_WmA@mail.gmail.com>
 <CAMRc=MecfyMPB2B5ukhYzMdQDWL4fY=8nbfUe0LR_8hUPhNP9w@mail.gmail.com>
In-Reply-To: 
 <CAMRc=MecfyMPB2B5ukhYzMdQDWL4fY=8nbfUe0LR_8hUPhNP9w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jul 2022 08:54:05 -0400
Message-ID: 
 <CAMKF1srBz3xL0VTZedyyf4oFgiXxn7ai4afH37yBrT63djTr3Q@mail.gmail.com>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?=
 <elizabeth.flanagan@huawei.com>,
	Jon Mason <jdmason@kudzu.us>, Jon Mason <jon.mason@arm.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000074638505e427fb90"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 12:54:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168279

--00000000000074638505e427fb90
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 19, 2022 at 3:40 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Tue, Jul 19, 2022 at 12:10 AM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Mon, Jul 18, 2022 at 4:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Can you try something like this
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > index 5d74e4494d..61d5bf6058 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > @@ -68,8 +68,7 @@ do_configure () {
> > >     # libstdc++ isn't built yet so CXX would error not able to find it
> > > which breaks stdc++'s configure
> > >     # tests. Create a dummy empty lib for the purposes of configure.
> > >     mkdir -p ${WORKDIR}/dummylib
> > > -   touch ${WORKDIR}/dummylib/dummylib.c
> > > -   ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o
> > > ${WORKDIR}/dummylib/libstdc++.so
> > > +   ${CC} -nostartfiles -shared -x c /dev/null -o
> > > ${WORKDIR}/dummylib/libstdc++.so
> > >     for d in libgcc ${RUNTIMETARGET}; do
> > >         echo "Configuring $d"
> > >         rm -rf ${B}/${TARGET_SYS}/$d/
> > >
> > >
> > > and see if it helps ?
> >
> > That appears to work for the 2 zephyr machines in meta-arm
> >
>
> This still fails for arduino nano 33 ble:
>
> | checking for dirent.h... no
> | checking sys/statvfs.h usability... no
> | checking sys/statvfs.h presence... no
> | checking for sys/statvfs.h... no
> | checking utime.h usability... yes
> | checking utime.h presence... yes
> | checking for utime.h... yes
> | checking whether to build Filesystem TS support... no
> | checking for struct dirent.d_type... no
> | checking for realpath... no
> | checking for utimensat... no
> | checking for utime... no
> | checking for lstat... no
> | checking for struct stat.st_mtim.tv_nsec... yes
> | checking for fchmod... yes
> | checking for fchmodat... yes
> | checking for sendfile that can copy files... no
> | checking for link... yes
> | checking for readlink... yes
> | checking for symlink... yes
> | checking for truncate... yes
> | checking for fdopendir... no
> | checking for dirfd... no
> | checking for unlinkat... yes
> | checking __sync extensions... yes
> | checking link.h usability... no
> | checking link.h presence... no
> | checking for link.h... no
> | checking for fcntl... configure: error: Link tests are not allowed
> after GCC_NO_EXECUTABLES.



Can you post config.log from this component


> | WARNING: exit code 1 from a shell command.
> ERROR: Task
> (/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:
> do_configure)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 795 tasks of which 774 didn't need to
> be rerun and 1 failed.
>
> Summary: 1 task failed:
>
> /home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:
> do_configure
> Summary: There was 1 ERROR message, returning a non-zero exit code.
>
> Bart
>

--00000000000074638505e427fb90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jul 19, 2022 at 3:40 AM Bartosz Golaszewski &lt;<a =
href=3D"mailto:brgl@bgdev.pl">brgl@bgdev.pl</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Tue, Jul 19, 2022 at 12:10 AM Jon Mason &lt;<a h=
ref=3D"mailto:jdmason@kudzu.us" target=3D"_blank">jdmason@kudzu.us</a>&gt; =
wrote:<br>
&gt;<br>
&gt; On Mon, Jul 18, 2022 at 4:06 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Can you try something like this<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; &gt; b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; &gt; index 5d74e4494d..61d5bf6058 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; &gt; @@ -68,8 +68,7 @@ do_configure () {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0# libstdc++ isn&#39;t built yet so CXX would e=
rror not able to find it<br>
&gt; &gt; which breaks stdc++&#39;s configure<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0# tests. Create a dummy empty lib for the purp=
oses of configure.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/dummylib<br>
&gt; &gt; -=C2=A0 =C2=A0touch ${WORKDIR}/dummylib/dummylib.c<br>
&gt; &gt; -=C2=A0 =C2=A0${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o<br>
&gt; &gt; ${WORKDIR}/dummylib/libstdc++.so<br>
&gt; &gt; +=C2=A0 =C2=A0${CC} -nostartfiles -shared -x c /dev/null -o<br>
&gt; &gt; ${WORKDIR}/dummylib/libstdc++.so<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0for d in libgcc ${RUNTIMETARGET}; do<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Configuring $d&quot;<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${B}/${TARGET_SYS}/$d/<br=
>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; and see if it helps ?<br>
&gt;<br>
&gt; That appears to work for the 2 zephyr machines in meta-arm<br>
&gt;<br>
<br>
This still fails for arduino nano 33 ble:<br>
<br>
| checking for dirent.h... no<br>
| checking sys/statvfs.h usability... no<br>
| checking sys/statvfs.h presence... no<br>
| checking for sys/statvfs.h... no<br>
| checking utime.h usability... yes<br>
| checking utime.h presence... yes<br>
| checking for utime.h... yes<br>
| checking whether to build Filesystem TS support... no<br>
| checking for struct dirent.d_type... no<br>
| checking for realpath... no<br>
| checking for utimensat... no<br>
| checking for utime... no<br>
| checking for lstat... no<br>
| checking for struct stat.st_mtim.tv_nsec... yes<br>
| checking for fchmod... yes<br>
| checking for fchmodat... yes<br>
| checking for sendfile that can copy files... no<br>
| checking for link... yes<br>
| checking for readlink... yes<br>
| checking for symlink... yes<br>
| checking for truncate... yes<br>
| checking for fdopendir... no<br>
| checking for dirfd... no<br>
| checking for unlinkat... yes<br>
| checking __sync extensions... yes<br>
| checking link.h usability... no<br>
| checking link.h presence... no<br>
| checking for link.h... no<br>
| checking for fcntl... configure: error: Link tests are not allowed<br>
after GCC_NO_EXECUTABLES.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Can you post config.log from this com=
ponent=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
" dir=3D"auto"><br>
| WARNING: exit code 1 from a shell command.<br>
ERROR: Task (/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-de=
vtools/gcc/gcc-runtime_12.1.bb:do_configure)<br>
failed with exit code &#39;1&#39;<br>
NOTE: Tasks Summary: Attempted 795 tasks of which 774 didn&#39;t need to<br=
>
be rerun and 1 failed.<br>
<br>
Summary: 1 task failed:<br>
=C2=A0 /home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools=
/gcc/gcc-runtime_12.1.bb:do_configure<br>
Summary: There was 1 ERROR message, returning a non-zero exit code.<br>
<br>
Bart<br>
</blockquote></div></div>

--00000000000074638505e427fb90--

