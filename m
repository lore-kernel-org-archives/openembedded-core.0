Return-Path: <Jackie.Huang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 467E36B88D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 05:53:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7M5r2ua013922
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2013 01:53:03 -0400 (EDT)
Received: from [128.224.162.247] (128.224.162.247) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 21 Aug 2013 22:53:02 -0700
Message-ID: <5215A73D.6020608@windriver.com>
Date: Thu, 22 Aug 2013 13:53:01 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1377064624.git.jackie.huang@windriver.com>
	<0b8b0b9d30aa7677a5c23e4d03d4ce6e21678ad7.1377064624.git.jackie.huang@windriver.com>
	<5214FA20.6090803@linux.intel.com>
In-Reply-To: <5214FA20.6090803@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] openssh: add init.d/sshd status command for LSB compliance
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
X-List-Received-Date: Thu, 22 Aug 2013 05:53:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 8/22/2013 1:34 AM, Saul Wold wrote:
> On 08/20/2013 11:15 PM, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> Signed-off-by: Li Wang <li.wang@windriver.com>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   .../openssh/openssh-6.2p2/init                     |   14
>> +++++++++++++-
>>   1 files changed, 13 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/init
>> b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
>> index 12fb79b..72c5822 100644
>> --- a/meta/recipes-connectivity/openssh/openssh-6.2p2/init
>> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
>> @@ -1,6 +1,9 @@
>>   #! /bin/sh
>>   set -e
>>
>> +# source function library
>> +. /etc/init.d/functions
>> +
>>   # /etc/init.d/ssh: start and stop the OpenBSD "secure shell" daemon
>>
>>   test -x /usr/sbin/sshd || exit 0
>> @@ -54,6 +57,11 @@ check_keys() {
>>       fi
>>   }
>>
>> +rh_status() {
>> +    status /usr/sbin/sshd
>> +    return $?
>> +}
>> +
>>   export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
>>
>>   case "$1" in
>> @@ -92,8 +100,12 @@ case "$1" in
>>       echo "."
>>       ;;
>>
>> +  status)
>> +    rh_status
>
> Why rh_status here and in the "at" script?  Can't you just do the status
> /usr/bin/sshd directly here?

We may found this from Red Hat/Fedora, sure we can do it directly here, 
I will change it if you think it would be better.

Thanks,
Jackie

>
>> +  ;;
>> +
>>     *)
>> -    echo "Usage: /etc/init.d/ssh
>> {start|stop|reload|force-reload|restart}"
>> +    echo "Usage: /etc/init.d/ssh
>> {start|stop|status|reload|force-reload|restart}"
>>       exit 1
>>   esac
>>
>>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

