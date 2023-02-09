Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1306FC05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 09:45:51 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.10601.1675935950232124081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 01:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cKKU6ksH;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id o5so1424911ljj.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 01:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z5p0QmZFqRTRWRs5kKX/xxKR2Pq12QwtSGUTvZas174=;
        b=cKKU6ksHi6S64tv39XBWXT+eDmJT9VzdKDG1cIO4MaqLZRvEJXNZ071ynLKD80Wuk2
         XZyg8+NG2PBeNkWoTocjzLVtWaUO2voLqR42ElF+QEp+sf6tTlWumxYv7Bfp0GutZYp6
         qpnE56G3oXDlZLutZ0bnizy6d9jlYBz0I603cdP4PQKtNbQUO9X/2MksXRYrgBBYt3u2
         pRhFj1P0AKmawZyImFBtuakCm+4/XgsxfAjbafyYGpVht43VNJmqzrA3ZBgdozTN3GTc
         Cr/0ozmP5Mi/m8cQGbt0SQV4zL2+TMNOGJyKIQlWjHb71fjnWjP0t3z+0JXDEbNEXkGG
         HaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5p0QmZFqRTRWRs5kKX/xxKR2Pq12QwtSGUTvZas174=;
        b=3iZ1nD2NVVSg3CVF1Meudcpmz5vKOAi8Nxd2YiwI35I6ety1+LhqlivE8BG5RltEs+
         xd6lrwe4esFIbhqnpVVzrbNTFBG/GMxbDXF8gLdg9P9J6wWWY5G8r448tor9Mkft3rPx
         kewOAZzA/6p1dNpb2Wdhb0QbZuLuo39WpzONnYxE8SL3vuFveAclKikcWnIDs4cpPWWQ
         N2qpfv1Tc1HWKW4RaHcYu+2wQQ+UZoRRh/2el886rMSTOOWo9g/egF8p1WhLWFhoW1bL
         9g6Rwl90ykFg4LwF4A29tn3rMj7wQxtjDh+UCwullye90ViiA62AvSzKf90FWp6Eb7sw
         S5OA==
X-Gm-Message-State: AO0yUKX6uwcDKLBYkZ863vzmMxglOkENLiywOJeeHSYC2+DGjsuRfFGa
	HsHg/OBzYbC3Ohc2jwy7FUmjG98c4AUtTwek8OZWQZne
X-Google-Smtp-Source: AK7set8cMO8vDhF5FY+o+3Shd3nqOyoZ23yxrcMbqeSV4GdVifeHNjGpYltyBNuf6YHGGKs7eucN0cGf4u7VMOv53fw=
X-Received: by 2002:a2e:97cd:0:b0:293:28a4:d884 with SMTP id
 m13-20020a2e97cd000000b0029328a4d884mr1119513ljj.55.1675935947920; Thu, 09
 Feb 2023 01:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20230209080936.148489-1-mikko.rapeli@linaro.org> <20230209080936.148489-8-mikko.rapeli@linaro.org>
In-Reply-To: <20230209080936.148489-8-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Feb 2023 10:45:36 +0100
Message-ID: <CANNYZj9KXz8-d-LV+z1Pp7dLkt64C4VGM+CJmTii7Fsnsif2mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/8] oeqa qemurunner.py: kill qemu if it hangs
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 09:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176935

Isn't the code waiting 5 seconds and then sending SIGKILL, regardless
of whether SIGTERM was successful or not here?

I would actually remove this function altogether. qemu process is
started by runqemu and it's the job of that to clean up the actual
qemu process properly.

Alex

On Thu, 9 Feb 2023 at 09:10, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> qemu doesn't always behave well and can hang too.
> kill it with force if was still alive.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index bce00c696a..8e3484385d 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -589,6 +589,13 @@ class QemuRunner:
>                  os.kill(self.qemupid, signal.SIGTERM)
>              except ProcessLookupError as e:
>                  self.logger.warning('qemu-system ended unexpectedly')
> +            time.sleep(5)
> +            try:
> +                # qemu-system did not behave well
> +                os.kill(self.qemupid, signal.SIGKILL)
> +            except ProcessLookupError as e:
> +                # already dead
> +                pass
>
>      def stop_thread(self):
>          if self.thread and self.thread.is_alive():
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176926): https://lists.openembedded.org/g/openembedded-core/message/176926
> Mute This Topic: https://lists.openembedded.org/mt/96849162/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

