Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF15C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 17:59:29 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.53136.1669399166540094454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 09:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Lt2qpyOH;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id ho10so11924578ejc.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 09:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=os6AgfDWVzLMehNnqnGYmW78KJtseYpRV0gj80BoSAE=;
        b=Lt2qpyOH4UdGva0MwNTQF3ZRiGOY3U0qJ3YHYGSeySEyPporNXG0Xr95GIHLBf1EKs
         TCKqpqoNBu/anyPpunFMxiGssfS3cIXI/kGJg3J9QBrZ5fFnfqJKqAKa4NXxBk68sitq
         vPnoqOfxmPOYyQ137Ks+xn2ZNjv7lVhG/ewZsr0YKUOm/FLIadjO+mQ/XrMrwpaj2JfE
         UJCwre8Djgt/7bp75szkoZADTXQlSkylELQl4XUVnhYlcmJ32zdTj5VtvGTt6Emc7GSL
         Rmkaee9ococafT1Wp8UFyLHgcu8XljZ/zqpkJ3Rq0K9RJsc5TTa1Ts398ORJcd25f066
         sPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=os6AgfDWVzLMehNnqnGYmW78KJtseYpRV0gj80BoSAE=;
        b=q7u4ALghpDQIkysX5HJcXmbbXRaqfxqDF1XxbQU4T3tO00kkaLabtzjZfh9k7alDUV
         04LJWilYkks+D/CHEJ21l+19T0ze7RmHP+1m29YLnWrInfTDE3024+ygJVxJJBHZriRb
         BNcEcm2q5NWVUqDF3d5oSde5eWyudWqH79Iiwf2OlBC2DxPEyU7sljowh20JDQlF+lbb
         ik8ChJKwSSV8UenOfdLdSnIoAkFkSqoCS/M0CMP1uJxWNyO85RNMXLMxpPjvtb9IR0Uk
         /Hka//2CJDEahuxayS702X3rdMSDTtWOBLdsHxCEckFiApg2i89r+MxbIK7YG49AKc75
         YYDw==
X-Gm-Message-State: ANoB5pmiyizwgfJ0EPfxOYJj119Y/kH7qfCcCvNl8j8Rta6iUEgtkczq
	ka61kj1vt5hzdAPkAyzUOtg/SPk4COui97iauf9UdQ==
X-Google-Smtp-Source: AA0mqf4BYy2TtspplOjcGFq6t6qzKmkttuOssIqPx2gwdVULXfUdqClxgK0X7b95376ggAkYg2hXlv6kq+2kck+8ViI=
X-Received: by 2002:a17:906:c24d:b0:7ac:2e16:a8d2 with SMTP id
 bl13-20020a170906c24d00b007ac2e16a8d2mr23027537ejb.584.1669399164395; Fri, 25
 Nov 2022 09:59:24 -0800 (PST)
MIME-Version: 1.0
References: <20221125164436.923171-1-soumya.sambu@windriver.com>
In-Reply-To: <20221125164436.923171-1-soumya.sambu@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 25 Nov 2022 07:59:12 -1000
Message-ID: <CAOSpxdaeuZunEoHBY4+6Eq4ij_jX7y7DzODguLtftSxA7EDx0Q@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] xserver-xorg: fix CVE-2022-3550, CVE-2022-3551
To: Soumya <soumya.sambu@windriver.com>
Cc: openembedded-core@lists.openembedded.org, hari.gpillai@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 17:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173781

On Fri, Nov 25, 2022 at 6:44 AM Soumya <soumya.sambu@windriver.com> wrote:
>
> A vulnerability classified as critical was found in X.org Server. Affected
> by this vulnerability is the function _GetCountedString of the file
> xkb/xkb.c. The manipulation leads to buffer overflow. It is recommended to
> apply a patch to fix this issue. The associated identifier of this
> vulnerability is VDB-211051.
>
> A vulnerability, which was classified as problematic, has been found in
> X.org Server. Affected by this issue is the function ProcXkbGetKbdByName
> of the file xkb/xkb.c. The manipulation leads to memory leak. It is
> recommended to apply a patch to fix this issue. The identifier of this
> vulnerability is VDB-211052.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-3550
> https://nvd.nist.gov/vuln/detail/CVE-2022-3551
>
> Upstream patches:
> https://gitlab.freedesktop.org/xorg/xserver/commit/11beef0b7f1ed290348e45618e5fa0d2bffcb72e
> https://gitlab.freedesktop.org/xorg/xserver/commit/18f91b950e22c2a342a4fbc55e9ddf7534a707d2
>
> Signed-off-by: Soumya <soumya.sambu@windriver.com>
> ---
>  ...possible-memleaks-in-XkbGetKbdByName.patch | 63 +++++++++++++++++++
>  ...ntedString-against-request-length-at.patch | 38 +++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch

