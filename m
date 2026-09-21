Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661D6C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:08 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43875.1789974420653108450
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YxBs9YyD;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso18940445e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974419; x=1790579219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j0XF7N7Sj7YBrlzG7nmCs7I5DUF87KaykF3HdO6kzRk=;
        b=YxBs9YyDN3p5osLoFPDG6oZ6nj77PcEGType9qXa5IjAIc0NdJFbKu/KDDTJrvHXO6
         3r4ESJwC7NHWRiyna5RSXf/PXE9Eayno0ZzXP1vf7XEYS0kv1htw8Lwen4xNzvsuJxmx
         w+8llJqJ2m5dOR5eaBzOgz1voaQmII6+0S4n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974419; x=1790579219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j0XF7N7Sj7YBrlzG7nmCs7I5DUF87KaykF3HdO6kzRk=;
        b=Ir8Nfg+7nLyZK8Rjfvrz/bKNW/JWRPsFBakW6/CofbWL8O4JUkJZm5TUWof8UrO9u0
         VPgvd55q/KNdRr0uQG3UEA/4RZnWs6U+HX9ZczeT8Rvh3npGEeV0LIFKZcaFMnjIqUr5
         EI7ImW6EHrYMODsSXX4Wj6O3uk+MxQw+AbiV3KfMB2xi4GQI+X5QUbI/fLJ+xCWDg6ve
         SPVbmSjMqHxiTTccVSjE2K7p1UxfeMJJGOfJhzrLhJ7u9quPWlwAHWM62C0hMC8Aq+o6
         JLnmPUgjNyvvSiDPzMF4ASw2NurgYRQpvm8KVF0JzBlgLKehcCHogpb5rnbQ5K3om9aQ
         DlxQ==
X-Gm-Message-State: AFuF++k6rcNzoyjS5H9AI7a2zbDrF4Ta9MGBVxLEobBavqp6ui46u0e5
	/8OxOfYshP2HF7qBu3iF/iBRGQFLlLhXM2n2pxpl9ruO3HWAAhjKw2bgL2Y4lhxmu5+aemnSfh/
	Bmr9XFNw=
X-Gm-Gg: AYBFou33OvN9w5ihCcdgs+ikl3HvPRu+XONi0dU5t+1NURegOt4VJNksHgpFi83o67m
	Rlng9lSHSjs9ABd96plblMRWO829mccPoH4fqMSSeM1SAXJk+zIzImnX925jjZ9S9KWhehP7JuN
	IZtvQcQShTvpWSgsTKiPAEtHuPywwkkuf3bouGxSYDTcR8mGAdmHGx9FsZ4kM6uLJweyVP2LWNH
	LAWLxV5U7FCzmjLt+lRVTXllTxisSFXJvQuG5W1Vfp0LrN37yqgPIfL4HyP2fE/cLgy6bfpZ8E4
	Kk/vWFEUPiJx+IUKd680QYp+rSBxyFjGeHfRXb6FQUx3Aqr3dl9ZiBAtSlBVZJg70AAsw8ZNnSj
	4rOgVVciZ5zUJIB3p6AJw5GSLjmZg6p6nQ9OIgIcAPrljPy1q+StD4Pf7oP1mkJWBo83U0zZ3pa
	iu35+1Et4GTcc6yFCLm3PKVtbKsDTAKT6/dGNpAg2YbtTYva6IPLr6LeDRs83Kk8dQgNSQLg1G+
	/SouCGmLvHF3oq9BUp+jQbvcD0=
X-Received: by 2002:a05:600c:c48e:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49fc5687122mr116286125e9.8.1789974418482;
        Mon, 21 Sep 2026 00:06:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.06.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:06:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/20] ffmpeg: upgrade 9.0.1 -> 9.0.2
Date: Mon, 21 Sep 2026 08:06:37 +0100
Message-ID: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246288

