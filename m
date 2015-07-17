Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F083765CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 06:58:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H6wOuv019860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Jul 2015 23:58:24 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 16 Jul 2015 23:58:24 -0700
Message-ID: <55A8A78F.7020209@windriver.com>
Date: Fri, 17 Jul 2015 14:58:23 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1436781736.git.liezhi.yang@windriver.com>
	<7c7e76c69064f59ae5b4c6ac44235bee4332d494.1436781736.git.liezhi.yang@windriver.com>
	<CAMKF1sqVDngrV0zZEzZcCScM+HyV+LC++VzpFtVV9ZBW0M8jSQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqVDngrV0zZEzZcCScM+HyV+LC++VzpFtVV9ZBW0M8jSQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glibc: print PN when bbwarn
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
X-List-Received-Date: Fri, 17 Jul 2015 06:58:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/17/2015 12:45 PM, Khem Raj wrote:
> On Mon, Jul 13, 2015 at 3:02 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> The current warning is:
>> WARNING: glibc: unable to generate header for spray.x
>>
>> Which is easier to debug than:
>> WARNING: unable to generate header for spray.x
>>
>> And remove the file before generate it again to fix the warning when
>> recompile:
>> file `bootparam_prot.h' already exists and may be overwritten
>> WARNING: unable to generate header for bootparam_prot.x
>> file `nlm_prot.h' already exists and may be overwritten
>> WARNING: unable to generate header for nlm_prot.x
>> [snip]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-core/glibc/glibc_2.21.bb |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
>> index 8197c29..30f1937 100644
>> --- a/meta/recipes-core/glibc/glibc_2.21.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
>> @@ -135,7 +135,8 @@ do_compile () {
>>                  cd ${S}/sunrpc/rpcsvc
>>                  for r in ${rpcsvc}; do
>>                          h=`echo $r|sed -e's,\.x$,.h,'`
>> -                       rpcgen -h $r -o $h || bbwarn "unable to generate header for $r"
>> +                       rm -f $h
>
> it quashes the warning but doesnt fix underlying problem. this doesnt
> seem to be right thing to do in cross builds. We use cross-rpcgen to
> generate these files so this whole rpcgen run should be removed
> instead. Please test such a patch and correct it.
>

Hi Khem,

I will be on vacation the whole next week, will do when I come back.

// Robert

>> +                       rpcgen -h $r -o $h || bbwarn "${PN}: unable to generate header for $r"
>>                  done
>>          )
>>          echo "Adjust ldd script"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

