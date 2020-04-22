Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web10.2075.1587581324941501371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 11:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oeBtzLc8;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id i22so2848327uak.6
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 11:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s7DKXE9WuCzVCQc4pLDQaWQsXpkqY+77o2YcN4NApTQ=;
        b=oeBtzLc8TCeFKQ1lAbaA+NWXbbcB9QJhArC5x/qaqcY6t7HJfUUaHIKMZNhm7HVabb
         bFfQiJqudS3uPNPE6lDWbw3Hx/w7f/N2a+MyNocJ10rpYlXCQPFThFnb5bks4GuqgTsF
         DOJ3/piFkSwAi4GNvsZXaPCt+FM7Hago18NVjm5JcFWQgxOn9SDW11HnV4eDpvEl1AZ0
         zi7kPbKGw+hf+GQFJ1jCQtdDhxp9jWJL0RnuKPZ7AHmJNVgPQTit4kSfTbEaF0fPknKd
         15jXWrHFulFnAA1CFX5bpIB/zJhbIWYH6pQrDOeENTztUK3FZt7l1uyZ8RXMuZPVATRj
         K44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s7DKXE9WuCzVCQc4pLDQaWQsXpkqY+77o2YcN4NApTQ=;
        b=r4IeECiosbaAk6qpmtoBwdcIDNjGEK0xdQrFBZ5R01qQZYuEBh2yFSbWHm5QtXQeDN
         eSNl9WFfHmKHdh2FffHU80T3dlXFlTEpafoLXTUyRzwehk67B+cjtqt6lawNzIGZnfY/
         q5b6vtHZp98PybPtu9I7D62MityAHsBpedANIzhmw1a/xuWnNOZX3gHKn4/r+oAiEGVY
         RvDW0kwkPZdSJZk4RMfCSC+/TXuKfEdmo2P2s4j4EXXgrwybdM/KdXWLkysayrK9VxaU
         HKg7ilJdRoafuu27H6RFwJx8xFgupExYfR+hfoWkfGwPR0A40sBqjOSwO0XbF/hZYfDk
         rqqQ==
X-Gm-Message-State: AGi0Pua6xBynuiPDZXSSLSi6JmJN2IKfxJIWjURW4RdPE4dAV2nu7zLs
	Z81HCftLxfKL0Ktc3jH5VjA+60/A1q40kfNXae4=
X-Google-Smtp-Source: APiQypIUlsW9FM0ElqKpkaXB9zoJgJ4ItrYP06gQ8E0tpTX6DfmHUWFX0IwYwuTuakDbG381J2gXsXfhxnT2Yp5B7uk=
X-Received: by 2002:a67:8e8a:: with SMTP id q132mr140907vsd.11.1587581323936;
 Wed, 22 Apr 2020 11:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200422135211.121292-1-alex.kiernan@gmail.com>
In-Reply-To: <20200422135211.121292-1-alex.kiernan@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 22 Apr 2020 11:48:32 -0700
Message-ID: <CAJ86T=W+CmGCZF_ej+na_tzAddNP69XJPE5MZTGFF2HjRqfGtQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/6] openssh: Move sshdgenkeys.service to sshd.socket
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 22, 2020 at 6:52 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> sshd.socket launches the templated sshd@.service, so by moving the
> sshdgenkeys.service to sshd.socket, key generation can start in advance
> of a connection.

Is deferring key generation until the first connection a bug or by design?

> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  meta/recipes-connectivity/openssh/openssh/sshd.socket   | 1 +
>  meta/recipes-connectivity/openssh/openssh/sshd@.service | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.socket b/meta/recipes-connectivity/openssh/openssh/sshd.socket
> index 12c39b26b59b..8d76d623097b 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshd.socket
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd.socket
> @@ -1,5 +1,6 @@
>  [Unit]
>  Conflicts=sshd.service
> +Wants=sshdgenkeys.service
>
>  [Socket]
>  ExecStartPre=@BASE_BINDIR@/mkdir -p /var/run/sshd
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service b/meta/recipes-connectivity/openssh/openssh/sshd@.service
> index 9d83dfb2bb1c..422450c7a190 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshd@.service
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service
> @@ -1,13 +1,11 @@
>  [Unit]
>  Description=OpenSSH Per-Connection Daemon
> -Wants=sshdgenkeys.service
>  After=sshdgenkeys.service
>
>  [Service]
>  Environment="SSHD_OPTS="
>  EnvironmentFile=-/etc/default/ssh
>  ExecStart=-@SBINDIR@/sshd -i $SSHD_OPTS
> -ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
>  StandardInput=socket
>  StandardError=syslog
>  KillMode=process
> --
> 2.17.1
>
> 
