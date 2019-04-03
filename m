Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4660D7D2EA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 05:37:18 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id m10so7443501plt.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 22:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=DQDwAfPYZK0vaFhS2noYDloQXYVFTxPY6TG4IyI++Qw=;
	b=Pmwm0tLmujYkHvI+dnvLhP+5gl+AAOiEJ9eulyW12/t+SVo+IdCQS3pq6vVhm27MlQ
	fDtm9ibt75sEVpsbPAPz0bDyUOtekSkzeAdTko3Ejdyq34v8J3/cLsDT6Nd0fED1YZ4z
	fHnur7ZsPIwvglAc9fyGgxee5oLUh02Mh9NUWkC1ZbsDjQ38dXNSXprRmpdSKfeAdfez
	bNwHm6pDDPUih2cmcswyVMCN+k5hBI0K+gS9d+eXKlrbFlgtKHoDqT3IoMx2pHUN9Ygc
	Kp3sCKs3Tmq0bDb3r+bbTl58fjAOp8mZzHIj2AzFKMai/vxhdyhhC8iebPvhAr9Cr7/U
	GfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=DQDwAfPYZK0vaFhS2noYDloQXYVFTxPY6TG4IyI++Qw=;
	b=Qanfjr3e06v/XoVZ8e2ztt6jxxCDiHv7zlGqse1MAfEoI8TEIV9N8mc25F9BTZHbUu
	pjq9XVgu8u2zsnHPrMZbAuqzYBs0wsGRmCWJOf3GG8eV5CVe8jevbvCChfqHLrTbAQ5Q
	OxF+pOL9CN9NqZHteSdnbFRoGP6K/a0w9C3iu+3f1xjE6D+vRmP9kEeveIkltnjPnYxS
	DQkvcbjnUx2WLZI74kLyCQQSzbE+JKjSfcn/q0zw0slbKKe6nNApGi9jXLx9qu9q9POC
	dOd0FVrNBWExjvYdGBE8FB4EElV83AbMOUGTJV2jyYv4zEqfS5DHXDsxD1GIV4/my+Ph
	tP/A==
X-Gm-Message-State: APjAAAWbFmt6LfomFesg9cybCrCh9zGY/ds+eDXXAUJ/HskB8GvKa3aD
	nWOBYEJkQA5m+A4/Kcs50ZkCiM9asZ4=
X-Google-Smtp-Source: APXvYqzvz+bhM0gEi9ZsacFfRsskqc8o7LjvMVtiebOx2Pj73FNCZ5z9YlBGpeiPHqrlS0Jh825ioQ==
X-Received: by 2002:a17:902:8b8c:: with SMTP id
	ay12mr6240767plb.192.1554269838975; 
	Tue, 02 Apr 2019 22:37:18 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.73.181])
	by smtp.gmail.com with UTF8SMTPSA id
	k65sm11741333pfb.68.2019.04.02.22.37.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Apr 2019 22:37:18 -0700 (PDT)
Date: Wed, 03 Apr 2019 05:37:02 +0000
Message-Id: <20190403053702.10672-2-nathan@nathanrossi.com>
In-Reply-To: <20190403053702.10672-1-nathan@nathanrossi.com>
References: <20190403053702.10672-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 2/3] ccmake.bbclass: Create a cml1 style class for the CMake curses UI
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
X-List-Received-Date: Wed, 03 Apr 2019 05:37:18 -0000
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
Changes in v2:
- Fix up bb.fatal using format of undefined variable 'e'
- Fix up indentation of else case "No configuration differences" message
---
 meta/classes/ccmake.bbclass | 97 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 meta/classes/ccmake.bbclass

diff --git a/meta/classes/ccmake.bbclass b/meta/classes/ccmake.bbclass
new file mode 100644
index 0000000000..4114daa61b
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
+        else:
+            bb.plain("No configuration differences, skipping configuration fragment generation.")
+    else:
+        bb.fatal("No config files found. Did you run ccmake?")
+}
+do_ccmake_diffconfig[nostamp] = "1"
+do_ccmake_diffconfig[dirs] = "${B}"
+addtask ccmake_diffconfig
+
---
2.20.1

