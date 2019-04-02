Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 74FBF7D15E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 08:22:02 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id b65so5875232plb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 01:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=j9LMMJN607rXSieRXEOrrvZheAfG7vd/+ZZXaMWxdxU=;
	b=bNz8CTf0HTAK0mdh4gcmnhRZMgqDJwJ95+qGx3MXeXPS97OiMt02AIGmjhwipMHBHt
	+LiX7gqOsyrcnSH/WXSVu3kIOVcx+TKmtnJ5UJbuC+pI+AcDHmE+owjyGVEQMCL4mmFK
	X++qH67Wpo6eCtqixlud8B2tYcCQaw3IOu8DllZxAXY4nx0woor22lyAeTV+ll8iqQuv
	axmWgStkSPEMCJyWuxNB9OmwAWubVvadbjbxPrgzdmREc5FwKuK4TGOP3fURAa1RJkPt
	7yeDPIaMbUHlmUs0qxwcgqFMw0CeRGX/dY0zRsxvmkfkFKl2m9B56XqnGkC4Ai2khCta
	1+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=j9LMMJN607rXSieRXEOrrvZheAfG7vd/+ZZXaMWxdxU=;
	b=mHg4z7CxY1FrgsK9qXn2BsYbCOn5OYrDpKOgXU9WYbo0dIYEpwqesE1H1okyxwMx8A
	OJUQbsJKa/AIOvCjOn4kdNRl7h6QDiWAwtI9p1AJfou1R0OqX9UNdwRmfCx9v2JEckmn
	pOxG8lCz7pq2hDLzhXtrm1LQciwzFevtaqyXUj/EcAwPP7u2bNA9ligUmqrIh+Od+5bc
	m3btHe/ZfdGpdUUkJMFLQ1LqVTSdjHpXBLdVmrG2sdn6ay29a508RY63sfwtS4t9g/Gv
	LzgoCMCB0I2kEmiAShlyCHwsSSiDQUwA2dGZTFUzTJ+61mBMZOJCxeAXz0Soj/AxDwQ7
	u2QA==
X-Gm-Message-State: APjAAAUnE59S/csO2l2TzVXgQSz37XYSeEcX9LUc0nTLbaEY9RQTVFUg
	tyaY74bm6bfCHNILFPtzlodTxg==
X-Google-Smtp-Source: APXvYqxxo+4WGkhR1cigGKBbG3pUwViWBeTbokRZtY48snSHa0ApEDlht5CVL8WEUFXIUoNUMgb5bQ==
X-Received: by 2002:a17:902:2ec1:: with SMTP id
	r59mr68153158plb.171.1554193323523; 
	Tue, 02 Apr 2019 01:22:03 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.73.181])
	by smtp.gmail.com with UTF8SMTPSA id
	d69sm29257143pfg.26.2019.04.02.01.22.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Apr 2019 01:22:02 -0700 (PDT)
Date: Tue, 02 Apr 2019 08:21:53 +0000
Message-Id: <20190402082153.3630-2-nathan@nathanrossi.com>
In-Reply-To: <20190402082153.3630-1-nathan@nathanrossi.com>
References: <20190402082153.3630-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/3] ccmake.bbclass: Create a cml1 style class for the CMake curses UI
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
X-List-Received-Date: Tue, 02 Apr 2019 08:22:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The ccmake bbclass implements two tasks. The first task 'ccmake'
preserves the configured state of CMakeCache.txt (generated from the
configure task) and invokes the 'ccmake' program within a oe_terminal
execution. The user can then review, select and modify configuration
options and once satisfied with the configuration exit ccmake. Once
ccmake has exited the build can be run and the updated configuration
should be reflected in the output build.

The ccmake bbclass has a second task 'ccmake_diffconfig' to compute the
differences in configuration which was modified by ccmake. Since there
are many ways to persist the configuration changes within recipes and
layer configuration, the differences are emitted as a bitbake recipe
fragment (configuration.inc) using EXTRA_OECMAKE as well as a CMake
script file which can be used as a input to cmake via the '-C' argument.
Both files are generated in the WORKDIR of the build and the paths to
the files are written as output from the build. It is then up to the
user to take this configuration and apply it to the desired location.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/ccmake.bbclass | 97 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 meta/classes/ccmake.bbclass

