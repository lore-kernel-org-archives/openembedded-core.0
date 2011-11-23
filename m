Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTKjx-0002dW-Ft
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 22:52:25 +0100
Received: by ywb20 with SMTP id 20so1751616ywb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 13:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Q2IWikfgk/NqYIh2aa+f4B4EJkgZDPwuh01rmE8wIes=;
	b=Q+WlI/NwtUGjAXos1qRHNxj+Qyy6rc08yGIQ1i176l+6GJzmfOHV2TwDu0sk3y+QzX
	wwIXa7jFFmARg5UEAgv334BI+rrVyfjcy4+B0mrnj4MQZfQCnqAVwUEsGPispEZDRQvz
	NyAFfgRtJOVLJzoL3KjEJxmblG23CkV1DSlzE=
Received: by 10.152.104.236 with SMTP id gh12mr16000975lab.49.1322084752056;
	Wed, 23 Nov 2011 13:45:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 13:45:21 -0800 (PST)
In-Reply-To: <4EC64DA5.2020406@ts.fujitsu.com>
References: <cover.1320799787.git.josh@linux.intel.com>
	<552def63eb1b587a3f0685c7e604ab1b9a1ac7e5.1320799787.git.josh@linux.intel.com>
	<4EC64DA5.2020406@ts.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 13:45:21 -0800
Message-ID: <CAMKF1sp2v-vs_S6Tq7kzKvOBhjEsrtE4qDfOE0uzOBn6p6nddQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] shared-mime-info: package runtime data separately
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2011 21:52:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 4:20 AM, Rainer Koenig
<Rainer.Koenig@ts.fujitsu.com> wrote:
> Am 09.11.2011 01:53, schrieb Joshua Lock:
>> The freedesktop.org.xml is required when updating the mime database but
>> otherwise not much use. Therefore package it separately, rather than
>> removing it completely, so that it can be used as required for on-device
>> updates without adding almost 2MB to every image which hase shared-mime-=
info.
>
> somehow this patch breaks the image creation for systemd-gnome-image.
> Famous last words from bitbake:

Did you do a clean build ? if not try that

>
> --------------8<-snip-----------------
> | Collected errors:
> | =C2=A0* satisfy_dependencies_for: Cannot satisfy the following dependen=
cies
> for task-gnome:
> | =C2=A0* =C2=A0 =C2=A0shared-mime-info-data * =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 shared-mime-info-data *
> | =C2=A0* opkg_install_cmd: Cannot install package task-gnome.
> | ERROR: Function 'do_rootfs' failed (see
> /srv/oe/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/dm814x_evm-an=
gstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/temp/log.do_rootfs.6501
> for further information)
> NOTE: package systemd-gnome-image-1.0-r0: task do_rootfs: Failed
> ERROR: Task 8
> (/srv/oe/setup-scripts/sources/meta-angstrom/recipes-images/angstrom/syst=
emd-gnome-image.bb,
> do_rootfs) failed with exit code '1'
> ERROR:
> '/srv/oe/setup-scripts/sources/meta-angstrom/recipes-images/angstrom/syst=
emd-gnome-image.bb'
> failed
> --------------8<-snip-----------------
>
> And there is no package names shared-mime-info-data*. :-(
>
>
>> Signed-off-by: Joshua Lock <josh@linux.intel.com>
>> ---
>> =C2=A0.../shared-mime-info/shared-mime-info.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A09 ++++++---
>> =C2=A0.../shared-mime-info/shared-mime-info_0.91.bb =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 =C2=A02 +-
>> =C2=A02 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc =
b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
>> index c8cab29..57e829c 100644
>> --- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
>> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
>> @@ -17,13 +17,16 @@ EXTRA_OECONF =3D "--disable-update-mimedb"
>> =C2=A0FILES_${PN} +=3D "${datadir}/mime"
>> =C2=A0FILES_${PN}-dev +=3D "${datadir}/pkgconfig/shared-mime-info.pc"
>>
>> +# freedesktop.org.xml is only required when updating the mime database,
>> +# package it separately
>> +PACKAGES +=3D "shared-mime-info-data"
>> +FILES_shared-mime-info-data =3D "${datadir}/mime/packages/freedesktop.o=
rg.xml"
>> +RDEPENDS_shared-mime-info-data =3D "shared-mime-info"
>> +
>> =C2=A0do_install () {
>> =C2=A0 =C2=A0 =C2=A0 autotools_do_install
>>
>> =C2=A0 =C2=A0 =C2=A0 update-mime-database ${D}${datadir}/mime
>> -
>> - =C2=A0 =C2=A0 # we do not need it on device and it is huge
>> - =C2=A0 =C2=A0 rm ${D}${datadir}/mime/packages/freedesktop.org.xml
>> =C2=A0}
>>
>> =C2=A0do_install_virtclass-native () {
>> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91=
.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
>> index 0c3b01c..bc4a8f7 100644
>> --- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
>> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
>> @@ -1,5 +1,5 @@
>> =C2=A0require shared-mime-info.inc
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> =C2=A0SRC_URI[md5sum] =3D "982a211560ba4c47dc791ccff34e8fbc"
>> =C2=A0SRC_URI[sha256sum] =3D "98cfebe1d809afb24934e634373821e2a1dfa86fc6=
462cab230589a1c80988bd"
>
> Regards
> Rainer
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


