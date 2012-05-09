Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SSCnY-0006Qj-M2
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 21:43:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q49JXous003083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 12:33:50 -0700 (PDT)
Received: from msp-dhcp19.wrs.com (172.25.34.19) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 12:33:49 -0700
Message-ID: <4FAAC69A.4080708@windriver.com>
Date: Wed, 9 May 2012 14:33:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1336579481.git.mark.hatle@windriver.com>
	<230ca87131ff1d90b63c277422b4c2386b638654.1336579481.git.mark.hatle@windriver.com>
	<1336591537.2494.64.camel@ted>
In-Reply-To: <1336591537.2494.64.camel@ted>
Subject: Re: [PATCH 2/2] blacklist.bbclass: Rename to OE_BLACKLIST and minor cleanup
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
X-List-Received-Date: Wed, 09 May 2012 19:43:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/12 2:25 PM, Richard Purdie wrote:
> On Wed, 2012-05-09 at 11:08 -0500, Mark Hatle wrote:
>> Revise the handling from ANGSTROM_BLACKLIST to OE_BLACKLIST.  Preserved
>> references to ANGSTROM_BLACKLIST for compatibility with existing users.
>>
>> Rearrange a bit of the code to avoid unncessary steps if the package does
>> not have a blacklist.
>>
>> Change the message generation from a note to debug, adjust the SkipPackage
>> message from:
>>
>> <distro>  DOES NOT support<recipe>  because<reason>
>>
>> to:
>>
>> Recipe<recipe>  is blacklisted:<reason>
>>
>> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
>> ---
>>   meta/classes/blacklist.bbclass |   21 ++++++++++++---------
>>   1 files changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
>> index 7bf4a73..4bf6629 100644
>> --- a/meta/classes/blacklist.bbclass
>> +++ b/meta/classes/blacklist.bbclass
>> @@ -1,20 +1,23 @@
>>   # anonymous support class from angstrom
>>   #
>> +# To use the blacklist, a distribution should include this
>> +# class in the INHERIT_DISTRO
>> +#
>> +# Modified to allow default to OE_BLACKLIST, with a fallback
>> +# to ANGSTROM_BLACKLIST for compatibility
>> +#
>>   # Features:
>>   #
>> -# * blacklist handling, set ANGSTROM_BLACKLIST_pn-blah = "message"
>> +# * blacklist handling, set OE_BLACKLIST_pn-blah = "message"
>>   #
>>
>>   python () {
>> -    import bb
>> -
>> -    blacklist = bb.data.getVar("ANGSTROM_BLACKLIST", d, 1)
>> -    pkgnm = bb.data.getVar("PN", d, 1)
>> -    distro = bb.data.getVar("DISTRO", d, 1)
>> +    blacklist = d.getVar("OE_BLACKLIST", True) or d.getVar("ANGSTROM_BLACKLIST", True)
>
> OE is pointless as a prefix here.
>
> How about PNBLACKLIST?

I was wondering about that, but was only thinking "BLACKLIST" and I thought that 
was way to generic.. PNBLACKLIST it is..

> I'm also adversed to underscores, particularly on short sets of letter
> due to overrides (note to self about considering changing the override
> character).
>
>>       if blacklist:
>> -	bb.note("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
>> -        raise bb.parse.SkipPackage("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
>> -
>> +        distro = d.getVar("DISTRO", True)
>> +        pkgnm = d.getVar("PN", True)
>> +        bb.debug(2, "%s DOES NOT support %s because %s" % (distro, pkgnm, blacklist))
>> +        raise bb.parse.SkipPackage("Recipe %s is blacklisted: %s" % (pkgnm, blacklist))
>>   }
>
> Lets also drop the distro bit and just say "Configured policy does not
> support %s since %s".
>
> We should also add a proper reason in here so how about we make
> PNBLACKLIST a set of flags? This breaks compatibility but improves
> usability and the message is a big part why we need this class in the
> first place.
>
> So the usage would be:
>
> PNBLACKLIST[gconf-dbus] = "dbus support was merged into gconf"

So stop using the override and switch to using the flags?  Should be easy to do.

> Cheers,
>
> Richard
>
>
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