You forgot to add the patches to the recipe!

Steve

>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
> new file mode 100644
> index 0000000000..0e61ec5953
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
> @@ -0,0 +1,63 @@
> +CVE: CVE-2022-3551
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 18f91b950e22c2a342a4fbc55e9ddf7534a707d2 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Wed, 13 Jul 2022 11:23:09 +1000
> +Subject: [PATCH] xkb: fix some possible memleaks in XkbGetKbdByName
> +
> +GetComponentByName returns an allocated string, so let's free that if we
> +fail somewhere.
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +---
> + xkb/xkb.c | 26 ++++++++++++++++++++------
> + 1 file changed, 20 insertions(+), 6 deletions(-)
> +
> +diff --git a/xkb/xkb.c b/xkb/xkb.c
> +index 4692895db..b79a269e3 100644
> +--- a/xkb/xkb.c
> ++++ b/xkb/xkb.c
> +@@ -5935,18 +5935,32 @@ ProcXkbGetKbdByName(ClientPtr client)
> +     xkb = dev->key->xkbInfo->desc;
> +     status = Success;
> +     str = (unsigned char *) &stuff[1];
> +-    if (GetComponentSpec(&str, TRUE, &status))  /* keymap, unsupported */
> +-        return BadMatch;
> ++    {
> ++        char *keymap = GetComponentSpec(&str, TRUE, &status);  /* keymap, unsupported */
> ++        if (keymap) {
> ++            free(keymap);
> ++            return BadMatch;
> ++        }
> ++    }
> +     names.keycodes = GetComponentSpec(&str, TRUE, &status);
> +     names.types = GetComponentSpec(&str, TRUE, &status);
> +     names.compat = GetComponentSpec(&str, TRUE, &status);
> +     names.symbols = GetComponentSpec(&str, TRUE, &status);
> +     names.geometry = GetComponentSpec(&str, TRUE, &status);
> +-    if (status != Success)
> ++    if (status == Success) {
> ++        len = str - ((unsigned char *) stuff);
> ++        if ((XkbPaddedSize(len) / 4) != stuff->length)
> ++            status = BadLength;
> ++    }
> ++
> ++    if (status != Success) {
> ++        free(names.keycodes);
> ++        free(names.types);
> ++        free(names.compat);
> ++        free(names.symbols);
> ++        free(names.geometry);
> +         return status;
> +-    len = str - ((unsigned char *) stuff);
> +-    if ((XkbPaddedSize(len) / 4) != stuff->length)
> +-        return BadLength;
> ++    }
> +
> +     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
> +     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
> new file mode 100644
> index 0000000000..6f862e82f9
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
> @@ -0,0 +1,38 @@
> +CVE: CVE-2022-3550
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 11beef0b7f1ed290348e45618e5fa0d2bffcb72e Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Tue, 5 Jul 2022 12:06:20 +1000
> +Subject: [PATCH] xkb: proof GetCountedString against request length attacks
> +
> +GetCountedString did a check for the whole string to be within the
> +request buffer but not for the initial 2 bytes that contain the length
> +field. A swapped client could send a malformed request to trigger a
> +swaps() on those bytes, writing into random memory.
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +---
> + xkb/xkb.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/xkb/xkb.c b/xkb/xkb.c
> +index f42f59ef3..1841cff26 100644
> +--- a/xkb/xkb.c
> ++++ b/xkb/xkb.c
> +@@ -5137,6 +5137,11 @@ _GetCountedString(char **wire_inout, ClientPtr client, char **str)
> +     CARD16 len;
> +
> +     wire = *wire_inout;
> ++
> ++    if (client->req_len <
> ++        bytes_to_int32(wire + 2 - (char *) client->requestBuffer))
> ++        return BadValue;
> ++
> +     len = *(CARD16 *) wire;
> +     if (client->swapped) {
> +         swaps(&len);
> +--
> +2.34.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173777): https://lists.openembedded.org/g/openembedded-core/message/173777
> Mute This Topic: https://lists.openembedded.org/mt/95257196/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

