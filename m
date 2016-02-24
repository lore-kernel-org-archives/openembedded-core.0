Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0EFE277196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 23:59:18 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id c200so5539195wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 15:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Mhqo/WPmWNpQCFRUsHs7DRt3DMNqufhA7mcH5sELlJw=;
	b=OPtDa0IfwhOb4Tun6c/CpysmJDKa5PdzMDgRoEL85VVwL0X5eTnx62Lk6Z6X0P02H+
	6cMqP+JnJTsYsq0cU9+Soeb/7DHmV6lT6fBv2/bzGr0Y/tN9bdIkogYwZRBg9duyeOAN
	Uh5Q74aWMkgDheXTOcaFhqmV9NbR8KstasTCRFrhWUI6KOtJreEGylMhLDQXihv4V/QJ
	djdEKXVgtqqqsp/6nSnherm5HjSISd03k8KhBvVwJsm+7f/OqVztE/18AT/b93LHTMkJ
	Jk2nqRimOq2KV1S6r/yFHGbSbg0/fkrB4bbvAm/qYDu31R0q+WdiORuavBaBNHhL7GcI
	FUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Mhqo/WPmWNpQCFRUsHs7DRt3DMNqufhA7mcH5sELlJw=;
	b=cMM8VlaCXNU5rMuylnchQz0dlkj1q9fIlCQtXFruR9MJiCIOyZPCcRUn/ELVZsgMdn
	tiSw81I7hCjbl2yCu5lRbtqYEk0PNM1hRIiYjyTtaKFJq7J9o8WvGXuEhYLE68vkrTDu
	tDu5ugRYvJ3TDJLDzapeeA1rUGZNuzJeoJR95Q+2hlG/qlN2Y7gdt3qYfrhCqOzR1OTk
	oaxptf58mDxlyXY/wKO6b9A8IpA3GDCBizToQkHIQt+IDZZvP78wasK7OrH33qAjRzoe
	aVsYBpohFqCjz5bmcsL/3F52LD7elF16D6TLCTppJB9xK+Z8mjCoc5y+SlASWdi/qVNw
	h+dw==
X-Gm-Message-State: AG10YOQ+lv92Q0+jX9XtQLTaXzOVo9FsnsLRlS1n2iDGlnvr9msOgqxhbGpFHFZ3VTpSMDnQ
X-Received: by 10.28.21.21 with SMTP id 21mr357660wmv.38.1456358358980;
	Wed, 24 Feb 2016 15:59:18 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id x66sm482841wmb.20.2016.02.24.15.59.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 15:59:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 23:59:16 +0000
Message-Id: <1456358356-19438-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] uninative: use check_output instead of Popen directly
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
X-List-Received-Date: Wed, 24 Feb 2016 23:59:19 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/uninative.bbclass | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 7e225e6..270c1b0 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -83,12 +83,10 @@ python uninative_changeinterp () {
             except oe.qa.NotELFFileError:
                 continue
 
-            #bb.warn("patchelf-uninative --set-interpreter %s %s" % (d.getVar("UNINATIVE_LOADER", True), f))
-            cmd = "patchelf-uninative --set-interpreter %s %s" % (d.getVar("UNINATIVE_LOADER", True), f)
-            p = subprocess.Popen(cmd, shell=True,
-                                 stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
-            stdout, stderr = p.communicate()
-            if p.returncode:
+            try:
+                subprocess.check_output(("patchelf-uninative", "--set-interpreter",
+                                         d.getVar("UNINATIVE_LOADER", True), f))
+            except subprocess.CalledProcessError as e:
                 bb.fatal("'%s' failed with exit code %d and the following output:\n%s" %
-                         (cmd, p.returncode, stdout))
+                         (e.cmd, e.returncode, e.output))
 }
-- 
2.7.0


