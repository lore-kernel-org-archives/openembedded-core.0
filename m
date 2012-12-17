Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjorn.forsman@gmail.com>) id 1Tkcsx-0003Lj-1S
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 16:45:43 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2350261eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 07:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wRCqs1SKcHAgJeIHSfZxw9wd5C1HcimOjGdjtOKrgvw=;
	b=IGwVfpKlyVCN1UkDbEXuq1EZ/zxUUWGhDV14QmVx9aFO6d4ullcUJO9ajkrhDhX0t1
	wwJF8HodP2n1pY4/hJg/oePiZjdvjoMdcprATdO0ydAKWZPHwwAl6hddEWuDZ5cZQpdO
	ie25y5RVpZ5nC9idAIeD5jzkVsEAX21yWsNo54l2xAWBo72KjpqRycdnZMBiFrIJHc+O
	+UdMEvbmbOH2l+pnCpJaENsgsJOEzongmF2ejTanzj2WFOhIVSbqOk2zWXz6tm6Ypwcc
	2oaDgRo9pxpjGLLLhB7g27fqId+ubGp5qBBLvFM/EA5wLzdJPD848LVWwFzjwoI2ayQQ
	MUmg==
MIME-Version: 1.0
Received: by 10.14.206.197 with SMTP id l45mr42266359eeo.17.1355758262567;
	Mon, 17 Dec 2012 07:31:02 -0800 (PST)
Received: by 10.14.135.145 with HTTP; Mon, 17 Dec 2012 07:31:02 -0800 (PST)
Date: Mon, 17 Dec 2012 16:31:02 +0100
Message-ID: <CAEYzJUHZYS8cA3KRRM2L+etHxAOxaU=vBzgaRbUc9hSg8AJODA@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: SDK confusion!
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
X-List-Received-Date: Mon, 17 Dec 2012 15:45:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'm really confused about how to use/customize the generated SDK in
openembedded. I've spent two days messing around with angstrom
setup-scripts, poky and yocto and now I really need help.

First I did "bitbake meta-toolchain" (and installed it). That gave me
a toolchain, but no extra libraries. Then I tried "bitbake
meta-toolchain-sdk" and I got some extra libraries (yay!). But looking
at the respective recipies for these meta-tasks and I have *no idea*
what libraries "meta-toolchain-sdk" includes. I'm not comfortable with
the latter target *accidentally* happen to include the libraries I
need.

After searching the web for a bit, I discovered the "opkg-target"
command. Turns out that this command (or alias) no longer exist. Now
I'm supposed to use "opkg-cl". The yocto documentation says I should
do this:

$ opkg-cl =E2=80=93f <conf_file> -o <sysroot_dir> update
$ opkg-cl =E2=80=93f <cconf_file> -o <sysroot_dir> --force-overwrite instal=
l libglade
$ opkg-cl =E2=80=93f <cconf_file> -o <sysroot_dir> --force-overwrite instal=
l
libglade-dbg
$ opkg-cl =E2=80=93f <conf_file> -o <sysroot_dir> --force-overwrite install=
 libglade-dev

Let's see, there are two sysroots installed by the toolchain:
/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux
/usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi/

After messing around with the various combinations of <conf_file> and
<sysroot_dir>, the closest I get to somthing working is this:

$ . /usr/local/oecore-x86_64/environment-setup-armv7a-angstrom-linux-gnueab=
i
$ opkg-cl -f /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueab=
i/etc/opkg-sdk.conf
-o /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi/
update
[snip lots of "Package XXX has no valid architecture, ignoring"]
Package libsystemd-id128-0 version v44-45-g3eff420-r28 has no valid
architecture, ignoring.
Package pam-plugin-shells version 1.1.5-r5 has no valid architecture, ignor=
ing.
Package coreutils-dbg version 8.14-r3 has no valid architecture, ignoring.
Package ocf-linux version 20100325-r3.0 has no valid architecture, ignoring=
.
Package libxdamage-dev version 1:1.1.3-r1 has no valid architecture, ignori=
ng.
Downloading file:/home/bfo/setup-scripts/build/tmp-angstrom_v2012_05-eglibc=
/deploy/ipk/Packages.
Updated list of available packages in
/usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi///var/lib/o=
pkg/lists/oe.
Downloading file:/home/bfo/setup-scripts/build/tmp-angstrom_v2012_05-eglibc=
/deploy/ipk/all/Packages.
Updated list of available packages in
/usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi///var/lib/o=
pkg/lists/oe-all.
Downloading file:/home/bfo/setup-scripts/build/tmp-angstrom_v2012_05-eglibc=
/deploy/ipk/x86_64-nativesdk/Packages.
Updated list of available packages in
/usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi///var/lib/o=
pkg/lists/oe-x86_64-nativesdk.

I've also run "bitbake package-index", but it didn't change anything.

Can someone please explain how to control what goes into the SDK?

If possible, I'd like to configure the SDK contents in a file rather
than running a bunch of opkg-cl commands afterwards. I like
reproducible builds, and if I have to run opkg-cl commands afterwards
I will have to document/script that too. Configuration managment is
difficult enough as it is :-)

Best regards,
Bj=C3=B8rn Forsman


