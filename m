Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6C07C7724C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 08:07:35 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id s68so39541303qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 00:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HGJUewHPrC+PEzXHhFM+nXTMJU0Jp6m23Kd12egKzc4=;
	b=NPujVlgOfSJRl/mS2ReVzcnUD3R602G8SpwQ+jcFN9a7jHphz9wbIxk7foFP/qWe4e
	9GcaOvyXgCa8CLLr9qWVXdp64mbBJzk7uyUzZcYl+nSp+fJW/Ba6pSYjljnPuUFxbLgr
	4cDl2lm65elCjTAYcfWo/r3JZ9vRk4in/JmRmREICVA+OX+oSGFRUcH0lK/HjuVgConI
	Tg8yVELRMlS4akAWdhyTxljssLBFigvjJEI5/+gOJGM8kr+VgdJEZtXYDbeqQeq81iix
	+UKRKhahU+Gj4IAftabww6BJv+Y42+I8QWACejYcoSpcvrogpQNIJCWfzIStZlvsD2ri
	ze6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HGJUewHPrC+PEzXHhFM+nXTMJU0Jp6m23Kd12egKzc4=;
	b=WK2p6dGFf8ci/sVriC0R7flitFTRZW3wQ7RBYYS3OFszD6W2fVRc3V9kcF+luJ4c5W
	cOWDKmD+lkwMza3cxDeTuJ4MRuyTmveCApHVUDU2MoikoLmk7iHQEnkcP59jNdctXbWY
	eJzLSaoorQp4JZoGdpGFDiKk1OGC9owyVrELNqk5Z7bW9quWfq3dC8fsgoD7AN9G0/Li
	JhiBB0XkOVaWe58nOXzo0jFA1q0gLvZ6zGcSou6fSQArKr9u+r4wfVejyubDLg0XFSHx
	KjQV2luk7lCCktXhjn+7wwMdD4wfwYRCxmP7Rg0GtwgttMQRs7rmhOb9FAlTapdKkjCj
	yaBw==
X-Gm-Message-State: AG10YOSRd4BvAQLi9YMzouBTYZgjZeVJmQcUl0jtpBeCrGt3O1Pi8sAyKY8gcMnVkV3Qbg==
X-Received: by 10.55.74.9 with SMTP id x9mr21829943qka.81.1455955656002;
	Sat, 20 Feb 2016 00:07:36 -0800 (PST)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	n48sm2579937qgd.38.2016.02.20.00.07.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Feb 2016 00:07:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Feb 2016 08:07:27 +0000
Message-Id: <4a93c70ccb43c1088a288bd46add5804aa5647b2.1455955403.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
References: <f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
In-Reply-To: <cover.1455955403.git.raj.khem@gmail.com>
References: <cover.1455955403.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] libnewt: Fix build with PIE flags
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
X-List-Received-Date: Sat, 20 Feb 2016 08:07:35 -0000

security flags add -pie -fpie to CFLAGS which is not
right options for compiling .so files, they are only
useful for compiling executables

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/newt/files/pie-flags.patch | 36 ++++++++++++++++++++++++
 meta/recipes-extended/newt/libnewt_0.52.18.bb    |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/newt/files/pie-flags.patch

diff --git a/meta/recipes-extended/newt/files/pie-flags.patch b/meta/recipes-extended/newt/files/pie-flags.patch
new file mode 100644
index 0000000..8883e26
--- /dev/null
+++ b/meta/recipes-extended/newt/files/pie-flags.patch
@@ -0,0 +1,36 @@
+specify -fPIC after CFLAGS so it can override the CFLAGS containing -pie and -fpie
+this makes sure the objects that go into shared objects are compiled with -fPIC
+and not with -fpie. We can not use -fpie on objects which will go into .so files
+Fixes errors like
+
+| /mnt/oe/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld: shared/newt.o: relocation R_X86_64_PC32 against undefined symbol `SLtt_Screen_Rows@@SLANG2' can not be used when making a shared object; recompile with -fPIC
+| /mnt/oe/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld: final link failed: Bad value
+| collect2: error: ld returned 1 exit status
+| make: *** [libnewt.so.0.52.18] Error 1
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: newt-0.52.18/Makefile.in
+===================================================================
+--- newt-0.52.18.orig/Makefile.in
++++ newt-0.52.18/Makefile.in
+@@ -96,8 +96,8 @@ _snack.$(SOEXT):   snack.c $(LIBNEWTSH)
+ 		PIFLAGS=`$$pyconfig --includes`; \
+ 		PLDFLAGS=`$$pyconfig --ldflags`; \
+ 		PLFLAGS=`$$pyconfig --libs`; \
+-		echo $(CC) $(SHCFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
+-		$(CC) $(SHCFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
++		echo $(CC) $(CPPFLAGS) $(SHCFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
++		$(CC) $(CPPFLAGS) $(SHCFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
+ 		echo $(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snack.$(SOEXT) $$ver/snack.o -L.  -lnewt $(LIBS); \
+ 		$(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snack.$(SOEXT) $$ver/snack.o -L.  -lnewt $(LIBS); \
+ 	done || :
+@@ -135,7 +135,7 @@ $(LIBNEWTSH): $(SHAREDOBJS)
+ 	ln -fs $(LIBNEWTSH) $(LIBNEWTSONAME)
+ 
+ $(SHAREDDIR)/%.o : %.c $(SHAREDDIR)
+-	$(CC) $(SHCFLAGS) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
++	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(SHCFLAGS) -o $@ $<
+ 
+ install: $(LIBNEWT) install-sh whiptail
+ 	[ -d $(instroot)/$(bindir) ] || install -m 755 -d $(instroot)/$(bindir)
diff --git a/meta/recipes-extended/newt/libnewt_0.52.18.bb b/meta/recipes-extended/newt/libnewt_0.52.18.bb
index 293c1a8..9a2964b 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.18.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.18.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
            file://fix_SHAREDDIR.patch \
            file://cross_ar.patch \
            file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
+           file://pie-flags.patch \
 "
 
 SRC_URI[md5sum] = "685721bee1a318570704b19dcf31d268"
@@ -37,6 +38,7 @@ CLEANBROKEN = "1"
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
+export CPPFLAGS
 
 export BUILD_SYS
 export HOST_SYS
-- 
1.8.3.1


