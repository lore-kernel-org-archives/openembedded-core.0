Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RO9iH-0002da-Eu
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 16:05:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 06:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,484,1315206000"; d="scan'208";a="82934230"
Received: from unknown (HELO envy.home) ([10.255.15.140])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 06:59:01 -0800
Message-ID: <4EBA9534.1010107@linux.intel.com>
Date: Wed, 09 Nov 2011 06:59:00 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320839575.10843.165.camel@ted>
In-Reply-To: <1320839575.10843.165.camel@ted>
X-Enigmail-Version: 1.3.2
Subject: Re: bb.data.*Var -> d.*Var conversion
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
X-List-Received-Date: Wed, 09 Nov 2011 15:05:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Richard,

On 11/09/2011 03:52 AM, Richard Purdie wrote:
> I'm tempted to run the following over the metata to convert the
> bb.data.*Var(...,d) and similar expressions to the form d.*Var(...).

Oh yes please!

> 
> Why? We get a lot of people doing copy, paste and edit of the code and
> this way, we'll increase the chances of them finding better examples.
> 
> I'm still looking at the diff this generates to see if there are any
> more corner cases I need to tweak the expression for but feedback
> welcome.
> 
> sed \
> -e 's:bb.data.\(setVar([^,]*,[^,]*\), \([^ )]*\) *):\2.\1):g' \

Be sure to escape your periods, they are single character wildcards.
It's unlikely you'll match something else, but better safe than sorry.

> -e 's:bb.data.\(setVarFlag([^,]*,[^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
> -e 's:bb.data.\(getVar([^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
> -e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
> -e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
> -e 's:bb.data.\(getVar([^,]*\), \([^) ]*\) *):\2.\1):g' \
> -i `grep -ril bb.data *`

Why ignore case?

I suggest running the grep first redirected to the file, then editing
the contents to ensure you don't get things like CHANGELOG and probably
be careful with the Documentation.

The groups look sane to me.

The only other thing I'd make sure to try and watch (not necessarily
handle) are multi-line bb.data.[sg]et(Flag)? calls. I suspect there are
few enough of them, if any, that they could be managed by hand.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


