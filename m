Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qnu5U-0005HE-Lg
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 17:07:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p71F33aD028278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 08:03:03 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 1 Aug 2011 08:03:03 -0700
Message-ID: <4E36C026.2050804@windriver.com>
Date: Mon, 1 Aug 2011 10:03:02 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1312208782-14078-1-git-send-email-galak@kernel.crashing.org>
	<4E36BDFA.4020409@windriver.com>
	<24530743-BB87-468D-908B-4321D5C8D9F6@kernel.crashing.org>
In-Reply-To: <24530743-BB87-468D-908B-4321D5C8D9F6@kernel.crashing.org>
Subject: Re: [PATCH] eglibc_2.13: Add support for handling sqrt & sqrtf on powerpc
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
X-List-Received-Date: Mon, 01 Aug 2011 15:07:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/1/11 9:56 AM, Kumar Gala wrote:
> 
> On Aug 1, 2011, at 9:53 AM, Mark Hatle wrote:
> 
>> On 8/1/11 9:26 AM, Kumar Gala wrote:
>>> Some of powerpc's dont support the fsqrt[s] instructions so we need an
>>> implementation of the library functions for those processors.
>>>
>>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
>>> ---
>>> .../recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch |  538 ++++++++++++++++++++
>>> meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
>>> 2 files changed, 540 insertions(+), 1 deletions(-)
>>> create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
>>
>> I'm a bit confused by this patch.  Why is gcc even generating (or trying to) the
>> fsqrt instructions on cores that don't have it?  Did someone optimize gcc so
>> that it always requires fsqrt on PPC?  (This is horribly broken behavior BTW...)
>>
>> As for the patch, I don't object.. but this just looks like the wrong solution
>> to me..
>>
> 
> Mark, the issue isn't w/gcc but glibc itself.  It will use inline asm of the 'fsqrt[s]' instruction.  This we need a different implementation of the math lib functions for these cores.

Ahh, I see.  That makes a lot more sense.

--Mark

> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



