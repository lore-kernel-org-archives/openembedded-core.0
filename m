Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu56-0005YU-Jr
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:35:57 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5tnr4KgIuXcP5ExSwMT712Z4lNKIoG1RfKvTXNhwIHU=;
	b=kFG29g83SamdLFG1LNHhCRIE06F2gT/APwdCOBqbrdBScwSTNgVSwssK/7BcLdfxZz
	/ptYS8jXrzaGjCEmsi2oquqfJ4gH3yMPBKYzyy+04CdLi0MArRSv2HoQp+nY0OAbLBLh
	6736UUjLEMzgG6344N9hsFAbXFYF5CiSCycv8=
Received: by 10.204.14.208 with SMTP id h16mr9132342bka.2.1321028978754;
	Fri, 11 Nov 2011 08:29:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cc2sm9607590bkb.8.2011.11.11.08.29.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:29:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:41 +0100
Message-Id: <39d0cf5e81107d18357c06ec94d8923d6a4e1c7c.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 05/22] webkit-gtk: force arm mode to work around binutils segfault
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2011 16:35:57 -0000

* this is just work around, would be better to fix in toolchain

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 2862ad4..92b2df1 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -14,7 +14,7 @@ SRCREV_FORMAT = "source"
 
 SRCREV = "90727"
 PV = "1.5.1+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
@@ -45,6 +45,23 @@ EXTRA_OECONF = "\
 
 EXTRA_AUTORECONF = " -I Source/autotools "
 
+
+#| ./Source/JavaScriptCore/heap/HandleTypes.h: In static member function 'static T* JSC::HandleTypes<T>::getFromSlot(JSC::HandleSlot) [with T = JSC::Structure, JSC::HandleTypes<T>::ExternalType = JSC::Structure*, JSC::HandleSlot = JSC::JSValue*]':
+#| ./Source/JavaScriptCore/heap/Handle.h:141:79:   instantiated from 'JSC::Handle<T>::ExternalType JSC::Handle<T>::get() const [with T = JSC::Structure, JSC::Handle<T>::ExternalType = JSC::Structure*]'
+#| ./Source/JavaScriptCore/runtime/ScopeChain.h:39:75:   instantiated from here
+#| ./Source/JavaScriptCore/heap/HandleTypes.h:38:130: warning: cast from 'JSC::JSCell*' to 'JSC::HandleTypes<JSC::Structure>::ExternalType {aka JSC::Structure*}' increases required alignment of target type [-Wcast-align]
+#| {standard input}: Assembler messages:
+#| {standard input}:28873: Error: invalid immediate: 983040 is out of range
+#| {standard input}:28873: Error: value of 983040 too large for field of 2 bytes at 15110
+#| /OE/shr-core/tmp/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.2/as: BFD (GNU Binutils) 2.21.1 assertion fail /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/binutils-cross-2.21.1a-r0/binutils-2.21.1/bfd/elf.c:2819
+#| arm-oe-linux-gnueabi-g++: internal compiler error: Segmentation fault (program as)
+#| Please submit a full bug report,
+#| with preprocessed source if appropriate.
+#| See <http://gcc.gnu.org/bugs.html> for instructions.
+#| make[1]: *** [Source/JavaScriptCore/jit/libjavascriptcoregtk_1_0_la-JIT.lo] Error 1
+#| make[1]: Leaving directory `/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0'
+ARM_INSTRUCTION_SET = "arm"
+
 CONFIGUREOPT_DEPTRACK = ""
 
 do_configure_append() {
-- 
1.7.8.rc1



