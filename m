Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A28CCF2E5
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:43:32 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36492.1792421006036098682
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jVu+2s1K;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea0efd636dso3716895ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421005; cv=none;
        d=google.com; s=arc-20260327;
        b=idjkGJ5tgu0BFADNBaKZ5se9H2a0rprnOR8vxCANh2jW28Io8GWP/h2S2xF7KdSKH+
         VzNTuTXfQ0KuSoYw422ZKfkGHR9N0gc3QeXKjDXyUJwC27ek+waLeNG37TPXPedoMn6J
         Y1gY1CMvk/+/oLhWQ2K42iuxMwb09BK0nOCJTZx0E3piVMzzKxvfoQHqDfny+CTUZCcQ
         GS5simPjzQLzpLcQpeYdZxPT8Slt0ouxmLqKqL5EW2rKMgmGdlGfgCTlVwWDlU0J7jgn
         Npz+zV2QUQIW2kSkmgr3ciPYucIEGqHGyQZzvDu7+P5jsxyKsJGxbNXM6mJZGjmyk+AK
         Aq+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hE+7swUvWeZO3Tn07NRslQpafN/MAfS2aiAhFO8YwAY=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=rPnDtQw0mycxxeULBjytIcAwjbsGGRnP0S/gLS4sx/SvuPdSThjVu4itm712eaqYvC
         PxUsoPozvtX9e/PWc3Dpz0ibEWJGfqR/Dfk9R1Fgptkq9octl6VAfyuL8PlD7C1wn0oa
         we4PqiaDjUkYJsA/93ErBFkkWRIAgf0TPvMnNdTkn3BP1RxEXJMeSwFYzgxdP7DLVcYo
         kKUw19DnF+PLdM5TGcUwcmJiA8GAt5n4wVVSOyjqvvKKe4n9TMDKdJ9xoZ+G2nQJT+s5
         WZ2haoQZyoNg5E9Kmt+UxGUmV2NVHCEl+nuggBEqDVxTWBIfi2ffOTby5kBsJW4NNJLw
         AuBg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421005; x=1793025805; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hE+7swUvWeZO3Tn07NRslQpafN/MAfS2aiAhFO8YwAY=;
        b=jVu+2s1KM/9UXxmuaKFoe3dB2nmJwWi4FiwAKk54dk2ZXPPNSOiy/Wh/bACZU98wua
         Y4BS45KXs6ErZxqWViuoe86y9aCB0YPp+2S608oMT9bLqhV4vfZlvCyno/zRy5nrFc0W
         ASO+O8fXF8GqqTOQS83FnyuJ6lhmGB7+PVciX+cCN46H2ymjiO4IPeHCLzgeN9aEQn78
         koYuI0I/jnOqDiwbL40XvWIJGIM6nCakkk/ms5YBuP8g5M6/TBXhJo5MgOFHbajCHpWn
         60K3HRiL1E1P4TO0wFlNaYdoqdj99hqiaCccPWNgM+7J9lGgDUvKe6dLkjw+aTEGuF+G
         NStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421005; x=1793025805;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hE+7swUvWeZO3Tn07NRslQpafN/MAfS2aiAhFO8YwAY=;
        b=piRGPM86+huH0nZxJIoUhfOfATgQLltKUS+Boxki0ro8DvbdEmkQqXx7LdR4XdmGG7
         X1U7iFJWph6i/1/ygKuzsTFfLUALbVzXMZlqUxnANRoEOtZ+CUdvvGjj4HEGcvlOOjKe
         OHcx149a/CO2k/0Bywfhfspi+USD/A3fJc2zFCxe119Pv8QlNVVEkXRggvq/Zl8Jziw8
         Av92M/kb7DH5h5h4fB3pcOkh/UuwjatSZAYtAt2AHGbJzq7jJqUe/1eOdEXU01pZ18GK
         cs4TSVbXn4AB6D7R2qf+9AzxKSGcvj1xbWFlaoCh3aSj4IkTqbrvvixXIdJLrihcRx5W
         jNwQ==
