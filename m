Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.1261.1628115550233013900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 15:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HFWjhnO+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id l18so3876724wrv.5
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MgoYPzPelWVWj0WXDtTish4yg1PNEl1A/E5+vv+ChCk=;
        b=HFWjhnO+0YVCftmGgW/jRIFQ5muJ+c5VU524w8fjNmQGeRWypA5vDZOVjAGwNmOYk0
         lmcaExt1b6Egaa7/Vv8xck4AWA3Fe8ukVeG9622oHn2JqWafi7ayMZpNVJg0QgQWgrLm
         hSj+ppMW5MjS+92rPewHIDtZOzQDBw6JF6ovM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MgoYPzPelWVWj0WXDtTish4yg1PNEl1A/E5+vv+ChCk=;
        b=cYDfE6Lxa8eTRbc5PLhBu2GZ/iSuPp4TLAMeW6UFkYvp2N31tgtp2greqM9nenqoAt
         mW7TC36gtLGnPbCB1KGD3IKtpeTY+1gAiezlukJ0fWSalFTnR0wMo7KmGSq8VBoWcGuT
         JdumpALn/1I/42h8caqe0hI8EqRGIWXRLuatWYwqWA9CDEEHZNdkwbN28Gm1oLVStTFc
         BoK+GgSSxorni0dwoA/T9brNkXxgALhWV3zsaiwAP45iB8otDP6Eo8GDt01em2pE0/oV
         obhfoHMc3oI+2ggPtzW5wNScxRlqzo12KoNsZbOKnOMt9i5rp72pg30AJaFmEAyxz72O
         8Cqw==
X-Gm-Message-State: AOAM530V1SjuW7H6y8ytMEN2jE02TsZb/R2H59wdvnx9am2Pr5K/Zo7+
	ILR/nfWHxpbv+JmmOXPYLqgiV4shzOoX9A==
X-Google-Smtp-Source: ABdhPJwkBPP3wthx4UG3gWZntPKNkFaTmarlrHVSDeyu8n/UIVQB2VzYFvC8JoTDnPsqS3KLMAs7qA==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr1560951wrt.140.1628115548640;
        Wed, 04 Aug 2021 15:19:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ea47:91d3:ba71:9eb4])
        by smtp.gmail.com with ESMTPSA id l33sm6427872wms.12.2021.08.04.15.19.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 15:19:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] elfutils: Add patch from upstream for glibc 2.34 ptest fixes
Date: Wed,  4 Aug 2021 23:19:06 +0100
Message-Id: <20210804221906.3551311-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804221906.3551311-1-richard.purdie@linuxfoundation.org>
References: <20210804221906.3551311-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch being discussed upstream to fix a ptest issue with glibc 2.34.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../elfutils/elfutils_0.185.bb                |   1 +
 .../elfutils/files/glibc-2.34-fix.patch       | 139 ++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.185.bb b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
