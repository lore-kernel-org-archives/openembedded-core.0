Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	by mail.openembedded.org (Postfix) with ESMTP id C701878D34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 14:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=843; q=dns/txt; s=iport;
	t=1540823582; x=1542033182;
	h=from:to:cc:subject:date:message-id;
	bh=iX0TWNErZRZMcL4A0J4MM1nolfwv2XzXMAYMRrY2Eyk=;
	b=N5KFtOjZVjLnebkQD6wALRWknYR97O2agrqd0P7Z2QN0SmLxoyDSF39+
	Qibx0ncMOEMcNeGZyJZLRQOp8qaS46of3Jozv//W8U7ikoBBBkKvLa/OJ
	rRTrcZrQZPOrjpGcFa1DjeJ14+TxaYBG11xzvfoJIizu7co5x4/RbhjMQ E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AmAABYGddb/4MNJK1lHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBUQcBAQsBggRmfyiMDYwXmS2BegsBASOESYMuITQNDQEDAQECAQECbRw?=
	=?us-ascii?q?MhjqBUYMhAYIBD6k+hTuEUwWHQYQmF4IAiW6EbCICj1aPMwmGaooPCxiQRgE?=
	=?us-ascii?q?sjESKBQIEBgUCFIFDOIFVTSMVgycSiweFXh8wjSUBAQ?=
X-IronPort-AV: E=Sophos;i="5.54,440,1534809600"; d="scan'208";a="472770766"
Received: from alln-core-1.cisco.com ([173.36.13.131])
	by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2018 14:33:01 +0000
Received: from kamensky-w541.cisco.com ([10.24.4.169]) (authenticated bits=0)
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPSA id w9TEWuOR012347
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Mon, 29 Oct 2018 14:33:01 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2018 07:32:54 -0700
Message-Id: <20181029143254.5734-1-kamensky@cisco.com>
X-Mailer: git-send-email 2.17.2
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.4.169, [10.24.4.169]
X-Outbound-Node: alln-core-1.cisco.com
Subject: [PATCH] meson: map powerpc64 TARGET_ARCH to ppc64 for the cross file
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
X-List-Received-Date: Mon, 29 Oct 2018 14:33:01 -0000

Meson uses 'ppc64' for 64 bit powerpc. Issue came up while
building systemd for MACHINE that uses ppc64e5500 tune.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
BTW very nice diagnostic message through
https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU, that led directly 
to the fix

 meta/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 7e63e12588..3cbdcf18c2 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -52,6 +52,8 @@ def meson_cpu_family(var, d):
     arch = d.getVar(var)
     if arch == 'powerpc':
         return 'ppc'
+    elif arch == 'powerpc64':
+        return 'ppc64'
     elif arch == 'mipsel':
         return 'mips'
     elif re.match(r"i[3-6]86", arch):
-- 
2.14.4


