Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tkd2T-0003bp-J0
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 16:55:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBHFerNo027210
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 07:40:53 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 17 Dec 2012 07:40:52 -0800
Message-ID: <50CF3D03.3040301@windriver.com>
Date: Mon, 17 Dec 2012 09:40:51 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAEYzJUHZYS8cA3KRRM2L+etHxAOxaU=vBzgaRbUc9hSg8AJODA@mail.gmail.com>
In-Reply-To: <CAEYzJUHZYS8cA3KRRM2L+etHxAOxaU=vBzgaRbUc9hSg8AJODA@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	qBHFerNo027210
Subject: Re: SDK confusion!
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
X-List-Received-Date: Mon, 17 Dec 2012 15:55:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/17/12 9:31 AM, Bj=C3=B8rn Forsman wrote:
> Hi,
>
> I'm really confused about how to use/customize the generated SDK in
> openembedded. I've spent two days messing around with angstrom
> setup-scripts, poky and yocto and now I really need help.
>
> First I did "bitbake meta-toolchain" (and installed it). That gave me
> a toolchain, but no extra libraries. Then I tried "bitbake
> meta-toolchain-sdk" and I got some extra libraries (yay!). But looking
> at the respective recipies for these meta-tasks and I have *no idea*
> what libraries "meta-toolchain-sdk" includes. I'm not comfortable with
> the latter target *accidentally* happen to include the libraries I
> need.

In oe-core with the branch tag 'denzil' or the master, there are two ways=
 of=20
generating an SDK.

The first (which is also present in the older oe-core systems) uses a spe=
cific=20
SDK recipe.  For instance, meta-toolchain.  This recipe simply makes the=20
toolchain elements available to you and you need to provide the necessary=
=20
sysroot for your SDK.  An alternative is something like meta-toolchain-gm=
ae=20
which provides a specific set of sysroot components for the 'gnome mobile=
=20
applicable environment.'

The advantage of this first way is it allows a product designer to releas=
e a=20
targeted SDK for their application developers.  You don't have to put eve=
rything=20
that will end up on the target image into the SDK, only the libraries, he=
aders=20
and interfaces that an app developer are allowed to use.

The second way (which is newer) is the ability to generate an SDK based o=
n the=20
contents of the image.  This uses a new task called "populate_sdk" that c=
an be=20
run with any image recipe, i.e. "bitbake core-image-minimal -c populate_s=
dk".=20
This will generate an SDK image that includes the software from the image=
, in=20
addition to related -dev and -dbg packages.

The advantage of this second way is that you have an SDK that enables dev=
eloping=20
for the contents of the image, as well as system wide cross-debugging wit=
h the=20
-dbg packages.


The items below are specific to one packaging system, opkg.  The items ab=
ove are=20
generic and are expected to work in any of the supported methods.

> After searching the web for a bit, I discovered the "opkg-target"
> command. Turns out that this command (or alias) no longer exist. Now
> I'm supposed to use "opkg-cl". The yocto documentation says I should
> do this:
>
> $ opkg-cl =E2=80=93f <conf_file> -o <sysroot_dir> update
> $ opkg-cl =E2=80=93f <cconf_file> -o <sysroot_dir> --force-overwrite in=
stall libglade
> $ opkg-cl =E2=80=93f <cconf_file> -o <sysroot_dir> --force-overwrite in=
stall
> libglade-dbg
> $ opkg-cl =E2=80=93f <conf_file> -o <sysroot_dir> --force-overwrite ins=
tall libglade-dev
>
> Let's see, there are two sysroots installed by the toolchain:
> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux
> /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi/
>
> After messing around with the various combinations of <conf_file> and
> <sysroot_dir>, the closest I get to somthing working is this:
>
> $ . /usr/local/oecore-x86_64/environment-setup-armv7a-angstrom-linux-gn=
ueabi
> $ opkg-cl -f /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gn=
ueabi/etc/opkg-sdk.conf
> -o /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi/
> update
> [snip lots of "Package XXX has no valid architecture, ignoring"]
> Package libsystemd-id128-0 version v44-45-g3eff420-r28 has no valid
> architecture, ignoring.
> Package pam-plugin-shells version 1.1.5-r5 has no valid architecture, i=
gnoring.
> Package coreutils-dbg version 8.14-r3 has no valid architecture, ignori=
ng.
> Package ocf-linux version 20100325-r3.0 has no valid architecture, igno=
ring.
> Package libxdamage-dev version 1:1.1.3-r1 has no valid architecture, ig=
noring.
> Downloading file:/home/bfo/setup-scripts/build/tmp-angstrom_v2012_05-eg=
libc/deploy/ipk/Packages.
> Updated list of available packages in
> /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi///var/l=
ib/opkg/lists/oe.
> Downloading file:/home/bfo/setup-scripts/build/tmp-angstrom_v2012_05-eg=
libc/deploy/ipk/all/Packages.
> Updated list of available packages in
> /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi///var/l=
ib/opkg/lists/oe-all.
> Downloading file:/home/bfo/setup-scripts/build/tmp-angstrom_v2012_05-eg=
libc/deploy/ipk/x86_64-nativesdk/Packages.
> Updated list of available packages in
> /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi///var/l=
ib/opkg/lists/oe-x86_64-nativesdk.
>
> I've also run "bitbake package-index", but it didn't change anything.
>
> Can someone please explain how to control what goes into the SDK?
>
> If possible, I'd like to configure the SDK contents in a file rather
> than running a bunch of opkg-cl commands afterwards. I like
> reproducible builds, and if I have to run opkg-cl commands afterwards
> I will have to document/script that too. Configuration managment is
> difficult enough as it is :-)
>
> Best regards,
> Bj=C3=B8rn Forsman
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



