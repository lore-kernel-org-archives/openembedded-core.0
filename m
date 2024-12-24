Return-Path: <Pratik.Pingate@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE4AE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 11:18:53 +0000 (UTC)
Subject: Issue with meta-toolchain: Adding GCC plugins
To: openembedded-core@lists.openembedded.org
From: Pratik.Pingate@einfochips.com
X-Originating-Location: Delhi, National Capital Territory of Delhi, IN (182.76.141.106)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Dec 2024 03:18:44 -0800
Message-ID: <EQWF.1735039124368818539.WZQ6@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wge86hAe2YFAUyA1VvVR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 11:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209067

--wge86hAe2YFAUyA1VvVR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am currently working on a Yocto Project build for the AM335X-EVM machine =
using the kirkstone release. My goal is to include GCC plugins in the gener=
ated meta-toolchain. However, I am encountering some challenges and would a=
ppreciate guidance from the community.

Here are the steps I have tried so far:
1) Added EXTRA_OECONF:append =3D " --enable-plugins" in recipes-core/meta/m=
eta-toolchain.bb

Steps for Toolchain Relocation:
einfochips@VM2568:~/work/tisdk/build/deploy-ti/sdk$ ls
arago-2023.10-toolchain-2023.10.host.manifest =C2=A0arago-2023.10-toolchain=
-2023.10.target.manifest
arago-2023.10-toolchain-2023.10.sh =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 arago-2023.10-toolchain-2023.10.testdata.json
einfochips@VM2568:~/work/tisdk/build/deploy-ti/sdk$ ./arago-2023.10-toolcha=
in-2023.10.sh
Arago SDK installer version 2023.10
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Enter target directory for SDK (default: /opt/arago-2023.10): /home/einfoch=
ips/work/toolchain/
You are about to install the SDK to "/home/einfochips/work/toolchain". Proc=
eed [Y/n]? Y
Extracting SDK.............................................................=
...........................................................................=
.......done
Setting it up...done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to sourc=
e the environment setup script e.g.
=C2=A0$ . /home/einfochips/work/toolchain/environment-setup-armv7at2hf-neon=
-oe-linux-gnueabi
einfochips@VM2568:~/work/tisdk/build/deploy-ti/sdk$ cd /home/einfochips/wor=
k/toolchain/
einfochips@VM2568:~/work/toolchain$ source environment-setup-armv7at2hf-neo=
n-oe-linux-gnueabi
Steps for Cross compilation of Driver:
MY_KERNEL=3D/home/einfochips/work/tisdk/build/arago-tmp-default-glibc/work/=
am335x_evm-oe-linux-gnueabi/linux-ti-staging/6.1.46+gitAUTOINC+247b2535b2-r=
22b.arago5.1_tisdk_2_edgeai_0_edgeai_7/build/
make clean
make KLIB=3D$MY_KERNEL KLIB_BUILD=3D$MY_KERNEL defconfig-brcmfmac
make KLIB=3D$MY_KERNEL KLIB_BUILD=3D$MY_KERNEL ARCH=3Darm CROSS_COMPILE=3D/=
home/einfochips/work/toolchain/sysroots/x86_64-arago-linux/usr/bin/arm-oe-l=
inux-gnueabi/arm-oe-linux-gnueabi- modules

Error:
make[4]: ./lxdialog/check-lxdialog.sh: Permission denied
make[4]: ./lxdialog/check-lxdialog.sh: Permission denied
make[4]: 'conf' is up to date.
#
# configuration written to .config
#
Building backport-include/backport/autoconf.h ... done.
 CC [M]=C2=A0 /home/einfochips/work/WiFi/v6.1.97-backports/compat/main.o
*cc1: error: cannot load plugin ./scripts/gcc-plugins/arm_ssp_per_task_plug=
in.so: ./scripts/gcc-* plugins/arm_ssp_per_task_plugin.so: undefined symbol=
: _ZN8opt_pass14set_pass_paramEjb
make[5]: *** [/home/einfochips/work/tisdk/build/arago-tmp-default-glibc/wor=
k-shared/am335x-evm/kernel-source/scripts/Makefile.build:250: /home/einfoch=
ips/work/WiFi/v6.1.97-backports/compat/main.o] Error 1
make[4]: *** [/home/einfochips/work/tisdk/build/arago-tmp-default-glibc/wor=
k-shared/am335x-evm/kernel-source/scripts/Makefile.build:502: /home/einfoch=
ips/work/WiFi/v6.1.97-backports/compat] Error 2
make[3]: *** [/home/einfochips/work/tisdk/build/arago-tmp-default-glibc/wor=
k-shared/am335x-evm/kernel-source/Makefile:2012: /home/einfochips/work/WiFi=
/v6.1.97-backports] Error 2
make[2]: *** [Makefile.build:13: modules] Error 2
make[1]: *** [Makefile.real:88: modules] Error 2
make: *** [Makefile:43: modules] Error 2
einfochips@VM2568:~/work/WiFi/v6.1.97-backports
Best Regards,
Pratik Pingate.

