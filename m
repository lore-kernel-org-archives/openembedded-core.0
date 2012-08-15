Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T1lZI-0001LZ-OP
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 23:56:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7FLi2dg020537
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:44:03 -0700 (PDT)
Received: from msp-dhcp58.wrs.com (172.25.34.58) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 15 Aug 2012 14:44:02 -0700
Message-ID: <502C1828.7010909@windriver.com>
Date: Wed, 15 Aug 2012 16:44:08 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1345047378.git.ross.burton@intel.com>
	<10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
	<1345066752.14667.23.camel@ted>
In-Reply-To: <1345066752.14667.23.camel@ted>
Subject: replacement natives - was Re: [PATCH 1/2] make: add make-replacement-native 3.81
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
X-List-Received-Date: Wed, 15 Aug 2012 21:56:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/12 4:39 PM, Richard Purdie wrote:
> On Wed, 2012-08-15 at 17:18 +0100, Ross Burton wrote:
>> GNU Make 3.82 has some regressions regarding parallel processing that causes
>> some packages to fail, specifically WebKitGTK+.  Add make-replacement-native
>> 3.81 so that those packages can depend on a Make which is known to work.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>   meta/recipes-devtools/make/make-replacement-native_3.81.bb |    6 ++++++
>>   1 file changed, 6 insertions(+)
>>   create mode 100644 meta/recipes-devtools/make/make-replacement-native_3.81.bb
>>
>> diff --git a/meta/recipes-devtools/make/make-replacement-native_3.81.bb b/meta/recipes-devtools/make/make-replacement-native_3.81.bb
>> new file mode 100644
>> index 0000000..716a8b5
>> --- /dev/null
>> +++ b/meta/recipes-devtools/make/make-replacement-native_3.81.bb
>> @@ -0,0 +1,6 @@
>> +require make_${PV}.bb
>> +
>> +inherit native
>> +
>> +BPN = "make"
>> +EXTRAINSTALL = ""
>
> Unfortunately we have some experience with these replacement recipes and
> they need some "special" handling. You need to install make into a
> subdirectory off ${bindir} and then add it to PATH in the webkit recipe.
> There is precedent for this:

I was looking at the staging code the other day.. I suspect we could eliminate 
some of these problems with a few changes.

The order the items are staged is the first.  Right now bin and sbin are staged 
before libs.. so if we change that, it would resolve some of the problems we've 
seen.  The second thing is the way the copy itself occurs.. We should really do 
this in an atomic fashion..  use install, or copy to an alternative name, and 
then 'mv' to the actual name.

Only concern w/ the change to copy could be performance, but I'm really not sure 
how severe that is.... might also be possible to do that only in the 'native' cases.

--Mark

> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3f05622bac998f351168eb49a5ca96e7473f51be
>
> So BBCLASSEXTEND the make recipe, add a PROVIDES, then do a
> EXTRANATIVEPATH += "make-native" in the webkit recipe.
>
> The reason for this elaborate dance is so we avoid races, nothing should
> be executing the make binary when we do anything to it with sstate
> (install or remove it). Admittedly this is much more critical when there
> is an associated library like bzip but we need to set the right example.
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



