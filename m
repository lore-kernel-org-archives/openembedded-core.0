Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TDwTQ-0000jh-SD
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 14:00:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8IBlYVt010047
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Sep 2012 04:47:34 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 18 Sep 2012 04:47:34 -0700
Message-ID: <50585EE7.6070705@windriver.com>
Date: Tue, 18 Sep 2012 19:45:43 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1347950270.git.liezhi.yang@windriver.com>
	<0c67727e1f680f450680af0cad3dca4b8a295998.1347950270.git.liezhi.yang@windriver.com>
	<1347964133.13596.108.camel@ted>
In-Reply-To: <1347964133.13596.108.camel@ted>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rpm 5.4.9: DEPENDS on bison-native
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
X-List-Received-Date: Tue, 18 Sep 2012 12:00:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/18/2012 06:28 PM, Richard Purdie wrote:
> On Tue, 2012-09-18 at 18:18 +0800, Robert Yang wrote:
>> The rpm should depend on bison-native, otherwise errors when "bitbake
>> rpm-native" in a fresh build:
>>
>> | make[4]: Entering directory `/path/to/rpm-native-5.4.9-r46/rpm-5.4.9/syck/lib'
>> | bison -d -t -v -p syck -o gram.c gram.y
>> | make[4]: bison: Command not found
>>
>> Basically, both the rpm-native and rpm should depend on bison-native,
>> but don't need depend on bison, but it seems that it isn't necessary
>> to add another depend line:
>>
>> DEPENDS_virtclass-native = "libpcre-native ... bison-native"
>>
>> So just add it to the DEPENDS.
>>
>> [YOCTO #3123]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-devtools/rpm/rpm_5.4.9.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> index e276cc3..ee0e86f 100644
>> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> @@ -42,8 +42,8 @@ HOMEPAGE = "http://rpm5.org/"
>>   LICENSE = "LGPLv2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>>
>> -DEPENDS = "libpcre attr acl popt ossp-uuid file"
>> -PR = "r46"
>> +DEPENDS = "libpcre attr acl popt ossp-uuid file bison"
>> +PR = "r47"
>
> According to what you wrote above ("but don't need depend on bison"),
> this should be:
>
> DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
>
> ?
>

Yes, thanks, what I had thought was that rpm-native would depend on
bison-native, but missed rpm's depends.

I have updated it and pushed into the git repo:

git://git.pokylinux.org/poky-contrib robert/rpmdepend

// Robert

> Cheers,
>
> Richard
>
>
>
>


