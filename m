Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D60C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 20:25:39 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.2184.1648758338985388329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 13:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QC7xbq6o;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id b189so487559qkf.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=he5aN6T5pjJ259p/AQOs02QPyYnniMwwTVY/MQkfqFs=;
        b=QC7xbq6oXc7wO3jBOuaaB4L6D3SuCT8f57Pt9wmxFcRvRAX8XT4X5+VKbYh4OTvyWb
         MQIOvRoYxOuWE4LwECHOpSjO7nevXUyJNVc+0Cc2ay24lecryZnREP/b2kSs+K3Nj6pX
         EcLXPgYy3lglFU+dXOcRo9rYW0kmyyG88OM2u/LBISPVltpzh11yoie2k+LehH5oWEJw
         1AUhnWsOjEs7nFGXgIQncNaLs1ZNtUBX02+WNgmR7BFlNUJAN6uhk6XFhDokqoOZrldK
         6GBuscSNxNpIRrr9YQLFvp1/7JnGzOlI66dO/EO0Z03MquReyUXxW7t9y90bjwWmhWD3
         tT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=he5aN6T5pjJ259p/AQOs02QPyYnniMwwTVY/MQkfqFs=;
        b=eC6iZ5s1uUoOzIpahRVaZtIRILWCJSznpOXlP4hGLQpZC9npw00LZg9ZrhMA6K4NC8
         ELk9pja2Rj+KtU6V5Ym4vHsKINcDhL5Wgaj3tpzJZtYME2hnVqiKxXwihLthwyijSgMm
         td8GHEMx009oWHwFRTlypFwmT016Dd36KAjHwIHVuDobZCOMCfyLOzqykfnKpq76JLJi
         YlidEvjRLuNJRYK/qVDTQIfW+eGXBJGCU7LUeYUCf1s8E9KFI7KLvgwtYOVqzbShEmhG
         2yeAExOlAz/QCRhNgVHrOUSirkMSWkUxPlmILX+anIkWyrsTSfHcCt2TpKpUiIRnwAVY
         +/og==
X-Gm-Message-State: AOAM5318/dmaYOUq87tqGgxnpqG4wM1pZowOZ7AiwleUWHpXdzEe440B
	MXxxDFE7zos70nV5RnJtB5eqqXGQcexiBm5eYrY=
X-Google-Smtp-Source: 
 ABdhPJxElzs4yFqbW2uJC/b+PnnahLDIyH+rvWyCaiD1YQR1KndPtPIs2jwPQJFnqOGlJFkZuv2Y0pDd56eg2T5nFDQ=
X-Received: by 2002:a05:620a:2993:b0:67d:7116:a642 with SMTP id
 r19-20020a05620a299300b0067d7116a642mr4632378qkp.180.1648758338020; Thu, 31
 Mar 2022 13:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220331193819.1623580-1-ralph.siemsen@linaro.org>
In-Reply-To: <20220331193819.1623580-1-ralph.siemsen@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2022 13:25:11 -0700
Message-ID: 
 <CAMKF1sr7htUph5S7Fx=W69kjOfHbdcsOtHCC0cChyR3sodtCxA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] bluez5: fix CVE-2022-0204
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 20:25:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163868

On Thu, Mar 31, 2022 at 12:38 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> Fix heap overflow when appending prepare writes
>
> The code shall check if the prepare writes would append more the
> allowed maximum attribute length.
>
> Upstream-Status: Backport [https://github.com/bluez/bluez/commit/591c546c536b42bef696d027f64aa22434f8c3f0]
> CVE: CVE-2022-0204
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
> Status on other branches:
> - master/kirkstone 5.64 includes the fix
> - honister         5.61 needs patch
> - hardknott        5.56 needs patch
>
> meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
> .../bluez5/bluez5/CVE-2022-0204.patch         | 66 +++++++++++++++++++
> 2 files changed, 67 insertions(+)
> create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 7cf061dcf6..4d4348898a 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -55,6 +55,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>     file://CVE-2021-0129.patch \
>     file://CVE-2021-3588.patch \
>    file://CVE-2021-3658.patch \
> +           file://CVE-2022-0204.patch \

seems to have tabs vs spaces problem.

>     "
> S = "${WORKDIR}/bluez-${PV}"
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch
> new file mode 100644
> index 0000000000..646b5ddfc8
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch
> @@ -0,0 +1,66 @@
> +From 0d328fdf6564b67fc2ec3533e3da201ebabcc9e3 Mon Sep 17 00:00:00 2001
> +From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> +Date: Tue, 8 Jun 2021 16:46:49 -0700
> +Subject: [PATCH] shared/gatt-server: Fix heap overflow when appending prepare
> + writes
> +
> +The code shall check if the prepare writes would append more the
> +allowed maximum attribute length.
> +
> +Fixes https://github.com/bluez/bluez/security/advisories/GHSA-479m-xcq5-9g2q
> +
> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/591c546c536b42bef696d027f64aa22434f8c3f0]
> +Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> +CVE: CVE-2022-0204
> +
> +---
> + src/shared/gatt-server.c | 22 ++++++++++++++++++++++
> + 1 file changed, 22 insertions(+)
> +
> +diff --git a/src/shared/gatt-server.c b/src/shared/gatt-server.c
> +index 0c25a97..20e14bc 100644
> +--- a/src/shared/gatt-server.c
> ++++ b/src/shared/gatt-server.c
> +@@ -816,6 +816,20 @@ static uint8_t authorize_req(struct bt_gatt_server *server,
> +                                               server->authorize_data);
> + }
> +
> ++static uint8_t check_length(uint16_t length, uint16_t offset)
> ++{
> ++      if (length > BT_ATT_MAX_VALUE_LEN)
> ++              return BT_ATT_ERROR_INVALID_ATTRIBUTE_VALUE_LEN;
> ++
> ++      if (offset > BT_ATT_MAX_VALUE_LEN)
> ++              return BT_ATT_ERROR_INVALID_OFFSET;
> ++
> ++      if (length + offset > BT_ATT_MAX_VALUE_LEN)
> ++              return BT_ATT_ERROR_INVALID_ATTRIBUTE_VALUE_LEN;
> ++
> ++      return 0;
> ++}
> ++
> + static void write_cb(struct bt_att_chan *chan, uint8_t opcode, const void *pdu,
> +                                       uint16_t length, void *user_data)
> + {
> +@@ -846,6 +860,10 @@ static void write_cb(struct bt_att_chan *chan, uint8_t opcode, const void *pdu,
> +                               (opcode == BT_ATT_OP_WRITE_REQ) ? "Req" : "Cmd",
> +                               handle);
> +
> ++      ecode = check_length(length, 0);
> ++      if (ecode)
> ++              goto error;
> ++
> +       ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE_MASK);
> +       if (ecode)
> +               goto error;
> +@@ -1353,6 +1371,10 @@ static void prep_write_cb(struct bt_att_chan *chan, uint8_t opcode,
> +       util_debug(server->debug_callback, server->debug_data,
> +                               "Prep Write Req - handle: 0x%04x", handle);
> +
> ++      ecode = check_length(length, offset);
> ++      if (ecode)
> ++              goto error;
> ++
> +       ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE_MASK);
> +       if (ecode)
> +               goto error;
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163867): https://lists.openembedded.org/g/openembedded-core/message/163867
> Mute This Topic: https://lists.openembedded.org/mt/90162847/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

