Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6499FCD98D2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:50:23 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25474.1781110222434119427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 09:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AmHBbNiT;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51775f2473aso52424121cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781110221; x=1781715021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnGUyA5IOS47tBlkQz3Fg5hVJxIEVI/lYsmgm/FMoCU=;
        b=AmHBbNiT0oUCqFDbYT+XXA/gNgN8d98CRxofeZ5i6mOh+bqnoFqxFtCth+W1E9HPLv
         rdjFPefQ1S/SNbGcJ0OFWpMc3pTatqSQpGmiJEG5dHxUDS2PK+VaaL34z/3nr5bQJKA6
         mvGqpmRAVg1JNUPBnZZ4s+bTt1cVtTwu+ikXJjIb7nOl9IWGjTuYhwHSrxMxSK9zfdGP
         lRu4orgLhFXJDbWh1+btSkoSK+MkgxRZOQtlz76C0yIJ5nHJIiJWka92CTvUK26dVQJR
         +cCJba9275eIGhqPTFI5AZy21mKw1X63htXyk52YG6sumlbOqLACWjYmAGegdKJ57wyE
         KBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110221; x=1781715021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EnGUyA5IOS47tBlkQz3Fg5hVJxIEVI/lYsmgm/FMoCU=;
        b=lOqpchBXBIG7B9Mboa7PUgFIEnJ3opKh4ZxQi1+Mn6exMoFosNpFOVRN9vLmYBk96M
         atyVjffbkqSEYgbdGPsJXpW/GQdp/AeXK0+uCVxL1d17/rXxSrsux1hdGzqnZryeAooO
         0jRxR/oUMMSo68pp8WuFKWy9VL1jFCuSMgc9RldGhLjokrjpi5Bra7Dn0gQsLNGeYMJC
         9CPTMxzEiyZq4FOk4cNmrDYkKGegkuyOh4pO343FoB70+monOXMeAPuLk+7eASipf0K7
         0MKsn/6++SFY708mHGKwYFu81f664NbtF7bKx8VICCplgkzbQMTQ9YfP63ALQiW8zfh8
         i5Fg==
X-Gm-Message-State: AOJu0YxrHfupNWwq7zgjUc5itcbUUcP7ID3cng3emy2YOoX26dQi0i5u
	cCDtKkCoeudmKfVM1flRDFdqSls7DjUZngEOBr46wekamDjRejcWwIUx7jV8wPvq
X-Gm-Gg: Acq92OE0Dg2X+eN5LlSCgkw2btBGn1ZHaza5G1ObCvMkoeYLywdQDFpbjf5maU0ss7z
	iDQM4ydob58j6e3PiRKR6rFZmzpapfDEGNc0vmt5jW680G1q+Tsdu6ukpofiivBQI6F5w/lXx5Q
	EAYF/FhAB0KaohjOF9lbcps+Wig9FnN6KdZrcLdjVueQsySVxYnIMrdPLaKzy3yqaB71sxgecxw
	btD8rxKHTv/G6N7AmG8v4/CnIKxSGY2zR6MpuhAR0qIMUCZNxL/eXR4EZsb5HJdY1imL4BZKBEZ
	8NeIJ2HbFedjs81VBJ6njBjBKFIyEWVuKEqG+NjXxa/IW4hBFY5PXpVOKQTzBHs4KWkg98vpxWH
	WrSUl1q2qA4QudFRgm7XOzmJ9Aha9aS7/M1GaAK4Pa3o7+1ybWANzmk5TDZsS0x5As0uVJM5Jxi
	0dV4FS/7oB5WUettrmYmiNKBJWt2GB/juk1WH88drT1JcoWUHfxQ3EStYsvxPBa1eWByFxiLV85
	8qAiQeerx+FMNNSg0WTRKjCu082JAo/1qnh8ru/DY+qMsVlwYpdGFIYvXKtkdC7H5BtZcVtwUL3
	zzosuVXAcVsrLCgj75oVSH+C4sr3Kh+iV5Mytog0zuk4R3/Nt28yMoE=
X-Received: by 2002:a05:622a:5c10:b0:50d:7aa1:f405 with SMTP id d75a77b69052e-517ea707e95mr1006681cf.9.1781110220863;
        Wed, 10 Jun 2026 09:50:20 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb915csm241444346d6.14.2026.06.10.09.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:50:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 09/11] linux-yocto/6.6: update to v6.6.140
