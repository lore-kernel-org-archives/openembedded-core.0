Return-Path: <misla011@fiu.edu>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id 27C166BE2A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 20:43:27 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id p10so3756197qkg.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 13:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=NAZ4OiH8M1zGhuZujH/kU2O38D5dgtfbO+w5dyrQF0c=;
	b=tXnCSfv0eYb5vm7Sn3L8mSAvi3VfADeaTM9FDBsV83yDI9IZTm9e7bg9337N5s2MC3
	uaawYxvp0XNW1zLQUWYY9VEJu4aubvrOxvQy2SHVKiVIRik6jewr87rNU0QOyTFIAlKd
	1Veh4R7sidfYfD/hlyjguF/rNqmU77agMHkefbkSjUWgBEOvGn4GJj1ZRELUXOZoJsda
	Zgn1STui+Y3ezOYAApIr58SNXum2w6TUs89m4CeDPIH58xixgHtiXKh4qDn4zrcLpXwH
	mycOhj+0xFD5lJn43fRRAs8Bw/5BHKF55u3deyq2W6JADqoGAPfSbjXPu83amBCSs6nO
	BAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=NAZ4OiH8M1zGhuZujH/kU2O38D5dgtfbO+w5dyrQF0c=;
	b=mihUR5dS6LwwoB59CU1nGvxJsEJp66mDSVB6E0qwRrtcNidDKKyEd/ON4mb67bRDYY
	GoJpJ/ArAAevAhsyzbhu6QAA6RJIJUlgDq1FRYRZxVxgVQV9S31zhwW+PKFW2nqTAxPR
	3AGspnWjGUGMD47y7h0fip0Vae6fffUxBwMHduyXYrrOnVfmZ7HAwJzTZWhUgxZAdvzB
	/+3H+m/bJuh0ST9hbS6ekEG0/b9yRrjaGQsNEQiexST2ONMTLOwpQ/R50aclL2gGUzNf
	WtwW4k9cu+a7tpVXpsJtxH2k5oS9+IQcR/iX/3lFKpqP8sM4X1B2qe+hgmsPmKPoe0ur
	UCPQ==
X-Gm-Message-State: APjAAAW+JBTxUovgLqCXSz434a+c+Fbg8KuIdLNfnKRqxSF0d5wTjYqH
	u6GlHyMLEoFoBbn7i6MCEECDb8HIyLU=
X-Google-Smtp-Source: APXvYqytMBXMi4iw9PTV7VJdIMK1dX4GEwOJl7hSuSMbMCLrW0RT+O8ghzRJ1dp19GIYn47VFmvm7A==
X-Received: by 2002:a37:7686:: with SMTP id r128mr6231271qkc.444.1570135406855;
	Thu, 03 Oct 2019 13:43:26 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7]) by smtp.gmail.com with ESMTPSA id
	p22sm1593365qkk.92.2019.10.03.13.43.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Oct 2019 13:43:26 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Oct 2019 20:43:18 +0000
Message-Id: <20191003204318.15377-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Reply-To: muislam@microsoft.com
Subject: [thud][PATCH v2] libsolv: Security fix for CVEs: <CVE-2018-20532, CVE-2018-20533, CVE-2018-20534>
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
X-List-Received-Date: Thu, 03 Oct 2019 20:43:28 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 ...0003-Fix-Dereference-of-null-pointer.patch |  26 +++
 .../0004-Fix-Add-va_end-before-return.patch   |  28 ++++
 .../libsolv/0005-Fix-Memory-leaks.patch       | 151 ++++++++++++++++++
 .../libsolv/0006-Fix-testsolv-segfault.patch  |  33 ++++
 .../libsolv/0007-Fix-testsolv-segfaults.patch |  39 +++++
 ...008-Fix-Be-sure-that-NONBLOCK-is-set.patch |  30 ++++
 ...Don-t-set-values-that-are-never-read.patch | 107 +++++++++++++
 .../libsolv/libsolv_%.bbappend                |   9 ++
 8 files changed, 423 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0003-Fix-Dereference-of-null-pointer.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0004-Fix-Add-va_end-before-return.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0005-Fix-Memory-leaks.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0006-Fix-testsolv-segfault.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0007-Fix-testsolv-segfaults.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0008-Fix-Be-sure-that-NONBLOCK-is-set.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0009-Don-t-set-values-that-are-never-read.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv_%.bbappend

