Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE92F109879E
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 15:37:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15912.1774021036918117426
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 08:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vjyu1BAI;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so16144865e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774021035; x=1774625835; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsN/0L+KzKXqBq8U6eHiMTOSccEYPcwpB2+TyRD0QZE=;
        b=vjyu1BAIpEdjyyppis9krXQThuFTH589w0UY3aYpegG2ivqiSKBK/xHqamR/WJhC9z
         hObv2iECLJSFO4npjsiOyoHySpF7nY6a0zl8+efcvp6+sMa84B3Bc8LhqqCVJz5IY0aZ
         byARON3z3c1M5rbPCeWCYfksJoPaEo7jSfdiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774021035; x=1774625835;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsN/0L+KzKXqBq8U6eHiMTOSccEYPcwpB2+TyRD0QZE=;
        b=AoE7lkxVvl1jF4OKEqerUTstWbv+S3KehIzJJ2fkLpv8DFnYxhuo6wFiuhxiq9i1An
         Fgl1z1GhG0E9mvdPAwOB9zSZurfm5KNgIeMqsNdSiWCeeT5z+4GVULFwN59vF2fD96iF
         lqPCg1slnJeNR6wO3mJ9CAdb/y7u6OBRtFdzkBIPg3z9Nqa3pgJzPm9aq0aXAM96LMc5
         Qapb20tkqTPECZs8tNuSzw9oDNy5+J1ZLmq1c/IX7Fe6XxczPMVTlcypF1GVhBeUw3cN
         XK0ReUGd4BFKzv/amGJy407YwdbXkHoSwJQ01qyBeoSAdTBiddm/9S0KpNDbIRfr/8NW
         TpNg==
X-Gm-Message-State: AOJu0YwvB4RqwaYThYhrYU24edxVUR9sIWklZnBILLR/4vMkB+2momzm
	UrIFcy352g2wQjcRfHaJEu7BNJltLgPG8EzNrrkPBo+9HUzL6OVZX45d6DvkQ1Bec4g=
X-Gm-Gg: ATEYQzyALiZTNOQNi1u3Yt5ynqYniMZ5aXABv445XahOOHA/LbLxj7N7HzmaMkBQFra
	K02Ta5CxNN3HlEB92qkzJGj1B2PRzzZVBGRl7rs72hvCQmDabDWqZ7Iu9qrbtdQwMYHrAaTVC7k
	u8jTCo0gI0H01vTskRFeCJLHHmpff3j3FHfP6TjE23zcgDeQRz15JUhxD7EePgq8m05nwrM3Fmc
	fIic/8Fpl8o6e2wApmcXj0DUjb5a3I7tzdvjzMn/BCum4KNYvvDqM4gp7CvC1IyKzomYkBdF8vi
	w6pCnFIso2EQccG4bEwOUsH96bWGZh/RBOinjb0ICOq6IitXmkeaNDovdfm/RoD8kqVZz4pn2EL
	SPCLEY72CDnBAFE5fN2QHqutrcf4iCgPobc1SwRW2/uorbnMekJ+qwP6Re9DBG69oFkBW6nl9Rt
	zp6LFnS84UyUSTMjKSEr1KCnlAlL/U4jDVDv7MoTm13sOa67kQgskV50A7jrKj19dZQXY+TfuZK
	+4+3HfVOtEo50E=
X-Received: by 2002:a05:600c:3d87:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-486fee2cfa5mr44882275e9.29.1774021035121;
        Fri, 20 Mar 2026 08:37:15 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470380asm6809410f8f.24.2026.03.20.08.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 08:37:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 16:37:14 +0100
Message-Id: <DH7PZ0CXD3QR.Z8FIHNAT3QRJ@smile.fr>
Subject: Re: [OE-core][kirkstone][PATCH 4/4] curl: Fix CVE-2026-3784
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: <vanusuri@mvista.com>, "Fabien Thomas" <fabien.thomas@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260320075604.551251-1-vanusuri@mvista.com>
 <20260320075604.551251-4-vanusuri@mvista.com>
 <DH7OJD1OK560.20DYBG2U7KWUE@smile.fr>
 <CANQUz193viLhzsv9Bw4XQ_zY8LdHFLFp+2yj5xXoTW0aAZt-fA@mail.gmail.com>
