Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id B926C792DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:42:18 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id 8-v6so2631503oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FxGHl3df9VulfMEYuu0W+1KGkP6bfAcqQpx2hTWaHxk=;
	b=bNY0o4duXHpvdJKHE6O1Y2X5MYEBat+2IiR2ikRVpQicDZKfQVC9mXgqjQ9dt0SaDX
	IwtkiiHVlMznksyg1NCiMIEVPfKpOnTqE81fAh9X/owEBihJ2dI22A9WDADPTo9GyOxl
	u0KoxcZ96+fh7MQoj5EZ0mJwfhFv2LFnnVh9AMs4fbhTY6lo0HxKZ+BTUBDdVXpkScry
	ndMH7SBnpcAqLxwPyPCG65JRZWRMFyOT4f7Wy5v3uxKIVj+cqdPSIw07NzZ1+N2LW022
	qMOBPuv1Au0F+LQlGOC80JpWKLKPMY684e0eSPTkwFI3fnA+RNb5pqxBgSjfp4s20Szs
	H7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FxGHl3df9VulfMEYuu0W+1KGkP6bfAcqQpx2hTWaHxk=;
	b=cdkPtRfXOHsBwLGrn1n9g/6x2WbYXL9PCagPA5otcljYt8dyVVKdIFH6oFKIef4b38
	y7IhgVKTCY2JPmmcuNkgs19TAn7ylcpWZJTfeD0NzqbYx60bSaSh046lqH/DmesYTjau
	kYVvv0fMR9MIIdTxP4EL44EDDhjUpbfYgSGYtupxEcvSyWhjYsIx7blGirHwOS50PTbi
	mAXsl1euoUMuzQMTWq2C27fr9h+TjbEkiyJwWSLw2H2YC7SFvp6+ehxXCMazjwtw+twd
	YrHsXkrieuoY16WHQ1AmIvPpKpi+z0hDHf4XGDT3YxfPcQpfNIv78289KSMi/a0TVRoe
	ngZg==
X-Gm-Message-State: APzg51CPdjBvsbuaaxvpszbO4W/eVKnabDMpb3XITPfhZk1FRo8I1Kww
	HxtXXINWGtwYlJ9JejoA/1JmVVRntX0=
X-Google-Smtp-Source: ANB0VdZYCor1eqklFNyZRCKyuYuYDSc939QYSYbGP2DOnzw2vnC6xpSdQutxwloZmc47OogVAvdtig==
X-Received: by 2002:aca:e754:: with SMTP id
	e81-v6mr3799542oih.203.1534938139533; 
	Wed, 22 Aug 2018 04:42:19 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	f144-v6sm1323750oib.39.2018.08.22.04.42.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:42:19 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:11:48 +0530
Message-Id: <1534938113-12197-8-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534938113-12197-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534938113-12197-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH V2] shadow: CVE-2018-7169
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
X-List-Received-Date: Wed, 22 Aug 2018 11:42:19 -0000

newgidmap: enforce setgroups=deny if self-mapping a group

This is necessary to match the kernel-side policy of "self-mapping in a
user namespace is fine, but you cannot drop groups" -- a policy that was
created in order to stop user namespaces from allowing trivial privilege
escalation by dropping supplementary groups that were "blacklisted" from
certain paths.

This is the simplest fix for the underlying issue, and effectively makes
it so that unless a user has a valid mapping set in /etc/subgid (which
only administrators can modify) -- and they are currently trying to use
that mapping -- then /proc/$pid/setgroups will be set to deny. This
workaround is only partial, because ideally it should be possible to set
an "allow_setgroups" or "deny_setgroups" flag in /etc/subgid to allow
administrators to further restrict newgidmap(1).

We also don't write anything in the "allow" case because "allow" is the
default, and users may have already written "deny" even if they
technically are allowed to use setgroups. And we don't write anything if
the setgroups policy is already "deny".

Ref: https://bugs.launchpad.net/ubuntu/+source/shadow/+bug/1729357
Fixes: CVE-2018-7169

