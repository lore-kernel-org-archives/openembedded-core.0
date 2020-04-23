Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web10.815.1587662078822236420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 10:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pkqpG0bV;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id i5so6540702uaq.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 10:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4CAcNoc6/jIINk6FtHDdCrI3mXfBdJT400T/gGfdO9Q=;
        b=pkqpG0bV9vJMYJbO/Ft4SfPQPFWNOnEnaOna2XpA6eYIwrhaI2MQcd47NVcIqI3Mse
         yR4B7Ae7zE+jay5LxYZMf67C1ooK6zf96nZHHa7Bt+xvO8ulJ5aDcYti0/sTRqj2ij5i
         gVSCp2Mz0lwR2bdrDnJlKwVRlcFqxWWbu23lLeQJxpx2aHnx/2yR+xQU0YXHIYkK3und
         +lWICn5PcbL7zJfXdtW6Fm21f+c69LT8dnkuwMNv6re6c/C5R8DbL5QgagvKSdfsLB5k
         +ZjqZ1JBCElo/ppAfvai6BMt0QpFP4igTBg+3yBOKDpyzK1W1hCAI5Os8TCfI0kRfIkp
         7C5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4CAcNoc6/jIINk6FtHDdCrI3mXfBdJT400T/gGfdO9Q=;
        b=Imz38jho/jZiwF/pXwxgZJWSswQ+H86HlbqgxnIKRJwoHJ66yY8zMDt9DXIxj2xAwz
         D88n8jZsGJ/FdT/lCQD0sm1niP1T/015nTFc3wrYdWohdU4qC3J8Eu3KpDRyljk40uBz
         jgVZhcD6HMNUyqHKSHUXeUCC9KLz04589mAOBHOp0NTuwCmfeHtAsPn6vmbcclY0U+wZ
         2s1NPQRR9dBPSdCgVMowtpdvRgc3KSVjnuLgTguW1A42L7lz3W0bKylh0TpFKHChWfaB
         2hBafSvBX1oWa8KCaduyaWpD0i+bujpdb3nUCAxIwIXAWZHiD2e9RfAreqZyK0IATDJ9
         RZaQ==
X-Gm-Message-State: AGi0PubqjGlmDjg9kcQZfspIhwQulnKi9q2iuw2ExRsV2N+c3W7vL7Hw
	kPCC/PlfYmt+NBDzl5+UhIxEeAIBTJF2JbEEA9o=
X-Google-Smtp-Source: APiQypIefqAyOjTBUy08UazbBDuD+ABjtiiFV6HZwpCN+ZntUSwR2cc7D6NikFn8tQLPez7fyq5pbWg6SB0JQ3alNGo=
X-Received: by 2002:a67:2284:: with SMTP id i126mr4152755vsi.223.1587662077915;
 Thu, 23 Apr 2020 10:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200422135211.121292-1-alex.kiernan@gmail.com>
 <CAJ86T=W+CmGCZF_ej+na_tzAddNP69XJPE5MZTGFF2HjRqfGtQ@mail.gmail.com> <CAO5Uq5RXQn+Q0NmVD0nWAYxp3YMs8TFKiDLudCHzUFD6LHcc5Q@mail.gmail.com>
In-Reply-To: <CAO5Uq5RXQn+Q0NmVD0nWAYxp3YMs8TFKiDLudCHzUFD6LHcc5Q@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 23 Apr 2020 10:14:27 -0700
Message-ID: <CAJ86T=W1jP=eMiJmcQLYfKamsD3v2+ycbS8Q3V-iEc+HVDT=Gw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/6] openssh: Move sshdgenkeys.service to sshd.socket
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 23, 2020 at 1:30 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> On Wed, Apr 22, 2020 at 7:48 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> > On Wed, Apr 22, 2020 at 6:52 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > >
> > > sshd.socket launches the templated sshd@.service, so by moving the
> > > sshdgenkeys.service to sshd.socket, key generation can start in advance
> > > of a connection.
> >
> > Is deferring key generation until the first connection a bug or by design?
>
> If you've installed it, presumably you're expecting connections. But I
> agree you could argue it either way.

The trade off is between slower first boot (or every boot for
read-only rootfs if host keys are not persistent) -vs- slower first
incoming ssh connection.

Since the first incoming ssh connection may never happen (especially
if ssh is only used for debugging or development), optimising it at
the expense of boot time doesn't seem to be an obvious improvement.
