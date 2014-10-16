Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5155460DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 20:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1C3BC314EEF7;
	Thu, 16 Oct 2014 22:56:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Kwhzdlnr3CNg; Thu, 16 Oct 2014 22:56:00 +0200 (CEST)
Received: from [172.22.22.61] (55d467ef.access.ecotel.net [85.212.103.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id EA707314EEF6;
	Thu, 16 Oct 2014 22:55:59 +0200 (CEST)
Message-ID: <544030DF.4040807@opendreambox.org>
Date: Thu, 16 Oct 2014 22:55:59 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Peter Urbanec <openembedded-devel@urbanec.net>, 
	openembedded-core@lists.openembedded.org
References: <54380D3A.8060904@urbanec.net> <54395504.1020600@opendreambox.org>
	<543F2484.2040901@urbanec.net>
In-Reply-To: <543F2484.2040901@urbanec.net>
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
X-List-Received-Date: Thu, 16 Oct 2014 20:56:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Peter,

sorry, I didn't notice this reply before sending out the previous mail.
I should have looked into my normal inbox first...

On 16.10.2014 03:51, Peter Urbanec wrote:
> I have revised the patches and have taken some of your feedback on
> board. See comments further down...
> 
> On 12/10/14 03:04, Andreas Oberritter wrote:
>> On 10.10.2014 18:45, Peter Urbanec wrote:
>>> In the case of init-ifupdown, the default prerm and preinst scripts stop
>>> networking.
>>
>> I think prerm and postrm scripts should exit silently on upgrade. At
>> least that's what happens with rpm and with a patch just submitted for
>> deb [1]. I guess ipk should implement the same logic, for which your
>> patch to opkg is a prerequisite.
> 
> I modelled my changes on documented behaviour for dpkg since opkg code
> often refers to dpkg behaviour. dpkg supports error return codes from
> these scripts and can do various error handling. opkg is less featured
> in that respect at this moment, but I think in the interest of future
> compatibility (and the principle of least astonishment) the scripts
> should return non-zero to signify that the install/remove/upgrade
> process can not continue. Having said that, I really don't see many
> reasons for a prerm or postrm script to try to abort an upgrade.

Yes, opkg should behave like dpkg, I agree.

But update-rc.d just generates scripts for dpkg, opkg and rpm, using
OE-Core's expected behaviour, which may well differ from Debian.

What happens when generating rpm (and since few days deb) packages is
that code gets injected that makes these scripts exit with return code 0
on upgrades. This may be just a workaround to emulate opkg's
limitations, but it may also be by design. I guess this should be
decided upon first. Whatever we'll agree on, the most important thing is
that all three supported package formats should behave identically.

>> This part of the patch wouldn't be needed if package_ipk.bbclass
>> implemented the same logic as rpm mentioned above.
>>
>> But, on the other hand, maybe package_rpm.bbclass is wrong... ;-)
> 
> I think you have me confused here. package_ipk.bbclass tries to grab the
> prerm/postrm and preinst/postinst script variables from the package and
> writes the contents into the corresponding files within the *.ipk. These
> scripts are then run by opkg when the *.ipk files are processed.

I meant to say that if package_ipk wanted to behave like package_rpm
(and package_deb since a few days), then it would inject '[ "$1" !=
upgrade ] || exit 0' at the beginning of postrm.

>>> +# New package context, step 2
>>> +updatercd_preinst() {
>>> +case "$1" in
>>> +  upgrade)
>>> +    ;;
>>> +  *)
>>> +    ;;
>>> +esac
>>>   }
>>>   +# Old package context, step 3
>>>   updatercd_postrm() {
>>> +case "$1" in
>>> +  upgrade)
>>> +    ;;
>>> +  *)
>>> +    ;;
>>> +esac
>>> +}
>>> +
>>
>> The two functions above don't do anything, so they should be removed.
> 
> They are used later by update_rcd_package(). They could have been
> simpler, but I thought that both the presence of comments and the
> template code would serve as a reminder of the semantics of the upgrade
> process and the fact that package upgrades are different to package
> installs or removals.

If they are empty, they should be removed from update_rcd_package(),
too. There are many more places in OE-Core where postinst scripts are
used, and the common policy is to implement only those snippets which
are used. Otherwise it's just a waste of space on the target systems.

The semantics of these scripts should get documented inside the Yocto
Project docs, or, if you want to document it inline, in a more central
place like package_{deb,ipk,rpm}, where they are actually used to
assemble package metadata.

>> I have patches to update-rc.d [2] and update-rc.d.bbclass [3] to improve
>> handling of distributions with both systemd and sysvinit distro features
>> enabled. What they try to avoid is direct calls to init scripts, where
>> systemd may provide own unit files. Would it be feasible to use
>> update-rc.d to issue a restart command?
> 
> The patch I submitted uses the "-s" flag to update-rc.d to start the
> service when it is installed, but as far as I can tell, there is no way
> to just stop the service using update-rc.d and the restart case will not
> work for scripts that don't support the "restart" argument (such as
> urandom).

Isn't restart required to be implemented by LSB? Maybe we could just fix
urandom instead. Does urandom even use update-rc.d? I don't know which
recipe actually installs a urandom init script, to be honest.

> The restart case is also predicated on a number of conditions
> that will generally evaluate to false, since the old links would have
> been removed in prerm.

I don't understand which conditions you're referring to. But if prerm
was a no-op on upgrade, as with rpm and deb and opkg before your other
patch, this surely wouldn't be an issue.

Regards,
Andreas

