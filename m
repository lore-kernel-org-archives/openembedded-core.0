Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RYGAU-000182-Ez
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 13:00:10 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 111FDEB778
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2011 12:27:24 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApEcADhN305T4zgTPGdsb2JhbAAMN6pqAQEBATeCJAEBAQECAQEBATU2CgYLCxgJFg8JAwIBAgEVARsUBg0GAgEBiAMItWaLNASSR4IkkiQ
X-IronPort-AV: E=Sophos;i="4.71,313,1320620400"; d="scan'208";a="230001704"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.19])
	by ipb1.telenor.se with ESMTP; 07 Dec 2011 12:27:20 +0100
Message-ID: <4EDF4D98.7060803@emagii.com>
Date: Wed, 07 Dec 2011 12:27:20 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EDF2360.7090402@emagii.com> <1323249403.19363.66.camel@ted>
In-Reply-To: <1323249403.19363.66.camel@ted>
Subject: Re: Possible stale tags in the download directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 07 Dec 2011 12:00:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-07 10:16, Richard Purdie wrote:
> On Wed, 2011-12-07 at 09:27 +0100, Ulf Samuelsson wrote:
>> When I look at the "downloads" location I find a lot of files called.
>>
>> "11_usagi_fix.patch.done"
>>
>> but no  "11_usagi_fix.patch" file in the directory.
>>
>> If this is a indication of that a patch has been downloaded,
>> what happens if you for some reason or other delete your
>> OE-core directory and keep the downloads directory.
>>
>> When you start from fresh, all the tags are then stale.
>>
>> (Deleting the "downloads" directory seems a bad idea)
>>
>> I think that if there should be tags in the "downloads" directory,
>> they should only reflect things which are downloaded to the
>> "downloads" directory, and nothing else.
>>
>> As for the tags in the directory, I think a better approach
>> is to download a file "tarball.tar.bz2" to a different filename first
>> I.E: "tarball.tar.bz2.in-progress"  and if the download completes
>> then move the file to "tarball.tar.bz2".
>> Should remove a lot of clutter from the "downloads" directory.
> What we've tried to do is simplify the fetcher code paths in fetch2.
> There were some many corner/special cases and different code paths it
> was near impossible to tell what was going on. One of the side effects
> is that local file:// urls do touch the done stamp in the same way as
> other downloads. The main reason for those files is now checksum
> tracking. If the done stamps were part of tmpdir, we'd keep checksumming
> the contents of the downloads at each build rather than once after the
> download. The way the implementation works, there is very little risk
> from stale stamps, it would just mean the checksum code wouldn't get
> triggered and that is likely unneeded for a local file:// url anyway.
>
> So yes, its not ideal but looking at the code I'd be surprised if a
> build ever broke due to it.
>
Maybe I am paranoid, but I think I remember seeing tarballs developing
bit rot when moved between different machines.

Could of course clean out the downloads directory, but it would be
nice if the stamps would be in a different directory.
Then I just delete the directory when I move the tarballs.

I tend to use the "downloads" directory for other build systems as well,
to avoid duplication, and having stamps in the directory could have
real bad effects.

I agree that recomputing checksums for each build is not so good,
but doing it once after moving to a new machine, or for each new user
is acceptable (at least to me).

The stamps could be stored in a central location.

     "~/.oe/downloads"  ?

Con: If you have several repositories, maybe because you
forgot to configure for your central repository,
you may be in trouble.


> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii



