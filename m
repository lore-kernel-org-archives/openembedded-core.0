Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8042AC36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 16:28:53 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.555.1743524924110660109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 09:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QDQseRkz;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8f6970326so52614766d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 09:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743524923; x=1744129723; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMKbDylLRX00t1zBwkV0jUFGN7qgwQB9ES2XuD6ppQw=;
        b=QDQseRkz8p8EbFS/wZENOKyAxIXt3qWcyMgpyxFKmqP9sA+0yDBRSvovxpZ8Ig+VT0
         F7hNZq/jqNJZJ85IjqHZZgih48uYValEVh9M5L1SMFRAt1ON0FwH4VJdu4itV8nGvAPS
         8HSjYNCqQyIzKeVUkXmLDGp5pzJZTv257AFXd1GNG/5GD/rGhTE1AeULPoG2OZcqfY53
         gcyVYJUTkt+SQWIJe8LaiJPx9HyPZ2MhEWdczTbkqfn4wsrHZGUvTE9Xrg+zcuGzkx5H
         sjq7ou6SvS/YPMoffJp3QiJLKuVPoNgGk89sF8dpdsts1NAKHXEP/xXFV5JK11RHNx+4
         8LJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524923; x=1744129723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMKbDylLRX00t1zBwkV0jUFGN7qgwQB9ES2XuD6ppQw=;
        b=M9t3N9rcmxScNj/o99QBasZI1ItWRXACqXiKIVQof/IovdPqGu5ALkuL0E7vF1ZOXg
         k/zepmPQf9aKpZP7o4y6YAdoVLY4qmVz70fKr5V5nTCJVsUimHWDm0Yv1LGbKtdM0ZLb
         yXNpTnt9A+r2mc1s6fdpN14N43KKynA341JJQce7gEfuX4HHKUbDkLjKNVJLMEvvR2Mw
         6cEFxAf47++Tnl/ZfLAu32iRYg3R9aL+7pxN0W+rhoIVueORtencPIaf759emSpb4wMq
         ZhaSnxoOLQeuxeN3IkZw+O+4Xc3xATyZ7UGZET9LNcidzlj0TT9JgHljpGtXGKaDZcYc
         SPEg==
X-Forwarded-Encrypted: i=1; AJvYcCW+Ybo1O76sNwhzlAYe4b5eGMWCOhQLfOOehFNgBb+EkvRvThUkr6a9VUx9v4b9T4viJMOjVXQucHY3D7Yb7dLu1g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwDdEyDl7NyqXH8lLDH4E6/gVL/fEkckipQPEYXgKRgLC30qFmP
	0digJsCOuanUtfR40dQzEiylVOyapVuglRAfB9XBz4VPvMjAqnA6xl4IDB+UsUN74KhSN9pTKl3
	v/Y5eisQjYbgHwhiOkONMTrfnvQ8=
X-Gm-Gg: ASbGncuSY8u+xSsibufr8Drd7WCYRbojYZo6hrtd9CQwsWltFQInPzZT+XVVdy7q9zx
	1pGEOVSbP1Bm/BJ8VbPtBLzLJzzTQxTzaA7n6Pt89yMSHKJDyW40aepocdRSMt5Qnh8vrIVcR9y
	2bZ/+wu986QChYXs21xMyqxRcdYbiaqpy4brk5zYKQr6hGUeup2ryA4xMJbfF9FHeC/MaJdPE=
X-Google-Smtp-Source: AGHT+IHdh5iNgywuBdna2HBUOYoPa6tnPJsYPwjiUby94jknYYWY/5A3xzkNKWSVIjo3ZNfUdtiZLJMkdcyN9C9dJzo=
X-Received: by 2002:a05:6214:5188:b0:6d8:9ead:c665 with SMTP id
 6a1803df08f44-6eed61dd6e9mr174773576d6.27.1743524923154; Tue, 01 Apr 2025
 09:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
 <D8V4RQR2X3EF.46ET3A2PKUAL@bootlin.com> <8d4b0884-985f-4e81-a3d3-03a1abb91e73@oss.qualcomm.com>
In-Reply-To: <8d4b0884-985f-4e81-a3d3-03a1abb91e73@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Apr 2025 18:28:31 +0200
X-Gm-Features: AQ5f1JpVKARMas4WjwT_8FptN4hUcNg0ixXHMfKNElnQJGch-tApOllDX6miREU
Message-ID: <CANNYZj_aEritSc0Te9hWR+OZVQ1DDFY0b4A0Q0H148L5YjEKcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/9] mesa: upgrade to 25.0.2
To: dmitry.baryshkov@oss.qualcomm.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 16:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214141

On Tue, 1 Apr 2025 at 18:19, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> > ERROR: mesa-native-2_25.0.2-r0 do_compile: Execution of '/srv/pokybuild=
/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux=
/mesa-native/25.0.2/temp/run.do_compile.506477' failed with exit code 1
> > ...
> > | FAILED: src/intel/shaders/intel_gfx80_shaders.spv
> > | /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-53842/t=
mp/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/clc/mesa_clc ../=
mesa-25.0.2/src/intel/shaders/libintel_shaders.h ../mesa-25.0.2/src/intel/s=
haders/generate.cl ../mesa-25.0.2/src/intel/shaders/generate_draws.cl ../me=
sa-25.0.2/src/intel/shaders/generate_draws_iris.cl ../mesa-25.0.2/src/intel=
/shaders/query_copy.cl ../mesa-25.0.2/src/intel/shaders/util.cl -o src/inte=
l/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1 -DGFX_VERx10=3D80 -I/srv/=
pokybuild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86=
_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/intel/shaders/. -I/srv/pokybui=
ld/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-lin=
ux/mesa-native/25.0.2/mesa-25.0.2/src/compiler/libcl -I/srv/pokybuild/yocto=
-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux/mesa-=
native/25.0.2/mesa-25.0.2/src -I/srv/pokybuild/yocto-worker/oe-selftest-deb=
ian/build/build-st-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0=
.2/src/intel -I/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-s=
t-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/build/src/intel -I/srv/pok=
ybuild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64=
-linux/mesa-native/25.0.2/mesa-25.0.2/src/intel/genxml
> > | /bin/sh: 1: /srv/pokybuild/yocto-worker/oe-selftest-debian/build/buil=
d-st-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/clc/=
mesa_clc: not found
>
>
> I've fixed all other issues, except the x32 (working on reproducing it
> now) and this one. Would you have a pointer to the build job?

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1264/ste=
ps/14/logs/stdio

This is in context of oe-selftest, but it is simply building
qemu-system-native on debian 12 - I suspect the mesa-native fail is
specific to that host distro. I can try to reproduce if you need help
with it.

Alex

