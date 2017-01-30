Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A79E971AC5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:52:17 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 194so30908437pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=RdM/J8mNmsDl8nnyPV+wlEMJSpVMaOdzB6iLig4Y3Nc=;
	b=HDMAC57Yy9tKqulc/b5HWfdYRqSQCmmQKVn5kjkDDz/cKlEDqwXhV0OVofSa9DFN1A
	o0a0Y9VFYkTIgQGSkQYVUWkDSw/OhXVuVqva3ikq0h6iDh1p/22kQvqmx0O6z7gX2rjU
	4+A+fg7j9a1O5dsU/hEO851xmTQxnkjPlrREOTDiIgVw7v8mu4HZC6zpKwhMa0mwbqtp
	45luuJ4wdfwgTzzfpKxsNB9bJ/UC0BsL1RL0zeZOUt89Xsk0XWWPCd8KtJZi+dJkq7cZ
	MX8uj3kWSOhh0+0M6bfPWpb/vL0CJC/oodL6l601ISFxJGZ+ZfPTaT7DN1mujF+dQW6q
	+Q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=RdM/J8mNmsDl8nnyPV+wlEMJSpVMaOdzB6iLig4Y3Nc=;
	b=A8XWzIWyw4SMXw8aWheWwbSxaYEkdpOfM4VdSZN3g+f76XA1lmJNYPsGuYtDn9AgH7
	2fbG2q9pLuDcI+wxrIkw341EX5AkP+8ktHVLdBqdPr+Ts/k9o/Zh8+N2PcMuInKbrImm
	XnswmDG+drzafIaTLVCSJyuUDYAyzVZlrldaOwaxQWUhsuQQ6oltrrQOhpsumUEnVr66
	plCm7Ro4F5gRF6MlP1rXZPy/8+P48AgBFlzZ3LLn6DcICQgbbGhb2jtElwlHKAB1smfs
	nmBr08pO78zwqt+zakrFwe2odsfGCeh9V8JApqP08saZkIXdRiHcMDf6tbwxe1up+4dH
	9ffQ==
X-Gm-Message-State: AIkVDXJZrhTFTD3yPAgFAW8KONqMvg6EfcVGzy4DBS7QjxEjFfMFc/sziji/cKRNiC6gaQ==
X-Received: by 10.84.135.34 with SMTP id 31mr29692389pli.50.1485762737847;
	Sun, 29 Jan 2017 23:52:17 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	g64sm29670163pfc.57.2017.01.29.23.52.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:52:17 -0800 (PST)
Date: Mon, 30 Jan 2017 17:52:07 +1000
Message-Id: <20170130075207.2639-1-nathan@nathanrossi.com>
In-Reply-To: <20170130075207.2639-0-nathan@nathanrossi.com>
References: <20170130075207.2639-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 1/3] update-alternatives.bbclass: Disable for mingw32 targets
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
X-List-Received-Date: Mon, 30 Jan 2017 07:52:17 -0000
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


