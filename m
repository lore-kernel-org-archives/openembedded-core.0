Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D6BCA5FE4
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 21:43:18 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13633.1791063792946364806
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 14:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FfG95Uj6;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so4737645e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 14:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791063791; x=1791668591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yygh8t6nhZkvbGkyHcMWuY6P7C5LHqNGqHMzi2Gmzaw=;
        b=FfG95Uj60+y10HFydT9x4lAuR3SGlrgMX74SFgJ8prk23koW/M/7QC7ei9/0uuxI1n
         880x1IWQl56W9k3GBwsqb9LYTSqa1Qgwa6d4r2Jt6g5GKnt7g2pWB7O5x5xqK8o3bCQN
         txbPhmds8AmM05/jpcrYNFvI+a+R2Bu8derrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063791; x=1791668591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yygh8t6nhZkvbGkyHcMWuY6P7C5LHqNGqHMzi2Gmzaw=;
        b=lzVblQY9gBewBLdB5iJwCcdvI/jPGvB2E3ksyjM6rrQY9UsXqLmkfCSzpj+qtyT5Yn
         +huB9KVKpjDvmXq+fpAv4shIRfW4goZE7SxVMVXwkM319eXaeoB78ywd3uPbxtNsxh6x
         8SLYyIXsxFujXO20bIQFUoBKSDaAZUvr14I0SsnrASVwhFHObDjWWMpaLTba621G1pz9
         TbsqUIEm9aA+hKTUhGNz2tVFvDI/XjA4ZBw7hVwnc3TvmnNYnr4ftlAtibKUTTHNxCgM
         ot9GXPPtiGclJnJrxuyhI3mb3qPKB3U3mnDil4myCBnsV64IeVbhpTKQquq0r+qgGtVG
         GYGg==
X-Gm-Message-State: AFuF++nKCNopLYFhzXYqpI9v7NBhsEDHtT7aZ8Sei17FZKS9txS7coiS
	4TTMDWMyYmpcfLAbRELwdGfu0wmfd8x+DIvlJsvzFDyAcdShzpxYQ5aCRWCg4LAhCXSKqRGScLt
	2VFAd6mE=
X-Gm-Gg: AYBFou37s3QAtYJaul21RIp7AAKgGxMr9ko7azqByQAkmIs8ggewzh27+8QaNroUWuf
	lObeu20KjERXau9pOuHHobgMiBnYikEaEdapo9dc/hGIRMOidyoyMrMdYvgD18UtI2SUUKdeVRD
	nPVgfH+6tdt4+c6GwYds7XfGwOAoHVFRYGZLcnOATBQpV6mHp2ytI3liYmOLAwPRVQdYhw6ckrl
	5IbM9TIPtMHAMjMJwIeAIksWoKJ3dQQC0sJUmXu64Di9sNb2Fs2HnEaOZNgkCdwZnXVThQPAow7
	SE7U3beHF/xCGGRE3Kw/teoiOV+MmzTvwkPbgaUsgrM7AIO6YZaIaowCf6VN9KrIFmo47NgDv09
	fg2AposIShD520VtdSWbzHLHkDLHtzHg6KRyeDx1S+dnmlplQ6iziOKXwd9yuIblKQciRHHnPuC
	8L5pfFpAF0PZJn2SfHXbIi3DAVDWARgFy0w8F8Kds9iQ2QAazKCyLlygWq7o2Riih/qX7IYNOGl
	6uhbzug1qCRmykJ9FU+L4HU7xLVY4DAyenWQzD7Om6/2C/0bWr5wrU3jcqD3TGNRww=
X-Received: by 2002:a05:600c:1c0e:b0:4a0:2391:6533 with SMTP id 5b1f17b1804b1-4a02759bbf7mr130323575e9.21.1791063790873;
        Sat, 03 Oct 2026 14:43:10 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f04e2sm12832952f8f.15.2026.10.03.14.43.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:43:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/8] Patch review
Date: Sat,  3 Oct 2026 23:42:08 +0200
Message-ID: <cover.1791061402.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 21:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247177

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, October 6.

Note: this series includes an expat version upgrade. This is an
exception to the usual stable policy, accepted because it should not
break any existing code and help a lot with CVEs.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4868
* qemux86-tc failed with
  Bug 14259 - AB-INT: NFS mounting issue on qemu oe-selftest glibc.GlibcSelfTestSystemEmulated.test_glibc
  that I reopened.
  Retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/28/builds/4746
