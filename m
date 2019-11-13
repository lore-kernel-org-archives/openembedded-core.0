Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id 72A4A7F7AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 20:54:50 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id d5so4164155ljl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 12:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=nyh7O6GF+OVaSTDTw+F5d1kvV+sQUZN0s26GnSFsQkk=;
	b=usg0LR8ioAWfNqhLwZIjUcgPz4CjlobAxsibYALhZB0S928OyPEKKZ0ZSm2KcoXz4c
	yvzL2z/D57B0R9pnLACoeV+mnNDKfRvlvDsHsD3qrcy/vx0zpToVHdfN/rAmahhpAju2
	NVg7FVr9L1GeYwWs09IVPhHvhQiDFI5eA4e0IxX7KDDbcq9Hi9tPTQjfK2Zlbh4Gl528
	+6xuRgN08J+pGFAUpPnILs3qh2hFTyvlIXVoyCPNxk/sPCcQ0a50Xtsu4o7nSO2TWHUM
	2fOJuX8ivjEwdLrMyE8ClZ0mN3NVTETD6tR5z8CI8NVrSE0/593SwRrS+vR5apVpYevi
	TjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=nyh7O6GF+OVaSTDTw+F5d1kvV+sQUZN0s26GnSFsQkk=;
	b=qEJ/ZF/mrezHtETGlpgFnAFAemGCm05ACFZ/XHJW6YQBuKwfEzp4porcxWVSKsdKgp
	n+gQ2wLDrmuAdsalrayqItOQD7Hi66x/bhDuzXpa2SMU9Uu2nU7FJ7G1tfVOpeg9zpzm
	FXlXzsdhAz4s671Hjf/7hHcM00Sr4fJmThA93g1+MOtK5BnvsqOFiIChCQuGu7C8ZxUh
	FcSL71d/5Rdf93FLFd1qG3D0a7UDvSaN1/+uwMwAnppRBZNgrJOFsX1k8AWj+FH1G+XR
	uglFmwIr60mcd2sEfiSsck1ziorE87kJvzR0Y2xBi1nr9fzxz/3Bp/VT3hb2cyePRuFM
	FegA==
X-Gm-Message-State: APjAAAW0UhKjVf6DYT59/lBRIcc8D0PM8OM4pkbSoFb+ffea74OHh9WN
	2LKT1h6p2Xj+ac529LIP2k44P/hvG8+xi0zpVp2kIMIb
X-Google-Smtp-Source: APXvYqxTrdL14uSu2q9PdTOuqWIcSY35YbmuL6B3nrttLExfr0BbsxSBCK7oguaUfB5ApReGUk+/z7K62goJE8OvNRw=
X-Received: by 2002:a2e:9449:: with SMTP id o9mr4182761ljh.75.1573678490379;
	Wed, 13 Nov 2019 12:54:50 -0800 (PST)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 14 Nov 2019 09:54:39 +1300
Message-ID: <CADySD0F1Rbu3H4X78HaZx8TtppA=raGcwJkQX13UXviL9FCB1g@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: How to set up custom layer correctly
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
X-List-Received-Date: Wed, 13 Nov 2019 20:54:50 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a custom layer for custom board based upon am335x-evm and custom images.

I have a master layer called "my-custom-layer" which has three sub-layers
- my-custom-distro : custom distro based upon TI's 'arago' distro, Qt
and other s/w recipe appends
- my-custom-image : custom images, packagegroups, toolchain recipes
- my-custom-machine : custom machine conf, bsp and kernel recipes

When I am building my image, it throws numerous warnings like below
for almost all packages in the image:

eudev-3.2.7-r0.3.arago5 do_package_qa: QA Issue: libudev rdepends on
u-boot-custom-src, but it isn't a build dependency, missing
u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]
WARNING: eudev-3.2.7-r0.3.arago5 do_package_qa: QA Issue: eudev
rdepends on u-boot-custom-src, but it isn't a build dependency,
missing u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]
WARNING: libinput-1.11.3-r0 do_package_qa: QA Issue: libinput rdepends
on u-boot-custom-src, but it isn't a build dependency, missing
u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]
WARNING: libinput-1.11.3-r0 do_package_qa: QA Issue: libinput-bin
rdepends on u-boot-custom-src, but it isn't a build dependency,
missing u-boot-custom in DEPENDS or PACKAGECONFIG? [build-deps]


And once sstate-cache is built and if I try to reuse it after bumping
u-boot-custom to new SRCREV then I get errors like:

Collected errors:
 * Solver encountered 2 problem(s):
 * Problem 1/2:
 *   - nothing provides u-boot-custom-src >= 2019.01+git0+b31ea1d606
needed by linux-custom-src-4.19.73+git0+d02acfec3d-gamos.wsl
 *
 * Solution 1:
 *   - do not ask to install a package providing packagegroup-ggl-base

 * Problem 2/2:
 *   - nothing provides u-boot-custom-src >= 2019.01+git0+b31ea1d606
needed by linux-custom-src-4.19.73+git0+d02acfec3d-gamos.wsl
 *
 * Solution 1:
 *   - do not ask to install a package providing packagegroup-ggl-qt

Something is definitely not right the way I am have setup my layers
but I would like to understand what is wrong, why it is wrong and what
is the recommended way to do it
Because in future I would like to add different machines, distros and
images for different custom products. That is why instead of putting
everything inside one layer I thought of keeping a separate layer for
each.

Looking forward to learning from your responses.

Thanks
Ankur

