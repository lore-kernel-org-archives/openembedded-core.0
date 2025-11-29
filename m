Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C46CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 17:42:55 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18694.1764438165167892912
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 09:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iUGB/8PF;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88059c28da1so27256426d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 09:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764438164; x=1765042964; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1IPM56VIWHieq5laiWLiyvYgKsa8YFEHRHObpVIXaN8=;
        b=iUGB/8PFV1UvNOs3aWdwj4I0Cc06c1glNY6XLHyQkk+tIqwDj4MZBlWXAqBuUIKbuE
         +CXmoCoGeMZto42K+lHFhW8RzqQ8RzAyeTpWIRgJNmn3y+zI3mf3Ud7S5qy6h3Ogzu7Y
         z0QIAdcWkDoUcM2d05Brg8To6Br6V/xlwW75xefyRS/Xcvtj9X45sC70F/WVsLOE6K79
         cVx0BUC/+40q/kLvl1GqsbB9Lh+LvEPFqX0VcNa+UdO+EDuvmCYgye09zvVN+Ixyydlt
         MuqOIZbND0v1tFINk0qb5x7ab4LzFayDwDmvEz2fW2ytsdc9PNrAUrwNs4adQBkV+4Jn
         lpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764438164; x=1765042964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IPM56VIWHieq5laiWLiyvYgKsa8YFEHRHObpVIXaN8=;
        b=PPvLXqUjOXOe5rkE2BymuseLhB/i+tai7j8YQM71CaxdwaLs6II3it2d3CylSSfNu9
         rgW6hndjyiNHonbt95oI1RHCE5P5s7mkmLGKu92UgaF3PwJZwIyzlcy49vWXaPlm5e/G
         NEDFL2cqH7V+Y4hw42+k7qAyacqySGiujsXiOGcXzfZvPw9Z6kLNm6ok+K11pWV5nV9n
         BRYygrcFBBMZ8duZvMqZ8SRpZMlBM68hAACTHEoi6k6UsN/qY+JHezH2SrPHg4ri9xxI
         cqLbJopGphCPK/058N1CHp3rQDqCh/AES1tdbHXpUzoRO+yJewnxyjoqzIbq0t3PMn5y
         ghnQ==
X-Gm-Message-State: AOJu0YzMJBt4aqzhW2LQzEiuNZs+9NFfuHjFH86CRP8s6v5EsiMPAFOx
	rcBNVM5d37H7QTVOCAEwnniyEOeyk5iV4dDvolrSbDdqGbXFXcFGHJRg77JUf2t/DCYitLkDUwb
	7V0uXjmER5SfjQ24k12ZfcG6O63kUdR8=
X-Gm-Gg: ASbGnctVbSfBQ00khCEQJDgYnrm154G535gSOyjah4my7hiFQc/UCSfKwDwxa6H8gxi
	4z6FCuL4k0anBkZuu3zvAF/3G9BAL2T2ACnEEHpzSTARdjzqlza3EugrAQ4yo1ccQkcUGLutejy
	sNtzMb6FtaJqe5HWqrXFTuzWiT55OjNUz3pYmhSmDue/RGNoH7WMLfbANKJas0NJp4L2vD9q7D/
	6jWLnk3WIN/5mddbW8vJbSiQcZBVOMtPmEVfzWUZcjZG+okPHgwoJEs/Qzuza7ElvlwIxoXNM1G
	8eZAIiBrOV+CzcXvvn81NzSxRZUKXQ==
X-Google-Smtp-Source: AGHT+IEZi5WXlLKvo4/J/BScwxk1xE+yh9hNjvjFk+remcnoK0LfbnfrmdmyhqAdIG5FX76x5n6LBlZcf7Z4qMGl79w=
X-Received: by 2002:a05:6214:21c6:b0:880:501f:608 with SMTP id
 6a1803df08f44-8847c5666fbmr569972816d6.46.1764438163860; Sat, 29 Nov 2025
 09:42:43 -0800 (PST)
MIME-Version: 1.0
References: <20251129154130.505619-1-Qi.Chen@windriver.com> <20251129154130.505619-2-Qi.Chen@windriver.com>
In-Reply-To: <20251129154130.505619-2-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Nov 2025 18:42:32 +0100
X-Gm-Features: AWmQ_bkAMdSg1VCd_PFVUdfqesxm-F22SNG8nC9XRk4cgO62rCEGlQoFRyl9DqA
Message-ID: <CANNYZj8xJjxF_fiZZ+23ZBy2ZQd+jN5vvvCVLCmmatHZ+gjDXA@mail.gmail.com>
Subject: Re: [OE-core][PATCH V3 2/2] rootfs-postcommands.bbclass: fix echo +
 '\n' in 'no password' banner
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 17:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226945

This is ok, but you should probably order it to come first, so it can
be taken regardless of what happens to the other patch in the set.

Alex

On Sat, 29 Nov 2025 at 16:41, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The '\n' means hostname instead of new line in /etc/issues.
>
> bash and dash have different behavior on echo + '\n'.
> So we avoid this '\n' and use an extra echo "" instead.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes-recipe/rootfs-postcommands.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
> index bcc25798b9..a4e8517229 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -262,7 +262,8 @@ add_empty_root_password_note () {
>         rootpw="`grep '^root:' ${IMAGE_ROOTFS}/etc/shadow | cut -d':' -f2`"
>         rootpw_lastchanged="`grep "^root:" ${IMAGE_ROOTFS}/etc/shadow | cut -d: -f3`"
>         if [ -z "$rootpw" -a "$rootpw_lastchanged" != "0" ]; then
> -               echo "Type 'root' to login with superuser privileges (no password will be asked).\n" >> ${IMAGE_ROOTFS}/etc/issue
> +               echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue
> +               echo "" >> ${IMAGE_ROOTFS}/etc/issue
>         fi
>  }
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226942): https://lists.openembedded.org/g/openembedded-core/message/226942
> Mute This Topic: https://lists.openembedded.org/mt/116527246/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

