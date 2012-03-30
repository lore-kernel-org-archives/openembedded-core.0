Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SDk4S-00082F-PO
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 00:13:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2UM4IAN029725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:04:18 -0700 (PDT)
Received: from msp-dhcp12.wrs.com (172.25.34.12) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 30 Mar 2012 15:04:19 -0700
Message-ID: <4F762DE1.5070006@windriver.com>
Date: Fri, 30 Mar 2012 17:04:17 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CABcZANnPwgsCz=f8_UhM3TZsBotBZ26FYp5Fbxjq_kYqqBs3cQ@mail.gmail.com>
In-Reply-To: <CABcZANnPwgsCz=f8_UhM3TZsBotBZ26FYp5Fbxjq_kYqqBs3cQ@mail.gmail.com>
Subject: Re: [RFC] One shared state reuse solution
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
X-List-Received-Date: Fri, 30 Mar 2012 22:13:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

(top posting, ya I know...)

We've worked on a similar problem in the past.  In specific cases we've added a 
checksum of the host's glibc to the mix.  The problem we were solving was in 
glibc uprevs during the RHEL 4 world.. new APIs would arrive and things would 
break -- or workaround would break.

Have you considered adding that to the mix in an attempt to help determine 
compatible host distributions?

I do like the idea of directory based sstate cache.  It can more easily identify 
what the components belong to.  (I wouldn't mind some type of hierarchy for the 
target stuff as well, but so far I'm not sure exactly it would look like or 
trigger off of.)

However, shy of directory based.. adjusting the generated checksum in some way 
should be enough -- the downside is how do you detect compatible hosts or not.. 
  You may have to generate multiple checksums and look for best matches, which I 
suspect is also new code.

--Mark

On 3/30/12 4:54 PM, Chris Larson wrote:
> Greetings,
>
> Over the past day, I've implemented a solution for the shared state
> reuse issues Mentor has seen with our poky-based product. This
> solution is similar in concept to what we had in our Mentor Embedded
> Linux 4 (non-yocto-based) product.
>
> This implementation restructures SSTATE_DIR such that non-target
> sstate archives are placed in a directory specific to the host we're
> running on, and allows fallback to sstates from compatible hosts. In
> addition, there is a hook in place for modifying the returned build
> host identifier string. Using these capabilities, configured as you'll
> see below at the gist, I can populate sstate-cache from a Centos5
> machine and fully reuse that shared state on a u1004 machine, but if I
> take the u1004 sstate-cache and pull it over to Centos5, all the
> non-target recipes will be rebuilt.
>
> This has a list of "compatible hosts", which are used as fallback
> regardless of what distro you're running on, so assumes you won't be
> running on a host older than the ones you're using as your
> compatibility baseline. I think this will satisfy the needs of most,
> and as you'll see when you look at the implementation, is entirely
> opt-in currently, so does no harm to anyone who chooses not to utilize
> it.
>
> https://gist.github.com/2253903 - shows an example of how to make use
> of this functionality
> https://github.com/kergoth/oe-core/compare/sstate-structure - the implementation
>
> Regarding the implementation, I realize it isn't as clean as it could
> be, but the only way to resolve it in a cleaner way would be to modify
> bitbake, which I wasn't prepared to do at this juncture. The
> fundamental issue adding complexity is that SSTATE_DIR is pulled from
> the configuration metadata, not cached per-recipe, so one can't
> manipulate where individual recipes get their archives stored. As a
> workaround, I set the global SSTATE_DIR to the host-bound location,
> then when writing the archives for target recipes, moves the archive
> up to the parent directory (to the root of the original SSTATE_DIR)
> and symlinks it back.
>
> Richard had proposed modifying the filename rather than the directory
> structure (e.g. via the sstate package arch), but this would make
> things far more complex. In order to implement fallback, one would
> have to mangle the filename, and one wouldn't be able to simply
> leverage SSTATE_MIRRORS to fetch the variants in a simple way, as it
> would have to attempt to fetch multiple filenames, which would require
> invasive changes to sstate.bbclass. I think using the directory
> structure is the easiest and cleanest route to the goal without
> invasive changes, and given it's opt-in nature, I'd like to see this
> go upstream, at a minimum as a temporary measure until/if a longer
> term more invasive solution occurs.
>
> I'm looking for questions, comments, testers, and in particular,
> thoughts on whether this will meet the needs of others with similar
> requirements (e.g. others shipping metadata with associated shared
> state).



