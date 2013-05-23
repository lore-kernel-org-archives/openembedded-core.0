Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 404966A443
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 16:08:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4NG8gCi011633
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 09:08:42 -0700 (PDT)
Received: from msp-dhcp14.wrs.com (172.25.34.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 23 May 2013 09:08:42 -0700
Message-ID: <519E3F0A.8070608@windriver.com>
Date: Thu, 23 May 2013 11:08:42 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1369319832-24797-1-git-send-email-sgw@linux.intel.com>
	<519E3B03.6080708@linux.intel.com>
In-Reply-To: <519E3B03.6080708@linux.intel.com>
Subject: Re: [PATCH] siteinfo: add existiance check for site config file
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
X-List-Received-Date: Thu, 23 May 2013 16:08:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/13 10:51 AM, Saul Wold wrote:
>
>
> Ignore this patch, I was quick on the draw and did not notice the
> listdir which means the file is there,

Could the issue be that the file -was- there, then we ncurses updated it and now 
it's no longer there?  (or in the process of being written?)

I've definitely seen this failure before.. so there is some kind of race.

--Mark

> Sau!
>
> On 05/23/2013 07:37 AM, Saul Wold wrote:
>> There is a condition where ncurses adds a site config file to CONFIG_SITE list
>> and then binutils configure tries to use the siteinfo list before ncurses has
>> installed the file.  The existance test is there in the BBPATH search, but not
>> in the SYSROOTCACHE check, so add it here.
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>    meta/classes/siteinfo.bbclass | 3 ++-
>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
>> index 09f88c6..87a4225 100644
>> --- a/meta/classes/siteinfo.bbclass
>> +++ b/meta/classes/siteinfo.bbclass
>> @@ -139,7 +139,8 @@ def siteinfo_get_files(d, no_cache = False):
>>        if os.path.isdir(path_siteconfig):
>>            for i in os.listdir(path_siteconfig):
>>                filename = os.path.join(path_siteconfig, i)
>> -            sitefiles += filename + " "
>> +            if os.path.exists(filename):
>> +                sitefiles += filename + " "
>>
>>        return sitefiles
>>
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


