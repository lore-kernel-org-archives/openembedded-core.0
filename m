Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDBCFA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 21:52:20 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.1889.1667253132012312590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 14:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qqeRpn1M;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.46, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f46.google.com with SMTP id u24so10130517edd.13
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 14:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t7/9YgbijyTyXE1438jW6shHo1rTD3PyjG8JPuWQ1Lk=;
        b=qqeRpn1M3pQd4xzIdX82RbHx239IlzyBtK+ZEaCG1ZljY6ddR//WAm85t9KafTUm8r
         Q0ysdqLR5fJtjjmEVubh5/V5QYmTIFBPHkHdxLgN21Kah2/Nx/5falIFCjk6M2LAoQc0
         7dGsSUw3eYFMiiLAmXJyAg7C1ijOpFjjzLAnzEjAU5LxHok618Pw2cYkU1XjUOO/W1r8
         IraB92iJUGX9F3FKKoY+HqJaQKDLe6zroB9NooKh+KhBNVsVoYtDYPc8yVUeOyxkWa4/
         QrR7ZTUg1d2oIfQcu1pwekbEF5SqkKrmx4PCB4yM3i4u9lCbw0RI/YTxOI9uQw31si+k
         cZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7/9YgbijyTyXE1438jW6shHo1rTD3PyjG8JPuWQ1Lk=;
        b=JobHFkY9vMn+gV81OUNnLOsGXIaAZj++jbS6v3pRYBHD/1RyuwQgbLoj0wLZxyDcl6
         NJM6z8C7DtvDlfbkNpQ15ZdQHiouikT2Hu2FhzMeW2R+/lMTezrNHy+Gj3Iy5HUMKjSr
         0NZrBcv/L47ib4FQVh3Btp4amezonmw81khmMognsmLVEnEzaGVDRKf+8Jk2g/l+ofSn
         bggOotqURsbFGp8ayquTZ64eNoE6zLEXFF8WL3znvukrXUq+drQ+GwQP6jgXdehatTuY
         02fo4oap03+NAAZMfBLJVz9cxoBrQgznZY+29tZ9NOin3da4jroxDYQitbJc/PKAZHmP
         dLBg==
X-Gm-Message-State: ACrzQf0m2d6P/jEcTK/LSYKrNE5krCAjQZbL/YrK5/w/VGAJTpEd9yWU
	FLI4RvySyAxPkPliDAtgdM+3q7kRdC5p8jZA13CIJA==
X-Google-Smtp-Source: AMsMyM7e7QbtF0j6zmOp9YIbWuyUPc2dyW61oAPOYeS9677W5RL7OpdZNoBe7LajzCBppZVBr2KjfRmfJyukDyXpL4o=
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id
 y5-20020a50eb05000000b00457c6f55f65mr15478887edp.311.1667253130000; Mon, 31
 Oct 2022 14:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221030133847.1756435-1-flowergom@gmail.com>
In-Reply-To: <20221030133847.1756435-1-flowergom@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 31 Oct 2022 11:51:59 -1000
Message-ID: <CAOSpxdZ3+HhkZ3rJ6hM8zjPNcqPkund3xSvzC-Tr+xOpL+ZQSg@mail.gmail.com>
Subject: Re: [dunfell][PATCH] xserver-xorg: backport fixes for CVE-2022-3550,
 CVE-2022-3551 and CVE-2022-3553
To: Minjae Kim <flowergom@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 21:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172341

On Sun, Oct 30, 2022 at 3:39 AM Minjae Kim <flowergom@gmail.com> wrote:
>
> From: Steve Sakoman <steve@sakoman.com>

