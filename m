Return-Path: <pirobk@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id ED26D65F99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 08:14:46 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id e51so1465885eek.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 01:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=TXpZe7y+L4fUjxiUM7+V/l/07tLnnTTCL5VAIwxltJ8=;
	b=M9XNtoY9NDAOUKjnT5T5dm1ya4YG/Kzb9ut1gbGWyVzcMx3U9FkudsybdCex/nCFKF
	TDqli8UlGAJG5tAdUdukX0Ur34hV8R0eIi+0N94ovqKpm13gxlxTGEk24sLYEg2SUf+o
	88wXG5qGLmn4wjReklwA9ANEY+ZH4XXYpfRRFrpqCnd9g/1dTHFqUgudWC0O5trU16lV
	tulyHBhG7hHv6vgfTkJMe9BMmGfKN4d5fTifn89cT+kQogIYHMI1Qz1MK1MDzXUloGKl
	oFRHsKUoN6dUVLlxPEpTPfteEFFJv0xT3BoBVFbaU9UxpwjKvJUDlKYUchU3eGWKMry2
	jTDQ==
X-Received: by 10.14.4.70 with SMTP id 46mr1213142eei.116.1399364087388;
	Tue, 06 May 2014 01:14:47 -0700 (PDT)
Received: from [192.168.1.149] (p5DCFD013.dip0.t-ipconnect.de. [93.207.208.19])
	by mx.google.com with ESMTPSA id
	t50sm36389394eev.28.2014.05.06.01.14.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 May 2014 01:14:46 -0700 (PDT)
Message-ID: <536899F5.1030104@gmail.com>
Date: Tue, 06 May 2014 10:14:45 +0200
From: =?ISO-8859-1?Q?Bj=F6rn_Krombholz?= <pirobk@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Tue, 06 May 2014 08:14:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

I'm having trouble building a working toolchain (meta-toolchain) on yocto-1.4 release.

Buildsystem is x86_64, on current Debian Sid.

The problem seems to be with ld-linux[...].so, SDKMACHINE doesn't seem to matter (x86_64 and i686 produce broken binaries).

The effect is, that (almost) every binary in the toolchain segfaults when being run.


Example m4:
(in /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux)

Host ld:
$ usr/bin/m4 --help
Segmentation fault

Explicitly using the toolchain ld:
$ lib/ld-linux-x86-64.so.2 usr/bin/m4 --help
Usage: usr/bin/m4 [OPTION]... [FILE]...
[...]


Comparing the build with a toolchain created on Jul 30th 2013 (which works fine) I see one major difference:

Old (working) toolchain:
$ ldd m4
        linux-vdso.so.1 (0x00007fffdae00000)
        libc.so.6 => /usr/local/oecore-x86_64.old_201307/sysroots/x86_64-angstromsdk-linux/usr/bin/./../../lib/libc.so.6 (0x00007f6a71ed0000)
        /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f6a72280000)


New (broken) toolchain:
$ ldd m4
        linux-vdso.so.1 (0x00007fff36e00000)
        libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/./../../lib/libc.so.6 (0x00007f00e7860000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f00e7c10000)


The internal toolchain (from tmp/build/) is working fine, though the ldd output looks similar to the broken built one:

[...]build/tmp-angstrom_v2013_06-eglibc/sysroots/x86_64-linux/usr/bin$ ldd m4 
        linux-vdso.so.1 (0x00007fff9fdc8000)                                                                                                                                                                                                                                   
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f481cda8000)                                                                                                                                                                                                      
        /lib64/ld-linux-x86-64.so.2 (0x00007f481d188000)

ATM, on Debian Sid /lib64/ld-linux-x86-64.so.2 is just a link /lib64/ld-linux-x86-64.so.2 -> /lib/x86_64-linux-gnu/ld-2.18.so

I'd appreciate if someone could give me a hint on this matter, or a point me in a direction, where the problem might be.
As mentioned I already tried changing the SDKMACHINE and a completely clean build folder with no effect.


Thanks
Björn



-- 
Björn Krombholz
pironex GmbH -- http://www.pironex.de

