Return-Path: <california.l.sullivan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D84D678743
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 20:34:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2018 12:34:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,397,1515484800"; d="scan'208,217";a="20467608"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga007.jf.intel.com with ESMTP; 26 Feb 2018 12:34:37 -0800
From: Cal Sullivan <california.l.sullivan@intel.com>
To: Khem Raj <raj.khem@gmail.com>
References: <20171219221234.21699-1-california.l.sullivan@intel.com>
	<8686fa07-e2a8-1080-e646-7380437e7338@intel.com>
	<49611977-aff9-6e13-ab7a-0233208e49b3@intel.com>
	<CAJTo0LZJfZMVoG_WCJYEqJvCH4aBUE1pv=i4HYZmqtTEMKkvVQ@mail.gmail.com>
	<CAJTo0LbA0w+Rq_cPpBjDPe6JOrFN-wsu0sRA37Bdh_8nrW3u6g@mail.gmail.com>
	<a86b178d-3b9f-f967-1fe8-720f238b74ba@intel.com>
	<CAMKF1sp=mb4fMEEu0mkPvvYZYRZXiwtjQ=who4RNVNhQv8=X+Q@mail.gmail.com>
	<fb16c035-aa39-a21f-5bd2-0ebda3dfe3bf@intel.com>
	<fa8e33cf-45a0-6348-8868-fcaca4e4ca47@intel.com>
Message-ID: <4b16b374-528f-b28b-8532-459e7c62661c@intel.com>
Date: Mon, 26 Feb 2018 12:34:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <fa8e33cf-45a0-6348-8868-fcaca4e4ca47@intel.com>
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
X-List-Received-Date: Mon, 26 Feb 2018 20:34:37 -0000
Content-Type: multipart/alternative;
	boundary="------------DA4D9D5AE415808778B0B0F9"
Content-Language: en-US

--------------DA4D9D5AE415808778B0B0F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ross,

Somehow dropped you from CC on my last reply. Can we give this another 
shot? The error we saw should be unrelated to this patch, as the wic 
image being tested here does not use core-image-minimal-initramfs at all.

Thanks,
Cal

