Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D103BCCFA05
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 11:00:09 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17900.1762167608906966378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 03:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OjU9LeAZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88056cab4eeso5115616d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 03:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762167608; x=1762772408; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VpHUHIGvdwtem1dm7tnuXAWeJp+wNTqFDuQLWimKqFc=;
        b=OjU9LeAZ8EdvUrRfTRbTEwBxNI8zgI34+zscoIvb5oFGViQ5XLtZvVW62M8NcsyYsQ
         ZvRm09VGt9IwsUbyxldtYbiYLOFAEAerzB9UQObo1kfBjPvNxSzif5HyBPuRPACljyo4
         aJYtEhIzpkZ3WRaxb2awr/50mwU9O74tfRxlMO3Ne+ecjkTJi/uS3bXepNmrVJaXCp5y
         8EjHJ99nCJv7jb9wz5nwG1RKzI4Pqnaty47yHaSt+i8jgniK1Ga8vRLIIHV2Gt5OPz1j
         BPfTfSwBD6oA7aLaytXjOdb19C8GqLSFmMKayJmYp7jcrib9mFuYgbM8gevyLm5WpqIZ
         xIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762167608; x=1762772408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpHUHIGvdwtem1dm7tnuXAWeJp+wNTqFDuQLWimKqFc=;
        b=VdcaXOxHmLPp+nk8Axk4AY9g2b9Fv20anwPArWU6FXelxz2qa/RzTkFW+I8nj1sDxG
         I0lO29cGbZ0HFQ6VPkSNca91Zr7tH3C6QdeFFVhlwseu1CaRz8ZFQixy1HrhqWsK29J3
         knWoccq72lIAniQesHk67mho3VHn9GSRRzWxBDXKJ244oQXVmKUKFbbasqmbbtxDqL88
         LZmvgi+YKQ78dFpOfbkWYNCtjIN0ZtwxZI7ZrVp6Rmcu5OzS9iF58q6mn5FNUVM5rVXG
         zle+4LhAxQDpWPbSwbs0qWxpWrINKGYZYVplefUuQlxEPXuBkj1weT8BBCA8pdZ3Nvbd
         uVsg==
X-Gm-Message-State: AOJu0Yx248whNQ/G9EmXdRNoOY1zqnR2+TuypMBSz/LIqsvqu/AGdQQX
	+HAnHX7/A8yOrzbrjyihB4HtkMlozpBxGCxHQbobnF9bU+chqTIB/0hrJ8t3ZsebLwo9+Snqqn6
	uMm6hdQ3FlwHFyalWlJsZaJkDKqPPIXyfbw==
X-Gm-Gg: ASbGncsnmonjgOm0DIBNK6KnQXX1CsVx3lQ2DJx1+M2eg8ouLNDVxd9UOYIw+TxVzV7
	VFgv14U0EHDZkVIgJ6UnzxLriE8szMKxviuyA8tFtjlhteQiGMZtFGqEz46obmPn1V7ypeaFDna
	3tbFsbIFMTZBHAueTLQSGz2NHthRivF3XUvLdmPJZYGFx9B6+SLVkMs8JujaDRYFd6zy6qFnvfI
	ecE12JZNQzk5yoVYb4Ns41z6lIJfNquofrazgx/7Wf6RKbHOrZN9DVUO0wWC+rkOowT+JqvWdBp
	tyegWvJ3u96BHP+4Pyw=
X-Google-Smtp-Source: AGHT+IHVj60prpULSbrpVMQBx7WDI+cWKEbboLBujByMUP2h8hy4QxuEHC90UuVza0RvF23JSuFE6O4aiHGCKO1/hWg=
X-Received: by 2002:a05:6214:1312:b0:880:5edf:d135 with SMTP id
 6a1803df08f44-8805edfd4d8mr4201076d6.53.1762167607600; Mon, 03 Nov 2025
 03:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20251103022936.10673-1-gordon.lack@dsl.pipex.com>
In-Reply-To: <20251103022936.10673-1-gordon.lack@dsl.pipex.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Nov 2025 11:59:55 +0100
X-Gm-Features: AWmQ_bnzan9AmjXRXLXhR6nYtF8acT1JioMYukPnpJ2KlqE2ByCVikNEXs6Dq1M
Message-ID: <CANNYZj9FMJEtkhTo7eDunqNpQXfa7B-ZFfLF6tkwoPFdC2Oujg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Avoid running whilst in a deleted directory.
To: gordon.lack@dsl.pipex.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 11:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225643

On Mon, 3 Nov 2025 at 03:29, Gordon Lack via lists.openembedded.org
<gordon.lack=dsl.pipex.com@lists.openembedded.org> wrote:
> +# ${B} will have been set as our current directory immediately before
> +# do_configure is called. So let's avoid any problems associated
> +# with it being deleted from underneath us by moving to somewhere else.
> +# We're being put back there (the new version) at the end of this code
> +#
>  do_configure:prepend() {
> +    cd ${WORKDIR}

Placing the comment like this isn't great for readability either
because it detaches it from the line it's commenting on. So the brain
needs to do extra work to find the line (yes, it's the first line now,
but may not stay that way in the future).

I really do think it's better to place it next to the line and indent
to the line. Indenting comments is the de facto standard pretty much
everywhere, and changing it to match your preference in one place will
both introduce an inconsistency, and not actually help you read all
other code.

Alex

