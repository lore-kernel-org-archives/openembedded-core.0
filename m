Return-Path: <stefan@agner.ch>
X-Greylist: delayed 372 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Mar 2019 19:21:27 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id EB7C97CD8B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 19:21:27 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id ACAF25C12F9;
	Fri,  1 Mar 2019 20:15:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1551467712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=AT9/r7wjBCYZm4xEWfufuthF+a3Mwe9iT8J7gfzDIoY=;
	b=v+oQtY3GSPBx/eYA4XRkvEoFYEJG4c4NRuV9Ejxd1EJKQqAKV57KEceFUb8hreeneqAURe
	HqZLg7q+YU0fKkaz015ufOdjGvItwYr2OmghCbQO1+oIdj1ElNRALsjnoIBGunCEEFyq9j
	4bnAAH+KYX+0G+0Lg2OKD7wogwMfQaY=
MIME-Version: 1.0
Date: Fri, 01 Mar 2019 20:15:12 +0100
From: Stefan Agner <stefan@agner.ch>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
In-Reply-To: <6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-3-alex.kanavin@gmail.com>
	<6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
Message-ID: <1b9a376930ad3463214f725bc203a357@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] gdk-pixbuf: convert from autotools to meson
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
X-List-Received-Date: Fri, 01 Mar 2019 19:21:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.02.2019 13:29, Richard Purdie wrote:
> On Wed, 2019-02-20 at 21:10 +0100, Alexander Kanavin wrote:
>> Drop autotools-specific patches.
>>
>> Rework jku's thumbnailer patch into meson configuration.
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> We've seen it before but its happened again:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/326
> 
> I went into the failed build directory and ran "bitbake core-image-sato 
> -c testsdkext" and it succeeded so I'm not sure sure how we're going to
> debug this one...

I am not sure if it is related, but we see psplash failing with a custom
png recently.

failed to load ".../splashscreen-blue.png": Couldn’t recognize the image
file format for file “.../splashscreen-blue.png”

The psplash calls gdk-pixbuf-csource (through make-image-header.sh). We
only saw it failing when building in a Ubuntu 18.04 container, but then
reproducible.

I also noticed this (probably unrelated) in do_configure log:

DEBUG: Executing shell function do_configure
gtkdocize: neither configure.ac nor configure.in exist
NOTE: Executing meson -Denable_jpeg=true -Denable_jasper=false
-Denable_png=true -Denable_tiff=false -Dx11=false
-Dinstalled_tests=false...
The Meson build system
Version: 0.49.2
Source dir:
/workdir/oe/tmp/work/x86_64-linux/gdk-pixbuf-native/2.38.0-r0/gdk-pixbuf-2.38.0
Build dir:
/workdir/oe/tmp/work/x86_64-linux/gdk-pixbuf-native/2.38.0-r0/build
Build type: native build
WARNING: Unknown options: "enable_jasper, enable_jpeg, enable_png,
enable_tiff
...

--
Stefan