diff --git a/meta/recipes-extended/libsolv/libsolv/0003-Fix-Dereference-of-null-pointer.patch b/meta/recipes-extended/libsolv/libsolv/0003-Fix-Dereference-of-null-pointer.patch
new file mode 100644
index 0000000000..34f9518648
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0003-Fix-Dereference-of-null-pointer.patch
@@ -0,0 +1,26 @@
+From c5883b20b7b021ee94111cb72777ab3ba3f50950 Mon Sep 17 00:00:00 2001
+From: Jaroslav Rohel <jrohel@redhat.com>
+Date: Fri, 7 Dec 2018 07:05:10 +0100
+Subject: [PATCH] Fix: Dereference of null pointer
+Reply-To: muislam@microsoft.com
+
+---
+ ext/repo_repomdxml.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/repo_repomdxml.c b/ext/repo_repomdxml.c
+index fd46272b..46d83615 100644
+--- a/ext/repo_repomdxml.c
++++ b/ext/repo_repomdxml.c
+@@ -181,7 +181,7 @@ startElement(struct solv_xmlparser *xmlp, int state, const char *name, const cha
+             while (value)
+ 	      {
+ 		char *p = strchr(value, ',');
+-		if (*p)
++		if (p)
+ 		  *p++ = 0;
+ 		if (*value)
+ 		  repodata_add_poolstr_array(pd->data, SOLVID_META, REPOSITORY_UPDATES, value);
+-- 
+2.23.0
+
diff --git a/meta/recipes-extended/libsolv/libsolv/0004-Fix-Add-va_end-before-return.patch b/meta/recipes-extended/libsolv/libsolv/0004-Fix-Add-va_end-before-return.patch
new file mode 100644
index 0000000000..08597db384
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0004-Fix-Add-va_end-before-return.patch
@@ -0,0 +1,28 @@
+From 8e1dba061d7962441f7e06b9a94d0ff24b158c6a Mon Sep 17 00:00:00 2001
+From: Jaroslav Rohel <jrohel@redhat.com>
+Date: Tue, 11 Dec 2018 09:50:06 +0100
+Subject: [PATCH] Fix: Add va_end() before return
+Reply-To: muislam@microsoft.com
+
+The va_end() performs cleanup.
+If va_end() is not called before a function that calls va_start() returns,
+the behavior is undefined.
+---
+ src/pool.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/pool.c b/src/pool.c
+index 383edb2a..be6a4193 100644
+--- a/src/pool.c
++++ b/src/pool.c
+@@ -1536,6 +1536,7 @@ pool_debug(Pool *pool, int type, const char *format, ...)
+         vprintf(format, args);
+       else
+         vfprintf(stderr, format, args);
++      va_end(args);
+       return;
+     }
+   vsnprintf(buf, sizeof(buf), format, args);
+-- 
+2.23.0
+
diff --git a/meta/recipes-extended/libsolv/libsolv/0005-Fix-Memory-leaks.patch b/meta/recipes-extended/libsolv/libsolv/0005-Fix-Memory-leaks.patch
new file mode 100644
index 0000000000..933fd6d37a
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0005-Fix-Memory-leaks.patch
@@ -0,0 +1,151 @@
+From 98a75959e13699e2ef35b0b011a88a6d224f227e Mon Sep 17 00:00:00 2001
+From: Jaroslav Rohel <jrohel@redhat.com>
+Date: Tue, 11 Dec 2018 10:14:04 +0100
+Subject: [PATCH] Fix: Memory leaks
+Reply-To: muislam@microsoft.com
+
+---
+ ext/repo_rpmdb.c  | 16 ++++++++++++++++
+ ext/testcase.c    |  4 ++++
+ tools/repo2solv.c |  1 +
+ 3 files changed, 21 insertions(+)
+
+diff --git a/ext/repo_rpmdb.c b/ext/repo_rpmdb.c
+index 9acb4006..0d648208 100644
+--- a/ext/repo_rpmdb.c
++++ b/ext/repo_rpmdb.c
+@@ -1896,6 +1896,8 @@ repo_add_rpm(Repo *repo, const char *rpm, int flags)
+   if (fread(lead, 96 + 16, 1, fp) != 1 || getu32(lead) != 0xedabeedb)
+     {
+       pool_error(pool, -1, "%s: not a rpm", rpm);
++      solv_chksum_free(leadsigchksumh, NULL);
++      solv_chksum_free(chksumh, NULL);
+       fclose(fp);
+       return 0;
+     }
+@@ -1908,12 +1910,16 @@ repo_add_rpm(Repo *repo, const char *rpm, int flags)
+   if (lead[78] != 0 || lead[79] != 5)
+     {
+       pool_error(pool, -1, "%s: not a rpm v5 header", rpm);
++      solv_chksum_free(leadsigchksumh, NULL);
++      solv_chksum_free(chksumh, NULL);
+       fclose(fp);
+       return 0;
+     }
+   if (getu32(lead + 96) != 0x8eade801)
+     {
+       pool_error(pool, -1, "%s: bad signature header", rpm);
++      solv_chksum_free(leadsigchksumh, NULL);
++      solv_chksum_free(chksumh, NULL);
+       fclose(fp);
+       return 0;
+     }
+@@ -1922,6 +1928,8 @@ repo_add_rpm(Repo *repo, const char *rpm, int flags)
+   if (sigcnt >= MAX_SIG_CNT || sigdsize >= MAX_SIG_DSIZE)
+     {
+       pool_error(pool, -1, "%s: bad signature header", rpm);
++      solv_chksum_free(leadsigchksumh, NULL);
++      solv_chksum_free(chksumh, NULL);
+       fclose(fp);
+       return 0;
+     }
+@@ -1932,6 +1940,8 @@ repo_add_rpm(Repo *repo, const char *rpm, int flags)
+     {
+       if (!headfromfp(&state, rpm, fp, lead + 96, sigcnt, sigdsize, sigpad, chksumh, leadsigchksumh))
+ 	{
++      solv_chksum_free(leadsigchksumh, NULL);
++      solv_chksum_free(chksumh, NULL);
+ 	  fclose(fp);
+ 	  return 0;
+ 	}
+@@ -1971,6 +1981,8 @@ repo_add_rpm(Repo *repo, const char *rpm, int flags)
+ 	  if (fread(lead, l, 1, fp) != 1)
+ 	    {
+ 	      pool_error(pool, -1, "%s: unexpected EOF", rpm);
++          solv_chksum_free(leadsigchksumh, NULL);
++          solv_chksum_free(chksumh, NULL);
+ 	      fclose(fp);
+ 	      return 0;
+ 	    }
+@@ -1991,6 +2003,7 @@ repo_add_rpm(Repo *repo, const char *rpm, int flags)
+   if (fread(lead, 16, 1, fp) != 1)
+     {
+       pool_error(pool, -1, "%s: unexpected EOF", rpm);
++      solv_chksum_free(chksumh, NULL);
+       fclose(fp);
+       return 0;
+     }
+@@ -1999,6 +2012,7 @@ repo_add_rpm(Repo *repo, const char *rpm, int flags)
+   if (getu32(lead) != 0x8eade801)
+     {
+       pool_error(pool, -1, "%s: bad header", rpm);
++      solv_chksum_free(chksumh, NULL);
+       fclose(fp);
+       return 0;
+     }
+@@ -2007,6 +2021,7 @@ repo_add_rpm(Repo *repo, const char *rpm, int flags)
+   if (sigcnt >= MAX_HDR_CNT || sigdsize >= MAX_HDR_DSIZE)
+     {
+       pool_error(pool, -1, "%s: bad header", rpm);
++      solv_chksum_free(chksumh, NULL);
+       fclose(fp);
+       return 0;
+     }
+@@ -2014,6 +2029,7 @@ repo_add_rpm(Repo *repo, const char *rpm, int flags)
+ 
+   if (!headfromfp(&state, rpm, fp, lead, sigcnt, sigdsize, 0, chksumh, 0))
+     {
++      solv_chksum_free(chksumh, NULL);
+       fclose(fp);
+       return 0;
+     }
+diff --git a/ext/testcase.c b/ext/testcase.c
+index b815c563..33998d47 100644
+--- a/ext/testcase.c
++++ b/ext/testcase.c
+@@ -2365,6 +2365,7 @@ testcase_write_mangled(Solver *solv, const char *dir, int resultflags, const cha
+ 	  if (fclose(fp))
+ 	    {
+ 	      pool_error(solv->pool, 0, "testcase_write: write error");
++	      solv_free(result);
+ 	      strqueue_free(&sq);
+ 	      return 0;
+ 	    }
+@@ -2377,12 +2378,14 @@ testcase_write_mangled(Solver *solv, const char *dir, int resultflags, const cha
+   if (!(fp = fopen(out, "w")))
+     {
+       pool_error(solv->pool, 0, "testcase_write: could not open '%s' for writing", out);
++      solv_free(cmd);
+       strqueue_free(&sq);
+       return 0;
+     }
+   if (*cmd && fwrite(cmd, strlen(cmd), 1, fp) != 1)
+     {
+       pool_error(solv->pool, 0, "testcase_write: write error");
++      solv_free(cmd);
+       strqueue_free(&sq);
+       fclose(fp);
+       return 0;
+@@ -2390,6 +2393,7 @@ testcase_write_mangled(Solver *solv, const char *dir, int resultflags, const cha
+   if (fclose(fp))
+     {
+       pool_error(solv->pool, 0, "testcase_write: write error");
++      solv_free(cmd);
+       strqueue_free(&sq);
+       return 0;
+     }
+diff --git a/tools/repo2solv.c b/tools/repo2solv.c
+index d5b33287..68e92f33 100644
+--- a/tools/repo2solv.c
++++ b/tools/repo2solv.c
+@@ -208,6 +208,7 @@ read_plaindir_repo(Repo *repo, const char *dir)
+ 	repodata_set_location(data, p, 0, 0, bp[0] == '.' && bp[1] == '/' ? bp + 2 : bp);
+       solv_free(rpm);
+     }
++  solv_free(buf);
+   fclose(fp);
+   while (waitpid(pid, &wstatus, 0) == -1)
+     {
+-- 
+2.23.0
+
diff --git a/meta/recipes-extended/libsolv/libsolv/0006-Fix-testsolv-segfault.patch b/meta/recipes-extended/libsolv/libsolv/0006-Fix-testsolv-segfault.patch
new file mode 100644
index 0000000000..be06eb2ea6
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0006-Fix-testsolv-segfault.patch
@@ -0,0 +1,33 @@
+From 95c3d1b3aad7a003d129b957cf449d11edaca67b Mon Sep 17 00:00:00 2001
+From: Jaroslav Rohel <jrohel@redhat.com>
+Date: Tue, 11 Dec 2018 10:22:09 +0100
+Subject: [PATCH] Fix: testsolv segfault
+Reply-To: muislam@microsoft.com
+
+ERROR: AddressSanitizer: SEGV on unknown address 0x000000000000 (pc 0x7fab0e11bf2b bp 0x7ffdfc044b70 sp 0x7ffdfc044a90 T0)
+0 0x7fab0e11bf2a in testcase_str2dep_complex /home/company/real_sanitize/libsolv-master/ext/testcase.c:577
+1 0x7fab0e11c80f in testcase_str2dep /home/company/real_sanitize/libsolv-master/ext/testcase.c:656
+2 0x7fab0e12e64a in testcase_read /home/company/real_sanitize/libsolv-master/ext/testcase.c:2952
+3 0x402aa5 in main /home/company/real_sanitize/libsolv-master/tools/testsolv.c:148
+4 0x7fab0d9d2a3f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x20a3f)
+5 0x401bb8 in _start (/home/company/real_sanitize/libsolv-master/build/install/bin/testsolv+0x401bb8)
+---
+ ext/testcase.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ext/testcase.c b/ext/testcase.c
+index 33998d47..fe2636cb 100644
+--- a/ext/testcase.c
++++ b/ext/testcase.c
+@@ -576,6 +576,8 @@ testcase_str2dep_complex(Pool *pool, const char **sp, int relop)
+   Id flags, id, id2, namespaceid = 0;
+   struct oplist *op;
+ 
++  if (!s)
++    return 0;
+   while (*s == ' ' || *s == '\t')
+     s++;
+   if (!strncmp(s, "namespace:", 10))
+-- 
+2.23.0
+
diff --git a/meta/recipes-extended/libsolv/libsolv/0007-Fix-testsolv-segfaults.patch b/meta/recipes-extended/libsolv/libsolv/0007-Fix-testsolv-segfaults.patch
new file mode 100644
index 0000000000..9dec0f47c4
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0007-Fix-testsolv-segfaults.patch
@@ -0,0 +1,39 @@
+From 6de825c4d27022e48570824f0be77132c5b6d45a Mon Sep 17 00:00:00 2001
+From: Jaroslav Rohel <jrohel@redhat.com>
+Date: Tue, 11 Dec 2018 10:27:15 +0100
+Subject: [PATCH] Fix: testsolv segfaults
+Reply-To: muislam@microsoft.com
+
+ERROR: AddressSanitizer: SEGV on unknown address 0x0000000002f0 (pc 0x7f31501d3bd2 bp 0x7ffcfe4d4a50 sp 0x7ffcfe4d4a30 T0)
+0 0x7f31501d3bd1 in pool_whatprovides /home/company/real_sanitize/libsolv-master/src/pool.h:331
+1 0x7f31501d895e in testcase_str2solvid /home/company/real_sanitize/libsolv-master/ext/testcase.c:793
+2 0x7f31501e8388 in testcase_read /home/company/real_sanitize/libsolv-master/ext/testcase.c:2807
+3 0x402aa5 in main /home/company/real_sanitize/libsolv-master/tools/testsolv.c:148
+4 0x7f314fa8da3f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x20a3f)
+5 0x401bb8 in _start (/home/company/real_sanitize/libsolv-master/build/install/bin/testsolv+0x401bb8)
+
+ERROR: AddressSanitizer: SEGV on unknown address 0x000000000000 (pc 0x7f5af9e7815f bp 0x7ffc4c843a40 sp 0x7ffc4c8436c0 T0)
+0 0x7f5af9e7815e in testcase_read /home/company/real_sanitize/libsolv-master/ext/testcase.c:2799
+1 0x402aa5 in main /home/company/real_sanitize/libsolv-master/tools/testsolv.c:148
+2 0x7f5af971da3f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x20a3f)
+3 0x401bb8 in _start (/home/company/real_sanitize/libsolv-master/build/install/bin/testsolv+0x401bb8)
+---
+ ext/testcase.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/testcase.c b/ext/testcase.c
+index fe2636cb..c8dd14ee 100644
+--- a/ext/testcase.c
++++ b/ext/testcase.c
+@@ -2795,7 +2795,7 @@ testcase_read(Pool *pool, FILE *fp, const char *testcase, Queue *job, char **res
+ 	{
+ 	  int i = strlen(pieces[1]);
+ 	  s = strchr(pieces[1], '(');
+-	  if (!s && pieces[1][i - 1] != ')')
++	  if (!s || pieces[1][i - 1] != ')')
+ 	    {
+ 	      pool_error(pool, 0, "testcase_read: bad namespace '%s'", pieces[1]);
+ 	    }
+-- 
+2.23.0
+
diff --git a/meta/recipes-extended/libsolv/libsolv/0008-Fix-Be-sure-that-NONBLOCK-is-set.patch b/meta/recipes-extended/libsolv/libsolv/0008-Fix-Be-sure-that-NONBLOCK-is-set.patch
new file mode 100644
index 0000000000..8fa2621a88
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0008-Fix-Be-sure-that-NONBLOCK-is-set.patch
@@ -0,0 +1,30 @@
+From bbfce7d10015fd7f72bcd5dbbca6c30f02cd7f4d Mon Sep 17 00:00:00 2001
+From: Jaroslav Rohel <jrohel@redhat.com>
+Date: Tue, 11 Dec 2018 12:40:42 +0100
+Subject: [PATCH] Fix: Be sure that NONBLOCK is set
+Reply-To: muislam@microsoft.com
+
+---
+ examples/solv/fastestmirror.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/examples/solv/fastestmirror.c b/examples/solv/fastestmirror.c
+index d2ebd97a..0ee4e73b 100644
+--- a/examples/solv/fastestmirror.c
++++ b/examples/solv/fastestmirror.c
+@@ -68,7 +68,11 @@ findfastest(char **urls, int nurls)
+ 	  socks[i] = socket(result->ai_family, result->ai_socktype, result->ai_protocol);
+ 	  if (socks[i] >= 0)
+ 	    {
+-	      fcntl(socks[i], F_SETFL, O_NONBLOCK);
++	      if (fcntl(socks[i], F_SETFL, O_NONBLOCK) == -1)
++            {
++		      close(socks[i]);
++		      socks[i] = -1;
++            }
+ 	      if (connect(socks[i], result->ai_addr, result->ai_addrlen) == -1)
+ 		{
+ 		  if (errno != EINPROGRESS)
+-- 
+2.23.0
+
diff --git a/meta/recipes-extended/libsolv/libsolv/0009-Don-t-set-values-that-are-never-read.patch b/meta/recipes-extended/libsolv/libsolv/0009-Don-t-set-values-that-are-never-read.patch
new file mode 100644
index 0000000000..b6afea75c5
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0009-Don-t-set-values-that-are-never-read.patch
@@ -0,0 +1,107 @@
+From aca29224070047eac6a51c7c25ea5831d0aad20b Mon Sep 17 00:00:00 2001
+From: Jaroslav Rohel <jrohel@redhat.com>
+Date: Tue, 11 Dec 2018 12:58:34 +0100
+Subject: [PATCH] Don't set values that are never read
+Reply-To: muislam@microsoft.com
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+---
+ ext/pool_fileconflicts.c | 1 -
+ ext/repo_appdata.c       | 2 +-
+ ext/repo_comps.c         | 2 +-
+ src/cleandeps.c          | 1 -
+ src/dirpool.c            | 2 +-
+ src/order.c              | 1 -
+ src/repopage.c           | 1 -
+ 7 files changed, 3 insertions(+), 7 deletions(-)
+
+diff --git a/ext/pool_fileconflicts.c b/ext/pool_fileconflicts.c
+index eaeb52b2..2fd3d540 100644
+--- a/ext/pool_fileconflicts.c
++++ b/ext/pool_fileconflicts.c
+@@ -590,7 +590,6 @@ findfileconflicts_alias_cb(void *cbdatav, const char *fn, struct filelistinfo *i
+ 
+   if (!info->dirlen)
+     return;
+-  dp = fn + info->dirlen;
+   if (info->diridx != cbdata->lastdiridx)
+     {
+       cbdata->lastdiridx = info->diridx;
+diff --git a/ext/repo_appdata.c b/ext/repo_appdata.c
+index 62faf2d8..69d46386 100644
+--- a/ext/repo_appdata.c
++++ b/ext/repo_appdata.c
+@@ -103,7 +103,7 @@ startElement(struct solv_xmlparser *xmlp, int state, const char *name, const cha
+ {
+   struct parsedata *pd = xmlp->userdata;
+   Pool *pool = pd->pool;
+-  Solvable *s = pd->solvable;
++  Solvable *s;
+   const char *type;
+ 
+   /* ignore all language tags */
+diff --git a/ext/repo_comps.c b/ext/repo_comps.c
+index 255ecb16..e59f8d12 100644
+--- a/ext/repo_comps.c
++++ b/ext/repo_comps.c
+@@ -107,7 +107,7 @@ startElement(struct solv_xmlparser *xmlp, int state, const char *name, const cha
+ {
+   struct parsedata *pd = xmlp->userdata;
+   Pool *pool = pd->pool;
+-  Solvable *s = pd->solvable;
++  Solvable *s;
+ 
+   switch(state)
+     {
+diff --git a/src/cleandeps.c b/src/cleandeps.c
+index 1da28f6e..b2fde317 100644
+--- a/src/cleandeps.c
++++ b/src/cleandeps.c
+@@ -748,7 +748,6 @@ solver_createcleandepsmap(Solver *solv, Map *cleandepsmap, int unneeded)
+ 	    continue;
+ 	  if (strncmp(pool_id2str(pool, s->name), "pattern:", 8) != 0)
+ 	    continue;
+-	  dp = s->repo->idarraydata + s->requires;
+ 	  for (dp = s->repo->idarraydata + s->requires; *dp; dp++)
+ 	    FOR_PROVIDES(p, pp, *dp)
+ 	      if (pool->solvables[p].repo == installed)
+diff --git a/src/dirpool.c b/src/dirpool.c
+index afb26ea5..bed9435e 100644
+--- a/src/dirpool.c
++++ b/src/dirpool.c
+@@ -85,7 +85,7 @@ dirpool_make_dirtraverse(Dirpool *dp)
+     return;
+   dp->dirs = solv_extend_resize(dp->dirs, dp->ndirs, sizeof(Id), DIR_BLOCK);
+   dirtraverse = solv_calloc_block(dp->ndirs, sizeof(Id), DIR_BLOCK);
+-  for (parent = 0, i = 0; i < dp->ndirs; i++)
++  for (i = 0; i < dp->ndirs; i++)
+     {
+       if (dp->dirs[i] > 0)
+ 	continue;
+diff --git a/src/order.c b/src/order.c
+index c92c3328..cfde40c9 100644
+--- a/src/order.c
++++ b/src/order.c
+@@ -1066,7 +1066,6 @@ transaction_order(Transaction *trans, int flags)
+ #if 0
+ printf("do %s [%d]\n", pool_solvid2str(pool, te->p), temedianr[i]);
+ #endif
+-      s = pool->solvables + te->p;
+       for (j = te->edges; od.invedgedata[j]; j++)
+ 	{
+ 	  struct _TransactionElement *te2 = od.tes + od.invedgedata[j];
+diff --git a/src/repopage.c b/src/repopage.c
+index 2b7a863b..85d53eb9 100644
+--- a/src/repopage.c
++++ b/src/repopage.c
+@@ -399,7 +399,6 @@ match_done:
+ 	      litlen -= 32;
+ 	    }
+ 	}
+-      litofs = 0;
+     }
+   return oo;
+ }
+-- 
+2.20.1
+
diff --git a/meta/recipes-extended/libsolv/libsolv_%.bbappend b/meta/recipes-extended/libsolv/libsolv_%.bbappend
new file mode 100644
index 0000000000..ba9d890108
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv_%.bbappend
@@ -0,0 +1,9 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append += "file://0003-Fix-Dereference-of-null-pointer.patch"
+SRC_URI_append += "file://0004-Fix-Add-va_end-before-return.patch"
+SRC_URI_append += "file://0005-Fix-Memory-leaks.patch"
+SRC_URI_append += "file://0006-Fix-testsolv-segfault.patch"
+SRC_URI_append += "file://0007-Fix-testsolv-segfaults.patch"
+SRC_URI_append += "file://0008-Fix-Be-sure-that-NONBLOCK-is-set.patch"
+SRC_URI_append += "file://0009-Don-t-set-values-that-are-never-read.patch"
-- 
2.23.0


