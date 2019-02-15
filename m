Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 2111 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Feb 2019 13:08:43 UTC
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 232CE71984
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 13:08:43 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1gucgO-00053M-Jh
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2019 13:33:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:To:Subject:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ao58LEwZRdWGG6JTGLtQAoxFzo3uOO95rdYVXM42Bto=;
	b=TfoPLUPhJOoKItmRXsB782u0b6
	EdlFgU3m+rGtRToOEiFomRuMc+Qe+A0gMsqt3M0OOmijfvplFB0qgAUSr88bBghOTMcY1SrsOTVb9
	112TsPq8ku/sPvAaiIO12aTLmwu6eybLwWSlyg4kwycy/sGdQEmtTCN20RDTJmmK/QrQrGhoPSkmn
	A4dPruLUi39LmhO+/IQzioPOUQOqTXA5ibibbAWRrH6EfysL2Qefx2D2lfTXurIV9OkZajUIjDVMX
	hSH65qoWkeNEjYLN/26MEC3ukX00aIlHGNdboo8f7infNuHfKcIRYXZ49vgP3VCraYnzyLWz4w6Uj
	6oqcX/Kw==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>) id 1gucgK-0005jP-KI
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2019 13:33:30 +0100
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
References: <ff1a7a90-4a1e-f3d8-8c9f-8563f7847a71@pr.hu>
Message-ID: <c499f911-0286-9044-04c9-819f40d1755e@pr.hu>
Date: Fri, 15 Feb 2019 13:33:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <ff1a7a90-4a1e-f3d8-8c9f-8563f7847a71@pr.hu>
X-Spam-Score: -1.2 (-)
X-Scan-Signature: f51b28b80251e2f33265d70a8f4dc624
X-Spam-Tracer: backend.mail.pr.hu -1.2 20190215123330Z
Subject: Re: dracut is impossible to run in do_rootfs
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
X-List-Received-Date: Fri, 15 Feb 2019 13:08:44 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi again,

I am now replying to myself.

If anyone is interested, I have solved it in dracut so it can use a sysroot.
See: https://github.com/dracutdevs/dracut/pull/535

Then, the dracut recipe also needs changes so it can be built as native.

A recipe is needed for a cross-compiler ldd from this:
https://gist.github.com/jerome-pouiller/c403786c1394f53f44a3b61214489e6f

Then a dracut.bbclass to be used by a kernel recipe or anything else
that wants to be included in the initramfs, like extra dracut modules
or custom boot splash themes.

I have all of this working now in Yocto 2.5 via a bbappend for dracut
and the two extras.

Eventually, I would like to upstream these changes when my dracut PR
is merged, hopefully before 050 is released.

2018. 11. 14. 10:53 keltezéssel, Böszörményi Zoltán via Openembedded-core írta:
> Hi,
> 
> I need to create the initramfs for the target build during
> do_rootfs using dracut to include systemd and plymouth into it and
> using the modules from the kernel version the image was built with.
> Currently I am on Yocto 2.5.
> 
> There are several problem I am facing.
> 
> First, the dracut recipe needs some fixes in the
> RDEPENDS/RRECOMMENDS clauses to only use subpackages of the
> recipes it depends on in class-target only. I could fix this
> with a bbappend file.
> 
> Then, all the packages in the system that use the
> update-alternatives.bbclass have unusable symlinks during the
> do_rootfs stage.
> 
> E.g. coreutils's binaries use this:
> 
> zboszormenyi@buildbox-0001 rootfs]$ ls -l usr/bin/[
> lrwxrwxrwx 1 zboszormenyi zboszormenyi 27 nov   14 03.51 usr/bin/[ -> 
> /usr/bin/lbracket.coreutils
> 
> Of course, the target of the symlink does not exist on
> the build host. As a consequence, dracut will not find anything
> that it needs to copy to the initramfs.
> 
> Is there a way to tell update-alternatives.bbclass (e.g. globally
> from my layer.conf) to just use the relative symlink it is given?
> 
> Thanks in advance,
> Zoltán Böszörményi


