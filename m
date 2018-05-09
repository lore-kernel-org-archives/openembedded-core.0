Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 971A575084
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 20:24:33 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id v63so26168228pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 13:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wZctK5siCYiEbi5g62HOPFQrR6Qt6bW47dYAbrlApiM=;
	b=kAji0HGHc9PLZjXghu9Jmf9rbAvPBHvatbUTi8OSI5VGCGEoAtZ3gz1DoAJv+VMoqm
	apHgQuOT58MtvNhjn+sUWJqYWdoYccqIevfyHLOtDH2zWx6apovOQY7GYGWHSqKBroqP
	VurAdA/XlWIGQ/WdThBswR2Ucw829MVqhkoqppMwJIi+FdQLPrBiD/uc7KQLddxPL8cr
	bIVWQGkj8MH8buk6kb+TRDhzKGfoge5EiFU7EUjzHV7XdpDSaw4aJC1f17eJCT3ShMfI
	LTp/cMlysEx/RujXhY73hAKJcXzvQUI4Cske0WWoPSQ0mXlgNrGNjHBnpxi6J2VTaZWg
	CjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wZctK5siCYiEbi5g62HOPFQrR6Qt6bW47dYAbrlApiM=;
	b=bmlayXQJPq0ixWqQMEy40la0mFqu8Q0PrXsLD0/ENWZK0Os0e1u8PM9MYqtzugU2ZF
	F/81fmlA/xpR+EquR/7Ue9Cd+7PRXwQEhpqSe/YWkRiPjhrxx3uyFBDtbC2opcvf6cTh
	HDJVerwBMqEMt4FSz/1DeqofeZydCdm3He1JtJbL2eAHzlNWj31qQabEz5vhrpDUZkvY
	zblMk/1ZbDhm1jl5Iq7+Z52Vm5W3uUhAJOmmeWEA8cWL9zDvCQ2Go6LVdonvSj8Xh2sW
	wA+Di/T5Q6xi416X7sR5F3x2ys6rZxEUP+mpyH3EYAGeMS0bHQvWEFIDYUgnFre0rhL0
	ATGw==
X-Gm-Message-State: ALKqPwdd8JxzlnmufkGiluXzwp29PO5GN8T6hLTHsHsz8298Ixz4CwMx
	3sZ1IwLpRf5OM9tXSDZD383EGQ==
X-Google-Smtp-Source: AB8JxZpqnHxI3oLA8qI/igyzz0AvR740mjdLoigUDQPfwA+tXQlFrCHZhZwIo57k27yPowkuP/eb1w==
X-Received: by 2002:a65:4dca:: with SMTP id
	q10-v6mr6167352pgt.22.1525897474084; 
	Wed, 09 May 2018 13:24:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	x124sm2142222pfx.72.2018.05.09.13.24.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 13:24:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 13:24:22 -0700
Message-Id: <20180509202422.22501-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509202422.22501-1-raj.khem@gmail.com>
References: <20180509202422.22501-1-raj.khem@gmail.com>
Subject: [PATCH 9/9] swig: Replace strncpy with memcpy
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
X-List-Received-Date: Wed, 09 May 2018 20:24:33 -0000

gcc8 is detecting string truncations when swig is
used in other packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ue-reported-for-SWIG_Python_FixMetho.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/swig/swig_3.0.12.bb     |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch

diff --git a/meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch b/meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch
new file mode 100644
index 0000000000..eab50fc7ef
--- /dev/null
+++ b/meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch
@@ -0,0 +1,36 @@
+From 9825fcbab5c4ddd867432f9922bebfbec7b78af0 Mon Sep 17 00:00:00 2001
+From: Mark Dufour <m.dufour@kopano.com>
+Date: Tue, 14 Feb 2017 10:34:37 +0100
+Subject: [PATCH] [Coverity] fix issue reported for SWIG_Python_FixMethods
+
+Fix Coverity issue reported for SWIG_Python_FixMethods:
+
+"buffer_size: Calling strncpy with a source string whose length
+(10 chars) is greater than or equal to the size argument (10)
+will fail to null-terminate buff."
+
+The issue is only reported for the "swig_ptr: " line, but for
+consistency we replace both occurrences of strncpy with memcpy.
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Status: Backport [https://github.com/swig/swig/pull/898]
+
+ Lib/python/pyinit.swg | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: swig-3.0.12/Lib/python/pyinit.swg
+===================================================================
+--- swig-3.0.12.orig/Lib/python/pyinit.swg
++++ swig-3.0.12/Lib/python/pyinit.swg
+@@ -306,9 +306,9 @@ SWIG_Python_FixMethods(PyMethodDef *meth
+ 	  char *ndoc = (char*)malloc(ldoc + lptr + 10);
+ 	  if (ndoc) {
+ 	    char *buff = ndoc;
+-	    strncpy(buff, methods[i].ml_doc, ldoc);
++	    memcpy(buff, methods[i].ml_doc, ldoc);
+ 	    buff += ldoc;
+-	    strncpy(buff, "swig_ptr: ", 10);
++	    memcpy(buff, "swig_ptr: ", 10);
+ 	    buff += 10;
+ 	    SWIG_PackVoidPtr(buff, ptr, ty->name, lptr);
+ 	    methods[i].ml_doc = ndoc;
diff --git a/meta/recipes-devtools/swig/swig_3.0.12.bb b/meta/recipes-devtools/swig/swig_3.0.12.bb
index 15f7348681..429840bde1 100644
--- a/meta/recipes-devtools/swig/swig_3.0.12.bb
+++ b/meta/recipes-devtools/swig/swig_3.0.12.bb
@@ -3,6 +3,7 @@ require ${BPN}.inc
 SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
             file://0001-Add-Node-7.x-aka-V8-5.2-support.patch \
+            file://swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch \
            "
 SRC_URI[md5sum] = "82133dfa7bba75ff9ad98a7046be687c"
 SRC_URI[sha256sum] = "7cf9f447ae7ed1c51722efc45e7f14418d15d7a1e143ac9f09a668999f4fc94d"
-- 
2.17.0


