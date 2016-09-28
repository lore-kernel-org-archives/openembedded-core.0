Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 46A46605C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 12:05:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l132so5596111wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 05:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FIifRgdlAMYzdNtpSTlH6JYYdzR8s9CRy+b2RCSKMXY=;
	b=NUH49fqOqtfvqldwnlIsE8+VWCRrOdXL+TCISKJGVbjQNcJwsLhiRlk6/MTGk0r54s
	chrZ4HcCH+n4yDQ5jjvcC1l4h1FJqRnHudOu3J3/1vzJ/sM+oNlpRj1dkOeqT3+vFPM0
	I9pU62+i/ZsGg3fCuBB663cCWDp4FA34iMHN7tZ2LfWUrVCp03ZfRNT25psJRHCLk9WB
	zUysijoz7ATzw8iqCqF4zQ+xz+czyrdaBvw/htln/9UZtbv0kBKn2lce5+MRrGDFOD/z
	d2EE1OqBFTcrxTI8/HvUfmAtxE0SXOZ0x43Z9iyZuFQajE9K0UN74qfBUDZlQr3aqYNo
	r5Ng==
X-Gm-Message-State: AA6/9Rk8NzgMND0860K3AskXckK8LE/Bn+pRMhQnhV9bgfq8KJoUa4wZV+1KnluJi7TmVg==
X-Received: by 10.28.12.209 with SMTP id 200mr7592187wmm.118.1475064347659;
	Wed, 28 Sep 2016 05:05:47 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 123sm8479804wmj.5.2016.09.28.05.05.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Sep 2016 05:05:46 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 13:05:44 +0100
Message-Id: <20160928120545.28679-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160926154228.30567-1-git@andred.net>
References: <20160926154228.30567-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 1/2] cve-check-tool: convert do_populate_cve_db() from python to sh
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
X-List-Received-Date: Wed, 28 Sep 2016 12:05:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will allow us to easily incorporate progress support
via bb.process.run()

Signed-off-by: André Draszik <git@andred.net>
---
 .../cve-check-tool/cve-check-tool_5.6.4.bb         | 45 +++++++++-------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
index 1165559..5bb22d1 100644
--- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
@@ -22,35 +22,28 @@ inherit pkgconfig autotools
 EXTRA_OECONF = "--disable-coverage"
 CFLAGS_append = " -Wno-error=pedantic"
 
-python do_populate_cve_db () {
-    import subprocess
-    import time
-
-    if d.getVar("BB_NO_NETWORK", True) == "1":
-        bb.error("BB_NO_NETWORK is set; Can't update cve-check-tool database, "
-                  "CVEs won't be checked")
+do_populate_cve_db() {
+    if [ "${BB_NO_NETWORK}" = "1" ] ; then
+        bberror "BB_NO_NETWORK is set; Can't update cve-check-tool database, CVEs won't be checked"
         return
+    fi
 
-    bb.utils.export_proxies(d)
     # In case we don't inherit cve-check class, use default values defined in the class.
-    cve_dir = d.getVar("CVE_CHECK_DB_DIR", True) or d.expand("${DL_DIR}/CVE_CHECK")
-    cve_file = d.getVar("CVE_CHECK_TMP_FILE", True) or d.expand("${TMPDIR}/cve_check")
-    cve_cmd = "cve-check-update"
-    cmd = [cve_cmd, "-d", cve_dir]
-    bb.debug(1, "Updating cve-check-tool database located in %s" % cve_dir)
-    try:
-        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-        bb.debug(2, "Command '%s' returned:\n%s" % ("\n".join(cmd), output))
-        time_utc = time.gmtime(time.time())
-        time_format = "%Y-%m-%d %H:%M:%S"
-        with open(cve_file, "w") as f:
-            f.write("CVE database was updated on %s UTC\n\n"
-                    % time.strftime(time_format, time_utc))
-
-    except subprocess.CalledProcessError as e:
-        bb.warn("Error in executing cve-check-update: %s (output %s)" % (e, e.output))
-        if bb.data.inherits_class('cve-check', d):
-            bb.warn("Failed to update cve-check-tool database, CVEs won't be checked")
+    cve_dir="${CVE_CHECK_DB_DIR}"
+    cve_file="${CVE_CHECK_TMP_FILE}"
+
+    [ -z "${cve_dir}" ] && cve_dir="${DL_DIR}/CVE_CHECK"
+    [ -z "${cve_file}" ] && cve_file="${TMPDIR}/cve_check"
+
+    bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
+    if cve-check-update -d "$cve_dir" ; then
+        printf "CVE database was updated on %s UTC\n\n" "$(LANG=C date --utc +'%F %T')" > "$cve_file"
+    else
+        bbwarn "Error in executing cve-check-update"
+        if [ "${@'1' if bb.data.inherits_class('cve-check', d) else '0'}" -ne 0 ] ; then
+            bbwarn "Failed to update cve-check-tool database, CVEs won't be checked"
+        fi
+    fi
 }
 
 addtask populate_cve_db after do_populate_sysroot
-- 
2.9.3


