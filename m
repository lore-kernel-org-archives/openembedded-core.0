Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D626D78323
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 02:48:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA32ms3C022639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Nov 2017 19:48:55 -0700 (PDT)
Received: from [128.224.162.143] (128.224.162.143) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 2 Nov 2017 19:48:54 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <cover.1509516068.git.wenzong.fan@windriver.com>
	<ba38a925299ad32664c35b90486f5c9e97ed64c5.1509516068.git.wenzong.fan@windriver.com>
	<CAP9ODKoLas2y3uyQRV-ewU4u3RQnHW_dMA-WaQb2SiHC6ZWySw@mail.gmail.com>
	<354230d3-d359-6289-47d8-9b4f70d9c556@windriver.com>
	<CAP9ODKr+aJJiBeRK95ubRWRWFs0u4mK1XmzPiLD=-xZj7qQ0NQ@mail.gmail.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <2bf1bb33-fd02-5acc-52c3-74a8521e1d73@windriver.com>
Date: Fri, 3 Nov 2017 10:51:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKr+aJJiBeRK95ubRWRWFs0u4mK1XmzPiLD=-xZj7qQ0NQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] initscripts: disable mountall.sh for busybox init
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
X-List-Received-Date: Fri, 03 Nov 2017 02:48:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 11/02/2017 07:41 PM, Otavio Salvador wrote:
> On Thu, Nov 2, 2017 at 12:02 AM, wenzong fan <wenzong.fan@windriver.com> wrote:
>>
>>
>> On 11/01/2017 08:51 PM, Otavio Salvador wrote:
>>>
>>> Hello,
>>>
>>> On Wed, Nov 1, 2017 at 4:04 AM,  <wenzong.fan@windriver.com> wrote:
>>>>
>>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>>
>>>> Disable 'mountall.sh' to avoid system halt while the init manager is
>>>> set as 'busybox'.
>>>>
>>>> In busybox init, the 'SIGUSR1' was handled as 'halt', calling to the
>>>> 'mountall.sh' would trigger the signal with:
>>>>     + kill -USR1 1
>>>
>>>
>>> Wouldn't be better to add the signal handler for it?
>>
>>
>> There's the handler in busybox-1.24.1/init/init.c:
>>
>>   788 /* The SIGPWR/SIGUSR[12]/SIGTERM handler */
>>   789 static void halt_reboot_pwoff(int sig) NORETURN;
>>   790 static void halt_reboot_pwoff(int sig)
>>   791 {
>>   ...
>>   803         run_shutdown_and_kill_processes();
>>   ...
>>   817 }
>>
>> I think it was intended to halt the system.
> 
> Ok; but what mountall will offer to OE-Core then?
> 
> If we use systemd, it all another way to provide the same. So why not
> dropping it?
> 

We can drop it for systemd and busybox. Actually it has been limited to 
be used with sysvinit only from the packagegroup-core-boot.bb:

+ SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 
'${VIRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \
+                    modutils-initscripts \
+                    init-ifupdown \
+                    ${VIRTUAL-RUNTIME_initscripts} \
                    "

+ RDEPENDS_${PN} = "\
+ ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", 
"${SYSVINIT_SCRIPTS}", "", d)} \
+ ...
+"

Please ignore my patches, they fix the issues for "busybox + 
initscrtipts" which won't be supported again.

Thanks
Wenzong

