Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7067DC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 20:46:54 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.18847.1749156405904726061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 13:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U+qTCdnq;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0ad74483fso13923376d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749156405; x=1749761205; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cqZ3yt3PpmEM1NrC6MHNJvTMYSjMgIuC1Wo8B6H3EXc=;
        b=U+qTCdnqAT2Qp+AcqtI6e7qHLp5lCyxXovvYSMxTQk3rvd7SFlt0PzMjpP/gNJqMJN
         +M7DoYJZ6TfUqc+aOxa4ms4eCbLpFlSPdBZMy0YU5rQTgRdD001RVOkVG6sOGEj35Tze
         UJsNUiY+f9nDhjBBN4P3UROLd4/HtUcDfvVfkJH2xEzS7V61ewO8iIXGuBZ2MCDfNUmB
         RYPjsEk8nH+hgAoxon9uXFD/tpL/m7q2lnEzAwHIQaBVqw+35sqdO8fo5bhC6SoyCe9W
         zKJYo9TZXL7LbmM65eSq1Z1qM+ctLhrx+yCY12C0OJbKWuNDLGYkj4mg+AtKFbRq14Fg
         CAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749156405; x=1749761205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqZ3yt3PpmEM1NrC6MHNJvTMYSjMgIuC1Wo8B6H3EXc=;
        b=fl+7MAvsWHC7Qp8j9l05p7nxQRgWhjX0W3cNRUgGD5362FrDXpXmf8ejdQ8bd9vHUF
         XOqX8vFkqCLyWNog/VDxcEHjd10pb1Z02zLoS+S14OPW3HQWyCIBW50JQRX1jV2bElEk
         uNlfc1iuPgJL48jS9cqQG/1ZTQv2+KAFitL2ntMDO4XfDcrx0B/tM6IGAKSAJto4E+13
         9zBQjLbK9Sf5FR48s3q5ybs7Up1DPxDh3Tx2HHX/wlNgL126bbMkPzY4aihAvKJZoAJm
         XMkQrgEBeSQ8qphcn4YB9aDn8itKNTtQ22C4Ztvk2cFCUy78F4S0DXCAAoivNiIFDmzL
         MpWg==
X-Gm-Message-State: AOJu0YwgyhUu3wg9VhoBNlrhfMGSKXJYEDPwsQDVq2WtFx2lx6WGDfhR
	BAkY2/P4nicrgiM1ef13foOn91dQXc82VXFNpKkVZIbZSy4eGm1Mm0/Lmh6jCjkUQWEIsxOXzla
	Hpx36tN1sfWaYnzdqHk0sMaTLfPy/ZUQ=
X-Gm-Gg: ASbGncsYWKPJ0uflwEVKXIPvF1QljNSbf7lvjB5wcDxKpwQw1rt79s6dGPGuy3nXU+O
	qb6lnCqNUfR7A9r0TRDFguafDHnaXts7SuqN47KU/f1AeDyHIYo4/QBI0hvVnLAf3teeKbx7DBd
	DkLMhZ4FwdDOMdLa1AJpmfZ2LEePp+s80=
X-Google-Smtp-Source: AGHT+IGOyEFQyjHAI4lrl5SkvYHHx2lFDBHAXv1o5FWpxrodMlnnAD1D+SafQOY+oxZeCwb9VRlcK2Tb7gCYoNGZQA4=
X-Received: by 2002:a05:6214:262c:b0:6fa:c31a:af20 with SMTP id
 6a1803df08f44-6fb08f5cf21mr15214566d6.5.1749156404674; Thu, 05 Jun 2025
 13:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250125113326.2475346-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250125113326.2475346-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Jun 2025 22:46:33 +0200
X-Gm-Features: AX0GCFsuoizWtD5DtUsnA0jl3soIIArGMa4Ug3w1gyTNezl8qfLDaUQASAaHsn4
Message-ID: <CANNYZj9W0GVYEq-QSNb0pAy_9J2-ZkzGhrCvnPcW+KTGK-nLZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/sshcontrol: Handle empty reads
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 20:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218084

On Sat, 25 Jan 2025 at 12:33, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> Looking at some of the autobuilder failures, it seems that somehow empty
> reads might be possible despite not being EOF. Tweak the code to be a little
> more robust in handling this.
>
> In theory this shouldn't be possible but python does handle signals a bit
> differently (e.g. transparrently retrying syscalls for EINTR) so adding this
> check and a bit of code safety at least rules out this problem.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/utils/sshcontrol.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
> index 36c2ecb3dba..6c5648779a5 100644
> --- a/meta/lib/oeqa/utils/sshcontrol.py
> +++ b/meta/lib/oeqa/utils/sshcontrol.py
> @@ -57,8 +57,10 @@ class SSHProcess(object):
>                      if select.select([self.process.stdout], [], [], 5)[0] != []:
>                          data = os.read(self.process.stdout.fileno(), 1024)
>                          if not data:
> -                            self.process.stdout.close()
> -                            eof = True
> +                            self.process.poll()
> +                            if self.process.returncode is None:
> +                                self.process.stdout.close()
> +                                eof = True
>                          else:
>                              data = data.decode("utf-8")
>                              output += data

This badly regresses selftest execution times when a a selftest is
issuing many commands over ssh on a target image. I've been wondering
why e.g. devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_none_qemu
takes almost an hour to complete (on fully populated sstate), and
noticed that every qemu.run() call takes 300 seconds to return from
(which means the loop exits on timeout, and not on the intended
poll()-based code path added above), even if the target command itself
instantly finishes. Reverting the commit confirms this, the test time
goes down to 12 minutes :-(

I have to close the laptop and stop now, but wanted to get this notice
out, as it's significant.

Alex

