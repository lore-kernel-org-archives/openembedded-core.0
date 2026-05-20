Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66E1CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 09:14:03 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8180.1779268438440802172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 02:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oZOTr8eb;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b9f2295a9dso53505946d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 02:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779268437; cv=none;
        d=google.com; s=arc-20240605;
        b=KdVQ1d+gixKqthjAohJzt4MRKSKuaPZyqQgYfxQki3oLZNXGOVwSJ+dcxzgX/zP7nM
         MijciyWOdFy+XEXITYJ73yMJQ7f8ldUeSSCB0TA125JgM+49ExrEKJieU+Wem9whthwA
         tl0lLK4cG7bHeiTj27b1N2pRqUCyS+wepHVSmUwS+YIyy8PwHz86PbrYYWp/aGaVZRhl
         090CVatoT1eQKIrIikdJvxgrnMgtEUCG5bQ/QYyl+KhM6Lx5+33EbcXyerWYpd1riD6I
         bxL9UebYYzLX2kp9HPojIIy46M5hBUQiZaeXAdwInZBGLFHBpS8TQ6E6Vb0rc7svFtrz
         TFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J3ylQXQwTSDcg3mMWrLHDfgcLeiQ5A1YMAv6SxspMek=;
        fh=7DL7UEsHMekY9E4wZ9JAXUtLc/2BYd49JNsc0gceu2k=;
        b=R4URpP+XQMlyAKNwjy4DwVnwXWpvsIq2R23lBe/Lh42ny841A7uiZTDqDa78jMa568
         DJDtvIERmuB+eF5w5rhhJzJYOHWCIhVOp/pjUpjzqzpBYFd7vlMdMegMv0Ksa9xVzlXU
         JEyZrSoVNGxl9IeERlYg8GQlPODxfeO2Jtra2V2emVjJJA5n4Yp7W9E8nDk4LplUAiOS
         4iGdyVvuy/KZASaY5unhnpQLAYp9b0B+rW/nPQFAR4vuClMkgDssBn6LO3zLx7Pu+xxH
         Rc1V3/8saT3R5AngO1Th06ZIM1vhB/T2TIYh2SexmnsHRPRbaIJ8J1SLjBsAPyprNl43
         9q4Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268437; x=1779873237; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J3ylQXQwTSDcg3mMWrLHDfgcLeiQ5A1YMAv6SxspMek=;
        b=oZOTr8ebA3p9OeSDq6gN0ZtxzkCKcPde+/WfHclck1VzYQ6EhnaKjnMcBtolnbXkRY
         rIoMNI7cEvEx2YQDRWIObXAlbAOvmXByFpLrCM4rqg/owGojXo8P46iI7/ePRJVC59Z/
         uDLzXulEQpgctm6/43UlKL0K/iE4eUjifi06p5MRJSz5NP3CSDeCqK8ky66OZVgZN8pn
         zleK99SYdrlcJGeYh87Vu2MWlVTMfXPGzGnKirq4kNgZMlaQaApwlRe4KobMTKMUk/JS
         rfTQo0J8K+mv8MaHpRgeVR0K7xhfcHzl+7Ht+y/92Z+b+KpgyE/CQExyxmixGzZc78zi
         BG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268437; x=1779873237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3ylQXQwTSDcg3mMWrLHDfgcLeiQ5A1YMAv6SxspMek=;
        b=sGzahAKVdFyrdBDzGMs3rMta3NjZMuoWFSOIBwkiG6Ggsdm+6GaUXB6CijPOh3FHen
         WUs5fL41fDkQR7A94c74H/QoE+z0ebb1ss1cTbF63kL9jkZjFZFH04xH+3jaXQRqvrtt
         UeNXYJmvsVA5VTXx41//pIfnGHSE7iYjRlzLUaOh+PO3WnJ1NeMdSHjbW5X9r9F9YSVu
         PFMleOniHhgoOb/gHO5RosVMbSK7ULkZvhVUCkoTYgeLTdh9TFMJ29I1kvn16gxryIWg
         f7H4mcZcuMeDfIMl6m7IE4HxtPDxY7QZuTitTNqty711nGxMXnuh3IiYvmiHh1wuNbIm
         gpeA==
X-Gm-Message-State: AOJu0YzSgFasSNtRby4ijG6UH5RCEtpPMgBzCvLTArVjVMyFQLSkhYPQ
	YxsHOj006w9zCYRSNo58AeQLajbUiX0uB+WSJ/b6yVk6fd7o17CkTjMW4IYlkwx5qDlsQy0hZ2Y
	5myvrjMCSW0iOkWpsmJOBJux0bQwKmpY=
X-Gm-Gg: Acq92OHAI8a9EaEudKzihRE5qJWMFUL6Qe62J34niXVSmHWOoVvJVKXk5rEyrJ0sOYp
	xvs/xF/FX4a8B62T2Milww/91gFwgwAO8xVR2eRyaJ6hZo42Ouly1tpKowG1FnIAopudn6Gx+3D
	mckdghJdISlrxbYIFGo4DcivGNR9iB3JsVyT6uUH2y3PBh8+xZYvOg6jblLGDroDRjaFtG9fMyP
	FXY8AJQHQc5SUmV4TdA9gosGVz9yT2Ipv7HbAG/7GuxuGrPXBnWnAUHWe8HH5Nq3g/LwemK75X0
	G02oixHsMPPdgIMnyEnRNQnu0DfKAN67cnnJoeh1Sg==
X-Received: by 2002:a05:6214:6009:b0:8ac:ab13:8f0a with SMTP id
 6a1803df08f44-8ca0f666aeamr340486486d6.11.1779268437312; Wed, 20 May 2026
 02:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260518142235.2077-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <20260518142235.2077-1-peter.tatrai.ext@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 May 2026 11:13:47 +0200
X-Gm-Features: AVHnY4IRZ7AfuldQOqS3HSxTBWnrecIGyGB9HnIzL5uCSpIqvLZPBxvKuXLnuIo
Message-ID: <CANNYZj-8SYSgtmWSvDqQ6f9TnrvkE5rXFhcPadd0Jb_S84PJ+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] testimage: handle missing boot log file gracefully
To: peter.tatrai.ext@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 09:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237435

On Mon, 18 May 2026 at 16:22, Tatrai, Peter via lists.openembedded.org
<peter.tatrai.ext=siemens.com@lists.openembedded.org> wrote:
> QemuRunner writes boot console output to logfile + '.2' (the primary
> serial port). The primary logfile path (without extension) is used for
> the secondary serial port and may not exist if QEMU does not open it.
>
> testimage_main crashed with FileNotFoundError at open(bootlog) when
> results.wasSuccessful() returned False, because the file was absent.
>
> Fall back to the '.2' variant when the primary file does not exist.
> Wrap open() in a try/except OSError so a missing log emits a warning
> instead of aborting the task.

Which are the conditions that trigger this? Presumably you're seeing
this locally, I do wonder if there's a deeper issue here, and trying a
different log file would just obscure it.

Alex

