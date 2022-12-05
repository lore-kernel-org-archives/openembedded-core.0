Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D5EC4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 14:34:45 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.16509.1670250882097916788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 06:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=akTlhYuT;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id r26so15995299edc.10
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 06:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lmfGNGvIxqBK1UizH+WoQ7avsBpq0qp/DtCyx0bAx8w=;
        b=akTlhYuTGg3ACk+ND6ZXuXcdLrF+X/OywGHRof7Q7W5Y9pz8wfqKH4DRLwjR7mrYyN
         +IieDs2FBxblBM+hDH5/HoEb96RdwWkQ8EZUzUlkrieDokJGNBptq1LGJE22aCpybBPW
         RhwXiBypUvNxKokAFBq7eYrA2sSMz2vYcCaK2osDU8ETmdWOBvf/S+F9S6zgwp7aGWfU
         t/HpwvwOHe8OraGJ3ttddzgrwJ39JSRpYcna6O8ORCRgoemyToEtLWZOBfvw1YVrwpSl
         Mu+h3NfQNCiH8AtjzBnNwzsA0LNGlztYiSKiSKXlSZDWTt1gppIWJhebSbTl4ttqxyCo
         WEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmfGNGvIxqBK1UizH+WoQ7avsBpq0qp/DtCyx0bAx8w=;
        b=fZSba/NtZSXCXUyysqZl6kMOMjBqLxO+5gmE7aoigKn8sQb5REavxzHggM0yjh3L/3
         W5FqlRspSA7SFrAHUsTL8FYw2KkeENA5CjKQwYHDFjc3hNBFxAVbe3i09MhDG/HeRK8J
         z3RawK1QH0CELaDpxW73WlRiLLMIRi7rjQVtXbjpAwPttB4mTi9Yl5HZk3CMdVJ/+f8Q
         mjRjVWPSQzKFGhy6p9PYZ/t6TrGlVBi7SmYNMX/kUTI9HEFspmymZRunruuiAP1gIhYd
         huIA2gbA/aM+TKhaaZD/6DYICoGhcEsZT4g1wfMZ1o5uy4KDx7Om8Q0e8yw7Nw5lFZKv
         nXgw==
X-Gm-Message-State: ANoB5pnsady31crjw9dWdjMwqwu0sxQiO+oiTmDXdRUC6VjUZIgjMvk/
	jhgTRLGxjmR8RdFz2f9tmD3Yn965M+B4E4tx+FsIrw==
X-Google-Smtp-Source: AA0mqf53mDsfQqo+rG/Ctjp6+pYfKdo78P7STHw+zuF9PexZ5m03H2T1w8toPxxTeb5Xko7XnFfqr6Fgoi3Cjb+ncs0=
X-Received: by 2002:aa7:d80d:0:b0:46b:7645:86a9 with SMTP id
 v13-20020aa7d80d000000b0046b764586a9mr25307351edq.311.1670250880228; Mon, 05
 Dec 2022 06:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20221204183927.13808-1-flowergom@gmail.com>
In-Reply-To: <20221204183927.13808-1-flowergom@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 5 Dec 2022 04:34:29 -1000
Message-ID: <CAOSpxdb_-BeaQoa_T8wnMB_gingSnHq5h26ti55ZJdG9kg5GOQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCHv2] xserver-xorg: backport fixes for
 CVE-2022-3550, CVE-2022-3551 and CVE-2022-3553
To: Minjae Kim <flowergom@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 14:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174290

