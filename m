Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B91236FFFB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jan 2017 01:02:57 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r144so21428353wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jan 2017 17:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Lipp/eem7IhCdySwtzG0aJkDI0oVnndbH02R7IfnRvY=;
	b=tfIveVX7NbwpfXHCgCaabJ2nZsm/kY4pXbkxynRTqZC2KEXD6gk2CfDTIwoNKpcKPq
	MzZ8OqNr3zQmnhSOALmw2d0UvdKtVupEQQIgqJa/Gl6ouaZnlxhtCp/ByuL1EAIVsxQh
	H9smT8Sib98ypHEMcoTwAIidsX4MGdwJ2xHRVYxFlGvU7PetNhp2jIgDIq2YXFadyC0M
	7McO2vz/mSGxxobucHqgEIx9hicH2P/ZUQVif2ZNdwlkC32GCPpfdoB3WhSRNBBLYhr1
	douErr///vfsOr8OoydGDWIXNe52Tllh63GcU7u9Qk+g0EXvzih6vF/st10H/mjTmVE0
	8Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Lipp/eem7IhCdySwtzG0aJkDI0oVnndbH02R7IfnRvY=;
	b=QMkLX/RCEUDIsUKMHUo9TisPVi5reXPiiFfP6OB25vgLuQ3AW90omDGmoX6XHnTLIm
	sOWVTcCIDC/B0fOCB3Dde+lN6yWhkAAEUh1njZBAVCUfTBafXq00JiFgK4V+86oz4Q53
	8OdD8NvZ190ocokqY2VkSMlh6elUfwtM//hxcmGeE9x9qnE1CqDkU3x64LjgdLlD1LT0
	Z2Zgpsgd3JUWB6lmcILxRPR3k00lDYd5OJF6ygd/dxvD3Jd9h0yxpFA/Vssj7isgEFQe
	YYLm/IpaWE6c6OjTciG7YTYQ07foSNJFCiJyvFX2eE43iS5TgjRqlnPlrNDn7+BvlLwI
	zZeA==
X-Gm-Message-State: AIkVDXI5p1h+i0om9dAhEkoOjaM2pPLvDUlXS8AFh5C40oGVmD+JObBgC0Jyc+np3PmO5Q==
X-Received: by 10.28.140.130 with SMTP id o124mr6858768wmd.48.1484442176835;
	Sat, 14 Jan 2017 17:02:56 -0800 (PST)
Received: from localhost.localdomain (p579F7295.dip0.t-ipconnect.de.
	[87.159.114.149]) by smtp.googlemail.com with ESMTPSA id
	r129sm16748182wmd.8.2017.01.14.17.02.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Jan 2017 17:02:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jan 2017 02:02:39 +0100
Message-Id: <1484442159-32655-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] waf.bbclass: handle PACKAGECONFIG
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
X-List-Received-Date: Sun, 15 Jan 2017 01:02:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/waf.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 95f5240..c4698e9 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -1,6 +1,8 @@
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC = ""
 
+EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
+
 def get_waf_parallel_make(d):
     pm = d.getVar('PARALLEL_MAKE')
     if pm:
-- 
2.5.5


