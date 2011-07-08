Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QfDXu-0002rh-19
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:05:01 +0200
Received: by wwi14 with SMTP id 14so672251wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 09:00:38 -0700 (PDT)
Received: by 10.227.96.140 with SMTP id h12mr1914761wbn.95.1310140838369;
	Fri, 08 Jul 2011 09:00:38 -0700 (PDT)
Received: from [172.16.66.153] (host-131-196-68-109.spectrum1.uk.sharedband.net
	[109.68.196.131])
	by mx.google.com with ESMTPS id gg16sm7798959wbb.34.2011.07.08.09.00.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 09:00:37 -0700 (PDT)
References: <cover.1310079506.git.andrea.adami@gmail.com>
	<54796cbee0dc1928f2295a57b4a4783a1222ace1.1310079506.git.andrea.adami@gmail.com>
	<4E172466.6040805@linux.intel.com>
In-Reply-To: <4E172466.6040805@linux.intel.com>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <D892F542-6E19-46B9-AA76-195C621E4AFF@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 8 Jul 2011 17:00:31 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel.bbclass: handle embedding of initramfs images
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
X-List-Received-Date: Fri, 08 Jul 2011 16:05:02 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 8 jul. 2011 om 16:38 heeft Darren Hart <dvhart@linux.intel.com> het volge=
nde geschreven:

>=20
>=20
> On 07/07/2011 04:11 PM, Andrea Adami wrote:
>> * from org.openembedded.dev (oe-classic)
>=20
> Hi Andrea,
>=20
> Please include a descriptive blurb about the patch. When people read
> through the commit log they need to know what problem this patch
> addresses and how it intends to go about it. If possible, it should also
> include the commit id from the source (I suspect that isn't an option here=
).
>=20
>=20
>> +INITRAMFS_IMAGE ?=3D ""
>> +INITRAMFS_TASK ?=3D ""
>> +
>> inherit kernel-arch deploy
>>=20
>> PACKAGES_DYNAMIC +=3D "kernel-module-*"
>> @@ -179,8 +191,18 @@ kernel_do_configure() {
>>        cp "${WORKDIR}/defconfig" "${S}/.config"
>>    fi
>>         yes '' | oe_runmake oldconfig
>> +
>> +    if [ ! -z "${INITRAMFS_IMAGE}" ]; then
>> +        for img in cpio.gz cpio.lzo cpio.lzma; do
>> +        if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img"=

>> +            cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$i
>> +        fi
>> +        done
>> +    fi
>=20
>=20
> Hrm... Why is this part of do_configure? Seems a lot more like a deploy
> or install step. Also, the cp line has been truncated here.

the initramfs gets embedded into the kernel, so it needs to happen before do=
-compile. maybe a seperate task is better



>=20
> --=20
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