X-Gm-Message-State: AFq9FYIsSZ2+MGh0+A+pb+5v8W8MsyVrbf8mlebW+8688bs+KmVAg7EA
	OPRD2/msXWmZdy8svT+PVBEWPyFQEX0nSaGcKkNqU69pvSH4Q6Hhzm9GqKSBh9tVzfjVww4b8wo
	B0skZj585ADuuimFkinlCWUpegDF5Mqk=
X-Gm-Gg: AYBFou2ZkgZ2xu614vPmOe5HG6t+GriruDqISrggqS79yCuuIArkgVcIcDl7MiZ/LAr
	rFbB+eMT1msv5Nvjwmr8kOYrPTwYr3nmYPoNaJKqgGAK0HSVVE2bBKflDV2kfQhh/TQaTa/tfOB
	qiKand+AxrTcpgJq8+vSPgyq6tpVAdFGNksaaD2PfucUS1pIicaKWroS617D+ZAAIrJThxCEsnf
	Bai93hmME+WEcVMDx7j4mglqjbTjV9eJYxhBGHIihBYI5D+oqTSzjUM8KF75Lr/9odtEF32V0Dq
	du4ptSxckk3sN6LAHRDVRl7T0U0qtWHxEjS/fELMLSEP3L5+XNgUxyDpKg4Dy6hOr3IjfSWxulg
	yB+n+ZfFewTea1Di+GPRaoKgzvxDYx9ZmMAVpoWBYZKlrwydwBWSfG3kU73E0fVzxf68ArYyB
X-Received: by 2002:a17:902:e5cc:b0:2e9:4e83:1961 with SMTP id
 d9443c01a7336-2e9a6a0283dmr67200435ad.22.1792421005049; Mon, 19 Oct 2026
 07:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260917051600.1472502-1-bruce.ashfield@gmail.com>
 <DLLOWJJZP939.377A2ZRET8LZ1@smile.fr> <DM4MU1O808QU.3D1G1PPSLRL5V@smile.fr>
 <CADkTA4PdELZG3bQYeDXvMRc2qDw+6b5yNot2Fvjjq4gY3s_Wxg@mail.gmail.com> <DM57Z4HX0NXW.27RXSRT7ZD21K@smile.fr>
In-Reply-To: <DM57Z4HX0NXW.27RXSRT7ZD21K@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Oct 2026 10:43:12 -0400
X-Gm-Features: AclHuK-QuLoz0iWWPOSAQyQe6EamiBK3sWKWiJzsamOAvpEK-NXnNO96wlZfbuQ
Message-ID: <CADkTA4Njr1sezPZTZh=CY1Nay4RNtLO5Lmi=vg56CUUsqgsW8A@mail.gmail.com>
Subject: Re: [OE-core][scarthgap] linux-yocto/6.6: update to v6.6.157
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004b4513065e3289b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248179

