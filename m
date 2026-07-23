Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545EEC531CD
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:07 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19521.1784798757227139206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BbZkyeD5;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f707e5d75so265269f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784798755; x=1785403555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ny9+rVIGeUF7w7cEISomQbWqc47RCS/2ToNxP6RAmrk=;
        b=BbZkyeD5bkojioaySwXveOFkhASwaHUxxwt/LMnglGq4brCwQg8i/n3rff//PDDFfS
         gkCInPmV4qXd6+tUvdlCEyeeLKepw08FP+8CBrDg7faI6lqCD54lnVKLPbHio7HRa//I
         e0m6vD3yBCqUwgH3sOGTHA0OseM9N2l2cs33xZTxtx0k1yTj6+87o7u2MPjAufkZuTje
         BmkzhLARJaj328ilSsCewdxRrTcTmT6bYGEN4pw9A6yMA53F09jBzO7isRenv2b3TrBJ
         nIQ3vcLOG5TTUdyRJFcTK9d4sKxAY6MRmcfP47pOzqryfK7TXwtik72oEqaTG+uH0pZA
         L3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798755; x=1785403555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ny9+rVIGeUF7w7cEISomQbWqc47RCS/2ToNxP6RAmrk=;
        b=tJDW9VY0sM67WYU/h/qVxSvAS70RmXRT5apEacqJSwQ3N7AxQNjqNe+TU6ZOX8gb+7
         4wJaXdH8mjPWTXaNmlq4db0vTMk4P1ifAkWdCwzp0a4Ti/BfTDBprTxon6mehNYetlQA
         kVq6/DSAow7ufb1Rp8UwrKQ2xxTrc9fcrE1I2pJTlb+93+gzZGAxgSVAfI5vd3oYSxaR
         rNnecRVtughWkQh4IuD3NjB4yAT+ZPtw0i5KvNK44r496Ni/bRrI194qKGdTjuomCd9J
         AFKEx62hdldLbHfCmwAT/AVzwbk2Sl8/OjC9XhOE1aFdEOR1kk2UbPowl/l4RfyNJs76
         N1sA==
X-Gm-Message-State: AOJu0YydFp8kqF2dJhAd238WXZEfrI4m2SZO8mSrrHuiBVNpcZRL+DxX
	OkhULCllmHTbnOPtQw1oFtrBNyVeBYIuRgMr6uEMHEVSxjiD0Xgj6XPoA7QbTIA5
X-Gm-Gg: AR+sD10ezDIhYtVWgDkqI8C5DiidwM047cXBwsQSuLYRfqa9/GfUG11qZONV8GKePkB
	DUoI6EQLYZac5uTceIYyUqZfGsCxaiG96/PuXeB9HRL+RxISRU5CIz5qyVvP2e7TXcIMhN/VDv1
	4SKIT0zeIHyEHed1sgMzp9Kdt63AJTaawPXoAIj52EqNahISB8J0nAFtEXAZSgeAW5e6RqGGhXG
	2rWuouULLpk4icQ0jfGfoEL2WGZodfMj2WiyCr+xv7o9FmwKoSeBdzRJQpkO7K1AfmrFwWJ/X44
	ZxUy9DbMhNqNCKSm3DbBM7Jxsp4MT6FnWhIfKIblEIO4UCjXD/EvbfSY9VmYRO39wD33soUi3/U
	ceuAYNRLHH+ef7UYQ2P9B/o62NqHmuqHkdQ83Hflhjqmv/jpn9dvDcDXfzMpIYqe2G+p2A3wmNp
	OP1GeHO0/c14ZqrqZ97PvG9bUGJT4aMf1/S3Bu/sfg8i5AWoy5c+iJkbEvQ3qm
X-Received: by 2002:a05:6000:230a:b0:47f:8817:eb6f with SMTP id ffacd0b85a97d-47f8dcb377amr2825468f8f.49.1784798755071;
        Thu, 23 Jul 2026 02:25:55 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5c4sm13367926f8f.8.2026.07.23.02.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:25:53 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] glib-networking: clarify the LICENSE
Date: Thu, 23 Jul 2026 11:25:43 +0200
Message-ID: <20260723092543.81495-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241804

From: Martin Jansa <martin.jansa@gmail.com>

As suggested by Joshua:
https://lists.openembedded.org/g/openembedded-core/message/241541

https://github.com/GNOME/glib-networking/blob/2.80.1/LICENSE_EXCEPTION
The text of the exception is very close to the
https://spdx.org/licenses/openvpn-openssl-exception.html (with replacements)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.80.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
index d81d7d75e9..aa13900da1 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/glib-networking/"
 BUGTRACKER = "http://bugzilla.gnome.org"
 
 LICENSE = "LGPL-2.1-or-later"
-LICENSE:append = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', ' AND LicenseRef-Glib-Networking-OpenSSL-Exception', '', d)}"
-NO_GENERIC_LICENSE[Glib-Networking-OpenSSL-Exception] = "LICENSE_EXCEPTION"
+LICENSE:append = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', ' AND LGPL-2.1-or-later WITH openvpn-openssl-exception', '', d)}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE_EXCEPTION;md5=0f5be697951b5e71aff00f4a4ce66be8 \

