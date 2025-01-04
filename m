Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC29E77199
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:06 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.18132.1735998116284958575
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MfigpJOi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2163dc5155fso179861875ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998115; x=1736602915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SmjYB+X6t7ckJQQV2I3UCpcjIipRajbP8bqj6FuQtgA=;
        b=MfigpJOiO3/ibquMSaLsn1VPzSpmeIV/ofyGljJUvvURBerkNx5nEVmQ9NKaxaYwZI
         q9oIuMlc1eq4FOhJRdATQ4Cy0GbGC8CqDmE7D6DII5h9GPxu/r4j31ZEgtgbVZ+IIoga
         mXCO526hmcnu33KeNDtY7X7eOpIbAu1v9x3JpvcFbCKiOGEFABa96tRz2rzj4qFdp1V0
         ze98MWv5611HDNMlz2u+jAbGl+DS2kGv9pUpcnAcm7yK1zyK/7IBlO88jr9qQ4Jk7Snl
         gj9/3OiaFq1+PYnrJzYP89bmx7mq/qHo5O1IOwV0kr0NGk3UuTP2qZKB+Bzld5olulAi
         FuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998115; x=1736602915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SmjYB+X6t7ckJQQV2I3UCpcjIipRajbP8bqj6FuQtgA=;
        b=poBF04qQwL6gxwXbCLLHZtSOXp/nVPPnc/TgW81Vu8QMBZJffhxxYgujAQ95QIUm/1
         cbBZ6w7q1ZB6Jw4dnj+aRidHHt99MxGodFZ18mC1h3y6EpuQ7Re3jzScfO+d/zYTTPkM
         +2oMpv41BUB8G7/BTGhTmLbBiuUhjqcMf4N7Odw0PDPXdZBNMrmF5zCPbbk2ajeYbcYc
         iiBA9SIBsFWbTOQG7bfzqqaEbflGh8BD3eEwgUtOcZ0LOwZy3sXhtIuXtcecZaiF1XcK
         Wr9owJAoWeY9+8fmwNJcbs4Gr3dEfHWMamuPnz8wnohWaWigIgofV9uMpTKtwY63El4N
         35tw==
X-Gm-Message-State: AOJu0YxSSxqHWyqDvqc1QhKSlLmyi9TeQdZegF+oTCwKafa8oigwJkvW
	Tpe0AzbYnmXQC0jsnWFaOLmci4RlhSOfJb3GppC7hsGShLFrz+PUWD58KUfNdVd6o0fDVktTX5W
	3
X-Gm-Gg: ASbGncs2XxGEwZSX1g+4DKh/U1uIMcDaWuwDa4WFOKnCJrd/b1JA6BKcSziy0nloIBV
	MzyQiYGwRlSOhPQw8sSy90W9iYWeBUFP/1SKhEI2McpCoT2RqMhH8/X8zRvVMdYv0e2Cs0yd9yj
	VgD3q4CQzryqRbmgpNq6Cm4Vh4tLYWtsjtLKhpy09qK+ksQYrhY0N+rKISi4ypmTmDeoEdiKTk1
	ZSjBTt6+Y7VgG2XWOsxGWAnia15Tcdkfml85oobcOIDrQ==
X-Google-Smtp-Source: AGHT+IFJ33tPTI916PHbQthhjMch/drnkP+A2/Clx3IS3a9t+GFAbO5wrwAlA00HJUIxEBI1Ztq13w==
X-Received: by 2002:a05:6a21:3a4b:b0:1e1:b28e:a148 with SMTP id adf61e73a8af0-1e5e044fc8cmr69229550637.5.1735998114946;
        Sat, 04 Jan 2025 05:41:54 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.41.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:41:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/25] Patch review
Date: Sat,  4 Jan 2025 05:41:24 -0800
Message-ID: <cover.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209369

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, January 7

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/737

