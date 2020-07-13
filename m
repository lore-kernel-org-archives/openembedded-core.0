Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web12.15704.1594632310041906756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 02:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4B4ysv25PVz5tlS;
	Mon, 13 Jul 2020 11:25:07 +0200 (CEST)
Date: Mon, 13 Jul 2020 11:25:06 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Pankaj Vinadrao Joshi <pankaj.vj@exaleapsemi.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] cmake is not getting installed
Message-ID: <20200713092505.zfdh4leyfobakodb@qschulz>
References: <Groupsio.1.7ylM.1594462586409601210.8UWi@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <Groupsio.1.7ylM.1594462586409601210.8UWi@lists.openembedded.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pankaj,

On Sat, Jul 11, 2020 at 03:16:26AM -0700, Pankaj  Vinadrao Joshi wrote:
> [Edited Message Follows]
> 
> Hi,
> i have built a minimal-image for RPI4 and i want cmake to be present on my image i have added following line for cmake
> 
> IMAGE_INSTALL += "libc6-dev virtual-libc-dev cmake"
> 
> but on image still i am getting an error like -sh cmake:commang not found
> 

I'm not sure you're going the right way now. It's pretty unusual I think
to use Yocto to build an image that is going to be used to build stuff.
Why don't you build whatever you want to build on the RPI, but with
Yocto on your build machine?

I think your line should be enough, depending on where you set it.

oe-pkgdata-util find-path "*/cmake" might help you find which package is
installing the cmake binary and where. But cmake looks correct at first
glance.

> Also now i am facing same issue for ssh as well i have tried to add openssh and dropbear
> 
> CORE_IMAGE_EXTRA_INSTALL += "bash e2fsprogs mtd-utils-ubifs openssh ssh-server-dropbear ssh-server-openssh"
> 
> but for this also i am getting error like *ssh command not found*
> 

I suspect you're doing something wrong because ssh-server-dropbear and
ssh-server-openssh are incompatible so your image can *NOT* compile with
both enabled.

Your CORE_IMAGE_EXTRA_INSTALL is probably not used because you put it in
the wrong place, or it's being overriden later.

You can use bitbake -e <your_imaeg_recipe> and look for the line
starting with IMAGE_INSTALL (or CORE_IMAGE_EXTRA_INSTALL) and check it's
correctly set. If not, look the few lines above to understand how the
variable is constructed.

Quentin
