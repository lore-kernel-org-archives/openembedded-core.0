Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F64665CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:14:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2J5Ecf4025125
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Mar 2015 22:14:38 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 18 Mar 2015 22:14:37 -0700
Message-ID: <550A5B3B.9000508@windriver.com>
Date: Thu, 19 Mar 2015 13:14:35 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1426733823.git.Qi.Chen@windriver.com>
	<e017310c52ec2c0b47b3c8cef2ea76925c38fa08.1426733823.git.Qi.Chen@windriver.com>
	<20150319050428.GE4738@jama>
In-Reply-To: <20150319050428.GE4738@jama>
X-Originating-IP: [128.224.162.236]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/5] rootfs.py: two changes regarding log checking
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
X-List-Received-Date: Thu, 19 Mar 2015 05:14:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/19/2015 01:04 PM, Martin Jansa wrote:
> On Thu, Mar 19, 2015 at 10:59:13AM +0800, Chen Qi wrote:
>> This patch involves two changes.
>>
>> 1. Extend the regular expression to also catch '^WRANING:' in _log_check_warn.
> Still has the typo I've reported earlier.

Oh...
Thanks.

I'll send out V3.

Best Regards,
Chen Qi

>>     Warnings from bb.note or bbnote begin with 'WARNING:'. So if we decide to
>>     catch warnings at rootfs time, we should not ignore those produced by
>>     the build system itself.
>>
>> 2. Delay _log_check in rootfs process so that more warnings are likely to be
>>     catched. Note that we should at least delay the _log_check after the
>>     execution of ROOTFS_POSTPROCESS_COMMANDS, because we want to catch warnings
>>     there.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/lib/oe/rootfs.py | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
>> index 7e8d5d1..3a77e86 100644
>> --- a/meta/lib/oe/rootfs.py
>> +++ b/meta/lib/oe/rootfs.py
>> @@ -128,6 +128,7 @@ class Rootfs(object):
>>               self._generate_kernel_module_deps()
>>   
>>           self._cleanup()
>> +        self._log_check()
>>   
>>       def _uninstall_unneeded(self):
>>           # Remove unneeded init script symlinks
>> @@ -327,8 +328,6 @@ class RpmRootfs(Rootfs):
>>   
>>           self.pm.install_complementary()
>>   
>> -        self._log_check()
>> -
>>           if self.inc_rpm_image_gen == "1":
>>               self.pm.backup_packaging_data()
>>   
>> @@ -355,7 +354,7 @@ class RpmRootfs(Rootfs):
>>           pass
>>   
>>       def _log_check_warn(self):
>> -        r = re.compile('^(warn|Warn|NOTE: warn|NOTE: Warn)')
>> +        r = re.compile('^(warn|Warn|NOTE: warn|NOTE: Warn|WARNING:)')
>>           log_path = self.d.expand("${T}/log.do_rootfs")
>>           with open(log_path, 'r') as log:
>>               for line in log.read().split('\n'):
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


