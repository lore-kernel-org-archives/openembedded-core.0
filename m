Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43EDC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 09:37:29 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.8910.1709026646942371620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 01:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H5T+v0eU;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d288bac3caso25239411fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 01:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709026645; x=1709631445; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JKr6/IOcQ4k6oFxO31iMavDj2hYnfBaf9cr/rJUPHsw=;
        b=H5T+v0eUMun2hKKaaKjMm1HSltbtTxewwn+i3FPkbM4w6ZGoBcJybg05Ru8IWZzFDL
         ndK8KhG5aA2wDSIQr+pPaO86yRWIV29PEJG7IB3TOJCdMEWd8OMS1y1YU7ubZnte0ihx
         TaxJNSv+Dor2TP+tUR7cFlasjs/kxijHv+anUuNE47zVRdiQF9J/cFSskKvKkDJsfbzi
         fcCythCEuq9TAz4bzw9ImDYLwMcDrRDqAfix6WuGTJb5xh1cn03nA4D+Sz03t2keqcko
         Ut9w4+duBHtpAbFYmKtFG6h+Nge0GCZuac4ELNuMv62/tjGzAWMLZaSFV6Hm+HD71VUM
         KiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709026645; x=1709631445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKr6/IOcQ4k6oFxO31iMavDj2hYnfBaf9cr/rJUPHsw=;
        b=wTMFTP+rPKmu6oOTppBwFXCpLMuHrVoM9oxgp5BShVo4X8qJNu7+Ur0sK8t2Fnb9cl
         NP+oQTabvjn1Pn0XZ2VyvcI9h7AWzZpZaymYV0lmuvRpWls5HrUjBV6qE8rhhk+GV5Ir
         RzgShfPxm6JVMw7RY3XgjcsscWBRw3a8Jeh0x4iDEtCJE0RwyS/9qQfrHzhB+viNF180
         KfHaJtc7nRkQKXoY/Xcc2Hi+joQaYpd0LodZ3YPwshHSpRb2VUQyDZ+IMjPaEkqy51OK
         h4RGVPgo8BvzfIReIky7J61bx3iJsgtMb3U2kxIERJkb1EKOedwTM6uZBiE1ITEe8KY/
         wUww==
X-Gm-Message-State: AOJu0Yy5YZteRPtVccxMHtaZ9LDskb+AfxjkrRvRN3be3nbTtF9sFC/B
	fJkmZA9c3eaXnrVPwQeE1n4Cg3qzQWUhi95syvLdwtMQOumy40zo6GO6MQXPG1T2xCG22KrHSq7
	0QhqxlqmhjUGaenkDKFjt0VVt+6GnYNNH
X-Google-Smtp-Source: AGHT+IE3Fc170ptWjn9cF0L6utfRBjcJOvq7dxPGgnENz18IevjMkYHsPb9KvYWHdXh6hgihM5+8LWaezEkw1STkbGI=
X-Received: by 2002:a2e:9881:0:b0:2d2:85d5:80c5 with SMTP id
 b1-20020a2e9881000000b002d285d580c5mr4173845ljj.40.1709026645055; Tue, 27 Feb
 2024 01:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20240227071004.2402854-1-changqing.li@windriver.com>
In-Reply-To: <20240227071004.2402854-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Feb 2024 10:37:13 +0100
Message-ID: <CANNYZj-1oTYiqqMcN1S3q8M6WrWr8-TBf0EB2aEorsKK72qCcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V6] rxvt-unicode: Fix installing of terminfo
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 09:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196248

On Tue, 27 Feb 2024 at 08:10, Changqing Li
<changqing.li@eng.windriver.com> wrote:
> +
> +       install -d ${D}/${sysconfdir}
> +       install -m 0644 ${S}/doc/etc/rxvt-unicode.terminfo ${D}/${sysconfdir}/rxvt-unicode.terminfo
> +}
> +
> +RDEPENDS:${PN} = "ncurses-tools"
> +PACKAGE_WRITE_DEPS += "qemu-native"
> +pkg_postinst:${PN} () {
> +       if [ -n "$D" ]; then
> +               if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
> +                       outdir=$(${@qemu_run_binary(d, '$D', '${bindir}/tic')} -D 2>&1 | sed -n "2p" | awk '{ print $2 }')
> +                       ${@qemu_run_binary(d, '$D', '${bindir}/tic')} -x ${sysconfdir}/rxvt-unicode.terminfo -o $D$outdir
> +               fi
> +       fi
>  }

I would really prefer to make native tic do the right thing, if the
only problem is that it installs the needed items into the wrong
location.

qemu usermode is notoriously brittle, and isn't available on some
targets at all.

Alex

