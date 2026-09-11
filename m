Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927FBC88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:13:53 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40350.1789136031877485099
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mq5u1yL3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49e668491f3so3148625e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 07:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789136030; x=1789740830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozLjZbbqwzLuCcWhdMfAmf5fIXMVOvseExVm4g/2X8Y=;
        b=Mq5u1yL3c4Hf7PHBle96951PuJVM6/QedJmtDgy2kZZigRgbVvHmtsPz+CyKA0RmB2
         e08Acyw5MxSUSZReoLfknXQlmLeBh/FyiEGvuoBwalnWEy+q4jQ3YNQCZff5+nPf6IfP
         8fW8tHDVvSLvF+V+50ej4MhDsbQKlV3pbIETc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136030; x=1789740830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ozLjZbbqwzLuCcWhdMfAmf5fIXMVOvseExVm4g/2X8Y=;
        b=IXr5BtMiciwTW1wBtUYxkMJPhloPcCfNVQnXOVu5mTw59yvrwZkgmaFHjr9mjv5NPI
         bT3XjFWLw5XlDZckua7ZRtLPa7VDBA05MZMFo7BTyxGoaOkd6Tabw4S/B/u8AqnLnxBG
         NBOqA8vDHsU7+YT1vjAO7cMak1M7mS1uvsngWWM2craPwHV90Pkh0zRY/vf45SWotUXM
         /85BLVNZi/J9UamXNsPd4cbHvE8ZX2betjEx2lNeHKqYpyi9ISPeti26mqrQIqqOvALp
         6eYV5/Q00cRdFnJ69UigB3gbs90IM6NslmtOVGGescPRefX/O4/OdXfp3jRGAJKmGMt2
         llTA==
X-Gm-Message-State: AFuF++kyIFPVCWvC6XxBzUzZO3JCtlxQJ5bzWvKmS2JbJ0vFKajzXwrM
	gzqihrXLY2NT8sXj7mFHA3nmX0IMm+d+Xvb3xLqWvCh5SFgVIPVrt3vJ95f/87imUrAIN7WqDic
	Iuefn934=
X-Gm-Gg: AYBFou3KfvJioHQesfBiRaYRdPuF90Iz+0g9fyK6t2N6Q0N9TM68GzlI4ZgA35idQ5c
	iW+2zltH/PqLfb8+y9eh5X8c7Y/c9B4LmyzI8qqNh9NsC2MjQeJNBQ7TpjlnyF9n2aTK5f4Yamt
	B4iLAmXHEkE6vl98/t8IWDfXt/6fapXVrtihaOv8eXQZuLBSa1+f2IBLkSwAnFoV6gDa1bMsSWx
	O7RK+0WWBqil1V1R46+QZHAOyLwzdtQSa6V2m2/ea8/Rx1NpBAjfDAnEXvmFjmYqGN56Pu4MgK8
	znHUdIU3+ENjiBDLsRQEZUQHJMqTXKl4wVvOun1fcPQq5jGTHxspBH3KbJecF91ubJwWMKOn/6J
	TH0fR+PVDCXbQOnIf71uFhghibaIaa3Md76fWHCib0NNV+c6BaOoXDch+Ueok840ja8cv23e57d
	HN0avRP7owKNcH6cY2aAOQAiohO2A1i2jW4R9laW9H7mX1TL/K7qBygV2FP24mdX3wvmOoI7mKW
	/Crnr/a2jvJKfM3F1NCMmEAIxR6Qw==
X-Received: by 2002:a05:600d:864d:10b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49e61983764mr38649305e9.2.1789136029684;
        Fri, 11 Sep 2026 07:13:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c0d0:78c1:8753:128b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm267851205e9.6.2026.09.11.07.13.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:13:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] ffmpeg: Upgrade 9.0 -> 9.0.1
Date: Fri, 11 Sep 2026 15:13:46 +0100
Message-ID: <20260911141348.3434533-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 14:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245651

