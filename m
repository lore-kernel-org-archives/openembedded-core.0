Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1T9lMg-0001Xv-Nz
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 01:20:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q86Kqsjk006471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2012 13:52:54 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 6 Sep 2012 13:52:54 -0700
Message-ID: <50490D24.6020306@windriver.com>
Date: Thu, 6 Sep 2012 15:52:52 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1346957634-22312-1-git-send-email-jason.wessel@windriver.com>
	<2236591.qU5F3vlEoV@helios>
In-Reply-To: <2236591.qU5F3vlEoV@helios>
X-Enigmail-Version: 1.4.3
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packageinfo.bbclass: Fix crash in hob
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
X-List-Received-Date: Thu, 06 Sep 2012 23:20:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 09/06/2012 03:36 PM, Paul Eggleton wrote:
> On Thursday 06 September 2012 13:53:54 Jason Wessel wrote:
>> The hob internally fails after executing a build and invoking
>> the hob a second time when it tries to use the values found in
>> BUILDDIR/tmp/pkgdata/*/runtime/*
>>
>> The internal failure of the hob will manifest itself as
>> stating "Populated recipes 99%" forever after selecting
>> a machine just after starting the hob interface.
>>
>> The internal trace looks like:
>>
>> Traceback (most recent call last):
>> File "packageinfo_handler(e)", line 24, in packageinfo_handler
>> KeyError: 'PKGV'
>>
>> It is a result of using an override for a package version for
>> pieces of the toolchain, in the bb file e.g.
>> PKGV_gdb-dbg = "1234.5678"
>>
>> The work around for now is to populate the sdata PKGV value
>> and to assign the pkgv variable with the correct value
>> from the values found in the pkgdata store.
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>> meta/classes/packageinfo.bbclass | 7 ++++++-
>> 1 files changed, 6 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/packageinfo.bbclass
>> b/meta/classes/packageinfo.bbclass index 26cce60..53965e4 100644
>> --- a/meta/classes/packageinfo.bbclass
>> +++ b/meta/classes/packageinfo.bbclass
>> @@ -18,7 +18,12 @@ python packageinfo_handler () {
>> sdata = oe.packagedata.read_pkgdatafile(root +
>> pkgname) sdata['PKG'] = pkgname
>> pkgrename = sdata['PKG_%s' % pkgname]
>> - pkgv = sdata['PKGV'].replace('-', '+')
>> + try:
>> + pkgv = sdata['PKGV']
>> + except:
>> + sdata['PKGV'] = sdata['PKGV_%s' % pkgname]
>> + pkgv = sdata['PKGV']
>> + pkgv = pkgv.replace('-', '+')
>> pkgr = sdata['PKGR']
>> # We found there are some renaming issue with
>> certain architecture. # For example, armv7a-vfp-neon, it will use armv7a in
>> the rpm file. This is the workaround for it.
>
> Rather than a blanket try...except which could catch other errors I would
> suggest using .get() to which you can supply a default value if no such key
> exists in the dict.
>
> I'm afraid I didn't get around to determining whether we should be recording
> these package name overrides in the pkgdata files today, I will check into that
> tomorrow.
>

Honestly I don't care how we fix it, and I believe the fix I proposed
should be changed over to the writer side.  If nothing else this patch
is meant to illustrate or call out the problem.

You'll note I had to actually set the sdata['PKGV'] because it turns
out it is used directly elsewhere in the hob and things started
falling over without fixing it.  This leads us to the possibility that
the writer of the data store is probably wrong, at least for PKGV
anyway.  On the other hand there might be other implicit assumptions
that are broken.

What I find odd is that this does work when the pkgdata store is not
there which leads me to believe it was never written out properly in
the first place or the data isn't always needed.  The hob, to me looks
like a piece of spaghetti, so without further investigation I cannot
make a concise claim about the correct fix.  I am hoping someone else
might take a further look at it who knows more about the hob
interface.

Jason.



