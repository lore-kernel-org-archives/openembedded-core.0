Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 0077079035
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 15:58:16 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w7KFwGuF004966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 17:58:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1534780697;
	bh=MBi2sm8X9/uw97iHVTzUhkhwmpSfpj5O/Ifll9+z8ic=; l=1677;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=HMKeLKBqxiR81TjDbX2IAT9w9CC1gH+xpVnnZogmSiSo2cq/gRYQFk2H4L8d+s7Fl
	ohOHekpNWEXRtjgYUwzdGpEylaStjRBoq2Z/a0qN5Drb8lESLxNuskHxfRsHepSyzM
	hAkQyCrJ9gyejJxFpaEa2084sL14d7b0ifBimb6w=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w7KFw8E8014098 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Mon, 20 Aug 2018 17:58:09 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 3AD970A4462;
	Mon, 20 Aug 2018 18:06:07 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w7KFw7mT014092
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 20 Aug 2018 17:58:07 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.91) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1frmZD-006lr7-04; Mon, 20 Aug 2018 17:58:07 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <lywoslrvbf.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CANNYZj9NvALbQks02PS_Q-9cc=ZACfxWX8O3FKDC1-aP1p964A@mail.gmail.com>
Date: Mon, 20 Aug 2018 17:58:06 +0200
In-Reply-To: <CANNYZj9NvALbQks02PS_Q-9cc=ZACfxWX8O3FKDC1-aP1p964A@mail.gmail.com>
	(Alexander Kanavin's message of "Mon, 20 Aug 2018 17:14:16 +0200")
Message-ID: <lysh39rpwx.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Submission of 'emit-buildvars' class?
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
X-List-Received-Date: Mon, 20 Aug 2018 15:58:17 -0000
Content-Type: text/plain

Alexander Kanavin <alex.kanavin@gmail.com> writes:

>> we are using for some time an 'emit-buildvars' class which exports
>> bitbake variables into makefile fragments.  This class is used for for
>> developing of kernel, u-boot and other low level software and for
>> generic packaging.
>
> I don't quite understand how this is useful? Can you provide specific
> usage scenarios please?

I ma doing perhaps 70% of my development for kernel, u-boot and barebox.
Building them with the actual toolchain requires only a

| make -f ../Makefile.kernel tftp

Result is available after a few seconds on the TFTP server; when using a
specialized variant ('kbuild-file=...'), even faster so that it can be
used in Emacs flymake mode.


Ditto for other programs (testsuites or so); you write your recipe with
all the 'DEPENDS', execute the 'emit_buildvars' task and build your
application with

| make -f ../Makefile.common R=my-app

When you see that something is missing in DEPENDS, add it, reexecute
'emit_buildvars' and it will be in the per-package sysroot.  Excluding
the build time of the dependency, this won't take more than 30 seconds.


Or, it is trivial to run unfsd in the enviornment of the image recipe
and to build kernel modules with

| make -f ../Makefile.kernel modules modules-install

These modules will be installed there and can be used immediately on the
target system:

| # rmmod foo-module
| # modprobe foo-module


I do not know, how this can be done with plain OE.  As said, SDKs are too
heavy weighted, 'devshell' too slow and can not be scripted, 'externalsrc'
is broken, slow and can not be scripted.


Enrico

