Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFEE7D71B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 13:35:50 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id h1so11163333qtp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 06:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=CyBkZPbO0j2oXlRAQyD5S/lNa6TDVX333/W35Ts0Qbs=;
	b=b0KUe/LKt+NybSunx6ey2y3lBPolAN1aYUVjbHHUYr/zcn3yobije4/EyBydNMpqJh
	jPSe7xA5wwivA8+3V4dP3MNWHyeAhZLpG6foxEkV29J/XzTtl/E7XITanhzaFlo6OjJL
	FR3xtRSizNJFoblnBKT+PD5ZdbRRc+12ngs4LEuerlPVmOLG18oUYm1NntYqqDoRqrq/
	HtGNPByWYhNTlV38ENMjIaCqkw2/7LWqFmfW3bnM3NY+bYyt+e7fvT8j5+hE6BnTTOoW
	mM2ZneOFibNCtCq0Z0CpUkIGdZ4Kw/5DmewNwA8rjKA1eV3KMDpV33ZeYc4jQvoM2OYk
	UfVg==
X-Gm-Message-State: APjAAAUSPebNNqtLgnblQGxWi4/q/riMqXiSgEjLh1KGErdVP6tZcbz5
	HhYGhuIRJZd0qEVjBg0yltPE3rOgLCA=
X-Google-Smtp-Source: APXvYqz3gnmqqCDHVjlrx2IlsYpbD6+EhNofmR6BFG0PnUa1usS8C4IHByEt6aFzILQD2OjwZG/Ffw==
X-Received: by 2002:ac8:294c:: with SMTP id z12mr29910705qtz.79.1557840951750; 
	Tue, 14 May 2019 06:35:51 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	p37sm13866594qtj.90.2019.05.14.06.35.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 14 May 2019 06:35:50 -0700 (PDT)
Message-ID: <4ac2274b49372290718a2b59175407bc736118ff.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 14:35:48 +0100
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: RDEPENDS kernel-image-zimage & kernel.bbclass PKG name
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
X-List-Received-Date: Tue, 14 May 2019 13:35:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

As part of the build, kernel packages are renamed, e.g.
kernel-image-zimage basically becomes
kernel-image-zimage-${KERNEL_VERSION}

When a package created by recipe B RDEPENDS on kernel-image-zimage,
the ipk generated ultimately depends on
kernel-image-zimage-${KERNEL_VERSION} (not kernel-image-zimage).
Once the kernel is updated, it appears as though recipe B is not
repackaged, so the package still runtime depends on the original
kernel, which doesn't exist anymore, and thus building the image
fails.

Specifically, I have
MACHINE_EXTRA_RDEPENDS += "kernel-image-zimage"
in my BSP, and hence packagegroup-machine-base runtime depends on
kernel-image-zimage-4.9.11-cl-som-imx7-5.1+gc27010d99a3d.
Updating the kernel doesn't trigger a rebuild of packagegroup-machine-base,
so things fail for me.


Am I missing something in my BSP? I could probably do a bbappend
on packagegroup-base.bb and add something like
do_packagedata[depends] += "virtual/kernel:do_packagedata"

This doesn't seem right, though.


Any ideas or thoughts?


Cheers,
Andre'