version 9.0.2:
 avcodec/ppc/vp8dsp: store the 16 pixel wide rows at any alignment
 avfilter/vf_decimate: reject blocks smaller than one chroma sample
 avformat/genh: check for unsupported interlaved size 1 typ1 THP
 lavc/vvc: Prevent OOB write in sh_entry_points
 avcodec/vulkan_hevc: bound the per category reference counts in vk_hevc_start_frame
 avcodec/vulkan_hevc: bound the reference count in vk_hevc_start_frame
 avformat/pdvenc: add the AVClass pointer to PDVMuxContext
 avcodec/fflcms2: fix memory leak after cmsDeleteContext(NULL)
 avcodec/cbs_h266_syntax_template: fix ph_recovery_poc_cnt range
 avformat/http: free cookie parameters on parse failure
 avutil/opt: fix av_opt_is_set_to_default() on default-NAN options
 fftools: reject negative -t durations
 avcodec/hevc: don't error out on remaining slices of a skipped picture
 avcodec/vvc: Skip over the current picture in find_ref_idx
 avcodec/mips/vc1dsp_msa: Fix mspel functions
 avcodec/mips/hevcpred_msa: Fix compilation
 avcodec/vc1_block: don't drop the last macroblock when 1 bit remains
 avcodec/dovi_rpudec: strip zero padding
 avformat/dashdec: check fragment_timescale before division in refresh_manifest
 avutil/encryption_info: reject init info with zero-sized key IDs
 avformat/genh: check thp extradata read and allocation
 avformat/oggdec: check for integer overflow in buf_realloc
 vulkan_av1: fix out-of-bounds write of tile_sizes
 avcodec/cfhd: reject header tags after the frame buffer was allocated
 avcodec/cfhd: check the channel number after every tag
 avcodec/cfhd: reset the allocated band sizes when freeing the buffers
 avcodec/cook: require the channel mask to cover every subpacket channel
 avcodec/dvdsubenc: account for the byte alignment of each RLE line
 avfilter/vf_colorconstancy: free only allocated buffers on setup failure
 avcodec/hap: do not hide the failure of the chunk table allocation
 avformat/mov: Allocate the array without clearing before read
 avformat/mov: do not zero a key string before reading it
 avformat/mov: bound the keys atom entry count by the atom size
 avcodec/vvc/dec: compare the CTU area in ibc_tl_init()
 avcodec/vvc/dec: free the tabs when pic_arrays_init() fails
 avcodec/vvc/thread: clear fc->ft when the frame thread is freed
 avfilter/vf_uspp: Fix qpcount
 avcodec/codec_internal: clarify docs for FF_CODEC_CAP_SKIP_FRAME_FILL_PARAM
 avfilter/f_metadata: avoid overread on long formatted output
 avformat/tls_mbedtls: set the expected hostname for numeric hosts
 libswscale/ppc/yuv2rgb_altivec: Fix heap buffer overflow in yuv2packedX
 swscale/ops_dispatch: account for the vertical filter taps in the tail copy
 swscale/ops_dispatch: pass the line strides to copy_lines() as ptrdiff_t
 swscale/uops: pad the horizontal filter weights to whole blocks
 avcodec/apac: reset bitstream_index unconditionally to avoid integer overflow
 avcodec/vorbisenc: dont assert on non finite input
 avcodec/rv34: do not copy an unused reference line in the edge emulation
 avcodec/rv34: do not await a negative reference-frame row
 avcodec/vp9: unref next_refs in vp9_decode_flush
 avcodec/vp8: do not await a negative reference-frame row
 avformat/vpk: Check the channel count before dividing in the last block
 avformat: Restore the container channel layout after a failed decoder open
 avcodec/dcadec: ignore reserved speaker positions in coded channel order
 avformat/matroskaenc: reserve space for BlockAdditionMapping even if Matroska muxer isn't enabled
 (fforge/pr/24457) ffmpeg: fix matching of non-apic stream specifiers
 avformat/cbs: move AV1 feature definition to their own header
 (fforge/pr/24399) avcodec/bsf/dca_core: clear profile value on init()
 avformat/sierravmd: require a 6bit palette in the probe
 libswscale: use unaligned read/write macros in planarCopyWrapper
 avformat/binka: reject truncated packet reads
 avfilter/acrossover: reject non-finite parameters
 avfilter/aiir: reject non-finite parameters
 avfilter/firequalizer: reject overflowing delays
 avcodec/wavpackenc: handle INT32_MIN samples
 avfilter/aecho: reject non-finite delays and decays
 libswresample/aarch64: Fix sign extension in audio conversion
 avcodec/audiotoolbox: use 64-bit channel masks
 avfilter/aarch64/vf_bwdif_init: Fix stride bound check
 avformat/dashenc: free http options on avio_open_dyn_buf failure
 avcodec/bmp: fix misaligned read in 16-bit decoding
 avcodec/huffyuv: seed the median predictor endian independently
 avformat/wvdec: convert flags to defines
 (fforge/pr/24299) avformat/iamf_writer: don't discard skip samples signaled through side data for Opus
 (fforge/pr/24295) avformat/movenc: fix crash when flushing a fragment with no data
 swscale/loongarch: fix buffer underflow in yuv2plane1_8_lsx/lasx
 (fforge/pr/24279) avcodec/h264_direct: do not read the other field's rows of colocated mb_type
 avcodec/h264_slice: clear the ER picture when starting a second field
 Revert "fftools/ffmpeg_sched: allow throttling decoder outputs"
 avcodec/libdav1d: fix leak of frames on failure
 avcodec/mips/cabac: Fix building on OpenBSD/mips64
 avcodec/pthread_frame: sync decoded side data to all worker threads
 (fforge/pr/24146) avcodec/h264_direct: await both fields of a colocated field pair
 avcodec/h264_direct: move check before loading things

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ak-ensure-target-directories-are-cre.patch |  2 +-
 .../ffmpeg/ffmpeg/makerace.patch              | 20 ++++++++++++-------
 .../{ffmpeg_9.0.1.bb => ffmpeg_9.0.2.bb}      |  2 +-
 3 files changed, 15 insertions(+), 9 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_9.0.1.bb => ffmpeg_9.0.2.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