* oe-selftest-fedora failed with
  Bug 16206 - [scarthgap] AB-INT: runtime_test.SystemTap.test_crosstap_* failures
  Retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4801

The following changes since commit 07ca97baad7b182849ee50f0bd629b68dc9f53b3:

  time64: enable 64-bit time/file-offset flags for 32-bit nativesdk (2026-09-24 08:54:34 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-review

for you to fetch changes up to 827730f97b522c4ab31dd2b7b5a33a4933c94750:

  python3-pyasn1: fix CVE-2026-59885 (2026-10-02 17:46:50 +0200)

----------------------------------------------------------------

Deepesh Varatharajan (1):
  glibc: Fix CVE-2026-6238

Devansh Patel (1):
  vim: Fix CVE-2026-28417 regressions

Jakub Szczudlo (Nokia) (1):
  expat: upgrade 2.6.4 -> 2.8.3, exception security update

Richard Purdie (2):
  sstate: Update mtime/atime for sig/siginfo files in
    sstate_checkhashes()
  sstate: Update unpack touch code to be consistent

Tim Orling (1):
  at-spi2-core: RDEPENDS on gsettings-desktop-schemas

Yogita Urade (2):
  python3-pyasn1: fix CVE-2026-30922
  python3-pyasn1: fix CVE-2026-59885

 meta/classes-global/sstate.bbclass            |   16 +-
 ...ests-Cover-indirect-entity-recursion.patch |  103 --
 .../expat/expat/CVE-2024-8176-01.patch        | 1477 -----------------
 .../expat/expat/CVE-2024-8176-02.patch        |  248 ---
 .../expat/expat/CVE-2024-8176-03.patch        |   35 -
 .../expat/expat/CVE-2024-8176-04.patch        |  115 --
 .../expat/expat/CVE-2024-8176-05.patch        |   78 -
 .../expat/expat/CVE-2025-59375-00.patch       |   52 -
 .../expat/expat/CVE-2025-59375-01.patch       |   48 -
 .../expat/expat/CVE-2025-59375-02.patch       |  109 --
 .../expat/expat/CVE-2025-59375-03.patch       |  127 --
 .../expat/expat/CVE-2025-59375-04.patch       |   62 -
 .../expat/expat/CVE-2025-59375-05.patch       |   64 -
 .../expat/expat/CVE-2025-59375-06.patch       |   68 -
 .../expat/expat/CVE-2025-59375-07.patch       |   52 -
 .../expat/expat/CVE-2025-59375-08.patch       |  577 -------
 .../expat/expat/CVE-2025-59375-09.patch       |   43 -
 .../expat/expat/CVE-2025-59375-10.patch       |   54 -
 .../expat/expat/CVE-2025-59375-11.patch       |   66 -
 .../expat/expat/CVE-2025-59375-12.patch       |   58 -
 .../expat/expat/CVE-2025-59375-13.patch       |  309 ----
 .../expat/expat/CVE-2025-59375-14.patch       |  122 --
 .../expat/expat/CVE-2025-59375-15.patch       |   70 -
 .../expat/expat/CVE-2025-59375-16.patch       |  146 --
 .../expat/expat/CVE-2025-59375-17.patch       |   28 -
 .../expat/expat/CVE-2025-59375-18.patch       |   74 -
 .../expat/expat/CVE-2025-59375-19.patch       |  103 --
 .../expat/expat/CVE-2025-59375-20.patch       |  285 ----
 .../expat/expat/CVE-2025-59375-21.patch       |  196 ---
 .../expat/expat/CVE-2025-59375-22.patch       |   37 -
 .../expat/expat/CVE-2025-59375-23.patch       |   47 -
 .../expat/expat/CVE-2025-59375-24.patch       |   36 -
 .../expat/expat/CVE-2026-24515-01.patch       |   43 -
 .../expat/expat/CVE-2026-24515-02.patch       |  117 --
 .../expat/expat/CVE-2026-25210-01.patch       |   27 -
 .../expat/expat/CVE-2026-25210-02.patch       |   38 -
 .../expat/expat/CVE-2026-25210-03.patch       |   28 -
 .../expat/expat/CVE-2026-32776.patch          |   91 -
 .../expat/expat/CVE-2026-32777-01.patch       |   49 -
 .../expat/expat/CVE-2026-32777-02.patch       |   66 -
 .../expat/expat/CVE-2026-32778-01.patch       |   91 -
 .../expat/expat/CVE-2026-32778-02.patch       |   61 -
 .../expat/expat/CVE-2026-41080-01.patch       |   50 -
 .../expat/expat/CVE-2026-41080-02.patch       |   29 -
 .../expat/expat/CVE-2026-41080-03.patch       |  467 ------
 .../expat/expat/CVE-2026-45186-01.patch       |   70 -
 .../expat/expat/CVE-2026-45186-02.patch       |  318 ----
 .../expat/expat/CVE-2026-45186-03.patch       |   46 -
 .../expat/expat/CVE-2026-45186-04.patch       |   32 -
 .../expat/expat/CVE-2026-45186-05.patch       |   32 -
 .../expat/expat/CVE-2026-45186-06.patch       |   87 -
 .../expat/expat/CVE-2026-45186-07.patch       |   52 -
 .../expat/expat/CVE-2026-56132_p1.patch       |   80 -
 .../expat/expat/CVE-2026-56132_p2.patch       |   60 -
 .../expat/expat/CVE-2026-56132_p3.patch       |   74 -
 .../expat/expat/CVE-2026-56132_p4.patch       |   60 -
 .../expat/expat/CVE-2026-56132_p5.patch       |   56 -
 .../expat/expat/CVE-2026-56403_p1.patch       |   81 -
 .../expat/expat/CVE-2026-56403_p2.patch       |   52 -
 .../expat/expat/CVE-2026-56404.patch          |   45 -
 .../expat/expat/CVE-2026-56405.patch          |   30 -
 .../expat/CVE-2026-56406-dependent.patch      |   59 -
 .../expat/expat/CVE-2026-56406.patch          |   34 -
 .../expat/expat/CVE-2026-56407.patch          |   41 -
 .../expat/expat/CVE-2026-56408.patch          |   29 -
 .../expat/expat/CVE-2026-56409.patch          |   51 -
 .../expat/expat/CVE-2026-56410_p1.patch       |   46 -
 .../expat/expat/CVE-2026-56410_p2.patch       |   39 -
 .../expat/expat/CVE-2026-56411.patch          |   50 -
 meta/recipes-core/expat/expat_2.6.4.bb        |  104 --
 meta/recipes-core/expat/expat_2.8.3.bb        |   33 +
 .../glibc/glibc/0025-CVE-2026-6238-0001.patch |   59 +
 .../glibc/glibc/0026-CVE-2026-6238-0002.patch |   81 +
 .../glibc/glibc/0027-CVE-2026-6238-0003.patch |   58 +
 .../glibc/glibc/0028-CVE-2026-6238-0004.patch |   73 +
 .../glibc/glibc/0029-CVE-2026-6238-0005.patch |   69 +
 .../glibc/glibc/0030-CVE-2026-6238-0006.patch |  382 +++++
 meta/recipes-core/glibc/glibc_2.39.bb         |    6 +
 .../recipes-devtools/python/python-pyasn1.inc |    2 +
 .../python3-pyasn1/CVE-2026-30922.patch       |  262 +++
 .../python3-pyasn1/CVE-2026-59885.patch       |  183 ++
 .../atk/at-spi2-core_2.50.1.bb                |    2 +
 .../files/CVE-2026-28417-regression_p1.patch  |   78 +
 .../files/CVE-2026-28417-regression_p2.patch  |   53 +
 meta/recipes-support/vim/vim.inc              |    2 +
 85 files changed, 1353 insertions(+), 7680 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat/0001-tests-Cover-indirect-entity-recursion.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-04.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-05.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-00.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-04.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-05.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-06.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-07.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-08.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-09.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-10.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-11.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-12.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-13.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-14.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-15.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-16.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-17.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-18.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-19.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-20.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-21.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-22.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-23.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-24.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-32776.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch
 delete mode 100644 meta/recipes-core/expat/expat_2.6.4.bb
 create mode 100644 meta/recipes-core/expat/expat_2.8.3.bb
 create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59885.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression_p2.patch


