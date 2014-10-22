Return-Path: <openembedded-devel@urbanec.net>
Received: from mail16.tpgi.com.au (mail16.tpgi.com.au [203.12.160.231])
	by mail.openembedded.org (Postfix) with ESMTP id EF66860233
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 14:42:19 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Thu, 23 Oct 2014 01:42:17 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail16.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9MEgE05014645; 
	Thu, 23 Oct 2014 01:42:17 +1100
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1Xgx76-0002b9-W8; Thu, 23 Oct 2014 01:42:13 +1100
Message-ID: <5447C244.70802@urbanec.net>
Date: Thu, 23 Oct 2014 01:42:12 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>,
	openembedded-core@lists.openembedded.org
References: <54380D3A.8060904@urbanec.net>
	<54395504.1020600@opendreambox.org>	<543F2484.2040901@urbanec.net>
	<544030DF.4040807@opendreambox.org>
In-Reply-To: <544030DF.4040807@opendreambox.org>
Subject: Re: [PATCH] Better support for upgrading packages in opkg and update-rc.d.bbclass
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
X-List-Received-Date: Wed, 22 Oct 2014 14:42:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for being slow to respond, I've been snowed under and dealing with 
hardware failures :-(

I'll be brief...

On 17/10/14 07:55, Andreas Oberritter wrote:
> What happens when generating rpm (and since few days deb) packages is
> that code gets injected that makes these scripts exit with return code 0
> on upgrades. This may be just a workaround to emulate opkg's
> limitations, but it may also be by design. I guess this should be
> decided upon first. Whatever we'll agree on, the most important thing is
> that all three supported package formats should behave identically.

I don't think this is a good idea. Consider the case where a package is 
being upgraded and the old package was configured to run in runlevels 3 
and 4. The new package is configured to run in runlevels 2 and 3. You 
need to run the old prerm script so that you correctly remove the script 
from all old runlevels, then you need to run the new postinst script to 
add the script to the correct runlevels. If you prevent prerm from 
running on upgrade, you will never remove the script from runlevel 4.

>>> But, on the other hand, maybe package_rpm.bbclass is wrong... ;-)

I have not studied RPM packaging. Does it use the same scripts and more 
importantly does RPM expect the same install logic? Perhaps it's not 
possible to apply the same logic to all packaging and installation systems.

> I meant to say that if package_ipk wanted to behave like package_rpm
> (and package_deb since a few days), then it would inject '[ "$1" !=
> upgrade ] || exit 0' at the beginning of postrm.

See my two points above. Perhaps one size does not fit all in this case.


>>>> +updatercd_preinst() {
>>>>    updatercd_postrm() {
>>> The two functions above don't do anything, so they should be removed.
>>
>> They are used later by update_rcd_package().
>
> If they are empty, they should be removed from update_rcd_package(),
> too. There are many more places in OE-Core where postinst scripts are
> used, and the common policy is to implement only those snippets which
> are used. Otherwise it's just a waste of space on the target systems.

I guess the logic could be changed so that if the user does not provide 
their own implementation, then nothing is generated. I haven't studied 
the code in depth to establish whether this may have a cascading effect 
down the line. I opted for the option that is less likely to cause 
unintended breakage.

>> The patch I submitted uses the "-s" flag to update-rc.d to start the
>> service when it is installed, but as far as I can tell, there is no way
>> to just stop the service using update-rc.d and the restart case will not
>> work for scripts that don't support the "restart" argument (such as
>> urandom).
>
> Isn't restart required to be implemented by LSB? Maybe we could just fix
> urandom instead. Does urandom even use update-rc.d? I don't know which
> recipe actually installs a urandom init script, to be honest.

I'm not sure what the LSB requirements are, but I did take a quick look 
through a few (random) existing scripts to determine the state of 
affairs and concluded that one can not rely on a "restart" 
implementation. The comments in init-ifupdown/init actually say that 
"restart" is deprecated and should not be used.

>> The restart case is also predicated on a number of conditions
>> that will generally evaluate to false, since the old links would have
>> been removed in prerm.
>
> I don't understand which conditions you're referring to.

It's a bit confusing to follow, but have a look at the part of the code 
that checks the existence of the links in the context of the first point 
I made in this email. If you want to support the upgrade logic properly 
(at least as far as doing things like changing the runlevels), you 
should remove the old links in prerm, which will later cause the code to 
incorrectly assume that this was not an upgrade.

Cheers,
	Peter


