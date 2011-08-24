Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/rc3bB8t+MOf+4SDaL6JatCDdnKVrgTpE=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qw2OE-0000rr-AJ
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 03:36:22 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7O1VUd6024550;
	Tue, 23 Aug 2011 20:31:31 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D724C903@shsmsx501.ccr.corp.intel.com>
Date: Tue, 23 Aug 2011 20:31:30 -0500
Message-Id: <FA4C6E58-D9EC-4AC8-9857-06F8E303B948@kernel.crashing.org>
References: <A182C128-8E5F-48F0-B72B-39DA62E6E1F4@kernel.crashing.org>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D724C903@shsmsx501.ccr.corp.intel.com>
To: "Xu, Dongxiao" <dongxiao.xu@intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: why do we poison -Os?
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
X-List-Received-Date: Wed, 24 Aug 2011 01:36:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I don't see how what you are describing maps to --enable-target-optspace =
being required.

- k

On Aug 23, 2011, at 8:16 PM, Xu, Dongxiao wrote:

> Hi Kumar,
>=20
> The background of this commit is, when I upgraded PowerPC gcc to 4.5, =
tinylogin would crash with certain GCC build parameters.
>=20
> The root cause for that bug is, if enabled both "-frename-registers" =
and "-Os" options to build tinylogin in powerpc architecture, the =
tinylogin/getty application will encounter segmentation fault. Other =
combinations like "-frename-registers and -O2" or only "-Os" will not =
trigger this issue.
>=20
> Poky cross environment provides the "-frename-registers" parameter, =
however it does not provide -Os option since "--enable-target-optspace" =
option is disabled for powerpc gcc. The "-Os" option in tinylogin is =
added by its own Makefile.
>=20
> This commit is to prevent the above case. If --enable-target-optspace =
is disabled for GCC, "-Os" should not be added by recipe.
>=20
> Thanks,
> Dongxiao
>=20
>> -----Original Message-----
>> From: Kumar Gala [mailto:galak@kernel.crashing.org]
>> Sent: Wednesday, August 24, 2011 8:53 AM
>> To: Xu, Dongxiao
>> Cc: Patches and discussions about the oe-core layer; Khem Raj
>> Subject: why do we poison -Os?
>>=20
>> Dongxiao,
>>=20
>> Can you explain why this was needed:
>>=20
>> commit ce456306dad3fdf42494830011dacae213c48edf
>> Author: Dongxiao Xu <dongxiao.xu@intel.com>
>> Date:   Sat Sep 25 10:16:26 2010 +0800
>>=20
>>    gcc: enable poison parameters detection
>>=20
>>    If not configured with --enable-target-optspace, gcc will report
>>    errors if there is '-Os' optimization in parameters.
>>=20
>>    This fixes [BUGID #342]
>>=20
>>    Also add "--enable-target-optspace" option to arm gcc =
configuration.
>>=20
>>    Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>>=20
>>=20
>> - k