In-Reply-To: <CANQUz193viLhzsv9Bw4XQ_zY8LdHFLFp+2yj5xXoTW0aAZt-fA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 15:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233614

On Fri Mar 20, 2026 at 4:18 PM CET, Vijay Anusuri via lists.openembedded.or=
g wrote:
> Hi Fabien Thomas,
>
> Thanks for providing the feedback.
>
> On Fri, Mar 20, 2026 at 7:59=E2=80=AFPM Fabien Thomas <fabien.thomas@smil=
e.fr>
> wrote:
>
>> On Fri Mar 20, 2026 at 8:56 AM CET, Vijay Anusuri via
>> lists.openembedded.org wrote:
>> > From: Vijay Anusuri <vanusuri@mvista.com>
>> >
>> > import patch from ubuntu to fix
>> >  CVE-2026-3784
>> >
>> > Upstream-Status: Backport [import from ubuntu
>> curl_7.81.0-1ubuntu1.23.debian.tar.xz
>> > Upstream commit
>> https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3]
>> >
>> > Reference: https://curl.se/docs/CVE-2026-3784.html
>> >            https://ubuntu.com/security/CVE-2026-3784
>> >
>> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > ---
>> >  .../curl/curl/CVE-2026-3784.patch             | 74 ++++++++++++++++++=
+
>> >  meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
>> >  2 files changed, 75 insertions(+)
>> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch
>> >
>> > diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch
>> b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
>> > new file mode 100644
>> > index 0000000000..8f3d56bab9
>> > --- /dev/null
>> > +++ b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
>> > @@ -0,0 +1,74 @@
>> > +Backport of:
>> > +
>> > +From 5f13a7645e565c5c1a06f3ef86e97afb856fb364 Mon Sep 17 00:00:00 200=
1
>> > +From: Stefan Eissing <stefan@eissing.org>
>> > +Date: Fri, 6 Mar 2026 14:54:09 +0100
>> > +Subject: [PATCH] proxy-auth: additional tests
>> > +
>> > +Also eliminate the special handling for socks proxy match.
>> > +
>> > +Closes #20837
>> > +
>> > +Upstream-Status: Backport [import from ubuntu
>> curl_7.81.0-1ubuntu1.23.debian.tar.xz
>> > +Upstream commit
>> https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3]
>> > +CVE: CVE-2026-3784
>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > +---
>> > + lib/url.c                        | 28 +++++++---------------------
>> > + tests/http/test_13_proxy_auth.py | 20 ++++++++++++++++++++
>> > + tests/http/testenv/curl.py       | 18 +++++++++++++++---
>> > + 3 files changed, 42 insertions(+), 24 deletions(-)
>> > +
>> > +--- a/lib/url.c
>> > ++++ b/lib/url.c
>> > +@@ -930,33 +930,15 @@ proxy_info_matches(const struct proxy_in
>> > + {
>> > +   if((data->proxytype =3D=3D needle->proxytype) &&
>> > +      (data->port =3D=3D needle->port) &&
>> > +-     Curl_safe_strcasecompare(data->host.name, needle->host.name))
>> > +-    return TRUE;
>> > ++     curl_strequal(data->host.name, needle->host.name)) {
>> > +
>> > ++    if(Curl_timestrcmp(data->user, needle->user) ||
>> > ++       Curl_timestrcmp(data->passwd, needle->passwd))
>> > ++      return FALSE;
>> > ++    return TRUE;
>> > ++  }
>> > +   return FALSE;
>> > + }
>> > +-
>> > +-static bool
>> > +-socks_proxy_info_matches(const struct proxy_info *data,
>> > +-                         const struct proxy_info *needle)
>> > +-{
>> > +-  if(!proxy_info_matches(data, needle))
>> > +-    return FALSE;
>> > +-
>> > +-  /* the user information is case-sensitive
>> > +-     or at least it is not defined as case-insensitive
>> > +-     see https://datatracker.ietf.org/doc/html/rfc3986#section-3.2.1
>> */
>> > +-
>> > +-  /* curl_strequal does a case insentive comparison, so do not use i=
t
>> here! */
>> > +-  if(Curl_timestrcmp(data->user, needle->user) ||
>> > +-     Curl_timestrcmp(data->passwd, needle->passwd))
>> > +-    return FALSE;
>> > +-  return TRUE;
>> > +-}
>> > +-#else
>> > +-/* disabled, won't get called */
>> > +-#define proxy_info_matches(x,y) FALSE
>> > +-#define socks_proxy_info_matches(x,y) FALSE
>> > + #endif
>> > +
>> > + /* A connection has to have been idle for a shorter time than
>> 'maxage_conn'
>> > +@@ -1282,8 +1264,8 @@ ConnectionExists(struct Curl_easy *data,
>> > +         continue;
>> > +
>> > +       if(needle->bits.socksproxy &&
>> > +-        !socks_proxy_info_matches(&needle->socks_proxy,
>> > +-                                  &check->socks_proxy))
>> > ++        !proxy_info_matches(&needle->socks_proxy,
>> > ++                            &check->socks_proxy))
>> > +         continue;
>> > + #endif
>> > +       if(needle->bits.conn_to_host !=3D check->bits.conn_to_host)
>> > diff --git a/meta/recipes-support/curl/curl_7.82.0.bb
>> b/meta/recipes-support/curl/curl_7.82.0.bb
>> > index 8fdd954c7e..c33183e096 100644
>> > --- a/meta/recipes-support/curl/curl_7.82.0.bb
>> > +++ b/meta/recipes-support/curl/curl_7.82.0.bb
>> > @@ -74,6 +74,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
>> >             file://CVE-2026-1965-1.patch \
>> >             file://CVE-2026-1965-2.patch \
>> >             file://CVE-2026-3783.patch \
>> > +           file://CVE-2026-3784.patch \
>> >             "
>> >  SRC_URI[sha256sum] =3D
>> "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
>> >
>> Hi Vijay,
>>
>> This my general feedback on the whole curl patch series.
>>
>> I noticed quite big differences between the upstream commits you cited a=
nd
>> the
>> ones actually provided in this series. If these backports are from Ubunt=
u
>> or Debian, please include the direct links to those commits as well.
>>
>> --> The previous Ubuntu commit link (
> https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches?h=3Dubu=
ntu/jammy-security)
> is currently not accessible.
>
> I=E2=80=99ve referenced the tarball version instead:
> https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1u=
buntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
>
> Would it be okay if I include this download link in the patch?

How about:
> Upstream-Status: Backport [https://github.com/curl/curl/commit/5f13a7645e=
565c5c1a06f3ef86e97afb856fb364]
> Backported by Ubuntu team https://launchpad.net/ubuntu/+archive/primary/+=
sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
This way, we have traceability from upstream and we know where the patch
comes from.

But beware, Ubuntu might have earlier patches that we do not have.
I will review differences between this patch and upstream patch.
So, any needed context will be appreciated.

Thanks!

>> Additionally, your backport for CVE-2025-14524 ([PATCH 1/4]) differs
>> from the one by Amaury Couderc, which has already been merged into
>> scarthgap.
>> Maybe it would be simplier to cherry-picked it ?
>>
>
> --> Version in kirkstone is different from scarthgap. I will try to
> cherry-pick and send a V2 patch.
>
>>
>> One last detail regarding formatting: the last four patches include
>> a 'Backport of' prefix in the patch header. While not strictly forbidden=
,
>> this is unusual and adds unnecessary noise.
>> Could you please remove these headers next time?
>>
>
> --> Sure. I will remove those unusual headers.
>
>>
>> Thanks.
>>
>> Regards,
>> --
>> Fabien Thomas
>> Smile ECS
>>
>>
> Thanks & Regards,
> Vijay


--=20
Yoann Congal
Smile ECS


