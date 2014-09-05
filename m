Return-Path: <dvorkin@tibbo.com>
Received: from smtp.tibbo.com (smtp.tibbo.com [93.174.104.90])
	by mail.openembedded.org (Postfix) with ESMTP id 82A57714A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 09:35:33 +0000 (UTC)
Received: (qmail 4481 invoked by uid 508); 5 Sep 2014 13:14:29 +0400
Received: from 59-120-32-27.hinet-ip.hinet.net (HELO ?192.168.1.20?)
	(dvorkin@tibbo.com@59.120.32.27)
	by smtp.tibbo.com with SMTP; 5 Sep 2014 13:14:29 +0400
Message-ID: <540983E2.9080402@tibbo.com>
Date: Fri, 05 Sep 2014 17:35:30 +0800
From: Dvorkin Dmitry <dvorkin@tibbo.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <540975F3.7050806@tibbo.com> <20140905111313.0f978efd@e6520eb>
In-Reply-To: <20140905111313.0f978efd@e6520eb>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wrong automatic dependency
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
X-List-Received-Date: Fri, 05 Sep 2014 09:35:35 -0000
X-Groupsio-MsgNum: 57488
Content-Type: multipart/mixed; boundary="------------090201050806020807020905"

--------------090201050806020807020905
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Eric!

