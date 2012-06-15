Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sffdl-0000ia-5O
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 01:09:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jun 2012 15:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180761565"
Received: from unknown (HELO envy.home) ([10.255.12.88])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2012 15:58:37 -0700
Message-ID: <4FDBBDCE.8080704@linux.intel.com>
Date: Fri, 15 Jun 2012 15:57:18 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339650859.git.dvhart@linux.intel.com>
	<3b44305edae36265295087fb5f31d22d660599b8.1339650859.git.dvhart@linux.intel.com>
	<4FD98D3B.7060200@gmail.com> <4FDBB58C.5030208@linux.intel.com>
In-Reply-To: <4FDBB58C.5030208@linux.intel.com>
X-Enigmail-Version: 1.4.2
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
X-List-Received-Date: Fri, 15 Jun 2012 23:09:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 06/15/2012 03:22 PM, Darren Hart wrote:
> 
> 
> On 06/14/2012 12:05 AM, Khem Raj wrote:
>> On 6/13/2012 10:19 PM, Darren Hart wrote:
>>> When building very small systems, it can be useful to spawn a 
>>> shell from a simple init script, rather than a full System V
>>> Init process. This requires the shell be the session leader and
>>> be able to open the controlling terminal if it is to have job 
>>> control.
> 
>>> Enable CONFIG_CTTYHACK and CONFIG_SETSID to enable this for 
>>> distros defining the "tiny" DISTRO_FEATURE.
> 
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com> CC: OE Core
>>>  <openembedded-core@lists.openembedded.org> --- 
>>> meta/recipes-core/busybox/busybox.inc |    2 ++ 1 files
>>> changed, 2 insertions(+), 0 deletions(-)
> 
>>> diff --git a/meta/recipes-core/busybox/busybox.inc 
>>> b/meta/recipes-core/busybox/busybox.inc index 5b83d32..d07ba7e
>>>  100644 --- a/meta/recipes-core/busybox/busybox.inc +++ 
>>> b/meta/recipes-core/busybox/busybox.inc @@ -57,6 +57,8 @@ def 
>>> features_to_busybox_settings(d): busybox_cfg('nls', 
>>> distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem) 
>>> busybox_cfg('ipv4', distro_features, 
>>> 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem) busybox_cfg('ipv6', 
>>> distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem) + 
>>> busybox_cfg('tiny', distro_features, 'CONFIG_SETSID', cnf,
>>> rem) + busybox_cfg('tiny', distro_features, 'CONFIG_CTTYHACK',
>>> cnf, rem) return "\n".join(cnf), "\n".join(rem)
> 
>>> # X, Y = ${@features_to_uclibc_settings(d)}
> 
>> Enabling cttyhack and setsid could be a good thing in general 
>> (thinking of initramfs kind of images) so I would propose to
>> enable it by default and not introduce another distro knob here.
>> How much does busybox code size grow which these two features
>> turned on.?
> 
> So this struck me as strange, but I did it twice to make sure I
> didn't mess something up:
> 
> BEFORE -rwxr-xr-x 1 dvhart dvhart 2799417 2012-06-15 15:06 busybox 
> -rwxr-xr-x 1 dvhart dvhart 547872 2012-06-15 15:06
> busybox_stripped
> 
> AFTER (w/ SETSID and CTTYHACK) -rwxr-xr-x 1 dvhart dvhart 2805195
> 2012-06-15 14:45 busybox -rwxr-xr-x 1 dvhart dvhart 547872
> 2012-06-15 15:05 busybox_stripped
> 
> DELTA busybox: 5778 busybox_stripped: 0
> 
> The difference is <6k for the unstripped binary, and 0 bytes for
> the stripped binary. It must have something to do with the way
> busybox builds and enables features. The above was using my host
> strip command. I also tried building the rootfs with and without
> these features and comparing the cross-stripped binaries in the
> rootfs, delta is also 0 bytes.
> 
> So the cost is "negligible" and there is a clear advantage to
> having these two options enabled. I'll resend with a two line
> change to the defconfig to enable them.

Sorry, I hit the menuconfig/sstate bug. There is a 2560 byte
difference for including these two features. Seems reasonable to me. A
new patch has been sent to the list.

- --
Darren

> 
> -- Darren
> 
> 
>> otherwise second best thing is to keep it in poky-tiny distro 
>> layer which wants to set the policy
> 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org 
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>> 
> 
> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> 
- -- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJP273OAAoJEKbMaAwKp364D7EH/2RsItQ6k5y610GbII1Emz/n
hX85K/T9f0Pooj9axNtM9E+W3X3AoRlDCRkhlKsZo8YqYnnTCcohYhVpoH0mrnN6
CtnW3e7usrAkoRjw/1COfRUuzGnxZRhE1BY7zW2+EKEYbFOeHFTw35erxOaTK8Cc
huemQLgmtfSYnMJjig8WEDETmlKy1dBHpRscRHUdJkkivKMJdv4M3ASZ9fAG21HB
fCXO6D6pRy2B60NJJ/7VKAuvB0o64ZOlK4rjuUPL+goGayQTwt85giB5Vk2K3zkT
n1ekvtBezgYg/3Av9B16kwoiKEWZzZ2qDvSkpCh4u6bzTcXeJAaWaaYUyhQGojU=
=Yn5h
-----END PGP SIGNATURE-----