diff --git a/meta/classes/ccmake.bbclass b/meta/classes/ccmake.bbclass
new file mode 100644
index 0000000000..933e122b35
--- /dev/null
+++ b/meta/classes/ccmake.bbclass
@@ -0,0 +1,97 @@
+inherit terminal
+
+python do_ccmake() {
+    import shutil
+
+    # copy current config for diffing
+    config = os.path.join(d.getVar("B"), "CMakeCache.txt")
+    if os.path.exists(config):
+        shutil.copy(config, config + ".orig")
+
+    oe_terminal(d.expand("ccmake ${OECMAKE_GENERATOR_ARGS} ${OECMAKE_SOURCEPATH} -Wno-dev"),
+        d.getVar("PN") + " - ccmake", d)
+
+    if os.path.exists(config) and os.path.exists(config + ".orig"):
+        if bb.utils.md5_file(config) != bb.utils.md5_file(config + ".orig"):
+            # the cmake class uses cmake --build, which will by default
+            # regenerate configuration, simply mark the compile step as tainted
+            # to ensure it is re-run
+            bb.note("Configuration changed, recompile will be forced")
+            bb.build.write_taint('do_compile', d)
+
+}
+do_ccmake[depends] += "cmake-native:do_populate_sysroot"
+do_ccmake[nostamp] = "1"
+do_ccmake[dirs] = "${B}"
+addtask ccmake after do_configure
+
+def cmake_parse_config_cache(path):
+    with open(path, "r") as f:
+        for i in f:
+            i = i.rstrip("\n")
+            if len(i) == 0 or i.startswith("//") or i.startswith("#"):
+                continue # empty or comment
+            key, value = i.split("=", 1)
+            key, keytype = key.split(":")
+            if keytype in ["INTERNAL", "STATIC"]:
+                continue # skip internal and static config options
+            yield key, keytype, value
+
+def cmake_diff_config_vars(a, b):
+    removed, added = [], []
+
+    for ak, akt, av in a:
+        found = False
+        for bk, bkt, bv in b:
+            if bk == ak:
+                found = True
+                if bkt != akt or bv != av: # changed
+                    removed.append((ak, akt, av))
+                    added.append((bk, bkt, bv))
+                break
+        # remove any missing from b
+        if not found:
+            removed.append((ak, akt, av))
+
+    # add any missing from a
+    for bk, bkt, bv in b:
+        if not any(bk == ak for ak, akt, av in a):
+            added.append((bk, bkt, bv))
+
+    return removed, added
+
+python do_ccmake_diffconfig() {
+    import shutil
+    config = os.path.join(d.getVar("B"), "CMakeCache.txt")
+    if os.path.exists(config) and os.path.exists(config + ".orig"):
+        if bb.utils.md5_file(config) != bb.utils.md5_file(config + ".orig"):
+            # scan the changed options
+            old = list(cmake_parse_config_cache(config + ".orig"))
+            new = list(cmake_parse_config_cache(config))
+            _, added = cmake_diff_config_vars(old, new)
+
+            if len(added) != 0:
+                with open(d.expand("${WORKDIR}/configuration.inc"), "w") as f:
+                    f.write("EXTRA_OECMAKE += \" \\\n")
+                    for k, kt, v in added:
+                        escaped = v if " " not in v else "\"{0}\"".format(v)
+                        f.write("    -D{0}:{1}={2} \\\n".format(k, kt, escaped))
+                    f.write("    \"\n")
+                bb.plain("Configuration recipe fragment written to: {0}".format(d.expand("${WORKDIR}/configuration.inc")))
+
+                with open(d.expand("${WORKDIR}/site-file.cmake"), "w") as f:
+                    for k, kt, v in added:
+                        f.write("SET({0} \"{1}\" CACHE {2} "")\n".format(k, v, kt))
+                bb.plain("Configuration cmake fragment written to: {0}".format(d.expand("${WORKDIR}/site-file.cmake")))
+
+                # restore the original config
+                shutil.copy(config + ".orig", config)
+            else:
+                bb.plain("No configuration differences, skipping configuration fragment generation.")
+    else:
+        bb.fatal("No config files found. Did you run ccmake?\n{0}".format(e))
+}
+do_ccmake_diffconfig[nostamp] = "1"
+do_ccmake_diffconfig[dirs] = "${B}"
+addtask ccmake_diffconfig
+
---
2.20.1

