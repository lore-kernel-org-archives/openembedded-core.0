Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2255CCC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 16:55:36 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19121.1791996929623177867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 09:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rRpUtdHM;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e6038cebefso32765155ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 09:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996929; cv=none;
        d=google.com; s=arc-20260327;
        b=nwwsC1JMUyvWBWGQkdBMd8QQZCZyyHfO+0BpgohP+4Ez7R20MWXBlCB5rHayeSbFVa
         tlWRj1OyYmoS9o+DKHgutDNa9K7DF8D3uQUKCsqUBKCS+nQmtS45a3/e0svYh6TJeqec
         dbaUZfngDefe/w74R/MlLDXYHwvMyoD4PJj7+o/c8BLEYSqo+Bu9BmlAFSsHdPN1MmWR
         msGAYNBE5dl3vI0rXRYcDTwoWqNH/V3pxwbqpjL37py/556uJuAhdBTiKyOadRTvktze
         Fzvkz1MsACwWywAGoF8jsxH4b/4YZ/vXZcedtiGmytR1CiDWkQz3de/sncWCj0Ju8a73
         SedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1T8Wqmb1JduDm/WYdNi8iDBUuIyXU5L+aX4h+scYhv8=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=lpykp+rBXUYTuVPLpnuBiRmMI8PlWREJbBhluKAWmv8xy4Uu/ReT0hDzNxLWNnmTNK
         8gYKPW+0NncT5Tx3QnIGuWYNvd7jJloYKVFBw1tMZ4PztMvrwt+u/1P0ePryf2SlSxWo
         4JXiHwu8/ObSUQgE0I22tFmJV49dn0hfG2BA7fYokcJa9KHxBccxwD5rk78FMSK00yHJ
         1wf0M76jaJ+f+yo2BpqRLsKZiKx3S2nQfrkDNx19mGxjaugi8URDFQsGOzqQD59BFKi7
         cSWFvfyoJp21Wvsv9oXpjtI0rvWR7r6DaJa56c9HOJRnC1SNDtqs2P5YXT0C8CuF/nnv
         RqnA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996929; x=1792601729; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1T8Wqmb1JduDm/WYdNi8iDBUuIyXU5L+aX4h+scYhv8=;
        b=rRpUtdHMcnnvlqbM3PwVZgpaWD4WZxt3efLD2LYr3wcTJ2H3JLZY5HEZ2ffhNZDiVP
         EX5/0z6YNIIazD802cwc7u6nVRjgky3lGuFiG70yFLMAyYZ9WttagTCdSC0hulPdSWQ/
         XMRTjfLOtcOTXvFxK/2LUTLDjFnh4XnuvyPjVk2Os1lGY1HViWLddQejk6wa8fvLernt
         w+g2EBeQvJ+s04fmw8fKQGav989TseztgXjwGyNIwMX94LsIlP1RZehuLCGcKlO+iDqO
         BR7OYo1Lp1O4eU3zr2N+zyCT1nGekhkGOKLGtgLU8maOogeD/NTVp7g0QSeuSq77FeKk
         DpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996929; x=1792601729;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1T8Wqmb1JduDm/WYdNi8iDBUuIyXU5L+aX4h+scYhv8=;
        b=Ln04ZRo/iDEPbbQpQlYOqf/22VMZowJsvE08WBQu6XtK+bpy+JaMyk0p6EIg/WzmaD
         JAiz5lOzCU2paiiZjOaeRHOpO8/zO8tYY7Mrd8I6r9IFk8U8krZAB3NFKR+AwCPfoKu8
         Wz6SFdSd1mG3dNJycKHV47sO+HXUPxgS9zZdor7mpyiTdVKOJtL9qbwZO5bIv3bVmnuf
         iScQVTsmZf2/DqfFsh2UCAP8xHsQrcx/Qe2idpnAichwSwl3OB4Ys6yAnl7btsiaW7Or
         jIObNmEbQmktEnM9DNVpEYNRuMk6eW/2MSZ0Ht4zIT5q01JtDX2Qgoj2l4NaBiGwYoBj
         OdJw==
