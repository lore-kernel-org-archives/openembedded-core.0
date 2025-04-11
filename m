Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D64C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 20:33:43 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.36471.1744403622735353792
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 13:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=meZXX2gP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736b34a71a1so2890097b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744403622; x=1745008422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1IfRHbS9hhVET3fHhftFxuIpF9QCg0SfNskdJZc+Jc=;
        b=meZXX2gPSHcHZxJvzDUfrDtPetwZQ7gHDi5f8O+mTUHOIHjOSTMhzaUQ76Xqu7jFzd
         hbUnQYS1TUTGKRNPirmDqYbcso1w38MhmfTkvVw31apvCEiZbEeSR2DwfXMxjavV+YuJ
         ho9Jn+WdyBrC1Ft6k+DpY0rzgXCo/qWe+RunFej5+554Pk1mLtJ/M2E/BNjyhWcEcALU
         MmL/xcRPgXYyPP+laKWcsuzXzafgc/dAF2T5z5ye0UGpk4/7TdoePtmbNV0VaqgJglYd
         YkxsL9oJRiaJHfL2UlAoWCFoGRcBPiMQbfO88LfF9RQMMs2yL7LApK1H0zh6t2Lsmk0E
         bZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403622; x=1745008422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1IfRHbS9hhVET3fHhftFxuIpF9QCg0SfNskdJZc+Jc=;
        b=OlTObAc9aqI+nOEKABBVOrCCVshw/sS6VzFyqCMcwHArCcred9frxXjdsXlX/Scc2J
         A66Gb21WKyWJ5sTgCkgC1p01nZsGHUR39PNwn5LEGB3fiTFdkYI1f8tjO3bHRNlRYmpd
         PKATk+K/j36A05kcGGhrVIiCCE5bsPQuGMtlVkax1faM9TVFYKC5S3BIEdd2MGmZuhL9
         Z0IQy/KrNidZSVYkvYOdDARhDbgo7AJ+g0VP/kJNOwGF4cK/NbxhZlVyGe5P64khZNVe
         A1iUwVtrd0z9Iw8BDsZnprNDDevlUDl1hV2Cep2jeZUT/rKaiRBIpOUwgbWt4pDS9xvI
         AHCw==
X-Gm-Message-State: AOJu0Yy1TMSzsSKpoyDxuY6FyJM0yUMVE5vPPSth3zbUJ1fIJiilC9zy
	3TYTuI4mqlBoFL5Wwg/fbyRbiG3cZHBIoxdlWbJturCdJ/ORiCt/f9PBGrTtUJ13FuxcrmZaEpd
	q
X-Gm-Gg: ASbGnct7uf6Bt8ksot0ArgGwOKwEvti8No8g7ZkcbcGWR+PKykUDLJk1g4wDzQhSPXM
	jWFKk5+2FEAjDQWwo07GJ+zHZp/Dpfs7jXFeO5gjaHGBZwF0puatLWozdvczoDJUGA9+wlSagHD
	vVCIpch2aljDEPTa898zF6IF/IKysvuwAY5w16QmW628PtLE2rMIPbHiVAu/ogFEsClSeBt5o2e
	Uo2Rn1b85dA4cF1ReCpj0Ee4BpzjUtgQJt6BST7FZPZ3x1o3wlRTB2su3noThRla5flr3+/JdQj
	v4y7YuUTUNjgeXiIA1vyEPDG7pmUI55sDXiA2vMKYl8=
X-Google-Smtp-Source: AGHT+IHSOSjA1/lljaclTOmCEgxMqmTSZPegZyrbpsSVIp3ub+z9099jUo3pD1G1WTeLO8AxmhK/lA==
X-Received: by 2002:a05:6a00:130b:b0:736:46b4:bef2 with SMTP id d2e1a72fcca58-73bd11dbf37mr5333543b3a.6.1744403621705;
        Fri, 11 Apr 2025 13:33:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c93f:3642:a7d6:27ed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230d697sm2067498b3a.123.2025.04.11.13.33.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:33:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/8] Patch review
Date: Fri, 11 Apr 2025 13:33:26 -0700
Message-ID: <cover.1744403103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 20:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214753

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, April 15

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1386

Note: there was a failure during oe-selftest-fedora cve_check which is related to NFS issues on the autobuilder infrastructure and not this patch set

The following changes since commit 4003b5faa1e5acfa025e1d0df4e021e06cf8724c:

  mc: set ac_cv_path_ZIP to avoid buildpaths QA issues (2025-04-01 08:10:07 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (2):
  go: fix CVE-2025-22870
  ghostscript: upgrade 10.04.0 -> 10.05.0

Changqing Li (1):
  patch.py: set commituser and commitemail for addNote

Hitendra Prajapati (1):
  go: fix CVE-2025-22871

Peter Marko (4):
  ofono: patch CVE-2024-7537
  cve-update-nvd2-native: add workaround for json5 style list
  xz: upgrade 5.4.6 -> 5.4.7
  xz: patch CVE-2025-31115

 meta/lib/oe/patch.py                          |  14 +-
 .../ofono/ofono/CVE-2024-7537.patch           |  59 ++++++
 meta/recipes-connectivity/ofono/ofono_2.4.bb  |   1 +
 .../meta/cve-update-nvd2-native.bb            |   5 +
 meta/recipes-devtools/go/go-1.22.12.inc       |   2 +
 .../go/go/CVE-2025-22870.patch                |  80 ++++++++
 .../go/go/CVE-2025-22871.patch                | 172 ++++++++++++++++++
 ...ript_10.04.0.bb => ghostscript_10.05.0.bb} |   2 +-
 .../xz/xz/CVE-2025-31115-01.patch             |  29 +++
 .../xz/xz/CVE-2025-31115-02.patch             | 152 ++++++++++++++++
 .../xz/xz/CVE-2025-31115-03.patch             |  98 ++++++++++
 .../xz/xz/CVE-2025-31115-04.patch             |  56 ++++++
 .../xz/{xz_5.4.6.bb => xz_5.4.7.bb}           |   8 +-
 13 files changed, 669 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-22870.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-22871.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.04.0.bb => ghostscript_10.05.0.bb} (97%)
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-01.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-02.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-03.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-04.patch
 rename meta/recipes-extended/xz/{xz_5.4.6.bb => xz_5.4.7.bb} (89%)

-- 
2.43.0


