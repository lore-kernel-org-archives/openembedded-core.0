Received: from exprod5og108.obsmtp.com ([64.18.0.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.donnelly@ge.com>) id 1UVOWC-00020N-By
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 17:55:36 +0200
Received: from cinmlip10.e2k.ad.ge.com ([12.71.149.1]) (using TLSv1) by
	exprod5ob108.postini.com ([64.18.4.12]) with SMTP
	ID DSNKUXlNzA6UtwNnVTfEdPjdmZQ01sGjnET7@postini.com;
	Thu, 25 Apr 2013 08:37:51 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by cinmlip10.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	25 Apr 2013 11:37:47 -0400
Received: from selma.edi.geip.ge.com ([3.26.68.70])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 25 Apr 2013 11:37:47 -0400
Received: from [3.26.68.199] (fyvie.edi.geip.ge.com [3.26.68.199])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by selma.edi.geip.ge.com (Postfix) with ESMTPS id 07E8BE1866;
	Thu, 25 Apr 2013 16:37:46 +0100 (BST)
Message-ID: <51794DCB.5020603@ge.com>
Date: Thu, 25 Apr 2013 16:37:47 +0100
From: Martin Donnelly <martin.donnelly@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <1366896519-27520-1-git-send-email-martin.donnelly@ge.com>
	<51793CE0.7060809@windriver.com>
In-Reply-To: <51793CE0.7060809@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cracklib: generate the default dictionary on the target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 15:55:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2013 15:25, Mark Hatle wrote:
> On 4/25/13 8:28 AM, Martin Donnelly wrote:
>> Currently cracklib-native is used to generate the dictionary
>> database from the wordlist during install. Unfortunately the
>> database files are endian-specific and this results in
>> errors when the host and target endianness differ.
>>
>> This patch creates the default dictionary files on the target
>> during post-install. In order to do this the default wordlist has
>> also been compressed, this enables an unmodified cracklib-format
>> to correctly parse the input file with both busybox and GNU gzip.
>> (These behave differently if the input is uncompressed, GNU
>> gzip behaves like cat while busybox returns an error).
>>
>> Finally the cracklib-native package has been removed since
>> it is no longer used.
>
> I thought we had fixed cracklib to have a fixed endian.  If not, this is
> a bug.  We want to avoid running things like the cracklib generation on
> the target if possible, as it impacts the first boot time and read-only
> roots.
>

I had a look for any patches which fixed this but couldn't see any, 
there were some related to using dictionaries between 32 and 64-bit 
machines of the same endianness but I maybe missed another one? I wasn't 
100% happy sending it for the issues you mention but thought it better 
to post it than not.

> (I'm fine with this as a workaround, but it's not the fix I'd like.)
> I'd be happy if we simply fixed the cracklib-native to pass in an endian
> and have the right output generated.  (Note, we also have to consider
> structure alignment/packing as well.)
>

Agreed, this would be best and it's something I'll look at when I've got 
the time.

> If there isn't already a bug in the Yocto Project bugzilla, can you add
> one?
>

Done, https://bugzilla.yoctoproject.org/show_bug.cgi?id=4419

-Martin


