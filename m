Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DFED75E3C
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 13:08:16 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.23547.1732280891217182612
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 05:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GY+dZmF+;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d402ce7aa3so13368776d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 05:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732280890; x=1732885690; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=80ODDL7FfrgBXFJvre/6srX1ZtzbACOOq7sNTiqeCNU=;
        b=GY+dZmF+srCQgxc08XoiIAwao2PilgLnMtrJ64+XW0qMcEjRz33OtAbXzHTPFF9Anf
         yf1TaNIrkX/yj12c471iMMz1AliUksKbzoxO7zg4YgXLpW2Q4GpGbASO8G6QdARCIYNo
         JojDcvkfM3qVdgu92BYNV5jHVVC4K7+lp5yXH3Jbc0KsmVKhB85ILVONq+QpCvcdltaX
         bzxI3Rqu2/KZhkY856mfpvmN1/FIxzUbxUM+Kx+E6hoz20XLx3TjezpvyDSSXnJ/NG+0
         vlq5IYvjhL88e8VPoxZL7Y3RxjJjn9rnVMTWsl2/ujQcXOIYGl9ISUGkVWNVN+V8KUpQ
         MuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732280890; x=1732885690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80ODDL7FfrgBXFJvre/6srX1ZtzbACOOq7sNTiqeCNU=;
        b=cZbWsc7CS+Hjv7Kjehvf6QCJ1VzDLfB9Lx9pBe6+Z/qMfpfKSmslE4X2B2HZcSgoxj
         AuwP2UpSGe92RTZx7lSyq/3oqdDoCUQkJ/3uHaJyS/mWq6dqWhWrMF96gCc5BzYtZ3pm
         1okh7CDI8lLGtbpfzqKDoKiGG0Pw2icfS7tugqdt1CnQMrc89VreON+wAO17CU25HHOP
         HBiayaFXAO95NrAJmuxTvyHzaGGHFK5NcZ9Knb8v5mBuQSjnlcxJo4Z4kjTLI7yKUJ5t
         +pfBPGuXS+8ouDCAol9XNHACxNujOVPXQeqtaVYgRQza2w8anXYQmZ1CWRI9ijR1eJ1E
         zptg==
X-Forwarded-Encrypted: i=1; AJvYcCXBe0ETucXLsL1R1HMM6/hrd7o3yW3vdqRXGVLvY1QKBgYYzwT3zUpstLuOIL8IF6Zxi9qlCAijeOmpD0kTcmvlpA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy64UPpiQxgFm38qJpLzcz90baK8jvYgKcr8bFJVnENhi1l9XZw
	UzF8cGt0Kx9E5f3ZwNoNXeQ4IYVCPZK21Wliia9R0KX+80V75f8GNiQk6ASXDrfwzDpmjK0zpjH
	ZP7RepOOA5XKKoWvOzt4c77n7ZsE=
X-Gm-Gg: ASbGncuHirg09A3umOvsRtMMHDHAkdbog8r3o61krtizpamDNePf+L8XgFG4n1IO8We
	FMYYnAEnoHYaZjZobCa7oenYkqxh8XIH4RLONjTV1uP0fHJuZ5mYT9wnFy0snJ6IJMQ==
X-Google-Smtp-Source: AGHT+IFe0QdEY2yjYT/QbZcgepr0fGSQ6MevRYoXMUUPjG/5CgZ+aCWBkIc5qVEtHHsAs6LwjfJ1WH/iRBjK7ESKybI=
X-Received: by 2002:a05:6214:d09:b0:6d4:2242:b914 with SMTP id
 6a1803df08f44-6d450e7dfadmr42840276d6.10.1732280890230; Fri, 22 Nov 2024
 05:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
 <CANNYZj8VR90wUtudX4FiA-teKaJFrkgK_hohmb2o6iNXeGL96w@mail.gmail.com>
 <MA0PR01MB9355C27D944D288DF19DEE389D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj9n-DiX3WfUJTqa=s_iKAfLSuNJZ7QuD6+H+PW9_m3ZrQ@mail.gmail.com>
 <MA0PR01MB935507E141ADD1CD9E3A28839D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj-qHdsNbqKy7bCNn4jx4T5Hc37qdZqgHHWeu5OCzTAi6A@mail.gmail.com>
 <MA0PR01MB93553EC00CC06C983FA1BCF19D232@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj_1jNg5tFdpx4Zo4ZMLF_KWWjj60f2YZQeWjAtjaDtiJA@mail.gmail.com> <MA0PR01MB9355C978E83C2F793FA49D539D232@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB9355C978E83C2F793FA49D539D232@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Nov 2024 14:07:59 +0100
Message-ID: <CANNYZj_gaDoHSsDKaQajaJxqQU6ug7=MVrCY0_Fp_k7dHiAvEA@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
To: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Cc: "thakur.virendra1810@gmail.com" <thakur.virendra1810@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"wangmy@fujitsu.com" <wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207613

On Fri, 22 Nov 2024 at 14:00, Virendra Kumar Thakur
<Virendra.Thakur@kpit.com> wrote:
> With code from github it works fine. make test-all is working.
>
> I am attaching here with the output file.
>
> 1..214
> ok
> All tests successful.
> Files=3, Tests=452, 12 wallclock secs ( 0.12 usr  0.03 sys +  3.22 cusr  5.92 csys =  9.29 CPU)
> Result: PASS

Right. Then your next task is to figure out where those tests obtain
the needed data, and then replicate that in oe-core, possibly by
adding needed repositories to SRC_URI, and then copying bits of them
into the ptest package.

The key sequence in the log seems to be this:

git branch --track run-test-suite origin/run-test-suite
Branch 'run-test-suite' set up to track remote branch 'run-test-suite'
from 'origin'.
git worktree prune
git worktree add tests/run-test-suite run-test-suite
Preparing worktree (checking out 'run-test-suite')
HEAD is now at cc9cb7b More bin/pin debug messages
make -C tests/run-test-suite test
make[1]: Entering directory
'/home/virendrak/libyaml-github/libyaml/tests/run-test-suite'
git clone https://github.com/yaml/yaml-test-suite data --branch=data
Cloning into 'data'...
remote: Enumerating objects: 17410, done.
remote: Counting objects: 100% (1134/1134), done.
remote: Compressing objects: 100% (555/555), done.
remote: Total 17410 (delta 675), reused 580 (delta 579), pack-reused
16276 (from 1)
Receiving objects: 100% (17410/17410), 4.57 MiB | 9.07 MiB/s, done.
Resolving deltas: 100% (11215/11215), done.
(cd data && git reset --hard data-2020-02-11)
HEAD is now at a12ee724 Regenerated data from master v2020-02-11
git branch --track run-test-suite-code origin/run-test-suite-code
Branch 'run-test-suite-code' set up to track remote branch
'run-test-suite-code' from 'origin'.
git worktree prune
[[ -d test ]] || \
    git worktree add test run-test-suite-code
Preparing worktree (checking out 'run-test-suite-code')
HEAD is now at 67365dd Remove tests for PR#162
(cd test && git reset --hard 67365dd2af265f17ba6ee0832c1411e4fd80ac0b)
HEAD is now at 67365dd Remove tests for PR#162
prove -lv test



Alex

