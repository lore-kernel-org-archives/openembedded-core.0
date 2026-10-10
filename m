Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C1BCA9EC5
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 02:07:43 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14196.1791657672511276456
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2026 11:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X8UsCZXX;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: collin.funk1@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917a4b69a79so11972906d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791657671; x=1792262471; darn=lists.openembedded.org;
        h=content-type:mime-version:user-agent:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qnn3sFp2ovTBtItTvjPTMc5ioy5skye5XfJ3LfBHyc=;
        b=X8UsCZXXd8m2gBxgmuqxBQVmJQIgVGSSHD0s9xl2nfMnFkBKT9vl2pt6BnV8SXoXTA
         TTJ1ZmcO3g5JWD2puT2wKyI4+DrMIUAnGiggi87XvpRHIQ/TJxmos8yDLE8B4rcnajkv
         vJnsUa+lb4gqWcSCBN9p00RYpmUfVz2JiKP/0xGXWP/496z1rmhP9Jvmr2wq2UQRCMqu
         PkOmeXUQHgxu5rzwbVMcQolk+FoAmlo4+nm7+KJm3EIX7ciekcRrwqbUT/B+dl13Pk83
         1+P9Xr3qBmPFxRzyMZK8gv3Wfnbv6J4ry41wwUAdZGBMZ9cxyZht4qIIrQBGzgD1OAG3
         JzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791657671; x=1792262471;
        h=content-type:mime-version:user-agent:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4qnn3sFp2ovTBtItTvjPTMc5ioy5skye5XfJ3LfBHyc=;
        b=m/ZXyKGEOxkPZY8LyzRmvO0q/HZggybXU/Zszdy83fKVgkr5B1+8te+B/5+DgjwRPV
         agBX1kntpEuV37XbNvblRjY3AebxOFQPn8M2WR8rhGE0CYaD5XuihJ//x8kBA3wHpGzX
         m/i9t47lQUkzzhihdJHew17QQ4E3W01GyZtaftTlZ1sS9DaRD7WU/qz1/l7UvpLyB0Yo
         mDLm5A5GdX67QnwZqWojgw1xWt2MjJBEgXPeDG/OJpGJ2ya1gG6q6WuM3D/+NT6BXu59
         RXtDVuUQGHpFwEVYSPO8+bg7GULfQDJDMMLuKEh535kCQD4mz8D4ltAxzBXXXANS7zYO
         Tjvw==
X-Gm-Message-State: AFq9FYJ8T7x57wv4U9f+JnoN4P4KC/XNklpg+KF+VrP85pWr5j/sWvtu
	0HcBQNJGkXMNWrPHeH089AsL4aQ0MwWc20ae5REBbMHjZMe6g48LUPodeY+8Eg==
X-Gm-Gg: AYBFou2H6nBy1x3ea/H2WHMoxR/FMe0xDXMQ6+vSIGJg+APc3oVpzhxxf10p38PaOGZ
	SUWLHAdl55hwabVzPUnZEp38OpBFVS4Owcl5XMS4XWORzaJSxb480R8vlDD3OmU/0LaUo6BDt0p
	USjwxHbmMizm3QPdASkkg+2BWhqo8h9cKROin+aC5Cngb0ZekQ5nc2W9kCOLeeBk+j3q4shfcvy
	SUHnfZqCkrwgITSjvDlXj5MUzOiB85S8JhVV2UG6zEsKWyBJUTM20tglgGLfxSJLsuw8uNhKEMj
	VMpLYwJQanhxmRDkUxD/eu6Tq6+lFfPUsqic9J1NAZpkA7FuCVy94vtm/3PUoVqqiqGS0lHmzxg
	zWNSDZnjzh2zgR5gmFXQv5u19M6G3GrpBw8BSwA3RXlwSOBUL9I6IoGTtZRL88fqgwXnlEk6ghV
	rsfSb2OLviYcLKzcfeCoJYAUQRMfZAuexdA7GLc5nxiSTxVW8fHrND
X-Received: by 2002:a05:7022:290:b0:151:2e62:fe5b with SMTP id a92af1059eb24-16a5dbfd567mr8096684c88.22.1791657222804;
        Sat, 10 Oct 2026 11:33:42 -0700 (PDT)
Received: from fedora ([2601:646:8081:3770::61a9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm31991266c88.13.2026.10.10.11.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:33:42 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: Re: [PATCH] uutils-coreutils: move from meta-openembedded
In-Reply-To: <20261010113029.2347847-1-ecordonnier@snap.com>
Date: Sat, 10 Oct 2026 11:33:41 -0700
Message-ID: <87pkxh2ynu.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 02:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247503

Etienne Cordonnier <ecordonnier@snap.com> wrote:

> uutils-coreutils, the Rust reimplementation of GNU coreutils, is mature
> enough for production use, so move the recipe from meta-oe to oe-core.
> It provides and rprovides coreutils, and is excluded from world unless
> selected as the coreutils provider.

Total disregard for the requirements imposed by the GPL is helpful to it
being "mature enough for production use", of course. See the downplayed
mention in the 0.12.0 release notes:

    Also, some contributions had carried comments and code over from GNU
    coreutils, against our own rule that uutils is an original
    implementation. We reviewed the tree and rewrote what we found, in
    comments and in the few functions that followed the C too closely;
    no behaviour change. The GNU coreutils maintainers have been
    notified.

> +SUMMARY = "coreutils ~ GNU coreutils (updated); implemented as universal (cross-platform) utils, written in Rust"

This summary reads as if it is trying to claim that uutils is the
official GNU coreutils project.

I'm not familiar enough with openembedded, but a concern raised by other
distributions and me is that supporting two packages as "coreutils"
increases maintainers' workload because the implementations are bound to
diverge, requiring otherwise unnecessary code churn. E.g., for around a
year, Ubuntu 26.04 had the following:

    $ export LC_ALL=en_US.UTF-8
    $ printf 'USA\nU.S.A\nU-S-A\n' | sort -u
    USA
    $ printf 'USA\nU.S.A\nU-S-A\n' | gnusort -u
    U-S-A
    U.S.A
    USA

It still has the following issue [1]:

    $ export LC_ALL=en_US.UTF-8
    $ echo a A b B | tr ' ' '\n' | sort > tst1.txt
    $ echo a A b C | tr ' ' '\n' | sort > tst2.txt
    $ comm -23 tst1.txt tst2.txt
    comm: file 1 is not in sorted order
    comm: file 2 is not in sorted order
    B
    comm: input is not in sorted order
    $ gnucomm -23 tst1.txt tst2.txt
    B

Collin

[1] https://bugs.launchpad.net/ubuntu/+source/rust-coreutils/+bug/2169780

