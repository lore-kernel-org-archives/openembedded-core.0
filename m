Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S7cXr-00077R-T8
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 01:58:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2E0ngvk022284
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 17:49:42 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 13 Mar 2012 17:49:42 -0700
Message-ID: <4F5FEB24.8070001@windriver.com>
Date: Wed, 14 Mar 2012 08:49:40 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1331605922.git.liezhi.yang@windriver.com>
	<195b9ad9e78ea2355c0a5594436293e803bd460e.1331605922.git.liezhi.yang@windriver.com>
	<1331658943.18586.2.camel@ted>
In-Reply-To: <1331658943.18586.2.camel@ted>
Subject: Re: [PATCH 1/1] package.bbclass: create debugsources.list if it doesn't exist
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
X-List-Received-Date: Wed, 14 Mar 2012 00:58:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/14/2012 01:15 AM, Richard Purdie wrote:
> On Tue, 2012-03-13 at 10:50 +0800, Robert Yang wrote:
>> Serval pkg's debug pkg is null, so the find-debuginfo.sh would not
>> generate the ${WORKDIR}/debugsources.list, but the processdebugsrc
>> always need it, there are a few such errors currently:(53 pkgs have such
>> errors in a core-image-sato build):
>>
>> log.do_package:sort: open failed: debugsources.list: No such file or directory
>>
>> Create debugsources.list if it doesn't exist would fix this problem.
>
> Why can't we modify the code that uses debugsources.list not to get
> upset if it doesn't exist?
>

Sounds great! I will send an update patch sooner.

Will I reply the updated patch here or should I send a V2, please?
I don't know which is popular:-).

// Robert


> This change seems a little backwards to me...
>
> Cheers,
>
> Richard
>
>> [YOCTO #2076]
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>> ---
>>   meta/classes/package.bbclass |    5 +++++
>>   1 files changed, 5 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 9b6862d..8e76ef8 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -243,6 +243,11 @@ def splitfile2(debugsrcdir, d):
>>       workparentdir = os.path.dirname(workdir)
>>       workbasedir = os.path.basename(workdir)
>>       sourcefile = d.expand("${WORKDIR}/debugsources.list")
>> +    # There is no debugsources.list when the debug pkg is null, but the
>> +    # processdebugsrc needs it, so create one if it doesn't exist.
>> +    if not os.path.isfile(sourcefile):
>> +        f = open(sourcefile, 'w')
>> +        f.close()
>>
>>       if debugsrcdir:
>>          nosuchdir = []
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


