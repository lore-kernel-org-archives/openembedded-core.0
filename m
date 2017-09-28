Return-Path: <riku.voipio@linaro.org>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 147E771974
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 23:06:21 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id g29so5310671wrg.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 16:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=doU7tbaR0dIiRZjvDZsRzINcFo+rtCdViL5HJCkk9XE=;
	b=Prm9hw4Tqh8FpYzzeNMo3+EXjPQeH/gTlWqOy0wyNH9zAbL/qzz0OQHSH5uNdwXreR
	DtYNZ4JBF/jQUDLOqqR3nuHWH1gvIv6NPuuYH0Jn87OrKfWD2drZ2M1MVIuKX2chsZqs
	/xdG6n0/Z4Cyh9hZORyjFtcJaGYuM9HQXw584=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=doU7tbaR0dIiRZjvDZsRzINcFo+rtCdViL5HJCkk9XE=;
	b=bvIgScdAA0QAzxvOmSkztLII5pJ9xElBSb11BEzjppYWyFwLFDOrIhV2MBb29U6WwF
	3vSXvz5t1WeJjzTnc+saUxHLaVtrMSxqc/7ylvdJgktMnlSF71jVh84JxniwTVVUD765
	7oHuWGFWkB4AR+M3ey4Sv1uD5UfAhkcT14oFdCRx/hDUyCkgEXFpvqOnu60Dlub8Pu5w
	viSdtJtAKw/wM4RiSK0tLLJLcO1n+o7LLPP7bz84Aepw9fjKyHen5nyC2I87qQ5Dzq0C
	gvr3ZGWJCfqmyM0oDHtSELo645KIAl8MZ21LgA4GNTyvGcsKBduHOAN8hTEkGapo+LLZ
	G0jg==
X-Gm-Message-State: AHPjjUgvonaJa0qkYCjSqHtq4GJF2yxFX2bTAadqV32Yo/iR3xOUEKcZ
	2t0NJELLgufYeIhC/brVNJegrX2CTgasNZMPJHYVRg==
X-Google-Smtp-Source: AOwi7QATnDbgZKAlQ+nrLpvYSAkFbPalU52puVPdcIYvENDeddfefF9Wc/BmhYeQgH0o9SrH1m92YFjYH1UWXw1YSng=
X-Received: by 10.46.67.29 with SMTP id q29mr2682579lja.85.1506639982533; Thu,
	28 Sep 2017 16:06:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.213.20 with HTTP; Thu, 28 Sep 2017 16:06:21 -0700 (PDT)
From: Riku Voipio <riku.voipio@linaro.org>
Date: Fri, 29 Sep 2017 02:06:21 +0300
Message-ID: <CAAqcGHk4xEzrbMxZtree8EGCAZ2mBX6X=h5w4aD2ZvQJ14=XJw@mail.gmail.com>
To: "cross-distro@lists.linaro.org" <cross-distro@lists.linaro.org>,
	debian-arm@lists.debian.org, arm@lists.fedoraproject.org, arm@gentoo.org, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, opensuse-arm@opensuse.org, 
	linux-arm@lists.infradead.org
Subject: SFO17 Cross-Distro meeting notes
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
X-List-Received-Date: Thu, 28 Sep 2017 23:06:22 -0000
Content-Type: text/plain; charset="UTF-8"

= LSE atomics problem =

Large System Extensions, part of ARMv8.1, provides new atomics
instructions. These instructions are essential for high performance
locking when you have lots of cores.

Recommendation: distributions should provide an alternative optimized
glibc with LSE atomics based locks for end users.

= Scalable Vector Extensions =

May have an ABI issue. Situation under investigation.

= Page size =

Don't assume your binaries will always execute in the page size they
were built on. Even if your distribution is built on 4K page size, be
aware that some of your users might opt to run with 64K page size
kernel - for example in containers.

Users be aware, that switching between 4K and 64K kernels may break
some data structures that depend on page size. Swap needs be
reformatted, and btrfs will explode on page size change-

= OCI spec =

With LSE, SVE, armv8.x releases coming, any containers using newer
instructions should be identified in variant field.

= Booting =

One day, booting on arm will be so boring, that nobody will bring it
up on our cross-distribution BoF. That day was not today.

RHEL only supports ACPI on arm64. Even if you are not RHEL, you should
prefer ACPI over device tree, if the former is available.

U-boot can now start EFI binaries, making u-boot an excellent platform
to implement an UEFI bios. This allows single-path installers for
distributions, where install of distribution starts always by loading
grub from EFI.

On arm64, Kernel doesn't self-decompress. The bootloaders are stringly
recommended to support decompressing kernel images. It's optional in
grub, make sure your grub does. At least iPXE and u-boot don't support
booting Image.gz on arm64, and should be fixed.

Riku

