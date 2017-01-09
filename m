Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5212F71AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 10:09:59 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id x2so59520644itf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 02:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A7ObDI651ESJMVHP18GfIUlb/lM5wjXkW88nmElhWKo=;
	b=eVFxwUS5mKYGXZGrCagkcUOFQ2uBDFKGUnX1BoI2L6jer1rroo1BablXIuOsA5g7L6
	eKdXGv0skp0waFQwWxazBHqN6R4qKRjE+Us3MoNQMXAM1XIJ98QEHA+7hBtYE68jX4I7
	viMXoNWpu+AkDq4VnlUo4giyyMU3MniPlPMNU8QooeBlBXTihKU3RcPIs+9/vVCQJGj5
	2/DUiWYAWpdGdfNdNLRAMV58HRjOcI4/6xZXTuMHLLXe5tWRbQX70Eu37rXDhaIY+Ahl
	LV831PtenuAgMH2bR8JvyygkoUmFpi3xArUJJevXbNqD4j5PdPx8rmfiSjTfpJ1uPttP
	9Y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A7ObDI651ESJMVHP18GfIUlb/lM5wjXkW88nmElhWKo=;
	b=bz/DSXG7fH75Lhgz7bP/VZ8fJjwnKoe7iiwlRZh2twmp3/PWfh5J6bB0vMy9bEWO8c
	crhQx4MQUhxlzXoftD/oDSFkVmg6y9l8RvtrZeVPzBlMdCB1AuvxzpQ3ivnaZGKr/bw1
	UUCfjTE7wDDZ+vqaw2t8mGhZXkxUsTL7Q3t6GbCaoAB6yl8AS9LOgaoAyVivjw/yw2zR
	K8nkRydgtecqrXruW2631P2pIrfEnNMBLCl5XlnIwuKr7odyzGw6qxgYcK1A2/mg+nSP
	7kHVWfLBP42ZMUQbADyIPRFDVlcr+7BMkbX+yrl4O7ccckd+a4QFLx1PdweafplWufCe
	/3TQ==
X-Gm-Message-State: AIkVDXL1P06Zig0hlbbRSROEHM5NeCZS6wmPCPpCf91FMOHoK9ievhb6W2YX+2zgJ07IiTbb
X-Received: by 10.36.43.147 with SMTP id h141mr8686959ita.47.1483956599660;
	Mon, 09 Jan 2017 02:09:59 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F553.dip0.t-ipconnect.de.
	[93.232.245.83]) by smtp.gmail.com with ESMTPSA id
	w143sm6103034itc.0.2017.01.09.02.09.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jan 2017 02:09:58 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 11:09:42 +0100
Message-Id: <1483956582-4229-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1483630732-3560-1-git-send-email-patrick.ohly@intel.com>
References: <1483630732-3560-1-git-send-email-patrick.ohly@intel.com>
Subject: [PATCH V2 1/1] rootfs-postcommands.bbclass: sort passwd entries
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
X-List-Received-Date: Mon, 09 Jan 2017 10:10:00 -0000

The /etc passwd files in a rootfs consist of the default entries from
base-passwd plus anything that gets added via package installation,
EXTRA_USERS_PARAMS and/or system sysusers.

The execution order of preinst scripts is not perfectly deterministic,
or at least unrelated changes caused it to change in a
non-deterministic way, resulting in irrelevant changes in the order of
passwd entries.

useradd-staticids.bbclass ensures that the numeric IDs don't change,
but re-ordering can still occur, which is bad for reproducible builds
and file-based update mechanisms like swupd which work best if changes
are as minimal as possible.

To achieve that, the files get sorted in a post-processing command,
enabled by default. Sorting is based primarily on the numeric IDs, so
for example, the "root" user continues to be listed first. "nobody"
now is at the end, which wasn't the case before.

The order of the entries should not matter, but in obscure cases where
it does (like having multiple entries for the same numeric ID) this
behavior can be disabled by setting SORT_PASSWD_POSTPROCESS_COMMAND to
an empty string.

