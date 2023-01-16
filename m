Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5897BC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 14:45:38 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.168197.1673880328598944380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 06:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N9NbWK18;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so23776352wmb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 06:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xLFcGFOpK+WnlSEig8119toW3zqdEMp2xtNnSvZLdoY=;
        b=N9NbWK18a93n0JPa3x/xNShLZ4lPHhEhlLAmXz95nVsVPGtG1XYgu1aBApYlJBR3wl
         oV43RlLr2us+XyyN+j+uEFP4+h+2nqWOZqhWGn51yM8yo6tOngZC6tdLJAyABNIxRDCn
         5JXUJTVswtXT6LWFmLUtdj54nhopY0xvHDvBdcwrrMD+Ob2iUKsOSoU9zRBvlN8auz//
         zIn4NdVwkY064CE0Py4q/dWw/ZpUoUO3S3SULsOPG7up9vo3ztX/eqJbuX4Ltjh7nsXY
         hiNs+VMtVPnBj/SiPqyKqJoJ9htCh+euolwGCtx+5YrCCfBwzw9QQpt22G4gJRrR+/GY
         DKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLFcGFOpK+WnlSEig8119toW3zqdEMp2xtNnSvZLdoY=;
        b=BDPy7eLn4eLDE4WnzEcLNbkOW0FObqWfx6j/nYN+ZwhL7lqipJ5qcVc7mCbQNbhfFN
         8py5o3b59fV5149iA/Xw8ijWy9BYqB1VfQWv/RVoBBJC29AaC4l86Whyplbm1MWNJHil
         Upnn6Sr7E9OChtBHKtSjpDXAihdEkdRAVtRDjJl+0DZHJpZlTjIe4GoiXYwdY3BMGi7n
         UvqmsUnOeum8vqy+gZyuPyOrFp/wWsZ+d8uTHsrd8oGsO4MsUa26+Nml24exlNpjlY/h
         4aWBWI/768vAoP6WXEKNI6P8HY1+jbW85cUOU7k14vXq15r+qrer72kd2kqTDMNtV4Mj
         tckA==
X-Gm-Message-State: AFqh2krQ+C6a5SPbU3h5OJVKMPcaJssqxCR5yg6w568AMQj9YQuQ1yX7
	HHbTWw1MZo4OOxxA5Mpc42OMd5ZE0gESMasQgYULjBBo3kk=
X-Google-Smtp-Source: AMrXdXt9hSa6WGChlQnNi5mJpcVPIrgvZTyh9EV3szjBM+g5vkXTw6mwSVZF2PMLUtUmbYv2uvIseAoCqj3EXFsPyrY=
X-Received: by 2002:a7b:c8d9:0:b0:3da:26ab:a38 with SMTP id
 f25-20020a7bc8d9000000b003da26ab0a38mr550123wml.102.1673880326943; Mon, 16
 Jan 2023 06:45:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673490673.git.steve@sakoman.com> <30119a4797c89b8b501246c4266b08a62467833d.1673490673.git.steve@sakoman.com>
 <CA+chaQf9XVD=DzD_+X7qvnROzg9k7198LzYbJfC5jgZ=UW74HQ@mail.gmail.com> <CAOSpxdbMz6566bQn8hDrgKEuuAkqmHKs5-t-jTLSq1_KF+2pXw@mail.gmail.com>
In-Reply-To: <CAOSpxdbMz6566bQn8hDrgKEuuAkqmHKs5-t-jTLSq1_KF+2pXw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Jan 2023 15:45:15 +0100
Message-ID: <CA+chaQfpaBN_UtbSYu=J7xGdaMnrnLoanBbP5AHtUzyGPVXzTw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 03/11] ffmpeg: fix for CVE-2022-3109
To: Steve Sakoman <steve@sakoman.com>
Cc: narpat.mali@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000048b7a605f262a280"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 14:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175989

--00000000000048b7a605f262a280
Content-Type: text/plain; charset="UTF-8"

> Not sure why this didn't show up in my testing!

It's shown only when do_patch task is really executed and it doesn't cause
the do_patch to fail completely. So it's possible that you've built it once
with the warning/error shown and then the next time you were doing the
final test for kirkstone it was just re-using ffmpeg from sstate (without
the need to re-executed do_patch again).