Affects shadow <= 4.5

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
v2:
  Corrected "From:" address

 .../shadow/files/CVE-2018-7169.patch               | 186 +++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |   1 +
 2 files changed, 187 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2018-7169.patch

diff --git a/meta/recipes-extended/shadow/files/CVE-2018-7169.patch b/meta/recipes-extended/shadow/files/CVE-2018-7169.patch
new file mode 100644
index 0000000..36887d4
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2018-7169.patch
@@ -0,0 +1,186 @@
+From fb28c99b8a66ff2605c5cb96abc0a4d975f92de0 Mon Sep 17 00:00:00 2001
+From: Aleksa Sarai <asarai@suse.de>
+Date: Thu, 15 Feb 2018 23:49:40 +1100
+Subject: [PATCH] newgidmap: enforce setgroups=deny if self-mapping a group
+
+This is necessary to match the kernel-side policy of "self-mapping in a
+user namespace is fine, but you cannot drop groups" -- a policy that was
+created in order to stop user namespaces from allowing trivial privilege
+escalation by dropping supplementary groups that were "blacklisted" from
+certain paths.
+
+This is the simplest fix for the underlying issue, and effectively makes
+it so that unless a user has a valid mapping set in /etc/subgid (which
+only administrators can modify) -- and they are currently trying to use
+that mapping -- then /proc/$pid/setgroups will be set to deny. This
+workaround is only partial, because ideally it should be possible to set
+an "allow_setgroups" or "deny_setgroups" flag in /etc/subgid to allow
+administrators to further restrict newgidmap(1).
+
+We also don't write anything in the "allow" case because "allow" is the
+default, and users may have already written "deny" even if they
+technically are allowed to use setgroups. And we don't write anything if
+the setgroups policy is already "deny".
+
+Ref: https://bugs.launchpad.net/ubuntu/+source/shadow/+bug/1729357
+Fixes: CVE-2018-7169
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/fb28c99b8a66ff2605c5cb96abc0a4d975f92de0]
+Reported-by: Craig Furman <craig.furman89@gmail.com>
+Signed-off-by: Aleksa Sarai <asarai@suse.de>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ src/newgidmap.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 80 insertions(+), 9 deletions(-)
+
+diff --git a/src/newgidmap.c b/src/newgidmap.c
+index b1e33513..59a2e75c 100644
+--- a/src/newgidmap.c
++++ b/src/newgidmap.c
+@@ -46,32 +46,37 @@
+  */
+ const char *Prog;
+ 
+-static bool verify_range(struct passwd *pw, struct map_range *range)
++
++static bool verify_range(struct passwd *pw, struct map_range *range, bool *allow_setgroups)
+ {
+ 	/* An empty range is invalid */
+ 	if (range->count == 0)
+ 		return false;
+ 
+-	/* Test /etc/subgid */
+-	if (have_sub_gids(pw->pw_name, range->lower, range->count))
++	/* Test /etc/subgid. If the mapping is valid then we allow setgroups. */
++	if (have_sub_gids(pw->pw_name, range->lower, range->count)) {
++		*allow_setgroups = true;
+ 		return true;
++	}
+ 
+-	/* Allow a process to map it's own gid */
+-	if ((range->count == 1) && (pw->pw_gid == range->lower))
++	/* Allow a process to map its own gid. */
++	if ((range->count == 1) && (pw->pw_gid == range->lower)) {
++		/* noop -- if setgroups is enabled already we won't disable it. */
+ 		return true;
++	}
+ 
+ 	return false;
+ }
+ 
+ static void verify_ranges(struct passwd *pw, int ranges,
+-	struct map_range *mappings)
++	struct map_range *mappings, bool *allow_setgroups)
+ {
+ 	struct map_range *mapping;
+ 	int idx;
+ 
+ 	mapping = mappings;
+ 	for (idx = 0; idx < ranges; idx++, mapping++) {
+-		if (!verify_range(pw, mapping)) {
++		if (!verify_range(pw, mapping, allow_setgroups)) {
+ 			fprintf(stderr, _( "%s: gid range [%lu-%lu) -> [%lu-%lu) not allowed\n"),
+ 				Prog,
+ 				mapping->upper,
+@@ -89,6 +94,70 @@ static void usage(void)
+ 	exit(EXIT_FAILURE);
+ }
+ 
++void write_setgroups(int proc_dir_fd, bool allow_setgroups)
++{
++	int setgroups_fd;
++	char *policy, policy_buffer[4096];
++
++	/*
++	 * Default is "deny", and any "allow" will out-rank a "deny". We don't
++	 * forcefully write an "allow" here because the process we are writing
++	 * mappings for may have already set themselves to "deny" (and "allow"
++	 * is the default anyway). So allow_setgroups == true is a noop.
++	 */
++	policy = "deny\n";
++	if (allow_setgroups)
++		return;
++
++	setgroups_fd = openat(proc_dir_fd, "setgroups", O_RDWR|O_CLOEXEC);
++	if (setgroups_fd < 0) {
++		/*
++		 * If it's an ENOENT then we are on too old a kernel for the setgroups
++		 * code to exist. Emit a warning and bail on this.
++		 */
++		if (ENOENT == errno) {
++			fprintf(stderr, _("%s: kernel doesn't support setgroups restrictions\n"), Prog);
++			goto out;
++		}
++		fprintf(stderr, _("%s: couldn't open process setgroups: %s\n"),
++			Prog,
++			strerror(errno));
++		exit(EXIT_FAILURE);
++	}
++
++	/*
++	 * Check whether the policy is already what we want. /proc/self/setgroups
++	 * is write-once, so attempting to write after it's already written to will
++	 * fail.
++	 */
++	if (read(setgroups_fd, policy_buffer, sizeof(policy_buffer)) < 0) {
++		fprintf(stderr, _("%s: failed to read setgroups: %s\n"),
++			Prog,
++			strerror(errno));
++		exit(EXIT_FAILURE);
++	}
++	if (!strncmp(policy_buffer, policy, strlen(policy)))
++		goto out;
++
++	/* Write the policy. */
++	if (lseek(setgroups_fd, 0, SEEK_SET) < 0) {
++		fprintf(stderr, _("%s: failed to seek setgroups: %s\n"),
++			Prog,
++			strerror(errno));
++		exit(EXIT_FAILURE);
++	}
++	if (dprintf(setgroups_fd, "%s", policy) < 0) {
++		fprintf(stderr, _("%s: failed to setgroups %s policy: %s\n"),
++			Prog,
++			policy,
++			strerror(errno));
++		exit(EXIT_FAILURE);
++	}
++
++out:
++	close(setgroups_fd);
++}
++
+ /*
+  * newgidmap - Set the gid_map for the specified process
+  */
+@@ -103,6 +172,7 @@ int main(int argc, char **argv)
+ 	struct stat st;
+ 	struct passwd *pw;
+ 	int written;
++	bool allow_setgroups = false;
+ 
+ 	Prog = Basename (argv[0]);
+ 
+@@ -145,7 +215,7 @@ int main(int argc, char **argv)
+ 				(unsigned long) getuid ()));
+ 		return EXIT_FAILURE;
+ 	}
+-	
++
+ 	/* Get the effective uid and effective gid of the target process */
+ 	if (fstat(proc_dir_fd, &st) < 0) {
+ 		fprintf(stderr, _("%s: Could not stat directory for target %u\n"),
+@@ -177,8 +247,9 @@ int main(int argc, char **argv)
+ 	if (!mappings)
+ 		usage();
+ 
+-	verify_ranges(pw, ranges, mappings);
++	verify_ranges(pw, ranges, mappings, &allow_setgroups);
+ 
++	write_setgroups(proc_dir_fd, allow_setgroups);
+ 	write_mapping(proc_dir_fd, ranges, mappings, "gid_map");
+ 	sub_gid_close();
+ 
+-- 
+2.13.3
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 6efe4a9..9691c38 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -20,6 +20,7 @@ SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/${BP}.tar.xz \
            file://0001-shadow-CVE-2017-12424 \
            file://CVE-2017-2616.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://CVE-2018-7169.patch \
            "
 
 SRC_URI_append_class-target = " \
-- 
2.7.4


