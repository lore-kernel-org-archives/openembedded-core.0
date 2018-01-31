Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4EEAE7883F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 19:49:58 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id k131so1046723ith.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 11:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PK9hBEJHQW9XX9A9Fwe1gcYIhQCPZLwMYzdL7YfC9PU=;
	b=hT0bV502pX11c1GgPz2ReBx8X82V2vtOzQx9kqPYtSTC4pZLF9VPIkWTizYk5N66lW
	Cf0SMIxwet5/W3zhEVivHKfrYp2rC4PHIRqM6Tt2V3H0Qw0pDTknXSNkYY95bDo8a4bU
	XIBZdiLeYq6FQw9b03+3ZZcRGjGKU9q3MzcNjPNy3gMXtqbJuvr0ZWmT4cV6bii8i2Lb
	J7O0x3fFxmLtx6g+GbcfgnNfeByo3zv29Cno7aPGtGA2szSoZrKKoJQIk+rmWYOb0yDj
	jauQqE1hfMpPQbuuTcuVrITv9tBElmwUi6U0vYAaCfFrZMjDwcdW0UAQdfxBz7vYtz82
	kYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PK9hBEJHQW9XX9A9Fwe1gcYIhQCPZLwMYzdL7YfC9PU=;
	b=pGv98sgszYto3zfCP0ib3PDioxW2x5veWHZ0Y7TW6zFCCKUCZYV/J0KNBFXgkQ6jx3
	RZmK28nFKXEIoiR5lPULr0Qn12riV0+Bt0el8xJ41Pfb/1BjJl5ngt0HKDTJ1UYmfBcH
	j3K+gPKF6tbq9H1ay/UT5Bu55SemYJZLf4Fv0IcWFHKKoEXS9HfRQ9b6OT20Ok6xcMqp
	VQRJ3JyvyUmP4jXD8wUgJxhFmsLqUiyhC4W4dx0VValwcPs76UO/9sKuL6ny1ARPdNbD
	AG4TL44xf5qLm/H9krWn4bUJ/xWCIM8hrNDC2zDyWBdt1i82bZnJgIQw0g1ERdcXUhIM
	fx2w==
X-Gm-Message-State: AKwxytfKlDDWCYAZQwHy+kDVXTl85E/MZVP6p+mNkUZYVBuEzeOreN4d
	sCPm2JwxJBuIzbKpOJB/lDTzpNaT
X-Google-Smtp-Source: AH8x224mZVn1wBh7bPtPhIxdXV7ZeYtT+7jp812QaQJYa27hhptyXH2UY7xJ5kYft3cNZf9DYkG2zg==
X-Received: by 10.36.47.78 with SMTP id j75mr37047226itj.129.1517428199923;
	Wed, 31 Jan 2018 11:49:59 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm270885ita.9.2018.01.31.11.49.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Jan 2018 11:49:59 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jan 2018 13:49:56 -0600
Message-Id: <20180131194956.23938-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180131170230.7183-1-JPEWhacker@gmail.com>
References: <20180131170230.7183-1-JPEWhacker@gmail.com>
Cc: stefan.agner@toradex.com, jslater@windriver.com
Subject: [PATCH v2] waf.bbclass: cd to ${S} before checking version
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
X-List-Received-Date: Wed, 31 Jan 2018 19:49:59 -0000

waf requires that the current working directory be the project root (in
this case ${S} when it is invoked. The check to get the waf version was
being executed as a prefunc for do_configure, which meant it was
executed before the current working directory was switched to ${S}, and
thus would fail with some recipes. Fix this by changing to ${S} before
executing "waf --version"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/waf.bbclass | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index c3e744e5dec..bdbdc56767c 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -26,16 +26,17 @@ def get_waf_parallel_make(d):
     return ""
 
 python waf_preconfigure() {
+    import subprocess
     from distutils.version import StrictVersion
-    srcsubdir = d.getVar('S')
-    wafbin = os.path.join(srcsubdir, 'waf')
-    status, result = oe.utils.getstatusoutput(wafbin + " --version")
-    if status != 0:
-        bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % status)
-        return
-    version = result.split()[1]
-    if StrictVersion(version) >= StrictVersion("1.8.7"):
-        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
+    subsrcdir = d.getVar('S')
+    wafbin = os.path.join(subsrcdir, 'waf')
+    try:
+        result = subprocess.check_output([wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
+        version = result.decode('utf-8').split()[1]
+        if StrictVersion(version) >= StrictVersion("1.8.7"):
+            d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
+    except subprocess.CalledProcessError as e:
+        bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % e.returncode)
 }
 
 do_configure[prefuncs] += "waf_preconfigure"
-- 
2.14.3


