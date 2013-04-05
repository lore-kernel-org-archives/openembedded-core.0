Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UO654-0000XJ-0Y for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 14:49:22 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r35CgokB009820; Fri, 5 Apr 2013 13:42:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zkzu5QS1bhZT; Fri,  5 Apr 2013 13:42:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r35Cgj1Z009816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 5 Apr 2013 13:42:49 +0100
Message-ID: <1365165115.6526.177.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Fri, 05 Apr 2013 13:31:55 +0100
In-Reply-To: <515EC1B2.4060103@linaro.org>
References: <515E976C.8060302@linaro.org> <515EC1B2.4060103@linaro.org>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Does support for external toolchains working in current OE?
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
X-List-Received-Date: Fri, 05 Apr 2013 12:49:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-04-05 at 14:21 +0200, Marcin Juszkiewicz wrote:
> W dniu 05.04.2013 11:20, Marcin Juszkiewicz pisze:
> 
> > ERROR: Multiple .bb files are due to be built which each provide virtual/libc (/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb).
> >  This usually means one provides something the other doesn't and should.
> 
> Let's enable debug:
> 
> DEBUG: providers for virtual/libc are: ['eglibc', 'external-linaro-toolchain']
> NOTE: selecting external-linaro-toolchain to satisfy virtual/libc due to PREFERRED_PROVIDERS
> DEBUG: sorted providers for virtual/libc are: ['/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb', '/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb']
> DEBUG: adding /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb to satisfy virtual/libc
> DEBUG: adding /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb to satisfy virtual/libc
> 
> And now - let's dig deep into BitBake code. We want two files:
> 
> - lib/bb/providers.py
> - lib/bb/taskdata.py
> 
> 1. Bitbake jumps into taskdata/add_provider_internal(). 
> 2. Then asks bb.providers.filterProviders() 
>    "is there any provider for 'virtual/libc'"?
> 3. In providers/_filterProviders this output is printed:
>    "DEBUG: providers for virtual/libc are: ['eglibc', 'external-linaro-toolchain']"
> 4. providers/filterProviders() (note lack of "_") checks for
>    PREFERRED_PROVIDER_virtual/libc and outputs:
>    NOTE: selecting external-linaro-toolchain to satisfy virtual/libc due to PREFERRED_PROVIDERS
>    sets foundUnique to True, outputs:
>    DEBUG: sorted providers for virtual/libc are: ['/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb', '/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb']
>    and returns all providers + foundUnique
> 5. We are back at taskdata/add_provider_internal() and we
>    have more then one entry in "eligible" array plus
>    foundUnique set to True.
> 6. Here we are happy of results and skips two "if" checks.
> 7. Then we add each entry as good one with this output:
> DEBUG: adding /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb to satisfy virtual/libc
> DEBUG: adding /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb to satisfy virtual/libc
> 
> The question is - why providers/filterProviders() returns more 
> then one entry when it founds that one of them is preferred?

This is primarily due to the way bitbake once worked which was to
execute A, then stop and figure out what it should execute next.

When we enabled multiple tasks in parallel, we had to start computing
the dependency tree in advance. The trouble is I was told at the time we
had to continue to support the "if X is unavailable, try building with
Y" in --continue mode. The only way to do this is to be able to
recompute dependency trees upon a build failure.

Over time we've decided deterministic builds are actually a good think
and we shouldn't change behaviour upon task failures so we now default
to not recomputing dependencies upon failure.

The code therefore has lists for each provider sorted by priority.

So that is the history lesson and the code does it for a reason.

That said, I'm unsure how it manages to build with the code change you
mention without warnings, that is rather puzzling as I'd not have
expected that.

Cheers,

Richard








