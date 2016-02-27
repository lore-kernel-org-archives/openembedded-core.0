Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7364F77374
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 08:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1R8WrXw010523; Sat, 27 Feb 2016 08:32:53 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vs-XYoWRLdk0; Sat, 27 Feb 2016 08:32:53 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1R8WpBu010520
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 27 Feb 2016 08:32:52 GMT
Message-ID: <1456561971.11498.124.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 27 Feb 2016 08:32:51 +0000
In-Reply-To: <cover.1456442768.git.alejandro.hernandez@linux.intel.com>
References: <cover.1456442768.git.alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/4] Replaces udev with eudev for compatibility when using sysvinit on newer kernels
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
X-List-Received-Date: Sat, 27 Feb 2016 08:32:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-02-25 at 23:34 +0000, Alejandro Hernandez wrote:
> udev has started to fail on new kernels (4.4), due to being
> deprecated in favor
> of systemd's udev implementation. To maintain a sysvinit alternative
> we also
> need to provide an alternative to udev. Eudev is a fork of systemds
> udev,
> this new eudev recipe provides upstream udev 220 funcitonality.
> 
> - libgudev is not provided by eudev as it was with udev before
> - We can now drop usbutils_007 since usbutils_008 is now compatible
>   also with eudev, and not only with systemd's udev
> - Adds new eudev package to maintainers.inc

This doesn't correctly handle multlibs:

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
lds/675/steps/BuildImages_2/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
lds/675/steps/BuildImages_3/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
lds/675/steps/Running%20Sanity%20Tests_1/logs/stdio

The issue is that these files should be installed into /lib/udev
regardless of the multilib, they're common files, I think there is a
"nonarch" variable with the correct directory name in it.

Cheers,

Richard

