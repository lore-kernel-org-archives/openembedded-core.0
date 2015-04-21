Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 56DE871144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 07:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3L7dFqQ016413; Tue, 21 Apr 2015 08:39:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RT_1tDwmOpEY; Tue, 21 Apr 2015 08:39:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3L7d3kn016374
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Apr 2015 08:39:15 +0100
Message-ID: <1429601943.26983.74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 21 Apr 2015 08:39:03 +0100
In-Reply-To: <78a8e0beb1dd78a8461b994816267ec8848b2ca7.1427262046.git.liezhi.yang@windriver.com>
References: <cover.1427262046.git.liezhi.yang@windriver.com>
	<78a8e0beb1dd78a8461b994816267ec8848b2ca7.1427262046.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libarchive: set CLEANBROKEN
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
X-List-Received-Date: Tue, 21 Apr 2015 07:39:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-03-24 at 22:41 -0700, Robert Yang wrote:
> Errors when rebuild:
> checking for xml2-config... /path/to/tmp/sysroots/qemux86-64/usr/bin/crossscripts/xml2-config
> checking for xmlInitParser in -lxml2... no
> configure: error: in `/path/to/tmp/work/core2-64-poky-linux/libarchive/3.1.2-r0/libarchive-3.1.2':
> configure: error: Missing xml2 library
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../libarchive/libarchive_3.1.2.bb                 |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> index 96e2d50..2ac8c5e 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
>  
>  DEPENDS = "e2fsprogs-native"
>  
> +CLEANBROKEN = "1"
> +
>  PACKAGECONFIG ?= "libxml2 zlib bz2"
>  
>  PACKAGECONFIG_append_class-target = "\

I just looked into this I will explain why this worries me. We patch
libarchive to remove the reference to xml2-config in SRC_URI. For this
error to appear, the patch must have been removed.

The question is therefore why does it get removed and why isn't that an
error? Does the CVE patch get removed too?

FWIW, "bitbake libarchive -c configure -f" does not reproduce the error
and the clean broken is therefore a workaround/hack.

Actually, I just found what does break it is "bitbake libarchive -C
unpack". Why? Running "make clean" triggers configure to run again since
after unpack, the configure timestamp is more recent that config.status.

So to fix this, we just need to touch config.status (if it exists)
before running make clean. We should probably do this in the autotools
class.

Cheers,

Richard




