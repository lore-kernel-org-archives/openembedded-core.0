Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.7159.1612623421346573375
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 06:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bjU5Bmk055qC5sHq20w3Cd+ygPoUY6yCl4x17TOoBP/kIVJ+NF8Si39Gike3DAYbkRsj0WevzJ
 dFcAPxRxSnYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="200566867"
X-IronPort-AV: E=Sophos;i="5.81,158,1610438400"; 
   d="scan'208";a="200566867"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2021 06:57:00 -0800
IronPort-SDR: 6TUtUwkdUmQ2MMg+ALWN0UegU4rYkUhgeR6tcXaSFZkxyA7gyQ8hJjsByaR0lHjL87EwksEqLw
 nGYZo3S5xmAw==
X-IronPort-AV: E=Sophos;i="5.81,158,1610438400"; 
   d="scan'208";a="434877851"
Received: from taoki-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.238])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2021 06:56:58 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 1/2] sudo: fix CVE-2021-23240
Date: Sat,  6 Feb 2021 22:56:50 +0800
Message-Id: <20210206145651.1610972-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sudo/files/CVE-2021-23240.patch           | 419 ++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.3.bb      |   1 +
 2 files changed, 420 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-23240.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2021-23240.patch b/meta/recipes-extended/sudo/files/CVE-2021-23240.patch