index 3e06e7b200e..5031ab97e7a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
+           file://glibc-2.34-fix.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0002-musl-libs.patch \
diff --git a/meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch b/meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch
new file mode 100644
index 00000000000..45568eba53b
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch
@@ -0,0 +1,139 @@
+glibc 2.34 calls pthread_kill from the raise function. Before raise
+directly called the (tg)kill syscall. So allow pthread_kill to be the
+first frame in a backtrace where raise is expected. Also change some
+asserts to fprintf plus abort to make it more clear why the testcase
+fails.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=28190
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2021q3/004016.html]
+---
+ tests/ChangeLog   |  6 +++++
+ tests/backtrace.c | 62 +++++++++++++++++++++++++++++++++++++++++------
+ 2 files changed, 61 insertions(+), 7 deletions(-)
+
+Index: elfutils-0.185/tests/ChangeLog
+===================================================================
+--- elfutils-0.185.orig/tests/ChangeLog
++++ elfutils-0.185/tests/ChangeLog
+@@ -1,3 +1,9 @@
++2021-08-04  Mark Wielaard  <mark@klomp.org>
++
++	PR28190
++	* backtrace.c (callback_verify): Check for pthread_kill as first
++	frame. Change asserts to fprintf plus abort.
++
+ 2021-05-14  Frank Ch. Eigler <fche@redhat.com>
+ 
+ 	PR27859
+Index: elfutils-0.185/tests/backtrace.c
+===================================================================
+--- elfutils-0.185.orig/tests/backtrace.c
++++ elfutils-0.185/tests/backtrace.c
+@@ -97,6 +97,9 @@ callback_verify (pid_t tid, unsigned fra
+   static bool reduce_frameno = false;
+   if (reduce_frameno)
+     frameno--;
++  static bool pthread_kill_seen = false;
++  if (pthread_kill_seen)
++    frameno--;
+   if (! use_raise_jmp_patching && frameno >= 2)
+     frameno += 2;
+   const char *symname2 = NULL;
+@@ -107,11 +110,27 @@ callback_verify (pid_t tid, unsigned fra
+ 	       && (strcmp (symname, "__kernel_vsyscall") == 0
+ 		   || strcmp (symname, "__libc_do_syscall") == 0))
+ 	reduce_frameno = true;
++      else if (! pthread_kill_seen && symname
++	       && strncmp (symname, "pthread_kill",
++			   strlen ("pthread_kill")) == 0)
++	pthread_kill_seen = true;
+       else
+-	assert (symname && strcmp (symname, "raise") == 0);
++	{
++	  if (!symname || strcmp (symname, "raise") != 0)
++	    {
++	      fprintf (stderr,
++		       "case 0: expected symname 'raise' got '%s'\n", symname);
++	      abort ();
++	    }
++	}
+       break;
+     case 1:
+-      assert (symname != NULL && strcmp (symname, "sigusr2") == 0);
++      if (symname == NULL || strcmp (symname, "sigusr2") != 0)
++	{
++	  fprintf (stderr,
++		   "case 1: expected symname 'sigusr2' got '%s'\n", symname);
++	  abort ();
++	}
+       break;
+     case 2: // x86_64 only
+       /* __restore_rt - glibc maybe does not have to have this symbol.  */
+@@ -120,11 +139,21 @@ callback_verify (pid_t tid, unsigned fra
+       if (use_raise_jmp_patching)
+ 	{
+ 	  /* Verify we trapped on the very first instruction of jmp.  */
+-	  assert (symname != NULL && strcmp (symname, "jmp") == 0);
++	  if (symname == NULL || strcmp (symname, "jmp") != 0)
++	    {
++	      fprintf (stderr,
++		       "case 3: expected symname 'raise' got '%s'\n", symname);
++	      abort ();
++	    }
+ 	  mod = dwfl_addrmodule (dwfl, pc - 1);
+ 	  if (mod)
+ 	    symname2 = dwfl_module_addrname (mod, pc - 1);
+-	  assert (symname2 == NULL || strcmp (symname2, "jmp") != 0);
++	  if (symname2 == NULL || strcmp (symname2, "jmp") != 0)
++	    {
++	      fprintf (stderr,
++		       "case 3: expected symname2 'jmp' got '%s'\n", symname2);
++	      abort ();
++	    }
+ 	  break;
+ 	}
+       FALLTHROUGH;
+@@ -137,11 +166,22 @@ callback_verify (pid_t tid, unsigned fra
+ 	  duplicate_sigusr2 = true;
+ 	  break;
+ 	}
+-      assert (symname != NULL && strcmp (symname, "stdarg") == 0);
++      if (symname == NULL || strcmp (symname, "stdarg") != 0)
++	{
++	  fprintf (stderr,
++		   "case 4: expected symname 'stdarg' got '%s'\n", symname);
++	  abort ();
++	}
+       break;
+     case 5:
+       /* Verify we trapped on the very last instruction of child.  */
+-      assert (symname != NULL && strcmp (symname, "backtracegen") == 0);
++      if (symname == NULL || strcmp (symname, "backtracegen") != 0)
++	{
++	  fprintf (stderr,
++		   "case 5: expected symname 'backtracegen' got '%s'\n",
++		   symname);
++	  abort ();
++	}
+       mod = dwfl_addrmodule (dwfl, pc);
+       if (mod)
+ 	symname2 = dwfl_module_addrname (mod, pc);
+@@ -151,7 +191,15 @@ callback_verify (pid_t tid, unsigned fra
+       // instructions or even inserts some padding instructions at the end
+       // (which apparently happens on ppc64).
+       if (use_raise_jmp_patching)
+-        assert (symname2 == NULL || strcmp (symname2, "backtracegen") != 0);
++	{
++          if (symname2 != NULL && strcmp (symname2, "backtracegen") == 0)
++	    {
++	      fprintf (stderr,
++		       "use_raise_jmp_patching didn't expect symname2 "
++		       "'backtracegen'\n");
++	      abort ();
++	    }
++	}
+       break;
+   }
+ }
-- 
2.30.2

