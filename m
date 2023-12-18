Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B20EC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 17:45:47 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.50220.1702921541941933932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 09:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CZUogkj4;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6da5259e3a3so2451671a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702921541; x=1703526341; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xc9/sQLSpiWs8RV6KWnqZ42e4nd2oSaf2lcPYITLQ9s=;
        b=CZUogkj4WxRgQDscWtF125F+GXgoU7xqs6Hi6pXfaLMMqKpff8YFXDQ5mREfjGdYVG
         FIK0rsQSoyVjizY42w83PIOzuy7k31pxmfQpu03d5HsYX15g3zJmBCYImQN4II8kJBQP
         V0oS/jWw6D1JrD7xNJLHKHnD59aky0Wo0H1rzRyBUemoBjFA/OSDShKmpuKELONvIeeW
         f1SrIrLzuaOVlB7cq2C3tZD5axSs+pC0fer6mp7nVZBnTayw7DqRpxBG0SbwNoSSHPRv
         lh4cruSXUFT2eegeYL5RTLsUVJLz0RAFUmyTMGAXaipFHUdSttSy8B31sMyrhBJTiAef
         RQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702921541; x=1703526341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xc9/sQLSpiWs8RV6KWnqZ42e4nd2oSaf2lcPYITLQ9s=;
        b=KowKYxbpQa+eXBznUQyiF4PCoj3+OeMd6UhVC/eWiKv1eE3QJDT9gvIGUFiMmJSwiU
         jMoMhl6DgSGHPbyRfT2riKwq2gnzEcVNu0HDK/4EY0Ob2HzbXtjeVrIgOOrr+K7k4+il
         dJRke1dPdrIOZDcRMB+TD9o+0+n2t2+Cb1s/9L0g17Nm0OoKFrra+IrUlIoYV2TimAvy
         UiC8/1Arh9rVedxKcWs8KMZllqLodCQlK0L0ymyyCHZJA9OmWHBpttzltYRAmoWEuvPj
         ot9dC3u2fK4RJXmpzWumSRKXpNxxxog7iMi/8jTLr5E9WQ1GC+u4F9qsXRGXE/BcHkzG
         8Hcw==
X-Gm-Message-State: AOJu0YxODMCX5Ke/W9DnXm+//XUFYtg89PD3fL+FP4XRV1sHLKJcRDwa
	ePHv7qfqkCGC4Wqg9Mv4Ld/kMGQKXYdgyW9SaNIpzA6K
X-Google-Smtp-Source: AGHT+IF5TSXM4nDDL1FoiI/pJQ1YTFMoRAw04FFR08d1u7rY8zXxeTCt8QpgXmD2mo5Y/GTTdQIahwRtA75X3pgNj9M=
X-Received: by 2002:a05:6870:1711:b0:1fb:75b:99bb with SMTP id
 h17-20020a056870171100b001fb075b99bbmr18933978oae.106.1702921540966; Mon, 18
 Dec 2023 09:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Dec 2023 09:45:15 -0800
Message-ID: <CAMKF1sqkizk++vW++TsyiOBSsHhM7euMNWGs8KHBJq_2yB=dFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] qemurunner: Impove stdout logging handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 17:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192672

I tried the two patches in this series. It did improve the situation
but I am still getting SSH timeouts. But this time its 13 tests
earlier it used to be 40+
btw. my images are using systemd. So it might be good to see if we see
this with poky-altcfg as well or not.

