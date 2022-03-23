Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E21C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 17:17:33 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.501.1648055852101388670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 10:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Rc0qci/G;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id r22so4180666ejs.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CYM02v0AfV3E9r2w6m7oh21X/HksGi4gJTT17lrU1lc=;
        b=Rc0qci/Gws3vOGLsSziigIfNjvo8qHCXweLIXmU7Ln9JJ3MOaiUGHEcLZ2rcV0e8r0
         sZNQPfSGhWXGoHSWE720FXJWsaBvYxdw76FW3TAaJUolSxenORGkcl2stMz3e3PsAhTn
         dVpHe8SaaMn12cmenMJlFsMEvt30jBmCs+3U0xerglKNOBUxJ3+FBj+wBO1Qw9CebyJ8
         w0tdZcSZYDCJJrSRSFPxMO0zSH0xKpLeaop5rZuOmd/pcPsCuyEy8O0ffoUD/GBiQpqp
         xtVDXV8OUv+SQa/9murY2KrB+R61cbqzxIq7ol7mPzo3MWuMjZaFxUdHkNJgMBswkMYO
         qgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CYM02v0AfV3E9r2w6m7oh21X/HksGi4gJTT17lrU1lc=;
        b=uHGC+UusTHtrYOkrQXCLpDQhMSnLv6+bA+XIfsdur8mADTpq6m97WZbLxz5MS6RSgc
         WTVdBBVypNaBNoBvd5muuF8AbXhl3vqgFPnwd3V0Wf7y3+/6YjSgn9UjUQ5eGsWzA8YP
         zzeMaoWvjAXML6NSIHhCQjxAOk1wKk8LWeIH7UwM2MFbEMWX+LhtzbR0sZd/sgKbefMJ
         keA43HgC349F4Jd5qOgjY8+49JQ1qXhJ8B0VTe4PqpFONidNMBTI0kytCPsVgEPBl0Gi
         q/qWj8S32sVQ/eNDfg64tqPNUxu9OqA6SRoqTMKxy+r/uAKzF7g4Eqrwt0bTFbY2oGPY
         9kXw==
X-Gm-Message-State: AOAM530LTG95G0nRpeJ5pN7+/xG1kT6mMtwQRLAs1JMQvbrO8beLLUVA
	bFkCadIYAVaXkjLQ906+Hby79m7r3Szdgd2sF6ssSw==
X-Google-Smtp-Source: 
 ABdhPJyI2JcNLX11TOLjvmlrBl6STkY8emOh8JtMyaxgblgVxEfaI2nc2OCNuqDrq/C5NQtjFGjTcSr3Lpo45aqjd9c=
X-Received: by 2002:a17:907:70cc:b0:6e0:1646:9123 with SMTP id
 yk12-20020a17090770cc00b006e016469123mr1121954ejb.329.1648055850281; Wed, 23
 Mar 2022 10:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220323170219.710199-1-davide.gardenal@huawei.com>
In-Reply-To: <20220323170219.710199-1-davide.gardenal@huawei.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 23 Mar 2022 07:17:19 -1000
Message-ID: 
 <CAOSpxdZJnJPM8X5a68_-0cj2WZeVqz2Yq_9KHyc1J9+6SDsJ9w@mail.gmail.com>
Subject: Re: [oe-core][dunfell][PATCH] qemu: backport patch fix for
 CVE-2020-13791
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 17:17:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163592

On Wed, Mar 23, 2022 at 7:02 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> Upstream patch:
> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00979.html
>
> CVE: CVE-2020-13791
>
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/CVE-2020-13791.patch            | 40 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index ef9bc3f64a..01cda49eee 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -92,6 +92,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://CVE-2020-27617.patch \
>             file://CVE-2020-28916.patch \
>             file://CVE-2021-3682.patch \
> +           file://CVE-2020-13791.patch \
>             "

Note that there is another CVE fix currently on the list for review
(CVE-2020-13253) so you'll need to rebase with that patch included and
send a v2 since that patch will be merged before yours.

>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
> new file mode 100644
> index 0000000000..6026f02e54
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
> @@ -0,0 +1,40 @@
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

Also needs the Upstream-status tag and your Signed-off-by

Thanks for helping with CVE's!

Steve

> +
> +Reported-by: Ren Ding <rding@gatech.edu>
> +Reported-by: Hanqing Zhao <hanqing@gatech.edu>
> +Reported-by: Yi Ren <c4tren@gmail.com>
> +Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
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
> View/Reply Online (#163591): https://lists.openembedded.org/g/openembedded-core/message/163591
> Mute This Topic: https://lists.openembedded.org/mt/89980626/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