--wge86hAe2YFAUyA1VvVR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>&nbsp;</div>
<div>I am currently working on a Yocto Project build for the AM335X-EVM mac=
hine using the kirkstone release. My goal is to include GCC plugins in the =
generated meta-toolchain. However, I am encountering some challenges and wo=
uld appreciate guidance from the community.</div>
<div>&nbsp;</div>
<div>Here are the steps I have tried so far:</div>
<div>&nbsp; &nbsp; 1) Added EXTRA_OECONF:append =3D " --enable-plugins" in =
recipes-core/meta/meta-toolchain.bb</div>
<div>&nbsp;</div>
<div>
<p>&nbsp;</p>
<p id=3D"x_codeBlockEditor-925843ab-c8b8-4b45-aaa8-6bdcbe7c5b51"></p>
<pre class=3D"language-plaintext">Steps for Toolchain Relocation:<br />einf=
ochips@VM2568:~/work/tisdk/build/deploy-ti/sdk$ ls<br />arago-2023.10-toolc=
hain-2023.10.host.manifest &nbsp;arago-2023.10-toolchain-2023.10.target.man=
ifest<br />arago-2023.10-toolchain-2023.10.sh &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; arago-2023.10-toolchain-2023.10.testdata.json<br />einfochips@=
VM2568:~/work/tisdk/build/deploy-ti/sdk$ ./arago-2023.10-toolchain-2023.10.=
sh<br />Arago SDK installer version 2023.10<br />=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br />Enter target directory for SDK (default: /opt/arago-2023.10): /=
home/einfochips/work/toolchain/<br />You are about to install the SDK to "/=
home/einfochips/work/toolchain". Proceed [Y/n]? Y<br />Extracting SDK......=
...........................................................................=
..............................................................done<br />Set=
ting it up...done<br />SDK has been successfully set up and is ready to be =
used.<br />Each time you wish to use the SDK in a new shell session, you ne=
ed to source the environment setup script e.g.<br />&nbsp;$ . /home/einfoch=
ips/work/toolchain/environment-setup-armv7at2hf-neon-oe-linux-gnueabi<br />=
einfochips@VM2568:~/work/tisdk/build/deploy-ti/sdk$ cd /home/einfochips/wor=
k/toolchain/<br />einfochips@VM2568:~/work/toolchain$ source environment-se=
tup-armv7at2hf-neon-oe-linux-gnueabi</pre>
<span data-teams=3D"true"><span><span style=3D"font-family: -apple-system, =
BlinkMacSystemFont, 'Segoe UI', system-ui, 'Apple Color Emoji', 'Segoe UI E=
moji', 'Segoe UI Web', sans-serif; font-size: 14px; white-space: pre-wrap;"=
>&nbsp;</span></span></span></div>
<div>
<pre class=3D"language-plaintext"><code>Steps for Cross compilation of Driv=
er:<br />MY_KERNEL=3D/home/einfochips/work/tisdk/build/arago-tmp-default-gl=
ibc/work/am335x_evm-oe-linux-gnueabi/linux-ti-staging/6.1.46+gitAUTOINC+247=
b2535b2-r22b.arago5.1_tisdk_2_edgeai_0_edgeai_7/build/<br />make clean<br /=
>make KLIB=3D$MY_KERNEL KLIB_BUILD=3D$MY_KERNEL defconfig-brcmfmac<br />mak=
e KLIB=3D$MY_KERNEL KLIB_BUILD=3D$MY_KERNEL ARCH=3Darm CROSS_COMPILE=3D/hom=
e/einfochips/work/toolchain/sysroots/x86_64-arago-linux/usr/bin/arm-oe-linu=
x-gnueabi/arm-oe-linux-gnueabi- modules<br /><br />Error:<br />make[4]: ./l=
xdialog/check-lxdialog.sh: Permission denied<br />make[4]: ./lxdialog/check=
-lxdialog.sh: Permission denied<br />make[4]: 'conf' is up to date.<br />#<=
br /># configuration written to .config<br />#<br />Building backport-inclu=
de/backport/autoconf.h ... done.<br />  CC [M]&nbsp; /home/einfochips/work/=
WiFi/v6.1.97-backports/compat/main.o<br /><strong>cc1: error: cannot load p=
lugin ./scripts/gcc-plugins/arm_ssp_per_task_plugin.so: ./scripts/gcc-</str=
ong>plugins/arm_ssp_per_task_plugin.so: undefined symbol: _ZN8opt_pass14set=
_pass_paramEjb<br />make[5]: *** [/home/einfochips/work/tisdk/build/arago-t=
mp-default-glibc/work-shared/am335x-evm/kernel-source/scripts/Makefile.buil=
d:250: /home/einfochips/work/WiFi/v6.1.97-backports/compat/main.o] Error 1<=
br />make[4]: *** [/home/einfochips/work/tisdk/build/arago-tmp-default-glib=
c/work-shared/am335x-evm/kernel-source/scripts/Makefile.build:502: /home/ei=
nfochips/work/WiFi/v6.1.97-backports/compat] Error 2<br />make[3]: *** [/ho=
me/einfochips/work/tisdk/build/arago-tmp-default-glibc/work-shared/am335x-e=
vm/kernel-source/Makefile:2012: /home/einfochips/work/WiFi/v6.1.97-backport=
s] Error 2<br />make[2]: *** [Makefile.build:13: modules] Error 2<br />make=
[1]: *** [Makefile.real:88: modules] Error 2<br />make: *** [Makefile:43: m=
odules] Error 2<br />einfochips@VM2568:~/work/WiFi/v6.1.97-backports</code>=
</pre>
<span data-teams=3D"true"><span><span style=3D"font-family: -apple-system, =
BlinkMacSystemFont, 'Segoe UI', system-ui, 'Apple Color Emoji', 'Segoe UI E=
moji', 'Segoe UI Web', sans-serif; font-size: 14px; white-space: pre-wrap;"=
>&nbsp;</span></span></span></div>
<div><span data-teams=3D"true"><span><span style=3D"font-family: -apple-sys=
tem, BlinkMacSystemFont, 'Segoe UI', system-ui, 'Apple Color Emoji', 'Segoe=
 UI Emoji', 'Segoe UI Web', sans-serif; font-size: 14px; white-space: pre-w=
rap;">Best Regards,<br />Pratik Pingate.</span></span></span></div>

--wge86hAe2YFAUyA1VvVR--

