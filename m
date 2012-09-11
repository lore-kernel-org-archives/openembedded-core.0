Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TBNvn-0000ew-GH
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 12:42:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8BAUOX9029146
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Sep 2012 03:30:24 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 11 Sep 2012 03:30:23 -0700
Message-ID: <504F12BD.8070404@windriver.com>
Date: Tue, 11 Sep 2012 18:30:21 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<4a36b4005fc384ac817023873b2febc854c4415d.1346837268.git.liezhi.yang@windriver.com>
	<1347134935.4396.235.camel@x121e.pbcl.net>
	<1905623.pDvREZZpJY@helios>
In-Reply-To: <1905623.pDvREZZpJY@helios>
Cc: "Purdie, Richard" <richard.purdie@intel.com>, Phil Blundell <philb@gnu.org>,
	Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/2] opkg svn: Add the --force-arch option
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
X-List-Received-Date: Tue, 11 Sep 2012 10:42:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi All,

Thank you very much for your suggestions, do we have a final solution
or work around please?

If we refer to the rpm, it doesn't care about the package's version, it
just selects the newest build package, I had applied a patch to make it
respect to the arch before.

It seems that we have no good solution for the PREFERRED_VERSION
pkg during the package installation, what does the package management
system knows is the arch's priority, the PREFERRED_VERSION pkg always
has a higher priority than others in the feed. So maybe respect to the
arch is the only way that we have current.

I'd like to submit such a patch if you are OK with it:

Let the arch priority win the higher version is the default way for opkg,
and add an option (--select-higher-version) for it to make the higher
version win the arch priority, so that the user can have another choice.

// Robert

On 09/09/2012 04:40 AM, Paul Eggleton wrote:
> On Saturday 08 September 2012 21:08:55 Phil Blundell wrote:
>> a) for people who are not using O_P_M, it's becoming apparent that the
>> whole concept of using opkg (or rpm, or any other external package
>> manager) for rootfs construction is more of a liability than an asset
>> because bitbake has more knowledge about which particular binaries ought
>> to be installed.  For those use-cases, it might be better to think in
>> terms of abolishing opkg altogether which would solve this problem and a
>> variety of others.
>
> On the other hand, using the package manager for rootfs construction for those
> that *are* using online package management allows us to have at least some
> confidence that a rootfs produced directly from the metadata and one produced
> by on-system upgrades will be the same; you can also have package management
> on in one image and off in another (or change it on the fly) and expect to have
> the same contents, apart from the package manager being removed. The potential
> for subtle differences in behaviour is too great to go down the path of
> implementing it ourselves IMO, not to mention the extra code paths to
> maintain.
>
>> b) for people who _are_ using O_P_M, specifying --force-arch during
>> rootfs construction is all very well but they might still lose during a
>> subsequent "opkg upgrade".  So for these use cases, it seems as though
>> something a bit more sticky might be required.
>
> In terms of a proper solution I agree with this - opkg needs to handle the
> package architecture configuration internally rather than us overriding it at
> rootfs construction time. If you're advocating spending effort implementing
> something I think that's where it should be spent.
>
> Cheers,
> Paul
>


