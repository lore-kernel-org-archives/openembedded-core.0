Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jon.szymaniak@gmail.com>) id 1U3xZ4-0003lZ-Ow
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 00:41:08 +0100
Received: by mail-wi0-f182.google.com with SMTP id hi18so1435506wib.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 15:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=mZajdTzqGnhI2vIpmJIIIv7kGegjn6lH34Fcd7J2hAI=;
	b=eGO74dKSXpWLTqxmFgUPAX9wkXj4zchXlOlINM4EmX0hubs+FIjX5pqFMIvmBniIfM
	ONTrgijttemZn42sGBvbRNMSXpWu20B4ORDSLBaItFwBkHvGrHXCwY/RBUDuxZ/xehnH
	J8zx24rgibTYstTTCLe3VLP5UI66KANIubISrNSFaWIWKkRQSRpaRhhD42CN9/pP6fL+
	sDAe8WMSbWinHXhW++CfTovsWv/tvkkP3mi90TWQYYh1heDCF0ukH4o3PvV1ziFE6AXa
	zCSJ3fy0/5voo452/DzTIL/R/wgxriW7Yn1L9t//nfQkO5B9ZDAoaI4GNHcDpIKxOi8I
	mjtg==
X-Received: by 10.194.216.5 with SMTP id om5mr12715737wjc.27.1360365912608;
	Fri, 08 Feb 2013 15:25:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.30.194 with HTTP; Fri, 8 Feb 2013 15:24:52 -0800 (PST)
In-Reply-To: <CANge7vX2qS82uF=V5+JTH-Uz3wTV=Zeysg0cRc1+=QEiJjpuww@mail.gmail.com>
References: <CANge7vX2qS82uF=V5+JTH-Uz3wTV=Zeysg0cRc1+=QEiJjpuww@mail.gmail.com>
From: Jon Szymaniak <jon.szymaniak@gmail.com>
Date: Fri, 8 Feb 2013 18:24:52 -0500
Message-ID: <CANge7vX=wp8-dvhumsOXuBts9-75FV-C=f=OxQYrEA8tHaPZbg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Generating UBIs containing multiple volumes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 23:41:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I see that the image_types.bbclass's IMAGE_CMD_ubi() does the following:
  1) Creates a single-volume ubinize.cfg on the fly
  2) Runs mkfs.ubifs to create the UBIFS image
  3) Run ubinize to create a UBI image

However, I'm currently using a two-volume image: one volume for the
rootfs, and one for "user config" as shown in the below ubinize.cfg.
I'm considering making some changes to image_types.bbclass to support
this and was hoping I could get some feedback and advice.

[rootfs]
mode=ubi
image=rootfs.ubifs
vol_id=0
vol_size=200MiB
vol_type=dynamic
vol_flags=autoresize
vol_name=rootfs

[config]
mode=ubi
image=config.ubifs
vol_id=1
vol_size=8MiB
vol_type=dynamic
vol_name=config

I'd planned to stage my config.ubifs with some sane default files via
a recipe (e.g., an ubinize invocation in a do_compile). It feels like
it might be "bad practice" to have a recipe install config.ubifs
(perhaps a name with a timestamp and then a shorthand symlink, as done
with existing image files) into $(DEPLOY_DIR_IMAGE}. Any
recommendations?

Where would be an appropriate place to keep a custom ubinize.cfg? In
my case, it should always remain the same for my MACHINE. However, I'm
not certain if this would be always be the case for other folks...

Thank you,
Jon