On 05.09.2014 17:13, Eric Bénard wrote:
> Hi Dvorkin,
>
> Le Fri, 05 Sep 2014 16:36:03 +0800,
> Dvorkin Dmitry <dvorkin@tibbo.com> a écrit :
>
>> Hello!
>>
>> I wrote my own recipe for crda.
>> (http://wireless.kernel.org/en/developers/Regulatory/CRDA)
>>
>> Dependencies is:
>> DEPENDS = "libgcrypt libnl"
>> RDEPENDS_${PN} = "udev wireless-regdb"
>>
>> Crda Makefile is using python to rebuild it's database in
>> build/installation step.
>> After installation I have several packages: crda itself, crda-dev,
>> crda-doc, ... etc.
>> In my image I'm using only 'crda' package that doesn't need python.
>>
>> But it seems Yocto detects python and add automatic dependency of python
>> to my image anyway.
>>
>> $ grep "crda" ./*.dot | grep pyt
>> ./task-depends.dot:"crda.do_build" -> "python-dbus.do_package_write_ipk"
>> ./task-depends.dot:"crda.do_build" -> "python.do_package_write_rpm"
>> ./task-depends.dot:"crda.do_build" -> "python.do_package_write_deb"
>> ./task-depends.dot:"crda.do_build" -> "python.do_package_write_ipk"
>> ./task-depends.dot:"crda.do_build" ->
>> "python-pygobject.do_package_write_rpm"
>> ./task-depends.dot:"crda.do_build" ->
>> "python-pygobject.do_package_write_deb"
>> ./task-depends.dot:"crda.do_build" ->
>> "python-pygobject.do_package_write_ipk"
>> ./task-depends.dot:"crda.do_build" -> "python-dbus.do_package_write_rpm"
>> ./task-depends.dot:"crda.do_build" ->
>> "python-dbus.do_package_write_deb"
>>
>> Is there any way to get rid of python dependency in this and only
>> this recipe? it makes my image significally bigger.
> are you sure python is drawn in your image by crda ?
>
> With the existing recipe, I don't get python RDEPENDS in crda :
> http://layers.openembedded.org/layerindex/recipe/4179/
>
> $ cat cortexa9hf-vfp-neon-oe-linux-gnueabi/crda/crda/latest
> PV = 1.1.3
> PR = r0
> RPROVIDES =
> RDEPENDS = eglibc (>= 2.18) libgcrypt (>= 1.5.3) libnl (>= 3.2.22) libnl-genl (>= 3.2.22) udev
> RRECOMMENDS =
> PKGSIZE = 21773
> FILES = /usr/bin/* /usr/sbin/* /usr/lib/crda/* /usr/lib/lib*.so.* /etc /com /var /bin/* /sbin/* /lib/*.so.* /lib/udev/rules.d /usr/lib/udev/rules.d /usr/share/crda /usr/lib/crda/* /usr/share/pixmaps /usr/share/applications /usr/share/idl /usr/share/omf /usr/share/sounds /usr/lib/bonobo/servers /usr/libcrda/regulatory.bin /lib/udev/rules.d/85-regulatory.rules
> FILELIST
> = /lib/udev/rules.d/85-regulatory.rules /sbin/crda /sbin/regdbdump /usr/lib/crda/regulatory.bin
>
> Eric

pretty sure! see my grep on *.dot files. python is installed due to crda.
may be the difference is that I'm using new version of crda (2014.06.00)?
look at my recipe (attached)




--------------090201050806020807020905
Content-Type: application/gzip;
 name="crda.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="crda.tar.gz"

H4sIALKDCVQAA+2Xe2/bNhDA/W/0KQjXQxN4epB6OS4MxJHVVLBju7LTrlgHQQ/KFiJLmiRnC4J8
9x1tJU2Gtd2ApN0w/gCLFHnkne6OR1iSwzLy5dZzogCmru9bQ3vUNrQw0RRC4KkbMG6aqtFC+rNa
1bCtar9EqBVdfVnua/P/UaR9/OMkpdVzZcHfjr+qYEMzWwrGioZ5/L8Fj+Kf5WkU5lmcrKTCr8P1
E+lgATY07bPx1wmB+KsmQFSdxV+DVGgh5Yn0f5H/efxFUUSSfO5fUpYCBwR8Lyo9kRwjjPuK0sdE
uj+kqKv0FEXodrufX4LNPtYkgxiKilUNN0tOTpCIifmjibr75uREQAedw+nbI/QSIWe6WA4nE4TS
JCjp6uVu7u3R5jJKSiQWqHM4shfLkeMeyZ3DiXPKeo1MyGZhyLXPjv5SThbEneBdZgvdgxcP35Fo
PVxH61BOI6nKpdAP11RAAvpByvvwCBGYFgXS+pPCh99gWQiazonwvSP6z2jOP3t4LJKSYkDApSB4
Qh1fOf/YMMnj+x8TAkP8/H8DIPEt15kvndkUDVD7fVJSuAkqZNGsLv0UuXS1Tf06L6/RKN/4SYaG
K5hqC29m5/Z8eGazVeu6Lvqy/FuzWLqkZUZTKS9XMs3kiF7RNC9oWcmfdpMtdzRsCwvbulMd+BVt
C3PXmbnO8gMbyYs6yTM/bQsTx7Kni50uZ2ExKdbt3AwvljPXfnfbFoSFa0Fv8HhwZM/t6WjBhKG0
rMLyuqhZkclgT7eZ9Do38+ktE9mCpejuI8TdaW8LUJuGU9tbjJ15I9kFUZAUI1pUe8XeheuwDVZJ
DW6A50MPFNtArsKNnCbZ9nd5P8Fk5E24KvN4d/QkeH8VlH4Wrgcbv6pp2b7b1/OLgmYR2/6jgFjF
BRV/vqjRR4FZwr7+/cwdQyW7ZSpgzHo9GZ6BA7qoLcZzx0LiBA3kbVWCPQES0w38Gr9Ap1iJtCxz
0G7/tHSH3sw+H47tQfvdACMoeN6pMx2whfuiUd5HUwogMdyL6dI5t735xenY/uCBEQ9kwQuX9LqS
kZ+mXpZf0TKJr8G+KPeSDI5gmh4eoRsB5dQrt9kGLhfU1ORB52Z0ixoh4fbe4T/vHLeJ9Gq7+YW5
R49D0/RjoxeolGD4BxH0aEziXqAYOOxhpf14ZbX2iW7cLz4ONNNQIl/T/F7cU9TQp77vm3FwbFIl
NIJIjVU91hRN0wPSI3qPmjHWQhIHFKuBvstR77UzsRee9Wa8uDhnuzbhatL3FRg7oGCQAcpUrGFV
J1GP4DgyjMDQ4lih1ASfvEDT2dLuw33z6xaysULbstgkqLiu13kmbsguXPn3rhwcDofD4XA4HA6H
w+FwOBwOh8PhcDicfyN/ACfbUWwAKAAA

--------------090201050806020807020905
Content-Type: text/plain; charset=UTF-8;
 name="crda_2014.06.00.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="crda_2014.06.00.bb"

DESCRIPTION = "Wireless Central Regulatory Domain Agent"
HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
SECTION = "base"
PRIORITY = "optional"
LICENSE = "ISC"
PR = "${AUTOREV}"

SRCREV="${AUTOREV}"

DEPENDS = "libgcrypt libnl"
RDEPENDS_${PN} = "udev wireless-regdb"
INSANE_SKIP_${PN} += "dev-deps"

SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git;branch=master"
SRC_URI_append = "\
 file://noldconfig.patch \
"

S="${WORKDIR}/git"

CFLAGS =+ "-fPIC -L =/usr/lib -lm -lgcrypt -lgpg-error"
EXTRA_OEMAKE="V=1 REG_BIN=/lib/crda/regulatory.bin RUNTIME_PUBKEY_DIR=/lib/crda/pubkeys/ all_noverify"

do_install() {
 oe_runmake DESTDIR=${D} install
}

SRC_URI[crda.md5sum] = "5fc77af68b3e21736b8ef2f8b061c810"
SRC_URI[crda.sha256sum] = "59b4760da44a8f803caeaaa7fb97e0c6bd3f35f40445b28258e7f14c2fbe13b5"
LIC_FILES_CHKSUM = "file://LICENSE;md5=ef8b69b43141352d821fd66b64ff0ee7"

# NOTE: requires urpmi python-m2crypto

--------------090201050806020807020905--
