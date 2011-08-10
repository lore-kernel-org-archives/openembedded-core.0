Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qqy55-0002Dr-EL
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 03:59:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7A1t7BT007173
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Aug 2011 18:55:07 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 9 Aug 2011 18:55:06 -0700
Message-ID: <4E41E4F9.60404@windriver.com>
Date: Tue, 9 Aug 2011 20:55:05 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Scott Garman <scott.a.garman@intel.com>
References: <1312855453-23258-1-git-send-email-james@digitalmatter.com.au>
	<4E41D1B3.4090703@intel.com>
In-Reply-To: <4E41D1B3.4090703@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: Changed PSEUDO_LOCALSTATEDIR assignment to unconditional.
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
X-List-Received-Date: Wed, 10 Aug 2011 01:59:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/9/11 7:32 PM, Scott Garman wrote:
> On 08/08/2011 07:04 PM, James Limbouris wrote:
>> The pseudo executable sets the PSEUDO_LOCALSTATEDIR environment variable
>> to point to a sysroot location. During an initial cache build, in which
>> pseudo is not used as it is being built, the PSEUDO_LOCALSTATEDIR is set
>> to a per-package location by bitbake.conf, and baked into the cache.
>> If the cache is subsequently invalidated, bitbake may run under pseudo,
>> and rebuild it with the sysroot location baked into the cache. This
>> results in all packages using the same, persistent db, even on package
>> rebuild, which leads to permissions errors. Making the assignment
>> unconditional corrects this problem.
> 
> I can't tell if this change would impact the use of useradd.bbclass, 
> which also sets PSEUDO_LOCALSTATEDIR in certain circumstances. Mark, can 
> you comment on whether this is a valid concern?

I've been trying to figure that out as well.  From what I can tell, as long as
the value is "${WORKDIR}/pseudo", and it's evaluated at use time -- vs
immediately.. we should be good, even with the useradd.bbclass.

(If I remember correctly, the workdir for the useradd still should either be the
package itself, or the sysroot directory.  That should be changing during the
various steps, as necessary.)

Frankly I'm still a little confused as to what is happening differently from the
"=" to the "?=" case.  My understanding is that one should indicate "it's always
this value", and the other is "use this value if one has not already been set."
 Either way we should get the same result, and the same result should end up in
any caches.  If it's not the same, this might be pointing to a different bug --
or my understanding of the processing of the variables is wrong.

So for the purposes of useradd, I don't see a problem here.. I also don't see
any issues with the general case.. but I do wonder why it's needed for the cache
to work properly.

--Mark

> Scott
> 
>>
>> Signed-off-by: James Limbouris<james@digitalmatter.com.au>
>> ---
>>   meta/conf/bitbake.conf |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 6f0b42c..9a9ab53 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -557,7 +557,7 @@ SRCPV = "${@bb.fetch2.get_srcrev(d)}"
>>   SRC_URI = "file://${FILE}"
>>
>>   # Use pseudo as the fakeroot implementation
>> -PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
>> +PSEUDO_LOCALSTATEDIR = "${WORKDIR}/pseudo/"
>>   FAKEROOTENV = "PSEUDO_PREFIX=${STAGING_DIR_NATIVE}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${STAGING_DIR_TARGET} PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0"
>>   FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
>>   PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
> 
> 



