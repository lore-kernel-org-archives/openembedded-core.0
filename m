Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4332C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 13:52:10 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.7819.1698846727021856730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 06:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JHNIYznF;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99de884ad25so1045205666b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 06:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698846725; x=1699451525; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GnaBYe4Z3ZBLfHp9nPQg5gy8x4pTR4H3eTRlofbvVM=;
        b=JHNIYznFFpbIPiwZpsCIfS0nuGrXY1u9K1Dt3uqpPqrj3w3gwPnQxwdNv/+O4RjHMa
         qSjjKG+6HUtVSsf0lWuu+q1EmXpIsmuFGuat7lkhKJHnOpdi7hOVRJAtRu9TZZpvIB4B
         glvYURte67tVNHFUxMZwLmpq2yGZGjoBvf3yAf0zXStNHdgAovle92dMxkXJktfem4jB
         DpjA1wbMQZmnCyDb17iQ9o9mU4OVuL0zbMoP5z7gMRsRdwa93bY/OhKsngkh5pac5+Du
         19gWIby5evL/VWzH5T1ZRPyeWjOZ0ikAtI1r6IOIYEN0TQR/lmCEbMG/9Hxyno6x5Ulc
         FTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698846725; x=1699451525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GnaBYe4Z3ZBLfHp9nPQg5gy8x4pTR4H3eTRlofbvVM=;
        b=K5rnOs2HG5BZZZX3k0ejTK78b2t1bRKORdkytG+7qha7x7IIe5QNnpJ8MUs1A/CtYV
         kKg7leBCV6p50Iqo0huQ5laAiBoVIr/N1Il1wHUIF94yEIb9SHvwA63UWx7ScPCVylyY
         QsBHdj3enuP2l/f5gJ+Vg/i2mZgUBDLM0B6AO+0MTLHRZHKe9kFOEhg+TOVCuBizggfc
         Sq81/CO1KCOPwhWiVzQ05vksUboApBjB6HItDUXlS1vGio7sjQ3/P3qmeN+QhwS9Op4C
         j9irhpXeBBfpZ6SJVwCry++iAhfoO0z8wxfxoDPS63CSRcEfQ2KqyU9gBlhYtowukHpS
         wCAQ==
X-Gm-Message-State: AOJu0YzYuvhw3D+Mn1B/yfJ4XxoWqojNqFSIbEdQyigr20WBDRImHPlF
	uJy6lLDEoN6iX1CO3dAmQVNcYvnu3lgJqWtyKuzUc37/GjQB9mOm
X-Google-Smtp-Source: AGHT+IGxMiHdniz+Sd3/UPGggSzGQ5ISLOrPRBAzYRFuTrab9ZVBvnEwOouFbMPa0kD2JtaNbZPVcm/68ErXDNSvcV8=
X-Received: by 2002:a17:907:25c6:b0:9d5:d803:31fb with SMTP id
 ae6-20020a17090725c600b009d5d80331fbmr1957004ejc.41.1698846725253; Wed, 01
 Nov 2023 06:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1698789786.git.steve@sakoman.com> <4dcd5e0a0bb43c23850e3a711fc7e2230575d245.1698789786.git.steve@sakoman.com>
 <CA+chaQeAGGEAYu8tnrsgyEN39+TNtYi6HJoGc4bfyDGjBiTpnQ@mail.gmail.com>
In-Reply-To: <CA+chaQeAGGEAYu8tnrsgyEN39+TNtYi6HJoGc4bfyDGjBiTpnQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 1 Nov 2023 03:51:53 -1000
Message-ID: <CAOSpxdYupYx4Uq736FgTggURgU3P_eHe-PGnd9MG0oohc-Paqw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 3/3] libwebp: Fix CVE-2023-4863
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 13:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189914

Thanks for reviewing Martin!

I'll drop this patch until there is further clarification on the need for i=
t.

Steve

