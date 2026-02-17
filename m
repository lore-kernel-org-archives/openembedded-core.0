Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE98E83844
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 13:13:56 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11563.1771334027211840774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 05:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T6cT/bN0;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cb40030be5so436863985a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 05:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771334026; cv=none;
        d=google.com; s=arc-20240605;
        b=V7SGKe6IG6mhcqxEGF4QCpWbYuR023hsl+xHl16awXCzMj7QK8L/z2nMupyno5ykcZ
         9poiVilDTRUp2q1g2vVdsHLewXsQ9ddPGGJWZdvuj75z+KWS8SKDeniDFG7w1eeh/cGm
         jPVCfN6mSWVZXfJ3tnFZ4hncLqhWgFQj4yUFCeD4KQw6DNxqHBdWwNBhDKfvnVxeTicQ
         sjpdE3aiBfpCnfaoqOE5b1TgsIC1WnFLbPrJilEx68YV4MXaI5I6sLeM88oJaNhy2Vgu
         4mLmzW6RDdYN1wNzzi+9YzV/qUWS/i4jy5aGbeNCyY1PWln5nw+mohO/2fEP4hDIRb2f
         XENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f/436YxtyI36sKMw82EwML8nf4qRRlfEzeCOjX9hKz8=;
        fh=jHh0ej5zp30vYaJV4KDlYgB0juxnZdJDll4eKYctdiQ=;
        b=eEuwCVl/HJ077EFKyl24DK52MskfiUhJkGsynard5pRmGLk89tf1ooae02COKPcfJt
         q0u//Q/yBqVEotpBKMSwIFTq8dHzWJsVH7hJrJUS9fRUJELESPznAxSoEJtHYPnRed4O
         cUH/a2K89+I/V8L7a+PRgXhd64qCaAe+Vv8Z8MA8CJ7O/N0GXnD39QWWR5bFZEhSDSlg
         jBsTLZYPnlz4bslG8M4W3K3zZlFYUlpzaTPhxJzHInn1FW1exDqX1MnjDtfx4JIDtvOo
         G7EigAjNUbPRh477Kzj7JgPh5ENjVqMMat7tZonYkN8R+Ba0E7LHliE17zKHnTLu7GBg
         a0JA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771334026; x=1771938826; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f/436YxtyI36sKMw82EwML8nf4qRRlfEzeCOjX9hKz8=;
        b=T6cT/bN0E9Tj4A3gFdvZ+QHvO9lCAtBXEZzzTBU/yV9mf88w+4VBb4jJueYlfQIFhx
         nY9gnCQWc8JuDowmnU05VicQqTa6XZV7hZxjW+0zARMnRyxy61+OsslR3nRRvYdzCtyU
         E/G70HB2fUhnB+BHQ2mmVuaL4BbmAcSoU6cz1OLskU36DhZ5n7ox/BjSaOidNd1QTUFO
         51qkS2u5+yX3uMsiyed/T15wL+EYd80zRnyty1kPf+K2q0j1oocmHqB3MRrTZzFBZoiJ
         PBVtCg2vahpluXHJNZ74PfQUdyh/RG6IhN8HZDmqWcpAHh2KOLdhytyffal7nop44Heq
         YzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771334026; x=1771938826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/436YxtyI36sKMw82EwML8nf4qRRlfEzeCOjX9hKz8=;
        b=F1GClQ7SXe0pQHwrvNyUUNnfKLQybHrdayqx9HYByhm47MD70uAjV7qXOhtenExgsz
         G/BbOT9BGx26m8q6dr4JmK0OSod8349Yhwp2SvZuTpCx0IFgJ7kpWl3Sgsni0gQjZaVU
         NI4bOlgEYSUugfqFRBWKovScLwb0ePgeJ+ZaWcMFbk2S8paZEyC6pcpdBXKnJXSLOXw7
         aJwdA9UlqbDGKvR4n3IAdPlzQyyUcjaBd7KjxpZsIy5XfGl9W13XXpV+SMGpI7pomtRe
         43nrXl8TNq88tH6YWOdrU9ZW1p6pHiD2cTO9W687b693H5Q36w3qFhjHIKWBi+Q85T8D
         usdQ==
X-Gm-Message-State: AOJu0YxflRuomBL2HMqyjUkehiyvnECZYfo9xv2Dx73y8bHYzJBQMirW
	sbPpzHLr3WIgsioN9ARlpce6T7ogXJ+FUN92Zgvk0qgosjt4/L4jRBU5twOo0UTDb/Lk7jrXQJD
	8IC1OpSG8IMYFdH8hKTpyVYRoo5Op7ag=
