Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C88C7759D5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Aug 2015 20:49:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7TKn1Fw014474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 29 Aug 2015 13:49:02 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 29 Aug 2015 13:49:01 -0700
To: <openembedded-core@lists.openembedded.org>, Robert Yang
	<liezhi.yang@windriver.com>, Saul Wold <sgw@linux.intel.com>
References: <cover.1440790956.git.akuster808@gmail.com>
	<55E15167.4040302@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <55E21ABC.1000208@windriver.com>
Date: Sat, 29 Aug 2015 16:49:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55E15167.4040302@linux.intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH 00/15] For Dizzy 1.7.3a v2
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
X-List-Received-Date: Sat, 29 Aug 2015 20:49:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015-08-29 02:29 AM, Saul Wold wrote:
>
> Hi Armin,
>
> I added the bitbake patch to my sgw/dizzy branch and threw it against
> the Autobuilder.
>
> There where a few failures, some of which may be expected, others need
> more investigation:
>
> arm64
> mip64
>   - I don't think that dizzy had support for those yet.

The YP autobuilder may not have been testing those targets
but the distro release certainly supports mips64 and arm64 was
unofficially supported but only came in Dec 2014. (see below)

Robert can fix or find someone to fix any problems you've identified.

../Randy



$ git log --reverse meta/conf/machine/qemumips64.conf
commit 3f16954c6fae2de78fa9c5ece69354be7ec25cf2
Author: Khem Raj <raj.khem@gmail.com>
Date:   Sun May 12 22:42:25 2013 -0700

     machine/qemumips64: Add machine definition

     Signed-off-by: Khem Raj <raj.khem@gmail.com>
     Signed-off-by: Saul Wold <sgw@linux.intel.com>

$ git branch --contains 3f16954c6fae2de78fa9c5ece69354be7ec25cf2
   daisy
   dizzy
   dora
   efi
   fido
* master
   master-next

$ git log --reverse meta/conf/machine/qemuarm64.conf

commit d7314c3bc804b7bcc921b0a6c5b63d71ca2e73db
Author: Kai Kang <kai.kang@windriver.com>
Date:   Thu Dec 18 16:50:58 2014 +0800

     Add machine qemuarm64

     Add machine qemuarm64. The configure files are derived from linaro.

     Update:
     * rename genericarmv8 to qemuarm64 for coordination in oe-core
     * include qemu.inc then remove common part of config
     * disable using autoserial
     * move arch-armv8.inc from machine/include/arm64 to machine/include/arm

     [YOCTO #6487]

     Signed-off-by: Kai Kang <kai.kang@windriver.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


  $ git branch --contains d7314c3bc804b7bcc921b0a6c5b63d71ca2e73db
   fido
* master
   master-next

>
>
> deb-non-deb
>   - did these ever work for dizzy?
>
> wic
>   - New build target
>
> It's still finishing up right now.
>
> Sau!
>
>
> On 08/28/2015 12:44 PM, Armin Kuster wrote:
>> Rebased against Dizzy this time.
>>
>> Please consider this changes for Dizzy 1.7.3
>>
>> The following changes since commit
>> 137f52ac3a3cf6dc9eed27178c37e9ce235341d8:
>>
>>    grub-efi: Add backslash lost from previous commit (2015-08-20
>> 21:42:31 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>>    http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next
>>
>> Alejandro Hernandez (1):
>>    qemurunner: Improves checking for server and target IPs on qemus
>>      parameters
>>
>> Aníbal Limón (1):
>>    license_class: fix license.manifest shows LICENSE field differently to
>>      recipe
>>
>> Martin Jansa (2):
>>    connman-conf: fix SRC_URI_append
>>    license.bbclass: fix unexpected operator for LICENSE values with space
>>
>> Paul Eggleton (1):
>>    oeqa/utils/qemurunner: fix logging
>>
>> Petter Mabäcker (1):
>>    meta: set proper S value
>>
>> Richard Purdie (3):
>>    runqueue: Add message to explain the problem if diffsigs multiple
>>      tasks don't exist
>>    fetch2: Extend mirroruri handlling
>>    sstate: Use SSTATE_DIR for FILESPATH
>>
>> Ross Burton (1):
>>    oeqa/QemuRunner: don't use bb for logging
>>
>> Sona Sarmadi (4):
>>    bind9.9.5: CVE-2015-5477
>>    qemu: CVE-2014-7840
>>    qemu-vnc: CVE-2014-7815
>>    qemu-slirp: CVE-2014-3640
>>
>> Yi Zhao (1):
>>    oeqa/selftest: fix test_incremental_image_generation for changes in
>>      log output
>>
>>   bitbake/lib/bb/fetch2/__init__.py                  |  1 +
>>   bitbake/lib/bb/runqueue.py                         |  2 +
>>   meta/classes/license.bbclass                       | 15 ++---
>>   meta/classes/sstate.bbclass                        |  4 +-
>>   meta/lib/oeqa/selftest/buildoptions.py             | 11 ++--
>>   meta/lib/oeqa/utils/qemurunner.py                  | 73
>> ++++++++++++----------
>>   meta/recipes-bsp/alsa-state/alsa-state.bb          |  2 +
>>   meta/recipes-bsp/hostap/hostap-conf_1.0.bb         |  2 +
>>   meta/recipes-bsp/keymaps/keymaps_1.0.bb            |  2 +
>>   .../bind/bind/bind9_9_5-CVE-2015-5477.patch        | 45 +++++++++++++
>>   meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
>>   meta/recipes-connectivity/connman/connman-conf.bb  |  8 ++-
>>   .../ppp-dialin/ppp-dialin_0.1.bb                   |  2 +
>>   .../init-ifupdown/init-ifupdown_1.0.bb             |  2 +
>>   .../initrdscripts/initramfs-boot_1.0.bb            |  2 +
>>   .../initrdscripts/initramfs-framework_1.0.bb       |  2 +
>>   .../initrdscripts/initramfs-live-boot_1.0.bb       |  2 +
>>   .../initramfs-live-install-efi-testfs_1.0.bb       |  2 +
>>   .../initramfs-live-install-efi_1.0.bb              |  2 +
>>   .../initramfs-live-install-testfs_1.0.bb           |  2 +
>>   .../initrdscripts/initramfs-live-install_1.0.bb    |  2 +
>>   meta/recipes-core/initscripts/initscripts_1.0.bb   |  2 +
>>   .../systemd/systemd-systemctl-native.bb            |  2 +
>>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  2 +-
>>   meta/recipes-core/udev/udev-extraconf_1.1.bb       |  2 +
>>   meta/recipes-devtools/opkg/opkg-collateral.bb      |  2 +
>>   .../recipes-devtools/qemu/qemu/CVE-2014-7840.patch | 57
>> +++++++++++++++++
>>   .../qemu/qemu/slirp-CVE-2014-3640.patch            | 48 ++++++++++++++
>>   .../qemu/qemu/vnc-CVE-2014-7815.patch              | 53
>> ++++++++++++++++
>>   meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  3 +
>>   .../run-postinsts/run-postinsts_1.0.bb             |  2 +
>>   .../shadow/shadow-securetty_4.2.1.bb               |  2 +
>>   .../xorg-xserver/xserver-xf86-config_0.1.bb        |  2 +
>>   .../modutils-initscripts/modutils-initscripts.bb   |  3 +
>>   meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb        |  2 +
>>   .../ptest-runner/ptest-runner_1.0.bb               |  2 +
>>   36 files changed, 318 insertions(+), 50 deletions(-)
>>   create mode 100644
>> meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
>>   create mode 100644
>> meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch
>>   create mode 100644
>> meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch
>>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

