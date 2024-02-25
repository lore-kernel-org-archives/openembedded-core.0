Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0727C47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:03 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.7422.1708897979127236273
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=K3XupCaB;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.52, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5a089f333bdso190289eaf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897978; x=1709502778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/iKAr4sfrB6ypzBwYtQaU3r36vLxySQiOGRQQvlUAI=;
        b=K3XupCaBvA80qfIu23GceLiBvba8PuAx9LWZe3jK5GN6K5lWyspBOSHIXEpSaerFSf
         IclJDn45YCW2bVBm0/CN0HkvlIEtP3INCTpHpqqfCncj5iHDpovXnag22+hRHz1c/IZh
         a0J73ivOyHky+A2uYtGopilK/XhOPgu7+yOnXnvs/BHjFG2BVk70laFlTjOTBQnPN6U2
         MjziDKOqvKulpRnvdU/xBtbK9L4KL4+Mb5uHfCRnxvp7w8jT5rEyWW38RKgyVNYyjoFJ
         DrcyRsBzDFrLwa+nZRibc3Ywo4O/p4voA1/Rhz4OyUHJzmRdEQuUmkrhdP4X8T+cz+Nv
         x1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897978; x=1709502778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/iKAr4sfrB6ypzBwYtQaU3r36vLxySQiOGRQQvlUAI=;
        b=FwmYPkg0Oxup/nRBnPqGDwRNkAT8mlcDRw5rYKHZljarKYP3XR6ePqAV+l1TmV6DMl
         rMl1Kdu2KbdMJjUc0WpojUD7zNPSwrtd4ep2n1OVkV/vgBgTKPMMGsvNHrEJ8IV0cW3Y
         OZXr0dcI6jGXHHIhPCp0GRQNOtvudCPwAbdqQk0imGoM8Hh0steAyBCXgeN7mL7fah58
         msqUtvVSpX2Bu1hsYoYfky8NcSJ+yE4fAs5tVaweGD9yJ6EIJLUIyEUiZ0Xwck69fz9y
         dszKsOpLGJpzjJ1/fN0U1Rfzw3WL6AGTN65Cqc9QTdj/fYUKSKpUB255e3I5HLgeRPOV
         qJ1Q==
X-Gm-Message-State: AOJu0Yy9xpbYXzzvwtqXKGj3ZwSuWMQgzjK5f/7uRv5zwEbMQHjNHBZA
	OO90YzLCS4ujTzhNWKCt4afg5v++xU5A+jitrFP3J9KDOUORJbtMLzZfjNInIfg5V/jFjl3c9bG
	d/Ne+pQ==
X-Google-Smtp-Source: AGHT+IGVgcBamd/g5g2OJzaVjn146Mxu4pgo2FgVTFtEC7keQYGIPTwHgUuhXByfGfzwqslR/R4obw==
X-Received: by 2002:a05:6359:458d:b0:176:d46c:e704 with SMTP id no13-20020a056359458d00b00176d46ce704mr6707424rwb.16.1708897977993;
        Sun, 25 Feb 2024 13:52:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.52.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:52:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/22] linux-yocto/5.10: update to v5.10.203
