Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB636D8F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 08:34:15 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id l18so11529417wgh.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2014 00:34:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:content-transfer-encoding
	:subject:message-id:date:to:mime-version;
	bh=dLecPs1MHI70hqiLr479BqcnZK4hKms56kUoRV1CC5U=;
	b=XkuXm/Fp9XrSJGwGUNbc+agAUJh9T3puxZ5PjdemhsxRQyfhR+IMEigA5IT9g+zzXd
	Yd8blTvNnmSywdmbh9fr0Yv4epqId7FzpNEHBRZ4jUZfxTR7XoiZVt11o+i+VFQBIFjT
	zmZka8jqxkpGi4ywwRCZuq+9PfbFvddn9gpLGnzh5xUS3LAoFDrTokLG42XOd8JrL2oO
	BYZQLisjaiHptwNvHCDbCP9TFDepJgmRQvNx5vE4xSy5aqlQsC3/fKr+W9Zz3F0a5GOz
	hs/PMUQRw0xaPzkvkqpidhht1i4hHBxZFmlgz711EABcjUkAVdu2bFNfPVH62465Ze+d
	jd9w==
X-Gm-Message-State: ALoCoQkm6JFHORTYNrSCIpcdlG1glQHCHiYm4dR3vGKsSN0D7qq6Q2HSdsKp7PLOK5zygHDCvxpC
X-Received: by 10.194.192.233 with SMTP id hj9mr89288wjc.78.1391416456167;
	Mon, 03 Feb 2014 00:34:16 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id uq2sm41809567wjc.5.2014.02.03.00.34.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Feb 2014 00:34:15 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Message-Id: <31FD0B2A-3965-4D1D-A6F2-FA0B1D276273@dominion.thruhere.net>
Date: Mon, 3 Feb 2014 09:34:16 +0100
To: openembedded-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
X-Mailer: Apple Mail (2.1827)
Subject: [RFC] /etc/kernel/postinst.d/ support in kernel.bbclass
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
X-List-Received-Date: Mon, 03 Feb 2014 08:34:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

At FOSDEM last weekend I ran into Paul Barker and we chatted about our =
wishlists for package management. One of the items on my lists was drop =
in postinst scriplets. I've been working on support for the dracut =
initramfs generator in Angstrom and I have it working. In contrast to =
the current initramfs implementations in OE it does things a bit =
different:

1) The initramfs is generated at runtime using binaries from the target =
(with ldd magic to sort out libs)
2) It isn't builtin to the kernel[1]

On Fedora dracut drops a postinst script into /etc/kernel/postinst.d/ to =
ensure the initramfs gets regenerated every time the kernel packages =
gets updated.

My proposal is to add a few lines to pkg_postinst_kernel-image () in =
kernel.bbclass to run the scriptlets if present. What are your thoughts =
about that?

thanks,

Koen

[1] If you have the bootloader (grub, u-boot, gummiboot etc) pas an =
initrd and you do *NOT* set root to /dev/ram0, but to the one you want =
(e.g. /dev/mmcblk0p2) the kernel will treat the initrd as initramfs.=

