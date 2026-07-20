Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1E7C44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:58:51 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.825.1784563130035284931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 08:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mlH63wGk;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51bfe810293so53447081cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563129; x=1785167929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PL2jkZa46iHIEDG5/fTguG8XAonFda9UsNlyopxWnVE=;
        b=mlH63wGkYExFj64oL9WRSxLj3T5YMd7Ozx9zb+LMkle61wEvrRUHM6l2wu/s4fORhe
         AK54g2mHCYobCIUbUFXSKL9Fz/iEsMwUGTyfXkxg5FeniQq4jP6p6xrdCpCIfHgTx32T
         zsNk/sSzOKvylAV32RfuSmeuyN/jZRKbQUCKPM1r6ncbj4shnKaEN4QIsS+K4YgiIKpx
         5XRMwnfVlog6gxbHuCMmtIpF6TejSxbJsSrbkLJcyfIrEMOh0kCcPDfLSsheb7Amkru3
         O7RuLBSzquaiPhVsZTsKIDQhq+GYq8/My2L6npo4eGlAKUjTYbywkMWew80/s41NhyBI
         MObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563129; x=1785167929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PL2jkZa46iHIEDG5/fTguG8XAonFda9UsNlyopxWnVE=;
        b=NIXPz1KO6pfdp1gCPiEAQmSIsYht5hRKaYGiEWTXI2w0uSe5FbWPefv8EORqKJhCRG
         93ds+eWqr8a+GzcLRgvpAQaj3ExcuKCQvf659GVOkijOufT2B1QeXGHWHBCSFm0ZypPc
         6YQ8VKy9JJ4Kvz2le0LfsYB8puP5drAxWC496uc5v+SgDylC+WeqflFBLwB0bDqSL8fK
         xFrQc2znYCaRazu1HS/52mtMTRplaef/kse3VPbiH1LBi2mPNFsdlFQCzMuOY2/w2Y8a
         sI4k5ictUCPfvSeQjDBKL8y+ZXWezxQtSNkh1EhaJ9azhejttsF9U/f3yOgW1pE+ZElJ
         MGuw==
X-Gm-Message-State: AOJu0YxSVOj7CNPnEAmK/1rwGdb5reB1AZ8ESA3jAPNVb+r6ZOZaDRNp
	HooMnvbciKUd9crbRYEHRGLqSimO4A3pE72NRfKKfcBfioJzLeaaOleTVZHdHvW0
X-Gm-Gg: AfdE7ckY0wHMPnKA2F2BkB/oYqWh1jSUNcb+2sZ3IBN7E4rAgVK3/6ns4ruCuUXfPPV
	xXfGYqZO/biRIqn3OsPoKHI9PWIVR6GLeHhT4U02LOLhPYT796n9jZsVm9IfndWr2jiIVkwWwb9
	WDsB2i3FwgYBUBmbvWYVpphrDAIPp1JXZYfL+p8kqUL0UXYhrlusd1MmFqjJdih9Sk2/QgxH091
	3vC3pfnIYtfamaquMIpcL9u4ef8EgzwTxdDSXXw4hczbFnvgHFq0jVnWeZGZmo3Zrkql2gYUwzU
	1kM3nk61AKOyNYfdEyDFv+mnVwuOp4s9N33Iu7FJECjVtjkkOgmBgzPIRAv84ADhRZt3VyGfR+M
	KW+20KMw7V1o0UV2gRIeZVzg2xXy6h53HUyWJnu7ZpOMDkMruKyQvRU90FEZAQJ9iVZhyFykcU7
	25+haNZXPJ9fiHwixz6QfnUt38QcEOeHkAPBz8BapWiEINym0lrNAuCS2Ut+BT6CsXHWFqslR1u
	sufcaKKX0g86U9dMx0DMeI/r6fzR3ErH87yY/HfEk3dVWW4YiV8Gm1UM8r8l+AmzqrNa22ibnHO
	hoohm0f45FdSPdErl0gUZjzf5fczA3EHYw==
X-Received: by 2002:a05:622a:4d43:b0:51c:478:3299 with SMTP id d75a77b69052e-5213aa6cc4amr137377681cf.9.1784563128420;
        Mon, 20 Jul 2026 08:58:48 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214f0162a7sm75504971cf.15.2026.07.20.08.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:58:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/06] linux-yocto/6.18: update to v6.18.39
