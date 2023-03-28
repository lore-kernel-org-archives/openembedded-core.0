Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B487C6FD18
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 18:01:20 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.3471.1680026471274050872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 11:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cUqUzd9W;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id e11so13453033lji.8
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 11:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680026469;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6RiYbg1tS1YEd51feghcF04RyJSEykUvKyhbzGd2bLA=;
        b=cUqUzd9WOuvUtsQZH1YlXs5kHtsF2y/PrgCxO010sn6c4QjArs/vXme7tyMnuQcDlo
         FMoP1DaLNkvXAmy97pqk6SI5yhBxRrjrK22Y1Pr7SixxbUhUa4e/GA/S8xccKJQc9LVw
         45P5NWRFefcqHSqesg0AJoDTFS2E8tzq6xtbnEKf+XGCNngR/ojA0gP9vpIAaYaKi0ZK
         ge5QJ/koIuz/RxzGx8d44VNEUxH2KwDCqe2IfsHyKdCtd4hSUxqV7vJz45Cttpe512IO
         yPwB69r8qc2WmZy+Nj8nwvaGR2bODceJPh37HtAZzx0LX74+GBCAGgHeeNUVtQU9i++P
         xbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680026469;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RiYbg1tS1YEd51feghcF04RyJSEykUvKyhbzGd2bLA=;
        b=H8tbdVHkTce+NCxnGfV4N7+tEUF14bC8tey3iJiPhOLN7Q0YCK/UfnXIod8x6zJOOi
         tKAdepaRRph3bGleCkXkL8+7zgLB1XDHPsljiO4DaTjaWjzqwqfHUudzdVhZRswg3o3m
         z3P3el55z1bhd5+tJJz02yF9+dtk8tNcOTJFiJuCBknORbzDHkkUEsACFNupvoUrL+yZ
         nev8qEZVIJSYDwzp/MxsiIyYpT2IT40O5z6GQNXHDv+UGLHFRLwGE6cnVttSwjKLWUhY
         JbVpbcIS3S6YCvqMnGFfuWTHWEV62mwOQtDQrKTgjFHGsWb2npFFdLKOCD4iXcoQuLvC
         KybA==
X-Gm-Message-State: AAQBX9cMkxZll3JlJtTTmE/ZGcpAEhq2oSf1Yw4Vpyd0Is5KD29Gc6ai
	SRKRq81lbelGElkXjzVuOFd2Yf3JKwwqPEHXfhs=
X-Google-Smtp-Source: AKy350aRZXiSHxU+wMNYC1mHRchCGIhQFzmtXzoxdL1xKYFblrs8/Fz9lldb5uMiyF8Zdg6NyPm5k+MQuxdJoJ8pwTo=
X-Received: by 2002:a2e:95d8:0:b0:29a:9053:ed1b with SMTP id
 y24-20020a2e95d8000000b0029a9053ed1bmr5064428ljh.3.1680026469085; Tue, 28 Mar
 2023 11:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
 <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
 <53196741237572435b0a5965aa77a72b021d6fed.camel@linuxfoundation.org>
 <CA+cAkeo_CnnQDLrrmcDE1PP_65qoxkAXU20Ho8r_N-BwqqbObw@mail.gmail.com>
 <72921856ae24cb434edf3698ea51614d7a73a4fb.camel@linuxfoundation.org> <CA+cAkerVECW3BPi8nE4SspKVd1BV9ro0j5d3fHT86CAYGahUwQ@mail.gmail.com>
In-Reply-To: <CA+cAkerVECW3BPi8nE4SspKVd1BV9ro0j5d3fHT86CAYGahUwQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 28 Mar 2023 20:00:57 +0200
Message-ID: <CA+cAkep8OAdKUg_nPrGbokXnbF_FshQXeCwGq2ZX-YTJ=wEU7g@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest for devtool failed
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/mixed; boundary="000000000000e772cf05f7f9a4cf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 18:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179242

--000000000000e772cf05f7f9a4cf
Content-Type: multipart/alternative; boundary="000000000000e772cd05f7f9a4cd"

--000000000000e772cd05f7f9a4cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I rebuilt a poky master from scratch on another machine (Ubuntu 22.04 , 16
Xeon, 124 Gb RAM), it took
 2h30mn to finish (note that rust-llvm-native and llvm-native both took
around 1h each to be built).

I have two questions for my curiosity:
   - why rust things (cargo-native, librsvg)  are the last artifacts built
on core-image-sato ? it seems strange at first look
(but may be explained by packages embedded by this image, I didn't look on
what are the dependencies of this image)
   - my pristine BDIR took around 90 GB , maybe the page
https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.html stating
that we need 50 GB of free space needs to be reviewed (unless it was
written with another image than core-image-sato in mind) ?

Apart from that,  I have the exact same error on test_devtool_modify_git
that I had on the other machine under /var build dir:

NOTE: Running setscene task 210 of 213
(virtual:native:/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-devtools/gnu-=
config/gnu-config_git.bb:
do_populate_sysroot_setscene)
NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0: task
do_populate_sysroot_setscene: Started
NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0: task
do_populate_sysroot_setscene: Succeeded
NOTE: Running task 896 of 918
(/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash/psplash_git.bb:
do_prepare_recipe_sysroot)
NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot:
Succeeded
NOTE: Running task 910 of 918
(/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash/psplash_git.bb:
do_configure)
NOTE: recipe psplash-0.1+git999-r0: task do_configure: Started
ERROR: psplash-0.1+git999-r0 do_configure: no configure script found at
../../../../../../../../../../../tmp/devtoolqamf2smwsy/configure
ERROR: psplash-0.1+git999-r0 do_configure:
ExecutionError('/home/jenkins/yocto-poky-master/poky/build-st/tmp/work/core=
2-64-poky-linux/psplash/0.1+git999-r0/temp/run.do_configure.1967375',
1, None, None)
ERROR: Logfile of failure stored in:
/home/jenkins/yocto-poky-master/poky/build-st/tmp/work/core2-64-poky-linux/=
psplash/0.1+git999-r0/temp/log.do_configure.1967375
NOTE: recipe psplash-0.1+git999-r0: task do_configure: Failed
ERROR: Task
(/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash/psplash_git.bb:=
do_configure)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 910 tasks of which 904 didn't need to be
rerun and 1 failed.

Full test log joined (I would like to join also the log of do_configure
step but it seems that the test do a cleanall of the recipe during its tear
down method)

I'm kind of stuck here since I cannot develop more oe-selftest tests if I
didn't even manage to make the existing ones succeed.
Can someone give me the setup of this autobuilder where Alexander talked
about ?

I could try to get as close as possible to the autobuilder setup if the
oe-selftest is ok there.

On Tue, 28 Mar 2023 at 17:36, Fr=C3=A9d=C3=A9ric Martinsons <
frederic.martinsons@gmail.com> wrote:

> Note that I managed to build libtirpc-native and shadow-native with
> bitbake (and the same setup).
>
> I currently try the build on another machine and under /home.
>
> I'll tell you the results soon
>
> Le mar. 28 mars 2023, 15:13, Richard Purdie <
> richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
>> On Tue, 2023-03-28 at 14:40 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
>> > I just finished a pristine build of core-image-sato on poky master,
>> > and set up SSTATE_DIR in my local.conf.
>> > Tests are now ok, I can start to write some now.
>> >
>> > If anyone is interested , please find attached the full log of the
>> > two first failures.
>>
>> Having the errors helps, thanks.
>>
>> The short summary is these two lines:
>>
>> libtirpc-native
>> | chown: changing ownership of
>> '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-l=
inux/libtirpc-native/1.3.3-r0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/=
poky/build-st/tmp/work/x86_64-linux/libtirpc-native/1.3.3-r0/recipe-sysroot=
-native/etc/netconfig':
>> Invalid argument
>>
>> shadow-native
>> | chown: changing ownership of
>> '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-l=
inux/shadow-native/4.13-r0/image/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/pok=
y/build-st/tmp/work/x86_64-linux/shadow-native/4.13-r0/recipe-sysroot-nativ=
e/var/spool/mail':
>> Invalid argument
>>
>>
>> I'm wondering if the fact the build is under /var might be triggering
>> something somehow...
>>
>> Cheers,
>>
>> Richard
>>
>

--000000000000e772cd05f7f9a4cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I rebuilt a poky master from scratch=C2=
=A0on another machine (Ubuntu 22.04 , 16 Xeon, 124 Gb RAM), it took</div><d=
iv>=C2=A02h30mn to finish (note that rust-llvm-native and llvm-native both =
took around 1h each to be built).</div><div><br></div><div>I have two quest=
ions for my curiosity:</div><div>=C2=A0 =C2=A0- why rust things (cargo-nati=
ve, librsvg)=C2=A0 are the last artifacts built on core-image-sato ? it see=
ms strange at first look</div><div>(but may be explained by packages embedd=
ed by this image, I didn&#39;t look on what are the dependencies of this im=
age)</div><div>=C2=A0 =C2=A0- my pristine BDIR took around 90 GB , maybe th=
e page=C2=A0<a href=3D"https://docs.yoctoproject.org/dev/brief-yoctoproject=
qs/index.html">https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index=
.html</a> stating</div><div>that we need 50 GB of free space needs to be re=
viewed (unless it was written with another image than core-image-sato in mi=
nd) ?</div><div><br></div><div>Apart from that,=C2=A0 I have the exact same=
 error on test_devtool_modify_git that I had on the other machine under /va=
