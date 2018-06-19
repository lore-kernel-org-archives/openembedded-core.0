Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BFF274603
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 05:04:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5J53u9i003135
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jun 2018 22:04:12 -0700
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 18 Jun 2018 22:03:46 -0700
To: <openembedded-core@lists.openembedded.org>, <alex.kanavin@gmail.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
Date: Tue, 19 Jun 2018 01:03:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180504123244.43049-12-alexander.kanavin@linux.intel.com>
X-Originating-IP: [172.25.44.2]
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 05:04:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/04/2018 08:32 AM, Alexander Kanavin wrote:
> Rebase a couple of patches


It seems that this meson update broke systemd on qemuppc.
I'll look into it a more tomorrow but below is what I know so far.
It looks like the libsystemd-shared.so size increased by 18% despite
the build flags being the same!

Despite my IRC handle, I'm a meson newbie so any tips will
be appreciated. I'll work on getting meson/ninja to be more
verbose tomorrow to track down what really changed.


I recently started testing qemuppc by booting
core-image-minimal with systemd as init. It fails with:

    /sbin/init: error while loading shared libraries:
       /lib/systemd/libsystemd-shared-237.so: R_PPC_REL24 relocation at 
0x0054574c for symbol `strlen' out of range

or in some cases:

   systemd[1]: \
      unhandled signal 11 at b804b784 nip 0070d184 lr 008ee1ac code 1
   Kernel panic - not syncing: \
      Attempted to kill init! exitcode=0x0000000b
when running:
     runqemu slirp nographic qemuppc ext4

The error only appears when using the distro poky-lsb
or a security template in the WR builds.

Adding:
meta/conf/distro/include/security_flags.inc
+SECURITY_CFLAGS_pn-systemd_powerpc = "${SECURITY_NO_PIE_CFLAGS}"

the systemd configure flags changed from:
        -no-pie -fno-PIE
to:
        -Wformat -Wformat-security -Werror=format-security
and the problem went away.

Being a sucker for punishment and having a nice builder on hand,
I decided to bisect the error anyway, assuming that I'd end up
at a systemd or toolchain uprev. Instead, I ended up at this
meson update being the culprit.


Here are the poky commits with the final stages of a
git bisect status appended:

53dfa673d7 musl: Upgrade to latest - bad
...
several bad results
...
96d783fa39 ifupdown: correct the repository location - bad
a6b62ef9ae meson: update to 0.46.0 - BAD
26fba81701 webkitgtk: update to 2.20.1 - good
4c52e22689 procps: update to 3.3.14 - untested
23320a2c9a libwebp: update to 1.0.0 - good
...
some good or unbuildable results
...


Looking at:
$ buildhistory-diff 10cdd2f bbbbd64
Changes to images/qemuppc/glibc/core-image-minimal (files-in-image.txt):
   /etc/udev/hwdb.bin was removed
   /etc/rpm-postinsts/100-udev-hwdb was added
   /etc/rpm-postinsts was added
images/qemuppc/glibc/core-image-minimal:
   IMAGESIZE changed from 48828 to 43144 (-12%)
packages/ppc7400-poky-linux/systemd/libnss-myhostname:
   PKGSIZE changed from 198364 to 132584 (-33%)
packages/ppc7400-poky-linux/systemd/libnss-mymachines:
   PKGSIZE changed from 461724 to 394872 (-14%)
packages/ppc7400-poky-linux/systemd/libudev:
   PKGSIZE changed from 264200 to 198180 (-25%)
packages/ppc7400-poky-linux/systemd/systemd-analyze:
   PKGSIZE changed from 1445140 to 1902168 (+32%)
packages/ppc7400-poky-linux/systemd/systemd-container:
   PKGSIZE changed from 528737 to 725017 (+37%)
packages/ppc7400-poky-linux/systemd/systemd:
   PKGSIZE changed from 9540698 to 11236850 (+18%)

The systemd package sizes have change quite a bit
and the main pkg increased by 18% likely putting the
shared library over a PPC relative jump limit of 8MB iirc.

The configure files changed but only due to a typo fix
and a warning about a feature that will become an error in
the next release. None of the flags that get tested and used changed!
The PIE/pie flags [1] don't change.

The meson compile logs don't help immediately because they
hide the 'Compiling/Linking' flags but massaging the logs,
shows that all the same files are compiled and linked.

Any suggestions?

More tomorrow...

-- 
# Randy MacLeod
# Wind River Linux


[1]

$ grep -i pie /tmp/log.do_configure.93182  /tmp/log.do_configure.57702
/tmp/log.do_configure.93182:Cross C compiler: \
   powerpc-poky-linux-gcc -m32 -mhard-float -mcpu=7400 -mno-spe \
     -fstack-protector-strong -D_FORTIFY_SOURCE=2 \
     -no-pie -fno-PIE \
 
--sysroot=/.../tmp/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot 
(gcc 7.3.0)
/tmp/log.do_configure.93182:Compiler for C supports argument -fPIE: YES
/tmp/log.do_configure.93182:Message: Linking with -pie supported: yes

/tmp/log.do_configure.57702:Cross C compiler: \
   powerpc-poky-linux-gcc -m32 -mhard-float -mcpu=7400 -mno-spe \
     -fstack-protector-strong -D_FORTIFY_SOURCE=2 \
     -no-pie -fno-PIE \
 
--sysroot=/.../tmp/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot 
(gcc 7.3.0)
/tmp/log.do_configure.57702:Compiler for C supports arguments -fPIE: YES
/tmp/log.do_configure.57702:Message: Linking with -pie supported: yes


