Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TkjLv-00089S-3n
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 23:40:03 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBHMPM3Q003912
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 14:25:22 -0800 (PST)
Received: from msp-dhcp56.wrs.com (172.25.34.56) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Mon, 17 Dec 2012 14:25:21 -0800
Message-ID: <50CF9BD0.2070006@windriver.com>
Date: Mon, 17 Dec 2012 16:25:20 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAEYzJUHZYS8cA3KRRM2L+etHxAOxaU=vBzgaRbUc9hSg8AJODA@mail.gmail.com>
	<50CF3D03.3040301@windriver.com>
In-Reply-To: <50CF3D03.3040301@windriver.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	qBHMPM3Q003912
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
X-List-Received-Date: Mon, 17 Dec 2012 22:40:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/17/12 9:40 AM, Mark Hatle wrote:
> On 12/17/12 9:31 AM, Bj=C3=B8rn Forsman wrote:
>> Hi,
>>
>> I'm really confused about how to use/customize the generated SDK in
>> openembedded. I've spent two days messing around with angstrom
>> setup-scripts, poky and yocto and now I really need help.
>>
>> First I did "bitbake meta-toolchain" (and installed it). That gave me
>> a toolchain, but no extra libraries. Then I tried "bitbake
>> meta-toolchain-sdk" and I got some extra libraries (yay!). But looking
>> at the respective recipies for these meta-tasks and I have *no idea*
>> what libraries "meta-toolchain-sdk" includes. I'm not comfortable with
>> the latter target *accidentally* happen to include the libraries I
>> need.
>
> In oe-core with the branch tag 'denzil' or the master, there are two wa=
ys of
> generating an SDK.

Just correcting this for anyone who may be looking at these emails in the=
=20
future.  It's the 'danny' branch -not- the denzil where this change exist=
s.

--Mark

> The first (which is also present in the older oe-core systems) uses a s=
pecific
> SDK recipe.  For instance, meta-toolchain.  This recipe simply makes th=
e
> toolchain elements available to you and you need to provide the necessa=
ry
> sysroot for your SDK.  An alternative is something like meta-toolchain-=
gmae
> which provides a specific set of sysroot components for the 'gnome mobi=
le
> applicable environment.'
>
> The advantage of this first way is it allows a product designer to rele=
ase a
> targeted SDK for their application developers.  You don't have to put e=
verything
> that will end up on the target image into the SDK, only the libraries, =
headers
> and interfaces that an app developer are allowed to use.
>
> The second way (which is newer) is the ability to generate an SDK based=
 on the
> contents of the image.  This uses a new task called "populate_sdk" that=
 can be
> run with any image recipe, i.e. "bitbake core-image-minimal -c populate=
_sdk".
> This will generate an SDK image that includes the software from the ima=
ge, in
> addition to related -dev and -dbg packages.
>
> The advantage of this second way is that you have an SDK that enables d=
eveloping
> for the contents of the image, as well as system wide cross-debugging w=
ith the
> -dbg packages.
>
>
> The items below are specific to one packaging system, opkg.  The items =
above are
> generic and are expected to work in any of the supported methods.
>
>> After searching the web for a bit, I discovered the "opkg-target"
>> command. Turns out that this command (or alias) no longer exist. Now
>> I'm supposed to use "opkg-cl". The yocto documentation says I should
>> do this:
>>
>> $ opkg-cl =E2=80=93f <conf_file> -o <sysroot_dir> update
>> $ opkg-cl =E2=80=93f <cconf_file> -o <sysroot_dir> --force-overwrite i=
nstall libglade
>> $ opkg-cl =E2=80=93f <cconf_file> -o <sysroot_dir> --force-overwrite i=
nstall
>> libglade-dbg
>> $ opkg-cl =E2=80=93f <conf_file> -o <sysroot_dir> --force-overwrite in=
stall libglade-dev
>>
>> Let's see, there are two sysroots installed by the toolchain:
>> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux
>> /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi/
>>
>> After messing around with the various combinations of <conf_file> and
>> <sysroot_dir>, the closest I get to somthing working is this:
>>
>> $ . /usr/local/oecore-x86_64/environment-setup-armv7a-angstrom-linux-g=
nueabi
>> $ opkg-cl -f /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-g=
nueabi/etc/opkg-sdk.conf
>> -o /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi/
>> update
>> [snip lots of "Package XXX has no valid architecture, ignoring"]
>> Package libsystemd-id128-0 version v44-45-g3eff420-r28 has no valid
>> architecture, ignoring.
>> Package pam-plugin-shells version 1.1.5-r5 has no valid architecture, =
ignoring.
>> Package coreutils-dbg version 8.14-r3 has no valid architecture, ignor=
ing.
>> Package ocf-linux version 20100325-r3.0 has no valid architecture, ign=
oring.
>> Package libxdamage-dev version 1:1.1.3-r1 has no valid architecture, i=
gnoring.
>> Downloading file:/home/bfo/setup-scripts/build/tmp-angstrom_v2012_05-e=
glibc/deploy/ipk/Packages.
>> Updated list of available packages in
>> /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi///var/=
lib/opkg/lists/oe.
>> Downloading file:/home/bfo/setup-scripts/build/tmp-angstrom_v2012_05-e=
glibc/deploy/ipk/all/Packages.
>> Updated list of available packages in
>> /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi///var/=
lib/opkg/lists/oe-all.
>> Downloading file:/home/bfo/setup-scripts/build/tmp-angstrom_v2012_05-e=
glibc/deploy/ipk/x86_64-nativesdk/Packages.
>> Updated list of available packages in
>> /usr/local/oecore-x86_64/sysroots/armv7a-angstrom-linux-gnueabi///var/=
lib/opkg/lists/oe-x86_64-nativesdk.
>>
>> I've also run "bitbake package-index", but it didn't change anything.
>>
>> Can someone please explain how to control what goes into the SDK?
>>
>> If possible, I'd like to configure the SDK contents in a file rather
>> than running a bunch of opkg-cl commands afterwards. I like
>> reproducible builds, and if I have to run opkg-cl commands afterwards
>> I will have to document/script that too. Configuration managment is
>> difficult enough as it is :-)
>>
>> Best regards,
>> Bj=C3=B8rn Forsman
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



