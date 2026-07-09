Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10633C4450A
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:07 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5799.1783591621804624029
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Bl9aqoTX;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so12242265e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591620; x=1784196420; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsbQy9NmPX6sYahorbvQpJ++Ovjh/WKyTPviDqZ5VFY=;
        b=Bl9aqoTXy+lxwXSRzzwn3EXaecpnCXPz6nyJ5sbScBtTvn2PI7SvdKDQ6kSkx7LjYg
         jt4uDVH58MV9QXPE9a2KP2kLKBgMIuG86Nyy39N60lbep0zC+c65y1/89qTlLJBDVWKz
         8xUVMYDRc/vNE6ChVdNF/bWtAR40WjzS9JuK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591620; x=1784196420;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsbQy9NmPX6sYahorbvQpJ++Ovjh/WKyTPviDqZ5VFY=;
        b=EVIS8SMSRaiPDJR67Po6QXQr6OnKrIwu54n0FQbUi1bzvTxGh2dQ2flZztaKZdqyh2
         z6RBGBG6G+wgSRwXIRivN1Bi2nTNc6gumSDeYv9w+lAyOh5oPhC0gatwhOrw0e0BA3gn
         DFqmXgcLScVC01WMnTGIGAQmY2Vse1gcAntkVBhrFr9XYaiaQ5uAAQrYWzn0D6Eke48V
         VLT9+tLIJggBPtLeQP8Gjz1O2I3KSUP4CE2v6tFszy07eUJeeN7aNHSlpI++aL85V8UK
         B20IJIsPFHLLzL6VahxrKf1uqB3/KMwp8GPFllqh3XRGVO3m0i193NtoygSV+kUnDmaa
         kMAg==
X-Gm-Message-State: AOJu0Ywajg5FTcTuvl5UPENwLfwWVwG6JMvjMxRBkDyLA6bPQO2FKx9w
	6nZRhsPg4qzY2PnampsluVgOG2ZlBBEFBZIbJ0uy8NYQeLK/J/kVMaa34UYTBOLY6bf4mKaP4uj
	oBLexTZA=
X-Gm-Gg: AfdE7ckgp1yaaevWcjzcpvHQXpI7PcPw5zLHWhPV0DdQTGixSdZHkUUyP4fJWI6mTu2
	CpRXJZBW0VbRERrwXA/rdMCxiMR7dqg0B+Xin4ppkvFN7HFcymcIB1kiSFHH3h611g3zHjJMFkx
	/7RMtBhijVTN0W9dkoiaG0wWINcEbi9rzDz2I7P5QS2EWDDTpIUO/rlDnDeVd8owOwjAElz1lV9
	sSeLbv5CApnSVXJNQAvsEcglthaF2MivbVg0SpbTFp2+bOGh3zykOxYIVHXExkfidgVFUpnvEql
	i9CS63+B80+q2IuBGPf3uCURCizZueV5JHH49Uu8TUPW5l5i+aXX8JzMo0LJLxatxVb8w9GT6UD
	Dfz6aPKC03nlEZyMYDg7HXRoBxd9abjZoZcxFFh6E8sl1UeBekfablD1YXHtJI7iclBu6K4fgr+
	npk+dY9rCj727sBsQM8oAR/nSEg/lwPMahpKwZ2Xa40O+sa7LD2REcMHbR4xzx5OS3Em4+aaWJv
	ggvPeEKrY+r9UKdyQ==
X-Received: by 2002:a05:600c:8b17:b0:493:e6f7:ad75 with SMTP id 5b1f17b1804b1-493e6f7afb1mr58825185e9.11.1783591619613;
        Thu, 09 Jul 2026 03:06:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.06.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:06:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/25] Patch review
Date: Thu,  9 Jul 2026 12:06:16 +0200
Message-ID: <cover.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240547

Please review this set of changes for scarthgap and have comments back by
end of day Friday, July 10. This is a bit shorter period than usual,
ping me if you need more time (I've spent some time to understand the
below AB error).

*Somewhat* passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4178
3 sub builds failed:
* oe-selftest-armhost#4305
* oe-selftest-debian#4250
* oe-selftest-fedora#4075
Sadly, I did not got successful retries. I think this is related to:
15289 – [scarthgap] AB-INT: sstatetests.SStatePrintdiff.test_gcc_runtime_vs_gcc_source failure
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15289
I'm still trying to understand what is happening but now I think this
issue is *NOT* related to this series. The main issue for this series is
that it prevented to fully run the oe-selftests. I plan to get a
green-ish build before doing the pull-request.

