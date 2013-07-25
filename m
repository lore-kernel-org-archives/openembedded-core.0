Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 675AF6AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 14:18:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jul 2013 07:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,743,1367996400"; d="scan'208";a="376316216"
Received: from unknown (HELO [10.255.14.43]) ([10.255.14.43])
	by orsmga002.jf.intel.com with ESMTP; 25 Jul 2013 07:17:59 -0700
Message-ID: <51F13397.8030500@linux.intel.com>
Date: Thu, 25 Jul 2013 07:17:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1373325035-29814-1-git-send-email-sgw@linux.intel.com>
	<lysizmmle9.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<F61C6B48-CF28-4331-BEBF-19673E091E96@dominion.thruhere.net>
	<4F2BF532-D3A4-431E-8905-E4F33FBF80D5@dominion.thruhere.net>
In-Reply-To: <4F2BF532-D3A4-431E-8905-E4F33FBF80D5@dominion.thruhere.net>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] util-linux: Use PACKAGECONFIG to control pam and system config options
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
X-List-Received-Date: Thu, 25 Jul 2013 14:18:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2013 06:02 AM, Koen Kooi wrote:
>
>
>
> Op 25 jul. 2013, om 14:58 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
>
>>
>> Op 10 jul. 2013, om 18:26 heeft Enrico Scholz <enrico.scholz@sigma-chemnitz.de> het volgende geschreven:
>>
>>> Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
>>>
>>>> The PACKAGECONFIG will ensure consistent enabling and disabling of the pam and systemd related
>>>> options for configure and the correct dependencies
>>>>
>>>> v2: fixed PACKAGECONFIG line continuation grammar
>>>>    added _class-target for PACKAGECONFIG to work on target only
>>>> ...
>>>> +PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>>>> +                                ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "
>>>
>>> This does not work here. d.getVar('PACKAGECONFIG', True) evaluates to 'None'
>>> in the anonymous python function in base.bbclass so that non-systemd options
>>> are selected in systemd distributions and packaging fails in a sanity check.
>>>
>>> Using the less weak '?=' operator makes thing work as expected.
>>
>> And a different version of this patch got merged:
>>
>> 	https://github.com/openembedded/oe-core/commit/7cde7c639c53724327d981cbc0db5e123607de1c
>>
>> Which has the following bug:
>>
>> PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
>> [..]
>> PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, pam,"
>>
>> It sets 'libpam' as PACKAGECONFIG option, but the option is actually named 'pam'. The patches posted to this list don't seem to have this bug.
>
> Here's what I used with dylan + backports:
>
> commit 2f318d0f9627e1872732db1ecafaed9caeb68ebf
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date:   Thu Jul 25 14:58:27 2013 +0200
>
>      util-linux: fix PACKAGECONFIG options
>
>      The ??= operator is too weak and it's setting a non-existent PACKAGECONFIG option ('libpam' instead of 'pam').
>
>      Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>

Koen,

Good catch, can you send this as a proper patch to the OE-Core list also.

Thanks
	Sau!

> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index d373cec..3d1198a 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -47,9 +47,9 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
>                   --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
>                  usrsbin_execdir='${sbindir}' \
>   "
> -PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
> +PACKAGECONFIG_class-target ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>                                   ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "
> -PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, pam,"
> +PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
>
>   # Respect the systemd feature for uuidd
>   PACKAGECONFIG[systemd] = "--enable-socket-activation --with-systemdsystemunitdir=${systemd_unitdir}/system/, --disable-socket-activation --without-systemdsystemunitdir"
>
>
>
>

