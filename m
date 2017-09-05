Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 68B17601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 10:11:29 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id i145so16937198wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 03:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=mbtVfYcBhFsb/uxuM85O+QnDvVrfGGSYF8YEu+nzL44=;
	b=W65ENsa1ZWQargqtM1jQYdhGhQcf2QoE+v02Z2EoMTtGTdOETRhrshnbftv8+CTQWb
	FTpLmmRqd79LIvbE1GA9APWwmkHNQp7UPvdxSQByc0055E4gyvs6Uuu9hK7+YnSd1gGf
	0igm0bCJynV0mnNNsa1DIppvOai/tJJiAWYoGRFU/3FPXt6bER3d1KW1frm0DlLqxwHf
	mPDIpPJcSIOKDICu0OkhsFW1+Zg+bYqjN34CFB6mLsuXJVXPHcBA3wUbsOxdNh/FtLhN
	7NqBXtZ4hflvIC6Z1nVw1JHcjM+36xdOqTVdS9qel5WMMPMh9oI5SkdIFHNN0x5rK3qZ
	ZMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mbtVfYcBhFsb/uxuM85O+QnDvVrfGGSYF8YEu+nzL44=;
	b=ZgWpYMaL2pkzY9vSsUSbtaiGBFWftfH6vEcl1+fZGipqnQWme9abVTLGvLVcCSSWD8
	iKETI6vFe7v+jAqOH0Ggu8Sr9A9VCSOvXD7jRvz+2BaIRLcGHeLSLe8KVR4CWbO4YVuL
	x4qyFVW1243L0tx4HwfNSIzcXML0ZBeXzSWIeTCsDnpneDgHjJUn/LdlS2xakOoCuyKz
	vYRJga+piUVHM5kdrhpg96w7/TKHXpsvQq0qGpK5urUi/N8FyMoO+pvwVcWG9jda1xDl
	YHkNHar0XMIqjKqpgT/5BV4fBbqaTijCJFC7UDq9TfqOtE58jcUru+xOqGYD8+DPt8gu
	EwCA==
X-Gm-Message-State: AHPjjUjp6LwyyXPKgg2trvCzXBKH4HzA83fZj0D0MC9xF9YZ/GcFyOkd
	HEZin3la4IQk7HEvl2c=
X-Google-Smtp-Source: ADKCNb4QnoDK15LuksOeqweBRFpnfLXt2nighDtT+JfexafmgHqv8hHlEcAyxn+uYxoRk9C1IhFUMQ==
X-Received: by 10.28.63.204 with SMTP id m195mr2439885wma.175.1504606290497;
	Tue, 05 Sep 2017 03:11:30 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id o22sm193422wrc.65.2017.09.05.03.11.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 03:11:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 11:11:27 +0100
Message-Id: <20170905101127.4810-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] rootfs: improve postinst intercept logging
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
X-List-Received-Date: Tue, 05 Sep 2017 10:11:30 -0000

Ensure we capture stderr, always write the output to the log, and don't be so
emotional in the warning message.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/rootfs.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 96591f370e6..9d4727e76c1 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -302,10 +302,11 @@ class Rootfs(object, metaclass=ABCMeta):
             bb.note("> Executing %s intercept ..." % script)
 
             try:
-                subprocess.check_output(script_full)
+                output = subprocess.check_output(script_full, stderr=subprocess.STDOUT)
+                if output: bb.note(output.decode("utf-8"))
             except subprocess.CalledProcessError as e:
-                bb.warn("The postinstall intercept hook '%s' failed (exit code: %d)! See log for details! (Output: %s)" %
-                        (script, e.returncode, e.output))
+                bb.warn("The postinstall intercept hook '%s' failed, details in log.do_rootfs" % script)
+                bb.note("Exit code %d. Output:\n%s" % (e.returncode, e.output.decode("utf-8")))
 
                 with open(script_full) as intercept:
                     registered_pkgs = None
-- 
2.11.0