new file mode 100644
index 0000000000..740a13cd90
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2021-23240.patch
@@ -0,0 +1,419 @@
+Upstream-Status: Backport [https://www.sudo.ws/repos/sudo/rev/8fcb36ef422a]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+CVE: CVE-2021-23240
+
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@sudo.ws>
+# Date 1609953360 25200
+# Node ID 8fcb36ef422a251fe33738a347551439944a4a37
+# Parent  ea19d0073c02951bbbf35342dd63304da83edce8
+Add security checks before using temp files for SELinux RBAC sudoedit.
+Otherwise, it may be possible for the user running sudoedit to
+replace the newly-created temporary files with a symbolic link and
+have sudoedit set the owner of an arbitrary file.
+Problem reported by Matthias Gerstner of SUSE.
+
+diff -r ea19d0073c02 -r 8fcb36ef422a src/copy_file.c
+--- a/src/copy_file.c	Wed Jan 06 10:16:00 2021 -0700
++++ b/src/copy_file.c	Wed Jan 06 10:16:00 2021 -0700
+@@ -1,7 +1,7 @@
+ /*
+  * SPDX-License-Identifier: ISC
+  *
+- * Copyright (c) 2020 Todd C. Miller <Todd.Miller@sudo.ws>
++ * Copyright (c) 2020-2021 Todd C. Miller <Todd.Miller@sudo.ws>
+  *
+  * Permission to use, copy, modify, and distribute this software for any
+  * purpose with or without fee is hereby granted, provided that the above
+@@ -23,6 +23,8 @@
+ 
+ #include <config.h>
+ 
++#include <sys/stat.h>
++
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <errno.h>
+@@ -134,3 +136,34 @@
+     sudo_warn(U_("unable to write to %s"), dst);
+     debug_return_int(-1);
+ }
++
++#ifdef HAVE_SELINUX
++bool
++sudo_check_temp_file(int tfd, const char *tfile, uid_t uid, struct stat *sb)
++{
++    struct stat sbuf;
++    debug_decl(sudo_check_temp_file, SUDO_DEBUG_UTIL);
++
++    if (sb == NULL)
++	sb = &sbuf;
++
++    if (fstat(tfd, sb) == -1) {
++	sudo_warn(U_("unable to stat %s"), tfile);
++	debug_return_bool(false);
++    }
++    if (!S_ISREG(sb->st_mode)) {
++	sudo_warnx(U_("%s: not a regular file"), tfile);
++	debug_return_bool(false);
++    }
++    if ((sb->st_mode & ALLPERMS) != (S_IRUSR|S_IWUSR)) {
++	sudo_warnx(U_("%s: bad file mode: 0%o"), tfile, sb->st_mode & ALLPERMS);
++	debug_return_bool(false);
++    }
++    if (sb->st_uid != uid) {
++	sudo_warnx(U_("%s is owned by uid %u, should be %u"),
++	    tfile, (unsigned int)sb->st_uid, (unsigned int)uid);
++	debug_return_bool(false);
++    }
++    debug_return_bool(true);
++}
++#endif /* SELINUX */
+diff -r ea19d0073c02 -r 8fcb36ef422a src/sesh.c
+--- a/src/sesh.c	Wed Jan 06 10:16:00 2021 -0700
++++ b/src/sesh.c	Wed Jan 06 10:16:00 2021 -0700
+@@ -1,7 +1,7 @@
+ /*
+  * SPDX-License-Identifier: ISC
+  *
+- * Copyright (c) 2008, 2010-2018, 2020 Todd C. Miller <Todd.Miller@sudo.ws>
++ * Copyright (c) 2008, 2010-2018, 2020-2021 Todd C. Miller <Todd.Miller@sudo.ws>
+  *
+  * Permission to use, copy, modify, and distribute this software for any
+  * purpose with or without fee is hereby granted, provided that the above
+@@ -132,7 +132,7 @@
+ static int
+ sesh_sudoedit(int argc, char *argv[])
+ {
+-    int i, oflags_dst, post, ret = SESH_ERR_FAILURE;
++    int i, oflags_src, oflags_dst, post, ret = SESH_ERR_FAILURE;
+     int fd_src = -1, fd_dst = -1, follow = 0;
+     struct stat sb;
+     struct timespec times[2];
+@@ -174,10 +174,12 @@
+ 	debug_return_int(SESH_ERR_BAD_PATHS);
+ 
+     /*
+-     * Use O_EXCL if we are not in the post editing stage
+-     * so that it's ensured that the temporary files are
+-     * created by us and that we are not opening any symlinks.
++     * In the pre-editing stage, use O_EXCL to ensure that the temporary
++     * files are created by us and that we are not opening any symlinks.
++     * In the post-editing stage, use O_NOFOLLOW so we don't follow symlinks
++     * when opening the temporary files.
+      */
++    oflags_src = O_RDONLY|(post ? O_NONBLOCK|O_NOFOLLOW : follow);
+     oflags_dst = O_WRONLY|O_CREAT|(post ? follow : O_EXCL);
+     for (i = 0; i < argc - 1; i += 2) {
+ 	const char *path_src = argv[i];
+@@ -187,7 +189,7 @@
+ 	 * doesn't exist, that's OK, we'll create an empty
+ 	 * destination file.
+ 	 */
+-	if ((fd_src = open(path_src, O_RDONLY|follow, S_IRUSR|S_IWUSR)) < 0) {
++	if ((fd_src = open(path_src, oflags_src, S_IRUSR|S_IWUSR)) < 0) {
+ 	    if (errno != ENOENT) {
+ 		sudo_warn("%s", path_src);
+ 		if (post) {
+@@ -197,6 +199,14 @@
+ 		    goto cleanup_0;
+ 	    }
+ 	}
++	if (post) {
++	    /* Make sure the temporary file is safe and has the proper owner. */
++	    if (!sudo_check_temp_file(fd_src, path_src, geteuid(), &sb)) {
++		ret = SESH_ERR_SOME_FILES;
++		goto nocleanup;
++	    }
++	    fcntl(fd_src, F_SETFL, fcntl(fd_src, F_GETFL, 0) & ~O_NONBLOCK);
++	}
+ 
+ 	if ((fd_dst = open(path_dst, oflags_dst, post ?
+ 	    (S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH) : (S_IRUSR|S_IWUSR))) < 0) {
+@@ -214,10 +224,7 @@
+ 	    off_t len_dst = -1;
+ 
+ 	    if (post) {
+-		if (fstat(fd_src, &sb) != 0) {
+-		    ret = SESH_ERR_SOME_FILES;
+-		    goto nocleanup;
+-		}
++		/* sudo_check_temp_file() filled in sb for us. */
+ 		len_src = sb.st_size;
+ 		if (fstat(fd_dst, &sb) != 0) {
+ 		    ret = SESH_ERR_SOME_FILES;
+diff -r ea19d0073c02 -r 8fcb36ef422a src/sudo_edit.c
+--- a/src/sudo_edit.c	Wed Jan 06 10:16:00 2021 -0700
++++ b/src/sudo_edit.c	Wed Jan 06 10:16:00 2021 -0700
+@@ -1,7 +1,7 @@
+ /*
+  * SPDX-License-Identifier: ISC
+  *
+- * Copyright (c) 2004-2008, 2010-2020 Todd C. Miller <Todd.Miller@sudo.ws>
++ * Copyright (c) 2004-2008, 2010-2021 Todd C. Miller <Todd.Miller@sudo.ws>
+  *
+  * Permission to use, copy, modify, and distribute this software for any
+  * purpose with or without fee is hereby granted, provided that the above
+@@ -259,8 +259,10 @@
+     } else {
+ 	len = asprintf(tfile, "%s/%s.XXXXXXXX", edit_tmpdir, cp);
+     }
+-    if (len == -1)
+-	sudo_fatalx(U_("%s: %s"), __func__, U_("unable to allocate memory"));
++    if (len == -1) {
++	sudo_warnx(U_("%s: %s"), __func__, U_("unable to allocate memory"));
++	debug_return_int(-1);
++    }
+     tfd = mkstemps(*tfile, suff ? strlen(suff) : 0);
+     sudo_debug_printf(SUDO_DEBUG_INFO|SUDO_DEBUG_LINENO,
+ 	"%s -> %s, fd %d", ofile, *tfile, tfd);
+@@ -735,7 +737,8 @@
+ 
+ #ifdef HAVE_SELINUX
+ static int
+-selinux_run_helper(char *argv[], char *envp[])
++selinux_run_helper(uid_t uid, gid_t gid, int ngroups, GETGROUPS_T *groups,
++    char *const argv[], char *const envp[])
+ {
+     int status, ret = SESH_ERR_FAILURE;
+     const char *sesh;
+@@ -755,8 +758,10 @@
+ 	break;
+     case 0:
+ 	/* child runs sesh in new context */
+-	if (selinux_setcon() == 0)
++	if (selinux_setcon() == 0) {
++	    switch_user(uid, gid, ngroups, groups);
+ 	    execve(sesh, argv, envp);
++	}
+ 	_exit(SESH_ERR_FAILURE);
+     default:
+ 	/* parent waits */
+@@ -775,7 +780,7 @@
+     struct tempfile *tf, char *files[], int nfiles)
+ {
+     char **sesh_args, **sesh_ap;
+-    int i, rc, sesh_nargs;
++    int i, error, sesh_nargs, ret = -1;
+     struct stat sb;
+     debug_decl(selinux_edit_create_tfiles, SUDO_DEBUG_EDIT);
+     
+@@ -787,7 +792,7 @@
+     sesh_args = sesh_ap = reallocarray(NULL, sesh_nargs, sizeof(char *));
+     if (sesh_args == NULL) {
+ 	sudo_warnx(U_("%s: %s"), __func__, U_("unable to allocate memory"));
+-	debug_return_int(-1);
++	goto done;
+     }
+     *sesh_ap++ = "sesh";
+     *sesh_ap++ = "-e";
+@@ -795,7 +800,6 @@
+ 	*sesh_ap++ = "-h";
+     *sesh_ap++ = "0";
+ 
+-    /* XXX - temp files should be created with user's context */
+     for (i = 0; i < nfiles; i++) {
+ 	char *tfile, *ofile = files[i];
+ 	int tfd;
+@@ -813,8 +817,7 @@
+ 	if (tfd == -1) {
+ 	    sudo_warn("mkstemps");
+ 	    free(tfile);
+-	    free(sesh_args);
+-	    debug_return_int(-1);
++	    goto done;
+ 	}
+ 	/* Helper will re-create temp file with proper security context. */
+ 	close(tfd);
+@@ -825,8 +828,10 @@
+     *sesh_ap = NULL;
+ 
+     /* Run sesh -e [-h] 0 <o1> <t1> ... <on> <tn> */
+-    rc = selinux_run_helper(sesh_args, command_details->envp);
+-    switch (rc) {
++    error = selinux_run_helper(command_details->uid, command_details->gid,
++	command_details->ngroups, command_details->groups, sesh_args,
++	command_details->envp);
++    switch (error) {
+     case SESH_SUCCESS:
+ 	break;
+     case SESH_ERR_BAD_PATHS:
+@@ -836,21 +841,35 @@
+     case SESH_ERR_KILLED:
+ 	sudo_fatalx("%s", U_("sesh: killed by a signal"));
+     default:
+-	sudo_fatalx(U_("sesh: unknown error %d"), rc);
++	sudo_warnx(U_("sesh: unknown error %d"), error);
++	goto done;
+     }
+ 
+-    /* Chown to user's UID so they can edit the temporary files. */
+     for (i = 0; i < nfiles; i++) {
+-	if (chown(tf[i].tfile, user_details.uid, user_details.gid) != 0) {
++	int tfd = open(tf[i].tfile, O_RDONLY|O_NONBLOCK|O_NOFOLLOW);
++	if (tfd == -1) {
++	    sudo_warn(U_("unable to open %s"), tf[i].tfile);
++	    goto done;
++	}
++	if (!sudo_check_temp_file(tfd, tf[i].tfile, command_details->uid, NULL)) {
++	    close(tfd);
++	    goto done;
++	}
++	if (fchown(tfd, user_details.uid, user_details.gid) != 0) {
+ 	    sudo_warn("unable to chown(%s) to %d:%d for editing",
+ 		tf[i].tfile, user_details.uid, user_details.gid);
++	    close(tfd);
++	    goto done;
+ 	}
++	close(tfd);
+     }
++    ret = nfiles;
+ 
++done:
+     /* Contents of tf will be freed by caller. */
+     free(sesh_args);
+ 
+-    return (nfiles);
++    debug_return_int(ret);
+ }
+ 
+ static int
+@@ -858,7 +877,8 @@
+     struct tempfile *tf, int nfiles, struct timespec *times)
+ {
+     char **sesh_args, **sesh_ap;
+-    int i, rc, sesh_nargs, ret = 1;
++    int i, error, sesh_nargs, ret = 1;
++    int tfd = -1;
+     struct timespec ts;
+     struct stat sb;
+     debug_decl(selinux_edit_copy_tfiles, SUDO_DEBUG_EDIT);
+@@ -879,33 +899,43 @@
+ 
+     /* Construct args for sesh -e 1 */
+     for (i = 0; i < nfiles; i++) {
+-	if (stat(tf[i].tfile, &sb) == 0) {
+-	    mtim_get(&sb, ts);
+-	    if (tf[i].osize == sb.st_size && sudo_timespeccmp(&tf[i].omtim, &ts, ==)) {
+-		/*
+-		 * If mtime and size match but the user spent no measurable
+-		 * time in the editor we can't tell if the file was changed.
+-		 */
+-		if (sudo_timespeccmp(&times[0], &times[1], !=)) {
+-		    sudo_warnx(U_("%s unchanged"), tf[i].ofile);
+-		    unlink(tf[i].tfile);
+-		    continue;
+-		}
++	if (tfd != -1)
++	    close(tfd);
++	if ((tfd = open(tf[i].tfile, O_RDONLY|O_NONBLOCK|O_NOFOLLOW)) == -1) {
++	    sudo_warn(U_("unable to open %s"), tf[i].tfile);
++	    continue;
++	}
++	if (!sudo_check_temp_file(tfd, tf[i].tfile, user_details.uid, &sb))
++	    continue;
++	mtim_get(&sb, ts);
++	if (tf[i].osize == sb.st_size && sudo_timespeccmp(&tf[i].omtim, &ts, ==)) {
++	    /*
++	     * If mtime and size match but the user spent no measurable
++	     * time in the editor we can't tell if the file was changed.
++	     */
++	    if (sudo_timespeccmp(&times[0], &times[1], !=)) {
++		sudo_warnx(U_("%s unchanged"), tf[i].ofile);
++		unlink(tf[i].tfile);
++		continue;
+ 	    }
+ 	}
+ 	*sesh_ap++ = tf[i].tfile;
+ 	*sesh_ap++ = tf[i].ofile;
+-	if (chown(tf[i].tfile, command_details->uid, command_details->gid) != 0) {
++	if (fchown(tfd, command_details->uid, command_details->gid) != 0) {
+ 	    sudo_warn("unable to chown(%s) back to %d:%d", tf[i].tfile,
+ 		command_details->uid, command_details->gid);
+ 	}
+     }
+     *sesh_ap = NULL;
++    if (tfd != -1)
++	close(tfd);
+ 
+     if (sesh_ap - sesh_args > 3) {
+ 	/* Run sesh -e 1 <t1> <o1> ... <tn> <on> */
+-	rc = selinux_run_helper(sesh_args, command_details->envp);
+-	switch (rc) {
++	error = selinux_run_helper(command_details->uid, command_details->gid,
++	    command_details->ngroups, command_details->groups, sesh_args,
++	    command_details->envp);
++	switch (error) {
+ 	case SESH_SUCCESS:
+ 	    ret = 0;
+ 	    break;
+@@ -921,7 +951,7 @@
+ 	    sudo_warnx("%s", U_("sesh: killed by a signal"));
+ 	    break;
+ 	default:
+-	    sudo_warnx(U_("sesh: unknown error %d"), rc);
++	    sudo_warnx(U_("sesh: unknown error %d"), error);
+ 	    break;
+ 	}
+ 	if (ret != 0)
+@@ -943,7 +973,7 @@
+ {
+     struct command_details saved_command_details;
+     char **nargv = NULL, **ap, **files = NULL;
+-    int errors, i, ac, nargc, rc;
++    int errors, i, ac, nargc, ret;
+     int editor_argc = 0, nfiles = 0;
+     struct timespec times[2];
+     struct tempfile *tf = NULL;
+@@ -1038,7 +1068,7 @@
+     command_details->ngroups = user_details.ngroups;
+     command_details->groups = user_details.groups;
+     command_details->argv = nargv;
+-    rc = run_command(command_details);
++    ret = run_command(command_details);
+     if (sudo_gettime_real(&times[1]) == -1) {
+ 	sudo_warn("%s", U_("unable to read the clock"));
+ 	goto cleanup;
+@@ -1062,14 +1092,14 @@
+ 	errors = sudo_edit_copy_tfiles(command_details, tf, nfiles, times);
+     if (errors) {
+ 	/* Preserve the edited temporary files. */
+-	rc = W_EXITCODE(1, 0);
++	ret = W_EXITCODE(1, 0);
+     }
+ 
+     for (i = 0; i < nfiles; i++)
+ 	free(tf[i].tfile);
+     free(tf);
+     free(nargv);
+-    debug_return_int(rc);
++    debug_return_int(ret);
+ 
+ cleanup:
+     /* Clean up temp files and return. */
+diff -r ea19d0073c02 -r 8fcb36ef422a src/sudo_exec.h
+--- a/src/sudo_exec.h	Wed Jan 06 10:16:00 2021 -0700
++++ b/src/sudo_exec.h	Wed Jan 06 10:16:00 2021 -0700
+@@ -1,7 +1,7 @@
+ /*
+  * SPDX-License-Identifier: ISC
+  *
+- * Copyright (c) 2010-2016 Todd C. Miller <Todd.Miller@sudo.ws>
++ * Copyright (c) 2010-2017, 2020-2021 Todd C. Miller <Todd.Miller@sudo.ws>
+  *
+  * Permission to use, copy, modify, and distribute this software for any
+  * purpose with or without fee is hereby granted, provided that the above
+@@ -84,9 +84,11 @@
+  */
+ struct command_details;
+ struct command_status;
++struct stat;
+ 
+ /* copy_file.c */
+ int sudo_copy_file(const char *src, int src_fd, off_t src_len, const char *dst, int dst_fd, off_t dst_len);
++bool sudo_check_temp_file(int tfd, const char *tname, uid_t uid, struct stat *sb);
+ 
+ /* exec.c */
+ void exec_cmnd(struct command_details *details, int errfd);
+
+
diff --git a/meta/recipes-extended/sudo/sudo_1.9.3.bb b/meta/recipes-extended/sudo/sudo_1.9.3.bb
index 132d9a8cb9..4edcbfc607 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.3.bb
@@ -4,6 +4,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
            file://CVE-2021-23239.patch \
+           file://CVE-2021-23240.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.29.2

