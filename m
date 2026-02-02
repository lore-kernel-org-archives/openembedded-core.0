Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F92E7FDDD
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:08:19 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1482.1770066497368168016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=REE7DKpu;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-8946d565dfaso2630106d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066496; x=1770671296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4xfgaaD25EB3VhMWPLuQjxVI6QudSmAWyVOGZP29RA=;
        b=REE7DKpuKyduXgjBELnbnaMCn1v1y0ULqUGwQ7EF93twcWw1EivQoPFzYLbTihrGle
         btKQN2NG8+UPEEbfztV0h+ydBIJpScUIJZzXRrZkvcLHfHUfev3DFXCfBYAy6vLvo6o+
         dgcE6aBvM57z5olGaJ6QYPqMBxW6XYSSaAcrgH02KTpwf2ysTfyMLDwIROXVO54UJRr4
         RHjHRpMCdLu2uCzgljLRg/Vev5yM593L+y9F6LeWmguJJNXzVviDs3t3YWO9LBS4Sqhz
         0pa4Cdk8iKA01/7m5FnN42DtRAEqgzG1ft++yoppjUwFgEyPuDPUjb8/6IM5Pz5vgXHY
         6dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066496; x=1770671296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n4xfgaaD25EB3VhMWPLuQjxVI6QudSmAWyVOGZP29RA=;
        b=VL105zf80qvnMAZm5DU8R6iUJVBT/3QsHhwjTw1hUvtU5vReNWJr0uI2Yob4PF6rhc
         oMdYJdmyRRPX0P47QMM6COrGwONFZt9nzFpxFNehTfG0AjBy/zOw7PQq2bSSX3PNYIbN
         mGJi0TFG+96owzAmpkf74PGSZMbuKu49LrcZ+vLGJau+OFabUfuBu4Uhz569XBtMwBhK
         2uMEIebj4Vy0E3AQA9W6MCWcn5avvBY7DuIHDo3RnkGc7QkAjfN2VaYmvSyh8JmMtPvK
         qTN2JpuYeIm8HE7/MqpwUHWq8vmCe4jKFunSrmPjwKYH0mzu1yGHfQnRp6q+/9d2Qi59
         WyDg==
X-Gm-Message-State: AOJu0YzA6/8e4+zbDu89aJOg30XhjDD45O/56z+qzKxJZpDVMQcYzutJ
	zZLf6gMmj6fVOKgIrqgiR0H5iKMNU16XSgVgCmJtWSFyBUEjRCw1IFSu9JH1JMjH1aU+UA==
X-Gm-Gg: AZuq6aKezhomn0zxszvON7xx4eX8kx39Znp3EPDlou69llO8U6SOLeF2U85L8pQZFTC
	c2nfoDiUD7/9+JMUULKeBGN0PK0TkraM2fU7WX8PfgyW9Kb+Ac8qxlLyYYrdr2LnhMyaIYUN7Oo
	8BKOPUPDU6cSzLnm1BxQtE+AN6TgOiVqeV0ecevHERLgm5/+uU94aIWUG//cn3/UnPiwfV6Ca39
	VIEAzOWYCIBoOya8UpPfcYJ52+7qGC3oUp/7JDqZRVZtyWcHAJFsB1cdH/7Sbm3Vv+Gvhq50QRf
	PZHveXsVa2y4V3YTutlOYB4yasyIUwPix2pObf5FF9beFIzNhwh2jGoTaVdfgjlNbGuycx34T5O
	iVIy7PHyiPnx2Xvzg7RWjt6dx+Yx37wW6fOjznmgRt4uS+uZqTNHTO+k4LOyQS2RU5STlLi4X0i
	CAPmpQoX2/SZbOeaRf22IKhzeAsfjZEoiTMD6QkZMh9mR7O31IhgAdU80=