On Mon, Dec 18, 2023 at 7:29=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> We need to ensure we read from and log the output from qemu stdout
> as otherwise the buffers can fill and block, leading qemu to hand.
> Use our existing logging thread to do this.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 54 ++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 22 deletions(-)
>
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemu=
runner.py
> index ee367078000..36bdfb96ae6 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -29,6 +29,15 @@ control_chars =3D [chr(x) for x in control_range
>                  if chr(x) not in string.printable]
>  re_control_char =3D re.compile('[%s]' % re.escape("".join(control_chars)=
))
>
> +def getOutput(o):
> +    import fcntl
> +    fl =3D fcntl.fcntl(o, fcntl.F_GETFL)
> +    fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
> +    try:
> +        return os.read(o.fileno(), 1000000).decode("utf-8")
> +    except BlockingIOError:
> +        return ""
> +
>  class QemuRunner:
>
>      def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_imag=
e, logfile, boottime, dump_dir, use_kvm, logger, use_slirp=3DFalse,
> @@ -55,6 +64,7 @@ class QemuRunner:
>          self.boottime =3D boottime
>          self.logged =3D False
>          self.thread =3D None
> +        self.threadsock =3D None
>          self.use_kvm =3D use_kvm
>          self.use_ovmf =3D use_ovmf
>          self.use_slirp =3D use_slirp
> @@ -119,21 +129,11 @@ class QemuRunner:
>                  f.write(msg)
>          self.msg +=3D self.decode_qemulog(msg)
>
> -    def getOutput(self, o):
> -        import fcntl
> -        fl =3D fcntl.fcntl(o, fcntl.F_GETFL)
> -        fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
> -        try:
> -            return os.read(o.fileno(), 1000000).decode("utf-8")
> -        except BlockingIOError:
> -            return ""
> -
> -
>      def handleSIGCHLD(self, signum, frame):
>          if self.runqemu and self.runqemu.poll():
>              if self.runqemu.returncode:
>                  self.logger.error('runqemu exited with code %d' % self.r=
unqemu.returncode)
> -                self.logger.error('Output from runqemu:\n%s' % self.getO=
utput(self.runqemu.stdout))
> +                self.logger.error('Output from runqemu:\n%s' % getOutput=
(self.runqemu.stdout))
>                  self.stop()
>
>      def start(self, qemuparams =3D None, get_ip =3D True, extra_bootpara=
ms =3D None, runqemuparams=3D'', launch_cmd=3DNone, discard_writes=3DTrue):
> @@ -282,7 +282,7 @@ class QemuRunner:
>                  if self.runqemu.returncode:
>                      # No point waiting any longer
>                      self.logger.warning('runqemu exited with code %d' % =
self.runqemu.returncode)
> -                    self.logger.warning("Output from runqemu:\n%s" % sel=
f.getOutput(output))
> +                    self.logger.warning("Output from runqemu:\n%s" % get=
Output(output))
>                      self.stop()
>                      return False
>              time.sleep(0.5)
> @@ -309,7 +309,7 @@ class QemuRunner:
>              ps =3D subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,n=
i,command '], stdout=3Dsubprocess.PIPE).communicate()[0]
>              processes =3D ps.decode("utf-8")
>              self.logger.debug("Running processes:\n%s" % processes)
> -            op =3D self.getOutput(output)
> +            op =3D getOutput(output)
>              self.stop()
>              if op:
>                  self.logger.error("Output from runqemu:\n%s" % op)
> @@ -387,7 +387,7 @@ class QemuRunner:
>                             time.time() - connect_time))
>
>          # We are alive: qemu is running
> -        out =3D self.getOutput(output)
> +        out =3D getOutput(output)
>          netconf =3D False # network configuration is not required by def=
ault
>          self.logger.debug("qemu started in %.2f seconds - qemu procces p=
id is %s (%s)" %
>                            (time.time() - (endtime - self.runqemutime),
> @@ -430,9 +430,10 @@ class QemuRunner:
>          self.logger.debug("Target IP: %s" % self.ip)
>          self.logger.debug("Server IP: %s" % self.server_ip)
>
> +        self.thread =3D LoggingThread(self.log, self.threadsock, self.lo=
gger, self.runqemu.stdout)
> +        self.thread.start()
> +
>          if self.serial_ports >=3D 2:
> -            self.thread =3D LoggingThread(self.log, self.threadsock, sel=
f.logger)
> -            self.thread.start()
>              if not self.thread.connection_established.wait(self.boottime=
):
>                  self.logger.error("Didn't receive a console connection f=
rom qemu. "
>                               "Here is the qemu command line used:\n%s\na=
nd "
> @@ -444,7 +445,7 @@ class QemuRunner:
>          self.logger.debug("Waiting at most %d seconds for login banner (=
%s)" %
>                            (self.boottime, time.strftime("%D %H:%M:%S")))
>          endtime =3D time.time() + self.boottime
> -        filelist =3D [self.server_socket, self.runqemu.stdout]
> +        filelist =3D [self.server_socket]
>          reachedlogin =3D False
>          stopread =3D False
>          qemusock =3D None
> @@ -564,7 +565,7 @@ class QemuRunner:
>                  self.logger.debug("Sending SIGKILL to runqemu")
>                  os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
>              if not self.runqemu.stdout.closed:
> -                self.logger.info("Output from runqemu:\n%s" % self.getOu=
tput(self.runqemu.stdout))
> +                self.logger.info("Output from runqemu:\n%s" % getOutput(=
self.runqemu.stdout))
>              self.runqemu.stdin.close()
>              self.runqemu.stdout.close()
>              self.runqemu_exited =3D True
> @@ -700,9 +701,11 @@ class QemuRunner:
>  # event loop. The mechanism for stopping the thread is a simple pipe whi=
ch
>  # will wake up the poll and allow for tearing everything down.
>  class LoggingThread(threading.Thread):
> -    def __init__(self, logfunc, sock, logger):
> +    def __init__(self, logfunc, sock, logger, qemuoutput):
>          self.connection_established =3D threading.Event()
> +
>          self.serversock =3D sock
> +        self.qemuoutput =3D qemuoutput
>          self.logfunc =3D logfunc
>          self.logger =3D logger
>          self.readsock =3D None
> @@ -732,7 +735,8 @@ class LoggingThread(threading.Thread):
>
>      def teardown(self):
>          self.logger.debug("Tearing down logging thread")
> -        self.close_socket(self.serversock)
> +        if self.serversock:
> +            self.close_socket(self.serversock)
>
>          if self.readsock is not None:
>              self.close_socket(self.readsock)
> @@ -747,7 +751,9 @@ class LoggingThread(threading.Thread):
>      def eventloop(self):
>          poll =3D select.poll()
>          event_read_mask =3D self.errorevents | self.readevents
> -        poll.register(self.serversock.fileno())
> +        if self.serversock:
> +            poll.register(self.serversock.fileno())
> +        poll.register(self.qemuoutput.fileno())
>          poll.register(self.readpipe, event_read_mask)
>
>          breakout =3D False
> @@ -767,7 +773,7 @@ class LoggingThread(threading.Thread):
>                      break
>
>                  # A connection request was received
> -                elif self.serversock.fileno() =3D=3D event[0]:
> +                elif self.serversock and self.serversock.fileno() =3D=3D=
 event[0]:
>                      self.logger.debug("Connection request received")
>                      self.readsock, _ =3D self.serversock.accept()
>                      self.readsock.setblocking(0)
> @@ -781,6 +787,10 @@ class LoggingThread(threading.Thread):
>                  elif self.readsock.fileno() =3D=3D event[0]:
>                      data =3D self.recv(1024)
>                      self.logfunc(data)
> +                elif self.qemuoutput.fileno() =3D=3D event[0]:
> +                    data =3D getOutput(self.qemuoutput)
> +                    self.logger.debug("Data received on qemu stdout %s" =
% data)
> +                    self.logfunc(data, ".stdout")
>
>      # Since the socket is non-blocking make sure to honor EAGAIN
>      # and EWOULDBLOCK.
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192655): https://lists.openembedded.org/g/openembedde=
d-core/message/192655
> Mute This Topic: https://lists.openembedded.org/mt/103244414/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

