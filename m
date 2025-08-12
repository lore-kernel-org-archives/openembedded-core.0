Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2A8C87FCB
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 08:18:32 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.69586.1754986705595410371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 01:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TroNz9xw;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70748a0e13dso38224896d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 01:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754986704; x=1755591504; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LFZwb/A/+UsRUa/t7njGnnQADeYsyf3og9iE4BTM/Hk=;
        b=TroNz9xwoeOqPZp+0QYx3NQ0bDOpD62/hkv6mVm3+9/ZO/wQrOACjT4/1WRweRNvb/
         MP1gBoGwRvYr52SAuTbBEw+PFHYWl5sPQ6hAjOjpC3nc3qlS4ua+One/4Q1rDzFLuvII
         AimxGZ9sn9V+UAC4/rK0LIhhWogsGTFUyzN9ohPWDqjGc2Dgw8jPUS+cCgHrHxF8C+SC
         MAVQvPjgsshC8vq1C3MdJRnf0mI9+a9HC5iBv8Om6QTgJCI23VRJ2pH3FdV4M4Fpcylp
         ZLeR72Etkxa0S/CkQU3DqS4b8sQtXgEUcyxdqSvpqtsWyAxOL3qFgWThMsdRuoshcIds
         ZMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754986704; x=1755591504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFZwb/A/+UsRUa/t7njGnnQADeYsyf3og9iE4BTM/Hk=;
        b=EU8SJH7sPvigk43QlOmIEWZvZ9ceWUnu4JbJhpLOQrROG8fHFYaED3XdLZXU/70Wk2
         VQczQc3Ilp/yh0eWjU47WtBZqzidVEb3xNZD4hRn3+HMZQ0IPr95JjETZcpNita4x7OT
         lAZQPDd9BXNQNXAlgVLF2G732VAN624zfkfXUqHK6yzb0TuN7OlskGhrE7YM7n43w6Fs
         Ff7q02RHTCpzuclS4xqULY2A0y6F50MPlNXp5S0YxjPK4p4vaql5va4hQwr/tFkk0zIe
         nlu1EJJ1Y+UQekSvCVky2LU2yHC+MfBtO0DctO8pYus9JlFt6M0DY/KQvl4uj3ihUrk3
         LDEw==
X-Gm-Message-State: AOJu0YxoRu0ASf6uX/CTFybg1IQIKWhRRd9QCxnPspwREk4hs/6YErAE
	tnjfcHuJVh4dfgg6MqFSpoPceJuzIpc7rZ690YNHEsJ4znmoLr7wU9yCfDhnO9ruJ754tuzpbRJ
	zYcB1COLOeF06gwE3wC2pfye31KEIFe8=
X-Gm-Gg: ASbGncv1MLds95unqum29UHiWr5WT2O7GD91vdQWsf6iQysIcYktCrBgpVq+QckZ09F
	SeDNHGwK4KKQSaN9Hj0rEStNYqbYK4x6n/qXvw8d+RXvgfiVx08ULOww92NjpkKvEVVpULfkThi
	8UXtGIITASyQRPWDEJzKOM7Ax5zxbPHM/LBCrFrjzc69AqC9i+jmjMHtbqdialWkTbq5kT81mAP
	9b6YOYzKhD1B7yHDbUD8hXZ7tsM9IqsGEK9vbXLrZzAZ/mowoTC
X-Google-Smtp-Source: AGHT+IGYUQBmXhUkUj/ljq1v1P4A42HU4OBoWNPndiweFzZAQ6UNY7gP5COrsSQMRs00QCTN8aM723hx/G5/O9NNNFM=
X-Received: by 2002:a05:6214:809a:b0:709:e075:6aba with SMTP id
 6a1803df08f44-709e075807cmr6001566d6.18.1754986704467; Tue, 12 Aug 2025
 01:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250811105115.33419-1-pistora.tobias@gmail.com>
In-Reply-To: <20250811105115.33419-1-pistora.tobias@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Aug 2025 10:18:13 +0200
X-Gm-Features: Ac12FXwd6MmwTp47Q_gJADSwR30ovV37KdlN4kePEGd3R5GVtmeJ9scNdPCa_yY
Message-ID: <CANNYZj80tDdHhwnPBd2g6zitmvDjVgb0tKR9PE_71td9g_h3Bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: fix upgrade for recipes with git submodules
To: pistora.tobias@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 08:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221756

On Mon, 11 Aug 2025 at 12:52, Tobias Pistora via
lists.openembedded.org
<pistora.tobias=gmail.com@lists.openembedded.org> wrote:
>
> Fixes [YOCTO #15943]
>
> Fixes invalid path argument while calling "git rev-list" from submodule folders.
> Replaced the local __run() wrapper function with _run() at "git rev-list" command calls.

The patch is fine, but would it also be possible to add a selftest so
this doesn't again regress?

There is already a selftest for upgrading plain git recipes, but not
for ones with submodules:
test_devtool_upgrade_git() in meta/lib/oeqa/selftest/cases/devtool.py, using
meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb (to
avoid stepping on a recipe in meta/)

The component with submodules could perhaps be vulkan-samples.

Alex

