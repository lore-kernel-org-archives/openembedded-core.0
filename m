Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 90F43731A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 08:36:14 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id y89so6628996qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 00:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HGJUewHPrC+PEzXHhFM+nXTMJU0Jp6m23Kd12egKzc4=;
	b=rus6UPMVRFhLXLtCeRhDvIMlDEcH3TljbiSJFdrzZr0O2s8AyhKbB8v4/VTXa0JzGU
	T2snbSuMd/SuFT+mrq80iWtI7BuJWeEnRhL4vSsJdhKunuDcF/113AFGgutTyS3npbNZ
	w+keX8qGcFNsiPzYzxULHoHmRNNA500uY5M9FSywIZebw/iHShrhGB2bp3wNV2GDwszV
	Ty3l8exs8Gk4dtL7lc8yW2GUI3aygSwPFSdnbpGnNJU0uwdHth2rYYcPMY9112joRhbd
	f5RbrmXvlE8xDAoNk63CQw8aBjNTgPA56lq/LRJk83alM8AtgwpHIse0Mabvkt/Lk4Gb
	UYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HGJUewHPrC+PEzXHhFM+nXTMJU0Jp6m23Kd12egKzc4=;
	b=DFspZJTmHSrGjRLf20DJnj9Vs6FQbrobVDjWwjYo4b4stthWF4isUiQw39FYAdSGN5
	V5y3SHTOVqM5nAIVvhlanFmqDTgVTOUmc95l8LeaqtLFE97jPWPxrg9SF9UJtfRJ/TTU
	AT71mF76W6vGm/9gRAsDcbQcHwOkoQwy0IOKJ5jRSuvWLORuzhWzAX3/LoPqf9LMr/W/
	KqtehvKQkhXPc9mrypkiprNhGZ9NkEL+RGp9ghpDaSoTKI2I8aH2GDXO1ogvcPXlhSUt
	4/sKebbENFpYgXN5NbNxiilbidPuGMEQN3YkZEpX9UCgIobvRPj43S3hzg8QDwc/eipD
	sOAw==
X-Gm-Message-State: AG10YOT2aYr+izs70xnUCBE05PsJiTYYb68WB+OSppxSJxobNdG2C5ULi26Rqx093PuqlA==
X-Received: by 10.140.93.247 with SMTP id d110mr350748qge.28.1455698175010;
	Wed, 17 Feb 2016 00:36:15 -0800 (PST)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id y129sm84720qka.33.2016.02.17.00.36.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Feb 2016 00:36:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 08:36:07 +0000
Message-Id: <1455698167-7581-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1455698167-7581-1-git-send-email-raj.khem@gmail.com>
References: <1455698167-7581-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] libnewt: Fix build with PIE flags
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
X-List-Received-Date: Wed, 17 Feb 2016 08:36:14 -0000

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


