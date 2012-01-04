Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiSxG-0002e5-3f for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 16:40:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04FXHOA020183
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 15:33:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19653-05 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 15:33:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04FX8jl020177
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 15:33:09 GMT
Message-ID: <1325691189.20759.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 15:33:09 +0000
In-Reply-To: <1325689535.28005.59.camel@phil-desktop>
References: <1325689535.28005.59.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sstate compression
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
X-List-Received-Date: Wed, 04 Jan 2012 15:40:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 15:05 +0000, Phil Blundell wrote:
> Has anybody experimented with the effects of using different/no
> compression for the sstate packages? 
> 
> I happened to notice that, for one of my builds, oe was spending a
> noticeable amount of time gzipping the tarfiles for sstate.  Obviously
> this indicates that I should get myself a better computer, but I do
> wonder whether there is a different tradeoff that can be made here.
> 
> Taking one of my webkit sstate archives as an example, the uncompressed
> tarfile is 112M. 
> 
> gzip (default compression) reduces this to 28M in about 4.2 seconds.
> gzip -1 reduces it to 33M in about 1.75 seconds.
> lzop reduces it to 40M in about 0.75 seconds.
> 
> Presumably the same sort of considerations apply to the compressed data
> inside .ipks, though of course the file sizes there tend to be rather
> smaller so I guess the impact is less.
> 
> I'm currently setting GZIP="-1" in my local configuration since that's
> easy to arrange and seems to produce a worthwhile benefit.  It's not
> totally obvious to me whether switching to lzo would be a net win or a
> loss, but either way this would involve hacking sstate.bbclass and I was
> too lazy to do that so far.

There has already been a patch allowing different compression mechanisms
from Matthew posted on this mailing list. Its not been merged yet as I'd
really prefer one format and we didn't (and still don't) have good
statistics about what the tradeoffs are.

Where the sstate tarballs are hitting the network, size probably is more
important than speed. There are also a number of oustanding bugs todo
with bootstrap of sstate alongside gzip-native, tar-native and so on
since things can fail when these are half installed in a sysroot and
something executes using them :/.

Cheers,

Richard



