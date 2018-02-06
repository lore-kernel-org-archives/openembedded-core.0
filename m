Return-Path: <california.l.sullivan@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id A06F97827A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 00:15:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2018 16:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,466,1511856000"; d="scan'208,217";a="32266824"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2018 16:15:23 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20171219221234.21699-1-california.l.sullivan@intel.com>
	<8686fa07-e2a8-1080-e646-7380437e7338@intel.com>
	<49611977-aff9-6e13-ab7a-0233208e49b3@intel.com>
	<CAJTo0LZJfZMVoG_WCJYEqJvCH4aBUE1pv=i4HYZmqtTEMKkvVQ@mail.gmail.com>
	<CAJTo0LbA0w+Rq_cPpBjDPe6JOrFN-wsu0sRA37Bdh_8nrW3u6g@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <a86b178d-3b9f-f967-1fe8-720f238b74ba@intel.com>
Date: Mon, 5 Feb 2018 16:15:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbA0w+Rq_cPpBjDPe6JOrFN-wsu0sRA37Bdh_8nrW3u6g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-minimal-initramfs: use initramfs-framework for initialization
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
X-List-Received-Date: Tue, 06 Feb 2018 00:15:22 -0000
Content-Type: multipart/alternative;
	boundary="------------8EF25E7F955923DE88FACC1C"
Content-Language: en-US

--------------8EF25E7F955923DE88FACC1C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Looking at the test and the output, its expecting /dev/sda3 to be 
mounted as /media and /dev/sda4 to be mounted as /mnt. With this test 
result, there is no /media, and instead /dev/sda3 is mounted to /mnt.

That seems odd to me unless that partition either wasn't created or went 
entirely undetected.

I'll take a closer look, I think there's more going on here.

---
Cal

