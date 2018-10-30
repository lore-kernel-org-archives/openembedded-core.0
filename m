Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
	[209.85.161.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA9E60197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 15:46:03 +0000 (UTC)
Received: by mail-yw1-f50.google.com with SMTP id d126-v6so5095119ywa.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=TjCixdOSwCzHJvVNmvOW+WknQyASE2F1kVo60xI2o4M=;
	b=q6SBNkE7SJnIHnXw9htQHFcFhnanSzU1r/NOrjAeZmP3QYVZ0ScSL0ghZrKIXlo93w
	3J/gBuu5PxkaI2uZ6QfnRsaOXV0t2tXXfZ06IrNbwxbln2vbPVGY7cVqB++8rPO+TUtD
	bHm7Ach+ykfuSrR71P3vfXJUsuIokZQFgH1dxmGXmeAlZRJwmGpX3SPplOyfoISRzyRv
	hzIFvybLxUqKirRnLaGfynuLMwRgR7z0/yRNDLo0oeDLZIqVk+7a4qEklo4rvcjX0pmJ
	Fcl2pWuqrmytVlT1+KMrir2T8tY3hJCCEQEUzEKrcJv+Bs8mYu3cpeEyooYc8BA0VdyE
	b9ig==
X-Gm-Message-State: AGRZ1gKWeN5RcbTBahbepsQf/O4wR9bXm1ckVDI+bIEnismSOAkwKLvU
	u0T8xzW0NH6vQSsGhYrUBg8ordX8
X-Google-Smtp-Source: AJdET5cyZ2AmCm8znJqCYopnOgBxjHfFgwUvQVRhaFvOLws4qLa37m+5HBdLM9xKfo88/venedZlwQ==
X-Received: by 2002:a81:b30a:: with SMTP id
	r10-v6mr3083165ywh.63.1540914362548; 
	Tue, 30 Oct 2018 08:46:02 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	g126-v6sm6515081ywf.9.2018.10.30.08.46.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Oct 2018 08:46:01 -0700 (PDT)
Message-ID: <09487c1d7e9d9a2cf0c60883ad209712c2d31dc2.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2018 15:45:59 +0000
User-Agent: Evolution 3.30.1-1 
Mime-Version: 1.0
Subject: broken sstate archives
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
X-List-Received-Date: Tue, 30 Oct 2018 15:46:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Having updated poky from 028a292001f64ad86c6b960a05ba1f6fd72199de (end-of
July) to 3b77e7b7852549dcfbc426d4ce258e6e857c0acd (mid October), at least
two broken sstate archives have been created:

* the sstate archive for update-rc.d package_write_ipk contains a broken
  main package update-rc.d_0.8-r0_all.ipk
* zlib populate_sysroot has a broken sysroot-destdir/lib/libz.so.1.2.11

For the update-rc.d case:
* tar tzvvf displays a reasonable size for all files inside the sstate
  archive
* tar xzf extracts all files and sets a size on update-rc.d_0.8-r0_all.ipk,
  but it's all NULs, and hence is broken
* for those who know midnight commander, it's 'open' displays a size of
  0 bytes for update-rc.d_0.8-r0_all.ipk in the first place


For the broken zlib sstate archive, things are similar, additionally:
* the zlib ipk packages (and their contents) contained inside
  sstate_zlib_*_package_write_ipk.tgz are actually not broken


The original (first) build resulting from my poky.git update had actually
completed successfully. It is only subsequent builds trying to use the
generated sstate artefacts that now don't work.

I can't say for sure whether or not other sstate artefacts are broken, too.


Any ideas how this could have happened? Have similar issues been seen
before?


Cheers,
Andre'



