Return-Path: <yannick.gicquel@iot.bzh>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 847BE71D9A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:23:43 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id r144so73031258wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=W7FgBaVjcp2YyzvzogV6YKlaTd6q/1k0MAKHuk2aM1A=;
	b=k2e9xU3YwRv8gAJFZGs5USbAMVEEXPUhGvY4hdgRatxhMI7nGeK+nPa2ECVcUcg7Wb
	Emr9JO+hoAKWOWUmGzOfiZGym82JBXmcDkK2QN+RYYofy92LOCBie1qYpk/Olimmn3OY
	TQWRUL6UAONg2H7d+2eeliYSUpAulmW8re4JgZxsBOa1X+/rbXWQrRGD4B4bC225BzZ3
	UyA7zvX6X22RI14Vl0NNdvIhAoZfrN4VlvYqlW1GV8Yj2nXLnVmSQae61suC+1QbQcCm
	X2O2p3lCqOLVqwSkAX0jWcw8Vvui4BnX4lUNy7Y3C/FlqIYF8/oLoUcmAI5hDNhL56Bb
	F3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W7FgBaVjcp2YyzvzogV6YKlaTd6q/1k0MAKHuk2aM1A=;
	b=mRrPyozmQytg7l+mO+L0y4zB2uGqReeFBfS23cpb96bl+JK6nc0NZTVMRGDx/jtjkw
	r2L18y85v+tbo5Zio+hf1G1iP7Vr7MksR7xdtNKNTOjlwDuu8vHn2oCwf8qUy9Ebsqe/
	nXlxuPKGud3/784pWVGtri0crV4yi7sxriKjD2cSHMmt7FNDS/MwcRnw6bAocDjY4hk3
	bYkVd7E40nVlS4KYMytUr3XeqywmG0KRklFequDwEh0WXRGNU1b1LD4npq/d5CCf8ROE
	szR1vLlc6BUcLO7saDr014zJaHG/lLuP1iRP22jLpv8o4Wa6O03rbukFNRVMwp7wdXHT
	tqag==
X-Gm-Message-State: AIkVDXLeOSUznAhU2gi6Z5HpdXIQVK96NkRUrJD1N/bVIE0n21rWmOkrTwAtspr5V9PBPg==
X-Received: by 10.28.92.83 with SMTP id q80mr2625045wmb.69.1484317423557;
	Fri, 13 Jan 2017 06:23:43 -0800 (PST)
Received: from pollux.vannes.iot (lns-bzn-38-82-253-123-24.adsl.proxad.net.
	[82.253.123.24])
	by smtp.gmail.com with ESMTPSA id 204sm4638837wmj.7.2017.01.13.06.23.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 06:23:42 -0800 (PST)
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:23:17 +0100
Message-Id: <1484317398-25452-1-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] ccache: enable max size setup for ccache dir
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
X-List-Received-Date: Fri, 13 Jan 2017 14:23:44 -0000

ccache directories are limited to 1G by default.
This patch enables the configuration of their limits, and as default
location is TMPDIR, it proposes a size limit to "0" (unlimited).

The setup can be overloaded in local.conf by setting
CCACHE_MAX_SIZE to a custom value if needed.

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/ccache.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 93fcaca..8a80040 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,6 +1,21 @@
 CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
 export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 CCACHE_DISABLE[unexport] = "1"
+CCACHE_MAX_SIZE ?= "0"
 
 do_configure[dirs] =+ "${CCACHE_DIR}"
 do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
+
+def init_ccache():
+    # dummy python version
+    return
+
+init_ccache() {
+    if [ -n "${CCACHE}" ]; then
+        ${CCACHE} -M ${CCACHE_MAX_SIZE}
+    fi
+}
+
+do_compile_prepend() {
+    init_ccache
+}
-- 
1.9.1