On Tue, Oct 31, 2023 at 1:39=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> I'm surprised this one does apply in kirkstone as there is this security =
issue already fixed as 2023-5129 (see dunfell commit https://git.openembedd=
ed.org/openembedded-core/commit/?h=3Ddunfell&id=3D7dce529515baa843ba3e5c89b=
2ad605b9845c59b and a bit more details in https://lists.openembedded.org/g/=
openembedded-core/message/189262 )
>
> Is https://github.com/webmproject/libwebp/commit/95ea5226c870449522240ccf=
f26f0b006037c520 really related to CVE-2023-4863 ?
>
> On Tue, Oct 31, 2023 at 11:05=E2=80=AFPM Steve Sakoman <steve@sakoman.com=
> wrote:
>>
>> From: Soumya Sambu <soumya.sambu@windriver.com>
>>
>> Heap buffer overflow in WebP in Google Chrome prior to
>> 116.0.5845.187 allowed a remote attacker to perform an
>> out of bounds memory write via a crafted HTML page.
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2023-4863
>> https://security-tracker.debian.org/tracker/CVE-2023-4863
>> https://bugzilla.redhat.com/show_bug.cgi?id=3D2238431#c12
>>
>> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  .../webp/files/CVE-2023-4863.patch            | 53 +++++++++++++++++++
>>  meta/recipes-multimedia/webp/libwebp_1.2.4.bb |  1 +
>>  2 files changed, 54 insertions(+)
>>  create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863.pat=
ch
>>
>> diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch b/me=
ta/recipes-multimedia/webp/files/CVE-2023-4863.patch
>> new file mode 100644
>> index 0000000000..2b1817822c
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
>> @@ -0,0 +1,53 @@
>> +From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00 2001
>> +From: Vincent Rabaud <vrabaud@google.com>
>> +Date: Mon, 11 Sep 2023 16:06:08 +0200
>> +Subject: [PATCH] Fix invalid incremental decoding check.
>> +
>> +The first condition is only necessary if we have not read enough
>> +(enough being defined by src_last, not src_end which is the end
>> +of the image).
>> +The second condition now fits the comment below: "if not
>> +incremental, and we are past the end of buffer".
>> +
>> +BUG=3Doss-fuzz:62136
>> +
>> +Change-Id: I0700f67c62db8e1c02c2e429a069a71e606a5e4f
>> +
>> +CVE: CVE-2023-4863
>> +
>> +Upstream-Status: Backport [https://github.com/webmproject/libwebp/commi=
t/95ea5226c870449522240ccff26f0b006037c520]
>> +
>> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>> +---
>> + src/dec/vp8l_dec.c | 15 +++++++++++++--
>> + 1 file changed, 13 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
>> +index 186b0b2..59a9e64 100644
>> +--- a/src/dec/vp8l_dec.c
>> ++++ b/src/dec/vp8l_dec.c
>> +@@ -1241,9 +1241,20 @@ static int DecodeImageData(VP8LDecoder* const de=
c, uint32_t* const data,
>> +   }
>> +
>> +   br->eos_ =3D VP8LIsEndOfStream(br);
>> +-  if (dec->incremental_ && br->eos_ && src < src_end) {
>> ++  // In incremental decoding:
>> ++  // br->eos_ && src < src_last: if 'br' reached the end of the buffer=
 and
>> ++  // 'src_last' has not been reached yet, there is not enough data. 'd=
ec' has to
>> ++  // be reset until there is more data.
>> ++  // !br->eos_ && src < src_last: this cannot happen as either the buf=
fer is
>> ++  // fully read, either enough has been read to reach 'src_last'.
>> ++  // src >=3D src_last: 'src_last' is reached, all is fine. 'src' can =
actually go
>> ++  // beyond 'src_last' in case the image is cropped and an LZ77 goes f=
urther.
>> ++  // The buffer might have been enough or there is some left. 'br->eos=
_' does
>> ++  // not matter.
>> ++  assert(!dec->incremental_ || (br->eos_ && src < src_last) || src >=
=3D src_last);
>> ++  if (dec->incremental_ && br->eos_ && src < src_last) {
>> +     RestoreState(dec);
>> +-  } else if (!br->eos_) {
>> ++  } else if ((dec->incremental_ && src >=3D src_last) || !br->eos_) {
>> +     // Process the remaining rows corresponding to last row-block.
>> +     if (process_func !=3D NULL) {
>> +       process_func(dec, row > last_row ? last_row : row);
>> +--
>> +2.40.0
>> diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb b/meta/recipe=
s-multimedia/webp/libwebp_1.2.4.bb
>> index 4defdd5e42..0728ca60f5 100644
>> --- a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
>> +++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
>> @@ -16,6 +16,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6e8dee932c2=
6f2dab503abf70c96d8bb \
>>  SRC_URI =3D "http://downloads.webmproject.org/releases/webp/${BP}.tar.g=
z \
>>             file://CVE-2023-1999.patch \
>>             file://CVE-2023-5129.patch \
>> +           file://CVE-2023-4863.patch \
>>             "
>>  SRC_URI[sha256sum] =3D "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5=
480c205331d9494df"
>>
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#189873): https://lists.openembedded.org/g/openembedd=
ed-core/message/189873
>> Mute This Topic: https://lists.openembedded.org/mt/102307907/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [m=
artin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

