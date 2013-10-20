Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 71F046B0F3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 11:08:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9KB8C2g007182
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Oct 2013 04:08:12 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 20 Oct 2013 04:08:12 -0700
Message-ID: <5263B999.5040107@windriver.com>
Date: Sun, 20 Oct 2013 19:08:09 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1382266112-24559-1-git-send-email-ming.liu@windriver.com>
	<1382266112-24559-3-git-send-email-ming.liu@windriver.com>
	<20131020105929.GA3697@jama>
In-Reply-To: <20131020105929.GA3697@jama>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] strace: replace += with _append for appending to OVERRIDES variables
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
X-List-Received-Date: Sun, 20 Oct 2013 11:08:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2013 06:59 PM, Martin Jansa wrote:
> On Sun, Oct 20, 2013 at 06:48:31PM +0800, Ming Liu wrote:
>> In some cases, it's unfit to use "+=" in a conditional appending, we would
>> end up with the variable being set rather than being appended, which is not
>> it mean to.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-devtools/strace/strace_4.8.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
>> index 79a4ad7..aad53b7 100644
>> --- a/meta/recipes-devtools/strace/strace_4.8.bb
>> +++ b/meta/recipes-devtools/strace/strace_4.8.bb
>> @@ -19,7 +19,7 @@ inherit autotools ptest
>>   RDEPENDS_${PN}-ptest += "make"
>>   
>>   PACKAGECONFIG_class-target ?= "libaio"
>> -PACKAGECONFIG_class-target += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
>> +PACKAGECONFIG_append_class-target = " ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
> Doesn't using _append make it unnecessary harder to changed default value
> in .bbappend?
>
> Why not use
> PACKAGECONFIG_class-target ?= "libaio ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
> at least in this case?
Yes, it's reasonable and make things easy, I will do what you suggest in V1.

//Ming Liu

>
> Thanks
>


