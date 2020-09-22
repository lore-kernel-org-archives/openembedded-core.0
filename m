Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web12.1268.1600751652399653004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 22:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oLooWHkV;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id b2so14613568qtp.8
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 22:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6XJMLd/3ZoF7gm+gFNxb79OlkT8TqzvJZhqWax9qGs8=;
        b=oLooWHkVgu1LUn77Rjuw2LBwpBXNSYLU6eHyGDcj2wISPqbteQf4Vgt71Pd+McYMRU
         2y68PmN/49q2Gg6VHavZ7Vqnt4vdcChF7i/WMoPksH8YLkmRtBm0trqGGt9+OEcqIvFr
         BTsze6NfrY/aUDqTQEaRSEs44IK4E2sJmoq67SZxdYOOacW8BGxb8DIwmQ9V7pb2u4O2
         xguRfBwrucN0HOvhbFK1/PuYcEVDTMIkyXHalguK2ZvGzvU2i3pZKnlwNtD2Ur745KPG
         Atd3BZI9npwV6Tp00tAX7rTP9eWFrXrlxhfh22ICHmFCnhwlc3oBJckIoeTLspeKdOJ2
         JAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6XJMLd/3ZoF7gm+gFNxb79OlkT8TqzvJZhqWax9qGs8=;
        b=OF2SB6I4ExgCNi8r/3tM2TI+W9WBPnxP0/uw9A5Q5oqM1C8sYoYQDcDusQ4xf/xFCT
         5vS1+LYMvQGRt2dgsGPUIHBCjxsP0FORtcy246xsZ6XLfUrPRQTFu5fjppkE/RxDWNlC
         mcfwlShYCSyNtulWvTi4iyYrOarDM7mXAD9z/aryATGlP6g+OmdVOkpxIH56DsSYozvq
         cqKJGJd4FIPR5om7uJlJHxLkr6VFx7VaBGD+QRyA/oulFh9ChvQ6aUmX+QgkwSPBh6bQ
         seqiUXyt/UkTWdpPADtIzw0i93qSrdgHebgxd02JhN3vCh/i/D7qJKnMEhI8MeqRH5p8
         eIfQ==
X-Gm-Message-State: AOAM530groqy5+ymvoNmk9cKY4Gy1x96PJNCb4+0O0KJ37phcPulQjC7
	ujxrh+st1AJoVL9tWIBw+MVsrpWlfX0OT5slxAs=
X-Google-Smtp-Source: ABdhPJyOIY/FYc+oZBs2Nm2AJvVUSJNBZPsl8fnGAfVMQ3NVr0yEd4Lq0PfI85aZMpyTQ97D9b47ikGiMN+lvWl94kU=
X-Received: by 2002:aed:2646:: with SMTP id z64mr3061829qtc.194.1600751651491;
 Mon, 21 Sep 2020 22:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200922004455.21335-1-JPEWhacker@gmail.com>
In-Reply-To: <20200922004455.21335-1-JPEWhacker@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 21 Sep 2020 22:13:45 -0700
Message-ID: <CAMKF1spi8rWm5J4URo+iM5r8A_AgEDXLgiXdOhZxVFR7=KdB_w@mail.gmail.com>
Subject: Re: [OE-core][RFC] openssh: Start key generation in multi-user mode
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alex Kiernan <alex.kiernan@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 21, 2020 at 5:45 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> The sshkeygen uses a lot of CPU time which delays booting (especially in
> the case where no SSH connection is going to happen), but we also want
> to be proactive about generating it early so that the first SSH login
> doesn't have to wait a long time.
>
> Starting the key generation when the sockets are created (which is
> pretty early in the boot process) slows down the boot due to high CPU
> usage, so as a compromise start it no later than multi-user mode when
> things have typically settled down. Note that if an SSH connection comes
> in before multi-user.target is reached, key generation will be started
> immediately.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-connectivity/openssh/openssh/sshd.socket        | 1 -
>  meta/recipes-connectivity/openssh/openssh/sshd@.service      | 1 +
>  .../recipes-connectivity/openssh/openssh/sshdgenkeys.service | 5 +++++
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.socket b/meta/recipes-connectivity/openssh/openssh/sshd.socket
> index 8d76d62309..12c39b26b5 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshd.socket
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd.socket
> @@ -1,6 +1,5 @@
>  [Unit]
>  Conflicts=sshd.service
> -Wants=sshdgenkeys.service
>
>  [Socket]
>  ExecStartPre=@BASE_BINDIR@/mkdir -p /var/run/sshd
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service b/meta/recipes-connectivity/openssh/openssh/sshd@.service
> index 9d9965e624..40fd38730a 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshd@.service
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service
> @@ -1,5 +1,6 @@
>  [Unit]
>  Description=OpenSSH Per-Connection Daemon
> +Wants=sshdgenkeys.service
>  After=sshdgenkeys.service
>
>  [Service]
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> index fd81793d51..52617ec275 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> @@ -7,3 +7,8 @@ ExecStart=@LIBEXECDIR@/sshd_check_keys
>  Type=oneshot
>  RemainAfterExit=yes
>  Nice=10
> +
> +[Install]
> +# Start key generation no later than multi-user mode so that we can hopefully
> +# have it generated before the first SSH connection
> +WantedBy=multi-user.target

This looks better than what we have. Please do something similar for
dropbearkey.service as well.
I also wonder if we need After anchor but I would not worry too much about it.

> --
> 2.28.0
>