Fixes: YOCTO #10520

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---

Notes:
    Changes since V1:
     * switched to sorting by numeric ID
     * try harder to run after other postprocess commands which add
       users and groups (content is deterministic but not fully sorted
       otherwise)

 meta/classes/rootfs-postcommands.bbclass | 22 ++++++++++++++++
 meta/lib/rootfspostcommands.py           | 44 ++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/lib/rootfspostcommands.py

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 8d48a2d..53a4fda 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -30,6 +30,23 @@ ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 SSH_DISABLE_DNS_LOOKUP ?= " ssh_disable_dns_lookup ; "
 ROOTFS_POSTPROCESS_COMMAND_append_qemuall = "${SSH_DISABLE_DNS_LOOKUP}"
 
+# Sort the user and group entries in /etc by ID in order to make the content
+# deterministic. Package installs are not deterministic, causing the ordering
+# of entries to change between builds. In case that this isn't desired,
+# the command can be overridden.
+#
+# Note that useradd-staticids.bbclass has to be used to ensure that
+# the numeric IDs of dynamically created entries remain stable.
+#
+# We want this to run as late as possible, in particular after
+# systemd_sysusers_create and set_user_group. Using _append is not
+# enough for that, set_user_group is added that way and would end
+# up running after us.
+SORT_PASSWD_POSTPROCESS_COMMAND ??= " sort_passwd; "
+python () {
+    d.appendVar('ROOTFS_POSTPROCESS_COMMAND', '${SORT_PASSWD_POSTPROCESS_COMMAND}')
+}
+
 systemd_create_users () {
 	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
 		[ -e $conffile ] || continue
@@ -146,6 +163,11 @@ ssh_disable_dns_lookup () {
 	fi
 }
 
+python sort_passwd () {
+    import rootfspostcommands
+    rootfspostcommands.sort_passwd(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
+}
+
 #
 # Enable postinst logging if debug-tweaks is enabled
 #
diff --git a/meta/lib/rootfspostcommands.py b/meta/lib/rootfspostcommands.py
new file mode 100644
index 0000000..6a9b8b4
--- /dev/null
+++ b/meta/lib/rootfspostcommands.py
@@ -0,0 +1,44 @@
+import os
+
+def sort_file(filename, mapping):
+    """
+    Sorts a passwd or group file based on the numeric ID in the third column.
+    If a mapping is given, the name from the first column is mapped via that
+    dictionary instead (necessary for /etc/shadow and /etc/gshadow). If not,
+    a new mapping is created on the fly and returned.
+    """
+    new_mapping = {}
+    with open(filename, 'rb+') as f:
+        lines = f.readlines()
+        # No explicit error checking for the sake of simplicity. /etc
+        # files are assumed to be well-formed, causing exceptions if
+        # not.
+        for line in lines:
+            entries = line.split(b':')
+            name = entries[0]
+            if mapping is None:
+                id = int(entries[2])
+            else:
+                id = mapping[name]
+            new_mapping[name] = id
+        # Sort by numeric id first, with entire line as secondary key
+        # (just in case that there is more than one entry for the same id).
+        lines.sort(key=lambda line: (new_mapping[line.split(b':')[0]], line))
+        # We overwrite the entire file, i.e. no truncate() necessary.
+        f.seek(0)
+        f.write(b''.join(lines))
+    return new_mapping
+
+def sort_passwd(sysconfdir):
+    """
+    Sorts passwd and group files in a rootfs /etc directory by ID.
+    """
+    for suffix in '', '-':
+        for main, shadow in (('passwd', 'shadow'),
+                             ('group', 'gshadow')):
+            filename = os.path.join(sysconfdir, main + suffix)
+            if os.path.exists(filename):
+                mapping = sort_file(filename, None)
+                filename = os.path.join(sysconfdir, shadow + suffix)
+                if os.path.exists(filename):
+                    sort_file(filename, mapping)
-- 
2.1.4


