Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFDFCA0EC0
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 08:52:25 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.43586.1754902340176240179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 01:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SEHZ81o5;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-7074bad053bso55883636d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754902339; x=1755507139; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=smnWKVaYJn/qSTIyUKTxCKRYS0i61fSdMfjC84XllCw=;
        b=SEHZ81o5d9LKdpSP6cGFbqUTYaVxiOkmzqJqTRPh5Brg+R5KskATECGyw4V/lfAiXI
         5LIRtQtiIL5GbvlYY1XupK9PEaPWrKpdklNS6XQNi5J0ZaTnw7xkygm0pj5NbyaXse3G
         NjWTKa6hUR9CCcVz3I/+pFQMnqbkGImr9ejrtBHjhgpESrQ6SoC92poM8ri3MU3geqLN
         Rl6wU9GVBWOpULqFe7zGd7XygJlRnnQYKCkpizP+CbdqMedzlLPlT7WrXdtry6zWehwt
         G2Azrf5HGJsUyJnuqm3VRVcEIp1ci9Mr6nHQjsX0pdiaYOSfBwEjRIVbQpWwB29EsXm9
         +95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902339; x=1755507139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smnWKVaYJn/qSTIyUKTxCKRYS0i61fSdMfjC84XllCw=;
        b=FrimKLPn6LE0JONZI+tWgIgo+UfF+Ch1SnaQ+FV3HI5srIJsTfXvhnxH1l1RwPuXcu
         B32ZZFlyhd66w/k3F4xvuYp2Cxf2CGsAcE+Nn/2tgu304yM3LFxOouks/fUkZbyzbDnR
         6YiH38PXt7wFkfdxargN8vYW1gn/vim5jvyXwdu/oUTs02CYoncl8ROHucPjjKCcOMsd
         IrizPGhxh5qcEeziDM2p594PBuxi48IIQiSmQQLgu3nEroGOZa9P2dk/pFio5k1WM9If
         VcGYYFErXlK5L3ukT2aS3/29OIEYUNvhqjgaebcA/7647iPXbB5RM/70oJQnAyGSPwpl
         4L+Q==
X-Gm-Message-State: AOJu0YzFqDyDSwjDicbJAx0Pi8L772PjPMbDnFJ6rpdQaub63CoZIv3H
	bm5TjUg1MhocJCxmdaH+17zstvYQ7cj4OCbFlLJGCWSwhgH+9u4/b+mep/AJmGpIIJykuJw7MKn
	AMscn3FFD6bF5+Z0skHFosGSidAdnGhQ=
X-Gm-Gg: ASbGnctIHzVYO6Elf5GF8wA9+is2q4mhgQ+yojD+dkXPYHPR6NO5IPkJ9nTNnzLf3gf
	Te3LIPCxLMeB0RRqraoFMy77gj7J25qs7i70l6E17e2edEz/eU3oZ1lRchwQU7jicPMpXzFIN/8
	K8kLn3xEUHY2E2L87bYPyBJ0ZotVjlB/7Prs0xoSb6B6t48r46O//1/KXx9oVh2zPuab2HTm9jL
	GGY8iQ=
X-Google-Smtp-Source: AGHT+IE3RDw1c49G5rbFyt/TzHBV8ekMxwASyBZo3vAYGMkeaFqfD9M+NJMKPZtxC7mDYHHfaoy+LuWaj4kVB9xRGM0=
X-Received: by 2002:a05:6214:ac6:b0:707:4cbc:34b3 with SMTP id
 6a1803df08f44-7099a2e5e5bmr172751346d6.15.1754902339144; Mon, 11 Aug 2025
 01:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250808144958.1005928-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20250808144958.1005928-1-pierre-loup.gosse@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Aug 2025 10:52:07 +0200
X-Gm-Features: Ac12FXxoZaVghZmwsfONivMtHaHWXtsCkfQfsRg0ZPFXK24cY2i-uOgJvL5caBQ
Message-ID: <CANNYZj_-Mo6tvLj=HHdpjYmByBC9iZBoSZGomJ3RDyHR6yoR_w@mail.gmail.com>
Subject: Re: [PATCH v2] wic: add --extra-part-space option to set unused space
To: pierre-loup.gosse@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 08:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221729

On Fri, 8 Aug 2025 at 16:54, <pierre-loup.gosse@smile.fr> wrote:
>          part.add_argument("--extra-space", type=sizetype("M"))
> +        part.add_argument('--extra-part-space', type=sizetype("M"))

I think we should just go ahead and name these
--extra-filesystem-space, and --extra-partition-space. Rename the
first in a separate commit (grep its usage in poky/ and fix it up).

Alex