The following changes since commit 01423828248b75e1f5afe2e5959ccd971df875cd:

  rust: add reproducibility patch to eliminate host leakage (2024-12-19 05:36:59 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Changqing Li (1):
  sanity.bbclass: skip check_userns for non-local uid

Divya Chellam (1):
  libxml2: Upgrade 2.12.8 -> 2.12.9

Guðni Már Gilbert (2):
  python3: upgrade 3.12.6 -> 3.12.7
  python3: upgrade 3.12.7 -> 3.12.8

Mark Hatle (1):
  populate_sdk_ext: write_local_conf add shutil import

Mikko Rapeli (1):
  ovmf-native: remove .pyc files from install

Peter Marko (16):
  gstreamer1.0-plugins-good: fix several CVEs
  gstreamer1.0-plugins-base: patch CVE-2024-47538
  gstreamer1.0-plugins-base: patch CVE-2024-47607
  gstreamer1.0-plugins-base: patch CVE-2024-47615
  gstreamer1.0-plugins-good: patch CVE-2024-47613
  gstreamer1.0-plugins-good: patch several CVEs
  gstreamer1.0-plugins-base: patch CVE-2024-47541
  gstreamer1.0-plugins-base: patch CVE-2024-47542
  gstreamer1.0-plugins-good: patch CVE-2024-47599
  gstreamer1.0-plugins-base: patch CVE-2024-47600
  gstreamer1.0-plugins-good: patch CVE-2024-47606
  gstreamer1.0-plugins-good: patch CVE-2024-47606
  gstreamer1.0-plugins-good: patch CVE-2024-47774
  gstreamer1.0-plugins-good: patch several CVEs
  gstreamer1.0-plugins-base: patch CVE-2024-47835
  gstreamer1.0: ignore CVEs fixed in plugins recipes

Soumya Sambu (1):
  python3-requests: upgrade 2.32.0 -> 2.32.3

Xiangyu Chen (1):
  lttng-modules: fix sched_stat_runtime changed in Linux 6.6.66

aszh07 (1):
  libarchive: Fix CVE-2024-20696

 meta/classes-global/sanity.bbclass            |   2 +
 meta/classes-recipe/populate_sdk_ext.bbclass  |   2 +
 .../{libxml2_2.12.8.bb => libxml2_2.12.9.bb}  |   2 +-
 meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
 ...s_2.32.0.bb => python3-requests_2.32.3.bb} |   4 +-
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   3 +-
 ...-use-prefix-value-from-build-configu.patch |   5 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   6 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |  16 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   7 +-
 ...e-treat-overflow-in-UID-GID-as-failu.patch |   9 +-
 ...asename-to-replace-CC-for-checking-c.patch |  20 +-
 ..._fileno-test-due-to-load-variability.patch |   6 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   5 +-
 ...ctive_children-skip-problematic-test.patch |   9 +-
 ...pes.test_find-skip-without-tools-sdk.patch |   5 +-
 ...-test_deadlock-skip-problematic-test.patch |   9 +-
 ...le.py-correct-the-test-output-format.patch |   7 +-
 ...t_readline-skip-limited-history-test.patch |  14 +-
 ...-test_shutdown-skip-problematic-test.patch |  11 +-
 ...orlines-skip-due-to-load-variability.patch |   5 +-
 ...up.py-do-not-add-a-curses-include-pa.patch |   6 +-
 .../python/python3/cgi_py.patch               |   3 +-
 .../python/python3/crosspythonpath.patch      |   5 +-
 .../python3/deterministic_imports.patch       |   5 +-
 .../python/python3/makerace.patch             |   6 +-
 .../{python3_3.12.6.bb => python3_3.12.8.bb}  |   2 +-
 .../libarchive/CVE-2024-20696.patch           | 115 +++++
 .../libarchive/libarchive_3.7.4.bb            |   3 +-
 ...stat_runtime-changed-in-Linux-6.6.66.patch |  51 ++
 .../lttng/lttng-modules_2.13.12.bb            |   1 +
 ...at-most-64-channels-to-NONE-position.patch |  35 ++
 ...at-most-64-channels-to-NONE-position.patch |  41 ++
 ...ck-writes-to-GstOggStream.vorbis_mod.patch |  80 ++++
 ...w-and-fix-per-format-min_packet_size.patch | 168 +++++++
 ...for-closing-brace-after-opening-brac.patch |  38 ++
 ...se-strstr-on-strings-that-are-potent.patch |  99 ++++
 ...parsing-extended-header-if-not-enoug.patch |  64 +++
 ...-print-channel-layout-for-more-than-.patch |  38 ++
 ...or-NULL-return-of-strchr-when-parsin.patch |  39 ++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |   9 +
 ...o-sized-boxes-instead-of-stopping-to.patch | 124 +++++
 ...ger-overflow-when-allocating-the-sam.patch |  63 +++
 ...Fix-debug-output-during-trun-parsing.patch |  72 +++
 ...erate-over-all-trun-entries-if-none-.patch |  35 ++
 ...zes-of-stsc-stco-stts-before-trying-.patch |  63 +++
 ...e-only-an-even-number-of-bytes-is-pr.patch |  44 ++
 ...e-enough-data-is-available-before-re.patch | 120 +++++
 ...th-checks-and-offsets-in-stsd-entry-.patch | 450 ++++++++++++++++++
 ...r-handling-when-parsing-cenc-sample-.patch |  56 +++
 ...e-there-are-enough-offsets-to-read-w.patch |  49 ++
 ...-handle-errors-returns-from-various-.patch |  97 ++++
 ...r-invalid-atom-length-when-extractin.patch |  36 ++
 ...size-check-for-parsing-SMI-SEQH-atom.patch |  37 ++
 ...ck-if-initializing-the-video-info-ac.patch |  53 +++
 ...ly-unmap-GstMapInfo-in-WavPack-heade.patch |  60 +++
 ...x-off-by-one-when-parsing-multi-chan.patch |  35 ++
 ...eck-for-big-enough-WavPack-codec-pri.patch |  43 ++
 ...n-t-take-data-out-of-an-empty-adapte.patch |  51 ++
 ...ip-over-laces-directly-when-postproc.patch |  52 ++
 ...ip-over-zero-sized-Xiph-stream-heade.patch |  43 ++
 ...t-a-copy-of-the-codec-data-into-the-.patch |  44 ++
 ...ly-error-out-on-negotiation-failures.patch |  99 ++++
 ...teger-overflow-when-parsing-Theora-e.patch |  44 ++
 ...size-checks-and-avoid-overflows-when.patch |  46 ++
 ...or-short-reads-when-parsing-headers-.patch | 174 +++++++
 ...re-enough-data-for-the-tag-list-tag-.patch |  41 ++
 ...7-wavparse-Fix-parsing-of-acid-chunk.patch |  65 +++
 ...hat-at-least-4-bytes-are-available-b.patch |  37 ++
 ...hat-at-least-32-bytes-are-available-.patch |  40 ++
 ...ix-clipping-of-size-to-the-file-size.patch |  47 ++
 ...Check-size-before-reading-ds64-chunk.patch |  41 ++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |  34 +-
 ...integer-overflow-when-allocating-sys.patch |  56 +++
 .../gstreamer/gstreamer1.0_1.22.12.bb         |  14 +
 76 files changed, 3226 insertions(+), 101 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.8.bb => libxml2_2.12.9.bb} (97%)
 rename meta/recipes-devtools/python/{python3-requests_2.32.0.bb => python3-requests_2.32.3.bb} (78%)
 rename meta/recipes-devtools/python/{python3_3.12.6.bb => python3_3.12.8.bb} (99%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-vorbis_parse-check-writes-to-GstOggStream.vorbis_mod.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0007-oggstream-review-and-fix-per-format-min_packet_size.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qtdemux-Skip-zero-sized-boxes-instead-of-stopping-to.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-qtdemux-Fix-integer-overflow-when-allocating-the-sam.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-qtdemux-Fix-debug-output-during-trun-parsing.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-qtdemux-Don-t-iterate-over-all-trun-entries-if-none-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-qtdemux-Check-sizes-of-stsc-stco-stts-before-trying-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-qtdemux-Make-sure-only-an-even-number-of-bytes-is-pr.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-qtdemux-Make-sure-enough-data-is-available-before-re.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-qtdemux-Fix-length-checks-and-offsets-in-stsd-entry-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0009-qtdemux-Fix-error-handling-when-parsing-cenc-sample-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0010-qtdemux-Make-sure-there-are-enough-offsets-to-read-w.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0011-qtdemux-Actually-handle-errors-returns-from-various-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0012-qtdemux-Check-for-invalid-atom-length-when-extractin.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0013-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0015-matroskademux-Only-unmap-GstMapInfo-in-WavPack-heade.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0016-matroskademux-Fix-off-by-one-when-parsing-multi-chan.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0017-matroskademux-Check-for-big-enough-WavPack-codec-pri.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0018-matroskademux-Don-t-take-data-out-of-an-empty-adapte.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0019-matroskademux-Skip-over-laces-directly-when-postproc.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0020-matroskademux-Skip-over-zero-sized-Xiph-stream-heade.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-jpegdec-Directly-error-out-on-negotiation-failures.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0025-wavparse-Check-for-short-reads-when-parsing-headers-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0026-wavparse-Make-sure-enough-data-for-the-tag-list-tag-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0027-wavparse-Fix-parsing-of-acid-chunk.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0028-wavparse-Check-that-at-least-4-bytes-are-available-b.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0029-wavparse-Check-that-at-least-32-bytes-are-available-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0030-wavparse-Fix-clipping-of-size-to-the-file-size.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0031-wavparse-Check-size-before-reading-ds64-chunk.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-allocator-Avoid-integer-overflow-when-allocating-sys.patch

-- 
2.43.0


