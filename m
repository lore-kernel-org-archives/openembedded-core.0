Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1CFC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 14:40:18 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.168046.1673880010102408639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 06:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dLbsucjk;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id v13so6861669eda.11
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 06:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JMOfyXW0Sq/VJ3e2eSU2q2ovcvCZAE9YTNNJhH45qS0=;
        b=dLbsucjk8XtNZQTAUmDfZriECoLNjaBPjvAMDZ5P1+v5XeE7jTeC+VVDDk16Tz9gu2
         KwInmJ8nSvOlSywjGqezgTm0O7odX+0msugGwjPIn5DrugB8mCe+OdFHfrNkInftc0bN
         TqoeIi8k6/RsiUr/3Fw8Pf1KVntMZRz74kzCJj7QgxShUfuMXaS4QzYusDtH7s2DTquW
         BzqBYeLtHkyVCaVNLyiITA/Hh0IHJh8OsySvUdr5VjzEiPCMKvn3N93ziu5mlYxFZk9A
         +HEcyhvnhxNSr/ZKw6olaU7ewwRhOBS2q5egvidPvsqv5EgwakWRgK6XAczeG2Eky3oH
         66Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JMOfyXW0Sq/VJ3e2eSU2q2ovcvCZAE9YTNNJhH45qS0=;
        b=lVBEDPkb7WoQQoI2lKNzzeGutVxGH5tfrdGpq3M2T+qpEB5mZP1xOpNX+wqeugt4dI
         b7o0H2C5r36+asCpUu/km6uGclFNYO9y5EkJwUQ403ayR3YaQTqdGOf7F6U0tvy2L0ao
         N/Rd02lUDeE3svLzYT4XVV91gpgk2dqAHokmZCDjgB+RLEzxX5MCRA7Lg7I0a6A641er
         uGYneQAXti1XZGRFqTPJO66P5vD4PAwkBlSO/pgVpFDtKtu1sBr1E2tJzA0ZOmOJWmJl
         Cskm3KKCErm0i//G0dLY/5vCK1kKmf58Mp20e+TrB2ENuhwE8T6IEFY2JnsM+DFbRzTJ
         ALcg==
X-Gm-Message-State: AFqh2kpliupJiq/H3LKBZrBy7payeNxdrgaeDD/0xzKZ9Ei4GPBd9IB5
	4Nf5+P+/OmgyehvQ49U4kOw8BrtNGpnou3tQkpakXw==
X-Google-Smtp-Source: AMrXdXtIgJ36UPkivSLCddjZIrMC7MK0gdht27GGHUChkdzvwKWDQEz2UNTFrfmVC2YPQTds1Gx8vZI/s1JkkZepyZI=
X-Received: by 2002:a05:6402:4013:b0:49a:b8ee:ef4b with SMTP id
 d19-20020a056402401300b0049ab8eeef4bmr1590232eda.143.1673880008462; Mon, 16
 Jan 2023 06:40:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673490673.git.steve@sakoman.com> <30119a4797c89b8b501246c4266b08a62467833d.1673490673.git.steve@sakoman.com>
 <CA+chaQf9XVD=DzD_+X7qvnROzg9k7198LzYbJfC5jgZ=UW74HQ@mail.gmail.com> <173AD09A8D75CB5F.23170@lists.openembedded.org>
In-Reply-To: <173AD09A8D75CB5F.23170@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 16 Jan 2023 04:39:57 -1000
Message-ID: <CAOSpxday7jN+adFeLz=yC3+97vk0ba2mvFpC-qMDTv=nRbrLZQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 03/11] ffmpeg: fix for CVE-2022-3109
To: steve@sakoman.com
Cc: Martin Jansa <martin.jansa@gmail.com>, narpat.mali@windriver.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 14:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175988

On Mon, Jan 16, 2023 at 4:32 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Mon, Jan 16, 2023 at 2:00 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > This patch doesn't apply cleanly on ffmpeg-5.0.1:
>
> Thanks for the review Martin.
>
> Not sure why this didn't show up in my testing!  But since Richard
> hasn't taken the pull request yet I will remove this patch from the
> current pull request and move it to my next set of patches (along with
> your fix).

Sigh, clearly I haven't had enough coffee yet this morning -- Richard
has indeed already taken the pull request!

I'll put your fix patch in the next set of patches for kirkstone and
send a new pull request right after testing.

Steve

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
> > ERROR: ffmpeg-5.0.1-r0 do_patch: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]
> >
> > Narpat: Should I send a fix or will you handle that?
> >
> > On Thu, Jan 12, 2023 at 3:33 AM Steve Sakoman <steve@sakoman.com> wrote:
> >>
> >> From: Narpat Mali <narpat.mali@windriver.com>
> >>
> >> An issue was discovered in the FFmpeg package, where vp3_decode_frame in libavcodec/vp3.c lacks check of
> >> the return value of av_malloc() and will cause a null pointer dereference, impacting availability.
> >>
> >> CVE: CVE-2022-3109
> >>
> >> Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568]
> >>
> >> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> ---
> >>  ...-vp3-Add-missing-check-for-av_malloc.patch | 44 +++++++++++++++++++
> >>  .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  3 +-
> >>  2 files changed, 46 insertions(+), 1 deletion(-)
> >>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
> >>
> >> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
> >> new file mode 100644
> >> index 0000000000..94858a6cdd
> >> --- /dev/null
> >> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
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
> >> +Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568]
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
> >> +@@ -2679,8 +2679,13 @@ static int vp3_decode_frame(AVCodecContext *avctx,
> >> +                                         AV_GET_BUFFER_FLAG_REF)) < 0)
> >> +         goto error;
> >> +
> >> +-    if (!s->edge_emu_buffer)
> >> ++    if (!s->edge_emu_buffer) {
> >> +         s->edge_emu_buffer = av_malloc(9 * FFABS(s->current_frame.f->linesize[0]));
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
> >> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> >> index 95b4bf50ac..c5bebe9c2d 100644
> >> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> >> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> >> @@ -26,7 +26,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
> >>             file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
> >>             file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
> >>             file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
> >> -           "
> >> +           file://0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch \
> >> +          "
> >>
> >>  SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175987): https://lists.openembedded.org/g/openembedded-core/message/175987
> Mute This Topic: https://lists.openembedded.org/mt/96215555/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

