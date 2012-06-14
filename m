Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SfAiB-0002e1-RJ
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 16:07:48 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jun 2012 06:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="165653804"
Received: from unknown (HELO envy.home) ([10.255.12.119])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2012 06:57:09 -0700
Message-ID: <4FD9ED69.50800@linux.intel.com>
Date: Thu, 14 Jun 2012 06:55:53 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <cover.1339650859.git.dvhart@linux.intel.com>
	<3b44305edae36265295087fb5f31d22d660599b8.1339650859.git.dvhart@linux.intel.com>
	<1339666865.14857.39.camel@phil-desktop>
In-Reply-To: <1339666865.14857.39.camel@phil-desktop>
X-Enigmail-Version: 1.4.2
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] busybox: Add setsid and cttyhack for tiny DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2012 14:07:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/14/2012 02:41 AM, Phil Blundell wrote:
> On Wed, 2012-06-13 at 22:19 -0700, Darren Hart wrote:
>> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
>> index 5b83d32..d07ba7e 100644
>> --- a/meta/recipes-core/busybox/busybox.inc
>> +++ b/meta/recipes-core/busybox/busybox.inc
>> @@ -57,6 +57,8 @@ def features_to_busybox_settings(d):
>>  	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
>>  	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
>>  	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
>> +	busybox_cfg('tiny', distro_features, 'CONFIG_SETSID', cnf, rem)
>> +	busybox_cfg('tiny', distro_features, 'CONFIG_CTTYHACK', cnf, rem)
>>  	return "\n".join(cnf), "\n".join(rem)
>>  
>>  # X, Y = ${@features_to_uclibc_settings(d)}
> 
> What exactly is the mission of the "tiny" DISTRO_FEATURE?  It doesn't
> seem very wholesome for it to be enabling a random grab-bag of bits in
> busybox (or anywhere else).

The idea is to avoid having to bbappend busybox and other recipes
basically. I can see how "tiny" is different than "ipv4" as it isn't
explicit it what it enables, making it a "grab-bag" as you put it.

I could come up with a term that describes systems without complex init
systems that need to be able to setup their own shells easily.

Another approach would be to just consider these two features and decide
if they shouldn't just be part of the oe-core busybox defconfig anyway.
I don't see why setsid shouldn't be. I can see arguments against
cttyhack (as it is a hack), but I wouldn't think either should be a huge
deal to just include. I thought the DISTRO_FEATURE was a reasonable
compromise between that and having to maintain a bbappend outside of
oe-core.

> 
> If poky-tiny wants those features enabled then it can, and should, ship
> its own configuration for busybox which turns them on.  I think that
> would be better than further proliferation of switches in oe-core.
> 

How would you feel about just including these two features in the
defconfig then?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