Maybe we should consider this issue to be fatal for do_fetch when
patch-fuzz is in ERROR_QA (I even thought it was working like that at some
time).

Regards,

On Mon, Jan 16, 2023 at 3:32 PM Steve Sakoman <steve@sakoman.com> wrote:

> On Mon, Jan 16, 2023 at 2:00 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > This patch doesn't apply cleanly on ffmpeg-5.0.1:
>
> Thanks for the review Martin.
>
> Not sure why this didn't show up in my testing!  But since Richard
> hasn't taken the pull request yet I will remove this patch from the
> current pull request and move it to my next set of patches (along with
> your fix).
>
> Thanks!
>
> Steve
>
> >
> > ERROR: ffmpeg-5.0.1-r0 do_patch: Fuzz detected:
> >
> > Applying patch 0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
> > patching file libavcodec/vp3.c
> > Hunk #1 succeeded at 2677 with fuzz 1 (offset -2 lines).
> >
> >
> > The context lines in the patches can be updated with devtool:
> >
> >     devtool modify ffmpeg
> >     devtool finish --force-patch-refresh ffmpeg <layer_path>
> >
> > Don't forget to review changes done by devtool!
> >
> > ERROR: ffmpeg-5.0.1-r0 do_patch: QA Issue: Patch log indicates that
> patches do not apply cleanly. [patch-fuzz]
> >
> > Narpat: Should I send a fix or will you handle that?
> >
> > On Thu, Jan 12, 2023 at 3:33 AM Steve Sakoman <steve@sakoman.com> wrote:
> >>
> >> From: Narpat Mali <narpat.mali@windriver.com>
> >>
> >> An issue was discovered in the FFmpeg package, where vp3_decode_frame
> in libavcodec/vp3.c lacks check of
> >> the return value of av_malloc() and will cause a null pointer
> dereference, impacting availability.
> >>
> >> CVE: CVE-2022-3109
> >>
> >> Upstream-Status: Backport [
> https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568
> ]
> >>
> >> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> ---
> >>  ...-vp3-Add-missing-check-for-av_malloc.patch | 44 +++++++++++++++++++
> >>  .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  3 +-
> >>  2 files changed, 46 insertions(+), 1 deletion(-)
> >>  create mode 100644
> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
> >>
> >> diff --git
> a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
> b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
> >> new file mode 100644
> >> index 0000000000..94858a6cdd
> >> --- /dev/null
> >> +++
> b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
> >> @@ -0,0 +1,44 @@
> >> +From 656cb0450aeb73b25d7d26980af342b37ac4c568 Mon Sep 17 00:00:00 2001
> >> +From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> >> +Date: Tue, 15 Feb 2022 17:58:08 +0800
> >> +Subject: [PATCH] avcodec/vp3: Add missing check for av_malloc
> >> +
> >> +Since the av_malloc() may fail and return NULL pointer,
> >> +it is needed that the 's->edge_emu_buffer' should be checked
> >> +whether the new allocation is success.
> >> +
> >> +Fixes: d14723861b ("VP3: fix decoding of videos with stride > 2048")
> >> +Reviewed-by: Peter Ross <pross@xvid.org>
> >> +Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> >> +
> >> +CVE: CVE-2022-3109
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568
> ]
> >> +
> >> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> >> +---
> >> + libavcodec/vp3.c | 7 ++++++-
> >> + 1 file changed, 6 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c
> >> +index e9ab54d736..e2418eb6fa 100644
> >> +--- a/libavcodec/vp3.c
> >> ++++ b/libavcodec/vp3.c
> >> +@@ -2679,8 +2679,13 @@ static int vp3_decode_frame(AVCodecContext
> *avctx,
> >> +                                         AV_GET_BUFFER_FLAG_REF)) < 0)
> >> +         goto error;
> >> +
> >> +-    if (!s->edge_emu_buffer)
> >> ++    if (!s->edge_emu_buffer) {
> >> +         s->edge_emu_buffer = av_malloc(9 *
> FFABS(s->current_frame.f->linesize[0]));
> >> ++        if (!s->edge_emu_buffer) {
> >> ++            ret = AVERROR(ENOMEM);
> >> ++            goto error;
> >> ++        }
> >> ++    }
> >> +
> >> +     if (s->keyframe) {
> >> +         if (!s->theora) {
> >> +--
> >> +2.34.1
> >> +
> >> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> >> index 95b4bf50ac..c5bebe9c2d 100644
> >> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> >> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> >> @@ -26,7 +26,8 @@ SRC_URI = "
> https://www.ffmpeg.org/releases/${BP}.tar.xz \
> >>
>  file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
> >>
>  file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
> >>
>  file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
> >> -           "
> >> +
>  file://0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch \
> >> +          "
> >>
> >>  SRC_URI[sha256sum] =
> "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#175776):
> https://lists.openembedded.org/g/openembedded-core/message/175776
> >> Mute This Topic: https://lists.openembedded.org/mt/96215555/3617156
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>

--00000000000048b7a605f262a280
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Not sure why this didn&#39;t show up in my testing!=
=C2=A0<div><br></div><div>It&#39;s shown only when do_patch task is really =
executed and it doesn&#39;t cause the do_patch to fail completely. So it&#3=
9;s possible that you&#39;ve built it once with the warning/error shown and=
 then the next time you were doing the final test for kirkstone it was just=
 re-using ffmpeg from sstate (without the need to re-executed do_patch agai=
n).</div><div><br></div><div>Maybe we should consider this issue to be fata=
l for do_fetch when patch-fuzz is in ERROR_QA (I even thought it was workin=
g like that at some time).</div><div><br></div><div>Regards,</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, J=
an 16, 2023 at 3:32 PM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.co=
m">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Mon, Jan 16, 2023 at 2:00 AM Martin Jansa &lt;<a hre=
f=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch doesn&#39;t apply cleanly on ffmpeg-5.0.1:<br>
<br>
Thanks for the review Martin.<br>
<br>
Not sure why this didn&#39;t show up in my testing!=C2=A0 But since Richard=
<br>
hasn&#39;t taken the pull request yet I will remove this patch from the<br>
current pull request and move it to my next set of patches (along with<br>
your fix).<br>
<br>
Thanks!<br>
<br>
Steve<br>
<br>
&gt;<br>
&gt; ERROR: ffmpeg-5.0.1-r0 do_patch: Fuzz detected:<br>
&gt;<br>
&gt; Applying patch 0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch<=
br>
&gt; patching file libavcodec/vp3.c<br>
&gt; Hunk #1 succeeded at 2677 with fuzz 1 (offset -2 lines).<br>
&gt;<br>
&gt;<br>
&gt; The context lines in the patches can be updated with devtool:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0devtool modify ffmpeg<br>
&gt;=C2=A0 =C2=A0 =C2=A0devtool finish --force-patch-refresh ffmpeg &lt;lay=
er_path&gt;<br>
&gt;<br>
&gt; Don&#39;t forget to review changes done by devtool!<br>
&gt;<br>
&gt; ERROR: ffmpeg-5.0.1-r0 do_patch: QA Issue: Patch log indicates that pa=
tches do not apply cleanly. [patch-fuzz]<br>
&gt;<br>
&gt; Narpat: Should I send a fix or will you handle that?<br>
&gt;<br>
&gt; On Thu, Jan 12, 2023 at 3:33 AM Steve Sakoman &lt;<a href=3D"mailto:st=
eve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com"=
 target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; An issue was discovered in the FFmpeg package, where vp3_decode_fr=
ame in libavcodec/vp3.c lacks check of<br>
&gt;&gt; the return value of av_malloc() and will cause a null pointer dere=
ference, impacting availability.<br>
&gt;&gt;<br>
&gt;&gt; CVE: CVE-2022-3109<br>
&gt;&gt;<br>
&gt;&gt; Upstream-Status: Backport [<a href=3D"https://github.com/FFmpeg/FF=
mpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7=
d26980af342b37ac4c568</a>]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windr=
iver.com" target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.c=
om" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...-vp3-Add-missing-check-for-av_malloc.patch | 44 +++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 .../recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.1.bb</a> |=C2=A0 3 +-<=
br>
&gt;&gt;=C2=A0 2 files changed, 46 insertions(+), 1 deletion(-)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/000=
1-avcodec-vp3-Add-missing-check-for-av_malloc.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp=
3-Add-missing-check-for-av_malloc.patch b/meta/recipes-multimedia/ffmpeg/ff=
mpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..94858a6cdd<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-m=
issing-check-for-av_malloc.patch<br>
&gt;&gt; @@ -0,0 +1,44 @@<br>
&gt;&gt; +From 656cb0450aeb73b25d7d26980af342b37ac4c568 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Jiasheng Jiang &lt;<a href=3D"mailto:jiasheng@iscas.ac.cn" =
target=3D"_blank">jiasheng@iscas.ac.cn</a>&gt;<br>
&gt;&gt; +Date: Tue, 15 Feb 2022 17:58:08 +0800<br>
&gt;&gt; +Subject: [PATCH] avcodec/vp3: Add missing check for av_malloc<br>
&gt;&gt; +<br>
&gt;&gt; +Since the av_malloc() may fail and return NULL pointer,<br>
&gt;&gt; +it is needed that the &#39;s-&gt;edge_emu_buffer&#39; should be c=
hecked<br>
&gt;&gt; +whether the new allocation is success.<br>
&gt;&gt; +<br>
&gt;&gt; +Fixes: d14723861b (&quot;VP3: fix decoding of videos with stride =
&gt; 2048&quot;)<br>
&gt;&gt; +Reviewed-by: Peter Ross &lt;<a href=3D"mailto:pross@xvid.org" tar=
get=3D"_blank">pross@xvid.org</a>&gt;<br>
&gt;&gt; +Signed-off-by: Jiasheng Jiang &lt;<a href=3D"mailto:jiasheng@isca=
s.ac.cn" target=3D"_blank">jiasheng@iscas.ac.cn</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +CVE: CVE-2022-3109<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/FFmpeg/F=
Fmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d=
7d26980af342b37ac4c568</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@wind=
river.com" target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + libavcodec/vp3.c | 7 ++++++-<br>
&gt;&gt; + 1 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c<br>
&gt;&gt; +index e9ab54d736..e2418eb6fa 100644<br>
&gt;&gt; +--- a/libavcodec/vp3.c<br>
&gt;&gt; ++++ b/libavcodec/vp3.c<br>
&gt;&gt; +@@ -2679,8 +2679,13 @@ static int vp3_decode_frame(AVCodecContext=
 *avctx,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AV_GET_BUFFER_FLAG_REF)) &lt; 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 if (!s-&gt;edge_emu_buffer)<br>
&gt;&gt; ++=C2=A0 =C2=A0 if (!s-&gt;edge_emu_buffer) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;edge_emu_buffer =3D av_ma=
lloc(9 * FFABS(s-&gt;current_frame.f-&gt;linesize[0]));<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!s-&gt;edge_emu_buffer) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D AVERROR(ENOMEM=
);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (s-&gt;keyframe) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;theora) {<br>
&gt;&gt; +--<br>
&gt;&gt; +2.34.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmp=
eg_5.0.1.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.1.bb</a> b/met=
a/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.1.bb" rel=3D"noref=
errer" target=3D"_blank">ffmpeg_5.0.1.bb</a><br>
&gt;&gt; index 95b4bf50ac..c5bebe9c2d 100644<br>
&gt;&gt; --- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.=
1.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.=
1.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.1.bb</a><br>
&gt;&gt; @@ -26,7 +26,8 @@ SRC_URI =3D &quot;<a href=3D"https://www.ffmpeg.=
org/releases/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:/=
/www.ffmpeg.org/releases/${BP}.tar.xz</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libavut=
il-include-assembly-with-full-path-from-sourc.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-avcodec=
-rpzaenc-stop-accessing-out-of-bounds-frame.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-avcodec=
-smcenc-stop-accessing-out-of-bounds-frame.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-avcodec-vp3-=
Add-missing-check-for-av_malloc.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;ef2efae259ce80a240de48ec85ecb06=
2cecca26e4352ffb3fda562c21a93007b&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#175776): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/175776" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/175776</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9621=
5555/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/96215555/3617156</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmai=
l.com" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--00000000000048b7a605f262a280--

