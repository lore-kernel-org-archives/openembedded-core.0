Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1U0HeI-0004QA-L6
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 21:19:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Jan 2013 12:02:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,561,1355126400"; d="scan'208";a="196386659"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jan 2013 12:02:31 -0800
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.20]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.82]) with mapi id
	14.01.0355.002; Tue, 29 Jan 2013 20:02:29 +0000
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH V4 2/3] connman-conf: configures connman in
	qemu machines
Thread-Index: AQHN814RAJ4xNlU0GEqIs0yHR+AoEZhK1gaAgBXs40A=
Date: Tue, 29 Jan 2013 20:02:28 +0000
Message-ID: <81551E10643BEC4899D6BA2541201B624B2CD5@IRSMSX104.ger.corp.intel.com>
References: <1358280527-14078-1-git-send-email-cristian.iorga@intel.com>
	<1358280527-14078-3-git-send-email-cristian.iorga@intel.com>
	<20130115202116.GB3002@jama> <50F5BB17.4040709@linux.intel.com>
In-Reply-To: <50F5BB17.4040709@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 2/3] connman-conf: configures connman in qemu machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 20:19:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What about network in Build Appliance image? Blacklisting eth interfaces af=
fects build appliance image too (because it's built as qemux86-64 machine u=
sually).
Or someone who doesn't use the runqemu script and she doesn't pass a static=
 ip to qemu because she wants to use a dhcp server (eg: dnsmasq over a brid=
ge which contains preconfigured tun/tap devices, think server enviroment wh=
ere you want to run multiple yocto vms)

An ugly fix for BA can be:

diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recip=
es-core/images/build-appliance-image.bb
index 2359eca..b8255ac 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -64,6 +64,8 @@ fakeroot do_populate_poky_src () {
        # Use Clearlooks GTK+ theme
        mkdir -p ${IMAGE_ROOTFS}/etc/gtk-2.0
        echo 'gtk-theme-name =3D "Clearlooks"' > ${IMAGE_ROOTFS}/etc/gtk-2.=
0/gtkrc
+       =20
+        rm -rf ${IMAGE_ROOTFS}/etc/connman/main.conf
 }
=20
 IMAGE_PREPROCESS_COMMAND +=3D "do_populate_poky_src; "


--
Stefan Stanacar
Yocto QA
OTC, SSD

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Saul Wold
Sent: Tuesday, January 15, 2013 10:25 PM
To: Martin Jansa
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V4 2/3] connman-conf: configures connman in q=
emu machines

On 01/15/2013 12:21 PM, Martin Jansa wrote:
> On Tue, Jan 15, 2013 at 10:08:46PM +0200, Cristian Iorga wrote:
>> For qemu machines, connman should not configure
>> virtual wired interfaces. Wired interfaces (eth0)
>> are assigned static IP addresses by the virtual machine
>> manager (qemu). This packages places the eth0 interface in
>> a list of blacklisted interfaces, forbiding connman
>> administering wired interfaces for qemu machines.
>
> Again wrong order,
>
> 3/3 should be 1st
> 2/3 2nd
> 1/3 3rd
>
I have re-ordered this in my consolidated pull MUT staging area, saw=20
that right away!

Sau!

> Cheers,
>
>>
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> ---
>>   meta/conf/layer.conf                                 |    1 +
>>   meta/recipes-connectivity/connman/connman-conf.bb    |   18 ++++++++++=
++++++++
>>   .../connman/connman-conf/qemuall/main.conf           |    3 +++
>>   3 files changed, 22 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/connman/connman-conf.bb
>>   create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemu=
all/main.conf
>>
>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>> index 78ceae9..3259e5c 100644
>> --- a/meta/conf/layer.conf
>> +++ b/meta/conf/layer.conf
>> @@ -22,6 +22,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>>     shadow-securetty \
>>     opkg-config-base \
>>     netbase \
>> +  connman-conf \
>>     formfactor \
>>     xserver-xf86-config \
>>     pointercal \
>> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/re=
cipes-connectivity/connman/connman-conf.bb
>> new file mode 100644
>> index 0000000..7c7ef26
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
>> @@ -0,0 +1,18 @@
>> +#connman config to ignore wired interfaces on qemu machines
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL=
-2.0;md5=3D801f80980d171dd6425610833a22dbe6"
>> +
>> +SRC_URI_append_qemuall =3D " file://main.conf"
>> +
>> +PR =3D "r0"
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +do_install() {
>> +    #Blacklist ethn network interface in case of qemu* machines
>> +    if test -e ${WORKDIR}/main.conf; then
>> +        install -d ${D}${sysconfdir}/connman
>> +        install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/connman
>> +    fi
>> +}
>> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/main=
.conf b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
>> new file mode 100644
>> index 0000000..01973e7
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
>> @@ -0,0 +1,3 @@
>> +[General]
>> +
>> +NetworkInterfaceBlacklist =3D eth
>> --
>> 1.7.10.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