The following changes since commit 2814f0962f56c8d1afa4de76d2895ba9b5cb767d:

  build-appliance-image: Update to scarthgap head revisions (2026-07-02 13:50:35 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to 728706a9dc79a8c70429b805fc40429bcd8e09fc:

  cve-update: Avoid NFS caching issues (2026-07-08 16:32:46 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  curl: fix CVE-2026-6276

Anil Dongare (2):
  cargo: Fix CVE-2026-5222
  cargo: Fix CVE-2026-5223

Ashishkumar Parmar (3):
  qemu: Fix CVE-2025-14876
  qemu: Fix CVE-2026-0665
  qemu: Fix CVE-2026-2243

Benjamin Robin (Schneider Electric) (1):
  openssh: CVE-2026-35387 patch also fixes CVE-2026-35414

Daniel Turull (2):
  libssh2: fix CVE-2026-55200
  libssh2: fix CVE-2026-55199

Esa Jaaskela (1):
  linux-yocto/6.6: update CVE exclusions (6.6.142)

Harish Sadineni (1):
  binutils: Add CVE-2025-69646 to "CVE:" tag

Himanshu Jadon (1):
  tar: Fix CVE-2026-5704

Hitendra Prajapati (4):
  vim: fix for CVE-2026-34982, CVE-2026-34714 & CVE-2026-35177
  vim: fix for CVE-2026-28421, CVE-2026-41411 & CVE-2026-44656
  vim: Fix for CVE-2026-28417, CVE-2026-32249, CVE-2026-45130
  vim: Security fix for CVE-2026-28420 & CVE-2026-46483

Jaipaul Cheernam (1):
  curl: fix CVE-2026-5773 - wrong reuse of SMB connection

Jakub Szczudlo (1):
  libgcrypt: upgrade 1.10.3 -> 1.10.4

Nate Kent (1):
  sudo: fix pam-wheel sed for sudo 1.9.17p2 sudoers

Paul Barker (1):
  cve-update: Avoid NFS caching issues

Shubham Pushpkar (1):
  binutils: Fix CVE-2026-6846

Theo Gaige (Schneider Electric) (4):
  dhcpcd: patch CVE-2026-56113
  dhcpcd: patch CVE-2026-56114
  dhcpcd: patch CVE-2026-56117
  perl: patch CVE-2026-8376

 .../dhcpcd/dhcpcd_10.0.6.bb                   |    3 +
 .../dhcpcd/files/CVE-2026-56113.patch         |   92 +
 .../dhcpcd/files/CVE-2026-56114.patch         |   34 +
 .../dhcpcd/files/CVE-2026-56117.patch         |  167 +
 ...ch => CVE-2026-35414-CVE-2026-35387.patch} |    2 +-
 .../openssh/openssh_9.6p1.bb                  |    2 +-
 .../meta/cve-update-nvd2-native.bb            |    9 +-
 .../binutils/binutils-2.42.inc                |    1 +
 .../binutils/binutils/CVE-2025-69648.patch    |    2 +-
 .../binutils/binutils/CVE-2026-6846.patch     |   57 +
 .../perl/files/CVE-2026-8376-01.patch         |   62 +
 .../perl/files/CVE-2026-8376-02.patch         |   49 +
 meta/recipes-devtools/perl/perl_5.38.4.bb     |    2 +
 meta/recipes-devtools/qemu/qemu.inc           |    4 +
 .../qemu/qemu/CVE-2025-14876_p1.patch         |   52 +
 .../qemu/qemu/CVE-2025-14876_p2.patch         |   56 +
 .../qemu/qemu/CVE-2026-0665.patch             |   38 +
 .../qemu/qemu/CVE-2026-2243.patch             |   45 +
 .../rust/files/CVE-2026-5222.patch            |   92 +
 .../rust/files/CVE-2026-5223.patch            |  114 +
 meta/recipes-devtools/rust/rust-source.inc    |    2 +
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |    2 +-
 .../tar/tar/CVE-2026-5704-dependent_p1.patch  |  484 +++
 .../tar/tar/CVE-2026-5704-dependent_p2.patch  |  169 +
 .../tar/tar/CVE-2026-5704-regression.patch    |  176 +
 .../tar/tar/CVE-2026-5704.patch               |  556 +++
 meta/recipes-extended/tar/tar_1.35.bb         |    4 +
 .../linux/cve-exclusion_6.6.inc               | 3418 +++++++++++++----
 .../curl/curl/CVE-2026-5773.patch             |   40 +
 .../curl/curl/CVE-2026-6276.patch             |  135 +
 meta/recipes-support/curl/curl_8.7.1.bb       |    2 +
 ...ilding-error-with-O2-in-sysroot-path.patch |   64 -
 ...r-handle-substitution-in-sed-command.patch |   49 +
 ...ibgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} |    4 +-
 .../libssh2/libssh2/CVE-2026-55199.patch      |   44 +
 .../libssh2/libssh2/CVE-2026-55200.patch      |   36 +
 .../recipes-support/libssh2/libssh2_1.11.1.bb |    2 +
 .../vim/files/CVE-2026-28417.patch            |   92 +
 .../vim/files/CVE-2026-28420.patch            |  162 +
 .../vim/files/CVE-2026-28421.patch            |  148 +
 .../vim/files/CVE-2026-32249.patch            |  117 +
 .../vim/files/CVE-2026-34714.patch            |  109 +
 .../vim/files/CVE-2026-34982.patch            |  105 +
 .../vim/files/CVE-2026-35177.patch            |   60 +
 .../vim/files/CVE-2026-41411.patch            |   75 +
 .../vim/files/CVE-2026-44656.patch            |  130 +
 .../vim/files/CVE-2026-45130.patch            |  115 +
 .../vim/files/CVE-2026-46483.patch            |   77 +
 meta/recipes-support/vim/vim.inc              |   11 +
 49 files changed, 6449 insertions(+), 822 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
 rename meta/recipes-connectivity/openssh/openssh/{CVE-2026-35387.patch => CVE-2026-35414-CVE-2026-35387.patch} (99%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5222.patch
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5223.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p1.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p2.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-regression.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.patch
 delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0002-random-cipher-handle-substitution-in-sed-command.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} (92%)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28420.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28421.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-32249.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-34714.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-34982.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-35177.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-41411.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-44656.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-45130.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-46483.patch


