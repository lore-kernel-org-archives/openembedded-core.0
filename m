Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E4B67745C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 01:06:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8K16Io6014886
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Sep 2018 18:06:18 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 19 Sep 2018 18:06:18 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1537345567-112142-1-git-send-email-changqing.li@windriver.com>
	<CAJTo0LbmixDhYZyT4C-7XguK5muhRYukhNvkP9rxHfpsqCWxVA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <5a078a4f-6914-a411-75e5-664c8b5c6390@windriver.com>
Date: Thu, 20 Sep 2018 09:06:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbmixDhYZyT4C-7XguK5muhRYukhNvkP9rxHfpsqCWxVA@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus-test: fix ptest failed problem when multilib is enabled
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
X-List-Received-Date: Thu, 20 Sep 2018 01:06:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 09/19/2018 05:59 PM, Burton, Ross wrote:
> Surely a better/safer replacement would be to change run-ptest to:
>
> -export LD_LIBRARY_PATH=/usr/lib/dbus-test/ptest/test/.libs
> +export LD_LIBRARY_PATH=@PTEST_PATH%/test/.libs
>
> And then substitute that.  Replacing in baselib doesn't help if the
> distro changes PTEST_PATH.
>
> Ross

Thanks, I will change as recommend and resend this.
> On Wed, 19 Sep 2018 at 09:30, <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Fix some failed info like:
>> | ./test/test-bus: relocation error: ./test/test-bus: symbol
>> | _dbus_threads_init_debug, version LIBDBUS_PRIVATE_1.10.10 not defined
>> | in file libdbus-1.so.3 with link time reference
>> | FAIL: test/test-bus
>>
>> In run-ptest, LD_LIBRARY_PATH is set to /usr/lib, but when multilib
>> is enabled, /usr/lib64 will be used. fix by replace with correct path.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-core/dbus/dbus-test_1.12.10.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.10.bb b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
>> index e3ee608..a438627 100644
>> --- a/meta/recipes-core/dbus/dbus-test_1.12.10.bb
>> +++ b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
>> @@ -75,6 +75,8 @@ do_install_ptest() {
>>                  sed -i \
>>                   -e 's:${B}:${PTEST_PATH}:g' \
>>                   {} +
>> +        #correct LD_LIBRARY_PATH for run-ptest according current baselib
>> +        sed -i -e 's;/lib/;/${baselib}/;g'  ${D}${PTEST_PATH}/run-ptest
>>   }
>>
>>   RDEPENDS_${PN}-ptest += "bash"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


