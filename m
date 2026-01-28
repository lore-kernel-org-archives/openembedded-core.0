Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36768D3F094
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 16:38:52 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1825.1769618327798946730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 08:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nVCyozTN;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-5014ba54cd0so5741181cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769618327; x=1770223127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnpENetSBlxPisLshQuYv0/oZc4ScR0hI0RjLmxGLfI=;
        b=nVCyozTNJtP7+zfrWvgFfpqFrNRPoOqHupvA6zNDt20cztMD18o7QjgnGthYQnrtZI
         lsShCGjoUzaGIrtVAtwDWqGL6A4+ZOTR+VRkObWYcQpunIoFXmRb3WPofns5y2Vzr9i9
         l8GKzbiw1J/4FXbwK+bzs9PBJQoHzzighn90WvJviDmAwRCKzYi/Amn7Gw5xr4bgT1X4
         aNmd+eST+PM0isW22eb24EuwbpBuUl7+NQXhobX3SJxpsR4A73sAW6nXslmhHxecKTCw
         S6wol7BNYp2u9m/DOqd/1jIloqs9k/J74RIEbPyLQxgonMBSfu5R12AVh339q4eFdLWQ
         TqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769618327; x=1770223127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QnpENetSBlxPisLshQuYv0/oZc4ScR0hI0RjLmxGLfI=;
        b=bgBXE5czwHZmMjln1yysz4leKtD5bp+lJ9nrS8C7WxS+xyDPg2donhZdJkq6/PlfJ7
         VgYRh6z1UimiEUtyYogIY5RQglhHk1jyqJWnvaI03t/YUDXbtYbc5YTzskg9MaseAu5C
         4FR3suiM0edCbdb4V9PJnLAYFqXLgwaICP/SpgvrcpgHfzYPjBH/gdKiWk6f9nSLoiNH
         YLA/XW+YpGEBbhwkORHftIJqfF7ykM7AOK6CGI7DGMge0TDiqhTMdCgk7qGMSVYZvBJ1
         BBGnA4yFdpDEiICpUgZuwVANU7+WUQn2gFLRgJCoAso6nXyT18mdjM5FF2TqeiCOTRSU
         477A==
X-Gm-Message-State: AOJu0Yzk37oA/MdDnq/qHJ+91aD7UQ9rmS0rNrF8Ei5D3nbqgfXBTq9w
	L1YTIOc2xl6BmvbeCzYY+fNiXWg4FzzgAPB9Gq1sK5e7ZbScGgdesyA2DdEraeeK4gE=
X-Gm-Gg: AZuq6aKmEM7ktr/tDL2MEk6lO+DSiY2Cz/G1H2nfA9xRhWjD+O5Xdl3vKUMBJgKWysq
	H/ecEzNvQudKQmsdUL/XfTZ0+9YIdSHMMqt8aiz5/vLjW7XOhglMZc+PcYH80tm9MMCQv83uWc2
	BYnyc21OwwUz/NAKABlIvgBKNLxPDejddA1nJqBEu4PXtvex72Lhu2BQhgaML1uv2o2R2QkADWp
	VPwzBHG6JJd2GFiFE+1sDUFEx1ZxA8o3JAhJoQiffPgT1qJfJfUdPAOP6VVCrlq8FmJXOi/GW5T
	k4EKFNs9ht7/QNWmPd7WfZkScRXvFMAxyFFIVuPXADKAZJRVG/VDn0rkp8tPZnaex1DuagYto2G
	MfkVaeu7ltoT3axuzNxet4RE6PtnQgj9pyyyWKdMditJBgfNudHVgNVzvj7uI+w/UTbH9CRfCQP
	6TaN5IWaUG+mMF1DsjvwW742PtyAJuCdmWYjjKW52CZo5KT+VJzJm/iko=
X-Received: by 2002:ac8:5dcb:0:b0:501:5260:51e9 with SMTP id d75a77b69052e-50341ae2e07mr9598051cf.7.1769618326731;
        Wed, 28 Jan 2026 08:38:46 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337ba4457sm20118311cf.20.2026.01.28.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:38:46 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v5 0/2] improve_kernel_cve_report: Add a bbclass support
Date: Wed, 28 Jan 2026 11:38:25 -0500
Message-ID: <20260128163827.386933-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 16:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230101

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

 .../improve_kernel_cve_report-base.bbclass    | 60 +++++++++++++++++++
 ...improve_kernel_cve_report-spdx-2.2.bbclass |  4 ++
 ...improve_kernel_cve_report-spdx-3.0.bbclass |  4 ++
 .../classes/improve_kernel_cve_report.bbclass |  3 +
 .../vulns-native/vulns-native_git.bb          | 24 ++++++++
 5 files changed, 95 insertions(+)
 create mode 100644 meta/classes/improve_kernel_cve_report-base.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-3.0.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report.bbclass
 create mode 100644 meta/recipes-kernel/vulns-native/vulns-native_git.bb


