Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF146FFF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 09:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3T9jEis006830; Fri, 29 Apr 2016 10:45:14 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iU0Drhj5so1c; Fri, 29 Apr 2016 10:45:14 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3T9j8f7006822
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Apr 2016 10:45:10 +0100
Message-ID: <1461923108.5465.87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, oe-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Apr 2016 10:45:08 +0100
In-Reply-To: <571EE388.7040107@windriver.com>
References: <571EE388.7040107@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Make runqemu knows nothing about machine
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
X-List-Received-Date: Fri, 29 Apr 2016 09:45:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-04-26 at 11:42 +0800, Robert Yang wrote:
> Hello,
> 
> The qemu-native can boot a lot of machines, but oe-core's runqemu can
> only
> boot a few of them which are hardcoded into runqemu. I'd like to
> change
> it little to make it drop the hardcode and can boot more machines.
> Here
> are some basic thoughts, please feel free to give your comments.
> 
> runqemu is a helpful script which can help us boot images easily, but
> it
> has a lot of hard code for machine + args. I'd like to remove these
> from
> runqemu, and make it as a frame. The logical is that, who knows
> clearly
> about whether qemu can boot the machine and how to boot it (args),
> the
> answer is the machine/bsp developer, so we can:
> 
> * Add a var like QEMU_SUPPORTED = "yes/no" in the bsp conf file
> (default to no)
> * Add a var like QEMU_BOOT_ARGS = "foo" if there are special args.
> * Let do_rootfs or do_image_foo write data such as QEMU_BOOT_ARGS to
>    DEPLOY_DIR_IMAGE/runqemu/ or tmp/deploy/images/runqemu/, we can
> treat
>    the "runqemu/" dir as a database, and anything we need there, for
> example,
>    efi/pcbios, root args, and so on. We won't miss anything since all
> the
>    images which can be boot by runqemu are built by oe-core.
> * Then we can easily add supported machine to runqemu from the bsp
> itself
>    without change runqemu.
> 
> I will start working on it if there is no objections, and make sure
> it won't
> break any current supported machines.

I guess we have some decisions to make. Firstly, is that script better
in shell or python at this point? Originally, shell made sense but I'm
starting to wonder if it would be clearer in python.

If we left it as shell, I'd envisaged it going through something like
BBPATH and sourcing files from each of the layers to build up its own
list of supported machines. The trouble is we can't easily get BBPATH
in the shell environment since we can't assume bitbake and we ideally
want it to work outside of our build environment.

With the development of devtool, I'm wondering if runqemu should become
another such "command", written in python and working in any of the
environments we'd expect devtool to work (eSDK, main build). If we did
that, we'd have the layers and could easily access BBPATH and search
for additional modules to add support for additional machines.

Thoughts?

Cheers,

Richard



