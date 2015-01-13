Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 99E3F60167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 14:46:29 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1YB2jl-0005RG-Mu from drew_moseley@mentor.com ;
	Tue, 13 Jan 2015 06:46:29 -0800
Received: from NA-MBX-03.mgc.mentorg.com ([fe80::9a:1569:df57:45b8]) by
	SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) with mapi id
	14.03.0224.002; Tue, 13 Jan 2015 06:46:29 -0800
From: "Moseley, Drew" <drew_moseley@mentor.com>
To: ChenQi <Qi.Chen@windriver.com>
Thread-Topic: [OE-core] [PATCH 1/2] init-install.sh: Switch to using static
	device paths.
Thread-Index: AQHQLgxNpsKdg5jNgUi5lv6szTzlFpy+qWyA
Date: Tue, 13 Jan 2015 14:46:28 +0000
Message-ID: <C367E4F3-C2F6-48E5-BEAF-E7D873D458BD@mentor.com>
References: <1420818765-28571-1-git-send-email-drew_moseley@mentor.com>
	<54B32BD4.3080209@windriver.com>
In-Reply-To: <54B32BD4.3080209@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] init-install.sh: Switch to using static device paths.
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
X-List-Received-Date: Tue, 13 Jan 2015 14:46:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B48BFF495D12FE4AAC4B68D45D2B8138@mentor.com>
Content-Transfer-Encoding: quoted-printable

> On Jan 11, 2015, at 9:05 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>=20
> On 01/09/2015 11:52 PM, Drew Moseley wrote:
>> Use static device paths for mounting from /dev/disk/<blah> in
>> case the device ordering changes.
>>=20
>> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
>> ---
>>  meta/recipes-core/initrdscripts/files/init-install.sh | 14 ++++++++++--=
--
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/met=
a/recipes-core/initrdscripts/files/init-install.sh
>> index fb537ee..f924418 100644
>> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
>> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
>> @@ -156,6 +156,12 @@ mkfs.ext3 $rootfs
>>  echo "Formatting swap partition...($swap)"
>>  mkswap $swap
>>  +# Determine the static device paths
>> +sync; udevadm settle
>> +bootfs_static=3D"$(udevadm info --query=3Dproperty --name=3D$bootfs | g=
rep DEVLINKS=3D | cut -d=3D -f2 | cut -d\  -f1)"
>> +swap_static=3D"$(udevadm info --query=3Dproperty --name=3D$swap | grep =
DEVLINKS=3D | cut -d=3D -f2 | cut -d\  -f1)"
>> +rootfs_uuid=3D"$(udevadm info --query=3Dproperty --name=3D$rootfs | gre=
p ID_PART_ENTRY_UUID | cut -d=3D -f2)"
>> +
>=20
> Would ID_PART_ENTRY_UUID be always there?

That's a good question.  In my test systems (two VirtualBox configs and two=
 AMD based PCs) it is always there.  Taking a second look at my developer U=
buntu system it does not seem to have that field so maybe I'm just getting =
lucky on my test systems.

Anybody have a suggestion for a replacement?

>>  mkdir /tgt_root
>>  mkdir /src_root
>>  mkdir -p /boot
>> @@ -166,8 +172,8 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2=
 /src_root
>>  echo "Copying rootfs files..."
>>  cp -a /src_root/* /tgt_root
>>  if [ -d /tgt_root/etc/ ] ; then
>> -    echo "$swap                swap             swap       defaults    =
          0  0" >> /tgt_root/etc/fstab
>> -    echo "$bootfs              /boot            ext3       defaults    =
          1  2" >> /tgt_root/etc/fstab
>> +    echo "$swap_static                swap             swap       defau=
lts              0  0" >> /tgt_root/etc/fstab
>> +    echo "$bootfs_static              /boot            ext3       defau=
lts              1  2" >> /tgt_root/etc/fstab
>>      # We dont want udev to mount our root device while we're booting...
>>      if [ -d /tgt_root/etc/udev/ ] ; then
>>  	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
>> @@ -186,7 +192,7 @@ if [ -f /etc/grub.d/00_header ] ; then
>>      cat >$GRUBCFG <<_EOF
>>  menuentry "Linux" {
>>      set root=3D(hd0,1)
>> -    linux /vmlinuz root=3D$rootfs $rootwait rw $5 $3 $4 quiet
>> +    linux /vmlinuz root=3DPARTUUID=3D$rootfs_uuid $rootwait rw $5 $3 $4=
 quiet
>=20
> I thought PARTUUID is for GPT only.
>=20

Perhaps so but it does seem to be there on my VirtualBox systems.  My Ubunt=
u host uses "root=3DUUID=3Dblah" but that was't working for me at some poin=
t.  I'll dig back into it and see what I can find.

Drew