This seems to be in error since I didn't author this patch ;-)
>
> <CVE-2022-3550>
> xkb: proof GetCountedString against request length attacks
> pstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=11beef0b7f1ed290348e45618e5fa0d2bffcb72e]
>
> <CVE-2022-3551>
> xkb: fix some possible memleaks in XkbGetKbdByName
> Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=18f91b950e22c2a342a4fbc55e9ddf7534a707d2]
>
> <CVE-2022-3553>
> xquartz: Fix a possible crash when editing the Application
> menu due to mutaing immutable arrays
> Upstream-Status: Backport[https://cgit.freedesktop.org/xorg/xserver/commit/?id=dfd057996b26420309c324ec844a5ba6dd07eda3]
>
> Signed-off-by:Minjae Kim <flowergom@gmail.com>
> ---
>  .../xserver-xorg/CVE-2022-3550.patch          | 34 +++++++++++
>  .../xserver-xorg/CVE-2022-3551.patch          | 60 +++++++++++++++++++
>  .../xserver-xorg/CVE-2022-3553.patch          | 44 ++++++++++++++

All three of the patches are missing the CVE: and UpstreamStatus: tags
as well as your Signed-off-by:

Please submit a V2 with these issues fixed.

Many thanks for your help with CVEs!

Steve

>  .../xorg-xserver/xserver-xorg_1.20.14.bb      |  3 +
>  4 files changed, 141 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
> new file mode 100644
> index 0000000000..c1241f6ac5
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
> @@ -0,0 +1,34 @@
> +From 27963f7eb6d986f20c88daa40af39834ee9cf9ec Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Sun, 30 Oct 2022 13:02:46 +0000
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
> +index 68c59df..c9726bc 100644
> +--- a/xkb/xkb.c
> ++++ b/xkb/xkb.c
> +@@ -5138,6 +5138,11 @@ _GetCountedString(char **wire_inout, ClientPtr client, char **str)
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
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
> new file mode 100644
> index 0000000000..365b11ea1c
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
> @@ -0,0 +1,60 @@
> +From a13cd058d30f30537f7e68b934238fab20f6d55a Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Sun, 30 Oct 2022 13:09:00 +0000
> +Subject: [PATCH] xkb: fix some possible memleaks in XkbGetKbdByName
> +
> +GetComponentByName returns an allocated string, so let's free that if we
> +fail somewhere.
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +---
> + xkb/xkb.c | 27 ++++++++++++++++++++-------
> + 1 file changed, 20 insertions(+), 7 deletions(-)
> +
> +diff --git a/xkb/xkb.c b/xkb/xkb.c
> +index c9726bc..072c138 100644
> +--- a/xkb/xkb.c
> ++++ b/xkb/xkb.c
> +@@ -5908,19 +5908,32 @@ ProcXkbGetKbdByName(ClientPtr client)
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
> +-        return status;
> +-    len = str - ((unsigned char *) stuff);
> +-    if ((XkbPaddedSize(len) / 4) != stuff->length)
> +-        return BadLength;
> ++    if (status == Success) {
> ++        len = str - ((unsigned char *) stuff);
> ++        if ((XkbPaddedSize(len) / 4) != stuff->length)
> ++            status = BadLength;
> ++    }
> +
> ++    if (status != Success) {
> ++        free(names.keycodes);
> ++        free(names.types);
> ++        free(names.compat);
> ++        free(names.symbols);
> ++        free(names.geometry);
> ++         return status;
> ++    }
> +     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
> +     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
> +
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
> new file mode 100644
> index 0000000000..3026225129
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
> @@ -0,0 +1,44 @@
> +From d3de2d4ea02c5898ea7af93a68933bb1059b4f0d Mon Sep 17 00:00:00 2001
> +From: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
> +Date: Sun, 30 Oct 2022 13:13:41 +0000
> +Subject: [PATCH] xquartz: Fix a possible crash when editing the Application
> + menu due to mutaing immutable arrays
> +
> +Crashing on exception: -[__NSCFArray replaceObjectAtIndex:withObject:]: mutating method sent to immutable object
> +
> +Application Specific Backtrace 0:
> +0   CoreFoundation                      0x00007ff80d2c5e9b __exceptionPreprocess + 242
> +1   libobjc.A.dylib                     0x00007ff80d027e48 objc_exception_throw + 48
> +2   CoreFoundation                      0x00007ff80d38167b _CFThrowFormattedException + 194
> +3   CoreFoundation                      0x00007ff80d382a25 -[__NSCFArray removeObjectAtIndex:].cold.1 + 0
> +4   CoreFoundation                      0x00007ff80d2e6c0b -[__NSCFArray replaceObjectAtIndex:withObject:] + 119
> +5   X11.bin                             0x00000001003180f9 -[X11Controller tableView:setObjectValue:forTableColumn:row:] + 169
> +
> +Fixes: https://github.com/XQuartz/XQuartz/issues/267
> +Signed-off-by: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
> +---
> + hw/xquartz/X11Controller.m | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/hw/xquartz/X11Controller.m b/hw/xquartz/X11Controller.m
> +index 3efda50..4e9a5c9 100644
> +--- a/hw/xquartz/X11Controller.m
> ++++ b/hw/xquartz/X11Controller.m
> +@@ -467,9 +467,11 @@ extern char *bundle_id_prefix;
> +     self.table_apps = table_apps;
> +
> +     NSArray * const apps = self.apps;
> +-    if (apps != nil)
> +-        [table_apps addObjectsFromArray:apps];
> +-
> ++    if (apps != nil) {
> ++        for (NSArray <NSString *> * row in apps) {
> ++            [table_apps addObject:row.mutableCopy];
> ++        }
> ++    }
> +     columns = [apps_table tableColumns];
> +     [[columns objectAtIndex:0] setIdentifier:@"0"];
> +     [[columns objectAtIndex:1] setIdentifier:@"1"];
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
> index d176f390a4..4f5528f78b 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
> @@ -5,6 +5,9 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
>             file://0001-test-xtest-Initialize-array-with-braces.patch \
>             file://sdksyms-no-build-path.patch \
>             file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
> +           file://CVE-2022-3550.patch \
> +           file://CVE-2022-3551.patch \
> +           file://CVE-2022-3553.patch \
>             "
>  SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
>  SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
> --
> 2.17.1
>

