Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B51C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 18:51:08 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.67.1722279058729227477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 11:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ic9CXaQl;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52f01613acbso4358040e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 11:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722279057; x=1722883857; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KMQ6QkJhsOqwFh4PSam1fGvoWWpaqxVOBJAcRBLLg/8=;
        b=Ic9CXaQlN44TQPZZkoPq4Ie7f8aJ5GY9DRfmdLXqlw8Yj5fJ5U8ghaZLJ6cRHEuJUf
         iH+BrKEF0LzhaE2x4v55Ug3m9hpIkvQl2ennUc0G4tmf+MJ2RCvhzW0ir8IpPoIZuEDB
         TP4oKgSerDlxqZcyRu54vrvzunstaZSSWNCdoviW/k4OXQM/n4bQvaurGEGA2/GNV7tT
         1ByqLeQxarQ2cUCbKyDBN4ZaF7oG+I3B0mvJ6vT8QSqurAzS4xirc2jarSz2QY4HRHGO
         W4AapmOgoRD0I13WFN7r9OILsS3c+mbrb/4w6E9hB9gSLubJEPABHIzg3c3L4QLNVF6m
         5JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722279057; x=1722883857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMQ6QkJhsOqwFh4PSam1fGvoWWpaqxVOBJAcRBLLg/8=;
        b=JnhfTyosv5VQALXzIdal35raJkuSOqKGAIUMCR0Eo/zMLvZXdNDi4s30as1VKD9I+D
         NraaXqFdsnsxwWYupnffF+3EL00W7eWPFXMxOKFTj1nthgIGm/S1bFi+DGw9Hl98Wm6g
         MyvZ51iG+wEbk6/2Hn/oQdWPa5wDvseCzL3aaa1s3Gi2n0MXf1VXu8le5vwmvSNwBene
         HVzgQR8tOHg2GRqA3G2QtKjf6sWIeHrXkTunoVvtO9+Dr1Th8383HUvjwI+yl0/30oze
         7MjUNOM0CLoi+g6Y3KogRPsb/dQUQen59c4RS5ZQngaVEUOM+tpYIW8sHED6vrO5TUXG
         iVUA==
X-Gm-Message-State: AOJu0YzfsXrGKn4J8x12nuTuExgWq0cCPhDxLLGgvEhqOz7HQjpnK6nv
	v0yJaKAqE3fhohekiCpkPECPKKZYspx1aRr+XHULY60ZsVcKt91rBnBjMAUCKkJjZw/JRQN1HQI
	jlzWY6SrrlS+bDNuBAQl3SzkdIDjooOwWQhk=
X-Google-Smtp-Source: AGHT+IHFxmscEw7rUsW7w4+N1ILcCGOmmYShKMtzybHLlfS7iG5QJMV5HSnjajQ1DmUvCXENIkRAmumGYz90qsCQz2k=
X-Received: by 2002:a05:6512:3504:b0:52c:ccf3:f20a with SMTP id
 2adb3069b0e04-5309b718bc4mr2645072e87.23.1722279056447; Mon, 29 Jul 2024
 11:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240729144434.153005-1-li.wang@windriver.com>
In-Reply-To: <20240729144434.153005-1-li.wang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Jul 2024 20:50:44 +0200
Message-ID: <CANNYZj9boK0816ap5hN8LqmpeyThanWjoYjjT=FtfpEjp-9R4w@mail.gmail.com>
Subject: Re: [OE-core] [openembedded-core V2][master][PATCH]xinetd: use
 monotonic time
To: li.wang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 18:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202660

On Mon, 29 Jul 2024 at 16:48, Li Wang via lists.openembedded.org
<li.wang=windriver.com@lists.openembedded.org> wrote:
>
> when using xinet.d to limit rsync connections and time is set back,
> the connection limit is reached very quickly and rsync gets deactivated,
> if time is changed again, rsync is never reactivated.
>
> date -s "xxx"
> xinetd[xxx]: Deactivating service rsync due to excessive incoming connections. Restarting in 10 seconds.
>
> the timer of xinet.d is based on time() function, and it is affected by system time.
>
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
>  .../xinetd/xinetd/use-monotonic-time.patch    | 246 ++++++++++++++++++
>  .../xinetd/xinetd_2.3.15.4.bb                 |   1 +
>  2 files changed, 247 insertions(+)
>  create mode 100644 meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
>
> diff --git a/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
> new file mode 100644
> index 0000000000..2144c3cba2
> --- /dev/null
> +++ b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
> @@ -0,0 +1,246 @@
> +use monotonic time
> +
> +when using xinet.d to limit rsync connections and time is set back,
> +the connection limit is reached very quickly and rsync gets deactivated,
> +if time is changed again, rsync is never reactivated.
> +
> +date -s "xxx"
> +xinetd[xxx]: Deactivating service rsync due to excessive incoming connections. Restarting in 10 seconds.
> +
> +the timer of xinet.d is based on time() function, and it is affected by system time.
> +
> +Upstream-Status: Pending

Is this patch taken from here?
https://github.com/openSUSE/xinetd/pull/45

If so, it has an incorrect upstream-status. Please fix that.

Alex

