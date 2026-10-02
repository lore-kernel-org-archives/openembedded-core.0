Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E07CA5FE4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:36:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6166.1790926591353106530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ErJgAKma;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A24C64E41109
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75817603DC
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 811AA1032813A;
	Fri,  2 Oct 2026 09:36:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790926588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JFFasORgBoWldtAFP1pXNHQj/SR1B53VifGLJ1iJEeg=;
	b=ErJgAKmaPBxccny0YcaC+1VrjGEsPhVHn7vDXVrFiYz5HH5HJTWX8ln/2qboBZt7nJoSbO
	4f67/cjw/fJYACuu//2swN1CY+MHuFh8nPyTYvVX/FkUyUZdxnN4v2JLd5jSLB/JQFVmTn
	+woCgOvjPjrLLhxdYrr1K51le6IpYJKeqN6q+sZ0JumT2Tx6DRlQkYyj0ksqg2cR8A31mp
	AiLzRPkRHXVfK/MrW7oQy+hMNnZuV0qccPWSXUkWciNj+Lo9jwgkwV75ySdpBujRU21HCD
	OOZ0JLvM0p1waLZXTuCI7+HUFYnpVWMz/hZkv4aQV1XxmptLyWZZu6GtVXflpw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 02 Oct 2026 09:36:09 +0200
Subject: [PATCH 6/9] acpica: upgrade 20260408 -> 20260930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-mathieu-2026-10-01-upgrades-v1-6-3fdeab391403@bootlin.com>
References: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
In-Reply-To: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790926581; l=18272;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=DbUrRbPWPT205VOUqShk0kuvT1Igx/IaaUJZIliFJCQ=;
 b=s7RQP2ppGV0I0LpIkgt7wwDsRW+FWH+85yLCsUr1cdZSOIESfpSoq+kmWpcbhYo7IYQVNzRva
 y2FxUJObnUtB/ZnipuMMVI1eORQCgqtY/RsHdey8mtrmGjGImSVvtkB
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247079

General changes:
- License change to BSD-3-Clause or GPL-2.0-only.
- Created a .gitignore and CONTRIBUTING.md
- EFI acpidump now builds for the RISCV64 architecture
- New Linux port_commit.sh script to convert ACPICA git history to Linux patches

New features:
- Tables : KEYP, MISC, UBRT (no subtable support yet)
- New method allowed : _Ixx (where xx is a hexadecimal number)

More notable fixes:
- Printf function family compiles again
- Fixed the acpidump EFI binaries not building (both EDK2 and gnu-efi)
- Fixed the Switch/While disassembler confusion
- Fixed the external method count over 255 not working
- Fixed incorrect PCC command offset

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-extended/acpica/acpica_20260408.bb |  47 ----
 meta/recipes-extended/acpica/acpica_20260930.bb | 345 ++++++++++++++++++++++++
 2 files changed, 345 insertions(+), 47 deletions(-)

