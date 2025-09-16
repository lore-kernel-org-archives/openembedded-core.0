Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F31CCAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:45:24 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.15464.1758015921484631084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V4krFGuY;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-70ba7aa131fso45996956d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 02:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758015920; x=1758620720; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbOAhp6LIdWO+Lvup/CDfUR8KJj1lsW4pAmJUw88MXA=;
        b=V4krFGuYhNfBk9fFzTEBhpgVxeV1il3FDUU4uVTVi+asBr5pAaMYzybrSWHJLMjzws
         LHhFM5901Gu7PCOk5FLLuuxJAtJBaSMyEr32v2xFXtntRNU/zcTlOVCtZXXz1snX9rYE
         TxeulCjKCDT6LEYJr0Cw/Atzb828/T78IeLgTlij9kCg09BqUib76ME/i9oJG/CYy+gP
         CPcIZCgJMODpbylAo5xCCUQZd4B5pq8tTA6c7WjBUEY62GMFqP+6C3NOtHDCmmyi51g4
         WvuOKudrJkTaMQJcRuPOFO4RMZgahDAYTavDYZOsy5xy9zImBKr+XXLD1iYDH55XnE62
         MZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015920; x=1758620720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbOAhp6LIdWO+Lvup/CDfUR8KJj1lsW4pAmJUw88MXA=;
        b=tGiIPnde0RzQnwJsRkBaNvProbDuWtbXW0VyeIyf+uYmDtOvrpkB7X1RrUwrwSCQ+k
         b9Z828gows/4SkZVsZI8urN2DqLq/ILkS7ZLYy4SmfWAiSnfFMuDlu9G11ekWpyiRGtC
         lhyZlg8lCFAOcnBLndKOLf/VUygxiZDje/O27OJj/C35BiAoCzGbJILHhhK3CZjxcIL1
         u+hs5vwh+TwnMtjJPGf0tCnsm2IamWFfe2gcOC/00jE7n8kCdwVEJQYenPq5lgl/C4KJ
         I48IgY1lA6027iZHz/jZ0Qd9QfKgxXhsw/KCDolRthWUsgFAReTnlQIO192n5sU+1UQS
         UAfg==
X-Gm-Message-State: AOJu0YygGZxLSrk5uFZW+EtyMb4g/3CdiLbR0ZOksG6vkXVdfkZVE6gt
	trb3ThzCA/HStnYH2VlUiEtiMEqh7SieznWQMDrir4T6ivyzvulzMZhFSOu4mxurDEXf22EimuA
	HD1sBxSRXg1WFtbEizF8XijaWYpeIWV4=
X-Gm-Gg: ASbGncvyORQFEuBcY+gMO/E8tLmyu0ldyDyuk1IVUcRZ4fF+3GNUwEW6dQV1j/Zl7u0
	vNRNU/8KxGbaX8gwNtYfy3sp2LOqt4i0DPwjm5/6m8SzLyDNmKtzOWGI+S0/S7mhbqs+H7vFJF0
	VJgZ6wkeqzNc8vB9lwaazPIRrtCQX0Rq2m3lJX0VKWD5qAQAOupoWJzVurKOt3uGVv1HebGAAcM
	dE7UAH5z/S2OTydM/C6aX4VbJoy4oDcKvOhtmAZ6LW9Tl4YYRKDHt99tEPzePA20jw7hTNVHyaC
	iN0jhqnxwv7QhOPZTXelyiFTsur8wLoFS3+YzfpILK9gMudpmoQ=
X-Google-Smtp-Source: AGHT+IFWrCUv2QCGCCjc5au2AFK2Y6N8uhqRojS4CLkal4jlednaUn2Bk3mG9RBkkePPpeAfR53LRbthdQ5nyhYKNdA=
X-Received: by 2002:a05:6214:4002:b0:78b:684e:88c5 with SMTP id
 6a1803df08f44-78b684e8bd6mr41133096d6.56.1758015920492; Tue, 16 Sep 2025
 02:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250904000724.1575300-1-a-christidis@ti.com> <CANNYZj-e1eYKD4Se3mHOWO-K5kA1BL0rSc25MPTNcuupa_hykw@mail.gmail.com>
 <03616756-05e8-41d5-a85b-06f2d046bea6@ti.com>
In-Reply-To: <03616756-05e8-41d5-a85b-06f2d046bea6@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Sep 2025 11:45:08 +0200
X-Gm-Features: AS18NWDwIyqnzrRQwoAaTCxFps-Jw2whjJamDWXuHl0jSA9t1dZkEkz6OpgO-J0
Message-ID: <CANNYZj9QKR_cPo0=_=3F+5Ae4p+KHb53zNcE3D1VtoGv0iwiyg@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [master][PATCH v2] libsdl2: Add tests package and
 ptest support
To: Antonios Christidis <a-christidis@ti.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 09:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223538

On Fri, 12 Sept 2025 at 22:54, Antonios Christidis <a-christidis@ti.com> wrote:
> However, when running the 18 tests on qemux86-64 qemuarm, the following
> tests fail:
>
> testaudioinfo
>
> testautomation
>
> testlocale
>
> testsurround
>
> Most of the test failures are due to the audio stack, which I do not
> have experience with in order to debug.
>
> Here's my questions, what should I do here ?
>
> It is acceptable to create a oe-core only patch for libsdl2, that would
> block the generation of the ".test" files for the above tests, ".test"
> files are what dictate which tests are run?
>
> Or, I can take a look into updating the version of gnome-desktop-testing
> ? More recent versions of the software, have a CLI option to exclude
> tests. The current packages version within oe-core does not.
>
> I'm leaning on the 2nd option, but want to get your opinion on this
> since you have more experience on ptest and related topics.

If these tests are failing, then it is not right to just go and
disable them without investigating why.

Maybe the failures are due to real bugs, maybe something is
misconfigured, or a test dependency is missing, we should try and get
to the bottom of it. Otherwise what's the point of running tests in
the first place, if any test failure results in adding the test to the
skip list?

Basically, show what the failures are, provide the patch and the steps
to reproduce them, and we'll try to find a fix. I've fixed many a
ptest over the years, and have a bag of tricks in my head.

Alex

