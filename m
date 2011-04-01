Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q5eoO-0002p9-Ao
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 15:54:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Apr 2011 06:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,282,1299484800"; d="scan'208";a="674174784"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2011 06:52:49 -0700
Message-Id: <322821986cb311dcf6ceeee438d41d7472cb23a0.1301665368.git.josh@linux.intel.com>
In-Reply-To: <cover.1301665368.git.josh@linux.intel.com>
References: <cover.1301665368.git.josh@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 21:46:42 +0100
Date: Fri, 01 Apr 2011 14:52:48 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 6/7] openjade: fix build with GCC 4.6
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
X-List-Received-Date: Fri, 01 Apr 2011 13:54:57 -0000

From: Joshua Lock <josh@linux.intel.com>

In GCC 4.6 the compiler no longer allows objects of const-qualified type to
be default initialized unless the type has a user-declared default
constructor.

Patch from Gentoo bugzilla: http://bugs.gentoo.org/show_bug.cgi?id=358021

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../user-declared-default-constructor.patch        |   88 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    5 +-
 2 files changed, 91 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch

diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch
new file mode 100644
index 0000000..2f2adfe
--- /dev/null
+++ b/meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch
@@ -0,0 +1,88 @@
+In GCC 4.6 the compiler no longer allows objects of const-qualified type to
+be default initialized unless the type has a user-declared default
+constructor.
+
+Patch from Gentoo bugzilla: http://bugs.gentoo.org/show_bug.cgi?id=358021
+
+Gentoo Bugzilla description follows:
+"If a class or struct has no user-defined default constructor, C++ doesn't
+allow you to default construct a const instance of it.
+
+https://bugs.gentoo.org/358021
+http://clang.llvm.org/compatibility.html#default_init_const
+http://gcc.gnu.org/PR44499"
+
+--- a/jade/TeXFOTBuilder.cxx
++++ b/jade/TeXFOTBuilder.cxx
+@@ -88,6 +88,8 @@ public:
+       value.convertString(nic_.placement);
+       }
+     ExtensionFlowObj *copy() const { return new PageFloatFlowObj(*this); }
++  public:
++    PageFloatFlowObj() {}
+   private:
+     PageFloatNIC nic_;
+     StringC name_;
+@@ -101,6 +103,8 @@ public:
+       fotb.endPageFootnote();
+     }
+     ExtensionFlowObj *copy() const { return new PageFootnoteFlowObj(*this); }
++  public:
++    PageFootnoteFlowObj() {}
+   private:
+   };
+   //////////////////////////////////////////////////////////////////////
+--- a/jade/TransformFOTBuilder.cxx
++++ b/jade/TransformFOTBuilder.cxx
+@@ -41,6 +41,7 @@ public:
+   };
+   class EntityRefFlowObj : public TransformExtensionFlowObj {
+   public:
++    EntityRefFlowObj() {}
+     void atomic(TransformFOTBuilder &fotb, const NodePtr &) const {
+       fotb.entityRef(name_);
+     }
+@@ -56,6 +57,7 @@ public:
+   };
+   class ProcessingInstructionFlowObj : public TransformExtensionFlowObj {
+   public:
++    ProcessingInstructionFlowObj() {}
+     void atomic(TransformFOTBuilder &fotb, const NodePtr &) const {
+       fotb.processingInstruction(data_);
+     }
+@@ -98,6 +100,8 @@ public:
+       }
+     }
+     ExtensionFlowObj *copy() const { return new EmptyElementFlowObj(*this); }
++  public:
++    EmptyElementFlowObj() {}
+   private:
+     ElementNIC nic_;
+   };
+@@ -133,6 +137,8 @@ public:
+       }
+     }
+     ExtensionFlowObj *copy() const { return new ElementFlowObj(*this); }
++  public:
++    ElementFlowObj() {}
+   private:
+     ElementNIC nic_;
+   };
+@@ -150,6 +156,8 @@ public:
+       value.convertString(systemId_);
+     }
+     ExtensionFlowObj *copy() const { return new EntityFlowObj(*this); }
++  public:
++    EntityFlowObj() {}
+   private:
+     StringC systemId_;
+   };
+@@ -174,6 +182,8 @@ public:
+       }
+     }
+     ExtensionFlowObj *copy() const { return new DocumentTypeFlowObj(*this); }
++  public:
++    DocumentTypeFlowObj() {}
+   private:
+     DocumentTypeNIC nic_;
+   };
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index 0de8b96..5c1037a 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -7,13 +7,14 @@ SECTION = "base"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "opensp-native sgml-common-native"
 RDEPENDS_${PN} = "sgml-common"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
-           file://makefile.patch"
+           file://makefile.patch \
+	   file://user-declared-default-constructor.patch"
 
 SRC_URI[md5sum] = "7df692e3186109cc00db6825b777201e"
 SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7d322d1"
-- 
1.7.4.1



