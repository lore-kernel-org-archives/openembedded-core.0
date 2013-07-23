Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86E986007B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 01:49:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6N1nf7E028894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Jul 2013 18:49:41 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 22 Jul 2013 18:49:41 -0700
Message-ID: <51EDE132.3060305@windriver.com>
Date: Tue, 23 Jul 2013 09:49:38 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1374112474-13597-1-git-send-email-ming.liu@windriver.com>
	<51ECAB78.5070002@linux.intel.com>
In-Reply-To: <51ECAB78.5070002@linux.intel.com>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] util-linux: replace += with _append to EXTRA_OECONF_class-native
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
X-List-Received-Date: Tue, 23 Jul 2013 01:49:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2013 11:48 AM, Saul Wold wrote:
> On 07/17/2013 06:54 PM, Ming Liu wrote:
>> The native/nativesdk overrides of EXTRA_OECONF should take effect before
>> append operator, otherwise, it will cause EXTRA_OECONF be overridden 
>> instead
>> of be appended at native/nativesdk build time.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-core/util-linux/util-linux_2.23.1.bb |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.23.1.bb 
>> b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>> index 12f5021..3040476 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>> @@ -18,5 +18,5 @@ SRC_URI[md5sum] = "6741eeaff93ff5a6bacdd3816bdd87c4"
>>   SRC_URI[sha256sum] = 
>> "ad4a7831d7b27d0172996fd343e809716c2403b32a94e15194d8ea797223c4af"
>>
>>   CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
>> -EXTRA_OECONF_class-native += "--disable-fallocate 
>> --disable-use-tty-group"
>> -EXTRA_OECONF_class-nativesdk += "--disable-fallocate 
>> --disable-use-tty-group"
>> +EXTRA_OECONF_append_class-native = " --disable-fallocate 
>> --disable-use-tty-group"
>> +EXTRA_OECONF_append_class-nativesdk = " --disable-fallocate 
>> --disable-use-tty-group"
>>
>
> While this seems correct, it is causing some down stream issues with 
> e2fsprogs-native and not finding the uuid library
>
>>  Enabling testio debugging by default
>> | checking for x86_64-linux-pkg-config... no
>> | checking for pkg-config... 
>> /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
>> | checking pkg-config is at least version 0.9.0... yes
>> | checking for uuid_generate in -luuid... no
>> | configure: error: external uuid library not found
>> | Configure failed. The contents of all config.log files follows to 
>> aid debugging
>> | ERROR: oe_runconf failed
>
> Can you please research this further.

OK, I will investigate this issue.

the best,
thank you

>
> Thanks
>     Sau!
>
>
>
>