diff --git a/meta/recipes-extended/acpica/acpica_20260408.bb b/meta/recipes-extended/acpica/acpica_20260408.bb
deleted file mode 100644
index 1e6326720f39..000000000000
--- a/meta/recipes-extended/acpica/acpica_20260408.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
-DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
-OS-independent reference implementation of the Advanced Configuration and \
-Power Interface Specification (ACPI). ACPICA code contains those portions of \
-ACPI meant to be directly integrated into the host OS as a kernel-resident \
-subsystem, and a small set of tools to assist in developing and debugging \
-ACPI tables."
-
-HOMEPAGE = "https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/overview.html"
-SECTION = "console/tools"
-
-LICENSE = "BSD-3-Clause OR GPL-2.0-only OR Intel"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=4877caee45a613e9706946c3205a6fb9"
-
-COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
-
-DEPENDS = "m4-native flex-native bison-native"
-
-SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master;tag=${PV}"
-SRCREV = "232ff3f8ae1a4da11c709f61d9154482cfe8e6df"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE:${PN} = "acpixtract acpidump"
-
-EXTRA_OEMAKE = "CC='${CC}' \
-                OPT_CFLAGS=-Wall \
-                DESTDIR=${D} \
-                PREFIX=${prefix} \
-                INSTALLDIR=${bindir} \
-                INSTALLFLAGS= \
-                YACC=bison \
-                YFLAGS='-y --file-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}' \
-                "
-
-do_install() {
-    oe_runmake install
-}
-
-# iasl*.bb is a subset of this recipe, so RREPLACE it
-PROVIDES = "iasl"
-RPROVIDES:${PN} += "iasl"
-RREPLACES:${PN} += "iasl"
-RCONFLICTS:${PN} += "iasl"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/acpica/acpica_20260930.bb b/meta/recipes-extended/acpica/acpica_20260930.bb
new file mode 100644
index 000000000000..7eac4c744418
--- /dev/null
+++ b/meta/recipes-extended/acpica/acpica_20260930.bb
@@ -0,0 +1,345 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- source/compiler/aslcompile.c
+# +++ source/compiler/aslcompile.c
+# @@ -1,144 +1,144 @@
+#  /******************************************************************************
+#   *
+# - * 1. Copyright Notice
+# - *
+# - * Some or all of this work - Copyright (c) 1999 - 2026, Intel Corp.
+# - * All rights reserved.
+# - *
+# - * 2. License
+# - *
+# - * 2.1. This is your license from Intel Corp. under its intellectual property
+# - * rights. You may have additional license terms from the party that provided
+# - * you this software, covering your right to use that party's intellectual
+# - * property rights.
+# - *
+# - * 2.2. Intel grants, free of charge, to any person ("Licensee") obtaining a
+# - * copy of the source code appearing in this file ("Covered Code") an
+# - * irrevocable, perpetual, worldwide license under Intel's copyrights in the
+# - * base code distributed originally by Intel ("Original Intel Code") to copy,
+# - * make derivatives, distribute, use and display any portion of the Covered
+# - * Code in any form, with the right to sublicense such rights; and
+# - *
+# - * 2.3. Intel grants Licensee a non-exclusive and non-transferable patent
+# - * license (with the right to sublicense), under only those claims of Intel
+# - * patents that are infringed by the Original Intel Code, to make, use, sell,
+# - * offer to sell, and import the Covered Code and derivative works thereof
+# - * solely to the minimum extent necessary to exercise the above copyright
+# - * license, and in no event shall the patent license extend to any additions
+# - * to or modifications of the Original Intel Code. No other license or right
+# - * is granted directly or by implication, estoppel or otherwise;
+# - *
+# - * The above copyright and patent license is granted only if the following
+# - * conditions are met:
+# - *
+# - * 3. Conditions
+# - *
+# - * 3.1. Redistribution of Source with Rights to Further Distribute Source.
+# - * Redistribution of source code of any substantial portion of the Covered
+# - * Code or modification with rights to further distribute source must include
+# - * the above Copyright Notice, the above License, this list of Conditions,
+# - * and the following Disclaimer and Export Compliance provision. In addition,
+# - * Licensee must cause all Covered Code to which Licensee contributes to
+# - * contain a file documenting the changes Licensee made to create that Covered
+# - * Code and the date of any change. Licensee must include in that file the
+# - * documentation of any changes made by any predecessor Licensee. Licensee
+# - * must include a prominent statement that the modification is derived,
+# - * directly or indirectly, from Original Intel Code.
+# - *
+# - * 3.2. Redistribution of Source with no Rights to Further Distribute Source.
+# - * Redistribution of source code of any substantial portion of the Covered
+# - * Code or modification without rights to further distribute source must
+# - * include the following Disclaimer and Export Compliance provision in the
+# - * documentation and/or other materials provided with distribution. In
+# - * addition, Licensee may not authorize further sublicense of source of any
+# - * portion of the Covered Code, and must include terms to the effect that the
+# - * license from Licensee to its licensee is limited to the intellectual
+# - * property embodied in the software Licensee provides to its licensee, and
+# - * not to intellectual property embodied in modifications its licensee may
+# - * make.
+# - *
+# - * 3.3. Redistribution of Executable. Redistribution in executable form of any
+# - * substantial portion of the Covered Code or modification must reproduce the
+# - * above Copyright Notice, and the following Disclaimer and Export Compliance
+# - * provision in the documentation and/or other materials provided with the
+# - * distribution.
+# - *
+# - * 3.4. Intel retains all right, title, and interest in and to the Original
+# - * Intel Code.
+# - *
+# - * 3.5. Neither the name Intel nor any other trademark owned or controlled by
+# - * Intel shall be used in advertising or otherwise to promote the sale, use or
+# - * other dealings in products derived from or relating to the Covered Code
+# - * without prior written authorization from Intel.
+# - *
+# - * 4. Disclaimer and Export Compliance
+# - *
+# - * 4.1. INTEL MAKES NO WARRANTY OF ANY KIND REGARDING ANY SOFTWARE PROVIDED
+# - * HERE. ANY SOFTWARE ORIGINATING FROM INTEL OR DERIVED FROM INTEL SOFTWARE
+# - * IS PROVIDED "AS IS," AND INTEL WILL NOT PROVIDE ANY SUPPORT, ASSISTANCE,
+# - * INSTALLATION, TRAINING OR OTHER SERVICES. INTEL WILL NOT PROVIDE ANY
+# - * UPDATES, ENHANCEMENTS OR EXTENSIONS. INTEL SPECIFICALLY DISCLAIMS ANY
+# - * IMPLIED WARRANTIES OF MERCHANTABILITY, NONINFRINGEMENT AND FITNESS FOR A
+# - * PARTICULAR PURPOSE.
+# - *
+# - * 4.2. IN NO EVENT SHALL INTEL HAVE ANY LIABILITY TO LICENSEE, ITS LICENSEES
+# - * OR ANY OTHER THIRD PARTY, FOR ANY LOST PROFITS, LOST DATA, LOSS OF USE OR
+# - * COSTS OF PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES, OR FOR ANY INDIRECT,
+# - * SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THIS AGREEMENT, UNDER ANY
+# - * CAUSE OF ACTION OR THEORY OF LIABILITY, AND IRRESPECTIVE OF WHETHER INTEL
+# - * HAS ADVANCE NOTICE OF THE POSSIBILITY OF SUCH DAMAGES. THESE LIMITATIONS
+# - * SHALL APPLY NOTWITHSTANDING THE FAILURE OF THE ESSENTIAL PURPOSE OF ANY
+# - * LIMITED REMEDY.
+# - *
+# - * 4.3. Licensee shall not export, either directly or indirectly, any of this
+# - * software or system incorporating such software without first obtaining any
+# - * required license or other approval from the U. S. Department of Commerce or
+# - * any other agency or department of the United States Government. In the
+# - * event Licensee exports any such software from the United States or
+# - * re-exports any such software from a foreign destination, Licensee shall
+# - * ensure that the distribution and export/re-export of the software is in
+# - * compliance with all laws, regulations, orders, or other restrictions of the
+# - * U.S. Export Administration Regulations. Licensee agrees that neither it nor
+# - * any of its subsidiaries will export/re-export any technical data, process,
+# - * software, or service, directly or indirectly, to any country for which the
+# - * United States government or any agency thereof requires an export license,
+# - * other governmental approval, or letter of assurance, without first obtaining
+# - * such license, approval or letter.
+# - *
+# - *****************************************************************************
+# - *
+# - * Alternatively, you may choose to be licensed under the terms of the
+# - * following license:
+# - *
+# - * Redistribution and use in source and binary forms, with or without
+# - * modification, are permitted provided that the following conditions
+# - * are met:
+# - * 1. Redistributions of source code must retain the above copyright
+# - *    notice, this list of conditions, and the following disclaimer,
+# - *    without modification.
+# - * 2. Redistributions in binary form must reproduce at minimum a disclaimer
+# - *    substantially similar to the "NO WARRANTY" disclaimer below
+# - *    ("Disclaimer") and any redistribution must be conditioned upon
+# - *    including a substantially similar Disclaimer requirement for further
+# - *    binary redistribution.
+# - * 3. Neither the names of the above-listed copyright holders nor the names
+# - *    of any contributors may be used to endorse or promote products derived
+# - *    from this software without specific prior written permission.
+# - *
+# - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# - * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+# - * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+# - * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+# - * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+# - * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+# - * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+# - * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+# - * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# - * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+# - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# - *
+# - * Alternatively, you may choose to be licensed under the terms of the
+# - * GNU General Public License ("GPL") version 2 as published by the Free
+# - * Software Foundation.
+# + * Copyright (c) 1999 - 2026, Intel Corp.
+# + * SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0-only
+#   *
+#   *****************************************************************************/
+# +
+# +#include "aslcompiler.h"
+# +#include "acnamesp.h"
+# +
+# +#include <stdio.h>
+# +#include <time.h>
+# +#include <acapps.h>
+# +
+# +#define _COMPONENT          ACPI_COMPILER
+# +        ACPI_MODULE_NAME    ("aslcompile")
+# +
+# +/*
+# + * Main parser entry
+# + * External is here in case the parser emits the same external in the
+# + * generated header. (Newer versions of Bison)
+# + */
+# +int
+# +AslCompilerparse(
+# +    void);
+# +
+# +/* Local prototypes */
+# +
+# +static void
+# +CmFlushSourceCode (
+# +    void);
+# +
+# +static void
+# +CmDumpAllEvents (
+# +    void);
+# +
+# +static void
+# +CmFinishFiles(
+# +    BOOLEAN                 DeleteAmlFile);
+# +
+# +
+# +/*******************************************************************************
+# + *
+# + * FUNCTION:    CmDoCompile
+# + *
+# + * PARAMETERS:  None
+# + *
+# + * RETURN:      Status (0 = OK)
+# + *
+# + * DESCRIPTION: This procedure performs the entire compile
+# + *
+# + ******************************************************************************/
+# +
+# +ACPI_STATUS
+# +CmDoCompile (
+# +    void)
+# +{
+# +    UINT8                   FullCompile;
+# +    UINT8                   Event;
+# +    ASL_GLOBAL_FILE_NODE    *FileNode;
+# +
+# +
+# +    FullCompile = UtBeginEvent ("*** Total Compile time ***");
+# +    Event = UtBeginEvent ("Open input and output files");
+# +    UtEndEvent (Event);
+# +
+# +    Event = UtBeginEvent ("Preprocess input file");
+# +    if (AslGbl_PreprocessFlag)
+# +    {
+# +        /* Enter compiler name as a #define */
+# +
+# +        PrAddDefine (ASL_DEFINE, "", FALSE);
+# +
+# +        /* Preprocessor */
+# +
+# +        PrDoPreprocess ();
+# +        AslGbl_CurrentLineNumber = 1;
+# +        AslGbl_LogicalLineNumber = 1;
+# +        AslGbl_CurrentLineOffset = 0;
+# +
+# +        if (AslGbl_PreprocessOnly)
+# +        {
+# +            UtEndEvent (Event);
+# +            return (AE_OK);
+# +        }
+# +    }
+# +    UtEndEvent (Event);
+# +
+# +
+# +    /* Build the parse tree */
+# +
+# +    Event = UtBeginEvent ("Parse source code and build parse tree");
+# +    AslCompilerparse();
+# +    UtEndEvent (Event);
+# +
+# +    /* Check for parser-detected syntax errors */
+# +
+# +    if (AslGbl_SyntaxError)
+# +    {
+# +        AslError (ASL_ERROR, ASL_MSG_SYNTAX, NULL,
+# +            "Compiler aborting due to parser-detected syntax error(s)\n");
+# +
+# +        /* Flag this error in the FileNode for compilation summary */
+# +
+# +        FileNode = FlGetCurrentFileNode ();
+# +        FileNode->ParserErrorDetected = TRUE;
+# +        AslGbl_ParserErrorDetected = TRUE;
+# +        LsDumpParseTree ();
+# +        AePrintErrorLog(ASL_FILE_STDERR);
+# +
+# +        goto ErrorExit;
+# +    }
+# +
+# +    /* Did the parse tree get successfully constructed? */
+# +
+# +    if (!AslGbl_ParseTreeRoot)
+# +    {
+# +        /*
+# +         * If there are no errors, then we have some sort of
+# +         * internal problem.
+# +         */
+# +        AslError (ASL_ERROR, ASL_MSG_COMPILER_INTERNAL,
+# +            NULL, "- Could not resolve parse tree root node");
+# +
+# +        goto ErrorExit;
+# +    }
+# +
+# +    AePrintErrorLog(ASL_FILE_STDERR);
+# +
+# +    /* Flush out any remaining source after parse tree is complete */
+# +
+# +    Event = UtBeginEvent ("Flush source input");
+# +    CmFlushSourceCode ();
+# +
+# +    /* Prune the parse tree if requested (debug purposes only) */
+# +
+# +    if (AslGbl_PruneParseTree)
+# +    {
+# +        AslPruneParseTree (AslGbl_PruneDepth, AslGbl_PruneType);
+# +    }
+# +
+# +    /* Optional parse tree dump, compiler debug output only */
+# +
+# +    LsDumpParseTree ();
+# 
+#
+
+SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
+DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
+OS-independent reference implementation of the Advanced Configuration and \
+Power Interface Specification (ACPI). ACPICA code contains those portions of \
+ACPI meant to be directly integrated into the host OS as a kernel-resident \
+subsystem, and a small set of tools to assist in developing and debugging \
+ACPI tables."
+
+HOMEPAGE = "https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/overview.html"
+SECTION = "console/tools"
+
+LICENSE = "BSD-3-Clause OR GPL-2.0-only OR Intel"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=f5cd06b6555eb8022bf99d49f902b071"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+DEPENDS = "m4-native flex-native bison-native"
+
+SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master;tag=${PV}"
+SRCREV = "e85aa3bebaae81ed1e6d163511ac7e1eafe732cf"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE:${PN} = "acpixtract acpidump"
+
+EXTRA_OEMAKE = "CC='${CC}' \
+                OPT_CFLAGS=-Wall \
+                DESTDIR=${D} \
+                PREFIX=${prefix} \
+                INSTALLDIR=${bindir} \
+                INSTALLFLAGS= \
+                YACC=bison \
+                YFLAGS='-y --file-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}' \
+                "
+
+do_install() {
+    oe_runmake install
+}
+
+# iasl*.bb is a subset of this recipe, so RREPLACE it
+PROVIDES = "iasl"
+RPROVIDES:${PN} += "iasl"
+RREPLACES:${PN} += "iasl"
+RCONFLICTS:${PN} += "iasl"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.47.3