X-Received: by 2002:a05:622a:652:b0:502:a1aa:7a65 with SMTP id d75a77b69052e-505d200a67fmr129641951cf.0.1770066496180;
        Mon, 02 Feb 2026 13:08:16 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337bb9a30sm117547431cf.23.2026.02.02.13.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:08:15 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v6 0/2] improve_kernel_cve_report: Add a bbclass support
Date: Mon,  2 Feb 2026 16:08:09 -0500
Message-ID: <20260202210811.2136027-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 21:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230404

Changes since v5:
- Update the maintainers.inc file to add new maintainer for the
  vulns-native recipe.
- Update vulns-native recipe to remove the variables VULNS_NATIVE_DEFAULT_SRCREV and VULNS_NATIVE_USE_AUTOREV for a fixed
  SRCREV usage (AUTOREV will be recommended in the documentation if the user wants to use the latest available commit).
- Update improve_kernel_cve_report-base.bbclass __anonymous function check the provider based on
 IMPROVE_KERNEL_PREFERRED_PROVIDER corresponds to the SPDX version used. It guarantees that the correct SPDX version is used with the
 improve_kernel_cve_report*.bbclass inherited.

Changes since v4:
- Add a new commit which contains a new recipe "vulns-native" to clone
the Linux Security Vulns Repo.
- Remove the tasks do_clone_kernel_cve which is now done by the new
vulns-native recipe.
- Update the do_scout_extra_kernel_vulns task to use the new vulns-native
repository path.
- Remove variables IMPROVE_KERNEL_CVE_SRC_URI, IMPROVE_KERNEL_CVE_SRCREV, IMPROVE_KERNEL_CVE_NETWORK, IMPROVE_KERNEL_CVE_WORKDIR, and IMPROVE_KERNEL_CVE_DESTSUFFIX.
- Modify __anonymous function to not set SRC_URI and SRCREV.
- Update __anonymous function to use bb.data.inherits_class.
- Update the commit message to reflect these changes.
- Move improve_kernel_cve_report.bbclass to improve_kernel_cve_report-spdx-3.0.bbclass.
- New improve_kernel_cve_report.bbclass to include the appropriate spdx version bbclass.

Changes since v3:
-Avoid code duplication with a new bbclass "improve_kernel_cve_report-base.bbclass".
-Remove direct set of SRC_URI and SRCREV for offline mode.
-Use new __anonymous function to set SRC_URI, SRCREV and task schedule do_scout_extra_kernel_vulns based on SPDX version used.
-improve_kernel_cve_report-spdx-2.2.bbclass and improve_kernel_cve_report-spdx.bbclass are only used to define IMPROVE_KERNEL_PREFERRED_PROVIDER and IMPROVE_KERNEL_SPDX_FILE

Changes since v2:
- Fixed SRC_URI:append syntax (a space was missing with the append operator).
- Removed unused variable debug_source_path

Changes since v1:
- IMPROVE_KERNEL_CVE_SRC_URI and IMPROVE_KERNEL_CVE_SRCREV can be used to set a different source repository
or a deterministic revision.
- IMPROVE_KERNEL_CVE_NETWORK variable can be used to use this repo offline
based on existing fetch repo in DL_DIR.
- Add support for SPDX2.2 with a new bbclass improve_kernel_cve_report-spdx-2.2.bbclass.

ValentinBoudevin (2):
  vulns: add a new recipe
  improve_kernel_cve_report: Add a bbclass support

 .../improve_kernel_cve_report-base.bbclass    | 64 +++++++++++++++++++
 ...improve_kernel_cve_report-spdx-2.2.bbclass |  4 ++
 ...improve_kernel_cve_report-spdx-3.0.bbclass |  4 ++
 .../classes/improve_kernel_cve_report.bbclass |  3 +
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../vulns-native/vulns-native_git.bb          | 19 ++++++
 6 files changed, 95 insertions(+)
 create mode 100644 meta/classes/improve_kernel_cve_report-base.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-3.0.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report.bbclass
 create mode 100644 meta/recipes-kernel/vulns-native/vulns-native_git.bb


