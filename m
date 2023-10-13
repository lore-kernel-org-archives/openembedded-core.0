Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D29FCDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 12:01:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.36655.1697198460470337094
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 05:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aduH0TK+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40776b200e5so21705e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697198459; x=1697803259; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+70sXA5dmzEdXl+EJDj0LAaeX43l7HCAOvHhu9PmpT4=;
        b=aduH0TK+Zaw3nRYUWXkXzgLSvCTFPXn/vvLrWHDJw0LuJ7EAVg3Wn+ZpJkuTmpOLOh
         695hlskKYy3rSzkKsqjFB4U6yTlJcvdB7VnFIYoklKLlkVmBGWn4umZ7iEIgQVghzfrE
         TH16qWuswqjM6BaKi73bPInb96s9CTXLl5R48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697198459; x=1697803259;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+70sXA5dmzEdXl+EJDj0LAaeX43l7HCAOvHhu9PmpT4=;
        b=TEHi3Cau39Rp9X/uFSOmdgXpYZnaG0WfsbPqQJREsH2/02yw6QeEeJJOzNOAu5Bb+O
         WSr3HhjlwsHoZSCk1+sR05MoSeX46KKxY53hsGr2Y9VZ2+cc3rFV6JHT6mdNBHf3tCsj
         ObSvZz5IpElUGnjCD1V+RjAA0967eUSWkT0OFAodEPwrlqdIEUce/CBV7Itlu6v4sIWT
         1xDdDaZbaG8wuruXsF/Awve5vt/UpejXQSBNnOLplv2/ed1dKPjxmGWKOewPDJRouoS2
         jWGRVzNMNdvf5UO5vP8V/pf67c/sGDYwFgs6zMnKilZxl42py2s9+4n01kDr4RdQBybn
         NXJw==
X-Gm-Message-State: AOJu0Yy8Dlb0n4DZ8uudkXIYm5cGWzI3WBeeVIUj/PxqQf8m9urOdZs/
	G2aMDaguU1U2qlfCvyr400CO8A==
X-Google-Smtp-Source: AGHT+IHqErZCCCTbp5ddEU3lcZwn1wtc1fo1ZssFj8Voo9pOric6/eN9eNKusdP2/zsTjcQ8c84bEg==
X-Received: by 2002:a1c:4b18:0:b0:404:4b6f:d705 with SMTP id y24-20020a1c4b18000000b004044b6fd705mr24045279wma.17.1697198458448;
        Fri, 13 Oct 2023 05:00:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2c2a:1925:586b:5a77? ([2001:8b0:aba:5f3c:2c2a:1925:586b:5a77])
        by smtp.gmail.com with ESMTPSA id e6-20020a05600c218600b00406847c988asm2353824wme.12.2023.10.13.05.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 05:00:57 -0700 (PDT)
Message-ID: <b061e2735d56fe9a6c5310a1a59cbdba3f8d8655.camel@linuxfoundation.org>
Subject: Re: [OE-core] Summary of the remaining 6.5 kernel serial issue (and
 6.5 summary)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: paul.gortmaker@windriver.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
 Ashfield <bruce.ashfield@gmail.com>, Mikko Rapeli
 <mikko.rapeli@linaro.org>, Randy MacLeod <randy.macleod@windriver.com>
Date: Fri, 13 Oct 2023 13:00:57 +0100
In-Reply-To: <ZSYpdnwTW+6FkBiF@windriver.com>
References: <178BF2895FF685E6.5378@lists.openembedded.org>
	 <178C1443D3C8D91F.5378@lists.openembedded.org>
	 <178C704E48D36FAB.24994@lists.openembedded.org>
	 <178CD9772ED4DEB5.9719@lists.openembedded.org>
	 <8943ba03ec46c2c6d115a4fcdb8412571f56543d.camel@linuxfoundation.org>
	 <ZSYpdnwTW+6FkBiF@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 12:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189069

