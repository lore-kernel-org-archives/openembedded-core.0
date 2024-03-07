Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44A2C54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 11:42:29 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.21144.1709811739600161113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 03:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VoX6a8Ag;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d094bc2244so10218471fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 03:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709811738; x=1710416538; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOfsd2mlYoWTVypYv/t7pMmAot1BYYLdxH1tXVNiyTw=;
        b=VoX6a8Ag4L6TNVVKFYdEOP65xrKmVqe2EVSKweo00tVWdCJpz6+P3ecQmLlI/Kw5W5
         NWBQANYPjye9nXbkzw18QZodXxGCoDn1C5gD4CMB4OO2RJZ1jDCW3Qu+53bkzKuDl1PS
         QnG2j2/AKpsDZmMpagMX60dCaGznGoE+r78jYEHBrOP//H6HmIdxMXsNMcMzJDoAS34C
         I0sdDm/+UgRwkIRpeIkMgMi2ARUHupuTOguU0aaUaYUYC5/RZMdXrPr9AINBLN6nXMbz
         tnXNYPQxl0SjV0C1yS5pXHs8LvMOpfjSSLVNwohKTKSxvnrJKoj7cJKMcT4Nvl+J2YjA
         sE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709811738; x=1710416538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOfsd2mlYoWTVypYv/t7pMmAot1BYYLdxH1tXVNiyTw=;
        b=WFi3KXEm5sdq3t+uPwuh3PLKeXbi0r64WSFAs2lX9f+0a9/DpNZn2ZIIprmymbR21O
         5kQERtx5VR4x/UF/0KjE65sDy33iogDMhGjFLp7NY4bhzaBtMN3X4lxrj/crRLYxyjpG
         kRH5UWE/3iQtv/frsiyFzWaLhn549nsEEaeDVz8Oax98Jka9hrtquQYPHqLGxlu05CSu
         b4v4iCq5BlveBdSN0g/BvKRMR/AJNUY9FantlLLQom8bBYNRUSDo3qzIUg8CsZx7Ekki
         ngY56+UJrzKHfVQQz2tK3PcdqhD3TNvaFS3gZND5zBRo8lpL2qu0MrbcCA77g1IJoD7B
         cjgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQOErx3E2Zelt2r1W35u8IJzvcBQPEDflooOBemH8EG/hyB5X/G2S+FmtuLqHDzVeWyaMRWPvtNqYDmMf7uUoMkmq+/WP0K4xlD7NYcjy/QZMsnjiyulbU
X-Gm-Message-State: AOJu0YxOlbtTCTqYvCebk3zxlc09aYr7z4SO6yUB+HFJsRkWCNz7NUpF
	Q9cLDfF3FPVsKq+FESOEAZWhuWDrtRrFHd+JK5+mmh+znj6a4FIOqQPsnPLmIWeVZRBswBS/bx8
	s7w91xxkLH9Z3txZ0qoKShmyniXA=
X-Google-Smtp-Source: AGHT+IF+x8djmG/9wvvjY20NqttMvf22+qcYdiPKwayA7se2Afk4J5FIdonREvkgMMBt6lNspneJUbn1OGnWcfSxeO4=
X-Received: by 2002:ac2:42c8:0:b0:513:5af1:9d7b with SMTP id
 n8-20020ac242c8000000b005135af19d7bmr1113294lfl.47.1709811737407; Thu, 07 Mar
 2024 03:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20240307091925.2324637-1-changqing.li@windriver.com>
 <CANNYZj9z1LUBB4sg7Z7tOg26qHsc6VZY2Ewj+vMrep0_cPBVpQ@mail.gmail.com> <CO6PR11MB560283393549E1690FCDD6CEED202@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB560283393549E1690FCDD6CEED202@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Mar 2024 12:42:05 +0100
Message-ID: <CANNYZj8H+7o5mkHi78ve_rizZ+DO93SGvOeefsTenjEh9fJO=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] dnf: remove log_lock.pid before exit
To: Qi.Chen@windriver.com
Cc: "Li, Changqing" <Changqing.Li@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 11:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196785

On Thu, 7 Mar 2024 at 11:21, Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
> You can see dnf's solution is: https://github.com/rpm-software-management=
/dnf/blob/master/etc/tmpfiles.d/dnf.conf
>
> I don't think dnf community will look into this issue. And I would expect=
 it to be a complicated one. Because dnf's own solution looks like more of =
a workaround. At the same time, yocto based systems will sometimes have log=
_lock.pid left in target filesystems. Users typing 'ls /' will notice it.
>
> We have an OE specific patch: https://git.openembedded.org/openembedded-c=
ore/commit/?id=3D742a1b71249f4da1c8d8e13e270b0eb6128a3f66
> I can see that this OE specific patch, 0001-dnf-write-the-log-lock-to-roo=
t.patch, does solve some issue. Unfortunately, at the same time, it introdu=
ces this specific issue, a easy-to-notice one.
>
> My suggestion is that we merge this fix into 0001-dnf-write-the-log-lock-=
to-root.patch, because they really belong together. I guess we can't expect=
 dnf community to devote time into this, as they've already got a solution.=
 And I'm not sure if anyone in OE community is familiar with dnf enough to =
solve this issue. So let's make things a little better, avoiding users of Y=
octo systems see this log_lock.pid file when they type 'ls /'.
>
> If you have any other suggestion, please let us know.

We need to find out why it happens, and why it happens only sometimes.
If lock file does not get properly deleted that is quite possibly
masking a different issue which needs fixing, and the proposed patch
just sweeps it all under the carpet in the name of giving users an
aesthetically pleasing rootfs. So the answer is still no.

If you are having difficulty debugging the situation where the lock
file does get left behind, can you provide a way for me to reproduce
the issue? I just build core-image-minimal, and I'm not seeing it:

alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ ls
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs/
bin  boot  dev  etc  home  lib  media  mnt  proc  root  run  sbin  srv
 sys  tmp  usr  var

If you can't provide that, then you can certainly still do more on
your side: build core-image-minimal with plain poky, ensure the lock
file gets deleted, then build your own private things where the file
does not get deleted, then investigate why the code path that deletes
the lock file isn't being taken in the latter case. You can see the
code where the lock log (self.rotate_lock) is used in logging.py:

    def emit(self, record):
        while True:
            try:
                if self.shouldRollover(record):
                    with self.rotate_lock:
                        # Do rollover while preserving the mode of the
new log file
                        mode =3D os.stat(self.baseFilename).st_mode
                        self.doRollover()
                        os.chmod(self.baseFilename, mode)
                logging.FileHandler.emit(self, record)
                return
            except (dnf.exceptions.ProcessLockError,
dnf.exceptions.ThreadLockError):
                time.sleep(0.01)
            except Exception:
                self.handleError(record)
                return

And the deletion happens in lock.py:

    def __exit__(self, *exc_args):
        if self.count =3D=3D 1:
            os.unlink(self.target)
        self._unlock_thread()



Alex

