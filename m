Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 391 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Jan 2015 11:24:57 UTC
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.107])
	by mail.openembedded.org (Postfix) with ESMTP id C31A665C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:24:57 +0000 (UTC)
Received: from [216.82.254.211] by server-11.bemta-7.messagelabs.com id
	7F/D9-02706-20B8FB45; Wed, 21 Jan 2015 11:18:26 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-5.tower-201.messagelabs.com!1421839105!20564990!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11067 invoked from network); 21 Jan 2015 11:18:26 -0000
Received: from mail.mx1.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-5.tower-201.messagelabs.com with RC4-SHA encrypted SMTP;
	21 Jan 2015 11:18:26 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Wed, 21 Jan 2015 05:18:22 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Wed, 21 Jan 2015 05:18:24 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0210.002;
	Wed, 21 Jan 2015 12:18:18 +0100
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: 'OE-core' <openembedded-core@lists.openembedded.org>
Thread-Topic: Broken toolchain/SDK installation (master and dizzy)
Thread-Index: AdA1a+6zP5zMmhanQDmNzgXvnwtb3w==
Date: Wed, 21 Jan 2015 11:18:18 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0AA80E@dor-sms-xch01.digi.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.188]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Subject: Broken toolchain/SDK installation (master and dizzy)
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
X-List-Received-Date: Wed, 21 Jan 2015 11:24:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Seems that there is a problem with the toolchain installation script when y=
ou try to install it in a path which is not the default one but is derived =
from it (i.e. the default path is a prefix of the real installation path)

To reproduce it I just used poky as layer, configured a project for qemuarm=
 and built a toolchain with:

# bitbake -c populate_sdk core-image-minimal

Once finished I installed the toolchain:

$ ./poky-glibc-x86_64-core-image-minimal-armv5te-toolchain-1.7.sh=20
Enter target directory for SDK (default: /opt/poky/1.7): /opt/poky/1.7-cust=
om
You are about to install the SDK to "/opt/poky/1.7-custom". Proceed[Y/n]?Y
...

If we now have a look at the environment file (/opt/poky/1.7-custom/environ=
ment-setup-armv5te-poky-linux-gnueabi):

export SDKTARGETSYSROOT=3D/opt/poky/1.7-custom-custom/sysroots/armv5te-poky=
-linux-gnueabi
export PATH=3D/opt/poky/1.7-custom-custom/sysroots/x86_64-pokysdk-linux/usr=
/bin:/opt/poky/1.7-custom-custom/sysroots/x86_64-pokysdk-linux/usr/bin/arm-=
poky-linux-gnueabi:$PATH
export CCACHE_PATH=3D/opt/poky/1.7-custom-custom/sysroots/x86_64-pokysdk-li=
nux/usr/bin:/opt/poky/1.7-custom-custom/sysroots/x86_64-pokysdk-linux/usr/b=
in/arm-poky-linux-gnueabi:$CCACHE_PATH
export CONFIG_SITE=3D/opt/poky/1.7-custom-custom/site-config-armv5te-poky-l=
inux-gnueabi
export OECORE_NATIVE_SYSROOT=3D"/opt/poky/1.7-custom-custom/sysroots/x86_64=
-pokysdk-linux"
export OECORE_ACLOCAL_OPTS=3D"-I /opt/poky/1.7-custom-custom/sysroots/x86_6=
4-pokysdk-linux/usr/share/aclocal"
export PYTHONHOME=3D/opt/poky/1.7-custom-custom/sysroots/x86_64-pokysdk-lin=
ux/usr

See the paths are wrong (/opt/poky/1.7-custom-custom)

Digging into this I see the problem come from 'poky/meta/files/toolchain-sh=
ar-template.sh' where there are two rounds where the environment file is pa=
th-fixed. First:

# fix environment paths
for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
        $SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $en=
v_setup_script
done

In my example this first step does the change: /opt/poky/1.7 -> /opt/poky/1=
.7-custom

But later in this script we have:

for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
        $SUDO_EXEC find $replace -type f -exec file '{}' \; | \
                grep ":.*\(ASCII\|script\|source\).*text" | \
                awk -F':' '{printf "\"%s\"\n", $1}' | \
                $SUDO_EXEC xargs -n32 sed -i -e "s:$DEFAULT_INSTALL_DIR:$ta=
rget_sdk_dir:g"
done

This loop finds *again* the 'environment-setup' file and because at this po=
int we have the correct path '/opt/poky/1.7-custom' in the environment file=
 it matches again against the default dir '/opt/poky/1.7' resulting in the =
replacement: /opt/poky/1.7-custom -> /opt/poky/1.7-custom-custom that we ha=
ve at the end.

A possible workaround is to filter out the environment file in the second l=
oop:

for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
        $SUDO_EXEC find $replace -type f -not -name 'environment-setup-*' -=
exec file '{}' \; | \
                grep ":.*\(ASCII\|script\|source\).*text" | \
                awk -F':' '{printf "\"%s\"\n", $1}' | \
                $SUDO_EXEC xargs -n32 sed -i -e "s:$DEFAULT_INSTALL_DIR:$ta=
rget_sdk_dir:g"
done

But I'm not sure if this is the proper fix or not.

Comments?

-
Thanks,

Javier Viguera
Software Engineer
Digi International(r) Spain S.A.U.


