Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D16CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 08:09:38 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.112783.1697443770454124540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 01:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uFli7S9O;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50435ad51bbso5326414e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 01:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697443768; x=1698048568; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+9ZCabLI6ZbLiqTbxdjMkW4QOsVfq5SR1GsnSVasSvw=;
        b=uFli7S9O1EBMQw49sz6vXFGSdejbcqKV+9ExbW2CMf+9e1kv5zxwvc4vvnnOjWba9i
         nS1GEoYHvoVPHm82U2zjslj8DLULNphnwOi8TgawMkrKANZ7USNDWJDkrqJ/c7M1K/zk
         9rabLq8KdFccWZoyrFeESGVbhIWtKHU9oOKVokYi7QWmmPnksdIZzipsifOEDHTlFG4a
         cOTDpydqFixh+wXVU5PDvY9EkHeVz51ryY6RvZHNMXbWrlrGzU4VFH/q75WZVVN+dott
         aclmqLnahm9dxIMNSDKmTm+yetZ6qoIHK3AtFiNaDuZJWEDzhTlL7M0k18cvz+DcQ4Qc
         M/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697443768; x=1698048568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9ZCabLI6ZbLiqTbxdjMkW4QOsVfq5SR1GsnSVasSvw=;
        b=eGkwPsGRN4sq2ZNuIdqI2CEJcPNUvTogezeQW9XCNVcKREjvI2wNekozqECfacyB6c
         3ZNMR+4pahlcDbuFUjsfBrN6IqHH5xquQxTbbalft40nS3bbMalRn/P/3K2AhY5qcmUP
         ROPBaABhdoiHZjC6OoCIqEPV0Py8+eN54jWpS+92furmhgrMNOar/+KTIbZ2Z+JrlW2Q
         oACAJZzwo+hsaZ9iNqnBeFKVFHdIiMg+ngeotRgG57XkPNDBOE5zyJCDXKup6xToJpl+
         6oyhJEsqiRBNaKbAGd2Hkfsl1eDr1NKqNntRR2V0141fAb9X/I2cwguz951OBjUhEavX
         hVCA==
X-Gm-Message-State: AOJu0Yw8h3xT8cqhusUQMk+ej/qXtWiEQuh7WAQ0PQ5fblHqa61Pw9KC
	R7K4Sfds6/3kFkekNdWq5i6ZRA==
X-Google-Smtp-Source: AGHT+IHOtQ0uR3kUT6i06SNUn+TvoBGy5K5Z4JEBZrfioy8b+kLt6/2mw2+5OmJmRkVkKmeShsIB/A==
X-Received: by 2002:ac2:4bc5:0:b0:507:8f1b:ff59 with SMTP id o5-20020ac24bc5000000b005078f1bff59mr11782690lfq.62.1697443768500;
        Mon, 16 Oct 2023 01:09:28 -0700 (PDT)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhlt-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::193])
        by smtp.gmail.com with ESMTPSA id p4-20020ac24ec4000000b0050335c6d091sm45174lfr.79.2023.10.16.01.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:09:28 -0700 (PDT)
Date: Mon, 16 Oct 2023 11:09:26 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-serial@vger.kernel.org,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: Kernel 6.5 ttyS1 hang with qemu (was Re: [OE-core] Summary of
 the remaining 6.5 kernel serial issue (and 6.5 summary)
Message-ID: <ZSzvthPZxfKn_6cp@nuoska>
References: <a2ad67a0575548b6d5d8d187e597dcd72ae07f64.camel@linuxfoundation.org>
 <ZSPQY6UYg21Z0PnN@nuoska>
 <1520ecb5f4b6959af835a7781b94694913f76912.camel@linuxfoundation.org>
 <178DF50519C11C84.8679@lists.openembedded.org>
 <b208c9c6b72be4ef0f2aadb7bed103280bff60a0.camel@linuxfoundation.org>
 <2023101516-unmolded-otter-e3e0@gregkh>
 <214757eca7f4cd639a7a8d9a822476c1ec30f01c.camel@linuxfoundation.org>
 <20231016063501.GL27774@atomide.com>
 <ZSzjNgdCH_wmB4u2@nuoska>
 <20231016072352.GM27774@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231016072352.GM27774@atomide.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189265

Hi,

On Mon, Oct 16, 2023 at 10:23:52AM +0300, Tony Lindgren wrote:
> * Mikko Rapeli <mikko.rapeli@linaro.org> [231016 07:16]:
> > On Mon, Oct 16, 2023 at 09:35:01AM +0300, Tony Lindgren wrote:
> > > * Richard Purdie <richard.purdie@linuxfoundation.org> [231015 21:30]:
> > > > On Sun, 2023-10-15 at 17:31 +0200, Greg Kroah-Hartman wrote:
> > > > > Can you try the patch below?  I just sent it to Linus and it's fr=
om Tony
> > > > > to resolve some other pm issues with the serial port code.
> > > >=20
> > > > Thanks for the pointer to this. I've put it through some testing and
> > > > had one failure so far so I suspect this isn't enough unfortunately.
> > > >
> > > > FWIW I was looping the testing on the complete removal of the
> > > > conditions and didn't see any failures with that.
> > >=20
> > > Care to clarify what's the failing test now?
> > >=20
> > > Is the issue still the second port not always coming up after boot or
> > > something else?
> >=20
> > Yes, data from the ttyS1 getty is not coming through from kernel and qe=
mu to
> > the test framework looking for login prompt after qemu machine boot.
> > Workarounds like sending "\n\n" from the test framework through qemu to=
 ttyS1
> > or "echo helloB > /dev/ttyS1" via working ttyS0 don't seem to help and =
wake
> > it up.
>=20
> OK so for trying to reproduce this with qemu, is this with the default ua=
rts
> or with some -device pci-serial-2x type options?

Here is how yocto test frameworks starts qemu:

qemu-system-x86_64 -device virtio-net-pci,netdev=3Dnet0,mac=3D52:54:00:12:3=
5:07 -netdev user,id=3Dnet0,hostfwd=3Dtcp:127.0.0.1:2225-:22,hostfwd=3Dtcp:=
127.0.0.1:2325-:23,tftp=3D/home/builder/src/base/build_test/tmp/deploy/imag=
es/qemux86-64 -object rng-random,filename=3D/dev/urandom,id=3Drng0 -device =
virtio-rng-pci,rng=3Drng0 -drive file=3D/home/builder/src/base/build_test/t=
mp/deploy/images/qemux86-64/core-image-ptest-openssh-qemux86-64.rootfs.ext4=
,if=3Dvirtio,format=3Draw -usb -device usb-tablet -usb -device usb-kbd   -c=
pu IvyBridge -machine q35,i8042=3Doff -smp 4 -enable-kvm -m 1024 -serial tc=
p:127.0.0.1:46313 -serial tcp:127.0.0.1:53891  -pidfile /home/builder/src/b=
ase/build_test/pidfile_1926373  -S -qmp unix:./.lzkynxe1,server,wait -qmp u=
nix:./.qcpdyz4j,server,nowait -snapshot -nographic  -kernel /home/builder/s=
rc/base/build_test/tmp/deploy/images/qemux86-64/bzImage -append 'root=3D/de=
v/vda rw  ip=3Ddhcp console=3DttyS0 console=3DttyS1 oprofile.timer=3D1 tsc=
=3Dreliable no_timer_check rcupdate.rcu_expedited=3D1 swiotlb=3D1  printk.t=
ime=3D1'

Example boot log when this ttyS1 failure happens is here:

https://pastebin.com/raw/jRRa2CwW

Cheers,

-Mikko