+version 9.0.1:
+ avformat/webp_anim_dec: use ffio_read_size for ICCP and EXIF chunks
+ avformat/rtpenc_av1: do not narrow the OBU size to (long)
+ avformat/rtpenc_av1: Check num_lebs
+ avformat/rtpenc_av1: bound OBU size in the keyframe search loop
+ avformat/gopher: Fix CRLF injection
+ avformat/rtpenc_vc2hq: reject data units larger than the RTP payload buffer
+ avformat/dashdec: reject a negative fragment index
+ avformat/hevc: reject hvcC NAL arrays that overflow the 16-bit count
+ avformat/mpegenc: reject stream counts that overflow the system header
+ avformat/mpegenc: pass buffer size into put_system_header()
+ avformat/librist: honor the caller buffer size in librist_read
+ avformat/scd: reject zero-channel tracks
+ avcodec/dolby_e: Add error recovery when parse_mantissas run out of bits
+ avfilter/af_pan: check the id of named input channels before use
+ swscale: avoid overflow in fast bilinear edge handling
+ avformat/shared: Use correct printf specifier
+ Revert "lavfi/bwdif: fix heap-buffer-overflow with small height videos"
+ avfilter/vf_bwdif: fix line boundary checks for >8 bits content
+ avformat/rawutils: reject raw RGB frames that do not fit an AVPacket
+ avcodec/nvenc: write AV1 timecode metadata in AV1 syntax
+ avcodec/utils: add ff_alloc_timecode_metadata_av1()
+ avcodec/utils: factor the timecode fields out of ff_alloc_timecode_sei
+ vulkan_encode_av1: set primary_ref_frame to a reference name, not a slot
+ avformat/mov: reject a trun sample count the input cannot hold
+ RELEASE_NOTES: Based on the version from 8.0
+ avformat/mp3enc: fix underflow of the LAME encoder delay
+ avformat/os_support: fix return value of win32_rename
+ vulkan_encode: fix leak and swallowed errors in init_base_units()
+ avfilter/dnn: fix async teardown race condition in all backends
+ avcodec/tiff: reject inflate output shorter than the strip
+ avformat/dashdec: check NULL pointer before use str_end_offset
+ avformat/dashdec: check NULL pointer of av_strtok value before use it
+ avfilter/vf_scale_cuda: fix non-scaling format conversion
+ fftools/opt_common: fix format string bug in print_program_info
+ avformat/dashdec: fix integer truncation in calc_max_seg_no()
+ swscale/x86: fix SIGILL in u8 SCALE on SSE4-only CPUs
+ avdevice/android_camera: fix OOB read in metadata parsing
+ avformat/dashdec: don't stop at the first input EOF
+ avformat/iamf_parse: check that num_sub_mixes and num_audio_elements in Mix Presentations are not zero
+ avformat/iamf_parse: bound the output mix gain duration by the audio elements
+ avcodec/cbs_h266: size vps_direct_ref_layer_flag for the full layer range
+ avcodec/vulkan/ffv1_dec_setup: act on the slice header rejection
+ avcodec/ffv1dec: reject a remap that produces zero entries
+ avcodec/ffv1dec: mark the slice damaged when its remap fails
+ avcodec/vulkan/ffv1_dec_setup: bound the fltmap write
+ avcodec/vulkan/ffv1_dec_setup: test mul_count as unsigned
+ avcodec/vulkan/ffv1_dec_setup: reject a remap that produces zero entries
+ avcodec/pgssubdec: always give an output rect a palette
+ scale_d3d11: Fix hw_frame_ctx reference leak
+ avcodec/cfhd: reject transform-2 output wider than the plane
+ avformat/rtsp: clear authentication on cross-origin redirects
+ avcodec/dovi_rpuenc: normalize vdr_dm_metadata_present to 0/1
+ avcodec/dovi_rpuenc: validate vdr_rpu_id from the input metadata
+ avcodec/bsf/dovi_rpu: handle update_rpu() returning no RPU
+ avcodec/dovi_rpudec: bound num_x/y_partitions
+ avcodec/dovi_rpuenc: validate the data mapping before generation
+ avfilter/af_arnndn: pad the DCT input buffers to the read length
+ doc/nut.texi: point at the latest spec in the git repository
+ avformat/mov: bound sgpd sync entry_count by the atom size
+ avcodec/rscc: do not leave uninitilized data when the input is too short
+ avcodec/dvbsub_parser: avoid signed overflow in the capacity check
+ avformat/tls_openssl: bind peer identity for numeric-IP verify
+ avformat/codec2: avoid integer overflow in packet size and duration
+ avfilter/vf_xpsnr: avoid a zero block size on small frames
+ avcodec/cbs_av1: pad the ITU-T T.35 payload buffer
+ avcodec/screenpresso: reject deflate output shorter than the frame
+ avformat/hls: Enforce protocol checks when opening child playlists
+ avformat/hlsenc: Fix heap buffer overflow in parse_playlist()
+ avformat/hlsenc: Handle extensionless URIs in extract_segment_number()
+ avfilter/vf_lut3d: do not compute size*size before the size is validated
+ avfilter/vf_hqdn3d: support dynamic frame sizes
+ avfilter/vf_hqdn3d: reject unsupported frame parameter changes
+ avcodec/bsf/truehd_core: clear profile value on init()
+ avcodec/bsf/eac3_core: clear profile value on init()
+ avformat/iamf_parse: fix inverted subblock duration validation
+ avcodec/get_buffer: use frame pixel format instead of context
+ avformat/lcevc: add a log context parameter to all functions

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ffmpeg/{ffmpeg_9.0.bb => ffmpeg_9.0.1.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_9.0.bb => ffmpeg_9.0.1.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb
index 85a7b304b8e..a954234e7f1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            "
 
-SRC_URI[sha256sum] = "7f607a00dd0d28a729d5a4811205812eef01cf6ef6155025febb6f36a9062d52"
+SRC_URI[sha256sum] = "cf38e0e28c7e5605942c4a77755349b0145804a397af37eb1fb4c77cb237f635"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"

