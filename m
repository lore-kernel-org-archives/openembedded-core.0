Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1U2pqE-00089K-Sb
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 22:14:12 +0100
Received: from [192.168.0.2] (host86-137-74-187.range86-137.btcentralplus.com
	[86.137.74.187]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id A7BE39BF8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 20:58:22 +0000 (GMT)
Message-ID: <5111726D.9080806@r-finger.com>
Date: Tue, 05 Feb 2013 20:58:21 +0000
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <B57A220D1EE1644685BA9AD5C790D20526BE045F3A@SOUTHSIDE.devonintlgroup.com>
	<50E181AF64EF4AF9835BF9FD769D9B93@intel.com>
	<B57A220D1EE1644685BA9AD5C790D20526BE045F3B@SOUTHSIDE.devonintlgroup.com>
	<510ED7B6.1010201@linaro.org>
	<F600AD7DF50F4C5793CA585286CEE7B4@intel.com>
In-Reply-To: <F600AD7DF50F4C5793CA585286CEE7B4@intel.com>
Subject: Re: OpenGL as a DISTRO_FEATURE
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
X-List-Received-Date: Tue, 05 Feb 2013 21:14:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ross,

On 03/02/13 23:35, Ross Burton wrote:
> On Sunday, 3 February 2013 at 21:33, Marcin Juszkiewicz wrote:
>> As they are different architectures you can try this:
>> 
>> DISTRO_FEATURES_wm8950 = "here copy your default DISTRO_FEATURES 
>> but skip opengl"
>> 
>> Replace wm8950 with MACHINE name. Ugly solution but should work.
> That means that Qt won't be built with GLES support.
> 
> The best approach is to probe the hardware/libraries at runtime and 
> adapt - i.e. if only GLES libraries are available use those, but a 
> lot of software doesn't support that or simple probing isn't 
> sufficient (Intel Pine Trail supports both but GL is best, Cedar 
> Trail supports both but GL is terrible).

Run-time probing is not a solution at all, because (a) we are not
talking about how to write portable GL applications, but primarily how
to package software already written by other people, and (b) with the
current OE set up run-time probing cannot work anyway (and does not,
e.g. cogl), because with two 'GL' providers there is no guarantee that
the optimal one (i.e., not the mesa software GL rasterizer), gets used.

The above scenario where someone wants to maintain a distro with
multiple target architectures is the normal thing to ask for with OE.
The fact that current OE cannot support it cleanly, and it has to be
worked around on distro level (whether by bbappends that make the GL
components machine-specific as they should be, or hacks like
DISTRO_FEATURES_my-random-machine), demonstrates that we are not doing
it right at the moment.


> It's not as simple as it appears and causes a rather large number of 
> packages to become machine-specific.

From actual experience I think this is well overstated; I dare you to
support this by real numbers :-)

Tomas

--
http://sleepfive.com


