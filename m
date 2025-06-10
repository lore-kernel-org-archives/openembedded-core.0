Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025DFC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:58:46 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.83412.1749549517460084057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NpZm2SmU;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so51641896d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 02:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749549516; x=1750154316; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z703tl6WKECCGi99IY4RowivY0OLo9tHRp356txVl44=;
        b=NpZm2SmUozjknKbKijthcdjj0zwqbPx9M3pmDdsa5cw+S+1kR56K3y4BkQ/ScCwaZG
         zFNTBdOWIneNlTAouAUS0jqDaUbgWmbaB3k5wDLhxnmd51ZZa+ImQ4c+PqnxwYdzJb7Z
         XI8fljJm3Cs3AsOfvt78hjnZ4jf7NhxCSdMjVvMt1YnWZPmLeSZ8paLJQC4CzyBLmycT
         ke1lyrQCol/YG9xHEnL/DhtlZ7V4eDoKuQTLyVRHLL5k97OPvGcIhODjJH+ZaMN6eSnS
         bMap5JI96OJ6hUL/WPeaThmKC83AtxIi+Uh+03wMFSHpB/xmWEF4K4En/aJH6mk1bNYw
         0+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549516; x=1750154316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z703tl6WKECCGi99IY4RowivY0OLo9tHRp356txVl44=;
        b=J/yVfjnlmyOgtndRCKih4Sjki2vehq4J0GiPuQrDLWaipa68+2455eMeO+L9SZRwSc
         oMY99QA2HD3zgd5x6Cq0M9UINRDDBy+CzuiGgfIKZIBzQLrjvrMBaSOg0GGKc0iXMP35
         wg6KogZcZR1M3oFkJrJfOjW3UwY9+fCGaoqi9iZiGkLPEy/aGvL+cFK0bE6Kn8tGGqJG
         E+4aWr/I/q9JSV0baFA/aWw77+9Z4+W1RILFXfSV00yTd+Qqasph9YgSkSsFmtyKDUAn
         XaBuvoDaeeeZ7uEbtYC+HHTM8JrSD96KiIGLREs9vJ9UTELtM66pqORSQ4c0rvypEn+W
         TkmA==
X-Gm-Message-State: AOJu0Yw7lsOYehCXJ5k5ee84CdXyIHgPya93horHTxUC4ZBep030fLAn
	Ie2jGgm1upu5hOFDMfDM/iqrSj9yy+qxey5QxCHzs9XGQcdlTqC6ADSYwS3wFPJ6vFYhPQIFBw0
	9A4Hf1V0QlUhFa0Tl0q6E/wOzIpv+PvzUPQ==
X-Gm-Gg: ASbGncvq1jXF+Jvqyk+YpRoYJdbAXgafYkLvfIs9wwfhbFNyWn/kAw2x7UTqfv9/R1G
	Z3XLTD0KQa5rPwJX8QiYIYWPltK3AnlgojHgtKFxAgIbASmz9tFaY46JJTH35/nqaudyHKvrQfV
	M+3VVXfxezxDHCl/Oex1kK7PAjthzamC46V9HPQotosy9rcYEBTWzAfHC5izxym9bR2PFYLQvr/
	SqGpA==
X-Google-Smtp-Source: AGHT+IE3KfqCEvT8MloFYVOrgyfo7nezjdPFtKnJxLNj9v9MXvG1QAsmgPmC+nbhiE0MHHKxe6nUplkpfw05AJWT97w=
X-Received: by 2002:a05:6214:d4c:b0:6f8:997d:fc84 with SMTP id
 6a1803df08f44-6fb08f60871mr300961236d6.19.1749549504671; Tue, 10 Jun 2025
 02:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250610094400.1653931-6-alex.kanavin@gmail.com> <01010197593efa0f-c0b0db44-1b19-4060-aec5-a3b2384eda38-000000@us-west-2.amazonses.com>
In-Reply-To: <01010197593efa0f-c0b0db44-1b19-4060-aec5-a3b2384eda38-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Jun 2025 11:58:12 +0200
X-Gm-Features: AX0GCFuVwTP8nORnF_09FCnfo0EWQFnca_6uT0ekeAyTHcDjNjggcaXw6KGE3vk
Message-ID: <CANNYZj9UcNjzC_=+b9EzHHbUKig972NhAzhJ30VSNDgDvgr=qQ@mail.gmail.com>
Subject: Re: Patchtest results for [RFC PATCH 6/9] meta: set S from UNPACKDIR
 in recipes that use only local files
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218339

On Tue, 10 Jun 2025 at 11:49, <patchtest@automation.yoctoproject.org> wrote:
> FAIL: test target mailing list: Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists (test_mbox.TestMbox.test_target_mailing_list)

One of the affected files is in meta-poky; I'll split that into a
separate commit in the next revision.

Alex

