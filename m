Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id CBD5E65E94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 12:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id AC61D314F16E;
	Fri, 24 Oct 2014 14:22:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 0K7FILL__5SG; Fri, 24 Oct 2014 14:22:17 +0200 (CEST)
Received: from [172.22.22.61] (55d47408.access.ecotel.net [85.212.116.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 88DB7314F16D;
	Fri, 24 Oct 2014 14:22:17 +0200 (CEST)
Message-ID: <544A4479.8080301@opendreambox.org>
Date: Fri, 24 Oct 2014 14:22:17 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Peter Urbanec <openembedded-devel@urbanec.net>, 
	openembedded-core@lists.openembedded.org
References: <54380D3A.8060904@urbanec.net>
	<54395504.1020600@opendreambox.org>	<543F2484.2040901@urbanec.net>
	<544030DF.4040807@opendreambox.org> <5447C244.70802@urbanec.net>
In-Reply-To: <5447C244.70802@urbanec.net>
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
X-List-Received-Date: Fri, 24 Oct 2014 12:22:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 22.10.2014 16:42, Peter Urbanec wrote:
> Sorry for being slow to respond, I've been snowed under and dealing with
> hardware failures :-(
> 
> I'll be brief...
> 
> On 17/10/14 07:55, Andreas Oberritter wrote:
>> What happens when generating rpm (and since few days deb) packages is
>> that code gets injected that makes these scripts exit with return code 0
>> on upgrades. This may be just a workaround to emulate opkg's
>> limitations, but it may also be by design. I guess this should be
>> decided upon first. Whatever we'll agree on, the most important thing is
>> that all three supported package formats should behave identically.
> 
> I don't think this is a good idea. Consider the case where a package is
> being upgraded and the old package was configured to run in runlevels 3
> and 4. The new package is configured to run in runlevels 2 and 3. You
> need to run the old prerm script so that you correctly remove the script
> from all old runlevels, then you need to run the new postinst script to
> add the script to the correct runlevels. If you prevent prerm from
> running on upgrade, you will never remove the script from runlevel 4.

I guess it should be possible for update-rc.d to update the symlinks in
postinst if desired (remove unused ones, add new ones).

Anyway, ignoring or even breaking rpm and deb is not an option.

>>>> But, on the other hand, maybe package_rpm.bbclass is wrong... ;-)
> 
> I have not studied RPM packaging. Does it use the same scripts and more
> importantly does RPM expect the same install logic? Perhaps it's not
> possible to apply the same logic to all packaging and installation systems.

To the extend used by OE-Core, rpm uses the same install logic.

>> I meant to say that if package_ipk wanted to behave like package_rpm
>> (and package_deb since a few days), then it would inject '[ "$1" !=
>> upgrade ] || exit 0' at the beginning of postrm.
> 
> See my two points above. Perhaps one size does not fit all in this case.
> 
> 
>>>>> +updatercd_preinst() {
>>>>>    updatercd_postrm() {
>>>> The two functions above don't do anything, so they should be removed.
>>>
>>> They are used later by update_rcd_package().
>>
>> If they are empty, they should be removed from update_rcd_package(),
>> too. There are many more places in OE-Core where postinst scripts are
>> used, and the common policy is to implement only those snippets which
>> are used. Otherwise it's just a waste of space on the target systems.
> 
> I guess the logic could be changed so that if the user does not provide
> their own implementation, then nothing is generated. I haven't studied
> the code in depth to establish whether this may have a cascading effect
> down the line. I opted for the option that is less likely to cause
> unintended breakage.

Please just remove them. Users of update-rc.d.bbclass don't need to
override updatercd_preinst if it is empty. All recipes are allowed to
implement their own preinst snippets the way they need to and don't
depend on update-rc.d.bbclass for this.

Preinst scripts are not a feature of update-rc.d.bbclass, but are used
in many places and many classes just append shell snippets as they see fit.

>>> The patch I submitted uses the "-s" flag to update-rc.d to start the
>>> service when it is installed, but as far as I can tell, there is no way
>>> to just stop the service using update-rc.d and the restart case will not
>>> work for scripts that don't support the "restart" argument (such as
>>> urandom).
>>
>> Isn't restart required to be implemented by LSB? Maybe we could just fix
>> urandom instead. Does urandom even use update-rc.d? I don't know which
>> recipe actually installs a urandom init script, to be honest.
> 
> I'm not sure what the LSB requirements are, but I did take a quick look
> through a few (random) existing scripts to determine the state of
> affairs and concluded that one can not rely on a "restart"
> implementation. The comments in init-ifupdown/init actually say that
> "restart" is deprecated and should not be used.

Does it state any reason? How is restart different from stop and start
in the case of init-ifupdown? Most probably, init-ifupdown should never
stop or restart on upgrades in order to keep the network connection
alive in case of errors. If there are other reasons, you could just
implement restart by calling stop followed by start from within the init
script, as many other scripts already do.

If restart is working for the vast majority of recipes, then I think it
should be the default behaviour. Other recipes, if any, may choose to
implement their own scripts.

Regards,
Andreas

>>> The restart case is also predicated on a number of conditions
>>> that will generally evaluate to false, since the old links would have
>>> been removed in prerm.
>>
>> I don't understand which conditions you're referring to.
> 
> It's a bit confusing to follow, but have a look at the part of the code
> that checks the existence of the links in the context of the first point
> I made in this email. If you want to support the upgrade logic properly
> (at least as far as doing things like changing the runlevels), you
> should remove the old links in prerm, which will later cause the code to
> incorrectly assume that this was not an upgrade.
> 
> Cheers,
>     Peter
> 