r build dir:</div><div><br></div><div>NOTE: Running setscene task 210 of 21=
3 (virtual:native:/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-devtools/gn=
u-config/gnu-config_git.bb:do_populate_sysroot_setscene)<br>NOTE: recipe gn=
u-config-native-20230216+gitAUTOINC+63acb96f92-r0: task do_populate_sysroot=
_setscene: Started<br>NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63=
acb96f92-r0: task do_populate_sysroot_setscene: Succeeded<br>NOTE: Running =
task 896 of 918 (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash=
/psplash_git.bb:do_prepare_recipe_sysroot)<br>NOTE: recipe psplash-0.1+git9=
99-r0: task do_prepare_recipe_sysroot: Started<br>NOTE: recipe psplash-0.1+=
git999-r0: task do_prepare_recipe_sysroot: Succeeded<br>NOTE: Running task =
910 of 918 (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash/pspl=
ash_git.bb:do_configure)<br>NOTE: recipe psplash-0.1+git999-r0: task do_con=
figure: Started<br>ERROR: psplash-0.1+git999-r0 do_configure: no configure =
script found at ../../../../../../../../../../../tmp/devtoolqamf2smwsy/conf=
igure<br>ERROR: psplash-0.1+git999-r0 do_configure: ExecutionError(&#39;/ho=
me/jenkins/yocto-poky-master/poky/build-st/tmp/work/core2-64-poky-linux/psp=
lash/0.1+git999-r0/temp/run.do_configure.1967375&#39;, 1, None, None)<br>ER=
ROR: Logfile of failure stored in: /home/jenkins/yocto-poky-master/poky/bui=
ld-st/tmp/work/core2-64-poky-linux/psplash/0.1+git999-r0/temp/log.do_config=
ure.1967375<br>NOTE: recipe psplash-0.1+git999-r0: task do_configure: Faile=
d<br>ERROR: Task (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplas=
h/psplash_git.bb:do_configure) failed with exit code &#39;1&#39;<br>NOTE: T=
asks Summary: Attempted 910 tasks of which 904 didn&#39;t need to be rerun =
and 1 failed.<br></div><div><br></div><div>Full test log joined (I would li=
ke to join also the log of do_configure step but it seems that the test do =
a cleanall of the recipe during its tear down method)</div><div><br></div>I=
&#39;m kind of stuck here since I cannot develop more oe-selftest tests if =
I didn&#39;t even manage to make the existing ones succeed.<div>Can someone=
 give me the setup of this autobuilder where Alexander=C2=A0talked about ?<=
/div><div><br></div><div>I could try to get as close as possible to the aut=
obuilder setup if the oe-selftest is ok there.</div><div><br><div><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 28 Mar 2023=
 at 17:36, Fr=C3=A9d=C3=A9ric Martinsons &lt;<a href=3D"mailto:frederic.mar=
tinsons@gmail.com">frederic.martinsons@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div>Note=
 that I managed to build libtirpc-native and shadow-native with bitbake (an=
d the same setup).=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>I currently try the build on another machine and under /home.=C2=A0</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll tell you the results =
soon=C2=A0<br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" =
class=3D"gmail_attr">Le mar. 28 mars 2023, 15:13, Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Tue, 2023-03-28 at 14:40 +0200, Fr=
=C3=A9d=C3=A9ric Martinsons wrote:<br>
&gt; I just finished a pristine build of core-image-sato on poky master,<br=
>
&gt; and set up SSTATE_DIR in my local.conf.<br>
&gt; Tests are now ok, I can start to write some now.<br>
&gt; <br>
&gt; If anyone is interested , please find attached the full log of the<br>
&gt; two first failures.<br>
<br>
Having the errors helps, thanks.<br>
<br>
The short summary is these two lines:<br>
<br>
libtirpc-native<br>
| chown: changing ownership of &#39;/var/lib/jenkins/YOCTO_POKY_MASTER_TEST=
/poky/build-st/tmp/work/x86_64-linux/libtirpc-native/1.3.3-r0/image/var/lib=
/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/libtirp=
c-native/1.3.3-r0/recipe-sysroot-native/etc/netconfig&#39;: Invalid argumen=
t<br>
<br>
shadow-native<br>
| chown: changing ownership of &#39;/var/lib/jenkins/YOCTO_POKY_MASTER_TEST=
/poky/build-st/tmp/work/x86_64-linux/shadow-native/4.13-r0/image/var/lib/je=
nkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/shadow-nat=
ive/4.13-r0/recipe-sysroot-native/var/spool/mail&#39;: Invalid argument<br>
<br>
<br>
I&#39;m wondering if the fact the build is under /var might be triggering<b=
r>
something somehow...<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div></div>
</blockquote></div></div></div></div>

--000000000000e772cd05f7f9a4cd--

--000000000000e772cf05f7f9a4cf
Content-Type: application/gzip; 
	name="oe-selftest_test_devtool_modify_git_new_machine_home.log.gz"
Content-Disposition: attachment; 
	filename="oe-selftest_test_devtool_modify_git_new_machine_home.log.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_lfsk6eub0>
X-Attachment-Id: f_lfsk6eub0

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
--000000000000e772cf05f7f9a4cf--