X-Gm-Message-State: AFq9FYKEZfLcho5t6yOOE9ruy3cHR89R/03cYzWDFvgaT3bnIiMDuFG/
	DTP2MAkYD16e52tHfYisQl15Mn9OYWJvULbLzFiBOZwi4LawlILsO56a9UcnxR81tqbklZiMNhf
	fZM/6E6Vkz+AR0xmRWvB5TtRPlKzA+qI=
X-Gm-Gg: AYBFou2KbliR1BOGtwlc1ZI5rr8rRnKwD3fLQxMhvmJligES1tiYkjUGm8HN3qPU1VM
	/7IcMrxUBm0ykotbb7UX3vxpO4rht08h2KtYDVKLT8IPIdywqLBk4iJBc/NjNs1SlGYHHPr5bTI
	e8KrsY3Nxcfb+0+T9nDuFauR6ZuT/gsMgEoBokGY1Yfl2B2k5XC7bnvwejGHii5BrBQwe4CfeuE
	xVgzakgcne6oVXg+FjtIvp0OFkUXGJrOVrHh/ulu8ato3kFlal04Ur5Pw0j1stmQ4tCSOCBw8c1
	Pu0ivFeBZ+GYEivi3aQDTN2rk+A0o7oC4kIDfvAp5QsmoEvVqnN/BY7fFg+7XONxp0YCAeX/kgd
	CaLHr9zJgT+Ay136wbOnV61BOvnnpGqZXdn6l0dfH6/2FnypgQqecEcjviu6LV76A7QZVuPkKfA
	==
X-Received: by 2002:a17:903:2f8c:b0:2e2:cc2d:b84a with SMTP id
 d9443c01a7336-2e842bbedc2mr158256405ad.41.1791996928689; Wed, 14 Oct 2026
 09:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260917051600.1472502-1-bruce.ashfield@gmail.com>
 <DLLOWJJZP939.377A2ZRET8LZ1@smile.fr> <DM4MU1O808QU.3D1G1PPSLRL5V@smile.fr>
In-Reply-To: <DM4MU1O808QU.3D1G1PPSLRL5V@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Oct 2026 12:55:16 -0400
X-Gm-Features: AclHuK8-wxICSCqqDyQDWt72NqyUVa3ypUAzU8ZcsRKrlxWaukkQn2e0TYV2V_M
Message-ID: <CADkTA4PdELZG3bQYeDXvMRc2qDw+6b5yNot2Fvjjq4gY3s_Wxg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap] linux-yocto/6.6: update to v6.6.157
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005f886a065dcfcc39"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 16:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247790

--0000000000005f886a065dcfcc39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:31=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:

