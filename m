Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T1i9l-00058V-7F
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 20:17:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7FI5Rl9023636
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 11:05:27 -0700 (PDT)
Received: from msp-dhcp58.wrs.com (172.25.34.58) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 15 Aug 2012 11:05:27 -0700
Message-ID: <502BE4F2.9080305@windriver.com>
Date: Wed, 15 Aug 2012 13:05:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <2404459.dJBf5OQotX@helios>
	<1345029924.23275.444.camel@phil-desktop>
	<4456392.mCXMPqtakO@helios>
In-Reply-To: <4456392.mCXMPqtakO@helios>
Subject: Re: RFC: OE-Core task rework
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
X-List-Received-Date: Wed, 15 Aug 2012 18:17:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/12 8:08 AM, Paul Eggleton wrote:
> On Wednesday 15 August 2012 12:25:23 Phil Blundell wrote:
>> On Wed, 2012-08-15 at 10:46 +0100, Paul Eggleton wrote:
>>> 1) Do we rename "task" to something a little more understandable to the
>>> uninitiated, such as "package group"? The word "task" is already used in a
>>> much more natural sense within bitbake as a unit of work. Historically I
>>> believe we picked up this term from Debian but I'm not aware of
>>> significant use by other mainstream distributions.
>>
>> Yeah, I think OE inherited it from Familiar, which in turn got it from
>> Debian.  But the meaning of the term has drifted slightly through the
>> generations and, as you say, it is no longer a very accurate reflection
>> of what the packages in question are doing.
>>
>> It's never been totally obvious to me that there is much need for
>> tasks/package group recipes as such in oe-core itself; they're rather
>> more of a DISTRO policy thing and their presence in the metadata does
>> obviously have a cost in terms of parse time and memory usage.  It might
>> perhaps be worth exploring what they're actually being used for in
>> oe-core and whether those things could be better done in a different way
>> that doesn't involve having a .bb file for them.
>
> I would say without checking that these days that cost is negligible. Off the
> top of my head, the benefits we get from using recipes for tasks as opposed to
> variables or some similar construct:
>
>   * The tasks can be used and referred to on the target if desired, not just
> when you compose the image (i.e. task packages are produced and thus the
> package manager knows about them).

I think this is a key advantage.  Again, if we think of these tasks as logical 
groups of functionality, it gives an image developer (or installer) the ability 
to say "I need booting, discrete commands, python, perl, and LSB compliance." 
and get a system in the end that -should- work.

The image/installer should always be able to specify individual recipes as well, 
but often inexperienced users won't know that they need two or three recipes 
(that don't have actual dependencies on each other) to get a functionally 
complete answer.

>   * It should be slightly easier to find where tasks are defined within the
> metadata. In practice that's not always the case with the way we have named
> some of the tasks, hopefully that can be improved.
>
>   * Related to the above, they can be customised in a visible manner using
> bbappends in your own layer.
>
>   * If you inherit from task.bbclass you automatically get -dev and -dbg
> complements for the tasks defined by the recipe, which can sometimes be useful.
>
> Cheers,
> Paul
>



