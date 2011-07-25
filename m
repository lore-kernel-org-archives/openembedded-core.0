Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlQWG-0006af-Pw
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 21:08:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6PJ4Zds025713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:04:35 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 25 Jul 2011 12:04:34 -0700
Message-ID: <4E2DBE41.2090202@windriver.com>
Date: Mon, 25 Jul 2011 14:04:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<f654f647aa04b5173883785af5cb062df676842a.1311601422.git.richard.purdie@linuxfoundation.org>
	<1311602379.30326.220.camel@phil-desktop>
In-Reply-To: <1311602379.30326.220.camel@phil-desktop>
Subject: Re: [PATCH 3/5] eglibc: Update 2.13 to avoid multilib conflicts
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
X-List-Received-Date: Mon, 25 Jul 2011 19:08:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/25/11 8:59 AM, Phil Blundell wrote:
> On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
>> --- /dev/null
>> +++ b/meta/recipes-core/eglibc/eglibc-2.13/arch-ia32.patch
>> @@ -0,0 +1,5309 @@
>> +Sync the i386 and x86_64 headers into one common IA32 set of headers.
>> +
>> +The goal is to ensure that any headers produced in a 32-bit or 64-bit build
>> +are not only functionally equivalent, but actually the same in order to avoid
>> +file conflicts.
>> +
>> +The only remaining conflict is the bits/syscall.h.  This is dynamically
>> +generated, and so far I've been unable to figure out how to get both
>> +i386 and x86_64 to generate the same file.  We'll need to handle this
>> +in the recipe itself.
>> +
>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> 
> This patch is missing an Upstream-Status.  It's also rather large and
> intrusive which makes it hard to review sensibly and seems like it might
> be a maintenance headache in the future.  I wonder whether it would be
> better to just put the 32-bit and 64-bit headers for eglibc in separate
> subdirectories (say /usr/include/32/... and /usr/include/64/...) and not
> bother even trying to patch them to be the same.

(still catching up on email)

Someone else asked a similar question as well.  I opened a yoctoproject bug on
this as an attempt for people to understand what the problem is and how it's
being resolved (above and beyond the explanation above).

http://bugzilla.pokylinux.org/show_bug.cgi?id=1291

It doesn't have an upstream-status on it, because I'm not exactly sure what to
do with it yet.. I was still evaluating when I went on vacation.

Some of the patches are obvious IMHO.  It's simple things like the headers not
being the same, but the contents being identical -- or slight formatting
variations in the files.  This should be something I can send upstream.

Most of the remaining items the x86_64 version of the header is "correct", but
the i386 version of the header simply doesn't have knowledge that x86_64 even
exists.  Adding that knowledge was as simple as copying the x86_64 version on
top of the i386 version.  I don't know if upstream would permit this or not.

The few remaining ones usually had assembly optimizations on the i386 version
that were not in the x86_64 version.  I merged these in order for the
optimizations to be retained.  Again, I don't know if upstream would permit this
to either the i386 or x86_64 headers.

The syscall.h is generated (as noted above).  The issue is that it's generated
differently [and subsequently used differently when building eglibc].  So using
the oe_multilib_header helper was the only reasonable alternative I could see.

As for maintenance, I see this as not terribly complex once you understand what
and why the patches exist.  Except for the two? headers that I hand merged,
everything else is obvious once you run a diff between the stock i386 and x86_64
versions.  There is no intent for "original content" to be in this patch.

(For people wondering, this generally isn't a problem on power or mips because
there is a single architecture directory that builds for both 32-bit and 64-bit.
 IA32 doesn't do this.. they have a separate 32-bit [i386] and 64-bit [x86_64]
architecture directory.. if I were asked what the root cause of the bug was, I'd
immediately point to that.  There really should be a single IA32 architecture
that is capable of building both endians.)

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



