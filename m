Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id AFE167D97D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 09:57:45 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v9so6835421wrq.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=6IVb0sLIxm1tI/BTGUCo5besutNQC1yaxeQEy67FfxU=;
	b=axqN2OxFG0FksqDJLwPDZxY++3mNIlqyxjELKQzT4VF/zdy+UN0sUv7KLSeMA9FEsl
	DYQv4wqvjbL3tzn56n/9vAfE6GkMP1oD8LhWVRoGXt4lIDmdacOmOmD57GreDqfx2+gC
	f0lyxwJvElHpmUX0fJgcNMl2J/YcNqsxeITH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=6IVb0sLIxm1tI/BTGUCo5besutNQC1yaxeQEy67FfxU=;
	b=OlcG/u+rxU5tKIwkDOFEeMoJIldrwSIZ1AOvBMWVnoWLE0wL7QHBUPK3HzuZLailCT
	hBhDfqI5ODL58P8WeoFGcnK2x5aq+cFOLr0GOdMbTS14dQVnI5X/lEM6wm73nOhQ8LJq
	upDnguyCRboQh4bfeF4vBptl3ML8kvqAtWUlMfyy8Oltltg02/G4T5VoechfdIhOtp4l
	oAXIrPGMA5kqNEFxeFIRpz8vSio2IRKqbSnz5EhMVrMi9RC1B2KlAbwAt1NyhkZP0OtG
	OWTrufSS79y5uDjyM0PQLKc01y8jKxxPkfcCX8M5aUxE5eGjrSwcT9WGVnnRa5n0GKh8
	pa2A==
X-Gm-Message-State: APjAAAXfctF1J6kTC+vjMv4PpnMphUMPgy1FYRHkh9nHD4B0nw4B5/xq
	sFPRF1NKlIMXFXdymx2qzQJSdb62q+c=
X-Google-Smtp-Source: APXvYqyXY/r4Zc3FU7vnBF8RtEbHcWg2At9utDwtuQl6Zfh6r0RHDXoh7WqiDhDPhuuCecT6v2eJuw==
X-Received: by 2002:adf:94e2:: with SMTP id 89mr9479728wrr.259.1572170266257; 
	Sun, 27 Oct 2019 02:57:46 -0700 (PDT)
Received: from hex ([176.12.107.140]) by smtp.gmail.com with ESMTPSA id
	s12sm1687937wrt.70.2019.10.27.02.57.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 02:57:41 -0700 (PDT)
Message-ID: <a5bb0fd6ed961516f649139e41cbdddf42ce17e2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Oct 2019 09:57:35 +0000
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: qemu rebuild contamination
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
X-List-Received-Date: Sun, 27 Oct 2019 09:57:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've been trying to figure out why we get a weird build failure with
hash equivalence enabled. Armin has also been searching for an odd
issue with warrior and the qemu tests. I may have a lead.

If you build a standard qemu:

"bitbake qemu-system-native"

and save off the resulting qemu-system-XXX binaries, then add:

PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"
PACKAGECONFIG_append_pn-qemu-system-native = " virglrenderer"
PACKAGECONFIG_append_pn-qemu-system-native = " glx"

to local.conf, then:

"bitbake qemu-system-native"

it rebuilds as expected, save off the qemu-system-XXX binaries,

then remove the local.conf entries and:

"bitbake qemu-system-native -c configure -f"
"bitbake qemu-system-native"

then save off the resulting qemu-system-XXX binaries, you'll find that
whilst these first and last sets should match, they don't. Its obvious
with "ldd qemu-system-x86_64" that the linked libraries persist from
the second to third set when they should not.

The reason is that when configuration changes, autotools.bbclass will
wipe out ${B} however qemu doesn't use the autotools class and hence B
is not cleaned for changes in configuration.

We could abstract the pieces of autotools.bbclass which do this into a
separate class, or, easier, have qemu's do_configure wipe ${B}.

Armin: This may be the issue you're searching for with warrior?

Cheers,

Richard


