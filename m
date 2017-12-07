Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5666003C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 16:51:42 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id x28so16291227ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Dec 2017 08:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yJsW2sQiIm65ZCkOwTTnHGIFxR2IIoZX6FziMLG9TU8=;
	b=dxeIQPiSxBgaZWWo5RnHOagVozcnIeP3JNCPAlMRe2ATftXYYfNeTPpDmn60QL2Q7l
	5ohLbuuyjWndlRsl3Dv2R3qleO/Mdlz5Xn1k3fiQxPy1EI/SEsx2ibhFxesz5U3qP1H3
	cjb2Uq8SBbjfKvx71qZM+eJIYL9ksow+k4LATYsnB0YKSYPRKwjZ7GZ0iDPITFhxlpGy
	HN6Oyg8RMD+dwnt6CrAdhB0DfJBUX1CFdJL3aemWm588NBOE5f1txVSdz23015gS8xdP
	BYfR65qb6cDeApIRnDKTlWt+QwOW0niWAjoopqnEFpAioCDEwBvEyFiyMZF+cPzXhAnK
	zNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yJsW2sQiIm65ZCkOwTTnHGIFxR2IIoZX6FziMLG9TU8=;
	b=JtdcXuoTp39kQc6WSsZ5hvY9zrab9WgJ3/3O55SZ6Dd+n89imlcGOfL48+VIlQbLGI
	hHMCYMTL/WEdIKrlgJYGhJRwug6ck3RYniHFhBiZ2RbqfH94ZD/6Lje+HrpZjJUIHpKt
	V8nZ7aF2ZaivNdrFTT/7cChkkOo9WU0swmebv+gbqQRYR8/5mMlBd5znfnG0igar1EIQ
	mZVorNV601tiH/QrIcReoX6TEviQHSNkjLffNN79AbNO94KBcz+ofIiJo8ZRXLfykIju
	SK+piOZ4GTQg6nnzNuTA+PyqJ5aVtkrThbYNAFYFZNYSlh6v0Fq5xPTNdvo1pI1fR7Rr
	DLAg==
X-Gm-Message-State: AKGB3mIND09kJrHNp7caudwl3cRuHYDsjNM69Zq9vjnXT/OB0ivgL30Z
	ORbNfOkAtQ0SthOCI1Td0H8GSVdV
X-Google-Smtp-Source: AGs4zMYJNowiO55mlj0xNoKpxN/XekNuGsyeIOT8uCLxiRd/KkucJ4bY5QJIBVuEvv/PxOn8AGgCJQ==
X-Received: by 10.107.142.72 with SMTP id q69mr13721440iod.205.1512665503896; 
	Thu, 07 Dec 2017 08:51:43 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	e82sm2589416iof.34.2017.12.07.08.51.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Dec 2017 08:51:43 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Dec 2017 10:51:14 -0600
Message-Id: <20171207165114.2007-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] waf.bbclass: Add compile progress
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Dec 2017 16:51:43 -0000

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/waf.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index c4698e910a4..f7d95fa050b 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -25,6 +25,7 @@ def get_waf_parallel_make(d):
 
     return ""
 
+do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 waf_do_configure() {
 	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
 }
-- 
2.14.3


