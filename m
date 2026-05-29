Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BFBCD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 15:49:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13602.1780069753441133617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 08:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XKBBOoyE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1269323f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 08:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780069752; x=1780674552; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4fd6ZrznGomp47mZx0VIvx2IXQ0zvSf3wSFKBGhfeb4=;
        b=XKBBOoyETFQ9SjCJOqo2XXhXWRiYjIkD0nGA3iJcA3mJeqn0kVFOl8BmKBVVCy8GtI
         3HCcIJjBVQHamh2xeCmfYG5Sn56zwDGMlF05MaPamSQfFZTj1ujt2/WdOKn2yQvxqF4Z
         pPxH3sNcc1uu/eBfhMgCtx19CfuPFmCxxTDT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780069752; x=1780674552;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4fd6ZrznGomp47mZx0VIvx2IXQ0zvSf3wSFKBGhfeb4=;
        b=en0ah4aGfqIr4qEEMH5XNIlsQSWgZZyim4H4WjUC0tIeRLKIe0HEX3+M7YMBYKAz4S
         3su8kkyrFcdSVd/fk1CVPX74Cxi8SeumO39jk46E76GMUkvbj9ECVEE0FHZZgiueWNWU
         vA6pxBpRlfbBPKZRUmbJb6diLnTtdudKMnKBqx+TnQEAlRCYNVHWp2y369Lw9T0iVyjY
         s05BUgbAS1xzQUtEs2/D0tJktW5JDZF0KvMOzVU3NXssmdLQeiB3U3Lit81j5HbVKjtQ
         lfdWYXF+tnOflJMx2X+gDuKo8qf6Jhh68J+XtyMRbR3wz2Bo/YzR6OlYrCIHectnUC5v
         yFuw==
X-Forwarded-Encrypted: i=1; AFNElJ/rBnzVO2zDcnGcJZ7rxujGC3M5cgMh6g0NslEzqOL0zOmYFSs4OvdslOGQSdj5jcVaNIiFcsZh9R3Gcn3agB1vIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwoEQ8PcSxneXKp4lCeyxpX5GjsgST0Ltczbwie82JZAfK3VBAK
	DIRWpm18J/YxoW36Mj0+/yp8eK1o2UQVA9MTjdNNS7hNuvL+twDb8hZFEDUpXtAFx/4=
X-Gm-Gg: Acq92OHDTaS1TDKPUEl4aJ5ASju23gIwXyizQCJy6eyZs/8SPWROvWCpFMdu+eoleL5
	P23zRf7RzmasqtecLakgjuDgIxtRsfSSoLiL/YyomFvFn4vPhDSIyo4LFLwb5b6MvTvTjiZzmoj
	O8fTBlI1gNfi2MGcGC8KHCVEDJYfIphf8DK05WYkJbRZhB0gQDAG9xvHtotUR0f0xqrYAh06/n+
	dGn+MPCkkxZnBGCcclJb/0EvO8N9eN9qketD9+t7g/3Ngi24ALrHEMQecVy+Mmv6zPxVr2xAogt
	CpwHQLBq0uD3HMKvJpasBWWdaRbRnmaeO0D1eCUzgqRaP9FxNXg04FOhmSqP2KAYA9w3CDV33RL
	QSCBauMw2DX4I5m7L62ybJH9Y4ar/PxBbhLTNaQsmw/GjM+aHw6AXByI3OVj1R5jz7gcZ2y7+LA
	z0/7x6ASnQrJ1TOuX8DGZA00MMng11HZtzdbe7KuQyEmARpszLe0JPmbL1lHGgiCOwHQ5u0LZw6
	uPmSR9uByG2XmOxiGtSCZGWPJc=
