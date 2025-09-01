Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE3FCA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 12:06:49 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.49684.1756728406033818906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 05:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cdiTQJnE;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-805a55c09aeso12022385a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756728405; x=1757333205; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpo+Eb2oyA37W9Tn9UBShXzLO1aSHxvxmtcKNhYCzs4=;
        b=cdiTQJnEt2BnMDlUKDUq5N8EmZ8DhOFVTyVDvQPoDm9C0UDUXC/Fem2EH+aJriuoHt
         IVxn6nCLp/1DYwpRZQksbyZMG/eyl0zg/TCGd4b/2MznBLvR0oQQKZvSR3kvDPv3sR34
         bgeaFWa0aneoBF0CCLd/aY47JXrhhulrYxomL5RbjZxkNIQPAqFAyS42aCupp3laaVLd
         JT8yARnBJ1jhDWMZBYyu1cCGfhiWdR8nxoV6RbHIh34tHPTJH9Zy0eBty3oPe0rpfi00
         VZ+LylXxpZlPnGvnDqlrw2MTrkGxQoUCUOJuzzaZTAN6+qS4+GN0n1XjM2kdU4V9hUyh
         OhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756728405; x=1757333205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lpo+Eb2oyA37W9Tn9UBShXzLO1aSHxvxmtcKNhYCzs4=;
        b=qbC/E1twwOuwcZ3U29415hhrnzbx81MEnpdG3WSESP4DVjHm9ok5qo7flxtZ2UvW6M
         G8HlHfHNCfttYO3QsyRPTRfuXPVMLgsrIeKZf+XM1hrLH2MKxOksla4wy1GLxfR3EoKs
         xh2Gw1csGd0cckZ4mlR7jvStJB/qkhG21768bzON2LeMAFoWL1DXwilFWfo+5VlS8+jy
         rxvYnvlbSbMYJmBInjvn9nXhXyjU3bw6sF0u2BqX7BTWRmxGFX+zpsSAIjJd9A0bEAeU
         CenN3AR94IjwO7vZxZf3ZPmAEc8tvoQ4ki0YVGJsWHNRCvrRHBVXamCQI/PkoRX1eX1A
         WBwA==
X-Forwarded-Encrypted: i=1; AJvYcCXrFb+UA6VziZ9EC/pWRLBJ1QjSm0X6kU8N3A04bZopkSCYrQ/nwlJnKe/fvKC0qR8XjafFVsYlMD6wFpPt6vXdJA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywby0EpxZIoPjYe0vZ1GgWxMw/oNVaux8tThXw5kgXppWXM+jVi
	AXX3CKnki9q0tB0sqpHZjKV7Kl6t7dELD05WjX9wpAl8Vh7dpDNWT1D9Sx07ChP4pq3BLUQ9cfV
	Cmjoj7Tyfjs54FexcrU9NYleIu7O9TS8=
X-Gm-Gg: ASbGncsx9BIxdMqub9bMgB8YsjVjI1HJ0Zc+aD40odacDxpI8F57C36ONLLBeV+01L+
	k8zsMJddy/KM40+OUEmRvN9zevB+ok60Yw+uoWSQ71hJdxANt2gJ9sE1cel+Vof+EKaWcTlT6QO
	mp/X9iVyyRrQTToAwjRvipZwCELcl4DP6U8IXw5xPuk+8bCqL/clU6Lqdu9Vj4y0gWIW5DpW2qs
	r2SfK/AAvh+WxSVAgRBj53u3cqV4aqgJLX+XZFiPiSMUzCtjsoRj0qDylhUPZhib8C7zj0kkGep
	h785aSOhh+sYR+BC
X-Google-Smtp-Source: AGHT+IFRZUyov2nafI15m3fRjes5b/pdyzB09XMTuMGx/L4abnntEJmDqyGO8mvvOazkkfVKtxUCOVu5qpISDNfVjmw=
X-Received: by 2002:a05:620a:4710:b0:803:12:b4ce with SMTP id
 af79cd13be357-8030012b7a3mr339119385a.57.1756728404821; Mon, 01 Sep 2025
 05:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250712140638.3099109-1-gudni.m.g@gmail.com> <24850.1752329523627965940@lists.openembedded.org>
 <AS1PR10MB5697C5226761702F5C7B4E68FD4AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1860EED7D31477F1.5475@lists.openembedded.org> <1860F3C42441CCDB.24627@lists.openembedded.org>
 <64ec9cce-9ae9-4d0b-8be7-e1d0bec144cd@gmail.com> <186124667AD72DDE.24627@lists.openembedded.org>
