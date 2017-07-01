Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3DA71A6B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 02:09:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6129Cod025864
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Jun 2017 19:09:12 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 30 Jun 2017 19:09:11 -0700
To: Andrew Sampson <hi@andrew.im>, <openembedded-core@lists.openembedded.org>
References: <CAKDhf7WqrrodexvZKQmyGJ2Zr2j2-jRKJfnDnMQOtMv6UJN-=A@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <982dcdc3-2d00-ee81-67ec-bccc201fa678@windriver.com>
Date: Fri, 30 Jun 2017 22:09:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAKDhf7WqrrodexvZKQmyGJ2Zr2j2-jRKJfnDnMQOtMv6UJN-=A@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: Package Manager Conflicts
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
X-List-Received-Date: Sat, 01 Jul 2017 02:09:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-06-26 06:03 PM, Andrew Sampson wrote:
> I'm attempting to setup a package feed for a board which I don't have 
> the ability to flash nor do I have access to the original image that is 
> on it.

Do you know the image was built?
Do you have access to the build scripts that were used to build the 
image? Without such information, it could be hard to produce
identically configured/tuned builds...

> 
> The image on the board comes with Smart installed.
> 
> I build an image using the information in this guide: 
> https://www.openembedded.org/wiki/OE-Core_Standalone_Setup
> 
> 
> and add my dependencies before doing: bitbake core-image-minimal and 
> bitbake package-feed
> 
> However when I attempt to install a package via smart I get this error
> 
> Committing transaction...
> error: update-alternatives-opkg-0.3.4+git0+1a708fd73d-r0 conflicts with 
> update-alternatives-cworth
> 
> I can't find any information referencing this issue, is there a way I 
> can completely strip opkg from the oe-core layer or a solution to this 
> problem?
> 
> 

In your conf/local.conf file you should have lines like:
#
# Package Management configuration
#
# This variable lists which packaging formats to enable. Multiple 
package back-ends
# can be enabled at once and the first item listed in the variable will 
be used
# to generate the root filesystems.
# Options are:
#  - 'package_deb' for debian style deb files
#  - 'package_ipk' for ipk files are used by opkg (a debian style 
embedded package manager)
#  - 'package_rpm' for rpm style packages
# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
# We default to ipk:
PACKAGE_CLASSES ?= "package_ipk"


Hopefully swapping "package_ipk" for "package_rpm" will work for you.
'deb' is not well supported in the OE world.

Is there an rpm binary on your target?



-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

