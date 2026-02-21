Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734DBC5DF8F
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:53:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14685.1771649620881477815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ji98E72u;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-482f454be5bso34677605e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771649619; x=1772254419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nqHXSIYCanwfoBcv/r0J2TGzU7OB+GLPi5f3Cwb6ou8=;
        b=Ji98E72ueEsSsZqNPXTQeqvekI0MlHgFw9YhPZBTyRNQiTztdxJKJp+svU/U8FeHMX
         pLtc0LBgyEu9tjDPGgvpLkixnnHrKfDE+NCs7rJJIRu1oRL0wIJesLjkICkAOoycn6C2
         gr9N7fXZMr7VL0XSasKXY//Ojyr1RDrxq4j1NJF9WgYlhwRI6ovd5grvEBdLre07xZgU
         5+cPWw8nIOq63eARgpfUxC8pkLDyJwQU/jcmQMBJ0g4ZO/DaP7hZPcdSAFm3pjHaYQk+
         0GRd7HHLhqGaIyBzyqTd7KF3Sr34jGIdxfl4xtLxjip51JojFG0h1wK6pDHOmu4vkoWJ
         cXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771649619; x=1772254419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqHXSIYCanwfoBcv/r0J2TGzU7OB+GLPi5f3Cwb6ou8=;
        b=FBOJ3L8qFa7TDaah6n0SWGIuWW+Ap8BeUhDj1frXA5NQKymy9m211YiwkAvk3JjQzR
         +B8Oxd9oSLYybQlr5lBLJdnws/2+kP8XpOUD2djGLVOgAX+pnHw7qAdXosnZjbkB8ZON
         irqnJKzuB5YGBeyQcRMSTs7GIJ5PEliTT8HdsGb6tEx0qW0J0WgzRrKcrqzYfGJi7LQ3
         nqld0kKIj8XIrjoUIEqsgk5OALpSVNl6uEpGwTwrMnpnjFPaiYQ3ADi5Cp2v3wfoiP/u
         sYBArBGhlKX9Kv7Gz7ET9nq4R3HOBvxG3MUSe5VbiXldbfpPsHzdUzLDdWbCLgYj79Fy
         eJGQ==
X-Gm-Message-State: AOJu0YzYOKFGBAnI+sn5L7xcwGUiDdt9djwHPvD3hC7SwJ03nfV+z7Fq
	K1KLC69cdS1tRktroAMRB22MJkrm5r+tqU6rZ/A1ONOyfWVDmEOL2If4o0ycxQ==
X-Gm-Gg: AZuq6aICeDTo6BO68qEP7dUqhUDMPo5n8h3+8PkHZWREi6fVyI/V4ARtJHDMDp/bRFm
	5Vp29IVIWTUsSBpp8YkP9BbypzOOY1TxEkpsTiendZdoswVc8v9p76wuwDHG77k8ZeCBn9pdFUM
	YywYS+CByA8zbQpoCiDFskFtcPcTatVa87hnSrh2CrAO1gtIkClEsPfbsAx14GlG9NM2A6ao+Km
	BMhdztkCYmATI0zSSMf0ZYIzY5RWCpjoV47QnQk4jITLZQml0POffmqiP/5+pDCunLCDr5cW6jP
	blUmTP07EAMQR+IH74jCkWBTKSy2pZH0RSRVBbgBbSdYzk771GBvD62WgHe+M2CD2luvc3zJUJa
	zLsYlsbUotXsWzXMG1kEZvHl5bhSCtuqNnYvfrpdcpfO/8uMH9X8N2nm0UrOkupDvPn869wiyuA
	haOT2LTJN0ee6OnDlbZQwKcD6VQUuf221ArEY=
X-Received: by 2002:a05:600c:8b5b:b0:483:a352:b4e4 with SMTP id 5b1f17b1804b1-483a949e600mr33515805e9.6.1771649618921;
        Fri, 20 Feb 2026 20:53:38 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a4e8d392sm79561495e9.2.2026.02.20.20.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:53:38 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 0/2] spdx30: Lifecycle scope variable declarations and test
Date: Sat, 21 Feb 2026 05:53:35 +0100
Message-ID: <20260221045337.327402-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231577

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This series adds bbclass variable declarations and a selftest for the
lifecycle scope dependency classification feature.

Depends on: [PATCH 00/14] spdx30: Enhance PURL generation and SBOM
metadata for SPDX 3.0.1

Changes since v1:
- Rebased on top of the PURL enhancement series (Series 1)
- Removed duplicate get_dependencies_by_scope() (already in Series 1)
- Fixed SPDX_CONCLUDED_LICENSE deletion (must not remove upstream code)
- Simplified test to use LifecycleScopedRelationship type directly

Stefano Tondo (2):
  spdx-common: Declare SPDX_FORCE_*_SCOPE override variables
  oeqa/selftest: Add test for lifecycle scope classification

 meta/classes/spdx-common.bbclass     | 13 ++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py | 39 ++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

-- 
2.53.0


