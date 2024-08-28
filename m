Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32766C54750
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:32:13 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.8791.1724833927631183230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RbzTFgoY;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53345dcd377so8588009e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724833926; x=1725438726; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RX9bTT4f+1CZzqfPUeagh0jtYMLxRXbOgNsbCZ5hQqM=;
        b=RbzTFgoY2TBnNp98IW5ubC5q5w6pZWLcTMnj/Ydl3NoBLL/FZpjDUH0AbzEwk0DEbb
         qyLANYqsXBR4OpjGn9VZLMBe/RvxQIRo+G+JS8CGV+CLl89/tEPqJEjcWcCNElFnZvNJ
         R2L2jIh+6HyZpmez2HMBLmAGs0chwvlEpBdv9ZedtP2xAWeDcbmsI4SJdVBcW144JGVo
         PPhLOfhxnq4qY1O0siXc4L8gJipbALC68qfJerxbeRy7MOeNwQ051T5J2nSuN0zYdICY
         wqipBsB38LivT029hhz9FY8JO+5D5u7z2y50cuhIqKIpf+q3ds74RI7rkediMarS1HTT
         wK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724833926; x=1725438726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RX9bTT4f+1CZzqfPUeagh0jtYMLxRXbOgNsbCZ5hQqM=;
        b=iosQkX34EoBzcxkx7kHhIEjtkz9jAlbSsoQYPQJcN9D+rd8DG+j/1Ii2PI0RtQrOuY
         meNkEP0IH1KlAcmuYRaOtH/J3jaLEEYEiNdHJN42IT401xwFFjLZSZr/WBivwUPLWl6j
         vTxQT9lQk2wxVhPVtGh2Jo9Z0lE3rNZTB/HqgSpDzgayhqUpcT870aKh3LX3XzmkXM1e
         TERu/fBGt1TEX7jR9V5/6M4k4wFpt7VbnEAyEfdbRQcOAXaxHFjgApJEFDbUQ2OM+mGf
         mXXBusfTcEhP8ETLNFGcR0ElW0AoTWYeeWcPN/ocbHc+C7JUX3nYMJgQrFEWyLlzOoGN
         a5OQ==
X-Gm-Message-State: AOJu0YxHcTYzUlrW6B7aE7FUsQ1+84a09/JbYV7shyOyL/1lNNNOcxOF
	JaA5ofnqxiJjvDikX70gVomHbwmQwvR2MNYSzWP4trBMWKJqD0cuh9yh65DMXD4GnSAGUQy/tGz
	DNjOS0fxkA5zsmB0WWC9YIASrISI=
X-Google-Smtp-Source: AGHT+IFP1q+m3NjJAHYevDao1sPeA7InrXSKHbeo8O7LteY5Uv/Cv/hL4GE4yfioB3eS61fwoGndQ/BReOtcWKXN/98=
X-Received: by 2002:a05:6512:3d89:b0:52e:6d71:e8f1 with SMTP id
 2adb3069b0e04-534387be651mr10427407e87.53.1724833925171; Wed, 28 Aug 2024
 01:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com> <1724833600-2270-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1724833600-2270-2-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2024 10:31:53 +0200
Message-ID: <CANNYZj9SxQYZz3HUNzcS4EG_h9WYOPu_X1xW-MJXdmRkrJd8ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] util-linux: use update-alternatives to solve
 conflicts with lastlog2
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 08:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203871

I don't think this is the right way to resolve the problem. You should
be installing one or the other, but not both.

Alex

On Wed, 28 Aug 2024 at 10:27, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Error: Transaction test error:
>   file /usr/bin/lastlog2 conflicts between attempted installs of lastlog2-1.2.0-r0.core2_64 and util-linux-lastlog2-2.40.1-r0.core2_64
>   file /usr/lib/security/pam_lastlog2.so conflicts between attempted installs of lastlog2-1.2.0-r0.core2_64 and util-linux-lastlog2-2.40.1-r0.core2_64
>
> lastlog2 also uses the doc '/usr/bin/lastlog2' and '/usr/lib/security/pam_lastlog2.so'.
> lastlog2 has a priority of 100.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.40.2.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.40.2.bb b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
> index a8e346539a..e21a16ab84 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.40.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
> @@ -298,6 +298,10 @@ ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
>  ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
>  ALTERNATIVE_LINK_NAME[uuidgen] = "${bindir}/uuidgen"
>  ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
> +ALTERNATIVE:${PN}-lastlog2 = "lastlog2 pam_lastlog2"
> +ALTERNATIVE_LINK_NAME[lastlog2] = "${bindir}/lastlog2"
> +ALTERNATIVE_TARGET[pam_lastlog2] = "${libdir}/security/pam_lastlog2.so"
> +ALTERNATIVE_LINK_NAME[pam_lastlog2] = "${libdir}/security/pam_lastlog2.so"
>
>  ALTERNATIVE:${PN}-doc = "\
>  blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203870): https://lists.openembedded.org/g/openembedded-core/message/203870
> Mute This Topic: https://lists.openembedded.org/mt/108138530/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

