Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.phytec.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 47AF0606CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 07:47:47 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 389FAA00269;
	Mon,  3 Apr 2017 09:48:24 +0200 (CEST)
Received: from [172.16.25.238] ([172.16.25.238])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017040309474744-438262 ;
	Mon, 3 Apr 2017 09:47:47 +0200 
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <1490964707-38823-1-git-send-email-d.schultz@phytec.de>
	<469f1f49-8d57-b43a-7aa9-950c4d6afebe@gmail.com>
From: Daniel Schultz <d.schultz@phytec.de>
Message-ID: <68e87217-92f9-7009-800c-f5da70b3af43@phytec.de>
Date: Mon, 3 Apr 2017 09:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <469f1f49-8d57-b43a-7aa9-950c4d6afebe@gmail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 03.04.2017 09:47:47,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 03.04.2017 09:47:47
X-TNEFEvaluated: 1
Subject: Re: [PATCH morty v2] wic: partition: Run fsck on EXT file systems
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
X-List-Received-Date: Mon, 03 Apr 2017 07:47:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Am 31.03.2017 um 19:14 schrieb Khem Raj:
>
>
> On 3/31/17 5:51 AM, Daniel Schultz wrote:
>> Mkfs may create EXT file systems which can only be optimized by fsck
>> and not by itself, e.g. directory optimization (in Pass 3A).
>>
>> To prevent those optimizations during runtime, it will be performed after
>> the creation of an EXT file system.
>>
>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>> ---
>>  scripts/lib/wic/partition.py | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
>> index 3b3bd2d..152eb7b 100644
>> --- a/scripts/lib/wic/partition.py
>> +++ b/scripts/lib/wic/partition.py
>> @@ -239,6 +239,9 @@ class Partition():
>>              (self.fstype, extra=5Fimagecmd, rootfs, label=5Fstr, rootfs=
=5Fdir)
>>          exec=5Fnative=5Fcmd(mkfs=5Fcmd, native=5Fsysroot, pseudo=3Dpseu=
do)
>>
>> +        mkfs=5Fcmd =3D "fsck.%s -pvfD %s" % (self.fstype, rootfs)
>> +        exec=5Fnative=5Fcmd(mkfs=5Fcmd, native=5Fsysroot, pseudo=3Dpseu=
do)
>> +
>
> is this required on master too ? if yes I would suggest to propose it
> for master and then do a backport.
>

Yes, it's already on master. If I would backport it, I also have to=20
backport a patch for e2fsprogs.
Since the new release is very close I would prefer this patch.

>>      def prepare=5Frootfs=5Fbtrfs(self, rootfs, oe=5Fbuilddir, rootfs=5F=
dir,
>>                               native=5Fsysroot, pseudo):
>>          """
>>
>

--=20
Mit freundlichen Gr=FC=DFen,
With best regards,
   Daniel Schultz

