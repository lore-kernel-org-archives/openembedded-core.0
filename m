Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EFF2A6E660
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:02:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y80so21485402wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 06:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3bwMcFVfNhul3vScFaKvNhKyJHeL5EsLXGkeYOYS+vI=;
	b=mzjw6NBw1PUEDkz5yt05qSjasuKCg3mpnq6aNQ7pKdSpSgl9R7lsSaQI36YX8pA7pw
	16zdJ08ys6q8Wy87ldgau/L6hG8K/xcElNohFjAgYMOe3NK/PBj0iVAqC9SOlsOPMX1N
	RSx/25gK6IHh+3EOcMNPatjT6Knis2RUlO6yBLJad6J0DEo46Yhil0A4EYKxu29PmVLT
	sTEKtp/i5RvHEDdSKxK5bJoKw1BTuBQd2NzuaasllNjbR/KvxDqZTugLqXN6CnXMT/EU
	9eyePsp6z/brfToA5hRPinmNyoXODhapWtLzrdptP2TIGXei0X3i250EKIEseCwjzhXl
	bcYg==
X-Gm-Message-State: AJaThX7iyNy7GtSM0Jb55dUh1WW1Z1RWIC5x7HQKH0+6Q0QZvREsXjGz
	egz0jwT8rksbacE3gdworQI=
X-Google-Smtp-Source: AGs4zMblO7NbsmN5n4clIwDGij5WANQHHt1oqTOHTxYsWIDe9rQNnuMU/q/riG6l52Pd+bp3jok3Ig==
X-Received: by 10.80.138.148 with SMTP id j20mr17497890edj.111.1510668155486; 
	Tue, 14 Nov 2017 06:02:35 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b17sm15648703edj.21.2017.11.14.06.02.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Nov 2017 06:02:34 -0800 (PST)
Message-ID: <1510668148.4049.71.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Nov 2017 14:02:28 +0000
In-Reply-To: <CAJTo0LbnJtZG2LTe_NsOgH5-q1y7JectDHDM0h9nJMbi5txb9w@mail.gmail.com>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
	<1510563249.4049.33.camel@andred.net>
	<a4f2cfac-2714-ef11-c4ff-308ce183f1e1@windriver.com>
	<1510654568.4049.64.camel@andred.net>
	<CAJTo0LZFWFV-ZThaf0aNxC6r8+guutmNU68759hHND7zESmc6A@mail.gmail.com>
	<CAJTo0LbnJtZG2LTe_NsOgH5-q1y7JectDHDM0h9nJMbi5txb9w@mail.gmail.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 14:02:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-11-14 at 11:41 +0000, Burton, Ross wrote:
> On 14 November 2017 at 11:34, Burton, Ross <ross.burton@intel.com> wrote:
> 
> > But don't we remove the old version from the feeds, or does that only
> > happen if the arch matches?
> > 
> 
> Well the feed pruning is working correctly:

Not for me. I created a dummy package foo_0.1.bb, with PACKAGE_ARCH =
"${MACHINE_ARCH}"

after bitbake foo:
$ build.pyro > find tmp/deploy/ipk/ -name foo*ipk
tmp/deploy/ipk/tgm_r3/f/foo/foo-dbg_0.1-r0_tgm_r3.ipk
tmp/deploy/ipk/tgm_r3/f/foo/foo-dev_0.1-r0_tgm_r3.ipk
tmp/deploy/ipk/tgm_r3/f/foo/foo_0.1-r0_tgm_r3.ipk

Removing the PACKAGE_ARCH line from that recipe and rebuilding foo gives me:

$ build.pyro > find tmp/deploy/ipk/ -name foo*ipk
tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo-dbg_0.1-r0_mips32r2el-24kec-
nf.ipk
tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo-dev_0.1-r0_mips32r2el-24kec-
nf.ipk
tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo_0.1-r0_mips32r2el-24kec-nf.ipk
tmp/deploy/ipk/tgm_r3/f/foo/foo-dbg_0.1-r0_tgm_r3.ipk
tmp/deploy/ipk/tgm_r3/f/foo/foo-dev_0.1-r0_tgm_r3.ipk
tmp/deploy/ipk/tgm_r3/f/foo/foo_0.1-r0_tgm_r3.ipk


If I bump the version, I am still left with the MACHINE_ARCH packages
(doesn't matter if I bump the version before or after the change to
PACKAGE_ARCH):
$ build.pyro > find tmp/deploy/ipk/ -name foo*ipk
tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo-dbg_0.2-r0_mips32r2el-24kec-
nf.ipk
tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo-dev_0.2-r0_mips32r2el-24kec-
nf.ipk
tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo_0.2-r0_mips32r2el-24kec-nf.ipk
tmp/deploy/ipk/tgm_r3/f/foo/foo-dbg_0.1-r0_tgm_r3.ipk
tmp/deploy/ipk/tgm_r3/f/foo/foo-dev_0.1-r0_tgm_r3.ipk
tmp/deploy/ipk/tgm_r3/f/foo/foo_0.1-r0_tgm_r3.ipk

So of course do_rootfs will pick the outdated version.

Is that an ipk / OPKG issue? Should something be removing the old packages
from deploy?


Cheers,
Andre'


