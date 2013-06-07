Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8776969C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 20:11:53 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57KGw6R014383; Fri, 7 Jun 2013 21:16:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mWsUGhscmal9; Fri,  7 Jun 2013 21:16:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57KGtJZ014379
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 7 Jun 2013 21:16:57 +0100
Message-ID: <1370635900.6864.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 07 Jun 2013 21:11:40 +0100
In-Reply-To: <20130607192007.GL22710@jama>
References: <20130607192007.GL22710@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: is sstate-cache really deterministic together with shlibs providers?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jun 2013 20:11:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-07 at 21:20 +0200, Martin Jansa wrote:
> Imagine this process
> 
> foo.bb DEPENDS on libabc.bb to provide libabc.1.so
> 
> evil recipe bar.bb installs some binary crap in /opt/crap and because it's
> picky about libabc version it bundles own compy of libabc.so.1 and
> installs it to /opt/crap/lib/libabc.so.1
> 
> At the time of first build nobody notices libabc.1.so and foo, bar and
> libabc are happily populated to sysroot.
> 
> foo.bb is rebuilt because of some unrelated change, but this times it
> uses bar as shlibs provider for libabc.so.1
> 
> foo does not work in runtime, because it cannot find libabc.so.1 hidden
> in /opt/crap/lib.
> 
> bar.bb is "fixed" by adding EXCLUDE_FROM_SHLIBS to prevent further
> polluting of shlibs providers, but damage is already done.
> 
> foo doesn't have any dependency on bar (DEPENDS/RDEPENDS) because bar.bb
> is just unrelated binary crap which just happens to bundle libabc.so.1
> too (so foo checksum does not include bar checksum)
> 
> Now the tricky part:
> 1) fixing local build is easy
>    bitbake -c cleansstate `grep ' bar' buildhistory/images/machine/eglibc/image-with-foo/depends.dot | sed 's/ -> .*//g' | xargs`
> 
> but sstate checksums are identical with bar or libabc in package
> "Depends:" field, so how to cleanup SSTATE_MIRROR and sstate archives
> already distributed to every local builder?
> 
> I could bump PR in libabc, but with PR bumps and PRINC going away I
> really need to know how to solve such issues in future. Should we fix
> do_package to filter shlibs providers to include only recipes which 
> are in (R)DEPENDS/RRECOMMENDS/RSUGGESTS?

PR bumps can still happen for corner cases like this, the intent is just
to rely on the system for the 99.9% of cases which it does cover much
more accurately than a human.

We should perhaps limit shlibs to the default linker search paths?

Wouldn't there be a warning if two things provide the same shlibs or
does that assume the shlibs versioning sorts itself out?

Cheers,

Richard



