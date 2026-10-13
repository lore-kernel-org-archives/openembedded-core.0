Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF70DCC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 05:03:26 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5281.1791917392242314008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 11:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CoV/5659;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: collin.funk1@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1453742eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 11:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917391; x=1792522191; darn=lists.openembedded.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uyLAc3ACIawfiX/xE0TDf1fuqU/r7ahgHRBvFzfAOOI=;
        b=CoV/56595TR+WoOO84rJwozXY1XIKLKxKAcG8w6ej0YQ3JEkk0pV+SBVT98v2UNnhG
         1zjNTN2eFyJ05QRsj6qjk5nBGmHK7iZb9k1n9EQyYgPYHY5ib36NVReVk2DweyqNvaFV
         7pPfw09LA2iVVhWYq0HRlAjmC4M4ME5D/oeJO1cghaNSKZ5fxmZerUKExMo+HGZJzbTI
         xWQBRjJgercHTqqRQQDEbEJchWhz84yRrQNUTgtOjCs/OPUy61kK5p5TJWzj/f1sUG+X
         8QkyZD//K4HInwpp+nn1Fd+N/vvQm/fa+EyVL6KvPCYkqUGhScBeura1sauw9C3qULZu
         8a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917391; x=1792522191;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uyLAc3ACIawfiX/xE0TDf1fuqU/r7ahgHRBvFzfAOOI=;
        b=fAVZnnI4g9UcY5sQ5h9CQThSu8u3RDbiNXAuKLe3vzQMw6X51km1B6WbBmwhgaTSk6
         PyByRm6aUxOzwgJ4L9uAqz9dI/dFHFF0hwmhGK6/s0WRTGtYg3m8V3KyMDnAQRi8DBNt
         st9mH8AlOJmnRkdleotodbw+8a0ubar5i22ZQIWrqVlaP37lYNqzYgOBPFnf2YTQW4GO
         1hAFJthLkBY+TpvnkjAS3bhyZNTLpCYhsDDoFEjb83iNHgLea5Hqi+16EeAFH+4utVFS
         uErFeWRdAN4//FNzCztMdY4QeI2Em8etkWH4JoRDKlcIafBNfjC301/ZRpZvyFL+k0QA
         dW9A==
X-Forwarded-Encrypted: i=1; AKwUvBzvYiR27XmvGOyHTfi4EsycyskMr4WJzqwcQ8g/6BkVgunfAM5IowjKDQjxhXlok/AJJ6UOwnaeeh4cGCXMxJVlaA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJxK+w/mCIbC5vr2uRo8K9vunSk1eYB6bARjUP1mN7K5ptQPDUG
	+/RI28PCpDRP2lIY/TV95gHjjmpWuJ5YzbPgaJAvtaYs03gPSlYGCvWN
X-Gm-Gg: AYBFou1o5g3GU+UFe59z+TXT1BSiEpmb6lkgabofOORUtUVhXnZEoYHRtp31dVnnwv7
	z+vUnWxJnlXwD9bTeqJtsWkieeKaqhL766XurndNenRHfkoGRecK//8+w4MRJrF1I5wSeqYrN+I
	V0Qs7SLrUH12KrbjUsrRE4QUxXRy/d0XZwGr/EmdyB/WpyPRgBpHrJfZN7HPnY2QOAQB7xHw0/R
	mow6TwHhyHpE8m7c/1pEjhKRFLtmLxY6wK53maNtspRNDEZqG0UmNkJGfTmcTP2449n9tjG/P7w
	s2U0Z0BvJQwqK137Goh5UVUlxD01VfImsw/2WYEA+9J/zfDvofoCtWIEjgsBPlgCd9NS4uq7gnS
	gwWJORzxCPASFxw3a647hmq8mI594qYXj8e8fWAtUzsLAW3axWlBBwUvoxZOyT+eEwGK09p4CI9
	2ULIXSODu4ZFb+2EdjyFodem9YYQrWilgmVfXU15EIul49vG68DFicwmSwyjtGIgUuJaRtQnBuP
	o8Xh8Uiql5dQVAHeRFLkIzggzUvJMJZd1FADuUw/w==
X-Received: by 2002:a05:7300:e9c6:10b0:35a:c54:f446 with SMTP id 5a478bee46e88-35a0c54fcadmr11537518eec.40.1791917391252;
        Tue, 13 Oct 2026 11:49:51 -0700 (PDT)
Received: from XTHCYRY1WD-Collin-Funk ([2601:646:8081:3770:a04c:93f9:ef6a:1ef4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm49645838eec.0.2026.10.13.11.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:49:50 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
  openembedded-core@lists.openembedded.org,  Paul Barker
 <paul@pbarker.dev>,  Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] uutils-coreutils: move from meta-openembedded
In-Reply-To: <CANNYZj-=7nx_DOHVxCvX6DSdgvK4K12-8RT+YR8H3KSrdb291Q@mail.gmail.com>
References: <20261010113029.2347847-1-ecordonnier@snap.com>
	<CANNYZj9kcJ+_Q8gEtmLYqKjwLsHogY1o4b8MeZQf6jTgDp3gtg@mail.gmail.com>
	<CAHUKmYZOUvohA9psyEiJ251a9mCnTteUDkdAVU1LEAAFC_PdZw@mail.gmail.com>
	<CANNYZj9y8xONSSQAAjov-5QSeTEkjD_iahpu-bUpn5kzGnbOQQ@mail.gmail.com>
	<CAHUKmYbEwbbsx+DeAvw+wf9AggQws0G4nGbjWe=Wp4ESxe5kaA@mail.gmail.com>
	<CANNYZj-=7nx_DOHVxCvX6DSdgvK4K12-8RT+YR8H3KSrdb291Q@mail.gmail.com>
Date: Tue, 13 Oct 2026 11:49:49 -0700
Message-ID: <m1bj8x8mgi.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 05:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247740

Alexander Kanavin <alex.kanavin@gmail.com> writes:

> Collin has explicitly said he is not endorsing the use of GNU tests for uutils.

Any implementation is free to use the GNU coreutils test suite, as long
as its licensing is respected, of course. It mostly just involves
fetching it from git, changing the PATH used by the tests to point to a
separate directory with the relevant binaries, and maybe applying some
patches for different error messages, for example. I don't think you
meant to imply otherwise, but I just wanted to make sure it wasn't
misinterpreted by other readers.

My comment was just to say that a high passing rate on the GNU coreutils
test suite doesn't necessarily mean two implementations are compatible.
A made-up example, based on some behaviors I have seen previously with
other programs, though I forget which, a test might check if 'shred'
checks for invalid file types by redirecting standard error to a file
here:

    $ mkfifo fifo
    $ shred fifo
    shred: fifo: invalid file type

If one implementation uses open ("fifo", O_NONBLOCK | ...), and the
other uses statx, which I commonly see uutils do through std::fs
functions, then the behavior will be different on readers waiting for a
writer. The open will unblock the reader, while statx will not.
Behaviors like this aren't always tested, though; the GNU coreutils test
suite is always a work in progress. I have tried to improve the checks
for cases like this, but there are theoretically more niche cases that
could cause problems if behavior changes.

Collin

