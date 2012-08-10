Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1SzeXR-0002st-ON
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 04:01:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7A1nUdA023098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Aug 2012 18:49:31 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 9 Aug 2012 18:49:29 -0700
Message-ID: <502468A7.2000103@windriver.com>
Date: Fri, 10 Aug 2012 09:49:27 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1344480978.git.wenzong.fan@windriver.com>
	<ab9afe9c0eab7dc2d9832cd2afabe1eededc7cae.1344480978.git.wenzong.fan@windriver.com>
	<1880382.26omCZ6a7m@helios>
In-Reply-To: <1880382.26omCZ6a7m@helios>
Cc: openembedded-core@www.linuxtogo.org, Zhenfeng.Zhao@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] at 3.1.13: get 'at' depends on 'flex-native' explicitly
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
X-List-Received-Date: Fri, 10 Aug 2012 02:01:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2012 09:01 PM, Paul Eggleton wrote:
> On Thursday 09 August 2012 10:59:15 wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>
>> 'at' needs flex to generate source file lex.yy.c, but it doesn't
>> depend on flex-native directly; This maybe cause a do_compile
>> failure if flex-native is not built or included in project.
>>
>> Error message is:
>>      error: lex.yy.c: No such file or directory
>>
>> Get 'at' depends on flex-native to fix this potential issue.
>>
>> [YOCTO #2919]
>>
>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>> ---
>>   meta/recipes-extended/at/at_3.1.13.bb |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-extended/at/at_3.1.13.bb
>> b/meta/recipes-extended/at/at_3.1.13.bb index ce9396a..a391d6e 100644
>> --- a/meta/recipes-extended/at/at_3.1.13.bb
>> +++ b/meta/recipes-extended/at/at_3.1.13.bb
>> @@ -4,14 +4,14 @@ the system load levels drop to a particular level."
>>   SECTION = "base"
>>   LICENSE="GPLv2+"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
>> -DEPENDS = "flex initscripts \
>> +DEPENDS = "flex flex-native initscripts \
>
> Does it need flex for the target as well, or was it a case of "flex" being added
> instead of "flex-native" by mistake?

Yes, it is needed.

I removed 'flex' from DEPENDS, the build failed with:
---------------------------
i586-poky-linux-gcc  -m32   -march=i586 
--sysroot=/buildarea/wfan/at/tmp/sysroots/qemux86 -I. -O2 -pipe -g 
-feliminate-unused-debug-types -o at at.o panic.o perm.o posixtm.o 
y.tab.o lex.yy.o   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
| lex.yy.o: In function `yylex':
| 
/buildarea/wfan/at/tmp/work/i586-poky-linux/at-3.1.13-r2/at-3.1.13/lex.yy.c:1247: 
undefined reference to `yywrap'
| collect2: error: ld returned 1 exit status
---------------------------

Thanks
Wenzong

>
> Cheers,
> Paul
>