> On Tue Sep 22, 2026 at 10:08 AM CEST, Yoann Congal wrote:
> > On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfield via
> lists.openembedded.org wrote:
> >> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>
> >> Updating linux-yocto/6.6 to the latest korg -stable release that
> comprises
> >> the following commits:
> >>
> >>     79643295eba17 Linux 6.6.157
> >>     32e598324edc3 nvmet-rdma: fix queue leak when connect backlog is
> exceeded
> >>     [...]
> >>     73b7a11814838 Revert "arm64: mm: Don't remap pgtables for allocate
> vs populate"
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> ---
> >>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
> >>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
> >>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++---------=
-
> >>  3 files changed, 20 insertions(+), 20 deletions(-)
> >
> > Hello Bruce,
> >
> > I think either this 6.6.157 upgrade or the 6.6.156 one triggers a
> > lttng ptest failure:
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/460=
4
> > qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21
> 11:38:31+00:00
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/457=
7
> > qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-21
> 14:57:16+00:00
> >
> >
> https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux86=
-64-ptest/core-image-ptest-lttng-tools/log.do_testimage.311077.202609211108=
38
> :
> > (only one of each message):
> > |FAIL: kernel/test_userspace_probe 91 - Load command with opts:
> --input-path=3D/tmp/tmp.test_userspace_probe_save_load_elf_trace_path.zSA=
9mh
> > |FAIL: tools/base-path/test_ust 35 - Load command with opts: -i
> ./tools/base-path//load-stream-extra-path.lttng
> > |FAIL: tools/save-load/test_load 2 - Load command with opts: -i
> ./tools/save-load//load-42.lttng
> > |FAIL: tools/rotation/test_ust 101 - App is un-registered
> > |FAIL: tools/save-load/test_autoload 2 - Lttng-tool list command with
> option load-42
> > |FAIL: tools/rotation/test_save_load_mi 17 - Lttng-tool list command
> with option yTVkM2lxbFoDS7Nu
> > |FAIL: tools/rotation/test_save_load_mi 8 - Valid lttng enable-rotation
> size XML
> > |FAIL: tools/rotation/test_save_load_mi 5 - Valid lttng enable-rotation
> timer XML
> > |FAIL: tools/relayd-grouping/test_ust 120 - Valid lttng list XML
> > |FAIL: tools/rotation/test_save_load_mi 18 - Valid lttng list XML after
> load
> > |FAIL: tools/base-path/test_ust 37 - Stop lttng tracing for session
> load-stream-extra-path
> > |FAIL: tools/trigger/test_add_trigger_cli 293 - add-trigger mi is valid
> > |FAIL: tools/trigger/test_remove_trigger_cli 20 - remove-trigger mi is
> valid
> > |FAIL: tools/base-path/test_ust 39 - UST per-uid network trace path is
> valid
> > |FAIL: tools/save-load/test_autoload 1 - Start session daemon
> > |FAIL: tools/save-load/test_autoload 3 - No session daemon to kill
> > |FAIL: tools/save-load/test_load 3 - Destroy session load-42
> > |FAIL: tools/base-path/test_ust 38 - Destroy session
> load-stream-extra-path
> > |FAIL: tools/rotation/test_save_load_mi 21 - Destroy session
> yTVkM2lxbFoDS7Nu
> > |FAIL: tools/mi/test_mi 3 - MI test: Version xsd validation
> > |FAIL: tools/rotation/test_save_load_mi 20 - Found the right rotation
> size value in list XML after load
> > |FAIL: tools/base-path/test_ust 40 - Validate trace for event tp:tptest
> > |FAIL: tools/base-path/test_ust 36 - Start tracing for session
> load-stream-extra-path
> > |FAIL: kernel/test_userspace_probe 92 - Validate userspace probe listin=
g
> >
> > Any ideas?
> >
> > Thanks!
>
> Hello Bruce,
>
> Gentle ping on the above upgrade failure.
>
> Do you have time to look at this? If you don't, we'll have organize to
> find other resources, we can't not update the kernel.
>

I'll have time next week, but I can't run the test images locally, so I'll
need to come up with my
own tests :)

Bruce



>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000005f886a065dcfcc39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 14, 2026 at 10:31=
=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann=
.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Tue Sep 22, 2026 at 10:08 AM CEST, Yoann Congal wrote:<b=
r>
&gt; On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfield via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a> wrote:<br>
&gt;&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Updating linux-yocto/6.6 to the latest korg -stable release that c=
omprises<br>
&gt;&gt; the following commits:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A079643295eba17 Linux 6.6.157<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A032e598324edc3 nvmet-rdma: fix queue leak when c=
onnect backlog is exceeded<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0[...]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A073b7a11814838 Revert &quot;arm64: mm: Don&#39;t=
 remap pgtables for allocate vs populate&quot;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_6.6.bb" rel=3D"no=
