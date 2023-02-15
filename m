Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7846C64EC7
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 13:25:37 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.14721.1676467533218020659
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 05:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112 header.b=hhLBuIaj;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.50, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-16346330067so22882420fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 05:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DD7bqOmi60jNZkqAAon5qNWgDaIPzo3h/nSHeTckTBE=;
        b=hhLBuIaj5t5HFXFjAA0kEWVqsYWY0cQc8QKlSNlqZXGo2GscKcdIzS6e8rCbcFRXli
         mpYJXzSYOC+NDI1lZcqiJA42hhKl7c27hhEJy1JDCZs7aKSO94tT4yXX4OGjqEbQrJps
         e6Z8qG6RjA0yjHGblRiugdrfsbnDteWuI+BkvHRXCVouUvxfy2z6OpJXeYT7Aw/Zk0MD
         uTufYcPxhoYJ1AqPI/ShYzJmgCqcaAa7+uWIeyS3+6WrbqL2mMzEVmOGQTBlucvEKN+e
         h4MBw28fT+KEsgkhNcTPRv+BfmubSU8HDPHwZ5+HMEF/ur5AsvEmqd11Vx6sYoBtFxj1
         fEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DD7bqOmi60jNZkqAAon5qNWgDaIPzo3h/nSHeTckTBE=;
        b=UanoTrDSPLJmQwuBuzRct2Knw9F2aovrlfVX5UQERQaHtA6+f+ePnBoukgqVG0NNoZ
         moNlnzPfjS39dbhRllsKn8p9fPp7ieAuKgcDZcAF6WBodUQtcXjs89pkMpsFcb5u5kt3
         2QGPKcvtgs49eKLQpHhslBZ8H8q9YZHYxWJZE4oZ7FvDfHrtjIncd71w0YGmSqBqxL37
         pwtoK2y2min7Lx1xV1gf8ndlDztJqDqxLyuvniAM3U4RwGxX0i/K4tTBU2hQfd77+t/Y
         xO14fK5Rg//+Wzvw5064TN1YnNdZ5DZbp9Tzb7GoOlz6Rm9Hhb95ymM8xLGay3SLUN9i
         /UYA==
X-Gm-Message-State: AO0yUKXDv/04Hs7o9j+FAvko8PrA7V9sWlVr6+qnDzJL9PDHZEdOS9JS
	sQOtnDeNHMdZMYJdM/a+xhjhqyw3xjQzEudyMl8=
X-Google-Smtp-Source: AK7set/vYZTsoq6nlt72NJwaWjQ3yM7xSf0QwHKzVX5w/yVAKRxYxZbLd6URkb7vOarzQ5isEI9uGw==
X-Received: by 2002:a05:6870:96a5:b0:16d:e2ae:47d1 with SMTP id o37-20020a05687096a500b0016de2ae47d1mr1072897oaq.33.1676467531981;
        Wed, 15 Feb 2023 05:25:31 -0800 (PST)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id zq47-20020a0568718eaf00b0014435b51ef7sm800806oab.30.2023.02.15.05.25.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 05:25:31 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f171.google.com with SMTP id c15so15763595oic.8
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 05:25:31 -0800 (PST)
X-Received: by 2002:aca:bb82:0:b0:378:2bf7:39b4 with SMTP id
 l124-20020acabb82000000b003782bf739b4mr178248oif.288.1676467531168; Wed, 15
 Feb 2023 05:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20230215130057.1923450-1-jose.quaresma@foundries.io>
In-Reply-To: <20230215130057.1923450-1-jose.quaresma@foundries.io>
Date: Wed, 15 Feb 2023 10:25:19 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrs24T2V1Ks8yeWbT+_6FLWdc4wy8iybKQpjxPhOhctAw@mail.gmail.com>
Message-ID: <CAP9ODKrs24T2V1Ks8yeWbT+_6FLWdc4wy8iybKQpjxPhOhctAw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] kernel-module-split: make autoload and
 probeconf distribution specific
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177189

Em qua., 15 de fev. de 2023 =C3=A0s 10:01, Jose Quaresma
<quaresma.jose@gmail.com> escreveu:
>
> The modules-load.d [1] - Configure kernel modules to load at boot
> should install their configuration files in /usr/lib/modules-load.d.
>
> The modprobe.d [2] - Configuration directory for modprobe
> should install their configuration files in /lib/modprobe.d
>
> [1] https://www.freedesktop.org/software/systemd/man/modules-load.d.html
> [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>


Did you validate this using busybox only? Using sysv and busybox need
to be validated as well.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

