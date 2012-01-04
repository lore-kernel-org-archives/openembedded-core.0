Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RiU0E-0004u0-SG
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:47:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q04GeRPq000372
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 08:40:27 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 4 Jan 2012 08:40:27 -0800
Message-ID: <4F0480FA.2020809@windriver.com>
Date: Wed, 4 Jan 2012 10:40:26 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1325642890.24646.8.camel@lenny> <1325694194.20759.23.camel@ted>
	<CABcZANkD1Dik9YDK82UJ72wMV4jLnczCKtDrPYH9gJchqjH=sQ@mail.gmail.com>
In-Reply-To: <CABcZANkD1Dik9YDK82UJ72wMV4jLnczCKtDrPYH9gJchqjH=sQ@mail.gmail.com>
Subject: Re: [poky] -dev RPM packages Require:ing all of their bitbake build dependences
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
X-List-Received-Date: Wed, 04 Jan 2012 16:47:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/4/12 10:34 AM, Chris Larson wrote:
> On Wed, Jan 4, 2012 at 9:23 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org>  wrote:
>>> Another approach would be to stop injecting -dev Requires by default.  I
>>> imagine this was done to handle the case of library A whose headers
>>> require library B.  However, a saner way to handle this I think is
>>> simply to push people to use pkg-config; IIRC a script exists to extract
>>> pkg-config dependencies from the .pc files and use that for the RPM
>>> auto-dependency phase.  That would ensure that e.g. gtk+-dev Requires:
>>> glib-dev.  This doesn't help non-pkg-config libraries, but those people
>>> should be shamed anyways =)
>>
>> I think these dependencies are wrong and need revisiting. Currently,
>> -dev and -dbg packages share the same code and its tilted more in favour
>> of -dbg than it is for -dev.
>>
>> I think the -dev packages make sense if you want to build X but not
>> build something that just depends on X. We should therefore move the
>> dependencies to a new package (need a good name) and rethink the -dev
>> package dependencies.
>
>
> I'm inclined to say let the user install the deps needed to build X
> themselves, or build it with bitbake, and let -dev work the way it
> does in other distros, the bits needed to build against X.

Ya, that seems to be the best solution for a more modern system.

This will require a combination of additional automatic dependency detection and 
also manual intervention when that detection isn't complete.

The complications with the automatic detection are around the header files... 
we'll need to detect when one header includes another, and then translate that 
to an associated -dev file.  But I know there are intentionally broken includes 
(wrapped in #if's etc..)

--Mark


