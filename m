Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.30571.1595776555809372433
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 08:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F3PJX/0k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id g10so11761098wmc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=WbsQ/lMUUnT961INZP04jKXlvroCLpf+pedNc2RgIOA=;
        b=F3PJX/0ku7S0/0Ki6cKmTgvn27yUCO48Wnf91xA/KI0EtJy+Md3hog7Z4zZjKkSsiB
         C/T3kCoTpfNQsoi9/FTbibR1j5Q420/ABZbLuSTUKV8E0jUVZLBXSOCOhoUdaTbl2BLr
         D10S2JtIObS/rcKjk6Nq0wV2Ql8FI0hWYHB14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=WbsQ/lMUUnT961INZP04jKXlvroCLpf+pedNc2RgIOA=;
        b=pM+WEfV5xwZJlGt0yTIbSsUWa4GCOna0m9Sm7AsDqFPMucFD1uNEUXY8JCKdBXvlr7
         8ps/b3SqdQ+Uy2fMpMj+OKsb6UEL8ZnKZLx2YALYzu/I0El4wDnbKxv5Z1RMmBZimOYu
         lNPGMDy4RKwyyHCYZ2xPurXn5C+Z26FS6KDzu6Aek+CD1P7Qn6IXyKfZJTOZ5ZBjglbp
         v83CK9cCcNjIeR9bE00hy4o3piaE1afg4ITFi25f8/A9Tne5Z68SsKlrOQFPPElFrD0A
         nX0eXy+TicDhrHaS+jH+p3ubqZNb8jqy5oLJzN7PO+hwPfDklI1Yq54zjsvx7yuHnZb2
         L+Mw==
X-Gm-Message-State: AOAM5315LDLu+o6gvOHHBweSi9noddZ92+0m3auk/tS+NuMtkRtwAInu
	EpqR6IChBPdmQRo1JnI/ySaMng==
X-Google-Smtp-Source: ABdhPJz9vmXC/1Zvakabqqc/Vm7L64YaSdxS7aCqFTdFz6Yt9TyptC60DNeOlLly6TnjIPqBOnIVNg==
X-Received: by 2002:a1c:2144:: with SMTP id h65mr16682156wmh.84.1595776554314;
        Sun, 26 Jul 2020 08:15:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id s125sm8887882wmf.14.2020.07.26.08.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 08:15:53 -0700 (PDT)
Message-ID: <8140109f4858d603585dedcf966bcc5f3f17c358.camel@linuxfoundation.org>
Subject: Pipe error on bitbake server startup on centos7-ty-4
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>, "MacLeod, Randy (Wind River)"
 <randy.macleod@windriver.com>, Michael Halstead
 <mhalstead@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Jul 2020 16:15:50 +0100
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've cc'd a few people who may be interested in different aspects of this.

I noticed an intermittent build failure in Alex's build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1192

the key part of the failure being:

2020-07-26 13:32:25,274 - oe-selftest - INFO - runtime_test.Postinst.test_postinst_rootfs_and_boot_systemd (subunit.RemotedTestCase)
2020-07-26 13:32:27,651 - oe-selftest - INFO -  ... ERROR
2020-07-26 13:32:28,272 - oe-selftest - INFO - 2: 36/37 352/413 (4478.73s) (runtime_test.Postinst.test_postinst_rootfs_and_boot_systemd)
2020-07-26 13:32:28,272 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/runtime_test.py", line 322, in test_postinst_rootfs_and_boot_systemd
    self.init_manager_loop("systemd")
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/runtime_test.py", line 273, in init_manager_loop
    with runqemu('core-image-minimal') as qemu:
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.8/contextlib.py", line 113, in __enter__
    return next(self.gen)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/utils/commands.py", line 316, in runqemu
    tinfoil.prepare(config_only=False, quiet=True)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/bitbake/lib/bb/tinfoil.py", line 393, in prepare
    self.server_connection, ui_module = setup_bitbake(config_params,
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/bitbake/lib/bb/main.py", line 438, in setup_bitbake
    server = bb.server.process.BitBakeServer(lock, sockname, configuration, featureset)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/bitbake/lib/bb/server/process.py", line 460, in __init__
    raise SystemExit(1)
SystemExit: 1

tinfoil should really do a better job of logging here as there was
logging output but tinfoil didn't display it. Logging onto that worker,
we could recover more info, the bitbake-cookerdaemon log file has:

--- Starting bitbake server pid 22694 at 2020-07-26 13:30:34.930639 ---
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/bitbake/lib/bb/daemonize.py", line 87, in createDaemon
    function()
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/bitbake/lib/bb/server/process.py", line 476, in _startServer
    writer.send("r")
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/bitbake/lib/bb/server/process.py", line 666, in send
    self.writer.send_bytes(obj)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.8/multiprocessing/connection.py", line 200, in send_bytes
    self._send_bytes(m[offset:offset + size])
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.8/multiprocessing/connection.py", line 411, in _send_bytes
    self._send(header + buf)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.8/multiprocessing/connection.py", line 368, in _send
    n = write(self._handle, buf)
BrokenPipeError: [Errno 32] Broken pipe
--- Starting bitbake server pid 46703 at 2020-07-26 13:32:37.519727 ---
Started bitbake server pid 46703
DEBUG: BBCooker starting 1595770357.5207798

bitbake created a pipe with os.pipe() to know when "r" was written by
the server to know it was ready. It didn't see the "r" value within the
allowed 90s so it closed the pipe. We don't know how long it had tried
to make the write for. I'd also note there was janitor build tree
removal active without the recent nice level changes yet.

Suggests the worker may be struggling with load :(

For now I at least wanted this all written down somewhere.

Richard