--0000000000004b4513065e3289b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:05=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Wed Oct 14, 2026 at 6:55 PM CEST, Bruce Ashfield wrote:
> > On Wed, Oct 14, 2026 at 10:31=E2=80=AFAM Yoann Congal <yoann.congal@smi=
le.fr>
> wrote:
> >
> >> On Tue Sep 22, 2026 at 10:08 AM CEST, Yoann Congal wrote:
> >> > On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfield via
> >> lists.openembedded.org wrote:
> >> >> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> >>
> >> >> Updating linux-yocto/6.6 to the latest korg -stable release that
> >> comprises
> >> >> the following commits:
> >> >>
> >> >>     79643295eba17 Linux 6.6.157
> >> >>     32e598324edc3 nvmet-rdma: fix queue leak when connect backlog i=
s
> >> exceeded
> >> >>     [...]
> >> >>     73b7a11814838 Revert "arm64: mm: Don't remap pgtables for
> allocate
> >> vs populate"
> >> >>
> >> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> >> ---
> >> >>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
> >> >>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
> >> >>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28
> +++++++++----------
> >> >>  3 files changed, 20 insertions(+), 20 deletions(-)
> >> >
> >> > Hello Bruce,
> >> >
> >> > I think either this 6.6.157 upgrade or the 6.6.156 one triggers a
> >> > lttng ptest failure:
> >> >
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
> >> > qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21
> >> 11:38:31+00:00
> >> >
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577
> >> > qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-21
> >> 14:57:16+00:00
> >> >
> >> >
> >>
> https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux86=
-64-ptest/core-image-ptest-lttng-tools/log.do_testimage.311077.202609211108=
38
> >> :
> >> > (only one of each message):
> >> > |FAIL: kernel/test_userspace_probe 91 - Load command with opts:
> >>
> --input-path=3D/tmp/tmp.test_userspace_probe_save_load_elf_trace_path.zSA=
9mh
> >> > |FAIL: tools/base-path/test_ust 35 - Load command with opts: -i
> >> ./tools/base-path//load-stream-extra-path.lttng
> >> > |FAIL: tools/save-load/test_load 2 - Load command with opts: -i
> >> ./tools/save-load//load-42.lttng
> >> > |FAIL: tools/rotation/test_ust 101 - App is un-registered
> >> > |FAIL: tools/save-load/test_autoload 2 - Lttng-tool list command wit=
h
> >> option load-42
> >> > |FAIL: tools/rotation/test_save_load_mi 17 - Lttng-tool list command
> >> with option yTVkM2lxbFoDS7Nu
> >> > |FAIL: tools/rotation/test_save_load_mi 8 - Valid lttng
> enable-rotation
> >> size XML
> >> > |FAIL: tools/rotation/test_save_load_mi 5 - Valid lttng
> enable-rotation
> >> timer XML
> >> > |FAIL: tools/relayd-grouping/test_ust 120 - Valid lttng list XML
> >> > |FAIL: tools/rotation/test_save_load_mi 18 - Valid lttng list XML
> after
> >> load
> >> > |FAIL: tools/base-path/test_ust 37 - Stop lttng tracing for session
> >> load-stream-extra-path
> >> > |FAIL: tools/trigger/test_add_trigger_cli 293 - add-trigger mi is
> valid
> >> > |FAIL: tools/trigger/test_remove_trigger_cli 20 - remove-trigger mi =
is
> >> valid
> >> > |FAIL: tools/base-path/test_ust 39 - UST per-uid network trace path =
is
> >> valid
> >> > |FAIL: tools/save-load/test_autoload 1 - Start session daemon
> >> > |FAIL: tools/save-load/test_autoload 3 - No session daemon to kill
> >> > |FAIL: tools/save-load/test_load 3 - Destroy session load-42
> >> > |FAIL: tools/base-path/test_ust 38 - Destroy session
> >> load-stream-extra-path
> >> > |FAIL: tools/rotation/test_save_load_mi 21 - Destroy session
> >> yTVkM2lxbFoDS7Nu
> >> > |FAIL: tools/mi/test_mi 3 - MI test: Version xsd validation
> >> > |FAIL: tools/rotation/test_save_load_mi 20 - Found the right rotatio=
n
> >> size value in list XML after load
> >> > |FAIL: tools/base-path/test_ust 40 - Validate trace for event
> tp:tptest
> >> > |FAIL: tools/base-path/test_ust 36 - Start tracing for session
> >> load-stream-extra-path
> >> > |FAIL: kernel/test_userspace_probe 92 - Validate userspace probe
> listing
> >> >
> >> > Any ideas?
> >> >
> >> > Thanks!
> >>
> >> Hello Bruce,
> >>
> >> Gentle ping on the above upgrade failure.
> >>
> >> Do you have time to look at this? If you don't, we'll have organize to
> >> find other resources, we can't not update the kernel.
> >>
> >
> > I'll have time next week, but I can't run the test images locally, so
> I'll
> > need to come up with my
> > own tests :)
>
> Awesome, thanks Bruce!
>


I bumped -stable again, and when I run the lttng ptests against that
kernel, I have all tests passing.

So either something in that kernel update fixed it, or I'm doing something
wrong.

Did you see this once ? or consistently ? There are some AB-INT bugs that
you (among others) have been tracking:

  - 16309 =E2=80=94 ACCEPTED: [scarthgap] AB-INT PTEST: lttng-tools ptest t=
imeout
  - 16139 =E2=80=94 AB-INT PTEST: lttng-tools ptest failure:
