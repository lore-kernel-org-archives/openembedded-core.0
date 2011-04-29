Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QFgJb-0007Si-2u
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 07:32:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Apr 2011 22:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,285,1301900400"; d="scan'208";a="685780279"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2011 22:28:48 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 29 Apr 2011 13:28:41 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Fri, 29 Apr 2011 13:28:40 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Apr 2011 13:28:39 +0800
Thread-Topic: [OE-core] [poky] RFC: design of network based PR service
Thread-Index: AcwF6pg7JKKjhFgvRG6rIhFWWGaBOAAQa7wg
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2316D02BB5@shsmsx502.ccr.corp.intel.com>
References: <C10D3FB0CD45994C8A51FEC1227CE22F2311C1C837@shsmsx502.ccr.corp.intel.com>
	<20110428092232.GA3259@jama.jama.net>	<4DB9859D.7070609@windriver.com>
	<1304024672.2171.396.camel@vorpal> <4DB9DADA.1020304@windriver.com>
In-Reply-To: <4DB9DADA.1020304@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: Re: [poky] RFC: design of network based PR service
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
X-List-Received-Date: Fri, 29 Apr 2011 05:32:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mark Hatle wrote on 2011-04-29:
> (adding oe-core back to the list as it got dropped off my previous reply)
>=20
> On 4/28/11 4:04 PM, Joshua Lock wrote:
>> On Thu, 2011-04-28 at 10:19 -0500, Mark Hatle wrote:
>>> On 4/28/11 4:22 AM, Martin Jansa wrote:
>>>> On Thu, Apr 28, 2011 at 03:08:03PM +0800, Lu, Lianhao wrote:
>>>>> Hi Guys,
>>>>>=20
>>>>> Here is the design of network based PR service, please help to
>>>>> review and give you comment. Thanks a lot!
>>>>=20
>>>> Hi,
>>>>=20
>>>> looks good, just wondering if we can use the same mechanism for
>>>> LOCALCOUNT numbers in SRCPV, we can even use same table if we
>>>> prefix first column ie LOCALCOUNT_${PN} and CheckSum in 2nd column
>>>> would be actuall git hash (from SRCREV or HEAD for AUTOREV) or 2nd
>>>> table with similar structure.
>>>>=20
>>>> But it wont work very well if one builder is using AUTOREV and
>>>> another one isn't, but that can be resolved by allowing only
>>>> trusted builders with same configuration (wrt AUTOREV) to send such tu=
ples.
>>>>=20
>>>> Do we have at least 2 groups of "users".
>>>> 1) trusted which increments PR when hash is not found
>>>> 2) public which can query PR for given hash (not sure what they should
>>>>    do if hash is not found)
>>>=20
>>> I think this points our something necessary.  There are manual
>>> indications of a change.  I.e. the current "PR" usage.  If I change
>>> the recipe, patches, etc I should expect to update the 'PR' to the
>>> next value.  However, if something ELSE changes (affecting the
>>> checksum), or an end user forgets to change the PR, the auto
>>> increment
> should be used.
>>=20
>> Why would you need to update the PR manually? Detecting changes in
>> the recipe/patches/etc should all be handled by the checksumming.
>=20
> Checksums and timestamps are not enough to determine a logical
> progression of the components.
>=20
> We need something that informs the user where these changes fit in the
> grand scheme of things.  Are they newer or older then a recipe of the
> same name (and package version)?
>=20
> So this really allows us to visualize multiple levels of upstream work:
>=20
> Level 1 - Upstream "version"  (PV)
>=20
> Level 2 - Upstream (oe-core) recipe versioning (PR)
>=20
> ...
>=20
> Level N - Local build and configuration versioning (checksum based &
> auto incrementing)
>=20
>=20
> In a lot of projects 1, 2 and N are enough.. but it's understandable
> to add in other intermediate levels to indicate different upstreams along=
 the way.
> (Such as if a company has their own internal distribution..)
>=20
> I've seen cases where a level 3 exists to indicate a "distribution versio=
n"..
>=20
> Level N (when done manually) has usually captured major system
> configuration changes and rebuilding in order to enable solver tools to u=
pgrade properly.
>=20
>=20
> While the checksum will be able to point a unique instance of the
> recipe to a given PR... it doesn't guaranty any type of logical
> numbering.. other then a new checksum is a new (presumably larger) PR
> number.  By adding in the various levels of version information the
> checksum becomes "more" unique as it only refers to specific
> 'upstream' revisions, and make it more logical that a level 1, 2, ... N c=
hange means it's a "newer" version of the package.
>=20

If a new PV(and/or PR) value comes, does the level N value need to be reset=
 to 0? Or should it continue to increase?

Best Regards,
Lianhao




