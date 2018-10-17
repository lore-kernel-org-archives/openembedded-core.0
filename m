Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
	[209.85.167.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5C67179A9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:24:21 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id l197-v6so21553329oib.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 09:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lGD2tpwG0Cqpdpmy/xyEMnWzmWm/B8F6gxeaYOtzKX0=;
	b=rXfK+ti0DI8Eqg1iEDsgHfIxhLshohKGZqiBz94ifAtFy4E8ohEgb+OpcX8gN5iczt
	q6tZZ1vpdA0ZKRAKbr2yOTHWil7h2IJ6AonsMeLQXPRYauj9oAzMQ9rsP7wNhZRY7Z34
	r06ArjmTtskyOphbqfEwcoiYm3+SlOSgCH7b3ot/Bzm+gFVNr3LZanfI3Xcl5u1BIm5z
	rCxDlrwRxt/whGHvoDcJ6zgZ1YR28lmoxoUVEQWJkiCLQew0Jml0/zv139tusKtaf2MO
	zYWQ2XDQ/pJBvwkiN+uWhvEIZ0Nf9E1axue1d/kVzpmXGfexKLuqCbzRWyqrJS3ZZh+D
	Xb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lGD2tpwG0Cqpdpmy/xyEMnWzmWm/B8F6gxeaYOtzKX0=;
	b=HWlfd9peDNoH7mcNN+wlZzkpvbsksEXs3FnrvXv4l45RmL+A/fQAmWCI4XRLQVZbON
	FPjnx+Qh7cw5FTGC+5QxMUNyxQXxZbNpCxVQytm+eo8Kfzsu3yPfjFphIAEzIRw36OiG
	K5yUUMMH+0NF6oGH8WqsqrfkVTu2LgXsI+ePlWatv5Q9atXkk93rrdanMospGl8Na3CY
	cj3xRG78mUm3MjwXxAZnMQNVMP3JS1J7yri/a6HrykI+2aEQMCoiCaa0Yo+8n+Vid2Bx
	4ybujvTolpB4kQBblaI6ngY1HckhVEmNJVqlh2dRkYpVGNArMnZxD3UZ3n/3tBnxkmYE
	q8Yw==
X-Gm-Message-State: ABuFfogEcSNsNgLxK1z61l40ao9U0rZYOynzThYtJTtcD+YD2FIz+sFQ
	s5ONKsanZ6yBp2M2i4l5joND9n1WPyaJgEK5ElTG6w==
X-Google-Smtp-Source: ACcGV63NvAovwge3mvuMOs/A0XbpcKgZnXsC4u1oMThrecugj69ot8QL6RVZO1Cc85CojR2WEni8ATAYRmq7Sfle1eo=
X-Received: by 2002:aca:5485:: with SMTP id
	i127-v6mr10347982oib.293.1539793459168; 
	Wed, 17 Oct 2018 09:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20181017104243.801-1-pascal.bach@siemens.com>
	<20181017104243.801-3-pascal.bach@siemens.com>
In-Reply-To: <20181017104243.801-3-pascal.bach@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Oct 2018 17:24:08 +0100
Message-ID: <CAJTo0LaPjCyHwkoBo8+_9KdfZ+U+WVO+ZHkKnNgtyy7Qy4PErg@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/4] cmake.bbclass: search both sysroot-native and host for native packages
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
X-List-Received-Date: Wed, 17 Oct 2018 16:24:21 -0000
Content-Type: text/plain; charset="UTF-8"

I think I figured out why we're seeing odd failures on the
autobuilder, such as
https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/125.

The important bit of the log is:

File "/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/qemux86-poky-linux-musl/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/lib/python3.5/site-packages/libcomps/__init__.py",
line 1, in <module>
from ._libpycomps import *
ImportError: libpython3.6m.so.1.0: cannot open shared object file: No
such file or directory

The smoking gun is that oe-core doesn't have Python 3.6, but 3.5.

My suspicion is that for systems where the host has python3-devel
installed, libcomp-native's cmake is using the host python instead of
the native python in the sysroot.  I'm not sure yet if BOTH means it
searches the host before the sysroots, or if it is finding the python
binary in HOSTTOOLS and then asking that what the paths are.  Either
way, it ends up linking to the host libpython3.5.so and going into
sstate.  Another machine in the pool reuses this sstate but it doesn't
have Python 3.6 installed, so the library link is broken.

Ross

