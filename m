Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552B7C48BF3
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:28 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.18118.1708013904159971627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TbLVz8yD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d94b222a3aso9579425ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013903; x=1708618703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4boQPIRK1J2pp8nsopD9uWd8tfzQKOWT1EKWfEUlOxM=;
        b=TbLVz8yDl1/rN+GXgyGKbNO1+dqV6Ne79z3f/QZWrw3Q2fZS2K9zVk7GvRv7dt3vho
         jWU4lQUe+6T6lvsgsR49HBnOoSQ9UdNMf0bzqcRtKRIV0w+Us2dQPq+RgJL20ET6gt21
         OMRVDUZ923AIU1JWOEAs6BBEUiRtOhcLfenVhBC28dekMyyJKoVEHz3IxW4O+ANJFORZ
         m/lxjaXxWu66jo9dJNr+oIe5XoLybD8sbI4KmD0vci7DDVGK2sI13SSigdWAEi2+JccU
         leWG4zlmgdt6FfAODbQocseguxy+QIBbVPhIIr3h0HlzmXjJOREyduQ9v0FixgfRhSHq
         B+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013903; x=1708618703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4boQPIRK1J2pp8nsopD9uWd8tfzQKOWT1EKWfEUlOxM=;
        b=QyqHEgBZTzR0cDFOdcFUrJPQlZZgcUJsnNoT+IBSk3TdFAbBH+PJnVUXpdzIpXby1b
         3gYZjyNts7lC43QMlvUNHoGtF3kXBRXpldmScLM0QSq494mKppI3vhaWQXWsaQo5SoJo
         P54pLFlZ08wVl4+IcfBMpeBgEwgJzaefoCOjUMTcEnH/PXpvgK3bLMBWPOVKRj0Cm5Qn
         WypRegXrcc7dQHFflkJH1aEE0nAlv3AOxcBzuyVpUOu1T871d6NipoG+bjl0APT/XYYr
         ioOCzf7AMnbQuhSW7UObhg4o7BsX7m+LgbxMDohCnJUcY0TQoScOnh80+/7HWNl/Wx7J
         TDqg==
X-Gm-Message-State: AOJu0YxZFZRzTTFDulMbTHxEv6+aers+wi3Rwe0OqPw+Ar6dhoPn+hYA
	3XUNzmayXVo9aO8YwWFbQ3cG+qOgpzP6pFkhZFBMInoO1avgBzVuRRk9KZ7sSiHfHcHMmNkn4MX
	/v88=
X-Google-Smtp-Source: AGHT+IFS1crCNVPKFxfBYtJe7pi3SF7+Ynl09waxCXocqhZ8mkT9ZfYsKkhEuf6Zz1VduRErI4a4LA==
X-Received: by 2002:a17:902:f812:b0:1db:466d:f309 with SMTP id ix18-20020a170902f81200b001db466df309mr1800500plb.49.1708013903466;
        Thu, 15 Feb 2024 08:18:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 06/21] cve_check: handle CVE_STATUS being set to the empty string
Date: Thu, 15 Feb 2024 06:17:49 -1000
Message-Id: <a8ccf2abdc89cf4ae3dce1fed4163e3c1399e528.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195525

From: Ross Burton <ross.burton@arm.com>

Handle CVE_STATUS[...] being set to an empty string just as if it was
not set at all.

This is needed for evaluated CVE_STATUS values to work, i.e. when
setting not-applicable-config if a PACKAGECONFIG is disabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c9f20f746251505d9d09262600199ffa87731a2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 3fa77bf9a7..b5fc5364dc 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -231,7 +231,7 @@ def decode_cve_status(d, cve):
     Convert CVE_STATUS into status, detail and description.
     """
     status = d.getVarFlag("CVE_STATUS", cve)
-    if status is None:
+    if not status:
         return ("", "", "")
 
     status_split = status.split(':', 1)
@@ -240,7 +240,7 @@ def decode_cve_status(d, cve):
 
     status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
     if status_mapping is None:
-        bb.warn('Invalid detail %s for CVE_STATUS[%s] = "%s", fallback to Unpatched' % (detail, cve, status))
+        bb.warn('Invalid detail "%s" for CVE_STATUS[%s] = "%s", fallback to Unpatched' % (detail, cve, status))
         status_mapping = "Unpatched"
 
     return (status_mapping, detail, description)
-- 
2.34.1


