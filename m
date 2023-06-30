Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9686EB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 15:08:18 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.14826.1688137688547264684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 08:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=smzTLvnc;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fb96e2b573so3336852e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688137687; x=1690729687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NmhS8/KpNgEzsKBrEJVz+8R8JvsNddhjFFxp97bvk9E=;
        b=smzTLvnccAZkjUCPdsIrOqE5c5f6o0ueKxsIFrvQTIcj0yOzWXMakGWT3BEAZpqRFh
         g8jvjN9Rw3gqgwvUwSn3nfUW9yz1uVCBaPdiP9wrJaTpF/iSfpZoWstQOK6J3W8lIrF8
         Fq1AdjcE3mIRna4D6rb5AkkNEG5qX59XIm3gM2yyucmZ9ZtIGKQ23Lf0kIUCT7jmAahn
         J6A4F6AEzQZhFpn5jJP2X9PC+Cd/fnAcXYqXRntBFgSLlRF+d8tWGn+wu5kSJYLzsU1s
         z/+TZ2WeAPWEMRitGbuL3mPghZUG2QdLJl9RR7IB0UU/A9nX8aGQkLE8JqTNxcpuAqCb
         Db3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688137687; x=1690729687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmhS8/KpNgEzsKBrEJVz+8R8JvsNddhjFFxp97bvk9E=;
        b=Kr/T2rBS/9kK/Z0AZTpBJJTQlcaSS+WqzTeeGokw6eXK0hhlzutUnx5EwIJfg3none
         gZ4T/phNPnNEU3P4Jg3wsmBJUf59ZOVnDQiHVWryoQ1mOPXcXu+G5GOiynRrYbCHrj4L
         MnhznJshHDdvMeTcIR0nLdXM7T7i9ivPPS6/K2y/jL6SanFqmXIyafXKsHbbttpoffNq
         Schhpah1vbjY8f/WaT/kLzaQBl8h/9eURnmRhj4e5Jv+LogGk9UX4I5bmE6Xx2hHUU2Q
         Ow9+oWFjZv8fTLW+OdSamACv/OEAPDyFxhE4kUQf/rBd1I6a8InUCCeN+nF82xrcACbu
         syoA==
X-Gm-Message-State: ABy/qLbsKmiSh6Bqt6fYPCMRyH+l81qt8x6hDGMSDAG8bduIC9JY5tSN
	ZwLeZKReHft5C5mD7aFSslcjI5ysvV/J4r7tvmg=
X-Google-Smtp-Source: APBJJlHwkqoH7hQEUAm0xmi7Rq7xaOfuPz5taveNwK5OGdHyuGNaWhx7f8HqvuUsOLph/jQSezAgTnKuqcMUFukp25w=
X-Received: by 2002:ac2:4f14:0:b0:4f8:5ede:d447 with SMTP id
 k20-20020ac24f14000000b004f85eded447mr2830685lfr.28.1688137686590; Fri, 30
 Jun 2023 08:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230630091451.3331563-1-changqing.li@windriver.com> <20230630091451.3331563-2-changqing.li@windriver.com>
In-Reply-To: <20230630091451.3331563-2-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Jun 2023 17:07:55 +0200
Message-ID: <CANNYZj-6GkQ-udC+Nd0zyQbwKtkfrr0hNKZ-AaMEUzgnTCNT1A@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH 2/2] rootfs-postcommands.bbclass: add
 post func remove_unused_dnf_log_lock
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 15:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183701

On Fri, 30 Jun 2023 at 11:14, Changqing Li
<changqing.li@eng.windriver.com> wrote:
> Remove log_lock.pid which maybe created during do_rootfs. In commit
> [dnf: only write the log lock to root for native dnf],
> native dnf changed to write log lock to root, and target dnf still
> use /var/log, so log_lock.pid need to be removed post do_rootfs.

This is not making clear why the file needs to be removed. What
problems occur if it is left in place? Is it supposed to be added,
then removed by dnf during do_rootfs, and if this doesn't happen, is
that a problem with dnf that needs to be fixed, rather than removing
the file manually after the fact?

Alex

