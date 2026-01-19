Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCC7D29C5C
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 18:41:12 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41973.1768848066965001944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 10:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H9VSrPFt;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-501423de76fso6866081cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 10:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768848066; x=1769452866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlDhvBrppR3sXNH9C6fay4cjrkngxR8gTJScVTE3Uq8=;
        b=H9VSrPFtIGTzU622OZsoDvXOu9qHpXS6DQvT9YfnFWb27ojn6ZMPGi6o4/YJzrB7xI
         Sm2wHC3ATs+uR9L9JVrpgCZvKUgPHr3Ldl7PfQ6Sx9n7tNyGkMwxO6ZLKHgAJT4gw7yb
         kBXtRSVWNfp39CCNcybsXrZNFS58cxU/gX63Xjts16VjEbn+2zaPYYlfkI+bPkIJ9qnG
         Xtdj+N2AD86Y/cKTpW35WD1+LsYMtqfZC/Y+oXKp9EoEz6EOQT1UfH5ar5Tqz2Xve5FA
         nsknejZT851NwModezO97QXiW+epcpfbZzjY7uOiGlu2217Nw3iJesn3WJ4VUmR49Kbd
         Yzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768848066; x=1769452866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mlDhvBrppR3sXNH9C6fay4cjrkngxR8gTJScVTE3Uq8=;
        b=lu/GfNIAuc34tAZPr4H7SVLKASKiyr+OuA4rdFPmt9nvkXlW2QNRtFhQWwPnUYaSki
         eTYwJf1ak8vnoHZ90FX3rOZHCaJWZ1Undpshce6N/VX5AywRWML2ytZbtD1aa+pOV9BO
         jsGqMBJTOfmU0chrKYH1ALSWFjSrKCDvMa3wEnHdavJcjvRfu52C71nY6TRzqTt+e677
         n/smSvyA5AO7RRZh5EtKfKvAYcXombAMFjcElBPmQEavnFDYOsApKN/7ZI71PVjxusw9
         +7DNHT0iedFjDbZteKoHroNPHQz5IiA0C4qefh7z6qzzrfKjYt94zm7XBRfGOWaYdQqi
         Tk5w==
X-Gm-Message-State: AOJu0YxNQfiUlff44nAxz6vnNqHPtDwTK8pZtwEwzl6rRLuf3etydJWR
	21eJyQbemroiuQpv5RhyZ5G5eiuDC9MD/ujLdzxHrWBxfb1NiGFElvAdypits9NnMuZ19A==
X-Gm-Gg: AY/fxX4Aub+3jnh/9HUnwrPiVC3jv2mfE7sv+V/hnpHHTYD9rse6igJryMuv4tsdZnW
	Yz+E0yEutsYY25WKYrTBR5ECIncXb5p/8YtP9/lSCyEaO2pNgqouRe6hD7vxLM+KTwwbnAIlMgJ
	QLn7WHOUYnOnKZvcbn3s7krVZ9R+x46Q92EPmig/5Tp5jhBaDAAz2E1k4OVcLR7hEqWGWxtHkLt
	jB0QBfJ1ECSVTibY6o8N9Dy4Tm1oRuVY5RXwTQ5s0NOrgpWQ0YLQDDgfZW1ntmEGRtkimJgdYAX
	fwbyC2vw615FzfhADWzFdD0fc2SA1Y5P/8PG2EJ9PYi+QTXSqlBBS5HKZJ7z5LsWBFJXy4fvO8r
	kUoQj8il9EN/9yig7nk7VFVhQfsxacuvXEgGEYvYRNxTU7A+rcFTj+iXuJtP0RaY8m4WCMc6CaF
	hMKogSBk6tzCsQYwnxrPZaVc0TmR4G2AiQ5nqLGd7ghl+Fa4aA8wu1y/U=
X-Received: by 2002:a05:622a:1aa8:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-502d38987f5mr5949401cf.10.1768848065901;
        Mon, 19 Jan 2026 10:41:05 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1c3a5b3sm77805701cf.0.2026.01.19.10.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:41:05 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v4 0/1] improve_kernel_cve_report: Add a bbclass support
Date: Mon, 19 Jan 2026 13:40:49 -0500
Message-ID: <20260119184051.2878026-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 18:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229631

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

ValentinBoudevin (1):
  improve_kernel_cve_report: Add a bbclass support

 .../improve_kernel_cve_report-base.bbclass    | 149 ++++++++++++++++++
 ...improve_kernel_cve_report-spdx-2.2.bbclass |   4 +
 .../improve_kernel_cve_report-spdx.bbclass    |   4 +
 3 files changed, 157 insertions(+)
 create mode 100644 meta/classes/improve_kernel_cve_report-base.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx-2.2.bbclass
 create mode 100644 meta/classes/improve_kernel_cve_report-spdx.bbclass