tools/config-directory/test_config.py
  - 16358 =E2=80=94 AB-INT PTEST: lttng-tools: Couldn't login into serial c=
onsole
as root using blank password

Could it be one of those ?

I'll send my stable updates later today, and maybe we can run them again to
see if you get the same passes.

Bruce



> --
> Yoann Congal
> Smile ECS
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004b4513065e3289b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 15, 2026 at 3:05=
=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann=
.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Wed Oct 14, 2026 at 6:55 PM CEST, Bruce Ashfield wrote:<=
br>
&gt; On Wed, Oct 14, 2026 at 10:31=E2=80=AFAM Yoann Congal &lt;<a href=3D"m=
ailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt=
; wrote:<br>
&gt;<br>
&gt;&gt; On Tue Sep 22, 2026 at 10:08 AM CEST, Yoann Congal wrote:<br>
&gt;&gt; &gt; On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfield via<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt; &gt;&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Updating linux-yocto/6.6 to the latest korg -stable relea=
se that<br>
&gt;&gt; comprises<br>
&gt;&gt; &gt;&gt; the following commits:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A079643295eba17 Linux 6.6.157<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A032e598324edc3 nvmet-rdma: fix queue le=
ak when connect backlog is<br>
&gt;&gt; exceeded<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0[...]<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A073b7a11814838 Revert &quot;arm64: mm: =
Don&#39;t remap pgtables for allocate<br>
&gt;&gt; vs populate&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce=
.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_6.6.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.6.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt;&gt; &gt;&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-tiny_6.6.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-y=
octo_6.6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a>=C2=
=A0 | 28 +++++++++----------<br>
&gt;&gt; &gt;&gt;=C2=A0 3 files changed, 20 insertions(+), 20 deletions(-)<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hello Bruce,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I think either this 6.6.157 upgrade or the 6.6.156 one trigge=
rs a<br>
&gt;&gt; &gt; lttng ptest failure:<br>
&gt;&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/b=
uilders/73/builds/4604" rel=3D"noreferrer" target=3D"_blank">https://autobu=
ilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604</a><br>
&gt;&gt; &gt; qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09=
-21<br>
&gt;&gt; 11:38:31+00:00<br>
&gt;&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/b=
uilders/61/builds/4577" rel=3D"noreferrer" target=3D"_blank">https://autobu=
ilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577</a><br>
&gt;&gt; &gt; qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 202=
6-09-21<br>
&gt;&gt; 14:57:16+00:00<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; <a href=3D"https://valkyrie.yocto.io/pub/non-release/20260921-71/t=
estresults/qemux86-64-ptest/core-image-ptest-lttng-tools/log.do_testimage.3=
11077.20260921110838" rel=3D"noreferrer" target=3D"_blank">https://valkyrie=
.yocto.io/pub/non-release/20260921-71/testresults/qemux86-64-ptest/core-ima=
ge-ptest-lttng-tools/log.do_testimage.311077.20260921110838</a><br>
&gt;&gt; :<br>
&gt;&gt; &gt; (only one of each message):<br>
&gt;&gt; &gt; |FAIL: kernel/test_userspace_probe 91 - Load command with opt=
s:<br>
&gt;&gt; --input-path=3D/tmp/tmp.test_userspace_probe_save_load_elf_trace_p=
ath.zSA9mh<br>
&gt;&gt; &gt; |FAIL: tools/base-path/test_ust 35 - Load command with opts: =
-i<br>
&gt;&gt; ./tools/base-path//load-stream-extra-path.lttng<br>
&gt;&gt; &gt; |FAIL: tools/save-load/test_load 2 - Load command with opts: =
-i<br>
&gt;&gt; ./tools/save-load//load-42.lttng<br>
&gt;&gt; &gt; |FAIL: tools/rotation/test_ust 101 - App is un-registered<br>
&gt;&gt; &gt; |FAIL: tools/save-load/test_autoload 2 - Lttng-tool list comm=
and with<br>
&gt;&gt; option load-42<br>
&gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 17 - Lttng-tool list =
command<br>
&gt;&gt; with option yTVkM2lxbFoDS7Nu<br>
&gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 8 - Valid lttng enabl=
e-rotation<br>
&gt;&gt; size XML<br>
&gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 5 - Valid lttng enabl=
e-rotation<br>
&gt;&gt; timer XML<br>
&gt;&gt; &gt; |FAIL: tools/relayd-grouping/test_ust 120 - Valid lttng list =
XML<br>
&gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 18 - Valid lttng list=
 XML after<br>
