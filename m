Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C95C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 07:06:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.6632.1652166384396478545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 00:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=cR2H2u8I;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-092-072-083-181.092.072.pools.vodafone-ip.de [92.72.83.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 607FA83EC8;
	Tue, 10 May 2022 09:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1652166381;
	bh=n3dMgGYxINGtGcmN7IrLR4y6/Rm5iKf+GY3zof+qzX8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cR2H2u8ImDJw2XacDe5VYA7IHys/69OTttS2iuZ7tw54apGlqbYwUVWE95fkwlUfP
	 m/L/PCPZ8ECRzqMdvfbd7CpIF17Z3t0pjEEjuQa7vxbf4nn5KO+tBMmgUKB+ZBKoPi
	 yhK990ZLL+eYZ30+4DuoSfJLWJXNhezvrSAQfruTrbwBNyfuhLqDQWmJ7C+eN2do+Y
	 mYUw6GDXSMmAnMx26ClX94IfKdQ+i9A8Vsbw2p5CKi3xqrmIhErqesXDUkwvk5Sol+
	 +UHfqgKbjBkrlxh/UFkh6wb7IMrz5c1acpTr418SooZWXSJupex7uWjGyGUC+w+WEN
	 PNFJBzRNdA7tw==
Message-ID: <b6e0493e-e21c-86e4-4f4b-e7398a0f7632@denx.de>
Date: Tue, 10 May 2022 09:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] classes: rootfs-postcommands: add skip option to
 overlayfs_qa_check
Content-Language: en-US
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20220503082231.1971123-1-ch@denx.de>
 <56080543-500f-0595-f254-9c24c6a1eff5@gmail.com>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: <56080543-500f-0595-f254-9c24c6a1eff5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 07:06:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165410

On 2022-05-09 07:02, Vyacheslav Yurkov wrote:
> On 03.05.2022 10:22, Claudius Heine wrote:
>> The overlayfs_qa_check checks if the current root file system has a
>> mount configured for each overlayfs, when the overlayfs class is used.
>>
>> However there are certain instances where this mount point is created =
at
>> runtime and not static in a fstab entry or systemd mount unit.
>>
>> One such case would be if overlayfs-etc is used, where the device is
>> mounted in the preinit script and not via a mount unit or fstab entry.
>>
>> However there are other possibilities for this as well, like startup
>> scripts that support a dynamic partition layout. For instance when
>> systemd-repart is used.
>>
>> This adds the `OVERLAYFS_QA_SKIP` variable, which allows to define QA
>> skips via its flags. In principle it supports multiple QA skip flags
>> separated by whitespace, but only one (`mount-configured`) is
>> implemented here. To skip this QA check simply add `mount-configured` =
to
>> the flag of `OVERLAYFS_QA_SKIP` with the same name. For instance if a
>> overlayfs is configured as:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0OVERLAYFS_MOUNT_POINT[data] =3D "/data"
>>
>> Skipping this QA check can be done by setting:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0OVERLAYFS_QA_SKIP[data] =3D "mount-configured"
>>
>> Also add a testcase and fix a typo (fstat -> fstab).
>>
>> Signed-off-by: Claudius Heine <ch@denx.de>
>> ---
>>
>> Changes from v2:
>> - Fix typo 'fstat' -> 'fstab' in testcase
>> - Add testcase for successful build when QA check is skipped.
>>
>> Changes from v1:
>> - `getVarFag` -> `getVarFlag`
>>
>> ---
>> =C2=A0 meta/classes/rootfs-postcommands.bbclass=C2=A0 | 10 ++++++++--
>> =C2=A0 meta/lib/oeqa/selftest/cases/overlayfs.py | 20 ++++++++++++++++=
+++-
>> =C2=A0 2 files changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/rootfs-postcommands.bbclass=20
>> b/meta/classes/rootfs-postcommands.bbclass
>> index 7b92df69c5..9b6824043c 100644
>> --- a/meta/classes/rootfs-postcommands.bbclass
>> +++ b/meta/classes/rootfs-postcommands.bbclass
>> @@ -398,6 +398,10 @@ python overlayfs_qa_check() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allUnitExist =3D True;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for mountPoint in overlayMountPoints:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qaSkip =3D (d.getVarFlag("=
OVERLAYFS_QA_SKIP", mountPoint) or=20
>> "").split()
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if "mount-configured" in q=
aSkip:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
ntinue
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mountPath =3D d=
.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if mountPath in=
 fstabDevices:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 continue
>> @@ -407,8 +411,10 @@ python overlayfs_qa_check() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 for dirpath in searchpaths):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 continue
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn('Mount path %s not=
 found in fstat and unit %s not=20
>> found '
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 'in systemd unit directories' % (mountPath, mountUn=
it))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn(f'Mount path {moun=
tPath} not found in fstab and unit '
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 f'{mountUnit} not found in systemd unit directories=
.')
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn(f'Skip this check =
by setting=20
>> OVERLAYFS_QA_SKIP[{mountPoint}] =3D '
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 '"mount-configured"')
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allUnitExist =3D=
 False;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not allUnitExist:
>> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py=20
>> b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> index 472746a64f..ce1d2f1ec3 100644
>> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
>> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> @@ -62,11 +62,29 @@ DISTRO_FEATURES +=3D "systemd overlayfs"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.add_overla=
y_conf_to_machine()
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res =3D bitbake=
('core-image-minimal', ignore_status=3DTrue)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =3D getline(res, " Mo=
unt path /mnt/overlay not found in=20
>> fstat and unit mnt-overlay.mount not found in systemd unit directories=
")
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =3D getline(res, " Mo=
unt path /mnt/overlay not found in=20
>> fstab and unit mnt-overlay.mount not found in systemd unit directories=
")
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertTrue=
(line and line.startswith("WARNING:"),=20
>> msg=3Dres.output)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =3D getlin=
e(res, "Not all mount paths and units are=20
>> installed in the image")
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertTrue=
(line and line.startswith("ERROR:"),=20
>> msg=3Dres.output)
>> +=C2=A0=C2=A0=C2=A0 def test_not_all_units_installed_but_qa_skipped(se=
lf):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Summary:=C2=A0=C2=A0 Test =
skipping the QA check
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Expected:=C2=A0 Image is c=
reated successfully
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Author:=C2=A0=C2=A0=C2=A0 =
Claudius Heine <ch@denx.de>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config =3D """
>> +IMAGE_INSTALL:append =3D " overlayfs-user"
>> +DISTRO_FEATURES +=3D "systemd overlayfs"
>> +OVERLAYFS_QA_SKIP[mnt-overlay] =3D "mount-configured"
>> +"""
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config(config)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.add_overlay_conf_to_m=
achine()
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake('core-image-minima=
l')
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def test_mount_unit_not_set(self):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Summary:=C2=A0=C2=
=A0 Test whether mount unit was set properly
> Hi Claudius,
> Thanks a lot for the patch
>=20
> Could you please also extend the header of overlayfs.bbclass to describ=
e=20
> the use case? I will update the documentation accordingly after that.

Hi Vyacheslav,

sure. I will try to work that in.

regards,
Claudius

