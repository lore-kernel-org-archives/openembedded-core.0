Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D6FF2731C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 21:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1HLDLUN029994; Fri, 17 Feb 2017 21:13:21 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BisCScEQID7G; Fri, 17 Feb 2017 21:13:21 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1HLDCQg029981
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 17 Feb 2017 21:13:19 GMT
Message-ID: <1487365991.4999.49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2017 13:13:11 -0800
In-Reply-To: <fe94df71a407adfc7082faff5bbe6441984a85d6.1485530988.git-series.patrick.ohly@intel.com>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
	<fe94df71a407adfc7082faff5bbe6441984a85d6.1485530988.git-series.patrick.ohly@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v5 01/12] acpica: move from meta-oe to OE-core
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
X-List-Received-Date: Fri, 17 Feb 2017 21:13:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-01-27 at 16:30 +0100, Patrick Ohly wrote:
> From: Fathi Boudra <fathi.boudra@linaro.org>
> 
> qemu support for UEFI in OE-core depends on OVMF, which needs the
> iasl
> tools provided by this recipe. There's also an iasl recipe in
> meta-luv, but than can and will be replaced by this one, thus
> reducing
> overall maintenance work.
> 
> Copied from meta-openembedded rev fa65be9ba (current master).
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>

This fails on musl:

https://autobuilder.yocto.io/builders/nightly-musl/builds/160/steps/BuildImages/logs/stdio

|      ^~~~~~~~~~~~~~
| i586-poky-linux-musl-gcc  -m32 -march=i586 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0/recipe-sysroot -c  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0=/usr/src/debug/acpica/20150515-r0 -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0/recipe-sysroot-native= -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0/recipe-sysroot=  -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -o obj/asllistsup.o ../../../source/compiler/asllistsup.c
| ../../../source/compiler/aslfiles.c: In function 'FlOpenMiscOutputFiles':
| ../../../source/compiler/aslfiles.c:595:45: error: invalid application of 'sizeof' to incomplete type 'FILE {aka struct _IO_FILE}'
|              memcpy (stderr, stdout, sizeof (FILE));
|                                              ^~~~
| Copied obj/acpiexamples to ../bin/acpiexamples

Cheers,

Richard