referrer" target=3D"_blank">linux-yocto-rt_6.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt;&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-tiny_6.6.bb" rel=3D"=
noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.6.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a>=C2=A0 | 28 =
+++++++++----------<br>
&gt;&gt;=C2=A0 3 files changed, 20 insertions(+), 20 deletions(-)<br>
&gt;<br>
&gt; Hello Bruce,<br>
&gt;<br>
&gt; I think either this 6.6.157 upgrade or the 6.6.156 one triggers a<br>
&gt; lttng ptest failure:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/7=
3/builds/4604" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoc=
toproject.org/valkyrie/?#/builders/73/builds/4604</a><br>
&gt; qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21 11:38=
:31+00:00<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/6=
1/builds/4577" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoc=
toproject.org/valkyrie/?#/builders/61/builds/4577</a><br>
&gt; qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-21 1=
4:57:16+00:00<br>
&gt;<br>
&gt; <a href=3D"https://valkyrie.yocto.io/pub/non-release/20260921-71/testr=
esults/qemux86-64-ptest/core-image-ptest-lttng-tools/log.do_testimage.31107=
7.20260921110838" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoc=
to.io/pub/non-release/20260921-71/testresults/qemux86-64-ptest/core-image-p=
test-lttng-tools/log.do_testimage.311077.20260921110838</a>:<br>
&gt; (only one of each message):<br>
&gt; |FAIL: kernel/test_userspace_probe 91 - Load command with opts: --inpu=
t-path=3D/tmp/tmp.test_userspace_probe_save_load_elf_trace_path.zSA9mh<br>
&gt; |FAIL: tools/base-path/test_ust 35 - Load command with opts: -i ./tool=
s/base-path//load-stream-extra-path.lttng<br>
&gt; |FAIL: tools/save-load/test_load 2 - Load command with opts: -i ./tool=
s/save-load//load-42.lttng<br>
&gt; |FAIL: tools/rotation/test_ust 101 - App is un-registered<br>
&gt; |FAIL: tools/save-load/test_autoload 2 - Lttng-tool list command with =
option load-42<br>
&gt; |FAIL: tools/rotation/test_save_load_mi 17 - Lttng-tool list command w=
ith option yTVkM2lxbFoDS7Nu<br>
&gt; |FAIL: tools/rotation/test_save_load_mi 8 - Valid lttng enable-rotatio=
n size XML<br>
&gt; |FAIL: tools/rotation/test_save_load_mi 5 - Valid lttng enable-rotatio=
n timer XML<br>
&gt; |FAIL: tools/relayd-grouping/test_ust 120 - Valid lttng list XML<br>
&gt; |FAIL: tools/rotation/test_save_load_mi 18 - Valid lttng list XML afte=
r load<br>
&gt; |FAIL: tools/base-path/test_ust 37 - Stop lttng tracing for session lo=
ad-stream-extra-path<br>
&gt; |FAIL: tools/trigger/test_add_trigger_cli 293 - add-trigger mi is vali=
d<br>
&gt; |FAIL: tools/trigger/test_remove_trigger_cli 20 - remove-trigger mi is=
 valid<br>
&gt; |FAIL: tools/base-path/test_ust 39 - UST per-uid network trace path is=
 valid<br>
&gt; |FAIL: tools/save-load/test_autoload 1 - Start session daemon<br>
&gt; |FAIL: tools/save-load/test_autoload 3 - No session daemon to kill<br>
&gt; |FAIL: tools/save-load/test_load 3 - Destroy session load-42<br>
&gt; |FAIL: tools/base-path/test_ust 38 - Destroy session load-stream-extra=
-path<br>
&gt; |FAIL: tools/rotation/test_save_load_mi 21 - Destroy session yTVkM2lxb=
FoDS7Nu<br>
&gt; |FAIL: tools/mi/test_mi 3 - MI test: Version xsd validation<br>
&gt; |FAIL: tools/rotation/test_save_load_mi 20 - Found the right rotation =
size value in list XML after load<br>
&gt; |FAIL: tools/base-path/test_ust 40 - Validate trace for event tp:tptes=
t<br>
&gt; |FAIL: tools/base-path/test_ust 36 - Start tracing for session load-st=
ream-extra-path<br>
&gt; |FAIL: kernel/test_userspace_probe 92 - Validate userspace probe listi=
ng<br>
&gt;<br>
&gt; Any ideas?<br>
&gt;<br>
&gt; Thanks!<br>
<br>
Hello Bruce,<br>
<br>
Gentle ping on the above upgrade failure.<br>
<br>
Do you have time to look at this? If you don&#39;t, we&#39;ll have organize=
 to<br>
find other resources, we can&#39;t not update the kernel.<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I=
&#39;ll have time next week, but I can&#39;t run the test images locally, s=
o I&#39;ll need to come up with my</div><div class=3D"gmail_default" style=
=3D"font-size:small">own tests :)</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000005f886a065dcfcc39--

