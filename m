Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD61C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 14:16:32 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web12.11398.1648131390854029184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 07:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RtCWVbLN;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: sakoman@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id p22so5516901iod.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=md+DwbMcx6I5MHpzdNTULfbbyDLbcB8qrvKNMPL7EzI=;
        b=RtCWVbLNSYVtrrE/kfDblgwoooeIrkZAVKzZfHT30IRS7u+gkXMQAcBKBeu8KIgv1V
         PdGXyFo9HuImVQDkrtkvmyNnJwPTPdnC+0dOBVRFM2RvQurJ8IpK7AX1etSj9TH6o58Q
         8Ep5GDPX78adzPzGQD9GgW9c+07iIACsgPzmkYgEKZNRN7hUiLl8JyGSPt8Z+oI98s1F
         JAOtQPBu0jskoSuCfq8IiNor0g1P6fdkfIlzNZUhLEvAOJqFEXBqIST4i+rDsAbQm0WD
         x9uq2+lX1nOOAtMugMcyfkaFSxK1e21mBzrcsYPYQrxC4FLJ/l2n2MF/Tu75fb9zJaxB
         J+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=md+DwbMcx6I5MHpzdNTULfbbyDLbcB8qrvKNMPL7EzI=;
        b=YhhAdumF8wmqgJDQi1vttjoWuCHC6bCLsQz3hV9zsQMRJte9O1119ffU24e4Mwu14G
         PfbZfbfKEA6/q5XDjRoDD6dV0ITYB88FnhX7Bd5h3TCeibJfkGO8PjLdFzqxIqbyaEzB
         eaEKYiTLYgei+wZhIUJ1XIpq9or2yOdUGKujhd1Sjszt3F8ENy7IbrZfFkDi4CGyjYff
         Lkd/s90RthNBfeL2IhlUMrWY3JlXRgpzdNqiWzjWTHAJ2w/Dv2aZ/GLxKQO10Y5PN4Ba
         IasYZhY1mZ37+WAAqQNHQ4ESMnLq7EfHG4ZwA6IxmuLYHmboz/i8gkguj9RmbIQ9b0In
         zhtQ==
X-Gm-Message-State: AOAM530N8H60qmCvAsyc3VhKk28Wp+cYfK0eSP9ARPKD0TAhy9URWs2d
	vaEJTIvbIC3oXJx45B7GCwFhQw1/uOMK/oOmzdUOPn9l
X-Google-Smtp-Source: 
 ABdhPJzD5UHqygT6P0dOA5Whj9+7MYq1fykuJEs2bR74QDTHWGVTXaIWSguYCl4QmuMbU3YV/8cNs4lgDioXLfbRtnI=
X-Received: by 2002:a05:6638:35a2:b0:319:fd4b:8e10 with SMTP id
 v34-20020a05663835a200b00319fd4b8e10mr2965543jal.54.1648131390092; Thu, 24
 Mar 2022 07:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220324113125.52167-1-davide.gardenal@huawei.com>
In-Reply-To: <20220324113125.52167-1-davide.gardenal@huawei.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Thu, 24 Mar 2022 04:16:19 -1000
Message-ID: 
 <CAGDS+nnSxo0QEwPRta_mZgvw9QNrz+32bUXFVpK-XpsqcwUWKg@mail.gmail.com>
Subject: Re: [oe-core][dunfell][PATCH v2] qemu: backport patch fix for
 CVE-2020-13791
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 14:16:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163613

On Thu, Mar 24, 2022 at 1:32 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> Upstream patch:
> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00979.html
>
> CVE: CVE-2020-13791
>
> Update v2: rebase with patch for CVE-2020-13253 and
> add Upstream-Status in patch description

Thanks for sending v2

In the future if you put the above version change note after the three
dashes below it will make life just a little bit easier for me.

When it is prior to the dashes I have to hand edit the patch to remove
the version notes, otherwise they will end up in the commit message.

No big deal either way, I appreciate the help with CVEs!

>
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---

i.e. put version notes here!

>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/CVE-2020-13791.patch            | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 0bdc917783..25c2cdef3a 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -97,6 +97,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://CVE-2020-13253_3.patch \
>             file://CVE-2020-13253_4.patch \
>             file://CVE-2020-13253_5.patch \
> +           file://CVE-2020-13791.patch \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
> new file mode 100644
> index 0000000000..1e8278f7b7
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
> @@ -0,0 +1,44 @@
> +Date:  Thu, 4 Jun 2020 16:25:24 +0530
> +From: Prasad J Pandit <pjp@fedoraproject.org>
> +Subject:       [PATCH v3] ati-vga: check address before reading configuration bytes (CVE-2020-13791)
> +
> +While reading PCI configuration bytes, a guest may send an
> +address towards the end of the configuration space. It may lead
> +to an OOB access issue. Add check to ensure 'address + size' is
> +within PCI configuration space.
> +
> +CVE: CVE-2020-13791
> +
> +Upstream-Status: Submitted
> +https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00979.html
> +
> +Reported-by: Ren Ding <rding@gatech.edu>
> +Reported-by: Hanqing Zhao <hanqing@gatech.edu>
> +Reported-by: Yi Ren <c4tren@gmail.com>
> +Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> +---
> + hw/display/ati.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +Update v3: avoid modifying 'addr' variable
> +  -> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00834.html
> +
> +diff --git a/hw/display/ati.c b/hw/display/ati.c
> +index 67604e68de..b4d0fd88b7 100644
> +--- a/hw/display/ati.c
> ++++ b/hw/display/ati.c
> +@@ -387,7 +387,9 @@ static uint64_t ati_mm_read(void *opaque, hwaddr addr, unsigned int size)
> +         val = s->regs.crtc_pitch;
> +         break;
> +     case 0xf00 ... 0xfff:
> +-        val = pci_default_read_config(&s->dev, addr - 0xf00, size);
> ++        if ((addr - 0xf00) + size <= pci_config_size(&s->dev)) {
> ++            val = pci_default_read_config(&s->dev, addr - 0xf00, size);
> ++        }
> +         break;
> +     case CUR_OFFSET:
> +         val = s->regs.cur_offset;
> +--
> +2.26.2
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163605): https://lists.openembedded.org/g/openembedded-core/message/163605
> Mute This Topic: https://lists.openembedded.org/mt/89996991/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