On 02/05/2018 03:34 PM, Burton, Ross wrote:
> This is causing the qemu boot wic test to fail in oe-selftest:
>
> 2018-02-05 15:08:41,786 - oe-selftest - INFO - FAIL [64.639s]: 
> test_qemu (wic.Wic)
> 2018-02-05 15:08:41,786 - oe-selftest - INFO - 
> ----------------------------------------------------------------------
> 2018-02-05 15:08:41,786 - oe-selftest - INFO - Traceback (most recent 
> call last):
>   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py", 
> line 32, in wrapped_f
>     return func(*args, **kwargs)
>   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py", 
> line 58, in wrapped_f
>     return func(*args, **kwargs)
>   File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py", 
> line 637, in test_qemu
>     self.assertEqual(output, '/dev/root /\r\n/dev/sda1 
> /boot\r\n/dev/sda3 /mnt')
> AssertionError: '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 
> /media\r\n/dev/sda4 /mnt' != '/dev/root /\r\n/dev/sda1 
> /boot\r\n/dev/sda3 /mnt'
>   /dev/root /
>   /dev/sda1 /boot
> - /dev/sda3 /media
> - /dev/sda4 /mnt?         ^
> + /dev/sda3 /mnt?         ^
>
> Presumably this is the initramfs mounting more stuff automatically?  I 
> don't have an opinion right now as to whether this is a problem with 
> the initramfs or the test case being too strict...
>
> Ross
>
>
> On 1 February 2018 at 14:03, Burton, Ross <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
>
>     Sorry, missed this.  I'll pull it into MUT and throw it at the
>     autobuilder...
>
>     Ross
>
>     On 31 January 2018 at 22:53, Cal Sullivan
>     <california.l.sullivan@intel.com
>     <mailto:california.l.sullivan@intel.com>> wrote:
>
>         Ping.
>
>         ---
>         Cal
>
>
>         On 01/09/2018 05:00 PM, Cal Sullivan wrote:
>
>             Anything wrong with this? Haven't seen it hit any mut
>             branches.
>
>             Thanks,
>             Cal
>
>             On 12/19/2017 02:12 PM, California Sullivan wrote:
>
>                 initramfs-framework is more modular and expandable.
>                 This change was
>                 proposed in commit
>                 28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e
>                 "core-image-minimal-initramfs: use initramfs-framework
>                 by default" but
>                 reverted due to the selftests
>                 runqemu.RunqemuTests.test_boot_machine_iso
>                 and runqemu.RunqemuTests.test_boot_deploy_hddimg
>                 failing. Since then,
>                 the kinks have been worked out, and missing
>                 functionality that had been
>                 missed (non-EFI installation module) has been added.
>
>                 Since the PACKAGE_INSTALL variable was getting so long
>                 with all these
>                 individual modules getting added, I also introduced a new
>                 INITRAMFS_SCRIPTS variable to the
>                 core-image-minimal-initramfs recipe.
>                 This variable makes the recipe look much cleaner, and
>                 also allows easier
>                 replacement or additions to the scripts.
>
>                 Fixes [YOCTO #10987].
>
>                 Signed-off-by: California Sullivan
>                 <california.l.sullivan@intel.com
>                 <mailto:california.l.sullivan@intel.com>>
>                 ---
>                  
>                 meta/recipes-core/images/core-image-minimal-initramfs.bb
>                 <http://core-image-minimal-initramfs.bb> | 10 +++++++++-
>                   1 file changed, 9 insertions(+), 1 deletion(-)
>
>                 diff --git
>                 a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>                 <http://core-image-minimal-initramfs.bb>
>                 b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>                 <http://core-image-minimal-initramfs.bb>
>                 index 5794a25952a..a9ba91bd310 100644
>                 ---
>                 a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>                 <http://core-image-minimal-initramfs.bb>
>                 +++
>                 b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>                 <http://core-image-minimal-initramfs.bb>
>                 @@ -3,7 +3,15 @@ DESCRIPTION = "Small image capable of
>                 booting a device. The kernel includes \
>                   the Minimal RAM-based Initial Root Filesystem
>                 (initramfs), which finds the \
>                   first 'init' program more efficiently."
>                   -PACKAGE_INSTALL = "initramfs-live-boot
>                 initramfs-live-install initramfs-live-install-efi
>                 ${VIRTUAL-RUNTIME_base-utils} udev base-passwd
>                 ${ROOTFS_BOOTSTRAP_INSTALL}"
>                 +INITRAMFS_SCRIPTS ?= "\
>                 + initramfs-framework-base \
>                 + initramfs-module-setup-live \
>                 + initramfs-module-udev \
>                 + initramfs-module-install \
>                 + initramfs-module-install-efi \
>                 +                     "
>                 +
>                 +PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS}
>                 ${VIRTUAL-RUNTIME_base-utils} udev base-passwd
>                 ${ROOTFS_BOOTSTRAP_INSTALL}"
>                     # Do not pollute the initrd image with rootfs features
>                   IMAGE_FEATURES = ""
>
>
>
>         -- 
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>


--------------8EF25E7F955923DE88FACC1C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <tt>Looking at the test and the output, its expecting /dev/sda3 to
      be mounted as /media and /dev/sda4 to be mounted as /mnt. With
      this test result, there is no /media, and instead /dev/sda3 is
      mounted to /mnt.<br>
      <br>
      That seems odd to me unless that partition either wasn't created
      or went entirely undetected.<br>
    </tt><br>
    <tt><tt>I'll take a closer look, I think there's more going on here.</tt><br>
      <br>
      ---<br>
      Cal<br>
    </tt><br>
    <div class="moz-cite-prefix">On 02/05/2018 03:34 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LbA0w+Rq_cPpBjDPe6JOrFN-wsu0sRA37Bdh_8nrW3u6g@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">This is causing the qemu boot wic test to fail in
        oe-selftest:<br>
        <br>
        2018-02-05 15:08:41,786 - oe-selftest - INFO - FAIL [64.639s]:
        test_qemu (wic.Wic)<br>
        2018-02-05 15:08:41,786 - oe-selftest - INFO -
        ----------------------------------------------------------------------<br>
        2018-02-05 15:08:41,786 - oe-selftest - INFO - Traceback (most
        recent call last):<br>
          File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
        line 32, in wrapped_f<br>
            return func(*args, **kwargs)<br>
          File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
        line 58, in wrapped_f<br>
            return func(*args, **kwargs)<br>
          File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
        line 637, in test_qemu<br>
            self.assertEqual(output, '/dev/root /\r\n/dev/sda1
        /boot\r\n/dev/sda3 /mnt')<br>
        AssertionError: '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3
        /media\r\n/dev/sda4 /mnt' != '/dev/root /\r\n/dev/sda1
        /boot\r\n/dev/sda3 /mnt'<br>
          /dev/root /<br>
          /dev/sda1 /boot<br>
        - /dev/sda3 /media<br>
        - /dev/sda4 /mnt?         ^<br>
        + /dev/sda3 /mnt?         ^<br>
        <br>
        Presumably this is the initramfs mounting more stuff
        automatically?  I don't have an opinion right now as to whether
        this is a problem with the initramfs or the test case being too
        strict...
        <div><br>
        </div>
        <div>Ross<br>
          <br>
        </div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 1 February 2018 at 14:03, Burton,
          Ross <span dir="ltr">&lt;<a
              href="mailto:ross.burton@intel.com" target="_blank"
              moz-do-not-send="true">ross.burton@intel.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div dir="ltr">Sorry, missed this.  I'll pull it into MUT
              and throw it at the autobuilder...<span class="HOEnZb"><font
                  color="#888888">
                  <div><br>
                  </div>
                  <div>Ross</div>
                </font></span></div>
            <div class="HOEnZb">
              <div class="h5">
                <div class="gmail_extra"><br>
                  <div class="gmail_quote">On 31 January 2018 at 22:53,
                    Cal Sullivan <span dir="ltr">&lt;<a
                        href="mailto:california.l.sullivan@intel.com"
                        target="_blank" moz-do-not-send="true">california.l.sullivan@intel.<wbr>com</a>&gt;</span>
                    wrote:<br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping.<br>
                      <br>
                      ---<br>
                      Cal
                      <div class="m_-9033303757896667203HOEnZb">
                        <div class="m_-9033303757896667203h5"><br>
                          <br>
                          On 01/09/2018 05:00 PM, Cal Sullivan wrote:<br>
                          <blockquote class="gmail_quote"
                            style="margin:0 0 0 .8ex;border-left:1px
                            #ccc solid;padding-left:1ex">
                            Anything wrong with this? Haven't seen it
                            hit any mut branches.<br>
                            <br>
                            Thanks,<br>
                            Cal<br>
                            <br>
                            On 12/19/2017 02:12 PM, California Sullivan
                            wrote:<br>
                            <blockquote class="gmail_quote"
                              style="margin:0 0 0 .8ex;border-left:1px
                              #ccc solid;padding-left:1ex">
                              initramfs-framework is more modular and
                              expandable. This change was<br>
                              proposed in commit
                              28fc6ba761ed4a47efa7c43e7f7dff<wbr>5e2fe72b5e<br>
                              "core-image-minimal-initramfs: use
                              initramfs-framework by default" but<br>
                              reverted due to the selftests
                              runqemu.RunqemuTests.test_boot<wbr>_machine_iso<br>
                              and runqemu.RunqemuTests.test_boot<wbr>_deploy_hddimg
                              failing. Since then,<br>
                              the kinks have been worked out, and
                              missing functionality that had been<br>
                              missed (non-EFI installation module) has
                              been added.<br>
                              <br>
                              Since the PACKAGE_INSTALL variable was
                              getting so long with all these<br>
                              individual modules getting added, I also
                              introduced a new<br>
                              INITRAMFS_SCRIPTS variable to the
                              core-image-minimal-initramfs recipe.<br>
                              This variable makes the recipe look much
                              cleaner, and also allows easier<br>
                              replacement or additions to the scripts.<br>
                              <br>
                              Fixes [YOCTO #10987].<br>
                              <br>
                              Signed-off-by: California Sullivan &lt;<a
href="mailto:california.l.sullivan@intel.com" target="_blank"
                                moz-do-not-send="true">california.l.sullivan@intel.c<wbr>om</a>&gt;<br>
                              ---<br>
                                meta/recipes-core/images/<a
                                href="http://core-image-minimal-initramfs.bb"
                                rel="noreferrer" target="_blank"
                                moz-do-not-send="true">core-<wbr>image-minimal-initramfs.bb</a>
                              | 10 +++++++++-<br>
                                1 file changed, 9 insertions(+), 1
                              deletion(-)<br>
                              <br>
                              diff --git a/meta/recipes-core/images/<a
                                href="http://core-image-minimal-initramfs.bb"
                                rel="noreferrer" target="_blank"
                                moz-do-not-send="true">cor<wbr>e-image-minimal-initramfs.bb</a>
                              b/meta/recipes-core/images/<a
                                href="http://core-image-minimal-initramfs.bb"
                                rel="noreferrer" target="_blank"
                                moz-do-not-send="true">cor<wbr>e-image-minimal-initramfs.bb</a><br>
                              index 5794a25952a..a9ba91bd310 100644<br>
                              --- a/meta/recipes-core/images/<a
                                href="http://core-image-minimal-initramfs.bb"
                                rel="noreferrer" target="_blank"
                                moz-do-not-send="true">cor<wbr>e-image-minimal-initramfs.bb</a><br>
                              +++ b/meta/recipes-core/images/<a
                                href="http://core-image-minimal-initramfs.bb"
                                rel="noreferrer" target="_blank"
                                moz-do-not-send="true">cor<wbr>e-image-minimal-initramfs.bb</a><br>
                              @@ -3,7 +3,15 @@ DESCRIPTION = "Small
                              image capable of booting a device. The
                              kernel includes \<br>
                                the Minimal RAM-based Initial Root
                              Filesystem (initramfs), which finds the \<br>
                                first 'init' program more efficiently."<br>
                                -PACKAGE_INSTALL = "initramfs-live-boot
                              initramfs-live-install
                              initramfs-live-install-efi
                              ${VIRTUAL-RUNTIME_base-utils} udev
                              base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"<br>
                              +INITRAMFS_SCRIPTS ?= "\<br>
                              +                     
                              initramfs-framework-base \<br>
                              +                     
                              initramfs-module-setup-live \<br>
                              +                     
                              initramfs-module-udev \<br>
                              +                     
                              initramfs-module-install \<br>
                              +                     
                              initramfs-module-install-efi \<br>
                              +                     "<br>
                              +<br>
                              +PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS}
                              ${VIRTUAL-RUNTIME_base-utils} udev
                              base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"<br>
                                  # Do not pollute the initrd image with
                              rootfs features<br>
                                IMAGE_FEATURES = ""<br>
                            </blockquote>
                            <br>
                          </blockquote>
                          <br>
                          -- <br>
                          ______________________________<wbr>_________________<br>
                          Openembedded-core mailing list<br>
                          <a
                            href="mailto:Openembedded-core@lists.openembedded.org"
                            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                          <a
                            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                  <br>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------8EF25E7F955923DE88FACC1C--
