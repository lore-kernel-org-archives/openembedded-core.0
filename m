Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1THVFU-0002XD-F0
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 09:44:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8S7VfEi001115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2012 00:31:41 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 28 Sep 2012 00:31:41 -0700
Message-ID: <5065525B.7050206@windriver.com>
Date: Fri, 28 Sep 2012 15:31:39 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1348734058.git.wenzong.fan@windriver.com>	
	<ae8afc91a951339570a19ea607c8452037078a73.1348734058.git.wenzong.fan@windriver.com>
	<1348765159.11186.11.camel@ted>
In-Reply-To: <1348765159.11186.11.camel@ted>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] autotools.bbclass: using relative paths for acpaths
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
X-List-Received-Date: Fri, 28 Sep 2012 07:44:36 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/28/2012 12:59 AM, Richard Purdie wrote:
> On Thu, 2012-09-27 at 16:23 +0800, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>
>> Fix autotools.bbclass to use relative paths for acpaths instead of
>> absolute ones. Since absolute paths may cause potential autoreconf
>> error like:
>>
>>      Can't exec "/bin/sh": Argument list too long ...
>>
>> This error occurs while building coreutils with long TMPDIR, because
>> it has bunch of m4 files need to be expanded.
>>
>> [YOCTO #2766]
>>
>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>> ---
>>   meta/classes/autotools.bbclass |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
>> index e4e034b..874e01d 100644
>> --- a/meta/classes/autotools.bbclass
>> +++ b/meta/classes/autotools.bbclass
>> @@ -130,7 +130,8 @@ autotools_do_configure() {
>>   		if [ x"${acpaths}" = xdefault ]; then
>>   			acpaths=
>>   			for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
>> -				grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
>> +				grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u| \
>> +				sed -e 's,${S},\.,'`; do
>>   				acpaths="$acpaths -I $i"
>>   			done
>>   		else
>
> We applied this but it nearly instantly caused build failure reports.
> Anything with multiple configure.ac files where sub configures are used
> such as bdwgc-native will fail after this.
>
> I've therefore reverted it and we need to find another way.

Sorry, I didn't figure this out while building a sato image. If we can't 
make everything happy, could we get back the original ways which only 
fix it for coreutils?

With the limit to length of TMPDIR, this issue should rarely occurs.

Thanks
Wenzong

>
> Cheers,
>
> Richard
>
>


