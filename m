Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C090F7807D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 12:03:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 11 Jul 2017 05:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,346,1496127600"; d="scan'208";a="1150337212"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2017 05:03:08 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 588ED5804B8;
	Tue, 11 Jul 2017 05:03:07 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org, fan.xin@jp.fujitsu.com,
	fathi.boudra@linaro.org
Date: Tue, 11 Jul 2017 15:03:04 +0300
Message-Id: <8102dbf1ab0420cf03fece48213af05aa5aefe4c.1499773663.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499773663.git.jussi.kukkonen@intel.com>
References: <cover.1499773663.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/1] acpitests: Remove as unmaintained
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
X-List-Received-Date: Tue, 11 Jul 2017 12:03:08 -0000

This recipe was last upgraded about ~30 releases or three years ago,
it seems to only be touched when something breaks. It also has an
'interesting' license that maybe is open source...

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../acpica/acpitests/aapits-linux.patch            | 336 ---------------------
 .../acpica/acpitests/aapits-makefile.patch         |  34 ---
 meta/recipes-extended/acpica/acpitests_20140828.bb |  36 ---
 3 files changed, 406 deletions(-)
 delete mode 100644 meta/recipes-extended/acpica/acpitests/aapits-linux.patch
 delete mode 100644 meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
 delete mode 100644 meta/recipes-extended/acpica/acpitests_20140828.bb

