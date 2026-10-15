Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA12CCA462
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32823.1792040630226083786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GTyEHDUP;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so38667665e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040628; x=1792645428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2BXre/4kpMyy5mbTmpOVhwWOKUDl6RaHw6WrkpdEylQ=;
        b=GTyEHDUPKX2MMA+mpGyu0tDE5h+Op717RNOUpS/RAUV9WnqITWUehRnjMDaWYiHpnB
         PdT4Zw7RdTRYC+YfT1x0yZE9x0uLBIaw4yXYcZchO/RF24/O1W5VgZPjSEtP3jwRLeb4
         y1kO/DecyFbd11qwFinDNjyJJbTxaXI3RgeMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040628; x=1792645428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2BXre/4kpMyy5mbTmpOVhwWOKUDl6RaHw6WrkpdEylQ=;
        b=tfjJha02LhQd1PqhxUWZ3WPzM9wSKpUQzU/ixinNqkA5xCd3rTXX8XrHYXOyu6pRaM
         jNKsDcl90BcdGJJIBtBweLpUrv+XKdatYsYXeSn+X+nk9SUH4Kast1lyDLEELyBeydTO
         hlYCEVz8YZlIEK/1LE2pFahVL0ibpoWbAxnfrRnxmXSiGja3V429+tIdAYzH77pt7d1V
         oefbQ8jDKK1MUYlvF2ZKKsmZMl5LkMK9hQGgOBCPTSNqTTIyVTqWhM0Qh3Ici7rZhMyU
         dvsLDVm5k6MfeVUS8BbWEIPxcygM0/kjGPVtolL8zkwWyQx7+5VcmnRIUAUBE8jTkYHK
         xtsA==
X-Gm-Message-State: AFq9FYLQ0xLyAifoDohmcbtfRxODdVpr7Z6NmRtaqFObazRoIVPCUN3C
	ZvWz2t+3gQo5lUN38p2fcO0kODrspdNaX0h/h92lvELqqIf9Hsn6lUeCbY64z75V6QKpeZzOfyR
	9pGWie8U=
X-Gm-Gg: AYBFou0GbOyutNOealFWS4EPkhKXenorXEV/xpeciUnj+nlQvVTwnj+lcVj3wlBkL6Z
	ssAsudf+9P1uR/cCfFHkMn7r9ACGdFaIWPynGeVGiNmPggwa4y6SME3VEwEJsLC1CqMQjk8h0WZ
	wlcRI3uNdED2YJLO+xfTcwXnOItd86m0zHjf5hdI6sbX3afyjANDzwMtve9yvAGsmXBJXG63IQE
	TujRV/MLh8qhAs1hQ6dqm/RhxfziGdjjP3zK7O5SZTqhbOY1YE3spybZj0O6+hNsecthFdeXu4p
	RDJlT4SBlRQ/TJG8SADpPHZXjPqXT3GvPuG13oQ4fLwylh8xsJd0Abu0egLDXu21mTHXxgKzrKS
	lPn/Ok0B7AdONfat9O5Y4w8tX+Vcj2wp1s+rnVNm0tRKOiw3VqQQqSyRiXFCHPRAFx53YpEtiQF
	OUiap0wbllMG6l+kjZ9JlGDLQsqdnX7uCNqjpx5jBhVgizjGghF/9oyulikpSY5Kb2rDUmOoWEh
	PfdEsFAlGXmiEKBv5HjW+JSfTC66irQEZTRMk2HmoLWka4Xhgyde7I/67gW2BWjXHovRrjvbA==
X-Received: by 2002:a05:600c:6215:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a18e4b72e4mr319565045e9.19.1792040628303;
        Wed, 14 Oct 2026 22:03:48 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/55] libxml2: mark CVE-2026-86139 fixed
Date: Thu, 15 Oct 2026 07:02:39 +0200
Message-ID: <5485bd1b14421f0519fab93c28e03cfe5bba9969.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247814

From: Hetvi Thakar <hthakar@cisco.com>

The fix for CVE-2026-86139 adds a zero-length guard in
xmlURIEscapeStr, as shown in the upstream commit [1].

The libxml2 2.12.10 source already contains the equivalent guard [3],
so no additional patch is required. Mark the CVE as fixed in the
recipe.

[1] https://github.com/GNOME/libxml2/commit/8edbbdb09f24d26a2f900141fddc2b9d014f53b0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86139
[3] https://github.com/GNOME/libxml2/blob/v2.12.10/uri.c#L1689-L1700

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/libxml/libxml2_2.12.10.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 28ae601118d..53e8660366e 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -46,6 +46,11 @@ CVE_STATUS[CVE-2023-45322] = "disputed: issue requires memory allocation to fail
 # https://gitlab.gnome.org/GNOME/libxml2/-/issues/958
 CVE_STATUS[CVE-2025-8732] = "disputed: the code maintainer explains, that the issue can only be triggered with untrusted SGML catalogs and it makes absolutely no sense to use untrusted catalogs. The issue triggers a crash if an invalid file is provided.  https://gitlab.gnome.org/GNOME/libxml2/-/issues/958"
 
+# The Scarthgap 2.12.10 source already contains the equivalent zero-length
+# guard required for the xmlURIEscapeStr integer-overflow issue.
+# https://github.com/GNOME/libxml2/blob/v2.12.10/uri.c#L1689-L1700
+CVE_STATUS[CVE-2026-86139] = "fixed-version: xmlURIEscapeStr returns NULL when xmlStrlen returns zero"
+
 BINCONFIG = "${bindir}/xml2-config"
 
 PACKAGECONFIG ??= "python \