&gt;&gt; load<br>
&gt;&gt; &gt; |FAIL: tools/base-path/test_ust 37 - Stop lttng tracing for s=
ession<br>
&gt;&gt; load-stream-extra-path<br>
&gt;&gt; &gt; |FAIL: tools/trigger/test_add_trigger_cli 293 - add-trigger m=
i is valid<br>
&gt;&gt; &gt; |FAIL: tools/trigger/test_remove_trigger_cli 20 - remove-trig=
ger mi is<br>
&gt;&gt; valid<br>
&gt;&gt; &gt; |FAIL: tools/base-path/test_ust 39 - UST per-uid network trac=
e path is<br>
&gt;&gt; valid<br>
&gt;&gt; &gt; |FAIL: tools/save-load/test_autoload 1 - Start session daemon=
<br>
&gt;&gt; &gt; |FAIL: tools/save-load/test_autoload 3 - No session daemon to=
 kill<br>
&gt;&gt; &gt; |FAIL: tools/save-load/test_load 3 - Destroy session load-42<=
br>
&gt;&gt; &gt; |FAIL: tools/base-path/test_ust 38 - Destroy session<br>
&gt;&gt; load-stream-extra-path<br>
&gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 21 - Destroy session<=
br>
&gt;&gt; yTVkM2lxbFoDS7Nu<br>
&gt;&gt; &gt; |FAIL: tools/mi/test_mi 3 - MI test: Version xsd validation<b=
r>
&gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 20 - Found the right =
rotation<br>
&gt;&gt; size value in list XML after load<br>
&gt;&gt; &gt; |FAIL: tools/base-path/test_ust 40 - Validate trace for event=
 tp:tptest<br>
&gt;&gt; &gt; |FAIL: tools/base-path/test_ust 36 - Start tracing for sessio=
n<br>
&gt;&gt; load-stream-extra-path<br>
&gt;&gt; &gt; |FAIL: kernel/test_userspace_probe 92 - Validate userspace pr=
obe listing<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Any ideas?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks!<br>
&gt;&gt;<br>
&gt;&gt; Hello Bruce,<br>
&gt;&gt;<br>
&gt;&gt; Gentle ping on the above upgrade failure.<br>
&gt;&gt;<br>
&gt;&gt; Do you have time to look at this? If you don&#39;t, we&#39;ll have=
 organize to<br>
&gt;&gt; find other resources, we can&#39;t not update the kernel.<br>
&gt;&gt;<br>
&gt;<br>
&gt; I&#39;ll have time next week, but I can&#39;t run the test images loca=
lly, so I&#39;ll<br>
&gt; need to come up with my<br>
&gt; own tests :)<br>
<br>
Awesome, thanks Bruce!<br></blockquote><div><br></div><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">I bumped -stable agai=
n, and when I run the lttng ptests against that kernel, I have all tests pa=
ssing.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">So either somethin=
g in that kernel update fixed it, or I&#39;m doing something wrong.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Did you see this once ? or con=
sistently ? There are some AB-INT bugs that you (among others) have been tr=
acking:</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 - 16309 =
=E2=80=94 ACCEPTED: [scarthgap] AB-INT PTEST: lttng-tools ptest timeout<br>=
=C2=A0 - 16139 =E2=80=94 AB-INT PTEST: lttng-tools ptest failure: tools/con=
fig-directory/test_config.py<br>=C2=A0 - 16358 =E2=80=94 AB-INT PTEST: lttn=
g-tools: Couldn&#39;t login into serial console as root using blank passwor=
d<br></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Could it be one of =
those ?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll send my =
stable updates later today, and maybe we can run them again to see if you g=
et the same passes.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce=
</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000004b4513065e3289b1--

