Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 922AB72F23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:17:36 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id s67so7731444pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=RdM/J8mNmsDl8nnyPV+wlEMJSpVMaOdzB6iLig4Y3Nc=;
	b=KeiYcUcS4dAu/9zyv/yDuKjSn2LhE24vxAZZp40ZMAGgU3JtdQKEQ7Pzg6rwmadJ9B
	Pcgi+bi+GoBL8Jo9Ju7C1WykcfCAu9Yqq6mB2bs+thhiUEexetOBDuCV5PSNOdP6NDYK
	JcS5/4Lr86q+JoB9kKB7DIw+Uz+LNdDslElNOzcHqjPJcfhJZpJj+Ed/j5KdkMZhaixj
	PG2RdhuFEBxtUzXjWAQt8eKyC5RRBlOnPLmurJ0UcM0MbOAVLzzeWNxcRvoeKAsEmJsl
	scn84ScP9b5oCZnwJ4Ux66g3qiE5dbLdboTUpagzXE/BbgxfCIIAM8cAtEZ0EJ6Ei+FY
	83qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=RdM/J8mNmsDl8nnyPV+wlEMJSpVMaOdzB6iLig4Y3Nc=;
	b=tH56YZUZdNkbpnIZ+Pvk1rDki8shAVmEryqRLCXy8WXWPgSytwWmTztbbXEeMHvIE9
	hzFfWMaCKVzmq2M8wA+LD5mUoeTzs00tCOROKdZAzaXq8XjRVX3+MbrHMN+T7Nr+A8tL
	raMzr34KquLO/nFdEznWZ1Jxx7fhVuQobQ0qvp+atFNBz3EnZ6+F+eC6Tl6oLrtW8g/W
	QJ9a9SJlByzS7joc48V8cp7jCXvt/XxWWwogtHgt4QMR3WcexxIBFRXQc0ScT/HkOVmN
	LONTCuRwpSmBRJkw2HotvZM52uDLsEOxN70+STVt7vml0N+g5Qs3wzqpSVSeG001DzRS
	C/5Q==
X-Gm-Message-State: AMke39mMp1aZacbhN7mFPb3wN5YZs751hvFvInWF/6YbXbuBw21BeSG0KPxcEz5ukFRJcQ==
X-Received: by 10.99.104.133 with SMTP id d127mr34877357pgc.52.1487683057694; 
	Tue, 21 Feb 2017 05:17:37 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	186sm14378461pge.13.2017.02.21.05.17.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 05:17:37 -0800 (PST)
Date: Tue, 21 Feb 2017 23:17:28 +1000
Message-Id: <20170221131728.21595-1-nathan@nathanrossi.com>
In-Reply-To: <20170221131728.21595-0-nathan@nathanrossi.com>
References: <20170221131728.21595-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 1/3] update-alternatives.bbclass: Disable for mingw32 targets
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
X-List-Received-Date: Tue, 21 Feb 2017 13:17:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

When building for mingw32 targets (e.g. nativesdk cross compiling for
windows), disable the dependency on update-alternatives as the Windows
platform does not support symlinks or package management.

This avoids the complex (partly non-buildable for mingw32) dependency
chain virtual/update-alternatives -> opkg-utils -> python -> ...

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/update-alternatives.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index ca7fe43417..4bba76c3ba 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -96,6 +96,10 @@ python __anonymous() {
        bb.data.inherits_class('cross-canadian', d):
         return
 
+    # Disable when targeting mingw32 (no target support)
+    if d.getVar("TARGET_OS") == "mingw32":
+        return
+
     # compute special vardeps
     gen_updatealternativesvardeps(d)
 
-- 
2.11.0