index 3f523ddb014..a9c54971e42 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
@@ -1,4 +1,4 @@
-From cb0f8bf74b53130ceedb97af317840f76ddfce31 Mon Sep 17 00:00:00 2001
+From 01b4d2e905e79a6858078927c111ce96bd03b314 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 11 Dec 2025 19:55:46 +0100
 Subject: [PATCH] ffbuild/common.mak: ensure target directories are created
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch
index c2f87b25fb5..1788e8b98fc 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch
@@ -1,4 +1,7 @@
-An easy to reproduce make race:
+From 6d288ad39ceec639779b58d5a585ead599fe2997 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 11 Sep 2026 09:04:05 +0100
+Subject: [PATCH] An easy to reproduce make race:
 
 $ make libswscale/x86/uops_macros.gen.asm
 HOSTCC	libswscale/x86/uops_macros.gen.asm
@@ -8,18 +11,21 @@ It needs the missing directory creation dependency adding.
 
 Upstream-Status: Submitted [Sent to https://lists.ffmpeg.org/archives/list/ffmpeg-devel@ffmpeg.org/ 2026/9/11]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
- 
-Index: ffmpeg-9.0.1/libswscale/x86/Makefile
-===================================================================
---- ffmpeg-9.0.1.orig/libswscale/x86/Makefile
-+++ ffmpeg-9.0.1/libswscale/x86/Makefile
+---
+ libswscale/x86/Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libswscale/x86/Makefile b/libswscale/x86/Makefile
+index 0f7a3db..f56a5a4 100644
+--- a/libswscale/x86/Makefile
++++ b/libswscale/x86/Makefile
 @@ -1,3 +1,5 @@
 +OUTDIRS += $(SUBDIR)x86
 +
  OBJS                            += x86/rgb2rgb.o                        \
                                     x86/swscale.o                        \
                                     x86/yuv2rgb.o                        \
-@@ -31,6 +33,6 @@ $(SUBDIR)x86/ops_common.o: $(SUBDIR)x86/
+@@ -31,6 +33,6 @@ $(SUBDIR)x86/ops_common.o: $(SUBDIR)x86/uops_macros.gen.asm
  $(SUBDIR)x86/ops_int.o: $(SUBDIR)x86/uops_macros.gen.asm
  $(SUBDIR)x86/ops_float.o: $(SUBDIR)x86/uops_macros.gen.asm
  $(SUBDIR)x86/uops_macros.gen.asm: $(SRC_PATH)/libswscale/x86/uops_macros.asm.h \
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
index 07eff2a4e5e..4942e873ceb 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://makerace.patch \
            "
 
-SRC_URI[sha256sum] = "cf38e0e28c7e5605942c4a77755349b0145804a397af37eb1fb4c77cb237f635"
+SRC_URI[sha256sum] = "8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"

