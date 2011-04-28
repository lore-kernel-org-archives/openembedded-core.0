Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QFYj2-0000vD-Sa
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 23:26:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p3SLNeZo003002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Apr 2011 14:23:40 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 28 Apr 2011 14:23:40 -0700
Message-ID: <4DB9DADA.1020304@windriver.com>
Date: Thu, 28 Apr 2011 16:23:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: Joshua Lock <josh@linux.intel.com>
References: <C10D3FB0CD45994C8A51FEC1227CE22F2311C1C837@shsmsx502.ccr.corp.intel.com>	
	<20110428092232.GA3259@jama.jama.net>
	<4DB9859D.7070609@windriver.com> <1304024672.2171.396.camel@vorpal>
In-Reply-To: <1304024672.2171.396.camel@vorpal>
Cc: poky@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 28 Apr 2011 21:26:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

(adding oe-core back to the list as it got dropped off my previous reply)

On 4/28/11 4:04 PM, Joshua Lock wrote:
> On Thu, 2011-04-28 at 10:19 -0500, Mark Hatle wrote:
>> On 4/28/11 4:22 AM, Martin Jansa wrote:
>>> On Thu, Apr 28, 2011 at 03:08:03PM +0800, Lu, Lianhao wrote:
>>>> Hi Guys,
>>>>
>>>> Here is the design of network based PR service, please help to review and 
>>>> give you comment. Thanks a lot!
>>>
>>> Hi,
>>>
>>> looks good, just wondering if we can use the same mechanism for
>>> LOCALCOUNT numbers in SRCPV, we can even use same table if we prefix
>>> first column ie LOCALCOUNT_${PN} and CheckSum in 2nd column would be
>>> actuall git hash (from SRCREV or HEAD for AUTOREV) or 2nd table with
>>> similar structure.
>>>
>>> But it wont work very well if one builder is using AUTOREV and another
>>> one isn't, but that can be resolved by allowing only trusted builders
>>> with same configuration (wrt AUTOREV) to send such tuples.
>>>
>>> Do we have at least 2 groups of "users".
>>> 1) trusted which increments PR when hash is not found
>>> 2) public which can query PR for given hash (not sure what they should
>>>    do if hash is not found)
>>
>> I think this points our something necessary.  There are manual indications of a
>> change.  I.e. the current "PR" usage.  If I change the recipe, patches, etc I
>> should expect to update the 'PR' to the next value.  However, if something ELSE
>> changes (affecting the checksum), or an end user forgets to change the PR, the
>> auto increment should be used.
> 
> Why would you need to update the PR manually? Detecting changes in the
> recipe/patches/etc should all be handled by the checksumming.

Checksums and timestamps are not enough to determine a logical progression of
the components.

We need something that informs the user where these changes fit in the grand
scheme of things.  Are they newer or older then a recipe of the same name (and
package version)?

So this really allows us to visualize multiple levels of upstream work:

Level 1 - Upstream "version"  (PV)

Level 2 - Upstream (oe-core) recipe versioning (PR)

...

Level N - Local build and configuration versioning (checksum based & auto
incrementing)


In a lot of projects 1, 2 and N are enough.. but it's understandable to add in
other intermediate levels to indicate different upstreams along the way.  (Such
as if a company has their own internal distribution..)

I've seen cases where a level 3 exists to indicate a "distribution version"..

Level N (when done manually) has usually captured major system configuration
changes and rebuilding in order to enable solver tools to upgrade properly.


While the checksum will be able to point a unique instance of the recipe to a
given PR... it doesn't guaranty any type of logical numbering.. other then a new
checksum is a new (presumably larger) PR number.  By adding in the various
levels of version information the checksum becomes "more" unique as it only
refers to specific 'upstream' revisions, and make it more logical that a level
1, 2, ... N change means it's a "newer" version of the package.

--Mark

> Cheers,
> Joshua



