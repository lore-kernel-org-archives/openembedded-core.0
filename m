Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09A8C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 10:20:17 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web12.23844.1659954013700690596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 03:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=iDGpCmYa;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from Seans-MBP.hinnerup (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id E6480E54BA;
	Mon,  8 Aug 2022 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1659954010; bh=BabCAYwxoTzPH/RqDdestr6t49+HFCiPnRvEsyPslYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iDGpCmYaNSxaLgIzm0mMsjNQeQh6+ca2Zn3/D3B0WVMRGGDSWw3rMoX/obkV/OtaT
	 5yYSOLBQwqqHNwJPt2S7ZU35RQIEofxKZBmQFY+L7zaaHZzKEKpdnhD6DIT84xw0BW
	 upCrnws5W5O9wKsS/R9lxUbwSXVvTTGaDaMNsq6VMtMRNo9VOKDwQG1Gw+UAafW23E
	 ZuyRmLfQLHYJrq9xU4p5TerhXSj7o9rAkDYbSvfR3bZn5HEUoyvqvla+acpZH0PYCI
	 E4ERjr02onmWWUXQVg9ucHViTPfdFy7+cPr86kRwKTf4R9MCLUNdSzWIE/+mzVMzRJ
	 45H29+T+vo3tA==
Date: Mon, 8 Aug 2022 12:20:09 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	"denis@denix.org" <denis@denix.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] zlib: split SRC_URI into inc file
Message-ID: <20220808102009.ktrplj7e4eif2k7c@Seans-MBP.hinnerup>
References: <20220715115515.4012984-1-sean@geanix.com>
 <FAA024DD-6837-47D2-A00C-A37B146CA2D9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <FAA024DD-6837-47D2-A00C-A37B146CA2D9@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 10:20:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169079

On Mon, Jul 18, 2022 at 04:12:25PM +0000, Ross Burton wrote:
> This still seems overkill.  You can build minizip from inside the zlib recipe by fixing the minizip Makefile (fix posted to https://github.com/madler/zlib/pull/681) and then adding one line to do_compile:
> 
>     oe_runmake -C contrib/minizip CC="${CC}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
> 
> A corresponding manual do_install too, obviously.
> 
> Ross
>

Hi Ross,

Thanks for the patch :)

However this will create a minizip that is statically linked with zlib :(

Guess we need to add some more to the Makefile (or just use the
autotools generated one)

Something along this:

diff --git a/contrib/minizip/Makefile b/contrib/minizip/Makefile
index 4a0465f..cf9e79a 100644
--- a/contrib/minizip/Makefile
+++ b/contrib/minizip/Makefile
@@ -1,13 +1,26 @@
 CPPFLAGS = -I../..
 
-UNZ_OBJS = miniunz.o unzip.o ioapi.o ../../libz.a
-ZIP_OBJS = minizip.o zip.o   ioapi.o ../../libz.a
+libminizip_so_SOURCES = \
+	ioapi.c \
+	mztools.c \
+	unzip.c \
+	zip.c
 
-all: miniunz minizip
+miniunzip_SOURCES = miniunz.c
+miniunzip_LDADD = libminizip.so
+minizip_SOURCES = minizip.c
+minizip_LDADD = libminizip.so -lz
 
-miniunz:  $(UNZ_OBJS)
+all: libminizip.so miniunz minizip
 
-minizip:  $(ZIP_OBJS)
+libminizip.so:
+	$(CC) -fPIC -shared $(libminizip_so_SOURCES) -o libminizip.so
+
+miniunz: libminizip.so
+	$(CC) $(miniunzip_SOURCES) $(miniounzip_LDADD) -o miniunz
+
+minizip: libminizip.so
+	$(CC) $(minizip_SOURCES) $(minizip_LDADD) -o minizip
 
 test:	miniunz minizip
 	@rm -f test.*

Or?

/Sean