In-Reply-To: <186124667AD72DDE.24627@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Sep 2025 14:06:32 +0200
X-Gm-Features: Ac12FXyF_3Q8AQD-yJ5iDw1rHJ2U7KZausqWDw3xtVJtjNm1sw_hQRUCjp2BvQs
Message-ID: <CANNYZj9EF2g-XXU2231P0pb5Bv+yBWpFwLQqcbeGdNFO9UFcmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
To: alex.kanavin@gmail.com
Cc: skandigraun@gmail.com, peter.marko@siemens.com, 
	"gudni.m.g@gmail.com" <gudni.m.g@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 12:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222660

On Mon, 1 Sept 2025 at 13:15, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> That said, non-deterministically falling through to the host libsqlite
> is wrong as well, it just wasn't previously exposed. We need to figure
> out this one first, and fix it properly, and only then address the
> pseudo linking issue above.

I found a better way to reproduce and observe this.

1. The issue can be seen even without the sqlite update.

Run 'bitbake gcc-runtime', then delete tmp/ then run 'bitbake -c
package gcc-runtime'.

Then take a look at tmp/log/cooker/qemux86-64/console-latest.log, and
it should have:

NOTE: Executing Tasks
NOTE: Running setscene task 1 of 304
(virtual:native:/srv/work/alex/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot_setscene)
NOTE: recipe pseudo-native-1.9.2+git-r0: task
do_populate_sysroot_setscene: Started
NOTE: recipe pseudo-native-1.9.2+git-r0: task
do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 2 of 304
(/srv/work/alex/poky/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package_setscene)
NOTE: Running setscene task 4 of 304
(virtual:native:/srv/work/alex/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_recipe_qa_setscene)
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_package_setscene: Started

Which means, pseudo is installed, but not sqlite. Then tasks that
depend on pseudo start running, and they seem to work by happy
coincidence (fall-through to host sqlite).

2. With the sqlite update, that fall-through breaks (with the same
command sequnce):

NOTE: Executing Tasks
NOTE: Running setscene task 1 of 304
(virtual:native:/srv/work/alex/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot_setscene)
NOTE: recipe pseudo-native-1.9.2+git-r0: task
do_populate_sysroot_setscene: Started
NOTE: recipe pseudo-native-1.9.2+git-r0: task
do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 3 of 304
(virtual:native:/srv/work/alex/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 4 of 304
(/srv/work/alex/poky/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package_setscene)
ERROR: An uncaught exception occurred in runqueue
Traceback (most recent call last):
  File "/srv/work/alex/poky/bitbake/lib/bb/runqueue.py", line 1661, in
execute_runqueue
    return self._execute_runqueue()
           ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/work/alex/poky/bitbake/lib/bb/runqueue.py", line 1627, in
_execute_runqueue
    retval = self.rqexe.execute()
             ^^^^^^^^^^^^^^^^^^^^
  File "/srv/work/alex/poky/bitbake/lib/bb/runqueue.py", line 2317, in execute
    self.rq.start_fakeworker(self, mc)
  File "/srv/work/alex/poky/bitbake/lib/bb/runqueue.py", line 1437, in
start_fakeworker
    self.fakeworker[mc] = self._start_worker(mc, True, rqexec)
                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/work/alex/poky/bitbake/lib/bb/runqueue.py", line 1406, in
_start_worker
    RunQueue.send_pickled_data(worker, workerdata, "workerdata")
  File "/srv/work/alex/poky/bitbake/lib/bb/runqueue.py", line 1365, in
send_pickled_data
    worker.stdin.write(msg)
BrokenPipeError: [Errno 32] Broken pipe


3. I don't yet know how to solve this either. This will work, but
hardcodes pseudo's particular dependencies into a location which
refers only to a generic fakeroot implementation:

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
...
-        d.appendVarFlag('do_package_setscene', 'depends', '
virtual/fakeroot-native:do_populate_sysroot')
+        d.appendVarFlag('do_package_setscene', 'depends', '
virtual/fakeroot-native:do_populate_sysroot
sqlite3-native:do_populate_sysroot')
...

I'm afraid, RP needs to step in :-/

Alex