Date: Sun, 25 Feb 2024 11:52:23 -1000
Message-Id: <501af4c5f91746f934083178efdb1a59ff82ff51.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196156

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d330ef1d295d Linux 5.10.203
    9c957e2b5254 driver core: Release all resources during unbind before updating device links
    2325d3b6b10f r8169: fix deadlock on RTL8125 in jumbo mtu mode
    b29e6055db1e r8169: disable ASPM in case of tx timeout
    8b76708eb9f1 mmc: sdhci-sprd: Fix vqmmc not shutting down after the card was pulled
    b532bc9b73e6 mmc: core: add helpers mmc_regulator_enable/disable_vqmmc
    376fabe3677a mmc: block: Retry commands in CQE error recovery
    bf62a283a779 mmc: core: convert comma to semicolon
    bb785011843e mmc: cqhci: Fix task clearing in CQE error recovery
    cb9ca7cc273b mmc: cqhci: Warn of halt or task clear failure
    e94ededefc42 mmc: cqhci: Increase recovery halt timeout
    2011f06e32ab cpufreq: imx6q: Don't disable 792 Mhz OPP unnecessarily
    6b35f36ff8f0 cpufreq: imx6q: don't warn for disabling a non-existing frequency
    910566a789a2 scsi: qla2xxx: Fix system crash due to bad pointer access
    46a4bf13502f scsi: qla2xxx: Use scsi_cmd_to_rq() instead of scsi_cmnd.request
    b19fe82b4b92 scsi: core: Introduce the scsi_cmd_to_rq() function
    c2b6f7e48e38 smb3: fix caching of ctime on setxattr
    f9aa2857c6e6 fs: add ctime accessors infrastructure
    8d4237a149e3 drm/amdgpu: don't use ATRM for external devices
    2df04d76c97d driver core: Move the "removable" attribute from USB to core
    01fbfcd8105c ima: annotate iint mutex to avoid lockdep false positive warnings
    8a3322a35f74 fbdev: stifb: Make the STI next font pointer a 32-bit signed offset
    15bc430fc176 misc: pci_endpoint_test: Add deviceID for J721S2 PCIe EP device support
    a6128ad78771 misc: pci_endpoint_test: Add deviceID for AM64 and J7200
    c922282d11b3 s390/cmma: fix detection of DAT pages
    03e07092c6ce s390/mm: fix phys vs virt confusion in mark_kernel_pXd() functions family
    cb420e35571c ASoC: SOF: sof-pci-dev: Fix community key quirk detection
    b37e1fbe6d30 ASoC: SOF: sof-pci-dev: don't use the community key on APL Chromebooks
    3a79fcb743f7 ASoC: SOF: sof-pci-dev: add parameter to override topology filename
    4aeb3320d70e ASoC: SOF: sof-pci-dev: use community key on all Up boards
    6368a32d26a3 ASoC: Intel: Move soc_intel_is_foo() helpers to a generic header
    8e52b19d92e1 smb3: fix touch -h of symlink
    889c84e2b200 net: ravb: Start TX queues after HW initialization succeeded
    5d428cda38e8 net: ravb: Use pm_runtime_resume_and_get()
    f78d0f301395 ravb: Fix races between ravb_tx_timeout_work() and net related ops
    a36e00e957a2 r8169: prevent potential deadlock in rtl8169_close
    8a909c119827 Revert "workqueue: remove unused cancel_work()"
    72ce3379cd5e octeontx2-pf: Fix adding mbox work queue entry when num_vfs > 64
    ef7af2105a25 net: stmmac: xgmac: Disable FPE MMC interrupts
    f18bcace1294 selftests/net: mptcp: fix uninitialized variable warnings
    cb1644f9f005 selftests/net: ipsec: fix constant out of range
    fe7fd9c209e8 dpaa2-eth: increase the needed headroom to account for alignment
    772fe1da9a8d ipv4: igmp: fix refcnt uaf issue when receiving igmp query packet
    9ef94ec8e52e usb: config: fix iteration issue in 'usb_get_bos_descriptor()'
    713530d3c8f1 USB: core: Change configuration warnings to notices
    ae6e41066e6e hv_netvsc: fix race of netvsc and VF register_netdevice
    4937fb36bbb8 Input: xpad - add HyperX Clutch Gladiate Support
    5c4d5c8556ee btrfs: make error messages more clear when getting a chunk map
    74ff16c84433 btrfs: send: ensure send_fd is writable
    12a0ec5ed7cf btrfs: fix off-by-one when checking chunk map includes logical address
    baaab02a8c0b btrfs: ref-verify: fix memory leaks in btrfs_ref_tree_mod()
    2d6c2238acf8 btrfs: add dmesg output for first mount and last unmount of a filesystem
    bab9cec493b6 parisc: Drop the HP-UX ENOSYM and EREMOTERELEASE error codes
    b53dc7c766ae powerpc: Don't clobber f0/vs0 during fp|altivec register save
    b5cbbc2b2da9 iommu/vt-d: Add MTL to quirk list to skip TE disabling
    f62ceb880a71 bcache: revert replacing IS_ERR_OR_NULL with IS_ERR
    18ac427906af dm verity: don't perform FEC for failed readahead IO
    c3c9f9273822 dm-verity: align struct dm_verity_fec_io properly
    5de40a7ffaa0 ALSA: hda/realtek: Add supported ALC257 for ChromeOS
    cf80c538061e ALSA: hda/realtek: Headset Mic VREF to 100%
    f338f738d7bd ALSA: hda: Disable power-save on KONTRON SinglePC
    b02b66194d54 mmc: block: Do not lose cache flush during CQE error recovery
    71c9fb31e18b firewire: core: fix possible memory leak in create_units()
    d6bac7048f28 pinctrl: avoid reload of p state in list iteration
    8fb79be6e980 io_uring: fix off-by one bvec index
    f5f85ea5bb6a USB: dwc3: qcom: fix wakeup after probe deferral
    5ac96667ea32 usb: dwc3: set the dma max_seg_size
    2620c5977f49 usb: dwc3: Fix default mode initialization
    d5325ed6eb7c USB: dwc2: write HCINT with INTMASK applied
    5d7a5e63dc3b USB: serial: option: don't claim interface 4 for ZTE MF290
    f1432dff5dd6 USB: serial: option: fix FM101R-GL defines
    14a6e089d610 USB: serial: option: add Fibocom L7xx modules
    f49ad460a2c8 bcache: fixup lock c->root error
    be327b8f76c2 bcache: fixup init dirty data errors
    3ebf83df623a bcache: prevent potential division by zero error
    e74c2e6fecb7 bcache: check return value from btree_node_alloc_replacement()
    c73dd8f4b476 dm-delay: fix a race between delay_presuspend and delay_bio
    a70b6da7c640 hv_netvsc: Mark VF as slave before exposing it to user-mode
    ff6c130e48a7 hv_netvsc: Fix race of register_netdevice_notifier and VF register
    518ef825016d USB: serial: option: add Luat Air72*U series products
    c841de6247e9 s390/dasd: protect device queue against concurrent access
    89f9ba7ee702 bcache: fixup multi-threaded bch_sectors_dirty_init() wake-up race
    cd7a0695906d bcache: replace a mistaken IS_ERR() by IS_ERR_OR_NULL() in btree_gc_coalesce()
    be8af3b6c80d swiotlb-xen: provide the "max_mapping_size" method
    8c4b5cc90843 ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CVA
    0f312dc1eb2f ASoC: simple-card: fixup asoc_simple_probe() error handling
    fcc60c0a1870 nfsd: lock_rename() needs both directories to live on the same fs
    ec75d1d0cd2c ext4: make sure allocate pending entry not fail
    10341e77e49f ext4: fix slab-use-after-free in ext4_es_insert_extent()
    5527898c6a9f ext4: using nofail preallocation in ext4_es_insert_extent()
    2ae2be6e7cd7 ext4: using nofail preallocation in ext4_es_insert_delayed_block()
    aa6568033cfb ext4: using nofail preallocation in ext4_es_remove_extent()
    608758ef8670 ext4: use pre-allocated es in __es_remove_extent()
    fcb07d8ea363 ext4: use pre-allocated es in __es_insert_extent()
    0cc7653887b0 ext4: factor out __es_alloc_extent() and __es_free_extent()
    8234c1c690a3 ext4: add a new helper to check if es must be kept
    62526a55fee7 MIPS: KVM: Fix a build warning about variable set but not used
    3b2e8b30b0d7 media: ccs: Correctly initialise try compose rectangle
    1301467cbe4c lockdep: Fix block chain corruption
    cbfa5aadd650 USB: dwc3: qcom: fix ACPI platform device leak
    68fe711312f1 USB: dwc3: qcom: fix resource leaks on probe deferral
    2be451e7a2f1 nvmet: nul-terminate the NQNs passed in the connect command
    86a7f67d7605 nvmet: remove unnecessary ctrl parameter
    d24a18cb51bf afs: Fix file locking on R/O volumes to operate in local mode
    6e48c3175d0b afs: Return ENOENT if no cell DNS record can be found
    497e9b0b21a6 net: axienet: Fix check for partial TX checksum
    8fb804dabdda amd-xgbe: propagate the correct speed and duplex status
    b7c9e8c038f5 amd-xgbe: handle the corner-case during tx completion
    a2e868ad07eb amd-xgbe: handle corner-case during sfp hotplug
    ebc7fbd15a64 arm/xen: fix xen_vcpu_info allocation alignment
    5ada292b5c50 net/smc: avoid data corruption caused by decline
    3ae55e3a3734 net: usb: ax88179_178a: fix failed operations during ax88179_reset
    27914bff9602 ipv4: Correct/silence an endian warning in __ip_do_redirect
    f8467afa754d HID: fix HID device resource race between HID core and debugging support
    2f0ea5e0944a HID: core: store the unique system identifier in hid_device
    650e43dfe7d2 drm/rockchip: vop: Fix color for RGB888/BGR888 format on VOP full
    cc3b63c089e7 ata: pata_isapnp: Add missing error check for devm_ioport_map()
    9942c1948346 wireguard: use DEV_STATS_INC()
    939352ad6502 drm/panel: simple: Fix Innolux G101ICE-L01 timings
    a5e82e345f4a drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
    60660af9577a drm/panel: auo,b101uan08.3: Fine tune the panel power sequence
    2c688ae2dd78 drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence
    3b797242d178 afs: Make error on cell lookup failure consistent with OpenAFS
    dbc1929a5214 afs: Fix afs_server_list to be cleaned up with RCU
    c3bead2f8fca PCI: keystone: Drop __init from ks_pcie_add_pcie_{ep,port}()
    ac65f8979b0e RDMA/irdma: Prevent zero-length STAG registration

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index ce882123f2..afee028bca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4c84fd48919bf3fa759cd02947899e90b5f13be1"
-SRCREV_meta ?= "0ac177cb2df1cff8799d72b9224ed69423a22eef"
+SRCREV_machine ?= "dae7d2a31e1d51235fd140f8996f824d24bde30d"
+SRCREV_meta ?= "24626abfda4a68c8208d7f35073bd3b88ed5ec21"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.202"
+LINUX_VERSION ?= "5.10.203"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 267b2bcad1..8acca49a26 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.202"
+LINUX_VERSION ?= "5.10.203"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "b010aecb876ae2adf4548989459cc4878035d1ad"
-SRCREV_machine ?= "69bfe10cd8d98c45a361d2efdddfc1bb940f5601"
-SRCREV_meta ?= "0ac177cb2df1cff8799d72b9224ed69423a22eef"
+SRCREV_machine:qemuarm ?= "acb5e9943bafc31efab317b65f953495ed1f8c5a"
+SRCREV_machine ?= "bd5abfdd442e76bd9995f33715900b93a453f314"
+SRCREV_meta ?= "24626abfda4a68c8208d7f35073bd3b88ed5ec21"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index a057dd54de..bcc64d1b8e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "cf28b49bd6d196edf71e532b95675b683f24adca"
-SRCREV_machine:qemuarm64 ?= "255936309d9ae21a5b5b76bbf4c4392b997eafdf"
-SRCREV_machine:qemumips ?= "fa8423d3d00a45d8ee4b64684fd2111d10e48b67"
-SRCREV_machine:qemuppc ?= "3c348c832ffb927a3f580e40d8190f385dfdce12"
-SRCREV_machine:qemuriscv64 ?= "d05c0de69c0091d4ec418a225cfd942bd666630c"
-SRCREV_machine:qemuriscv32 ?= "d05c0de69c0091d4ec418a225cfd942bd666630c"
-SRCREV_machine:qemux86 ?= "d05c0de69c0091d4ec418a225cfd942bd666630c"
-SRCREV_machine:qemux86-64 ?= "d05c0de69c0091d4ec418a225cfd942bd666630c"
-SRCREV_machine:qemumips64 ?= "d38df4bfa230e568606fda66ec7ae697ed41e9ca"
-SRCREV_machine ?= "d05c0de69c0091d4ec418a225cfd942bd666630c"
-SRCREV_meta ?= "0ac177cb2df1cff8799d72b9224ed69423a22eef"
+SRCREV_machine:qemuarm ?= "39cae61353af17de2545a90364671d4f26517a55"
+SRCREV_machine:qemuarm64 ?= "96080ff8f5a71453314726aff5f9b0c30c688221"
+SRCREV_machine:qemumips ?= "72edcadbefefb3d83416bf6c400fe993189c8557"
+SRCREV_machine:qemuppc ?= "b0f6660e4016dbe1611a6872f30302b90ea02b37"
+SRCREV_machine:qemuriscv64 ?= "3db1f94e858583a60fa3a69bea58637d2466b1f0"
+SRCREV_machine:qemuriscv32 ?= "3db1f94e858583a60fa3a69bea58637d2466b1f0"
+SRCREV_machine:qemux86 ?= "3db1f94e858583a60fa3a69bea58637d2466b1f0"
+SRCREV_machine:qemux86-64 ?= "3db1f94e858583a60fa3a69bea58637d2466b1f0"
+SRCREV_machine:qemumips64 ?= "7bee374027681d303214f33f6461fe7dca6b13fc"
+SRCREV_machine ?= "3db1f94e858583a60fa3a69bea58637d2466b1f0"
+SRCREV_meta ?= "24626abfda4a68c8208d7f35073bd3b88ed5ec21"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.202"
+LINUX_VERSION ?= "5.10.203"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