On Sun, Dec 4, 2022 at 8:40 AM Minjae Kim <flowergom@gmail.com> wrote:
>
> <CVE-2022-3550>
> xkb: proof GetCountedString against request length attacks
> Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=11beef0b7f1ed290348e45618e5fa0d2bffcb72e]
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
>  .../xserver-xorg/CVE-2022-3550.patch          | 40 ++++++++++++
>  .../xserver-xorg/CVE-2022-3551.patch          | 64 +++++++++++++++++++
>  .../xserver-xorg/CVE-2022-3553.patch          | 49 ++++++++++++++
>  .../xorg-xserver/xserver-xorg_1.20.14.bb      |  3 +
>  4 files changed, 156 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
> new file mode 100644
> index 0000000000..9674b548d9
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
> @@ -0,0 +1,40 @@
> +From d2dcbdc67c96c84dff301505072b0b7b022f1a14 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Sun, 4 Dec 2022 17:40:21 +0000
> +Subject: [PATCH 1/3] xkb: proof GetCountedString against request length
> + attacks
> +
> +GetCountedString did a check for the whole string to be within the
> +request buffer but not for the initial 2 bytes that contain the length
> +field. A swapped client could send a malformed request to trigger a
> +swaps() on those bytes, writing into random memory.
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +
> +Ustream-Status: Backport
> +[https://cgit.freedesktop.org/xorg/xserver/commit/?id=11beef0b7f1ed290348e45618e5fa0d2bffcb72e]

The above line can go on the same line as Upstream-Status (same
comment for the other two patches)

> +Signed-off-by:Minjae Kim <flowergom@gmail.com>

MIssing CVE: tag

I'll fix these issues, so no need for V3, but please keep in mind for
future submissions.

Thanks for helping with CVE reduction!

Steve

> +---
> + xkb/xkb.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/xkb/xkb.c b/xkb/xkb.c
> +index 68c59df..bf8aaa3 100644
> +--- a/xkb/xkb.c
> ++++ b/xkb/xkb.c
> +@@ -5138,6 +5138,11 @@ _GetCountedString(char **wire_inout, ClientPtr client, char **str)
> +     CARD16 len;
> +
> +     wire = *wire_inout;
> ++
> ++    if (client->req_len <
> ++        bytes_to_int32(wire + 2 - (char *) client->requestBuffer))
> ++      return BadValue;
> ++
> +     len = *(CARD16 *) wire;
> +     if (client->swapped) {
> +         swaps(&len);
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
> new file mode 100644
> index 0000000000..c1313b5ad6
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
> @@ -0,0 +1,64 @@
> +From d3787290f56165f5656ddd2123dbf676a32d0a68 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Sun, 4 Dec 2022 17:44:00 +0000
> +Subject: [PATCH 2/3] xkb: fix some possible memleaks in XkbGetKbdByName
> +
> +GetComponentByName returns an allocated string, so let's free that if we
> +fail somewhere.
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +
> +Upstream-Status: Backport
> +[https://cgit.freedesktop.org/xorg/xserver/commit/?id=18f91b950e22c2a342a4fbc55e9ddf7534a707d2]
> +
> +Signed-off-by:Minjae Kim <flowergom@gmail.com>
> +---
> + xkb/xkb.c | 26 +++++++++++++++++++-------
> + 1 file changed, 19 insertions(+), 7 deletions(-)
> +
> +diff --git a/xkb/xkb.c b/xkb/xkb.c
> +index bf8aaa3..f79d306 100644
> +--- a/xkb/xkb.c
> ++++ b/xkb/xkb.c
> +@@ -5908,19 +5908,31 @@ ProcXkbGetKbdByName(ClientPtr client)
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
> ++    }
> +     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
> +     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
> +
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
> new file mode 100644
> index 0000000000..d06dc2cf79
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
> @@ -0,0 +1,49 @@
> +From 57ad2c03730d56f8432b6d66b29c0e5a9f9b1ec2 Mon Sep 17 00:00:00 2001
> +From: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
> +Date: Sun, 4 Dec 2022 17:46:18 +0000
> +Subject: [PATCH 3/3] xquartz: Fix a possible crash when editing the
> + Application menu due to mutaing immutable arrays
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
> +
> +Upstream-Status: Backport
> +[https://cgit.freedesktop.org/xorg/xserver/commit/?id=dfd057996b26420309c324ec844a5ba6dd07eda3]
> +
> +Signed-off-by:Minjae Kim <flowergom@gmail.com>
> +---
> + hw/xquartz/X11Controller.m | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/hw/xquartz/X11Controller.m b/hw/xquartz/X11Controller.m
> +index 3efda50..9870ff2 100644
> +--- a/hw/xquartz/X11Controller.m
> ++++ b/hw/xquartz/X11Controller.m
> +@@ -467,8 +467,12 @@ extern char *bundle_id_prefix;
> +     self.table_apps = table_apps;
> +
> +     NSArray * const apps = self.apps;
> +-    if (apps != nil)
> +-        [table_apps addObjectsFromArray:apps];
> ++
> ++    if (apps != nil) {
> ++        for (NSArray <NSString *> * row in apps) {
> ++            [table_apps addObject:row.mutableCopy];
> ++        }
> ++    }
> +
> +     columns = [apps_table tableColumns];
> +     [[columns objectAtIndex:0] setIdentifier:@"0"];
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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174255): https://lists.openembedded.org/g/openembedded-core/message/174255
> Mute This Topic: https://lists.openembedded.org/mt/95452383/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

