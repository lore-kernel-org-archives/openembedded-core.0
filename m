Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlQfe-0006lj-8v
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 21:18:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6PJEHPW027518
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:14:17 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 25 Jul 2011 12:14:17 -0700
Message-ID: <4E2DC088.6070801@windriver.com>
Date: Mon, 25 Jul 2011 14:14:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<b7b6ab25887f5d5fcc541f44287942e1ccd150af.1311601422.git.richard.purdie@linuxfoundation.org>
	<1311603225.30326.229.camel@phil-desktop>
In-Reply-To: <1311603225.30326.229.camel@phil-desktop>
Subject: Re: [PATCH 4/5] ncurses: Uncompress man pages
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
X-List-Received-Date: Mon, 25 Jul 2011 19:18:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/25/11 9:13 AM, Phil Blundell wrote:
> On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
>> From: Mark Hatle <mark.hatle@windriver.com>
>>
>> If the man pages are compressed, then they cause file conflicts between
>> the 32-bit and 64-bit versions of the package.
> 
> I'm slightly bemused as to why it makes a difference (for this purpose)
> whether the manpages are compressed or not, and I would have thought
> that we would generally want to ship manpages as compressed for reasons
> of disk-space efficiency.  Can you explain where exactly that conflict
> comes from and why uncompressing the man pages resolves it?

If you don't use the gzip option "-n", both the name and timestamp of the
original file is encoded into the gzip archive.  This encoding makes the
compressed versions different from one build to the next.

Uncompressing resolves this since the file contents themselves are correct.

---

As for why they are being left uncompressed, when I could just re-gzip them
using the -n option..  My expectation is I'm going to be adding a new
package.bbclass step that searches for specific documentation files (man pages
specifically) and compresses them with the correct option(s) to avoid this
conflict.  So leaving them uncompressed made the most sense to me.

(Note, almost all of the other generated man pages on the system are already
uncompressed... that was the secondary reason for the change.)


>> +inherit autotools binconfig multilib_header
>>  
>> [...]
>>
>> +	oe_multilib_header curses.h
> 
> This change isn't mentioned in either the short or long commit messages
> and, as I mentioned in my previous email, it looks like it will cause
> some complications with the LICENSE.

Yes, this should have been with the previous patch dealing with header conflicts.

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



