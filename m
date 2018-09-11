Return-Path: <lucaceresoli77@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3E89379688
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 11:14:11 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t25-v6so527611wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 04:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jShBo0SK4SG2ZnCefiUxpgLntRhlV4b/vsFnuQhzHbU=;
	b=hs9fbqnuUWiRHglAzexeo5S5gi7HnMB6YDB+y1kgKuvvslotouMjuGlcpBBHXc7LT6
	COMu/Fj9PnQ45XaYqYBSn8mVusazdm8f17MAY808ZOmIVjcRq2kI3fNB+0OG9/ZdlJSE
	dBV3rj52+FdqbVnnd0E9N7v84qJWNXJAqyatt2qgVjmKS5679zDViDgvF5rF4Zs9C0ID
	SuOFA+I/FjItF1d8qHiiZVuep5LAP6uTXYOW4PFGq0itwF64B8gsqz6QCjmW1R4bf867
	YtS1bgi7XFrnqVTgjatEEEZcFDZhlFfAf3zTF+SNA8Qs9ym4Z8By+OeTRQw540BNKFcf
	1NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jShBo0SK4SG2ZnCefiUxpgLntRhlV4b/vsFnuQhzHbU=;
	b=SDVUAhtmnpgvDuvklqCKVALNL0FVzkDp2Gov/6FYSpZkRA6Fq3cw1dsiweuUc6n1xc
	LiPj8m9/CVOeKwE6HLSrUI65ZHgBka9YmfX2E7SG0xAvJftAfwmKrx5Pg8CUOTtj7nZr
	j37niyZHm39e1ftIr+WpP8fKkA0ieH2W6I4X7JIFfnewOLPTif/ACwJ/e8Wor74s31DF
	ztMbrZ68+IjjzM84q6sLeXbT/Fvthl6F0snz8wIAUyDzKCQJ8Lzj99wkYKTZcCz7Pp+S
	oe+VDNGnluN7+MZsJ46GZnthBFSCh7Q+HQKUnO32UuABQZg2qxdPiGpKHjRU80jcq00E
	nNug==
X-Gm-Message-State: APzg51Cx7uOYHelC5kmPWOX3TBdOmVALJN3bsNqsi5tav2CEUJL850qF
	B7GvaLCUviqmeZJ5/OzpdnNKNrtS
X-Google-Smtp-Source: ANB0VdbgxLszQBVukaIeOE0AFbg4qt000NeU2sPUnEKseGLOxi9rx7bCF6wKAxLye+6jGuE5yfvL8Q==
X-Received: by 2002:a1c:bc86:: with SMTP id
	m128-v6mr988975wmf.147.1536664451364; 
	Tue, 11 Sep 2018 04:14:11 -0700 (PDT)
Received: from pc-ceresoli.dev.aim (45.11.168.109.cust.ip.kpnqwest.it.
	[109.168.11.45]) by smtp.gmail.com with ESMTPSA id
	b22-v6sm851364wme.48.2018.09.11.04.14.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 04:14:10 -0700 (PDT)
From: lucaceresoli77@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2018 13:13:59 +0200
Message-Id: <20180911111359.18053-1-lucaceresoli77@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Subject: [meta-oe][PATCH RESEND] devicetree.bbclass: don't pad DT overlays
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
X-List-Received-Date: Tue, 11 Sep 2018 11:14:11 -0000

From: Luca Ceresoli <luca@lucaceresoli.net>

By default the devicetree class adds padding to the generated .dtb
files, which can be needed by the bootloader. However it also pads
.dtbo files, which is not useful.

Don't apply padding to the overlay devicetrees.

To achieve this:

 * move "-p ${DT_PADDING_SIZE}" to a new variable, DTB_BFLAGS (B for
   "base")
 * add "-p 0" to DTC_OFLAGS to disable padding for overlays

Cc: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---

Resending from a gmail account due to ongoing issues between my
provider and lists.openembedded.org.

---
 meta/classes/devicetree.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index dbc83f2a1d98..8fe5a5ed795c 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -55,9 +55,10 @@ DT_RESERVED_MAP ??= "8"
 DT_BOOT_CPU[doc] = "The boot cpu, defaults to 0"
 DT_BOOT_CPU ??= "0"
 
-DTC_FLAGS ?= "-R ${DT_RESERVED_MAP} -p ${DT_PADDING_SIZE} -b ${DT_BOOT_CPU}"
+DTC_FLAGS ?= "-R ${DT_RESERVED_MAP} -b ${DT_BOOT_CPU}"
 DTC_PPFLAGS ?= "-nostdinc -undef -D__DTS__ -x assembler-with-cpp"
-DTC_OFLAGS ?= "-@ -H epapr"
+DTC_BFLAGS ?= "-p ${DT_PADDING_SIZE}"
+DTC_OFLAGS ?= "-p 0 -@ -H epapr"
 
 python () {
     if d.getVar("KERNEL_INCLUDE"):
@@ -106,6 +107,8 @@ def devicetree_compile(dtspath, includes, d):
     dtcargs = ["dtc"] + (d.getVar("DTC_FLAGS") or "").split()
     if isoverlay:
         dtcargs += (d.getVar("DTC_OFLAGS") or "").split()
+    else:
+        dtcargs += (d.getVar("DTC_BFLAGS") or "").split()
     for i in includes:
         dtcargs += ["-i", i]
     dtcargs += ["-o", "{0}.{1}".format(dtname, "dtbo" if isoverlay else "dtb")]
-- 
2.17.1