Date: Wed, 10 Jun 2026 12:50:06 -0400
Message-ID: <20260610165008.1870552-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
References: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 16:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238385

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    eac8889a3a1c Linux 6.6.140
    4c3ed344a970 smb: client: use kzalloc to zero-initialize security descriptor buffer
    2074dfffad76 Bluetooth: MGMT: Fix dangling pointer on mgmt_add_adv_patterns_monitor_complete
    b94588f5a697 crypto: nx - fix context leak in nx842_crypto_free_ctx
    d7e42dc47beb Bluetooth: MGMT: Fix memory leak in set_ssp_complete
    f7c14993dc2f mtd: spi-nor: sst: Fix SST write failure
    5bb5faff4837 drm/amdgpu/vcn4: Avoid overflow on msg bound check
    1936310f68c5 drm/amdgpu/vcn3: Avoid overflow on msg bound check
    9b2c795bb2c6 vsock/virtio: fix length and offset in tap skb for split packets
    65c484726e74 vsock/virtio: fix accept queue count leak on transport mismatch
    a998a7e250bf vsock: fix buffer size clamping order
    944d76f749dd KVM: arm64: Wake-up from WFI when iqrchip is in userspace
    83ce43a21bb7 ceph: only d_add() negative dentries when they are unhashed
    09a69a3d8f97 usb: dwc3: Move GUID programming after PHY initialization
    033c80d80fd1 tracing/probes: Limit size of event probe to 3K
    f5ee467b5676 btrfs: fix btrfs_ioctl_space_info() slot_count TOCTOU which can lead to info-leak
    6b57d6e4c302 batman-adv: tp_meter: fix tp_num leak on kmalloc failure
    79bc0eaeef2c batman-adv: stop tp_meter sessions during mesh teardown
    c2287250ba69 pwm: imx-tpm: Count the number of enabled channels in probe
    3666c037fbde mtd: spi-nor: sst: Fix write enable before AAI sequence
    b7cd63d13fae mtd: spi-nor: sst: Factor out common write operation to `sst_nor_write_data()`
    0000a7780e0e ksmbd: fix use-after-free in __ksmbd_close_fd() via durable scavenger
    b32f4cd81ef5 mm/damon/reclaim: detect and use fresh enabled and kdamond_pid values
    8e7317598d72 usb: typec: tcpm: reset internal port states on soft reset AMS
    2b26b1ec4c1d mm/damon/lru_sort: detect and use fresh enabled and kdamond_pid values
    0dd8917f35da mm/damon/core: implement damon_kdamond_pid()
    7c504ffab3ef rxrpc: Also unshare DATA/RESPONSE packets when paged frags are present
    cfa4267b5075 mm/damon/core: disallow time-quota setting zero esz
    172dcb67dd35 bonding: fix use-after-free due to enslave fail after slave array update
    cf1fd517f892 Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_get_sndtimeo_cb()
    c0428a22daf6 rxrpc: Fix conn-level packet handling to unshare RESPONSE packets
    594973a2e549 fbcon: Avoid OOB font access if console rotation fails
    f4b177f96955 spi: microchip-core-qspi: fix controller deregistration
    091499f90e09 spi: microchip-core-qspi: Use helper function devm_clk_get_enabled()
    420d6f5e3fb4 mm/hugetlb_cma: round up per_node before logging it
    fa7aaaed583a spi: uniphier: fix controller deregistration
    3e272e6be1a2 spi: uniphier: Simplify clock handling with devm_clk_get_enabled()
    c9577d966503 spi: uniphier: switch to use modern name
    664b60985a77 spi: tegra20-sflash: fix controller deregistration
    4541a6cbec27 spi: tegra114: fix controller deregistration
    df771f250402 spi: sun6i: fix controller deregistration
    9da85b209f26 spi: sun6i: switch to use modern name
    7fd0c4fd2185 spi: zynq-qspi: fix controller deregistration
    dc2044ef3647 spi: zynq-qspi: Simplify clock handling with devm_clk_get_enabled()
    ae6ee9f16538 spi: zynq-qspi: switch to use modern name
    db96551920e2 spi: ti-qspi: fix controller deregistration
    25ba53c43f30 spi: spi-ti-qspi: switch to use modern name
    3b6cededf65a spi: spi-ti-qspi: Convert to platform remove callback returning void
    1cdba535877d spi: sun4i: fix controller deregistration
    79a38ff2bd3d spi: sun4i: switch to use modern name
    904ff4e79961 spi: syncuacer: fix controller deregistration
    5bbe69946620 spi: synquacer: switch to use modern name
    6823f730bf19 Bluetooth: hci_conn: fix potential UAF in create_big_sync
    b4a53add2fa8 xfrm: defensively unhash xfrm_state lists in __xfrm_state_delete
    0555d4f52623 xfrm: ah: account for ESN high bits in async callbacks
    9d3968c48367 net: ipv6: stop checking crypto_ahash_alignmask
    0841fc6a36c3 net: ipv4: stop checking crypto_ahash_alignmask
    7e78a5bcbd65 ALSA: seq: Fix UMP group 16 filtering
    dbacde3d4755 ALSA: seq: Notify client and port info changes
    3915715273cd ALSA: core: Serialize deferred fasync state checks
    fe337552143f ALSA: misc: Use guard() for spin locks
    409fb34c1860 ALSA: hda: cs35l56: Propagate ASP TX source control errors
    247ed8a969f9 tracepoint: balance regfunc() on func_add() failure in tracepoint_add_func()
    e1c50b273298 net: stmmac: Prevent NULL deref when RX memory exhausted
    8a2c91de61ff net: stmmac: rename STMMAC_GET_ENTRY() -> STMMAC_NEXT_ENTRY()
    6a74af77eba5 net: stmmac: avoid shadowing global buf_sz
    2adbfca7452e crypto: caam - guard HMAC key hex dumps in hash_digest_key
    f3a3e2dac5ec printk: add print_hex_dump_devel()
    43a878639b90 erofs: fix unsigned underflow in z_erofs_lz4_handle_overlap()
    6923cde8dc1d crypto: nx - fix bounce buffer leaks in nx842_crypto_{alloc,free}_ctx
    268ae55a4c4f crypto: nx - Migrate to scomp API
    c5fa7465794c crypto: nx - Avoid -Wflex-array-member-not-at-end warning
    bf96052d617b ksmbd: reset rcount per connection in ksmbd_conn_wait_idle_sess_id()
    e1c24ce7573d wifi: rtl8xxxu: fix potential use of uninitialized value
    3ca80e3012c8 hfsplus: fix held lock freed on hfsplus_fill_super()
    61a790974ff7 hfsplus: fix uninit-value by validating catalog record size
    82fb9da6477d xfs: fix a resource leak in xfs_alloc_buftarg()
    b58baa1d50aa mmc: core: Optimize time for secure erase/trim for some Kingston eMMCs
    058b451b1039 udf: fix partition descriptor append bookkeeping
    401a49b7f26e firmware: google: framebuffer: Do not unregister platform device
    2a40f8bc9bb7 fbdev: defio: Disconnect deferred I/O from the lifetime of struct fb_info
    a2c817c62943 spi: fix resource leaks on device setup failure
    4c4641366143 net: qrtr: ns: Limit the total number of nodes
    0dbec101a707 net: qrtr: ns: Limit the maximum number of lookups
    e6f6cd501fb5 net: qrtr: ns: Limit the maximum server registration per node
    0b9e4bbfb7c9 net: bridge: use a stable FDB dst snapshot in RCU readers
    218b772e4815 net: mctp: fix don't require received header reserved bits to be zero
    6a2d6273b6c3 RDMA/mana_ib: Disable RX steering on RSS QP destroy
    8d4edc89bf71 sched: Use u64 for bandwidth ratio calculations
    ede9eca9701d block: relax pgmap check in bio_add_page for compatible zone device pages
    18d6a7c9e4e6 media: rc: igorplugusb: heed coherency rules
    69b3a50dee62 ALSA: aoa: Skip devices with no codecs in i2sbus_resume()
    32fbdb6d6718 media: rc: ttusbir: respect DMA coherency rules
    35bcafc82254 ALSA: aoa: i2sbus: clear stale prepared state
    a045146109ea ALSA: aoa: Use guard() for mutex locks
    07f9bff69da8 ipmi:ssif: Clean up kthread on errors
    1f5e011fc8c8 ipmi:ssif: Fix a shutdown race
    37a430a2d4e6 thermal: core: Fix thermal zone governor cleanup issues
    78509c488c5d PCI: epf-mhi: Return 0, not remaining timeout, when eDMA ops complete
    801000afc9c9 wifi: mt76: mt792x: fix mt7925u USB WFSYS reset handling
    b3303d6e92f6 wifi: mt76: mt792x: describe USB WFSYS reset with a descriptor
    b968db3b8b4f wifi: mt76: connac: introduce helper for mt7925 chipset
    8dc5b98c20aa arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
    bf477abd448c lib: test_hmm: evict device pages on file close to avoid use-after-free
    11869ce402d9 wifi: mwifiex: fix use-after-free in mwifiex_adapter_cleanup()
    7edd983e42ee f2fs: fix to do sanity check on dcc->discard_cmd_cnt conditionally
    35baa66a8cd7 ksmbd: replace connection list with hash table
    b0b3d62d7230 ksmbd: use msleep instaed of schedule_timeout_interruptible()
    1171f329cf1c f2fs: fix UAF caused by decrementing sbi->nr_pages[] in f2fs_write_end_io()
    8e47d297e7cf smb: client: validate the whole DACL before rewriting it in cifsacl
    325d4ac11f52 ksmbd: require minimum ACE size in smb_check_perm_dacl()
    1593ddb37bd1 smb: common: change the data type of num_aces to le16
    795dddb10687 smb: move some duplicate definitions to common/smbacl.h
    65419eb4259a batman-adv: bla: put backbone reference on failed claim hash insert
    7b8fbcee3184 batman-adv: bla: only purge non-released claims
    368449e467d5 batman-adv: bla: prevent use-after-free when deleting claims
    aafcbaf1159e batman-adv: stop caching unowned originator pointers in BAT IV
    e4a3c4a4c8f6 batman-adv: reject new tp_meter sessions during teardown
    f61499359fa5 batman-adv: fix integer overflow on buff_pos
    1bfb06ecb00f sctp: revalidate list cursor after sctp_sendmsg_to_asoc() in SCTP_SENDALL
    ee4c7a919761 drm/amdgpu/pm: align Hawaii mclk workaround with radeon
    a103f1192dc7 drm/amdgpu/pm: add missing revision check for CI
    4f7ca00fa91d drm/amdgpu/sdma4: replace BUG_ON with WARN_ON in fence emission
    b5de35bafcd3 drm/amdgpu/gfx9: drop unnecessary 64-bit fence flag check in KIQ
    91fbb5e635c8 drm/amdgpu: zero-initialize GART table on allocation
    b8cbc52c73fa drm/radeon: add missing revision check for CI
    91c6dc5a4169 drm/amdkfd: validate SVM ioctl nattr against buffer size
    6b992591e04f drm/gem: Fix inconsistent plane dimension calculation in drm_gem_fb_init_with_funcs()
    638d3e0b9eb7 drm/amdgpu/vcn3: Prevent OOB reads when parsing dec msg
    c72a8b4dc6d5 drm/amdgpu/vcn4: Prevent OOB reads when parsing dec msg
    944db9cfa537 drm/amdgpu/vce: Prevent partial address patches
    1dc005775fb5 drm/amdgpu/vcn4: Prevent OOB reads when parsing IB
    0fb5cb556b24 drm/amdgpu: Add bounds checking to ib_{get,set}_value
    4a8093c7def1 drm/amdkfd: Add upper bound check for num_of_nodes
    1db431380879 drm/amdkfd: Clear VRAM on allocation to prevent stale data exposure
    01eea4d12fb6 spi: cadence: fix unclocked access on unbind
    31e7dd252bf7 spi: cadence: fix controller deregistration
    bb6b50f709c5 spi: mpc52xx: fix use-after-free on unbind
    59abb878f5a6 spi: orion: fix clock imbalance on registration failure
    678a461af304 spi: orion: fix runtime pm leak on unbind
    1f120e1a3e1e spi: imx: fix runtime pm leak on probe deferral
    17aa64b8fe3e spi: img-spfi: fix controller deregistration
    77defd64b405 spi: rspi: fix controller deregistration
    c6f82bd90a71 spi: sprd: fix controller deregistration
    6dd37ce42ac7 spi: coldfire-qspi: fix controller deregistration
    3ad32a7140eb spi: bcmbca-hsspi: fix controller deregistration
    562d954a1449 spi: fsl: fix controller deregistration
    59da4cdd0c7b spi: sh-hspi: fix controller deregistration
    863edec24c1d spi: mtk-nor: fix controller deregistration
    4ea9a1ad663c spi: omap2-mcspi: fix controller deregistration
    89c0a7762104 spi: fsl-espi: fix controller deregistration
    2be39222d6ca spi: s3c64xx: fix controller deregistration
    b9d4b9c3457c spi: dln2: fix controller deregistration
    951694f9fab9 media: omap3isp: drop the use count of v4l2 pipeline
    e85f1e23168f media: i2c: ov08d10: fix image vertical start setting
    0b49f5dabc3a media: staging: imx: request mbus_config in csi_start
    2dde85b42abd media: i2c: imx412: Assert reset GPIO during probe
    97dbf8e69f3a media: dib8000: avoid division by 0 in dib8000_set_dds()
    492c5292540f media: pci: zoran: fix potential memory leak in zoran_probe()
    f3290d970bbe platform/x86: hp-wmi: Ignore backlight and FnLock events
    3ce8f3057c51 media: saa7164: add ioremap return checks and cleanups
    55be73783f11 spi: at91-usart: fix controller deregistration
    70c2ee9cab5c spi: qup: fix controller deregistration
    5a531cbb3bce spi: lantiq-ssc: fix controller deregistration
    38321b03b8c2 regulator: bd9571mwv: fix OF node reference imbalance
    0da216314247 regulator: act8945a: fix OF node reference imbalance
    feb17524aa4e media: videobuf2: Set vma_flags in vb2_dma_sg_mmap
    da769e8f8e34 regulator: rk808: fix OF node reference imbalance
    5b7471dce523 media: rc: streamzap: Error handling in probe
    0cc9251833bf media: rc: xbox_remote: heed DMA restrictions
    cd8f1633c3e8 regulator: max77650: fix OF node reference imbalance
    e46b3b0c9c44 regulator: mt6357: fix OF node reference imbalance
    8c7a281a9922 staging: media: atomisp: Disallow all private IOCTLs
    f367ddf1299e spi: atmel: fix controller deregistration
    725b90ce70a7 spi: bcm63xx: fix controller deregistration
    fd10fb4c33bd media: i2c: ov8856: free control handler on error in ov8856_init_controls()
    6467d656e689 media: uvcvideo: Enable VB2_DMABUF for metadata stream
    0bc4cf1a6ba0 HID: playstation: Clamp num_touch_reports
    df870e104571 exit: Sleep at TASK_IDLE when waiting for application core dump
    0b8167e83647 LoongArch: Use per-root-bridge PCIH flag to skip mem resource fixup
    07d190e4ec68 LoongArch: Fix potential ADE in loongson_gpu_fixup_dma_hang()
    db7f65df10bd KVM: arm64: Fix initialisation order in __pkvm_init_finalise()
    70d12291805a KVM: arm64: vgic: Fix IIDR revision field extracted from wrong value
    42dd1c91f993 f2fs: fix node_cnt race between extent node destroy and writeback
    88b98e3cfb92 f2fs: fix incorrect multidevice info in trace_f2fs_map_blocks()
    72ec0749a1ba f2fs: fix fiemap boundary handling when read extent cache is incomplete
    a2bcf16cdf79 f2fs: add READ_ONCE() for i_blocks in f2fs_update_inode()
    ebeb70e29e37 mptcp: fix scheduling with atomic in timestamp sockopt
    a79bafdd4b63 mptcp: sockopt: set timestamp flags on subflow socket, not msk
    bd36fb4f9446 mptcp: use MPTCP_RST_EMPTCP for ACK HMAC validation failure
    23e881c7fedb mptcp: use MPJoinSynAckHMacFailure for SynAck HMAC failure
    114b4a6d4ede mptcp: fastclose msk when linger time is 0
    ecc36a82ecfc RDMA/vmw_pvrdma: Fix double free on pvrdma_alloc_ucontext() error path
    e3dc3a2fb05f RDMA/rxe: Reject unknown opcodes before ICRC processing
    539cabb7b2d8 RDMA/rxe: Reject non-8-byte ATOMIC_WRITE payloads
    e01a957561f6 RDMA/ocrdma: Don't NULL deref uctx on errors in ocrdma_copy_pd_uresp()
    a13c2ac4d480 RDMA/mlx5: Fix error path fall-through in mlx5_ib_dev_res_srq_init()
    c5dc30da9900 RDMA/mlx4: Fix resource leak on error in mlx4_ib_create_srq()
    92582c6978d9 power: supply: max17042: avoid overflow when determining health
    27f7c024ede4 PCI/AER: Stop ruling out unbound devices as error source
    3937fa851992 PCI/AER: Clear only error bits in PCIe Device Status
    b1e9f2d58707 mm/damon/sysfs-schemes: protect memcg_path kfree() with damon_sysfs_lock
    971f17f5d910 KVM: x86: check for nEPT/nNPT in slow flush hypercalls
    ba7f71b6161c smb: client: validate dacloffset before building DACL pointers
    ef6495d4df6e smb/client: fix out-of-bounds read in symlink_data()
    dffb44b2e06a smb/client: fix out-of-bounds read in smb2_compound_op()
    e5c93847bf03 s390/debug: Reject zero-length input in debug_input_flush_fn()
    fb4ae739811d RDMA/hns: Fix unlocked call to hns_roce_qp_remove()
    c741433f6c8d openvswitch: vport: fix self-deadlock on release of tunnel ports
    9a4d7222c095 nvmet: avoid recursive nvmet-wq flush in nvmet_ctrl_free
    d525ecf92228 nvme-apple: drop invalid put of admin queue reference count
    4af2e558e6fd md/raid10: fix divide-by-zero in setup_geo() with zero far_copies
    2ae0afd98432 libceph: Fix slab-out-of-bounds access in auth message processing
    470822125b62 lib/scatterlist: fix temp buffer in extract_user_to_sg()
    3f17500e86d7 lib/scatterlist: fix length calculations in extract_kvec_to_sg
    2aa77a18dc7f lib/crypto: mpi: Fix integer underflow in mpi_read_raw_from_sgl()
    bb0988ed4f2e isofs: validate block number from NFS file handle in isofs_export_iget
    c9b37c8b73f6 isofs: validate Rock Ridge CE continuation extent against volume size
    5489c98bc681 dm-verity-fec: correctly reject too-small hash devices
    2e28bb9cc39f dm-verity-fec: correctly reject too-small FEC devices
    ae9cd0b46b18 eventfs: Hold eventfs_mutex and SRCU when remount walks events
    f0b0b09d9840 dm: fix a buffer overflow in ioctl processing
    16fc9f57b5d7 dm: don't report warning when doing deferred remove
    12161e03d33a dm-thin: fix metadata refcount underflow
    c2670ec4aa49 btrfs: fix double free in create_space_info() error path
    f7126b0b2455 ASoC: qcom: q6apm: remove child devices when apm is removed
    3141d8b00cad ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
    cb25b46a8dbe ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
    ef1b78a68675 ASoC: Intel: bytcr_wm5102: Fix MCLK leak on platform_clock_control error
    a06bd365a587 ASoC: fsl_easrc: fix comment typo
    d91e616474c6 ASoC: amd: yc: Add HP OMEN Gaming Laptop 16-ap0xxx product line in quirk table
    88f32a6806c8 cpuidle: powerpc: avoid double clear when breaking snooze
    47bc7a03449c clk: microchip: mpfs-ccc: fix out of bounds access during output registration
    be8af24ff376 clk: imx: imx8-acm: fix flags for acm clocks
    d79e92161b65 spi: topcliff-pch: fix use-after-free on unbind
    5f08cbdce0f3 thermal/drivers/sprd: Fix raw temperature clamping in sprd_thm_rawdata_to_temp
    c040f6c5402c thermal/drivers/sprd: Fix temperature clamping in sprd_thm_temp_to_rawdata
    50dfaf4a0277 udf: reject descriptors with oversized CRC length
    82bc89fbb82d ibmveth: Disable GSO for packets with small MSS
    9415a3fbf677 hv_sock: fix ARM64 support
    a0ea2ee6ec05 gpio: of: clear OF_POPULATED on hog nodes in remove path
    476254a6c87c extcon: ptn5150: handle pending IRQ events during system resume
    2a5ed5055d1e cifs: change_conf needs to be called for session setup
    ff519f87c36b cifs: abort open_cached_dir if we don't request leases
    3d2ecbd444b0 block: add pgmap check to biovec_phys_mergeable
    0d7e7235bc54 af_unix: Reject SIOCATMARK on non-stream sockets
    d6c7f32094d6 hwmon: (corsair-psu) Close HID device on probe errors
    39f0604bf1ae clk: rk808: fix OF node reference imbalance
    0fc5303fa33d hwmon: (ltc2992) Fix u32 overflow in power read path
    66daaf79de20 hwmon: (ltc2992) Clamp threshold writes to hardware range
    c9a3b2fb4003 parisc: Fix IRQ leak in LASI driver
    f94450ce5053 net: wwan: t7xx: validate port_count against message length in t7xx_port_enum_msg_handler
    21d70744e6d3 net/rds: handle zerocopy send cleanup before the message is queued
    eca62bb0569d ip6_gre: Use cached t->net in ip6erspan_changelink().
    d3bd80404979 net: libwx: fix VF illegal register access
    6162e8212e88 sound: ua101: fix division by zero at probe
    0653c0516234 net: rtnetlink: zero ifla_vf_broadcast to avoid stack infoleak in rtnl_fill_vfinfo
    9a80c458320e mtd: spi-nor: debugfs: fix out-of-bounds read in spi_nor_params_show()
    895ebbedf883 fanotify: fix false positive on permission events
    f39501ea776f staging: vme_user: fix root device leak on init failure
    1108b8722b9f spi: s3c64xx: fix NULL-deref on driver unbind
    487f65651549 spi: zynqmp-gqspi: fix controller deregistration
    5105f3e6b2df Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_state_change_cb()
    ab77c8bc3026 Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_new_connection_cb()
    6cb7f67bc28d Bluetooth: hci_event: Fix OOB read and infinite loop in hci_le_create_big_complete_evt
    1e1e509b6fd2 Bluetooth: virtio_bt: validate rx pkt_type header length
    ed41c81d30b2 Bluetooth: virtio_bt: clamp rx length before skb_put
    4aec732807c5 selinux: prune /sys/fs/selinux/disable
    01231051fa45 selinux: shrink critical section in sel_write_load()
    ebd425067290 selinux: don't reserve xattr slot when we won't fill it
    c2efc4956981 ipv6: xfrm6: release dst on error in xfrm6_rcv_encap()
    3bf4e93ed085 xfrm: provide message size for XFRM_MSG_MAPPING
    0f39c2626617 powerpc/kdump: fix KASAN sanitization flag for core_$(BITS).o
    cdbd10975b96 ALSA: firewire-tascam: Do not drop unread control events
    b0c0d44adb55 usb: ulpi: fix memory leak on ulpi_register() error paths
    20284bf5cc84 USB: serial: option: add Telit Cinterion LE910Cx compositions
    9b92535cb729 USB: omap_udc: DMA: Don't enable burst 4 mode
    91c3634bc6ac ALSA: usb-audio: Fix UAC3 cluster descriptor size check
    e0e3dcf48189 ALSA: usb-audio: Avoid potential endless loop in convert_chmap_v3()
    a3c42466f45c ALSA: usb-audio: midi2: Restart output URBs on resume
    d06d937b0a4c usb: usblp: fix uninitialized heap leak via LPGETSTATUS ioctl
    6e29c32a2721 usb: usblp: fix heap leak in IEEE 1284 device ID via short response
    ed4168d1a50f wifi: brcmfmac: Fix potential use-after-free issue when stopping watchdog task
    c3d7b90dc950 wifi: b43: enforce bounds check on firmware key index in b43_rx()
    fe75fa1ac9a9 wifi: mac80211: remove station if connection prep fails
    83226c71af53 wifi: ath5k: do not access array OOB
    95fcb436586d wifi: rsi: fix kthread lifetime race between self-exit and external-stop
    03584528bfff wifi: mac80211: drop stray 'static' from fast-RX rx_result
    1baaeb6adecb wifi: b43legacy: enforce bounds check on firmware key index in RX path
    d04bc2355392 wifi: mt76: mt7921: fix ROC abort flow interruption in mt7921_roc_work
    e451c325b000 wifi: mt76: mt7921: fix a potential clc buffer length underflow
    640b4c00fb0e exit: prevent preemption of oopsing TASK_DEAD task
    e4bbd3521db0 bpf: Don't mark STACK_INVALID as STACK_MISC in mark_stack_slot_misc
    aa71ab2cc929 selftests/bpf: validate fake register spill/fill precision backtracking logic
    2fcd619caecb bpf: handle fake register spill to stack with BPF_ST_MEM instruction
    f013c1dafe93 selftests/bpf: validate precision logic in partial_stack_load_preserves_zeros
    c05c8db19cd3 bpf: track aligned STACK_ZERO cases as imprecise spilled registers
    9d2cf5a4a378 selftests/bpf: validate zero preservation for sub-slot loads
    d3b398ee3404 bpf: preserve constant zero when doing partial register restore
    6d40191708e1 selftests/bpf: validate STACK_ZERO is preserved on subreg spill
    57f41f1eac13 bpf: preserve STACK_ZERO slots on partial reg spills
    c994886689fe selftests/bpf: add stack access precision test
    e4da60feca4d bpf: support non-r10 register spill/fill to/from stack in precision tracking
    36aa34f42cb6 net/sched: sch_red: Replace direct dequeue call with peek and qdisc_dequeue_peeked
    898a1751b620 KVM: SVM: check validity of VMCB controls when returning from SMM
    695b491dc3f2 dmaengine: idxd: Fix leaking event log memory
    5ba95b119aa7 dmaengine: idxd: Fix crash when the event log is disabled
    0305e7118451 net: txgbe: fix RTNL assertion warning when remove module
    db104b0d8a78 flow_dissector: do not dissect PPPoE PFC frames
    da54b3039d43 net: Fix icmp host relookup triggering ip_rt_bug
    d51bf43193b1 iommu/amd: serialize sequence allocation under concurrent TLB invalidations
    c28c87d9a389 iommu/amd: Use atomic64_inc_return() in iommu.c
    488e386484ec KVM: x86: Fix shadow paging use-after-free due to unexpected GFN
    4772032a2c62 rxrpc: Fix rxrpc_input_call_event() to only unshare DATA packets
    4d08401aa13f ext4: validate p_idx bounds in ext4_ext_correct_indexes
    e3bf143b1e98 rxrpc: Fix potential UAF after skb_unshare() failure
    0d645c6d13fa spi: meson-spicc: Fix double-put in remove path
    e2c2b044458c x86/shstk: Prevent deadlock during shstk sigreturn
    21159d8b335a drm/amd/display: Do not skip unrelated mode changes in DSC validation
    c79cf4232160 x86: shadow stacks: proper error handling for mmap lock
    4a0bb8f9f71b spi: rockchip: fix controller deregistration
    327a64241f30 ASoC: SOF: Don't allow pointer operations on unconfigured streams
    cf3eb7c8e705 iommufd: Fix a race with concurrent allocation and unmap
    3bb92bac4e27 ACPI: video: force native backlight on HP OMEN 16 (8A44)
    95242430c136 ACPI: CPPC: Fix related_cpus inconsistency during CPU hotplug
    419d6c640da7 ACPI: scan: Use acpi_dev_put() in object add error paths
    4f312c30f036 fbdev: udlfb: add vm_ops to dlfb_ops_mmap to prevent use-after-free
    ce905b65e649 ipmi:si: Return state to normal if message allocation fails
    2418e4b21fb1 ipmi: Check event message buffer response for bad data
    67c44e0deba9 ipmi: Add limits to event and receive message requests
    1f678d13e939 scsi: target: configfs: Bound snprintf() return in tg_pt_gp_members_show()
    bffef0acec9c netfilter: reject zero shift in nft_bitwise
    6bd17925bd68 net: ipv6: fix NOREF dst use in seg6 and rpl lwtunnels
    50c6a1f05973 ALSA: caiaq: fix usb_dev refcount leak on probe failure
    be0376affcaf drm/amdgpu: fix zero-size GDS range init on RDNA4
    8e8be63465a5 ipv6: rpl: reserve mac_len headroom when recompressed SRH grows
    e4389fb74cec ALSA: caiaq: Don't abort when no input device is available
    be62c8bb03b6 ALSA: caiaq: Fix potentially leftover ep1_in_urb at error path
    68532b09cbfc driver core: Add kernel-doc for DEV_FLAG_COUNT enum value
    b69933e97efe crypto: authencesn - reject short ahash digests during instance creation
    e3cebcde0114 seg6: fix seg6 lwtunnel output redirect for L2 reduced encap mode
    262152ec3710 scsi: sd: fix missing put_disk() when device_add(&disk_dev) fails
    8a1fc8d698ac rtmutex: Use waiter::task instead of current in remove_waiter()
    a954061b334e ntfs3: fix integer overflow in run_unpack() volume boundary check
    bf7ac4a1d3bf ntfs3: add buffer boundary checks to run_unpack()
    98f4ba3480b9 ktest: Fix the month in the name of the failure directory
    9d8fd84aab19 IB/core: Fix zero dmac race in neighbor resolution
    35f6b3281efd dm mirror: fix integer overflow in create_dirty_log()
    c5a45d14234b crypto: atmel-sha204a - Fix potential UAF and memory leak in remove path
    5281e6e23023 crypto: atmel-tdes - fix DMA sync direction
    3061c9bfb3f5 crypto: ccree - fix a memory leak in cc_mac_digest()
    5b71db0780f1 crypto: hisilicon - Fix dma_unmap_single() direction
    3f92c1de3bf1 crypto: atmel-ecc - Release client on allocation failure
    b63f1e2f0e31 crypto: atmel-aes - Fix 3-page memory leak in atmel_aes_buff_cleanup
    d78ee361b365 crypto: arm64/aes - Fix 32-bit aes_mac_update() arg treated as 64-bit
    4b7d07747400 can: ucan: fix devres lifetime
    204028af77a2 Bluetooth: hci_event: fix potential UAF in SSP passkey handlers
    6cbf21775ee6 taskstats: set version in TGID exit notifications
    ab5fdcd53564 tcp: call sk_data_ready() after listener migration
    8bcc1cd237ab inotify: fix watch count leak when fsnotify_add_inode_mark_locked() fails
    33698bd1b2db md/raid5: validate payload size before accessing journal metadata
    09880592f5a9 md/raid5: fix soft lockup in retry_aligned_read()
    1bc1107a3a40 ext4: fix missing brelse() in ext4_xattr_inode_dec_ref_all()
    ab6da97bc310 ext4: fix bounds check in check_xattrs() to prevent out-of-bounds access
    8bbed28f6b42 io_uring/poll: fix multishot recv missing EOF on wakeup race
    d26f8c361f75 mtd: docg3: fix use-after-free in docg3_release()
    980d6ba22747 mtd: docg3: Convert to platform remove callback returning void
    ddb188b88d55 KVM: nSVM: Add missing consistency check for nCR3 validity
    23ccf4affa6c KVM: nSVM: Add missing consistency check for EFER, CR0, CR4, and CS
    de6d8562a9cf KVM: nSVM: Clear tracking of L1->L2 NMI and soft IRQ on nested #VMEXIT
    c0095cef7303 KVM: nSVM: Clear EVENTINJ fields in vmcb12 on nested #VMEXIT
    83754e459c4b KVM: nSVM: Clear GIF on nested #VMEXIT(INVALID)
    ddc242a7bb44 KVM: nSVM: Always inject a #GP if mapping VMCB12 fails on nested VMRUN
    d218a0e8a63c KVM: nSVM: Use vcpu->arch.cr2 when updating vmcb12 on nested #VMEXIT
    263640149d81 KVM: nSVM: Ensure AVIC is inhibited when restoring a vCPU to guest mode
    36f36a6e4e74 KVM: SVM: Explicitly mark vmcb01 dirty after modifying VMCB intercepts
    3ac9d4241d20 KVM: SVM: Inject #UD for INVLPGA if EFER.SVME=0
    1709418535a8 KVM: nSVM: Sync interrupt shadow to cached vmcb12 after VMRUN of L2
    702ce67817de KVM: nSVM: Sync NextRIP to cached vmcb12 after VMRUN of L2
    15003179c74d KVM: nSVM: Mark all of vmcb02 dirty when restoring nested state
    35053cdec119 KVM: x86: Defer non-architectural deliver of exception payload to userspace read
    f3deabe0f5ac userfaultfd: allow registration of ranges below mmap_min_addr
    14c643ecdc42 mm/damon/core: use time_in_range_open() for damos quota window start
    d975c077fbdc rtc: ntxec: fix OF node reference imbalance
    f92cc1d2c0b4 tpm: tpm_tis: stop transmit if retries are exhausted
    2e0fd1cb4de4 tpm: tpm_tis: add error logging for data transfer
    a866e2b1c65e crypto: talitos - rename first/last to first_desc/last_desc
    00463d5f864a crypto: talitos - fix SEC1 32k ahash request limitation
    a72815210182 arm64: dts: ti: am62-verdin: Enable pullup for eMMC data pins
    00b1d0f4e7bb mmc: sdhci-of-dwcmshc: Disable clock before DLL configuration
    0aaa43198645 mmc: block: use single block write in retry
    fdabbc881930 randomize_kstack: Maintain kstack_offset per task
    c03556448d47 power: supply: axp288_charger: Do not cancel work before initializing it
    703fb43600c2 LoongArch: Show CPU vulnerabilites correctly
    41aec1d85b88 tpm: avoid -Wunused-but-set-variable
    64282a745897 extract-cert: Wrap key_pass with '#ifdef USE_PKCS11_ENGINE'
    4b2738b93eda libceph: Prevent potential null-ptr-deref in ceph_handle_auth_reply()
    92e7c209036d ipv4: icmp: validate reply type before using icmp_pointers
    2fd4f8b74930 RDMA/rxe: Validate pad and ICRC before payload_size() in rxe_rcv
    3e75d06cf3e4 drm/arcpgu: fix device node leak
    fa0c4283efef net: ks8851: Avoid excess softirq scheduling
    640a7631d31d net: ks8851: Reinstate disabling of BHs around IRQ handler
    f0858e1d5624 net/smc: avoid early lgr access in smc_clc_wait_msg
    e98bd8888e3f net: txgbe: fix firmware version check
    8fdbb6262a4a net: rds: fix MR cleanup on copy error
    ff78ed177a66 net: qrtr: ns: Free the node during ctrl_cmd_bye()
    4069329eeba0 tools/accounting: handle truncated taskstats netlink messages
    d61482be4aae rxrpc: Fix re-decryption of RESPONSE packets
    f1c6bd0cc786 rxrpc: Fix rxkad crypto unalignment handling
    c4b8f32e73ea rxrpc: Fix memory leaks in rxkad_verify_response()
    97a97090872f iio: adc: ad7768-1: fix one-shot mode data acquisition
    528763fd6bb8 ALSA: pcmtest: Fix resource leaks in module init error paths
    c21ef73713eb ALSA: pcmtest: fix reference leak on failed device registration
    99c8060c3b33 ALSA: 6fire: Fix input volume change detection
    f537e3ad6960 ALSA: caiaq: Handle probe errors properly
    f4dfbdc1be34 ALSA: caiaq: Fix control_put() result and cache rollback
    e794e1763e80 ALSA: core: Fix potential data race at fasync handling
    fafab8b3cd57 io_uring/poll: ensure EPOLL_ONESHOT is propagated for EPOLL_URING_WAKE
    cf522703d4f1 io_uring/poll: fix signed comparison in io_poll_get_ownership()
    89ca27d6d3b2 iio: adc: ti-ads7950: use iio_push_to_buffers_with_ts_unaligned()
    44100ed1bdce io_uring/timeout: check unused sqe fields
    2f4809a879f0 rbd: fix null-ptr-deref when device_add_disk() fails
    1627d6060b45 selftests/mqueue: Fix incorrectly named file
    5d1451cb2cf6 remoteproc: xlnx: Only access buffer information if IPI is buffered
    c9d2f7b9c38c parisc: _llseek syscall is only available for 32-bit userspace
    1b4039d8f4f6 nvme: respect NVME_QUIRK_DISABLE_WRITE_ZEROES when wzsl is set
    86bffea0b9f2 nvme-pci: add NVME_QUIRK_DISABLE_WRITE_ZEROES for Kingston OM3SGP4
    ec7f47706269 mfd: stpmic1: Attempt system shutdown twice in case PMIC is confused
    965d6162dd88 md/raid10: fix deadlock with check operation and nowait requests
    222055e6b406 erofs: fix the out-of-bounds nameoff handling for trailing dirents
    8555d6990432 ALSA: seq_oss: return full count for successful SEQ_FULLSIZE writes
    25ded535ee26 ALSA: ctxfi: Add fallback to default RSR for S/PDIF
    831074ec21b4 ALSA: aoa: i2sbus: fix OF node lifetime handling
    32e0b9255726 ext2: reject inodes with zero i_nlink and valid mode in ext2_iget()
    0f313eb6a8f6 net: qrtr: ns: Fix use-after-free in driver remove()
    3a5023627ab9 media: i2c: imx219: Check return value of devm_gpiod_get_optional() in imx219_probe()
    4a34fd6b04f9 lib/ts_kmp: fix integer overflow in pattern length calculation
    a34d96381bf8 Revert "ALSA: usb: Increase volume range that triggers a warning"
    72099f015d3c PCI: endpoint: pci-epf-ntb: Remove duplicate resource teardown
    2209fdae5c2f media: mtk-jpeg: fix use-after-free in release path due to uncancelled work
    e9ae00490d47 net: strparser: fix skb_head leak in strp_abort_strp()
    914c6456fcfc net: caif: clear client service pointer on teardown
    1fbe46d2b727 ALSA: control: Validate buf_len before strnlen() in snd_ctl_elem_init_enum_names()
    42dc622776f3 media: amphion: Fix race between m2m job_abort and device_run
    0ba03e06f037 of: unittest: fix use-after-free in testdrv_probe()
    9f1cbca178c0 crypto: pcrypt - Fix handling of MAY_BACKLOG requests
    9337ed5e777e f2fs: fix to detect potential corrupted nid in free_nid_list
    f99165ef0677 spi: imx: fix use-after-free on unbind
    8c43ed08643a um: drivers: call kernel_strrchr() explicitly in cow_user.c
    cc9b6303e7ea wifi: rtw88: check for PCI upstream bridge existence
    2d1f18efccdb zram: do not forget to endio for partial discard requests
    108f2cd13577 LoongArch: Add spectre boundry for syscall dispatch table
    29166a0e732f driver core: Don't let a device probe until it's ready
    886f97fa59d0 ocfs2: split transactions in dio completion to avoid credit exhaustion
    17b399cbb9fa device property: Make modifications of fwnode "flags" thread safe
    abc6bdcbc045 regset: use kvzalloc() for regset_get_alloc()
    e620378aab78 drm/amdgpu: Limit BO list entry count to prevent resource exhaustion
    be7c5dcfd3c7 drm/amdgpu: Use vmemdup_array_user in amdgpu_bo_create_list_entry_array
    c7f4dad62813 padata: Remove comment for reorder_work
    a11a12a9880a padata: Fix pd UAF once and for all
    0b60eb04b852 Bluetooth: MGMT: Fix possible UAFs
    d0b27c41aa09 firmware: google: framebuffer: Do not mark framebuffer as busy
    fd19eb1c7504 ibmasm: fix heap over-read in ibmasm_send_i2o_message()
    a672682d39dd ibmasm: fix OOB reads in command_file_write due to missing size checks
    fc7e9a74e322 misc: ibmasm: fix OOB MMIO read in ibmasm_handle_mouse_interrupt()
    28a2e047d037 leds: qcom-lpg: Check for array overflow when selecting the high resolution
    fa297e919d16 drm/nouveau: fix u32 overflow in pushbuf reloc bounds check
    8775fa6e2914 ALSA: usb-audio: Evaluate packsize caps at the right place
    e3a0ebd80ae6 usb: chipidea: core: allow ci_irq_handler() handle both ID and VBUS change
    82d050713073 usb: chipidea: otg: not wait vbus drop if use role_switch
    8429841d12ca usb: xhci: Make usb_host_endpoint.hcpriv survive endpoint_disable()
    d1905dbbb7c0 ALSA: usb-audio: Fix Audio Advantage Micro II SPDIF switch
    610ba605a4f7 ALSA: usb-audio: Avoid false E-MU sample-rate notifications
    ab5ba9fd1387 ALSA: usb-audio: stop parsing UAC2 rates at MAX_NR_RATES
    4d922539ad7d Linux 6.6.139
    ff6fc65b3bf7 x86/CPU/AMD: Prevent improper isolation of shared resources in Zen2's op cache
    8f907d345bae ptrace: slightly saner 'get_dumpable()' logic

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 68c3c07ef6..d8d3d69f19 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9708fab99d7eb8962dda82d642c468a32b6682fa"
-SRCREV_meta ?= "0a6ad7549c97f8703f1f742f73ee65d29d121958"
+SRCREV_machine ?= "742fd3c3537c966272314e48f67397f0e1d622d7"
+SRCREV_meta ?= "b043ea37245d4c669239b28a30c78c390bdafdcc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.138"
+LINUX_VERSION ?= "6.6.140"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 52d89c713d..0fd9c36bd8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.138"
+LINUX_VERSION ?= "6.6.140"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "72c2c9b6014dd199bb70e07e19931b8691fa08e1"
-SRCREV_meta ?= "0a6ad7549c97f8703f1f742f73ee65d29d121958"
+SRCREV_machine ?= "cd0d6d62e0e4ff344241d89f37cd6d305e1afb85"
+SRCREV_meta ?= "b043ea37245d4c669239b28a30c78c390bdafdcc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index e077808f28..dc978f240e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9d8edc5598e5c5f17ce696ce032e8dc654858450"
-SRCREV_machine:qemuarm64 ?= "c6600bc98dbafed4fcbd6f1204da6b41ef5feec2"
-SRCREV_machine:qemuloongarch64 ?= "ad053e3390f755311a4d87911c13039387767122"
-SRCREV_machine:qemumips ?= "97c272b944970f93ef93eb87f54899ccb26671f1"
-SRCREV_machine:qemuppc ?= "8dfba699cafc5b5d5f50cb8f270db9b8ae112571"
-SRCREV_machine:qemuriscv64 ?= "ad053e3390f755311a4d87911c13039387767122"
-SRCREV_machine:qemuriscv32 ?= "ad053e3390f755311a4d87911c13039387767122"
-SRCREV_machine:qemux86 ?= "ad053e3390f755311a4d87911c13039387767122"
-SRCREV_machine:qemux86-64 ?= "ad053e3390f755311a4d87911c13039387767122"
-SRCREV_machine:qemumips64 ?= "2744d8ab5ccca406c0acc17c414ff4c8e186708f"
-SRCREV_machine ?= "ad053e3390f755311a4d87911c13039387767122"
-SRCREV_meta ?= "0a6ad7549c97f8703f1f742f73ee65d29d121958"
+SRCREV_machine:qemuarm ?= "0aa210fedb89bfb9577bc20b56cc674437f85843"
+SRCREV_machine:qemuarm64 ?= "655d3dc028f830d71d9565ec8302a0e339a2de2f"
+SRCREV_machine:qemuloongarch64 ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
+SRCREV_machine:qemumips ?= "b547c71f2db45462626f69a4e4bffad43ffaeddc"
+SRCREV_machine:qemuppc ?= "c1de905a03cfd9cf9de51657e7fd20ec6fb7d078"
+SRCREV_machine:qemuriscv64 ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
+SRCREV_machine:qemuriscv32 ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
+SRCREV_machine:qemux86 ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
+SRCREV_machine:qemux86-64 ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
+SRCREV_machine:qemumips64 ?= "6f0fadc3449cfed9ceac3cce845dfb9b70f9affd"
+SRCREV_machine ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
+SRCREV_meta ?= "b043ea37245d4c669239b28a30c78c390bdafdcc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3b9f64db049687c0d38b4b3ef2f297f0642179af"
+SRCREV_machine:class-devupstream ?= "eac8889a3a1c81d7113cc4656b9420e84c379cf5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.138"
+LINUX_VERSION ?= "6.6.140"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


