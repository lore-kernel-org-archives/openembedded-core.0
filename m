Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id E3B59731B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 14:23:20 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id w198so17674580oiw.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rOhlytv7uzCwW2W6T2089n75ONo0XHgxZ12sG0JBYeA=;
	b=B4FYCmoRgTbK1mWbXCEM6cJdCWjk+O4q40GeTZjLlURJbCEhWL6Fi+JNDCSmeGlCGO
	N2e/ZTYoQfe1MwXdaJfRqct1ONj2HlaykzBjUEV94U6L+Sd7kCtGjBvBrOnuIOcCzkFo
	m3wtCpY/dhPgS/DGw0WoMoRrSKwP8j02C7lO7/yQqjGhMR/KYN/yMbuOUgZm8W88t1gV
	Adc/MZaUG7sm/m4nhD/9Xw+zYHJs0w2A0pKNDNhj+/bGbkngvUQzbDFjeXJb+k40CGra
	g8fxgu7EOOe2kH0HhOj7k9Db8nQgHB7c3fR8ANs6BN/b51UwXWhXXHCp+RKBU2hwvqlf
	amPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rOhlytv7uzCwW2W6T2089n75ONo0XHgxZ12sG0JBYeA=;
	b=bnOIGs0+uM0I1dBmMd8gTGga3XYHcqWcV+XHpVWBoYDETkLJSMkT8v4oklYWbhAm3w
	CpcC0tQsOd7g9zwkQczYWNSoRL+jOAhAG1g87Sh3D0iWofqDxJE8vP/ap0QGqb9F/w5x
	UepodOlqWUoHjnZFn02Msn4oJWfGeODrwLq0wkhdqII0dOfwxfE0MjsSof3S6UqBS/mN
	CJbX4CiAeq+9jv14m78hoiRIRotNOjCxJR3oslE5lExUEmJcz+N9RpQTZsudhdVfj/NC
	lYShgWQFrUolurg7kQVR8OAcsnpU0KzVxI/b2j1uCPmoWMFg9U3LNSbWOPi+0JBtyY0n
	6a4A==
X-Gm-Message-State: AOPr4FVnOm/sVRJo6FwIBGh+AhBzFKgnGtSxNH0ofwfA68US8HOB+0tCIrTCe/Ir5DP9Eg==
X-Received: by 10.157.61.161 with SMTP id l30mr9343351otc.183.1463149401673;
	Fri, 13 May 2016 07:23:21 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id m2sm1853295oia.1.2016.05.13.07.23.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 07:23:21 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 09:22:53 -0500
Message-Id: <1463149373-8181-2-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1463149373-8181-1-git-send-email-george.mccollister@gmail.com>
References: <1463149373-8181-1-git-send-email-george.mccollister@gmail.com>
Subject: [master][krogoth][jethro][PATCH 1/1] wic: fix path parsing, use last occurrence
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
X-List-Received-Date: Fri, 13 May 2016 14:23:21 -0000

If the path contains 'scripts' more than once the first occurrence will be
incorrectly used. Use rfind instead of find to find the last occurrence.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 scripts/lib/wic/plugin.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index ccfdfcb..151ff31 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -42,7 +42,7 @@ class PluginMgr(object):
 
     def __init__(self):
         wic_path = os.path.dirname(__file__)
-        eos = wic_path.find('scripts') + len('scripts')
+        eos = wic_path.rfind('scripts') + len('scripts')
         scripts_path = wic_path[:eos]
         self.scripts_path = scripts_path
         self.plugin_dir = scripts_path + PLUGIN_DIR
-- 
2.8.0