X-Received: by 2002:a05:6000:1a8c:b0:45e:b9b4:c68d with SMTP id ffacd0b85a97d-45ef132dba5mr6272141f8f.4.1780069751772;
        Fri, 29 May 2026 08:49:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:45d6:ddb4:ed0f:e5c2? ([2001:8b0:aba:5f3c:45d6:ddb4:ed0f:e5c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354c682sm4077007f8f.23.2026.05.29.08.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:49:11 -0700 (PDT)
Message-ID: <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, Quan.Sun@windriver.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 29 May 2026 16:49:10 +0100
In-Reply-To: <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
	 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com>
	 <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
	 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 15:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237762

On Fri, 2026-05-29 at 17:23 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> On Fri, 29 May 2026 at 16:45, Quan Sun via lists.openembedded.org
> <Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
> > > glx: failed to create dri3 screen
> > > failed to load driver: vgem
> > >=20
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/39=
24
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/37=
86
> > >=20
> > > Can you have a look at the issue?
> > It seems this issue is not caused by the qemu upgrade. I also asked
> > an
> > AI agent to carefully examine the build/test logs, and the
> > following is
> > what it says:
>=20
> Unfortunately AI has produced a total hallucination in its analysis,
> because it looks only at the build log given to it, not at the actual
> change that is being tested (e.g. it wouldn't see in that log that
> there is a qemu update, and it wouldn't go and analyse the qemu own
> changelog and commit history, and it wouldn't run the same test
> against qemu 10.x to narrow it down and so on).
>=20
> I went and tried this test with qemu 10.x on the same host, and it
> passes just fine:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3928
>=20
> Then I cherry picked the qemu 11.x patch, and the test then fails:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3930
>=20
> It's still possible something is misconfigured on the host (it runs
> tiger vnc standalone server to allow X clients such as qemu to render
> into it), but the issue is clearly triggered by the version upgrade.


I should add, I looked into a couple of the failures on the autobuilder
and it appeared qemu is segfaulting after the upgrade. I'm fairly sure
that is related to the upgrade as it doesn't do it before.

Stack trace of thread 2714954:
                                                      #0  0x00007fec6367b4f=
4 __pthread_mutex_lock@GLIBC_2.2.5 (libc.so.6 + 0x924f4)
                                                      #1  0x00007fec603c0f4=
0 wl_proxy_create_wrapper (libwayland-client.so.0 + 0x8f40)
                                                      #2  0x00007fec60182bc=
0 n/a (libEGL.so.1 + 0x2bbc0)
                                                      #3  0x00007fec6017a4e=
0 n/a (libEGL.so.1 + 0x234e0)
                                                      #4  0x00007fec6016aa9=
c eglInitialize (libEGL.so.1 + 0x13a9c)
                                                      #5  0x00007fec64a89a8=
c n/a (libSDL2-2.0.so.0 + 0xbaa8c)
                                                      #6  0x00007fec64a9822=
6 n/a (libSDL2-2.0.so.0 + 0xc9226)
                                                      #7  0x00007fec64a9ab1=
9 n/a (libSDL2-2.0.so.0 + 0xcbb19)
                                                      #8  0x0000558d31710aa=
4 n/a (qemu-system-x86_64 + 0x6acaa4)
                                                      #9  0x0000558d3171224=
e n/a (qemu-system-x86_64 + 0x6ae24e)
                                                      #10 0x0000558d3171073=
2 n/a (qemu-system-x86_64 + 0x6ac732)
                                                      #11 0x0000558d3164b55=
4 n/a (qemu-system-x86_64 + 0x5e7554)
                                                      #12 0x0000558d313a8e5=
9 n/a (qemu-system-x86_64 + 0x344e59)
                                                      #13 0x00007fec6360efa=
b __libc_start_call_main (libc.so.6 + 0x25fab)
                                                      #14 0x00007fec6360f0c=
b __libc_start_main@@GLIBC_2.34 (libc.so.6 + 0x260cb)
                                                      #15 0x0000558d313aa01=
5 n/a (qemu-system-x86_64 + 0x346015)


                                                      Stack trace of thread=
 2714967:
                                                      #0  0x00007fec6368010=
2 __syscall_cancel_arch (libc.so.6 + 0x97102)
                                                      #1  0x00007fec63674fb=
8 __internal_syscall_cancel (libc.so.6 + 0x8bfb8)
                                                      #2  0x00007fec6367529=
c __futex_abstimed_wait_common (libc.so.6 + 0x8c29c)
                                                      #3  0x00007fec636779a=
8 pthread_cond_wait@@GLIBC_2.3.2 (libc.so.6 + 0x8e9a8)
                                                      #4  0x00007fec41996ff=
9 n/a (libgallium-26.0.6.so + 0x596ff9)
                                                      #5  0x00007fec41c64ee=
3 n/a (libgallium-26.0.6.so + 0x864ee3)
                                                      #6  0x00007fec41996f3=
7 n/a (libgallium-26.0.6.so + 0x596f37)
                                                      #7  0x00007fec6367832=
c start_thread (libc.so.6 + 0x8f32c)
                                                      #8  0x00007fec636f3b2=
c __clone3 (libc.so.6 + 0x10ab2c)

[and more but probably not so interesting]

so it is failing in eglInitialize().

Cheers,

Richard

