Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnXJr-0005hm-80
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 16:20:59 +0100
Received: by wibhr14 with SMTP id hr14so625859wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2012 07:13:21 -0800 (PST)
Received: by 10.180.95.131 with SMTP id dk3mr26099271wib.6.1326899600960;
	Wed, 18 Jan 2012 07:13:20 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l8sm41546330wiy.5.2012.01.18.07.13.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 07:13:19 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F16D85C.6020606@ts.fujitsu.com>
Date: Wed, 18 Jan 2012 16:13:14 +0100
Message-Id: <21FB7E6C-CF0B-4A0A-BFEF-B9B50A2E9148@dominion.thruhere.net>
References: <4F16C61C.4020304@ts.fujitsu.com>	<20120118134322.GB5443@deadlock.dhs.org>
	<F2C23BA4-EF14-44A5-A4B3-B50848CD0844@dominion.thruhere.net>
	<4F16D85C.6020606@ts.fujitsu.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: How do I get rid of systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2012 15:20:59 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit


Op 18 jan. 2012, om 15:34 heeft Rainer Koenig het volgende geschreven:

> Am 18.01.2012 15:21, schrieb Koen Kooi:
> 
>> It's really easy, create your own image, no patching needed.
>> The systemd dependencies are all in ${PN}-systemd, so just 
>> don't include those in your image. I you do include ${PN}-systemd
>> in your image you shouldn't be surprised that systemd ends up in it.
> 
> Ok. Got 2 files for my image:
> 
> ---------------------8<-snip---------------------
> $ cat magna-base-image.bb
> 
> LICENSE = "MIT"
> LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
> 
> IMAGE_PREPROCESS_COMMAND = "rootfs_update_timestamp"
> 
> IMAGE_INSTALL += " \
>        angstrom-task-boot \
>        task-basic \
>        ${CONMANPKGS} \
> "
> CONMANPKGS = "connman connman-plugin-loopback connman-plugin-ethernet"
> CONMANPKGS_libc-uclibc = ""
> 
> IMAGE_DEV_MANAGER   = "udev"
> IMAGE_INIT_MANAGER  = " "
> IMAGE_INITSCRIPTS   = " "
> IMAGE_LOGIN_MANAGER = "tinylogin shadow"
> 
> export IMAGE_BASENAME = "magna-base-image"
> 
> inherit image
> 
> $ cat magna-c-image.bb
> 
> #Angstrom bootstrap image
> require magna-base-image.bb
> 
> DEPENDS += "task-base-extended \
>           "
> 
> IMAGE_INSTALL += "task-base-extended \
>            "
> 
> export IMAGE_BASENAME = "magna-c-image"
> ---------------------8<-snip---------------------
> 
> Pretty much the same what Angstrom does, just changed the
> IMAGE_INIT_MANAGER.
> 
> So where did I include ${PN}-systemd?

task-basic


