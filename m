Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0247887C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 16:13:27 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9EDE45C39BF;
	Tue, 12 Dec 2017 17:07:28 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 17:13:24 +0100
Message-Id: <20171212161324.61705-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513094848; bh=20SmhLA76OnmoH9aKwbfPFRJif4QlP+BRv1BejG6IMI=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=vRjpz+H/uyWUXh8D3C7aO46SDcHAFqstJQTCm6wnXkhGKog0BVmC2vPfCe/jc6G/ehlgc0hnjNZKXoKqJEk6ZBOfoxvLzBMxbq8WFDGTZp9Lvwqm7Kw4WU7e/SV63j72+e2G0csoJ4ZjzOzpI9VpyzlGrMH/UUO8AerCcZWPVs0=
Cc: Stefan Agner <stefan.agner@toradex.com>, otavio@ossystems.com.br
Subject: [PATCH v3] waf.bbclass: explicitly pass bindir and libdir if supported
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
X-List-Received-Date: Tue, 12 Dec 2017 16:13:27 -0000

From: Stefan Agner <stefan.agner@toradex.com>

On some build hosts distros (e.g. Fedora 26) waf tries to be
smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
This obviously is not what we want for 32-bit targets and usually
fails in the do_package phase:
  WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue: gstreamer1.0-plugins-imx: Files/directories were installed but not shipped in any package:
    /usr/lib64/libgstimxcommon.so.0
    ...

Depending on version, waf knows prefix or prefix, bindir and
libdir as default options. Explicitly pass the right set of
arguments.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/classes/waf.bbclass | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index c4698e910a..acbda278a2 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -25,8 +25,23 @@ def get_waf_parallel_make(d):
 
     return ""
 
+python waf_preconfigure() {
+    from distutils.version import StrictVersion
+    srcsubdir = d.getVar('S')
+    wafbin = os.path.join(srcsubdir, 'waf')
+    status, result = oe.utils.getstatusoutput(wafbin + " --version")
+    if status != 0:
+        bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % status)
+        return
+    version = result.split()[1]
+    if StrictVersion(version) >= StrictVersion("1.8.7"):
+        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
+}
+
+do_configure[prefuncs] += "waf_preconfigure"
+
 waf_do_configure() {
-	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
+	${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF}
 }
 
 waf_do_compile()  {
-- 
2.13.6


