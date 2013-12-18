Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2917560CDC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 01:50:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBI1oHaG019785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 17:50:17 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 17 Dec 2013 17:50:17 -0800
Message-ID: <52B0FF97.9080209@windriver.com>
Date: Wed, 18 Dec 2013 09:51:19 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1387270422.git.Qi.Chen@windriver.com>
	<e2ef71afaed27a2ea2d295132b725fe687da7b62.1387270422.git.Qi.Chen@windriver.com>
	<52B05E23.4010402@windriver.com>
In-Reply-To: <52B05E23.4010402@windriver.com>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH 1/1] rootfs_rpm.bbclass: make complementary packages not attempt-only
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
X-List-Received-Date: Wed, 18 Dec 2013 01:50:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/2013 10:22 PM, Mark Hatle wrote:
> On 12/17/13, 2:54 AM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Installing complementary packages should not be attempt-only, otherwise,
>> errors would be hidden. For example, if we enable ptest distro feature,
>> and we add 'ptest-pkgs' to IMAGE_FEATRUES, then building a minimal image
>> would succeed without reporting any error. However, the systemd-ptest
>> is not installed because of lack of the perl package.
>
> Actually that was intentional under the original system design. Any of 
> the complementary packages were just that, complementary and not 
> required for the system to function properly.
>
> If dependencies, installation issues, etc caused problems, we could 
> happily skip them and continue on.  There are places (fairly few these 
> days) where the complementary packages are known to introduce a 
> failure, if not ignored.
>
> This happens primarily when the complementary set introduces a package 
> that has a conflict (RCONFLICT or a file level conflict) with 
> something installed in the required set.
>
> --Mark
>

Thanks for your explanation :)

Best Regards,
Chen Qi

>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/rootfs_rpm.bbclass |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/rootfs_rpm.bbclass 
>> b/meta/classes/rootfs_rpm.bbclass
>> index 1a0c225..9a88330 100644
>> --- a/meta/classes/rootfs_rpm.bbclass
>> +++ b/meta/classes/rootfs_rpm.bbclass
>> @@ -170,8 +170,8 @@ rpm_setup_smart_target_config() {
>>
>>   rootfs_install_packages() {
>>       # Note - we expect the variables not set here to already have 
>> been set
>> -    export INSTALL_PACKAGES_RPM=""
>> -    export INSTALL_PACKAGES_ATTEMPTONLY_RPM="`cat $1`"
>> +    export INSTALL_PACKAGES_RPM="`cat $1`"
>> +    export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
>>       export INSTALL_PROVIDENAME_RPM=""
>>       export INSTALL_TASK_RPM="rootfs_install_packages"
>>       export INSTALL_COMPLEMENTARY_RPM="1"
>>
>
>
>