On Wed, 2023-10-11 at 00:49 -0400, Paul Gortmaker via
lists.openembedded.org wrote:
> [Re: [OE-core] Summary of the remaining 6.5 kernel serial issue (and 6.5 =
summary)] On 10/10/2023 (Tue 21:53) Richard Purdie via lists.openembedded.o=
rg wrote:
>=20
> > On Tue, 2023-10-10 at 21:37 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > I've been asked how to reproduce this setup more easily outside of
> > > OEQA. I hacked this up:
> > >=20
> > > https://www.rpsys.net/wp/rp/simpleqemu.tgz
> > >=20
> > > extract it, hack the paths in commands.py to point at a qemux86-64
> > > build of core-image-minimal and then "./commands" should boot an qemu
> > > image using the system's qemu binary as it would during the QA tests,
> > > setting up the two serial ports as it would during tests.
> > >=20
> > > Obviously I've just brutally hacked this out of the QA code so there
> > > are plenty of sharp edges. It should allow the serial setup to be
> > > replicated and experimented with more easily though without bitbake
> > > involved. It could be cut down a lot more too.
> >=20
> > and set runqemuparams =3D 'nographic' in commands.py if you can't cope
> > with graphics :).
>=20
> So I think we are onto something here.  Let me rewind a bit to provide
> a bit of context for those who didn't follow the IRC discussion.
>=20
> The OE/QA is running qemu with the "-serial tcp:<IP>:<port>" option and
> binds to that directly through python.  In theory, one should also be
> able to use netcat/socat (or even telnet) to bind to the qemu TCP via
> manual command line testing without the autobuilder/OEQA python.
>=20
> But I couldn't get that to work without getting "broken" echo behaviour
> and similar tty/terminal odd characters displayed.  As that was also
> observed on v6.1 and mickledore, I didn't want to go off on a wild goose
> chase after something that probably has nothing to do with the issue at
> hand here.
>=20
> Hence leading to what Richard created above.  The basic premise is that
> similar to the AB output, we are looking for log files ending in ".2"
> that are from ttyS1 -- that are smaller than normal - indicating that a
> getty wasn't able to get the login banner out successfully.  Now the resu=
lts.
>=20
> After 300 runs on mickledore with v6.1, all the .2 files were the same
> size - 477 bytes.
>=20
> After 155 runs on today's master with v6.5 kernel, I got two runs where
> instead of 477 bytes, they were 345 bytes.
>=20
> dot-two$ls -l1|wc -l
> 155
> dot-two$ls -l1| grep -v 477
> total 616
> -rw-r--r-- 1 pgortmak users 345 Oct 10 17:54 qemu_boot_log.20231010175351=
.2
> -rw-r--r-- 1 pgortmak users 345 Oct 10 18:43 qemu_boot_log.20231010184307=
.2
>=20
> The difference?  The "short" files ended with "Starting crond: OK" and
> were missing the login banner:
>    --------
>    Poky (Yocto Project Reference Distro) 4.2+snapshot-0fb1ff0ffb527a6364c=
ef7159c0d9dcb879e8dd9 qemux86-64 ttyS1
>=20
>    qemux86-64 login:
>    --------
>=20
> Similarly, for the ttyS0 logs, if we strip off the printk.time prefixes
> thus allowing us to diff the corresponding "outlier" case against any
> one of the 153 "normal" cases, we see that this line is missing:
>=20
> Last login: Tue Oct 10 22:40:31 +0000 2023 on /dev/ttyS1.
>=20
> ...which makes sense, since the login never appeared on ttyS1 for OEQA
> to interact with and login to.
>=20
> (interesting that otherwise, ttyS1 always "wins" the race to update
> wtmp/utmp over ttyS0)
>=20
> Anyway, that works out to approximately a reproduce factor of a dismal
> 1.5% by my math.  Ugh.  But at least it isn't coupled to a full build!
>=20
> Finally, using an identical build on master but with PREF VERSION of
> v6.4 kernel, I ran 300+ instances and got zero instances of short .2
> ttyS1 log files that were missing the getty output.
>=20
> Note that these runs were using the default qemu v4.x that ships with
> ubuntu-20.04 ; I've not (yet?) run similar tests with our own more
> up-to-date qemu build from the sysroot.  Maybe I don't need to?
>=20
> Possible conclusions:
>=20
> The reproducibility seems pretty low, which seems to match what I've
> heard with respect to the AB results.  It also seems confined to the
> v6.5.x kernel, based on these limited results - matching the AB results.
>=20
> So maybe we have a reproducer that is independent of OEQA and the
> backing of a full build to get there?  I'd like to think so, but I'm
> going to run more v6.5+master tests overnight to try and get better
> stats - a +/- of just 1 changes my current reproduce # by a large
> percentage!
>=20
>=20
> Next steps:
>=20
> Each run takes approximately 20s, and with a 1.5% success factor, a
> minimum of 150 clean runs is needed before one can say "OK, *maybe* this
> kernel currently under test is OK.  That translates to over an hour to
> get a data point you have some faith in as being "good".  [Still a heck
> of a lot better than doing 150 *builds* though!]
>=20
> On the other hand, just one instance of missing login on ttyS1 is
> concretely "bad" and hence the test run can be stopped as soon as one
> instance of that is seen.
>=20
> This "good is really maybe perhaps good, but bad is for sure bad" type
> of bisects that I love to hate.
>=20
> Since the data points are "expensive", I probably won't just attempt a
> mindless brute force bisect.  I'd probably do something more like...
>=20
> --ensure modules (or lack of) don't impact the results, so I don't have
>   to rebundle rootfs images.
>=20
> --maybe see if I can build with host gcc vs. using devshell/sysroot gcc
>   and still see the issue.  Although really, kernel build time optimizati=
on
>   won't be the bottleneck in this particular case, so not worthwhile?
>=20
> --check vanilla v6.5 (i.e. v6.5.0 -- no linux-stable content) so I know
>   whether to dig around in v6.5.0 --> v6.5.5, or dig around in the
>   much much larger v6.4 --> v6.5 additions.  I expect it to be the
>   latter, i.e. digging through mainline, but who knows.
>=20
> --assuming mainline introduced it, instead of a brute force bisect, I'd
>   look for merges by Linus from gregKH pull requests for the tty and
>   serial subsystems in the merge window (v6.4 ---> v6.5-rc1) and test
>   both sides of that/those merge(s).
>=20
> --if things haven't completely fallen apart by that point, I'd be left
>   with a relatively small set of subsystem specific commits from a single
>   pull request which then could be bisected.
>=20
> Sometimes in the past, when I've got down to that small set of commits,
> the culprit almost jumps out at you when scanning over the shortlogs.
>=20
> Anyway, that is where my thoughts are at.  But of course we don't even
> yet know if this "test" is even accurately reflecting the OEQA/AB issue!
> So nobody should get their hopes up too early.
>=20
> As a side note, and something that kind of was briefly discussed on IRC,
> it seems to make sense to someday informally "support" the idea of
> developers being able to use a chunk of the OEQA like this in a
> stand-alone mode - since we always seem to be chasing issues that only
> show up in AB output - with people struggling to reproduce elsewhere.