diff --git a/meta/recipes-extended/acpica/acpitests/aapits-linux.patch b/meta/recipes-extended/acpica/acpitests/aapits-linux.patch
deleted file mode 100644
index 5601046..0000000
--- a/meta/recipes-extended/acpica/acpitests/aapits-linux.patch
+++ /dev/null
@@ -1,336 +0,0 @@
-From: Al Stone <ahs3@ahs3.net>
-Date: Mon, 7 Apr 2014 19:09:37 +0000
-Subject: [PATCH 1/2] Fixup aapits build
-
-From http://git.linaro.org/people/al.stone/acpica-tools.git
-Upstream-Status: Pending
-
-diff -urN acpica-unix2-20130626/tests/aapits/atexec.c acpica-unix2-20130626-aapits/tests/aapits/atexec.c
---- acpica-unix2-20130626/tests/aapits/atexec.c	2013-01-17 12:48:28.000000000 -0700
-+++ acpica-unix2-20130626-aapits/tests/aapits/atexec.c	2013-07-25 13:44:23.023894441 -0600
-@@ -639,6 +639,7 @@
- }
- 
- 
-+#if ACPI_MACHINE_WIDTH == 32
- /*******************************************************************************
-  *
-  * FUNCTION:    AtBuildLocalRSDT
-@@ -757,8 +758,9 @@
-         LocalRSDT->Header.Checksum = (UINT8)~LocalRSDT->Header.Checksum;
-     }
- }
-+#endif
- 
- 
- /*******************************************************************************
-  *
-  * FUNCTION:    AtBuildLocalXSDT
-@@ -1424,7 +1426,7 @@
-         ACPI_WARNING ((AE_INFO,
-             "Request on [%4.4s] is beyond region limit Req-%X+%X, Base=%X, Len-%X\n",
-             (RegionObject->Region.Node)->Name.Ascii, (UINT32) Address,
--            ByteWidth, (UINT32) BufferAddress, Length));
-+            ByteWidth, (UINT32) BufferAddress, (UINT32) Length));
- 
-         return (AE_AML_REGION_LIMIT);
-     }
-@@ -1792,7 +1796,9 @@
-             Path, Obj.Integer.Value, Value);
- #else
-         printf ("API Error: Value of %s is 0x%llx instead of expected 0x%llx\n",
--            Path, Obj.Integer.Value, Value);
-+            Path,
-+	    (long long unsigned int) Obj.Integer.Value,
-+	    (long long unsigned int) Value);
- #endif
-         Status = AE_ERROR;
-     }
-@@ -1871,7 +1877,7 @@
-     {
-         TestErrors++;
-         printf ("Test Error: cannot allocate buffer of %d bytes\n",
--            Results.Length);
-+                (int) Results.Length);
-         return (AE_NO_MEMORY);
-     }
-     Results.Pointer = Object;
-@@ -1952,7 +1956,8 @@
-     {
-         printf ("AtCheckBuffer: unexpected length %d of Buffer vs"
-             " calculated %d bytes\n",
--            Results.Length, ACPI_ROUND_UP_TO_NATIVE_WORD(sizeof (ACPI_OBJECT) + Length));
-+            (int)Results.Length,
-+	    (int)(ACPI_ROUND_UP_TO_NATIVE_WORD(sizeof (ACPI_OBJECT) + Length)));
-     }
- 
-     /* Initialize the return buffer structure */
-@@ -1961,7 +1968,7 @@
-     {
-         TestErrors++;
-         printf ("Test Error: cannot allocate buffer of %d bytes\n",
--            Results.Length);
-+            (int) Results.Length);
-         return (AE_NO_MEMORY);
-     }
-     Results.Pointer = Object;
-diff -urN acpica-unix2-20130626/tests/aapits/atinit.c acpica-unix2-20130626-aapits/tests/aapits/atinit.c
---- acpica-unix2-20130626/tests/aapits/atinit.c	2013-01-17 12:48:28.000000000 -0700
-+++ acpica-unix2-20130626-aapits/tests/aapits/atinit.c	2013-07-25 13:20:19.706705960 -0600
-@@ -3024,7 +3024,7 @@
-             AapiErrors++;
-             printf ("API Error: AcpiGetSystemInfo() returned"
-                 " Length %d, expected %d\n",
--                OutBuffer.Length, sizeof (Info));
-+                (int) OutBuffer.Length, (int) sizeof (Info));
-             return (AE_ERROR);
-         }
- 
-@@ -3046,7 +3046,7 @@
-             AapiErrors++;
-             printf ("API Error: AcpiGetSystemInfo() returned"
-                 " Length %d, expected %d\n",
--                OutBuffer.Length, sizeof (Info));
-+                (int) OutBuffer.Length, (int) sizeof (Info));
-             return (AE_ERROR);
-         }
- 
-@@ -3066,7 +3066,7 @@
-             AapiErrors++;
-             printf ("API Error: AcpiGetSystemInfo() returned"
-                 " Length %d, expected %d\n",
--                OutBuffer.Length, sizeof (Info));
-+                (int) OutBuffer.Length, (int) sizeof (Info));
-             return (AE_ERROR);
-         }
-         else if (OutBuffer.Pointer != &Info)
-@@ -3149,7 +3149,7 @@
-             AapiErrors++;
-             printf ("API Error: AcpiGetSystemInfo() returned"
-                 " Length %d, expected %d\n",
--                OutBuffer.Length, sizeof (Info));
-+                (int) OutBuffer.Length, (int) sizeof (Info));
-             return (AE_ERROR);
-         }
-         else if (OutBuffer.Pointer != &Info)
-@@ -3214,7 +3214,7 @@
-             AapiErrors++;
-             printf ("API Error: AcpiGetSystemInfo() returned"
-                 " Length %d, expected %d\n",
--                OutBuffer.Length, sizeof (ACPI_SYSTEM_INFO));
-+                (int) OutBuffer.Length, (int) sizeof (ACPI_SYSTEM_INFO));
-             return (AE_ERROR);
-         }
-         else
-diff -urN acpica-unix2-20130626/tests/aapits/atmain.c acpica-unix2-20130626-aapits/tests/aapits/atmain.c
---- acpica-unix2-20130626/tests/aapits/atmain.c	2013-01-17 12:48:28.000000000 -0700
-+++ acpica-unix2-20130626-aapits/tests/aapits/atmain.c	2013-07-25 13:18:22.083323948 -0600
-@@ -315,7 +315,7 @@
-     {
-         printf ("ACPICA API TS err: test num %ld of test case %ld"
-             " is not implemented\n",
--            test_num, test_case);
-+            (long int) test_num, (long int) test_case);
-         return (AtRetNotImpl);
-     }
- 
-@@ -430,7 +432,7 @@
-     if (test_case < 1 || test_case > AT_TEST_CASE_NUM)
-     {
-         printf ("ACPICA API TS err: test case %ld is out of range 1 - %d\n",
--            test_case, AT_TEST_CASE_NUM);
-+            (long int) test_case, (int) AT_TEST_CASE_NUM);
-         return (AtRetBadParam);
-     }
- 
-@@ -438,7 +440,7 @@
-     if (test_num < 0 || test_num > AtTestCase[test_case].TestsNum)
-     {
-         printf ("ACPICA API TS err: test num %ld is out of range 0 - %d\n",
--            test_num, AtTestCase[test_case].TestsNum);
-+            (long int) test_num, AtTestCase[test_case].TestsNum);
-         return (AtRetBadParam);
-     }
-
-diff -urN acpica-unix2-20130626/tests/aapits/atnamespace.c acpica-unix2-20130626-aapits/tests/aapits/atnamespace.c
---- acpica-unix2-20130626/tests/aapits/atnamespace.c	2013-01-17 12:48:28.000000000 -0700
-+++ acpica-unix2-20130626-aapits/tests/aapits/atnamespace.c	2013-07-25 13:24:15.366466707 -0600
-@@ -2535,7 +2535,8 @@
- #else
-                 printf ("API Error: Address of %s (0x%llX) != (0x%llX)\n",
-                     PathNames[2 * i + 1],
--                    Info->Address, ExpectedInfo[i].Address);
-+                    (long long unsigned int) Info->Address,
-+		    (long long unsigned int) ExpectedInfo[i].Address);
- #endif
- #else
-                 printf ("API Error: Address of %s (0x%X) != (0x%X)\n",
-@@ -2908,7 +2909,8 @@
-         TestErrors++;
-         printf ("AtGetNextObjectTypeCommon: different numbers of entities"
-             "in TypesNames (%d) and LevelTypes0000 (%d)\n",
--            TypesCount, sizeof (LevelTypes0000) / sizeof (ACPI_OBJECT_TYPE));
-+            TypesCount,
-+	    (int) (sizeof (LevelTypes0000) / sizeof (ACPI_OBJECT_TYPE)));
-         return (AE_ERROR);
-     }
- 
-@@ -4192,7 +4194,9 @@
-             Pathname, Obj.Integer.Value, Value);
- #else
-         printf ("API Error: Value of %s is 0x%llx instead of expected 0x%llx\n",
--            Pathname, Obj.Integer.Value, Value);
-+            Pathname,
-+	    (long long unsigned int) Obj.Integer.Value,
-+	    (long long unsigned int) Value);
- #endif
-         Status = AE_ERROR;
-     }
-@@ -5199,7 +5203,7 @@
-             {
-                 AapiErrors++;
-                 printf ("API Error: AcpiOsAllocate(%d) returned NULL\n",
--                    OutName.Length);
-+                    (int) OutName.Length);
-                 return (AE_ERROR);
-             }
-         }
-diff -urN acpica-unix2-20130626/tests/aapits/atosxfctrl.c acpica-unix2-20130626-aapits/tests/aapits/atosxfctrl.c
---- acpica-unix2-20130626/tests/aapits/atosxfctrl.c	2013-01-17 12:48:28.000000000 -0700
-+++ acpica-unix2-20130626-aapits/tests/aapits/atosxfctrl.c	2013-07-25 13:30:00.375492751 -0600
-@@ -737,13 +737,15 @@
- #if ACPI_MACHINE_WIDTH == 64
- #ifdef    _MSC_VER
-         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%I64x\n",
-+            Width, Address);
- #else
-         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%llx\n",
-+            Width, (long long unsigned int) Address);
- #endif
- #else
-         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%x\n",
--#endif
-             Width, Address);
-+#endif
-         return (NULL);
-     }
- 
-@@ -764,15 +766,19 @@
- #ifdef    _MSC_VER
-                 printf("OsxfCtrlFingReg: intersection Regs (0x%I64x: 0x%x)"
-                     " and (0x%I64x: 0x%x)\n",
-+                    Reg->Address, Reg->Width, Address, Width);
- #else
-                 printf("OsxfCtrlFingReg: intersection Regs (0x%llx: 0x%x)"
-                     " and (0x%llx: 0x%x)\n",
-+                    (long long unsigned int) Reg->Address,
-+		    Reg->Width,
-+		    (long long unsigned int) Address, Width);
- #endif
- #else
-                 printf("OsxfCtrlFingReg: intersection Regs (0x%x: 0x%x)"
-                     " and (0x%x: 0x%x)\n",
--#endif
-                     Reg->Address, Reg->Width, Address, Width);
-+#endif
-                 return (NULL);
-             }
-         }
-@@ -786,13 +792,15 @@
- #if ACPI_MACHINE_WIDTH == 64
- #ifdef    _MSC_VER
-             printf("OsxfCtrlFingReg: no memory for Reg (0x%I64x: 0x%x)\n",
-+                Reg->Address, Reg->Width);
- #else
-             printf("OsxfCtrlFingReg: no memory for Reg (0x%llx: 0x%x)\n",
-+                (long long unsigned int) Reg->Address, Reg->Width);
- #endif
- #else
-             printf("OsxfCtrlFingReg: no memory for Reg (0x%x: 0x%x)\n",
--#endif
-                 Reg->Address, Reg->Width);
-+#endif
-             return (NULL);
-         }
-         Reg->Type = Type;
-@@ -932,14 +940,19 @@
- #if ACPI_MACHINE_WIDTH == 64
- #ifdef    _MSC_VER
-             printf("%.2u (%s Address 0x%I64x: Width %.2u) r/w counts: %u/%u\n",
-+                i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
-+                Reg->Address, Reg->Width, Reg->ReadCount, Reg->WriteCount);
- #else
-             printf("%.2u (%s Address 0x%llx: Width %.2u) r/w counts: %u/%u\n",
-+                i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
-+                (long long unsigned int) Reg->Address,
-+		Reg->Width, Reg->ReadCount, Reg->WriteCount);
- #endif
- #else
-             printf("%.2u (%s Address 0x%.4x: Width %.2u) r/w counts: %u/%u\n",
--#endif
-                 i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
-                 Reg->Address, Reg->Width, Reg->ReadCount, Reg->WriteCount);
-+#endif
-             Reg = Reg->Next;
-             i++;
-         }
-diff -urN acpica-unix2-20130626/tests/aapits/atresource.c acpica-unix2-20130626-aapits/tests/aapits/atresource.c
---- acpica-unix2-20130626/tests/aapits/atresource.c	2013-01-17 12:48:29.000000000 -0700
-+++ acpica-unix2-20130626-aapits/tests/aapits/atresource.c	2013-07-25 13:25:49.423565947 -0600
-@@ -174,7 +174,7 @@
-         AapiErrors++;
-         printf ("API Error: AcpiGetCurrentResources(%s) returned Length %d,"
-             " expected %d\n",
--            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-+            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-         return (AE_ERROR);
-     }
- 
-@@ -490,7 +490,7 @@
-         AapiErrors++;
-         printf ("API Error: AcpiGetCurrentResources(%s) returned Length %d,"
-             " expected %d\n",
--            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-+            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-         return (AE_ERROR);
-     }
- 
-@@ -689,7 +689,7 @@
-         AapiErrors++;
-         printf ("Api Error: Resource->Length (%d) != %d\n",
-             CurrentResource->Length,
--            ACPI_ROUND_UP_TO_NATIVE_WORD (ACPI_RS_SIZE (ACPI_RESOURCE_IRQ)));
-+            (int) (ACPI_ROUND_UP_TO_NATIVE_WORD (ACPI_RS_SIZE (ACPI_RESOURCE_IRQ))));
-     }
- 
-     if (CurrentResource->Data.Irq.Triggering != 0) /* Level-Triggered */
-@@ -981,7 +981,7 @@
-         AapiErrors++;
-         printf ("API Error: AcpiGetPossibleResources(%s) returned Length %d,"
-             " expected %d\n",
--            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-+            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-         return (AE_ERROR);
-     }
- 
-@@ -1923,7 +1923,7 @@
-         AapiErrors++;
-         printf ("API Error: AcpiGetIrqRoutingTable(%s) returned Length %d,"
-             " expected %d\n",
--            Pathname, OutBuffer.Length, 0xA48);
-+            Pathname, (int) OutBuffer.Length, 0xA48);
-         return (AE_ERROR);
-     }
-
-diff -urN acpica-unix2-20130626/tests/aapits/Makefile acpica-unix2-20130626-aapits/tests/aapits/Makefile
---- acpica-unix2-20130626/tests/aapits/Makefile	2013-01-17 12:48:29.000000000 -0700
-+++ acpica-unix2-20130626-aapits/tests/aapits/Makefile	2013-07-25 15:17:09.309236422 -0600
-@@ -194,7 +194,7 @@
- CFLAGS+= -Wall -g -D_LINUX -DNDEBUG -D_CONSOLE -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../../source/include
-
- 
--acpiexec : $(patsubst %.c,%.o, $(SRCS))
-+$(PROG) : $(patsubst %.c,%.o, $(SRCS))
- 	$(CC) $(LDFLAGS) $(patsubst %.c,%.o, $(SRCS)) -o $(PROG)
- 
- CLEANFILES= $(PROG)
diff --git a/meta/recipes-extended/acpica/acpitests/aapits-makefile.patch b/meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
deleted file mode 100644
index f9d9dea..0000000
--- a/meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From: Al Stone <ahs3@ahs3.net>
-Date: Mon, 7 Apr 2014 19:09:37 +0000
-Subject: [PATCH 1/2] Fixup aapits build
-
-From http://git.linaro.org/people/al.stone/acpica-tools.git
-Upstream-Status: Pending
-
-diff -urN acpica-unix2-20140325/tests/aapits/Makefile acpica-unix2-20140325/tests/aapits/Makefile
---- acpica-unix2-20140325/tests/aapits/Makefile	2014-04-05 14:23:14.683636794 -0600
-+++ acpica-unix2-20140325-aapits/tests/aapits/Makefile	2014-04-05 15:10:57.879184598 -0600
-@@ -16,6 +16,7 @@
- 	atosxfwrap.c \
- 	osunixxf.c \
- 	../../source/common/ahids.c \
-+	../../source/common/ahuuids.c \
- 	../../source/common/cmfsize.c \
- 	../../source/common/getopt.c \
- 	../../source/components/hardware/hwtimer.c \
-@@ -174,6 +175,7 @@
- 	../../source/components/utilities/utexcep.c \
- 	../../source/components/utilities/utfileio.c \
- 	../../source/components/utilities/utglobal.c \
-+	../../source/components/utilities/uthex.c \
- 	../../source/components/utilities/utids.c \
- 	../../source/components/utilities/utinit.c \
- 	../../source/components/utilities/utlock.c \
-@@ -189,6 +191,7 @@
- 	../../source/components/utilities/utstate.c \
- 	../../source/components/utilities/utstring.c \
- 	../../source/components/utilities/uttrack.c \
-+	../../source/components/utilities/utuuid.c \
- 	../../source/components/utilities/utxface.c \
- 	../../source/components/utilities/utxferror.c \
- 	../../source/components/utilities/utxfinit.c \
diff --git a/meta/recipes-extended/acpica/acpitests_20140828.bb b/meta/recipes-extended/acpica/acpitests_20140828.bb
deleted file mode 100644
index 45ac157..0000000
--- a/meta/recipes-extended/acpica/acpitests_20140828.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Test suite used to validate ACPICA"
-HOMEPAGE = "http://www.acpica.org/"
-
-LICENSE = "Intel"
-LIC_FILES_CHKSUM = "file://tests/aapits/atexec.c;beginline=1;endline=115;md5=e92bcdfcd01d117d1bda3e814bb2030a"
-
-DEPENDS = "bison flex"
-
-SRC_URI = "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz;name=acpitests \
-           https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz;name=acpica \
-           file://aapits-linux.patch \
-           file://aapits-makefile.patch \
-"
-SRC_URI[acpitests.md5sum] = "db9d6fdaa8e3eb101d700ee5ba4938ed"
-SRC_URI[acpitests.sha256sum] = "e576c74bf1bf1c9f7348bf9419e05c8acfece7105abcdc052e66670c7af2cf00"
-SRC_URI[acpica.md5sum] = "6f05f0d10166a1b1ff6107f3d1cdf1e5"
-SRC_URI[acpica.sha256sum] = "01d8867656c5ba41dec307c4383ce676196ad4281ac2c9dec9f5be5fac6d888e"
-UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
-
-S = "${WORKDIR}/acpitests-unix-${PV}"
-
-EXTRA_OEMAKE = "'CC=${CC}' 'OPT_CFLAGS=-Wall'"
-
-# The Makefiles expect a specific layout
-do_compile() {
-    cp -af ${WORKDIR}/acpica-unix2-${PV}/source ${S}
-    cd tests/aapits
-    oe_runmake
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m0755 tests/aapits/bin/aapits ${D}${bindir}
-}
-
-COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
-- 
2.1.4