On 02/06/2018 11:03 AM, Cal Sullivan wrote:
> Shortly after leaving work last night I realized that this error 
> should have nothing to do with the initrd/initramfs, as this wic image 
> is not using one.
>
> Also, in 300 runs of this test the error didn't occur once, so it 
> appears to be very rare.
>
> ---
> Cal
>
> On 02/05/2018 05:52 PM, Cal Sullivan wrote:
>>
>>
>> On 02/05/2018 04:47 PM, Khem Raj wrote:
>>>
>>> On Mon, Feb 5, 2018 at 4:15 PM Cal Sullivan 
>>> <california.l.sullivan@intel.com 
>>> <mailto:california.l.sullivan@intel.com>> wrote:
>>>
>>>     Looking at the test and the output, its expecting /dev/sda3 to
>>>     be mounted as /media and /dev/sda4 to be mounted as /mnt. With
>>>     this test result, there is no /media, and instead /dev/sda3 is
>>>     mounted to /mnt.
>>>
>>>     That seems odd to me unless that partition either wasn't created
>>>     or went entirely undetected.
>>>
>>>     I'll take a closer look, I think there's more going on here.
>>>
>>>
>>> Udev trigger sometimes get ignored have seem that in past
>> Thanks for the info Khem! I think its an intermittent issue unrelated 
>> to this patch.
>>
>> I ran the following with my patch applied on top of master and only 
>> SANITY_TESTED_DISTROS changed in local.conf:
>>
>> MACHINE=qemux86-64 oe-selftest -r wic.Wic.test_qemu
>>
>> And it didn't fail.
>>
>> I'm going to run this test a few hundred times overnight without my 
>> patch and see if I can hit it.
>>
>> Thanks,
>> Cal
>>
>>>
>>>
>>>     ---
>>>     Cal
>>>
>>>     On 02/05/2018 03:34 PM, Burton, Ross wrote:
>>>>     This is causing the qemu boot wic test to fail in oe-selftest:
>>>>
>>>>     2018-02-05 15:08:41,786 - oe-selftest - INFO - FAIL [64.639s]:
>>>>     test_qemu (wic.Wic)
>>>>     2018-02-05 15:08:41,786 - oe-selftest - INFO -
>>>>     ----------------------------------------------------------------------
>>>>     2018-02-05 15:08:41,786 - oe-selftest - INFO - Traceback (most
>>>>     recent call last):
>>>>       File
>>>>     "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
>>>>     line 32, in wrapped_f
>>>>         return func(*args, **kwargs)
>>>>       File
>>>>     "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
>>>>     line 58, in wrapped_f
>>>>         return func(*args, **kwargs)
>>>>       File
>>>>     "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
>>>>     line 637, in test_qemu
>>>>         self.assertEqual(output, '/dev/root /\r\n/dev/sda1
>>>>     /boot\r\n/dev/sda3 /mnt')
>>>>     AssertionError: '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3
>>>>     /media\r\n/dev/sda4 /mnt' != '/dev/root /\r\n/dev/sda1
>>>>     /boot\r\n/dev/sda3 /mnt'
>>>>       /dev/root /
>>>>       /dev/sda1 /boot
>>>>     - /dev/sda3 /media
>>>>     - /dev/sda4 /mnt?         ^
>>>>     + /dev/sda3 /mnt?         ^
>>>>
>>>>     Presumably this is the initramfs mounting more stuff
>>>>     automatically?  I don't have an opinion right now as to whether
>>>>     this is a problem with the initramfs or the test case being too
>>>>     strict...
>>>>
>>>>     Ross
>>>>
>>>>
>>>>     On 1 February 2018 at 14:03, Burton, Ross
>>>>     <ross.burton@intel.com <mailto:ross.burton@intel.com>> wrote:
>>>>
>>>>         Sorry, missed this.  I'll pull it into MUT and throw it at
>>>>         the autobuilder...
>>>>
>>>>         Ross
>>>>
>>>>         On 31 January 2018 at 22:53, Cal Sullivan
>>>>         <california.l.sullivan@intel.com
>>>>         <mailto:california.l.sullivan@intel.com>> wrote:
>>>>
>>>>             Ping.
>>>>
>>>>             ---
>>>>             Cal
>>>>
>>>>
>>>>             On 01/09/2018 05:00 PM, Cal Sullivan wrote:
>>>>
>>>>                 Anything wrong with this? Haven't seen it hit any
>>>>                 mut branches.
>>>>
>>>>                 Thanks,
>>>>                 Cal
>>>>
>>>>                 On 12/19/2017 02:12 PM, California Sullivan wrote:
>>>>
>>>>                     initramfs-framework is more modular and
>>>>                     expandable. This change was
>>>>                     proposed in commit
>>>>                     28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e
>>>>                     "core-image-minimal-initramfs: use
>>>>                     initramfs-framework by default" but
>>>>                     reverted due to the selftests
>>>>                     runqemu.RunqemuTests.test_boot_machine_iso
>>>>                     and
>>>>                     runqemu.RunqemuTests.test_boot_deploy_hddimg
>>>>                     failing. Since then,
>>>>                     the kinks have been worked out, and missing
>>>>                     functionality that had been
>>>>                     missed (non-EFI installation module) has been
>>>>                     added.
>>>>
>>>>                     Since the PACKAGE_INSTALL variable was getting
>>>>                     so long with all these
>>>>                     individual modules getting added, I also
>>>>                     introduced a new
>>>>                     INITRAMFS_SCRIPTS variable to the
>>>>                     core-image-minimal-initramfs recipe.
>>>>                     This variable makes the recipe look much
>>>>                     cleaner, and also allows easier
>>>>                     replacement or additions to the scripts.
>>>>
>>>>                     Fixes [YOCTO #10987].
>>>>
>>>>                     Signed-off-by: California Sullivan
>>>>                     <california.l.sullivan@intel.com
>>>>                     <mailto:california.l.sullivan@intel.com>>
>>>>                     ---
>>>>                      
>>>>                     meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>                     <http://core-image-minimal-initramfs.bb> | 10
>>>>                     +++++++++-
>>>>                       1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>>                     diff --git
>>>>                     a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>                     <http://core-image-minimal-initramfs.bb>
>>>>                     b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>                     <http://core-image-minimal-initramfs.bb>
>>>>                     index 5794a25952a..a9ba91bd310 100644
>>>>                     ---
>>>>                     a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>                     <http://core-image-minimal-initramfs.bb>
>>>>                     +++
>>>>                     b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>                     <http://core-image-minimal-initramfs.bb>
>>>>                     @@ -3,7 +3,15 @@ DESCRIPTION = "Small image
>>>>                     capable of booting a device. The kernel includes \
>>>>                       the Minimal RAM-based Initial Root Filesystem
>>>>                     (initramfs), which finds the \
>>>>                       first 'init' program more efficiently."
>>>>                       -PACKAGE_INSTALL = "initramfs-live-boot
>>>>                     initramfs-live-install
>>>>                     initramfs-live-install-efi
>>>>                     ${VIRTUAL-RUNTIME_base-utils} udev base-passwd
>>>>                     ${ROOTFS_BOOTSTRAP_INSTALL}"
>>>>                     +INITRAMFS_SCRIPTS ?= "\
>>>>                     + initramfs-framework-base \
>>>>                     + initramfs-module-setup-live \
>>>>                     + initramfs-module-udev \
>>>>                     + initramfs-module-install \
>>>>                     + initramfs-module-install-efi \
>>>>                     +                     "
>>>>                     +
>>>>                     +PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS}
>>>>                     ${VIRTUAL-RUNTIME_base-utils} udev base-passwd
>>>>                     ${ROOTFS_BOOTSTRAP_INSTALL}"
>>>>                         # Do not pollute the initrd image with
>>>>                     rootfs features
>>>>                       IMAGE_FEATURES = ""
>>>>
>>>>
>>>>
>>>>             -- 
>>>>             _______________________________________________
>>>>             Openembedded-core mailing list
>>>>             Openembedded-core@lists.openembedded.org
>>>>             <mailto:Openembedded-core@lists.openembedded.org>
>>>>             http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>>
>>>>
>>>
>>>     --
>>>     _______________________________________________
>>>     Openembedded-core mailing list
>>>     Openembedded-core@lists.openembedded.org
>>>     <mailto:Openembedded-core@lists.openembedded.org>
>>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>
>
>


--------------DA4D9D5AE415808778B0B0F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <tt>Hi Ross,<br>
      <br>
      Somehow dropped you from CC on my last reply. Can we give this
      another shot? The error we saw should be unrelated to this patch,
      as the wic image being tested here does not use
      core-image-minimal-initramfs at all.<br>
      <br>
      Thanks,<br>
      Cal<br>
    </tt><br>
    <div class="moz-cite-prefix">On 02/06/2018 11:03 AM, Cal Sullivan
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:fa8e33cf-45a0-6348-8868-fcaca4e4ca47@intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <tt>Shortly after leaving work last night I realized that this
        error should have nothing to do with the initrd/initramfs, as
        this wic image is not using one.<br>
        <br>
        Also, in 300 runs of this test the error didn't occur once, so
        it appears to be very rare.<br>
        <br>
        ---<br>
        Cal<br>
      </tt><br>
      <div class="moz-cite-prefix">On 02/05/2018 05:52 PM, Cal Sullivan
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:fb16c035-aa39-a21f-5bd2-0ebda3dfe3bf@intel.com"> <br>
        <br>
        <div class="moz-cite-prefix">On 02/05/2018 04:47 PM, Khem Raj
          wrote:<br>
        </div>
        <blockquote type="cite"
cite="mid:CAMKF1sp=mb4fMEEu0mkPvvYZYRZXiwtjQ=who4RNVNhQv8=X+Q@mail.gmail.com">
          <div><br>
            <div class="gmail_quote">
              <div dir="auto">On Mon, Feb 5, 2018 at 4:15 PM Cal
                Sullivan &lt;<a
                  href="mailto:california.l.sullivan@intel.com"
                  moz-do-not-send="true">california.l.sullivan@intel.com</a>&gt;
                wrote:<br>
              </div>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                <div text="#000000" bgcolor="#FFFFFF"> <tt>Looking at
                    the test and the output, its expecting /dev/sda3 to
                    be mounted as /media and /dev/sda4 to be mounted as
                    /mnt. With this test result, there is no /media, and
                    instead /dev/sda3 is mounted to /mnt.<br>
                    <br>
                    That seems odd to me unless that partition either
                    wasn't created or went entirely undetected.<br>
                  </tt><br>
                  <tt><tt>I'll take a closer look, I think there's more
                      going on here.</tt></tt></div>
              </blockquote>
              <div dir="auto"><br>
              </div>
              <div dir="auto">Udev trigger sometimes get ignored have
                seem that in past <br>
              </div>
            </div>
          </div>
        </blockquote>
        Thanks for the info Khem! I think its an intermittent issue
        unrelated to this patch.<br>
        <br>
        I ran the following with my patch applied on top of master and
        only SANITY_TESTED_DISTROS changed in local.conf:<br>
        <br>
        MACHINE=qemux86-64 oe-selftest -r wic.Wic.test_qemu<br>
        <br>
        And it didn't fail.<br>
        <br>
        I'm going to run this test a few hundred times overnight without
        my patch and see if I can hit it.<br>
        <br>
        Thanks,<br>
        Cal<br>
        <br>
        <blockquote type="cite"
cite="mid:CAMKF1sp=mb4fMEEu0mkPvvYZYRZXiwtjQ=who4RNVNhQv8=X+Q@mail.gmail.com">
          <div>
            <div class="gmail_quote">
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                <div text="#000000" bgcolor="#FFFFFF"><tt><br>
                    <br>
                    ---<br>
                    Cal<br>
                  </tt></div>
                <div text="#000000" bgcolor="#FFFFFF"><br>
                  <div class="m_3545165834634221937moz-cite-prefix">On
                    02/05/2018 03:34 PM, Burton, Ross wrote:<br>
                  </div>
                  <blockquote type="cite">
                    <div>This is causing the qemu boot wic test to fail
                      in oe-selftest:<br>
                      <br>
                      2018-02-05 15:08:41,786 - oe-selftest - INFO -
                      FAIL [64.639s]: test_qemu (wic.Wic)<br>
                      2018-02-05 15:08:41,786 - oe-selftest - INFO -
                      ----------------------------------------------------------------------<br>
                      2018-02-05 15:08:41,786 - oe-selftest - INFO -
                      Traceback (most recent call last):<br>
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
                          self.assertEqual(output, '/dev/root
                      /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt')<br>
                      AssertionError: '/dev/root /\r\n/dev/sda1
                      /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt' !=
                      '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt'<br>
                        /dev/root /<br>
                        /dev/sda1 /boot<br>
                      - /dev/sda3 /media<br>
                      - /dev/sda4 /mnt?         ^<br>
                      + /dev/sda3 /mnt?         ^<br>
                      <br>
                      Presumably this is the initramfs mounting more
                      stuff automatically?  I don't have an opinion
                      right now as to whether this is a problem with the
                      initramfs or the test case being too strict...
                      <div><br>
                      </div>
                      <div>Ross<br>
                        <br>
                      </div>
                    </div>
                    <div class="gmail_extra"><br>
                      <div class="gmail_quote">On 1 February 2018 at
                        14:03, Burton, Ross <span>&lt;<a
                            href="mailto:ross.burton@intel.com"
                            target="_blank" moz-do-not-send="true">ross.burton@intel.com</a>&gt;</span>
                        wrote:<br>
                        <blockquote class="gmail_quote" style="margin:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex">
                          <div>Sorry, missed this.  I'll pull it into
                            MUT and throw it at the autobuilder...<span
                              class="m_3545165834634221937HOEnZb"><font
                                color="#888888">
                                <div><br>
                                </div>
                                <div>Ross</div>
                              </font></span></div>
                          <div class="m_3545165834634221937HOEnZb">
                            <div class="m_3545165834634221937h5">
                              <div class="gmail_extra"><br>
                                <div class="gmail_quote">On 31 January
                                  2018 at 22:53, Cal Sullivan <span>&lt;<a
href="mailto:california.l.sullivan@intel.com" target="_blank"
                                      moz-do-not-send="true">california.l.sullivan@intel.com</a>&gt;</span>
                                  wrote:<br>
                                  <blockquote class="gmail_quote"
                                    style="margin:0 0 0
                                    .8ex;border-left:1px #ccc
                                    solid;padding-left:1ex">Ping.<br>
                                    <br>
                                    ---<br>
                                    Cal
                                    <div
                                      class="m_3545165834634221937m_-9033303757896667203HOEnZb">
                                      <div
                                        class="m_3545165834634221937m_-9033303757896667203h5"><br>
                                        <br>
                                        On 01/09/2018 05:00 PM, Cal
                                        Sullivan wrote:<br>
                                        <blockquote class="gmail_quote"
                                          style="margin:0 0 0
                                          .8ex;border-left:1px #ccc
                                          solid;padding-left:1ex">
                                          Anything wrong with this?
                                          Haven't seen it hit any mut
                                          branches.<br>
                                          <br>
                                          Thanks,<br>
                                          Cal<br>
                                          <br>
                                          On 12/19/2017 02:12 PM,
                                          California Sullivan wrote:<br>
                                          <blockquote
                                            class="gmail_quote"
                                            style="margin:0 0 0
                                            .8ex;border-left:1px #ccc
                                            solid;padding-left:1ex">
                                            initramfs-framework is more
                                            modular and expandable. This
                                            change was<br>
                                            proposed in commit
                                            28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e<br>
"core-image-minimal-initramfs: use initramfs-framework by default" but<br>
                                            reverted due to the
                                            selftests
runqemu.RunqemuTests.test_boot_machine_iso<br>
                                            and
                                            runqemu.RunqemuTests.test_boot_deploy_hddimg
                                            failing. Since then,<br>
                                            the kinks have been worked
                                            out, and missing
                                            functionality that had been<br>
                                            missed (non-EFI installation
                                            module) has been added.<br>
                                            <br>
                                            Since the PACKAGE_INSTALL
                                            variable was getting so long
                                            with all these<br>
                                            individual modules getting
                                            added, I also introduced a
                                            new<br>
                                            INITRAMFS_SCRIPTS variable
                                            to the
                                            core-image-minimal-initramfs
                                            recipe.<br>
                                            This variable makes the
                                            recipe look much cleaner,
                                            and also allows easier<br>
                                            replacement or additions to
                                            the scripts.<br>
                                            <br>
                                            Fixes [YOCTO #10987].<br>
                                            <br>
                                            Signed-off-by: California
                                            Sullivan &lt;<a
                                              href="mailto:california.l.sullivan@intel.com"
                                              target="_blank"
                                              moz-do-not-send="true">california.l.sullivan@intel.com</a>&gt;<br>
                                            ---<br>
                                              meta/recipes-core/images/<a
href="http://core-image-minimal-initramfs.bb" rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">core-image-minimal-initramfs.bb</a>
                                            | 10 +++++++++-<br>
                                              1 file changed, 9
                                            insertions(+), 1 deletion(-)<br>
                                            <br>
                                            diff --git
                                            a/meta/recipes-core/images/<a
href="http://core-image-minimal-initramfs.bb" rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">core-image-minimal-initramfs.bb</a>
                                            b/meta/recipes-core/images/<a
href="http://core-image-minimal-initramfs.bb" rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">core-image-minimal-initramfs.bb</a><br>
                                            index
                                            5794a25952a..a9ba91bd310
                                            100644<br>
                                            ---
                                            a/meta/recipes-core/images/<a
href="http://core-image-minimal-initramfs.bb" rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">core-image-minimal-initramfs.bb</a><br>
                                            +++
                                            b/meta/recipes-core/images/<a
href="http://core-image-minimal-initramfs.bb" rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">core-image-minimal-initramfs.bb</a><br>
                                            @@ -3,7 +3,15 @@ DESCRIPTION
                                            = "Small image capable of
                                            booting a device. The kernel
                                            includes \<br>
                                              the Minimal RAM-based
                                            Initial Root Filesystem
                                            (initramfs), which finds the
                                            \<br>
                                              first 'init' program more
                                            efficiently."<br>
                                              -PACKAGE_INSTALL =
                                            "initramfs-live-boot
                                            initramfs-live-install
                                            initramfs-live-install-efi
                                            ${VIRTUAL-RUNTIME_base-utils}
                                            udev base-passwd
                                            ${ROOTFS_BOOTSTRAP_INSTALL}"<br>
                                            +INITRAMFS_SCRIPTS ?= "\<br>
                                            +                     
                                            initramfs-framework-base \<br>
                                            +                     
                                            initramfs-module-setup-live
                                            \<br>
                                            +                     
                                            initramfs-module-udev \<br>
                                            +                     
                                            initramfs-module-install \<br>
                                            +                     
                                            initramfs-module-install-efi
                                            \<br>
                                            +                     "<br>
                                            +<br>
                                            +PACKAGE_INSTALL =
                                            "${INITRAMFS_SCRIPTS}
                                            ${VIRTUAL-RUNTIME_base-utils}
                                            udev base-passwd
                                            ${ROOTFS_BOOTSTRAP_INSTALL}"<br>
                                                # Do not pollute the
                                            initrd image with rootfs
                                            features<br>
                                              IMAGE_FEATURES = ""<br>
                                          </blockquote>
                                          <br>
                                        </blockquote>
                                        <br>
                                        -- <br>
_______________________________________________<br>
                                        Openembedded-core mailing list<br>
                                        <a
                                          href="mailto:Openembedded-core@lists.openembedded.org"
                                          target="_blank"
                                          moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
                                        <a
                                          href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                                          rel="noreferrer"
                                          target="_blank"
                                          moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
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
                </div>
                --<br>
                _______________________________________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
              </blockquote>
            </div>
          </div>
        </blockquote>
        <br>
      </blockquote>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------DA4D9D5AE415808778B0B0F9--