Date: Mon, 20 Jul 2026 11:58:38 -0400
Message-ID: <20260720155842.569263-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720155842.569263-1-bruce.ashfield@gmail.com>
References: <20260720155842.569263-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 15:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241419

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    f89c296854b75 Linux 6.18.39
    06b1729436efc xfs: use rtrefcount btree cursor in xchk_xref_is_rt_cow_staging
    457a93a233bd7 xfs: write the rg superblock when fixing it
    e696ef088f557 xfs: fix off-by-one error when calling xchk_xref_has_rt_owner
    6403ef9a81e6c xfs: don't zap bmbt forks if they are MAXLEVELS tall
    1ea0868a477b7 xfs: fully check the parent handle when it points to the rootdir
    c9662ffd62c4e xfs: clamp timestamp nanoseconds correctly
    424be21ed8cd4 xfs: handle non-inode owners for rtrmap record checking
    d399b026a6b34 xfs: set xfarray killable sort correctly
    08b191ae64659 xfs: use the rt version of the cow staging checker
    104584477883b xfs: grab rtrmap btree when checking rgsuper
    d1c4c40599c37 xfs: don't wrap around quota ids in dqiterate
    206c09b04dc54 xfs: resample the data fork mapping after cycling ILOCK
    d98f22d2e11e0 xfs: fail recovery on a committed log item with no regions
    dca861f2cc9e6 xfs: fix null pointer dereference in tracepoint
    fdafa1e68dc75 smb: client: reject overlapping data areas in SMB2 responses
    1991d49433e90 Revert "f2fs: remove non-uptodate folio from the page cache in move_data_block"
    1c56c46519353 Bluetooth: 6lowpan: Fix using chan->conn as indication to no remote netdev
    e697df336662b timekeeping: Register default clocksource before taking tk_core.lock
    9e04055ab5fc0 usb: gadget: f_fs: Initialize epfile->in early to fix endpoint direction checks
    75e1d2787005d sched/fair: Only update stats for allowed CPUs when looking for dst group
    0b466cf1b96e1 fuse-uring: remove request-less entries from ent_w_req_queue to fix NULL deref
    e1711479e9068 fuse-uring: make a fuse_req on SQE commit only findable after memcpy
    39c8e925b207a fuse-uring: Avoid queue->stopped races and set/read that value under lock
    23a356e0bd96c fuse-uring: Avoid use-after-free in fuse_uring_async_stop_queues
    bb476ef8e1027 fuse-uring: end fuse_req on io-uring cancel task work
    50f3e03db823c fuse-uring: fix moving cancelled entry to ent_in_userspace list
    b156bb9966972 fuse-uring: fix data races on ring->ready
    0483fffdeeb36 fuse-uring: fix EFAULT clobber in fuse_uring_commit
    7366e6f4d2b4c fuse: clear intr_entry in fuse_resend and fuse_remove_pending_req
    096cb2e58a6db fuse: fix io-uring background queue dispatch on request completion
    be353caffa864 fuse: re-lock request before returning from fuse_ref_folio()
    e6620208bdd34 fuse: fix device node leak in cuse_process_init_reply()
    6e2d84fdeac05 fuse: avoid 32-bit prune notification count wrap
    69cfae58b9a32 fuse: back uncached readdir buffers with pages
    423a78ff7928c RDMA/siw: bound Read Response placement to the RREAD length
    ab45808c141a3 RDMA/core: Fix broadcast address falsely detected as local
    5a45d0aa1fa50 RDMA/rtrs-srv: Bound RDMA-Write length to chunk size in rdma_write_sg
    95de76f6ad474 Input: maplecontrol - set driver data before registering input device
    9376c744bea2c Input: maplemouse - set driver data before registering input device
    699e3abac02de Input: maple_keyb - set driver data before registering input device
    d7f66fbab5d21 Input: mms114 - fix multi-touch slot corruption
    1b4cb75f254fb Input: maplemouse - fix NULL pointer dereference in open()
    37fbe63bccf21 Input: gscps2 - advance receive buffer write index
    8301c33530534 Input: mms114 - reject an oversized device packet size
    3e6f007b43e2f Input: touchwin - reset the packet index on every complete packet
    05dee4007cf30 Input: ads7846 - don't use scratch for tx_buf when clearing register
    75b12874b4172 Input: mms114 - fix touch indexing for MMS134S and MMS136
    70019779325f2 Input: iforce - bound the device-reported force-feedback effect index
    3b32303460155 Input: goodix - clamp the device-reported contact count
    01e0317c256c5 Input: elan_i2c - prevent division by zero and arithmetic underflow
    e849c6f51e687 Input: synaptics-rmi4 - bound the F30 keymap to the GPIO/LED count
    8db211aed8373 Input: synaptics-rmi4 - bound the F3A keymap to the GPIO count
    11f275f01c46b Input: synaptics-rmi4 - unregister function handlers on physical driver registration failure
    bb5133a7d5f3f i2c: i801: fix hardware state machine corruption in error path
    b2523f26979e0 i2c: imx-lpi2c: mark I2C adapter when hardware is powered down
    369635fbcf7f3 i2c: stm32f7: truncate clock period instead of rounding it
    b65667ec5e9a9 i2c: davinci: Unregister cpufreq notifier on probe failure
    56945871123e2 i2c: mpc: Fix timeout calculations
    b6d2af6fe9c1f i2c: core: fix adapter deregistration race
    71b7da959031f i2c: core: fix adapter debugfs creation
    0345994d64761 i2c: core: fix adapter probe deferral loop
    3351c5e77749a i2c: core: fix NULL-deref on adapter registration failure
    9ec02cc9a04e5 i2c: core: fix irq domain leak on adapter registration failure
    59070040fd12e fpga: dfl-afu: validate DMA mapping length in afu_dma_map_region()
    34696563461c9 dma-buf/udmabuf: skip redundant cpu sync to fix cacheline EEXIST warning
    f8e1dc70efe48 udmabuf: fix DMA direction mismatch in release_udmabuf()
    0c93681aea0a1 KVM: arm64: Don't leak PFN when kvm_translate_vncr() races MMU notifier
    4ad73ef0e7966 KVM: x86: Ensure vendor's exit handler runs before fastpath userspace exits
    ab253cf6e1118 KVM: VMX: Handle bad values on proxied writes to LBR MSRs
    eeb456eb35565 KVM: VMX: Refresh GUEST_PENDING_DBG_EXCEPTIONS.BS on all injected #DBs
    35f3ea7e49a37 KVM: SVM: Only disable x2AVIC WRMSR interception for MSRs that are accelerated
    7949aa38e1094 KVM: SVM: Disable x2AVIC RDMSR interception for MSRs KVM actually supports
    4b200e0c9c339 KVM: x86: Add dedicated API for getting mask of accelerated x2APIC MSRs
    6bea2f8becdb2 KVM: arm64: Clear __hyp_running_vcpu when flushing the pKVM hyp vCPU
    2d710d4fcd2cd LoongArch: KVM: Add missing slots_lock for device register/unregister
    7c73a269a880b KVM: arm64: nv: Avoid dereferencing NULL VNCR pseudo-TLB
    b51a7439c166a selftests/landlock: Filter dealloc records in audit_count_records()
    859fef2c3d40a landlock: Set audit_net.sk for socket access checks
    e4427c19554b5 audit: fix removal of dangling executable rules
    32ca4aed2a662 iommufd: Set upper bounds on cache invalidation entry_num and entry_len
    67daea4c09351 iommufd: Avoid partial fault group delivery in iommufd_fault_fops_read()
    5539da127d03c iommufd: Break the loop on failure in iommufd_fault_fops_read()
    f2dbe1dba01e6 iommufd: Reject invalid read count in iommufd_fault_fops_read()
    f549a749b6255 iommufd: Reject invalid read count in iommufd_veventq_fops_read()
    64011399d8819 iommufd: Rewind header length in done if iommufd_veventq_fops_read() fails
    f565297edf316 iommufd: Set veventq_depth upper bound
    5c5f1b5184f7d iommufd: Fix data_len byte-count vs element-count mismatch
    04a177f91160e iommufd: Use sizeof(*hdr) instead of sizeof(hdr) in veventq read
    50612ce318b1c iommu/amd: Don't split flush for amd_iommu_domain_flush_all()
    bb354384f40bb iommu/vt-d: Avoid WARNING in sva unbind path
    037ec8353711c crypto: loongson - Remove broken and unused loongson-rng
    6bbe2000d9f9f selftests/mm: pagemap_ioctl: use the correct page size for transact_test()
    5c942ad7df759 mm: do file ownership checks with the proper mount idmap
    8dcaa0f87a88d mm: page_ext: add count limit to page_ext_iter_next to prevent invalid PFN access
    785ebd42b8b50 selftests: mm: fix and speedup "droppable" test
    279c2fa731122 mm: fix mmap errno value when MAP_DROPPABLE is not supported
    4d730cab96e6b riscv: mm: Unconditionally sfence.vma for spurious fault
    90405c8822c5d riscv: mm: Define DIRECT_MAP_PHYSMEM_END
    1c8889e0db01f NTB: epf: Fix request_irq() unwind in ntb_epf_init_isr()
    33c0b96d7e167 exfat: bound uniname advance in exfat_find_dir_entry()
    a82e170637e05 module: decompress: check return value of module_extend_max_pages()
    b883733302508 rqspinlock: Fix order in raw_res_spin_(un)lock_irq to allow schedule
    a937e92c1d005 NFSv4: include MAY_WRITE in open permission mask for O_TRUNC
    75ca99875aa4e audit: fix potential integer overflow in audit_log_n_hex()
    2dad64a97e1df tracing: Prevent out-of-bounds read in glob matching
    c8b7e113f7b61 perf/aux: Fix page UAF in map_range()
    af6048e913052 i2c: core: fix hang on adapter registration failure
    22cb337370e65 regulator: scmi: fix of_node refcount leak in scmi_regulator_probe()
    6b01ed165d298 watchdog: apple: Add "apple,t8103-wdt" compatible
    f4dd5621a6eef EDAC/i10nm: Don't fail probing if ADXL is missing
    add1e4112e00b x86/mm: Fix freeing of PMD-sized vmemmap pages
    808033d80d5c9 spi: fsl-lpspi: terminate the RX channel on TX prepare failure path
    18d6048b1b1b4 spi: fsl-lpspi: replace dmaengine_terminate_all() with dmaengine_terminate_sync()
    75422f5e50222 arm64: fpsimd: Fix type mismatch in sme_{save,load}_state()
    93f000e89976e crypto: talitos/hash - fix SEC2 64k - 1 ahash request limitation
    fda9cb9b7191c crypto: talitos/hash - remove useless wrapper
    99cc3f5511d8b crypto: talitos/hash - rename first_desc/last_desc to first_request/last_request
    b960edc92c81b crypto: talitos/hash - drop workqueue mechanism for SEC1
    042730207a991 crypto: talitos/hash - use descriptor chaining for SEC1 instead of workqueue
    40a2e90acdb1a crypto: talitos/hash - prepare SEC1 descriptor chaining, remove additional descriptor
    a8decb89920a1 crypto: talitos - move code in current_desc_hdr() into a standalone function
    aea8cfbd60da9 crypto: talitos - move dma mapping code in talitos_submit() into a standalone dma_map_request() function
    3fa1846f75edf crypto: talitos - move dma unmapping code in flush_channel() into a standalone dma_unmap_request() function
    664e7f16e74fc crypto: talitos - add chaining of arbitrary number of descriptor for the SEC1
    f52aa95e3cae1 crypto: talitos - use dma_sync_single_for_cpu() before reading descriptor header
    7584c92f72447 crypto: qat - factor out AER reset helpers
    6fb62b767f3e2 crypto: qat - validate RSA CRT component lengths
    fabf364ef9db5 crypto: qat - skip restart for down devices
    c3c5925791cff crypto: qat - protect service table iterations with service_lock
    e310e8dc8ce72 crypto: qat - notify fatal error before AER reset preparation
    45b65a21edbe0 crypto: qat - keep VFs enabled during reset
    33cfc0ce28ac9 crypto: qat - handle sysfs-triggered reset callbacks
    050bded706ee5 crypto: qat - centralize bus master enable
    5337b5cd3608a crypto: drbg - Fix the fips_enabled priority boost
    53d38b93cadc0 crypto: drbg - Fix drbg_max_addtl() on 64-bit kernels
    23b8b188cb32e crypto: drbg - Fix returning success on failure in CTR_DRBG
    441ea32cf2755 crypto: ccp - Do not initialize SNP for ioctl(SNP_CONFIG)
    92567ed9306d5 crypto: ccp - Do not initialize SNP for ioctl(SNP_VLEK_LOAD)
    7a361c74bb12f crypto: ccp - Do not initialize SNP for ioctl(SNP_COMMIT)
    9e983d0a74a6a crypto: ccp - Do not initialize SNP for SEV ioctls
    53b8fb85f332b crypto: loongson - Select CRYPTO_RNG
    cc4e42b3ee9fc crypto: tegra - fix refcount leak in tegra_se_host1x_submit()
    c4bd2f4c35b0e crypto: pcrypt - restore callback for non-parallel fallback
    ee6a2a25665c6 crypto: hisi-trng - Remove crypto_rng interface
    774ddddf5eb26 crypto: ecc - Fix carry overflow in vli multiplication
    ac667f9f18c6b crypto: crypto4xx - Remove insecure and unused rng_alg
    0016d3c21c6ab crypto: chacha20poly1305 - validate poly1305 template argument
    d0b8cafd529b4 crypto: caam - use print_hex_dump_devel to guard key hex dumps again
    6f7b8e0321f3a crypto: caam - use print_hex_dump_devel to guard key hex dumps
    7465ed1524ace crypto: af_alg - Remove zero-copy support from skcipher and aead
    b5699642640d6 isofs: bound Rock Ridge symlink components to the SL record
    ce93228e2193a partitions: aix: bound the pp_count scan to the ppe array
    7a64521802997 btrfs: do not trim a device which is not writeable
    0912b98151eea btrfs: check and set EXTENT_DELALLOC_NEW before clearing EXTENT_DELALLOC
    6d7649c1231da nvmet-auth: validate reply message payload bounds against transfer length
    56c021a086926 nvmet: fix pre-auth out-of-bounds heap read in Discovery Get Log Page
    7a69463e9ad23 nvme-multipath: set BIO_REMAPPED on bios remapped to per-path namespace disks
    13f2f5defb4d7 dm-ioctl: report an error if a device has no table
    427c82497e269 block: partitions: fix of_node refcount leak in of_partition()
    a8803c4f0ac3f nvme: target: rdma: fix ndev refcount leak on queue connect
    d161d47aba31d crypto: atmel-sha204a - drop hwrng quality reduction for ATSHA204A
    c60932d6f8373 hwrng: jh7110 - fix refcount leak in starfive_trng_read()
    04f4599a9efb9 udf: validate sparing table length as an entry count, not a byte count
    e610fb113cdfa udf: validate VAT header length against the VAT inode size
    335202ab25b01 udf: validate free block extents against the partition length
    d944b8add3318 bpf: Prefer dirty packs for eBPF allocations
    0229944ba7923 bpf: Prefer packs that won't trigger an IBPB flush on allocation
    f1f36bf9bb117 bpf: Skip redundant IBPB in pack allocator
    666fc2e6e4d0a bpf: Restrict JIT predictor flush to cBPF
    8a4c8af9ae67e x86/bugs: Enable IBPB flush on BPF JIT allocation
    8ff183ee4d8c4 bpf: Support for hardening against JIT spraying
    bd818dcf4783e rust_binder: fix BINDER_GET_EXTENDED_ERROR
    e5049526a7aac rust_binder: introduce TransactionInfo
    be1567992417d x86,fs/resctrl: Prevent out-of-bounds access while offlining CPU when SNC enabled
    b7b2d2ccdbc4d mm: shmem: fix potential livelock issue for shmem direct swapin
    9818bcae3c0ca block: skip sync_blockdev() on surprise removal in bdev_mark_dead()
    e086c16962a1b usb: gadget: f_fs: Fix DMA fence leak
    b45be66ed47d4 usb: typec: ucsi: cancel pending work on system suspend
    f5c772b76bbd9 usb: typec: ucsi: ccg: Fix use-after-free of ucsi on remove
    b1dfdff51a865 usb: typec: ucsi: Pass full DP config payload in SET_NEW_CAM for DP alt mode
    8c00aec752ce1 usb: typec: ucsi: Invert DisplayPort role assignment
    3e1b1ac47e816 usb: typec: tcpm: Validate SVID index in svdm_consume_modes()
    0bc177820bd38 usb: typec: tcpm: Fix VDM type for Enter Mode commands
    bf6aa6c0ce0db usb: typec: class: drop PD lookup reference
    1126f1110b86c usb: typec: anx7411: use devm_pm_runtime_enable()
    347b59e9f9671 usbip: vudc: fix NULL deref in vep_dequeue()
    6c7e8e2514374 usbip: tools: support SuperSpeedPlus devices
    2d84c8376f7aa USB: usb-storage: ene_ub6250: restore media-ready check
    1967a7f0cd5c0 USB: ulpi: fix memory leak on registration failure
    1243f12079004 USB: serial: digi_acceleport: fix write buffer corruption
    2b7dc482f859f USB: serial: digi_acceleport: fix hard lockup on disconnect
    eab394781e932 USB: serial: digi_acceleport: fix broken rx after throttle
    4b147eb6ae6e0 USB: serial: option: add Telit Cinterion FE990D50 compositions
    cf6ca0aefae03 USB: serial: keyspan_pda: fix information leak
    8c29d9cfab1c3 usb: mtu3: unmap request DMA on queue failure
    729b68a5bad71 USB: misc: uss720: unregister parport on probe failure
    48394f94211cf usb: misc: usbio: bound bulk IN response length to the received transfer
    964d572b6c009 USB: storage: include US_FL_NO_SAME in quirks mask
    e0886775952e3 usb: sl811-hcd: disable controller wakeup on remove
    766738ecf2b81 USB: legousbtower: fix use-after-free on disconnect race
    6af28345cbf8b USB: quirks: add NO_LPM for the Samsung T5 EVO Portable SSD
    b748f97aff339 USB: iowarrior: fix use-after-free on disconnect
    2107a4fc8ff1c USB: ldusb: fix use-after-free on disconnect race
    54c2b7356b4ae USB: idmouse: fix use-after-free on disconnect race
    8a5eba992c862 usb: gadget: f_printer: take kref only for successful open
    b52476a83d9e1 usb: gadget: udc: Fix use-after-free in gadget_match_driver
    01feaf024f296 usb: gadget: composite: fix dead empty check in the USB_DT_OTG handler
    6bc17a78a0567 usb: free iso schedules on failed submit
    0bbab8882a319 usb: dwc3: meson-g12a: fix refcount leak in dwc3_meson_g12a_resume()
    4b0779207e36d USB: core: add USB_QUIRK_NO_LPM for VIA Labs USB 2.0 hub
    c00826e87bb75 usb: cdnsp: fix stream context array leak in cdnsp_alloc_stream_info()
    e22f044b0b20d usb: cdc_acm: Add quirk for Uniden BC125AT scanner
    e24eb271061db net: usb: kalmia: bound RX frame length in kalmia_rx_fixup()
    cd407de2ef5dc bpf: Validate BTF repeated field counts before expansion
    d94ab0e91d3ff bpf: Restore sysctl new-value from 1 to 0
    a9bb2d9c798cb bpf: Reject fragmented frames in devmap
    c3d3d2212c296 xfs: fix memory leak in xfs_dqinode_metadir_create()
    a62ef2d13d6e7 xfs: fix exchmaps reservation limit check
    55e4d8413fb54 xfs: fix pointer arithmetic error on 32-bit systems
    dd8d0665cdabf xfs: fix unreachable BIGTIME check in dquot flush validation
    936618643591c xfs: release dquot buffer after dqflush failure
    200794d0354cd xfs: use null daddr for unset first bad log block
    1cd54e217c6e2 serial: 8250_mid: Disable DMA for selected platforms
    973408ceab145 media: mtk-jpeg: cancel workqueue on release for supported platforms only
    223463c488b05 nilfs2: reject CLEAN_SEGMENTS ioctl with out-of-range segment numbers
    f3461b84a4865 hfs/hfsplus: zero-initialize buffer in hfs_bnode_read
    c63bc6308da71 HID: sensor-hub: Add sensor_hub_input_attr_read_values() for multi-byte reads
    4d0d51bc12d24 HID: lg-g15: cancel pending work on remove to fix a use-after-free
    b363d964ca829 HID: appleir: fix UAF on pending key_up_timer in remove()
    37daa8c96bd56 HID: multitouch: fix out-of-bounds bit access on mt_io_flags
    3eca1a8165b5e HID: letsketch: fix UAF on inrange_timer at driver unbind
    bbe1e55629bfa HID: wacom: use GFP_ATOMIC in wacom_wac_queue_flush()
    ca899a926c11a HID: wacom: fix slab-out-of-bounds write in wacom_wac_queue_insert
    cb90a01e478c2 HID: pidff: Use correct effect type in effect update
    416095e9a6037 HID: wacom: stop hardware after post-start probe failures
    7ce2c7dd28ab8 HID: uhid: convert to hid_safe_input_report()
    dae1d000ddfd5 HID: hid-goodix-spi: validate report size to prevent stack buffer overflow
    abf07f5c3584f tools/mm/slabinfo: fix total_objects attribute name
    e0eec7497bcc7 tools/mm/slabinfo: Fix trace disable logic inversion
    2382971aaaef5 mm/slab: do not limit zeroing to orig_size when only red zoning is enabled
    18d90dc05d98b X.509: Fix validation of ASN.1 certificate header
    28390912740a2 perf/arm-cmn: Fix DVM node events
    be79d285bea70 s390: Revert support for DCACHE_WORD_ACCESS
    2421a7b24f9c8 clocksource/drivers/timer-tegra186: Fix support for multiple watchdog instances
    cd25e9819620a time/jiffies: Register jiffies clocksource before usage
    7776f9226e99e posix-cpu-timers: Fix pid refcount leak in do_cpu_nanosleep() error path
    6ba6f6783be2f cpufreq: pcc: fix use-after-free and double free in _OSC evaluation
    6e175c00c62dc cpufreq: Fix hotplug-suspend race during reboot
    4bd0da48fbc1d sched/rt: Have RT_PUSH_IPI be default off for non PREEMPT_RT
    f77e55baeeb8c cpufreq: intel_pstate: Sync policy->cur during CPU offline
    59626d0d29217 perf/x86/intel/uncore: Defer ADL global PMON enable to enable_box()
    b9d45d328fcda libfs: set SB_I_NOEXEC and SB_I_NODEV by default in init_pseudo()
    92f41769e5fd1 firmware_loader: fix device reference leak in firmware_upload_register()
    e904961332801 cpufreq: qcom-cpufreq-hw: Fix possible double free
    a277489337c7d OPP: of: Fix potential memory leak in opp_parse_supplies()
    685fc15a41088 writeback: fix race between cgroup_writeback_umount() and inode_switch_wbs()
    c6c484a7d5bff smb: client: mask server-provided mode to 07777 in modefromsid
    157c67a657a7d smb: client: fix atime clamp check in read completion
    86c5d470f5d42 smb: client: harden POSIX SID length parsing
    3d89ae65ef78a smb: client: use unaligned reads in parse_posix_ctxt()
    297243e365fc9 smb: client: Fix next buffer leak in receive_encrypted_standard()
    d15d83125007f smb: client: fix double-free in SMB2_close() replay
    14498ff5ce0f2 smb: client: fix double-free in SMB2_open() replay
    3407240cde132 smb: client: fix double-free in SMB2_flush() replay
    52af1975f0dfa smb: client: fix change notify replay double-free
    276c8efbc49f9 smb: client: fix double-free in SMB2_ioctl() replay
    f1add4acb656f smb: client: fix query_info() replay double-free
    00b0fa4259414 smb: client: fix query directory replay double-free
    2b4592cea2146 ksmbd: use opener credentials for ADS I/O
    e72c15085b6d8 ksmbd: use opener credentials for delete-on-close
    df501c0f320b5 ksmbd: add per-handle permission check to FILE_LINK_INFORMATION
    2ca82bfff49c8 ksmbd: enforce FILE_READ_ATTRIBUTES on SMB_FIND_FILE_POSIX_INFORMATION
    20ee516a62989 ksmbd: run set info with opener credentials
    f56535db508ea ksmbd: add a WRITE_DAC/WRITE_OWNER check to SMB2 SET_INFO SECURITY
    db231af842868 ksmbd: require source read access for duplicate extents
    5aa1cb01155f9 ksmbd: fix UAF of struct file_lock in SMB2_LOCK deferred-lock cancellation
    a1d5d31cad593 ksmbd: serialize QUERY_DIRECTORY requests per file
    57f2042fd87d7 ksmbd: add a permission check for FSCTL_SET_ZERO_DATA
    baae7b39673ec ksmbd: add permission checks for FSCTL_DUPLICATE_EXTENTS_TO_FILE
    a187883cc1dc7 smb/client: Fix error code in smb2_aead_req_alloc()
    91b8a58c6ac15 smb: client: resolve SWN tcon from live registrations
    661a019ac0413 coresight: ultrasoc-smb: Fix OOB write in smb_sync_perf_buffer()
    08fad5d5a26cc fs/ntfs3: fix missing run load for vcn0 in attr_data_get_block_locked()
    6dd58c56ab864 fs/ntfs3: zero-fill folios beyond i_valid in ntfs_read_folio()
    764e6f76fdbd4 fs/ntfs3: fsync files by syncing parent inodes
    38cbb1feebcf5 fs/ntfs3: rename ni_readpage_cmpr into ni_read_folio_cmpr
    4718007870547 iommu/vt-d: Fix race condition during PASID entry replacement
    73abbaf91aa33 Bluetooth: L2CAP: validate option length before reading conf opt value
    d5616beb3355b Bluetooth: L2CAP: cancel pending_rx_work before taking conn->lock
    b84eeb7636d69 Bluetooth: ISO: avoid NULL deref of conn in iso_conn_big_sync()
    b9dd39cf1667e Bluetooth: hci_uart: clear HCI_UART_SENDING when write_work is canceled
    61701912c58a0 Bluetooth: hci_conn: Fix null ptr deref in hci_abort_conn()
    26168db1ce5a9 Bluetooth: fix UAF in bt_accept_dequeue()
    2a68a77308920 Bluetooth: btnxpuart: Fix out-of-bounds firmware read in nxp_recv_fw_req_v3()
    a6b22dbd80926 Bluetooth: bnep: pin L2CAP connection during netdev registration
    0039bdde36b23 Bluetooth: btmtksdio: fix infinite loop in btmtksdio_txrx_work()
    81a5971cbe18b netfilter: flowtable: fix offloaded ct timeout never being extended
    6fe8d3cecd20b netfilter: ebtables: terminate table name before find_table_lock()
    13a5f532e3a4f netfilter: ebtables: module names must be null-terminated
    9f74d28e903fa netfilter: ebtables: zero chainstack array
    fc5bfe63bacf8 netfilter: handle unreadable frags
    a8f03a3793289 netfilter: ctnetlink: use nf_ct_exp_net() in expectation dump
    69c0e6246575b mm/swap: add cond_resched() in swap_reclaim_full_clusters to prevent softlockup
    b415c00bf23df mm: swap_cgroup: fix NULL deref in lookup_swap_cgroup_id on swapless host
    006467ab93269 mm: shrinker: fix NULL pointer dereference in debugfs
    6465ff3ce6513 mm: shrinker: fix shrinker_info teardown race with expansion
    560e21e8ccff8 mm/shrinker: do not hold RCU lock in shrinker_debugfs_count_show()
    b5f41d5bf08e7 mfd: cros_ec: Delay dev_set_drvdata() until probe success
    bbae351c0f32f net: ipv4: bound TCP reordering sysctl writes and MTU probe sizes
    2ca18df1c2611 ipv4: igmp: remove multicast group from hash table on device destruction
    a33f37f8d079d netpoll: fix a use-after-free on shutdown path
    f090acf881a26 io_uring/rw: preserve partial result for iopoll
    1636d85dc139b io_uring/io-wq: re-check IO_WQ_BIT_EXIT for each linked work item
    722869fcff598 io_uring/nop: fix file reference leak with IOSQE_FIXED_FILE
    4508366ab7dd0 gpio: sch: use raw_spinlock_t in the irq startup path
    4750909a40da9 gpio: eic-sprd: use raw_spinlock_t in the irq startup path
    f71e8d9875069 NTB: epf: Avoid calling pci_irq_vector() from hardirq context
    cf28fc1658463 fs/ntfs3: validate Dirty Page Table capacity in log_replay copy_lcns
    c00164c9e7fa6 debugobjects: Plug race against a concurrent OOM disable
    cbb684ef39e9f coresight: etb10: restore atomic_t for shared reading state
    b346efa825b5e Bluetooth: MGMT: Fix UAF of hci_conn_params in add_device_complete
    d3b739db5dc6f Bluetooth: L2CAP: Fix UAF in channel timeout by holding conn ref
    fe997a84a385f audit: Fix data races of skb_queue_len() readers on audit_queue
    e8417353cbd07 net: af_key: initialize alg_key_len for IPComp states
    94083db751930 ksmbd: fix use-after-free of a deferred file_lock on SMB2_CLOSE then SMB2_CANCEL
    ef6feb77e2d91 crypto: krb5 - filter out async aead implementations at alloc
    84a00be9b736a crypto: amlogic - avoid double cleanup in meson_crypto_probe()
    6f91621fc4502 staging: rtl8723bs: fix OOB write in HT_caps_handler()
    a6105ea8ca6eb staging: rtl8723bs: fix OOB reads in is_ap_in_tkip() IE loop
    c38d16b1ffac3 staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()
    69f174a0673b6 staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
    04f612dc03427 staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop
    64ec4192d9c10 staging: rtl8723bs: fix WEP length underflow and OOB read in OnAuth()
    b9c4bf133c3c4 staging: rtl8723bs: fix heap buffer overflow in rtw_cfg80211_set_wpa_ie()
    b5ddc7257bee7 staging: media: ipu7: fix double-free and use-after-free in error paths
    1ca4f310c6b1f staging: media: atomisp: reduce load_primary_binaries() stack usage
    b4ba13dafa13c media: staging: ipu3-imgu: Add range check for imgu_css_cfg_acc_stripe
    e3ceafa6d8ee6 staging: vme_user: fix location monitor leak in tsi148 bridge
    a921486313975 staging: vme_user: fix location monitor leak in fake bridge
    ceb875a375ded smb: client: restrict implied bcc[0] exemption to responses without data area
    e99f2df433c63 staging: vme_user: bound slave read/write to the kern_buf size
    2de42e2681747 tipc: fix out-of-bounds read in broadcast Gap ACK blocks
    0beccbcf50de1 6lowpan: fix NHC entry use-after-free on error path
    c40090f8d19b4 usb: misc: usbio: fix disconnect UAF in client teardown
    c4e232bd07fe2 usb: dwc3: run gadget disconnect from sleepable suspend context
    2a52d55c86a42 USB: chaoskey: Fix slab-use-after-free in chaoskey_release()
    285e17c44e387 hwrng: virtio: clamp device-reported used.len at copy_data()
    65e93ec592f5b virtio-mmio: fix device release warning on module unload
    075bc3c779e1e virtio_pci: fix vq info pointer lookup via wrong index
    81d54c766337b netfilter: ipset: fix race between dump and ip_set_list resize
    9c8f31eaae614 mm/damon/ops-common: handle extreme intervals in damon_hot_score()
    657646c08c94e tcp: restore RCU grace period in tcp_ao_destroy_sock
    b775246212504 PCI/IOV: Skip VF Resizable BAR restore on read error
    1115680bca1d7 PCI: qcom: Initialize DWC MSI lock for firmware-managed ECAM hosts
    6e6a529d6f779 PCI: mediatek: Fix IRQ domain leak when port fails to enable
    69416a5308675 PCI: imx6: Fix IMX6SX_GPR12_PCIE_TEST_POWERDOWN handling
    1d2e66a4bc0dd PCI: host-common: Request bus reassignment when not probe-only
    9c698af5c2a12 PCI: Always lift 2.5GT/s restriction in PCIe failed link retraining
    09c43b7b7d29c PCI: altera: Fix resource leaks on probe failure
    5e42a981887d2 PCI: altera: Do not dispose parent IRQ mapping
    d666c5aec822d PCI: loongson: Override PCIe bridge supported speeds for Loongson-3C6000 series
    e5406c8fb71cd usb: typec: tcpci_rt1711h: unregister TCPCI port with devres
    99d00a9e35e31 xhci: sideband: fix ring sg table pages leak
    f90586129cf9e usb: xhci: Fix sleep in atomic context in xhci_free_streams()
    91b27f8172cdb rust_binder: clear freeze listener on node removal
    281335996ab21 rust_binder: synchronize Rust Binder stats with freeze commands
    08e21d86d2722 rust_binder: reject context manager self-transaction
    89b8cc948dce6 rust_binder: use a u64 stride when cleaning up the offsets array
    328ccf32acb87 binder: fix UAF in binder_free_transaction()
    ea02df466df60 binder: fix UAF in binder_thread_release()
    17a2d3f903455 Bluetooth: btusb: fix wakeup source leak on probe failure
    a7e941a395711 Bluetooth: btusb: fix use-after-free on marvell probe failure
    8db0ce3de7836 Bluetooth: btusb: fix use-after-free on registration failure
    79f9e221dddec Bluetooth: btusb: Add USB ID 2c4e:0128 for Mercusys MA60XNB
    a53109ffb6b51 vfio: Remove device debugfs before releasing devres
    7f2d6b31089e4 vfio: prevent infinite loop in vfio_mig_get_next_state() on blocked arc
    ba96666d991e6 vfio/pci: Fix racy bitfields and tighten struct layout
    52adb2dff7ce3 vfio/pci: Release the VGA arbiter client on register_device() failure
    f6c67cf0051f9 vfio/pci: Latch disable_idle_d3 per device
    a385d3435a7af vfio/pci: Use a private flag to prevent power state change with VFs
    afc90150551dd ALSA: usb-audio: Update US-16x08 EQ/comp shadow state after successful writes
    54c448e4f26a7 ALSA: usb-audio: Update Babyface Pro control caches only after successful writes
    f3e8a6cca15b8 ALSA: usb-audio: Roll back quirk control caches on write errors
    3061b6c114458 ALSA: usb-audio: Propagate US-16x08 write errors in route/mix EQ-switch put callbacks
    bfd28b07541e5 ALSA: usb-audio: Propagate errors in scarlett_ctl_enum_put()
    a263eb12cbe2e ALSA: usb-audio: avoid kobject path lookup in DualSense match
    16f14f55141d4 ALSA: us144mkii: capture_urb_complete: redundant usb_anchor_urb corrupts anchor list on each resubmission
    651ba82fe2a14 ALSA: seq: Fix uninitialised heap leak in snd_seq_event_dup()
    71b87108ad93d ALSA: ice1712: check snd_ctl_new1() return value
    04dd210180575 ALSA: hda/realtek: Fix noisy mic for Clevo V6xxAW
    1933e6ee136b1 ALSA: hda/hdmi: Use 'AC_PINSENSE_ELDV' to detect pinsense for Loongson
    4dd2552e559bd ALSA: hda/hdmi: Add force-connect quirk for HP EliteDesk 800 G5 Mini
    ce0a903d0591e ALSA: hda/cs35l41: Fix firmware load work teardown
    5e74e5e8cb7cc ALSA: gus: check snd_ctl_new1() return value
    8e48a29813df8 ALSA: firewire: isight: bound the sample count to the packet payload
    db25755e7629d ALSA: FCP: Add Focusrite ISA C8X support
    9e53e99b6fa3c ALSA: es1938: check snd_ctl_new1() return value
    b27a75d42044d ALSA: compress: Fix task creation error unwind
    af2b009b773bc ALSA: cmipci: check snd_ctl_new1() return value
    a5fd3122283bf ALSA: caiaq: fix out-of-bounds read in the Traktor Kontrol S4 input parser
    fd786466889e4 ALSA: aoa: check snd_ctl_new1() return value
    f6538a318947b ALSA: ymfpci: check snd_ctl_new1() return value
    5da9742de22db ALSA: virtio: Validate control metadata from the device
    df0fe53a7104b ALSA: virtio: Add missing 384 kHz PCM rate mapping
    c071df05bcda0 ALSA: usx2y: us144mkii: fix work UAF on disconnect
    a4f8491da9563 iio: temperature: tmp006: use devm_iio_trigger_register
    62a0d75bedd4b iio: temperature: ltc2983: Fix reinit_completion() called after conversion start
    e16258913be6a iio: temperature: ltc2983: Fix n_wires default bypassing rotation check
    b50344ab202f3 iio: temperature: Build mlx90635 with CONFIG_MLX90635
    7d4d60f7c0541 iio: resolver: ad2s1210: notify trigger and clear state on fault read error
    c6ca87c7bbb3f iio: proximity: vl53l0x: notify trigger and clear IRQ on error paths
    b3f1af4ba8e9c iio: pressure: mpl115: fix runtime PM leak on read error
    e2d5b9673bf71 iio: pressure: bmp280: zero-init bmp580 trigger handler buffer
    f829d6c32f31b iio: magnetometer: ak8975: Add missed pm_runtime_put_autosuspend() call
    0975e013179d3 iio: light: veml6030: fix channel type when pushing events
    ef6c2a521454f iio: light: tsl2591: return actual error from probe IRQ failure
    9d421c2827ea1 iio: light: opt3001: fix missing state reset on timeout
    0c655d067ac69 iio: light: gp2ap002: fix runtime PM leak on read error
    a60bf629a760d iio: light: al3320a: read both ALS ADC registers again
    a1dafc918d793 iio: light: al3320a: add missing REGMAP_I2C to Kconfig
    a00d471cf3580 iio: light: al3010: read both ALS ADC registers again
    cd278561640c7 iio: light: al3010: fix incorrect scale for the highest gain range
    9fb4ff07d97e3 iio: light: al3010: add missing REGMAP_I2C to Kconfig
    6afb69bb969ed iio: light: al3000a: add missing REGMAP_I2C to Kconfig
    482b24660ec3b iio: imu: st_lsm6dsx: deselect shub page before reading whoami
    76e12a71ac053 iio: imu: inv_icm42600: fix timestamping by limiting FIFO reading
    34656a59322e5 iio: imu: inv_icm42600: fix timestamp clock period by using lower value
    0522819228284 iio: imu: bmi160: add IRQF_NO_THREAD to data-ready trigger IRQ
    bdafd53ae671e iio: imu: adis: add IRQF_NO_THREAD to non-FIFO trigger IRQ
    001527e2382e3 iio: gyro: bmg160: wait full startup time after mode change at probe
    7bbf02b63961f iio: gyro: bmg160: bail out when bandwidth/filter is not in table
    9edefd4c56bee iio: event: Fix event FIFO reset race
    2358da87315d1 iio: dac: ad3552r-hs: fix uninitialized data ni ad3552r_hs_write_data_source()
    e166a8cfb28a3 iio: core: fix uninitialized data in debugfs
    b947bde73461f iio: common: st_sensors: honour channel endianness in read_axis_data
    82accdd574043 iio: chemical: scd30: Cleanup initializations and fix sign-extension bug
    c28835b8618ec iio: backend: fix uninitialized data in debugfs
    0f30e68dd6c1f iio: adc: ti-ads124s08: Return reset GPIO lookup errors
    ffb2195921c3d iio: adc: ti-ads1119: fix PM reference leak in buffer preenable
    bbfebae473ac2 iio: adc: spear: Initialize completion before requesting IRQ
    9e2e8b8cdfd37 iio: adc: lpc32xx: Initialize completion before requesting IRQ
    c313bb7c38855 iio: adc: ad_sigma_delta: fix CS held asserted and state leaks
    3394e0b332842 iio: adc: ad_sigma_delta: fix clear_pending_event for registerless devices
    46e93fcbe7c2c iio: adc: ad7779: add missing 'select IIO_TRIGGERED_BUFFER' to Kconfig
    24a9514b606e7 iio: adc: ad7768-1: Select GPIOLIB
    e6ade81631d76 iio: adc: ad7380: select REGMAP
    6293211d14260 iio: accel: kxsd9: fix runtime PM imbalance on write_raw() error
    3e766526827ac iio: accel: bmc150: clamp the device-reported FIFO frame count
    7515a6d4a9e9e usb: gadget: function: rndis: add length check for header
    e01e7814b4223 usb: gadget: function: rndis: add length check to response query
    9d1dc507b99ce fscrypt: Replace mk_users keyring with simple list
    85f8b440a09ba fscrypt: Fix key setup in edge case with multiple data unit sizes
    20133754d46fe rust: kasan: KASAN+RUST requires clang
    a2d5d3ee7b6e3 perf/core: Detach event groups during remove_on_exec
    94396fd93226a futex/requeue: Revert "Prevent NULL pointer dereference in remove_waiter() on self-deadlock""
    1cc8f512cd905 rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
    70fe1ac8647b0 rust: doctest: fix incorrect pattern in replacement
    e7636f26f7707 rust: block: fix GenDisk cleanup paths
    c1dd0b1071004 rust: cpufreq: clean new `clippy::map_or_identity` lint for Rust 1.98.0
    30d5d4eef35a9 LoongArch: Add PIO for early access before ACPI PCI root register
    86df6499dfd23 platform/x86: intel-hid: Protect ACPI notify handler against recursion
    452945662fd8e ACPI: NFIT: core: Fix possible NULL pointer dereference
    f29dc6132d496 ACPI: CPPC: Suppress UBSAN warning caused by field misuse
    ff9c4c6428883 KVM: x86: Unconditionally recompute CR8 intercept on PPR update
    3dcfb04dd43b1 KVM: VMX: Grab vmcs12 on CR8 interception update iff vCPU is in guest mode
    0d0187a46b16e KVM: x86: Move update_cr8_intercept() to lapic.c
    9baa2833e6bc8 perf trace beauty fcntl: Fix build with older kernel headers
    47e4c6e06e78e slab: recognize @GFP parameter as optional in kernel-doc
    1776f29327a13 default_gfp(): avoid using the "newfangled" __VA_OPT__ trick
    50c26b461b8e7 add default_gfp() helper macro and use it in the new *alloc_obj() helpers
    2dca62902eb35 slab: Introduce kmalloc_flex() and family
    1c2672781b1b3 mm/khugepaged: write all dirty file folios when collapsing
    2539f67b75461 nfsd: change nfs4_client_to_reclaim() to allocate data
    05e48af3bf58d nfsd: move name lookup out of nfsd4_list_rec_dir()
    c4b70c1512b8f net/sched: dualpi2: fix GSO backlog accounting
    076b1aa65f77a fbdev: fbcon: fix out-of-bounds read in err_out of fbcon_do_set_font()
    406c28af75123 f2fs: fix to do sanity check on f2fs_get_node_folio_ra()
    3f42fbd3c891d f2fs: detect more inconsistent cases in sanity_check_node_footer()
    ed87e57558dc5 f2fs: optimize trace_f2fs_write_checkpoint with enums
    8dbc4c5686820 f2fs: introduce f2fs_schedule_timeout()
    599d7d82eeecc f2fs: use memalloc_retry_wait() as much as possible
    ec9f79c8d5b28 f2fs: fix listxattr handling of corrupted xattr entries
    89479a27fa4e1 f2fs: fix potential deadlock in gc_merge path of f2fs_balance_fs()
    998536c96b6ad f2fs: fix potential deadlock in f2fs_balance_fs()
    4ce2d52f680c1 f2fs: bound i_inline_xattr_size for non-inline-xattr inodes
    a499f77c06050 f2fs: atomic: fix UAF issue on f2fs_inode_info.atomic_inode
    5a4d3968cf820 f2fs: remove non-uptodate folio from the page cache in move_data_block
    9c86a1f930bb2 device property: initialize the remaining fields of fwnode_handle in fwnode_init()
    60d696a037eee userfaultfd: gate must_wait writability check on pte_present()
    3436a7dd067c5 rust: str: clean unused import for Rust >= 1.98
    3603500c868a1 rust: str: use the "kernel vertical" imports style
    8dee7c278f1c2 nfsd: release layout stid on setlease failure
    6f88ca186a984 nfsd: update mtime/ctime on COPY in presence of delegated attributes
    7c702bb4f8d83 nfsd: update mtime/ctime on CLONE in presense of delegated attributes
    501543207378f bpf, arm64: Reject out-of-range B.cond targets

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 23c43c0cc1..6d287cdc7d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0d0c54addf4ff32e49c485061bd9ea5bde241d94"
-SRCREV_meta ?= "bf23930cc9805c0e87bdaff762832446c730a39b"
+SRCREV_machine ?= "0156acd2db993abc3baa366fee892d503aab1ccc"
+SRCREV_meta ?= "2f71b0a288c307062fc60948ac793d8d51c685e2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.38"
+LINUX_VERSION ?= "6.18.39"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index e186b5f992..8b9201a73e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.38"
+LINUX_VERSION ?= "6.18.39"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
-SRCREV_meta ?= "bf23930cc9805c0e87bdaff762832446c730a39b"
+SRCREV_machine ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
+SRCREV_meta ?= "2f71b0a288c307062fc60948ac793d8d51c685e2"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 5c849202ad..8528869a5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "053c98bdd6c074a24771d69d24ff077f6016b299"
-SRCREV_machine:qemuarm64 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
-SRCREV_machine:qemuloongarch64 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
+SRCREV_machine:qemuarm ?= "162946cfb65f28f0a5f60e927bdae5615e6356a8"
+SRCREV_machine:qemuarm64 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
+SRCREV_machine:qemuloongarch64 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
-SRCREV_machine:qemuriscv64 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
-SRCREV_machine:qemuriscv32 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
-SRCREV_machine:qemux86 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
-SRCREV_machine:qemux86-64 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
+SRCREV_machine:qemuppc ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
+SRCREV_machine:qemuriscv64 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
+SRCREV_machine:qemuriscv32 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
+SRCREV_machine:qemux86 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
+SRCREV_machine:qemux86-64 ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
-SRCREV_meta ?= "bf23930cc9805c0e87bdaff762832446c730a39b"
+SRCREV_machine ?= "a05c451ede0dd80b1cc2362b47f36f3c137cbd1e"
+SRCREV_meta ?= "2f71b0a288c307062fc60948ac793d8d51c685e2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e46dc0adfe39724bcf52cea47b8f9c9aed86a394"
+SRCREV_machine:class-devupstream ?= "f89c296854b755a66657065c35b05406fc18264d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.38"
+LINUX_VERSION ?= "6.18.39"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


