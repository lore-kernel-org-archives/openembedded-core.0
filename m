Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 31AE076EB2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 09:16:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="100342251"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Sep 2015 17:19:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t849G9eJ024691;
	Fri, 4 Sep 2015 17:16:09 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Fri, 4 Sep 2015 17:16:19 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] base-files: Fix LSB NG Cases.
Thread-Index: AQHQ5PsinvaMKy+q6UW6WS3/gY+aO54nqZmAgADPe/D//4nLAIAEFscw
Date: Fri, 4 Sep 2015 09:16:18 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8011BCBFEE0@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1433407956-1948-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1441142028.24871.19.camel@linuxfoundation.org>
	<55E617F9.3070102@windriver.com>
	<A8FC939F80655644A89BB21CCD3741E8011BCBF51E@G08CNEXMBPEKD03.g08.fujitsu.local>
	<55E662DC.8060809@windriver.com>
In-Reply-To: <55E662DC.8060809@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Subject: Re: [PATCH] base-files: Fix LSB NG Cases.
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
X-List-Received-Date: Fri, 04 Sep 2015 09:16:24 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi, Mark,

Thanks a lot.

>>
>>> Subject: Re: [OE-core] [PATCH] base-files: Fix LSB NG Cases.
>>>
>>> On 9/1/15 4:13 PM, Richard Purdie wrote:
>>>> On Thu, 2015-06-04 at 16:52 +0800, Li xin wrote:
>>>>> -/tset/LSB.fhs/var/tmp/tmp-tc.
>>>>>
>>>>> The LSB Core test requires the /var/tmp directory supports creation o=
f files.
>>>>> And the mount tmpfs on /var/volatile cause the /var/tmp directory
>>>>> can't be writable for non-root users.
>>>>
>>>> This change doesn't look correct to me, its a pretty fundamental
>>>> change to the way the system operates and certainly needs more
>>>> thought and justification than the few lines above.
>>>>
>>>> Surely if its a non-root users issue, the problem is permissions,
>>>> not the tmpfs anyway?
>>>
>>> I agree.. How is /var/volatile mounted in your environment?
>>>
>>> /var/volatile should be mounted as a tmpfs with default root only permi=
ssions.
>>> (basefiles: fstab)
>>>
>>> A directory, /var/volatile/tmp should be constructed (after volatile
>>> is mounted) with perms 01777.  (initscripts: populate-volatile.sh)
>>>
>>> /var/tmp should be a symbolic link to /var/volatile/tmp.
>>> (meta/files/fs-perms.txt)
>>>
>>> All of this will result in a /var/tmp that permits any user to write
>>> to it (as it should), but keep it in the volatile area.
>>>
>>> You should figure out what part of this is not working properly.  (If
>>> I had to guess it's the mount of the volatile and create of the tmp
>>> dir is not working for you -- or you have a system where the default
>>> mount rules / init scripts have been modified in some way.)
>>>
>>
>> On my system:
>>
>> root # cat /etc/fstab
>> # stock fstab - you probably want to override this with a machine
>> specific one
>>
>> /dev/root            /                    auto       defaults
>1  1
>> proc                 /proc                proc       defaults
>0  0
>> devpts               /dev/pts             devpts     mode=3D0620,gid=3D5
>0  0
>> usbdevfs             /proc/bus/usb        usbdevfs   noauto
>0  0
>> tmpfs                /run                 tmpfs
>mode=3D0755,nodev,nosuid,strictatime 0  0
>> tmpfs                /var/volatile        tmpfs      defaults
>0  0
>>
>> # uncomment this if your device has a SD/MMC/Transflash slot
>> #/dev/mmcblk0p1       /media/card          auto
>defaults,sync,noauto  0  0
>>
>> root #
>> root # ls /var/tmp -ld
>> lrwxrwxrwx 1 root root 12 Aug 24 09:24 /var/tmp -> volatile/tmp
>>
>> root # ls /var/tmp/ -ld
>> drwxr-xr-x 3 root root 60 Sep  1 08:11 /var/tmp/ root #
>
>You have a configuration problem somewhere.  The populate-volatile.sh init=
script
>used the /etc/default/volatiles configuration file.
>
>It has defined:
>
># <type> <owner> <group> <mode> <path> <linksource> d root root 1777
>/var/volatile/tmp none l root root 1777 /var/tmp /var/volatile/tmp
>
>So figure out if your configuration file is missing, you don't have the ri=
ght
>populate-volatile.sh initscript or there is something else going on.
>
>The system is designed, by default, to make /var/volatile/tmp to be 1777.
>
>> This will permit non-root users to write to /var/tmp/ dir, But the LSB
>> test requires it can be writable for non-root users. So the test result =
is FAIL.
>
>This doesn't have anything to do with the LSB.  Your system is broken for =
some
>reason, bug, configuration problem or something else.  If it's a bug in OE=
, we need
>to get it fixed -- if it's a configuration problem you should fix that ins=
tead.

Yes, it is a configuration problem on my system.
And the commit 81d3209 fix it.=20

Regards,
Li

>>>>> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>>>>> ---
>>>>>  meta/recipes-core/base-files/base-files/fstab | 1 -
>>>>>  1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/recipes-core/base-files/base-files/fstab
>>>>> b/meta/recipes-core/base-files/base-files/fstab
>>>>> index d79a016..458ec70 100644
>>>>> --- a/meta/recipes-core/base-files/base-files/fstab
>>>>> +++ b/meta/recipes-core/base-files/base-files/fstab
>>>>> @@ -4,7 +4,6 @@
>>>>>  proc                 /proc                proc       defaults
>>> 0  0
>>>>>  devpts               /dev/pts             devpts
>>> mode=3D0620,gid=3D5       0  0
>>>>>  tmpfs                /run                 tmpfs
>>> mode=3D0755,nodev,nosuid,strictatime 0  0
>>>>> -tmpfs                /var/volatile        tmpfs      defaults
>>> 0  0
>>>>>
>>>>>  # uncomment this if your device has a SD/MMC/Transflash slot
>>>>>  #/dev/mmcblk0p1       /media/card          auto
>>> defaults,sync,noauto  0  0
>>>>> --
>>>>> 1.8.4.2
>>>>>
>>>>
>>>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