X-Gm-Gg: AZuq6aLQ53RAT8bjJCBNLnUWtL3pbse3NIHAShcKnayL5069dSyYPgR/8LlU+f6ImbQ
	5oa4Nv6scUDn/ZqwfrvHAEJ9jtpROUZ+aOcOwsP5/jfBpLzok51AtCH4/2O489tJBSdIzY5MgJc
	jPZo6EnCCW3hRd4kD77zGX/KmR6NftjT3XrrNEdWJX1SWLWV3bFSIsOOmr7tiHTV5ncIFAN8IeJ
	ZIYr7OLs6SKiuucfvXyu/cWlID4YnUBC0ayT2JRusmk/NKvhhxxj8WdOmB5eewIAwcSJhv/Ul6+
	C3d4Qx/sodwwHTEedin9Jn8Hj483HKnMq7bStLTHrQ==
X-Received: by 2002:a05:620a:4151:b0:8c6:a8f8:9645 with SMTP id
 af79cd13be357-8cb424abc9amr1635062185a.90.1771334026199; Tue, 17 Feb 2026
 05:13:46 -0800 (PST)
MIME-Version: 1.0
References: <20240219012832.3090768-1-pkj@axis.com> <20240219012832.3090768-5-pkj@axis.com>
In-Reply-To: <20240219012832.3090768-5-pkj@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Feb 2026 14:13:34 +0100
X-Gm-Features: AaiRm50WqYBi4XHiQ1Jvvk9QVeOILGnQB4FceFCXMxSt5b9pYRfTWmlDLSzpd3o
Message-ID: <CANNYZj-k6i0nZkSibyU+UX741NAe4j4ue04vjrs5Nnn1t3zEkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2 5/5] lib/oe/patch: Use git notes to store the
 filenames for the patches
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 13:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231252

On Mon, 19 Feb 2024 at 02:28, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> +            target_branch = revs[os.path.relpath(path, srctree)]
> +
> +            # There is a bug (or feature?) in git rebase where if a commit with
> +            # a note is fully rebased away by being part of an old commit, the
> +            # note is still attached to the old commit. Avoid this by making
> +            # sure all old devtool related commits have a note attached to them
> +            # (this assumes git config notes.rewriteMode is set to ignore).
> +            (stdout, _) = __run('git rev-list devtool-base..%s' % target_branch)
> +            for rev in stdout.splitlines():
> +                if not oe.patch.GitApplyTree.getNotes(path, rev):
> +                    oe.patch.GitApplyTree.addNote(path, rev, "dummy")
> +

I've been wondering why devtool version upgrades in recipes that fetch
from git are taking significantly longer than they used to, and this
loop is basically the reason. It attaches a note to every commit
between the old and the new version tag in the upstream tree, and if
there's many such commits, it can take minutes, or hours. Things came
to a head in the most recent AUH run, which had tried to update
binutils, and was stopped on timeout after some 5 hours or so:

INFO: binutils-testsuite,binutils-cross-x86_64,binutils-crosssdk-x86_64-pokysdk-linux,binutils-cross-canadian-x86-64,binutils:
Running 'devtool upgrade' ...
command timed out: 16200 seconds without output running
[b'/srv/pokybuild/yocto-worker/auh/yocto-autobuilder-helper/scripts/run-config',
b'auh', b'/srv/pokybuild/yocto-worker/auh/build/build', b'master',
b'ssh://git@push.yoctoproject.org/poky', b'--sstateprefix', b'',
b'--buildappsrcrev', b'', b'--publish-dir', b'', b'--build-type',
b'quick', b'--workername', b'alma8-vk-2', b'--build-url',
b'https://autobuilder.yoctoproject.org/valkyrie/#/builders/38/builds/54',
b'--results-dir',
b'/srv/autobuilder/valkyrie.yocto.io/pub/non-release/20260215-30/testresults',
b'--quietlogging', b'--stepname', b'cmds', b'--phase', b'2'],
attempting to kill
process killed by signal 9

I'm not exactly sure what issue is being avoided here, but we can't do
it like that. I'm going to try and drop this code and see what breaks
in 'oe-selftest -r devtool', but if you can help out and come up with
the right fix, that would be very welcome.

Reproducer in oe-core master:
devtool upgrade systemd-systemctl-native -V 259.1 -S
6a36f1c7420dcb8e5176796676047f058466fe7a

Alex

