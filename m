Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SuKMW-00043j-HS
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 11:28:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2012 02:16:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173396787"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2012 02:16:32 -0700
Message-ID: <50110B50.3030900@intel.com>
Date: Thu, 26 Jul 2012 12:18:08 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
	<F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
In-Reply-To: <F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 09:28:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

What's the point of PROVIDES += dbus-x11, it build fine without it (I'm 
not questioning the correctness of this, just want to understand the 
need for it).

Radu

On 07/26/2012 11:43 AM, Koen Kooi wrote:
> Op 26 jul. 2012, om 10:42 heeft Paul Eggleton <paul.eggleton@linux.intel.com> het volgende geschreven:
>
>> On Thursday 26 July 2012 10:08:49 Koen Kooi wrote:
>>> Op 26 jul. 2012, om 08:29 heeft Radu Moisan <radu.moisan@intel.com> het
>>>> volgende geschreven:
>>>> it does not build, it complains about nothing providing dbus-x11
>>>>
>>>> Radu
>>>>
>>>> On 07/26/2012 09:17 AM, Radu Moisan wrote:
>>>>> Followed suggestions from Bugz 2261:
>>>>>
>>>>> 1) remove the --with-x/--without-x configure arguments. If you want to
>>>>> force no-discovery for native builds the correct argument is
>>>>> --disable-x11-autolaunch. This ensures that DBus looks at the build
>>>>> environment to determine whether to enable X11 bus discovery or not.
>>>>>
>>>>> 2) make the virtual/libx11 DEPENDS conditional based on the x11 distro
>>>>> feature. This makes the build dependencies reflect the feature list.
>>>>>
>>>>> 3) remove dbus-x11, meaning that dbus-launch with its potential X11
>>>>> dependency is now back in dbus where is belongs.
>>>>>
>>>>> 4) Potentially make dbus provide dbus-x11, for compatibility.
>>>>>
>>>>> Fixes [Yocto #2261]
>>>>>
>>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>>> ---
>>>>>
>>>>> meta/recipes-core/dbus/dbus.inc |   11 ++++++-----
>>>>> 1 file changed, 6 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-core/dbus/dbus.inc
>>>>> b/meta/recipes-core/dbus/dbus.inc index a75583d..9559f6f 100644
>>>>> --- a/meta/recipes-core/dbus/dbus.inc
>>>>> +++ b/meta/recipes-core/dbus/dbus.inc
>>>>> @@ -31,10 +31,10 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf
>>>>> ${sysconfdir}/dbus-1/session>>
>>>>>    DEBIANNAME_${PN} = "dbus-1"
>>>>>
>>>>> -PACKAGES =+ "${PN}-lib ${PN}-systemd
>>>>> ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}">>
>>>>> +PACKAGES =+ "${PN}-lib ${PN}-systemd"
>>>>>
>>>>> -FILES_${PN}-x11 = "${bindir}/dbus-launch"
>>>>>
>>>>> -RDEPENDS_${PN}-x11 = "${PN}"
>>>>> +# for compatibility
>>> PROVIDES += "dbus-x11"
>>>
>>>>> +RREPLACES_${PN} += "dbus-x11"
>>> RPROVIDES_${PN} += "dbus-x11"
>> For the sake of clarity, you mean both of these, not RPROVIDES instead of
>> adding RREPLACES - right?
> Correct, you need both (or rather all 3 if you include PROVIDES).
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



