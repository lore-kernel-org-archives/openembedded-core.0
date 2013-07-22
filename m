Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB436B102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 14:52:17 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ey16so1995844wid.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=fkxhssQPiQdWvbuXoIUO2at0olmK71J+NfzybUHMYjQ=;
	b=oGgqggpXgJ0gpNVgtcfXAjoxcB6SgTrtWciXwgqC2l9BF5RU1lL/+0ryBlYzs+lYFc
	RDYe8ry2e2RgFypBL1LD6VCxzRljCl5GAeRzEX5TEATbuJ44Y8ESQ9q08VDtzatmhTYX
	Kf5X94H+kNqcyOIYylIyrKNXR/VcKc0oBVlj+K5O2FBaeRHyymRkBVSTUyjk2Gc7WH4z
	KQx6y7sz9Pw1fdbkcEt3TPPyl+Hguo9objIyaPHyOHW2iIG5P60F2sgw/zExekL/y8ha
	Ti3H/QTbqZL0TacWjJCqmI2oztWwBt28Lu0ex6e47GTPPmjJWatK5ugr/3HhcVJ4I0Ky
	5umg==
X-Received: by 10.180.83.163 with SMTP id r3mr18927652wiy.10.1374504737413;
	Mon, 22 Jul 2013 07:52:17 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id i1sm66588020wiz.6.2013.07.22.07.52.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 07:52:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2013 16:52:15 +0200
Message-Id: <1374504735-22950-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] package.bbclass: avoid packing debug sources from other packages
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
X-List-Received-Date: Mon, 22 Jul 2013 14:52:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The error case was gcc-dbg packing files from libgcc-dbg reported in [1]

[1] http://lists.openembedded.org/pipermail/openembedded-core/2013-July/080728.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 02a1460..f92edf7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -304,7 +304,7 @@ def copydebugsources(debugsrcdir, d):
         processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
         # We need to ignore files that are not actually ours
         # we do this by only paying attention to items from this package
-        processdebugsrc += "fgrep -z '%s' | "
+        processdebugsrc += "fgrep -zw '%s' | "
         processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
 
         cmd = processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir)
-- 
1.7.6.5


