Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 240397D210
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 00:43:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x320h5QP025440
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Apr 2019 17:43:05 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 1 Apr 2019 17:43:04 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Apr 2019 08:43:03 +0800
Message-ID: <1554165783-46226-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LZ=1YBJQ69jTYVDnz+LFBX9eN3V6LfnK46fxTJUb=nH0g@mail.gmail.com>
References: <CAJTo0LZ=1YBJQ69jTYVDnz+LFBX9eN3V6LfnK46fxTJUb=nH0g@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] llvm: fix link error for powerpc
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
X-List-Received-Date: Tue, 02 Apr 2019 00:43:05 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below link error for powerpc

lib/libLLVMSupport.a(CommandLine.cpp.o): in function `llvm::cl::opt_storage<(anonymous namespace):
:HelpPrinterWrapper, true, true>::setLocation(llvm::cl::Option&, (anonymous namespace)::HelpPrinterWrapper&) [clone .isra.189]':
/usr/src/debug/llvm/8.0-r0/git/llvm/include/llvm/Support/CommandLine.h:1218:(.text.startup+0x5c):
relocation truncated to fit: R_PPC_PLTREL24 against symbol `llvm::errs()' defined in .text section in lib/libLLVMSupport.a(raw_ostream.cpp.o)+8000
lib/libLLVMSupport.a(CommandLine.cpp.o): in function `setLocation':

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index d2ea927..a35ea4a 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -88,6 +88,8 @@ EXTRA_OECMAKE_append_class-nativesdk = "\
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
                  "
 
+CXXFLAGS_append_class-target_powerpc = " -mlongcall"
+
 do_configure_prepend() {
 # Fix paths in llvm-config
 	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
-- 
2.7.4


