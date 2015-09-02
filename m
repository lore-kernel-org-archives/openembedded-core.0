Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 01F9C77015
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 02:09:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="100261314"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2015 10:12:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t8229886026770;
	Wed, 2 Sep 2015 10:09:08 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Wed, 2 Sep 2015 10:09:17 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] base-files: Fix LSB NG Cases.
Thread-Index: AQHQ5PsinvaMKy+q6UW6WS3/gY+aO54nqZmAgADPe/A=
Date: Wed, 2 Sep 2015 02:09:16 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8011BCBF51E@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1433407956-1948-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1441142028.24871.19.camel@linuxfoundation.org>
	<55E617F9.3070102@windriver.com>
In-Reply-To: <55E617F9.3070102@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 02 Sep 2015 02:09:22 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi, Richard and Mark,

Thanks for your reply.=20

>Subject: Re: [OE-core] [PATCH] base-files: Fix LSB NG Cases.
>
>On 9/1/15 4:13 PM, Richard Purdie wrote:
>> On Thu, 2015-06-04 at 16:52 +0800, Li xin wrote:
>>> -/tset/LSB.fhs/var/tmp/tmp-tc.
>>>
>>> The LSB Core test requires the /var/tmp directory supports creation of =
files.
>>> And the mount tmpfs on /var/volatile cause the /var/tmp directory
>>> can't be writable for non-root users.
>>
>> This change doesn't look correct to me, its a pretty fundamental
>> change to the way the system operates and certainly needs more thought
>> and justification than the few lines above.
>>
>> Surely if its a non-root users issue, the problem is permissions, not
>> the tmpfs anyway?
>
>I agree.. How is /var/volatile mounted in your environment?
>
>/var/volatile should be mounted as a tmpfs with default root only permissi=
ons.
>(basefiles: fstab)
>
>A directory, /var/volatile/tmp should be constructed (after volatile is mo=
unted) with
>perms 01777.  (initscripts: populate-volatile.sh)
>
>/var/tmp should be a symbolic link to /var/volatile/tmp.  (meta/files/fs-p=
erms.txt)
>
>All of this will result in a /var/tmp that permits any user to write to it=
 (as it should),
>but keep it in the volatile area.
>
>You should figure out what part of this is not working properly.  (If I ha=
d to guess it's
>the mount of the volatile and create of the tmp dir is not working for you=
 -- or you
>have a system where the default mount rules / init scripts have been modif=
ied in
>some way.)
>

On my system:

root # cat /etc/fstab
# stock fstab - you probably want to override this with a machine specific =
one

/dev/root            /                    auto       defaults              =
1  1
proc                 /proc                proc       defaults              =
0  0
devpts               /dev/pts             devpts     mode=3D0620,gid=3D5   =
    0  0
usbdevfs             /proc/bus/usb        usbdevfs   noauto                =
0  0
tmpfs                /run                 tmpfs      mode=3D0755,nodev,nosu=
id,strictatime 0  0
tmpfs                /var/volatile        tmpfs      defaults              =
0  0

# uncomment this if your device has a SD/MMC/Transflash slot
#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto =
 0  0

root #
root # ls /var/tmp -ld
lrwxrwxrwx 1 root root 12 Aug 24 09:24 /var/tmp -> volatile/tmp

root # ls /var/tmp/ -ld
drwxr-xr-x 3 root root 60 Sep  1 08:11 /var/tmp/
root #

This will permit non-root users to write to /var/tmp/ dir,
But the LSB test requires it can be writable for non-root users. So the tes=
t result is FAIL.

Regards,
Li

>>
>>> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>>> ---
>>>  meta/recipes-core/base-files/base-files/fstab | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/base-files/base-files/fstab
>>> b/meta/recipes-core/base-files/base-files/fstab
>>> index d79a016..458ec70 100644
>>> --- a/meta/recipes-core/base-files/base-files/fstab
>>> +++ b/meta/recipes-core/base-files/base-files/fstab
>>> @@ -4,7 +4,6 @@
>>>  proc                 /proc                proc       defaults
>0  0
>>>  devpts               /dev/pts             devpts
>mode=3D0620,gid=3D5       0  0
>>>  tmpfs                /run                 tmpfs
>mode=3D0755,nodev,nosuid,strictatime 0  0
>>> -tmpfs                /var/volatile        tmpfs      defaults
>0  0
>>>
>>>  # uncomment this if your device has a SD/MMC/Transflash slot
>>>  #/dev/mmcblk0p1       /media/card          auto
>defaults,sync,noauto  0  0
>>> --
>>> 1.8.4.2
>>>
>>
>>
>
>--
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-core