You've been doing some great work on this, thanks!

It is worth noting that for the purposes of experimentation, cutting
the 1000s timeout in the script to something more reasonable like 60s
is fine. If the thing fails, it hangs and you know about it quickly.

I did have some experiments of my own which I thought I'd share.

I hacked the script to append sys.argv[1] to the log filename, then
experimented with a command like:

$ for i in `seq 1 88`; do ./commands.py $i & done

which launches 88 qemus in parallel. It is clear when you do this and
watch the log file sizes, several "hang", for me at different points:

$ ls *.2 -la | cut -d ' ' -f 5 | sort | uniq -c
      1 134
      1 249
      1 251
      2 254
      1 255
     51 273

I think a few crash with races too since that total clearly isn't 88
but I'm not worrying too much about it.

I also came up with the idea of running "cat /proc/tty/driver/serial"
before and after the "echo helloA > /dev/ttyS1\n". This was interesting
as it resulted in:

root@qemux86-64:~# cat /proc/tty/driver/serial
serinfo:1.0 driver revision:
0: uart:16550A port:000003F8 irq:4 tx:418 rx:43 RTS|CTS|DTR|DSR|CD
1: uart:16550A port:000002F8 irq:3 tx:249 rx:0 RTS|CTS|DTR|DSR|CD
2: uart:unknown port:000003E8 irq:4
3: uart:unknown port:000002E8 irq:3
root@qemux86-64:~# echo helloA > /dev/ttyS1
root@qemux86-64:~# echo helloB > /dev/ttyS0
helloB
root@qemux86-64:~# cat /proc/tty/driver/serial
serinfo:1.0 driver revision:
0: uart:16550A port:000003F8 irq:4 tx:803 rx:121 RTS|CTS|DTR|DSR|CD
1: uart:16550A port:000002F8 irq:3 tx:281 rx:0 RTS|CTS|DTR|DSR|CD
2: uart:unknown port:000003E8 irq:4
3: uart:unknown port:000002E8 irq:3

The .2 logfile in this specific case was 249 bytes:

-rw-rw-r--  1 richard richard      249 Oct 13 12:50 qemu_boot_log.202310131=
2503368.2

which corresponds to the "tx:249". The last line was:

"""
Poky (Yocto Project Reference Distro) 4.2+snapshot-5b7479692b49154f4c299496=
974e7c81892ae336 qemux86-64 /dev/ttyS1
"""
i.e. the login prompt wasn't shown.

After the echo "helloA\n" (8 chars) we see the tx count increase to 281
so the login *and* the hello are sent. The expected 273 + 8 =3D=3D 281.

So what this seems to prove is the kernel is hogging the data and our
qemu processing side of this likely isn't at fault as the kernel never
transmits it.

Cheers,

Richard







