Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B621ECD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 14:28:50 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47087.1781188123959881866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 07:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Hc/kTyBg;
 spf=pass (domain: axis.com, ip: 52.101.83.5, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfJz6EWA1D04i8CLb0QYV7IOZBLWes0OhLTMN1H/pdxo8PGaRTdLknFwQP91gujWtSGzj9Z5HZtAkE62VqSJqI2hU0mDjoFbzo2YuaLcyUbw22OWMU3BzDXfauLKVpFpQxxF8pIbvrZvsJyiG19FQE9xrYg5SpueGBvN0EHhoaA8/UkR3knFJjxecqkn/BSDWjTjGfgaVuAk8Z+2zRQgzGpg9e+9UQt2iDu4NndKmqZyJo52ibhKoeuNZ6Vsy8jXq2U5GQJ2O1awRc1OggruYo27R0N9Ipj+p/mZTMJEilQ4La/sM6oszPimIDngn0Dql3j4GGkOhEokzapV5OW8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/N3RWpYgNX/3F4i5mOO/OUNhFuLxACeI8Vls5FBpP4=;
 b=sA1YVBG3W2AE5iGIOojyUnmcqatF1+NAtdMt6NQq9KgT6mMKuaQhNmE+pMjRs/IVbePwSV5Bhgt2ExLlaSx0PhX4kZuTEP0BipDT+EycXdeCje1FH5hl3+Qy8wJ/SODYSWRv3uMRTlqSWiWEdkHb19VJRVAE9CyOjnMsa6ZkLVWXHQ4W9hJla00ll/rXQ2rcsJ/KQpm6JLV4L0G8NL2yusvHs6EeqYv8o29+DgPy/2V3IAOhQCTeQJX1mzrI3fEUn60gDmGr6C8I/ebLFcfdslUXnNydsxkbLKs70NcZ6nksG3VtHocMDYuBO8bkDNwVjpGlFxKVU0aflyJd0j9w6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/N3RWpYgNX/3F4i5mOO/OUNhFuLxACeI8Vls5FBpP4=;
 b=Hc/kTyBgxVaQEe7D/Y2+PtEy4R4NYTPGOpZGe2jQFg9Zi5CojMOS6caIFCJEl2NKe4n1d/qyhEXZsielxsbuPM2ysTHEHE3nKUSTS4Ro53zqDXgwCap/7FKAUEDITGesUuPMS4DUy5QqXWmElw/YP/v4LzGV89e8Xq7ve/lbGMk=
Received: from CWLP265CA0433.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::19)
 by GV1PR02MB8731.eurprd02.prod.outlook.com (2603:10a6:150:90::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 14:28:33 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:400:1d7:cafe::3b) by CWLP265CA0433.outlook.office365.com
 (2603:10a6:400:1d7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Thu,
 11 Jun 2026 14:28:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 14:28:32 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 11 Jun
 2026 16:28:31 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 11 Jun 2026 16:28:31 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id B52141EC2
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:28:31 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id BA24712C7C5; Thu, 11 Jun 2026 16:28:31 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] common-licenses: Remove unused licenses
Date: Thu, 11 Jun 2026 16:28:02 +0200
Message-ID: <20260611142819.2085544-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611142819.2085544-1-pkj@axis.com>
References: <20260611142819.2085544-1-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DD:EE_|GV1PR02MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 19557a0e-e0b7-4b04-e57e-08dec7c5b70f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|6133799003|3023799007|11063799006|5023799004|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	EGw8Nh0/8nx/uSIu6fhqiFXR+MMdHCTEdw9PsR4piHgd1dbxCSrAGRBjQ4gyoLmp6quEvFvcu+bpSAd5Fxs+POZNnSsUBW30YBWU8XBsZQd67bMBD4kCDXecj4ddmFUGow4krrS1GejPPizM6k/AfthRKUi8oVXvJEnwbQrbt1H7wVk0qWL1OmvsnpChMPfH27MBI+PGV9BvoHQy8lIfiuyDVgNuunloECCIf6ihaeuv/pPxo2MCY4Eub8GoMKzDZ8qh2kJEusN9DpBaEexnr/Q6iJdw5oxujqSdLrB4FyailTP+NoaNDbDwx3dTxrgocABP7Iq2LXoSByRJS8TeRCSySb6/73WJGAyfS9m4SRBANvIC76LII2BOMy7/NjPIn8Kd+OQRcwLMQLuAZa8A5ekbKBQae08r7xEgUzkGYMKJUTC4rfCGQAmheKubIGZsU7PUihRW1QXl0JOaadVi3gUvJkEXtgDYpPVKRx6B7IY2UyYAWzIKwH9nw7KDm80ydELRPJ/WA0M++Z6DCj7vdpCDHj9Tu0DqPHhZ6Nk6t+TSD4+AMutOan3Vdo43xIoOMdhfPlwlkKYwqhsesrvha+svoOB2C7/B+/JGODDAHkiOj6owU8QbM3rmz0kRvNceT+vU83XPMpopfP3jQrQs96O0/utVVtXnDegyvKKXnzUqs+uuoRAi5NykfGf/CYb9
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(6133799003)(3023799007)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FpfIm9kRguEsr7JhOrz9t8CyHrqmAJKvBSeTWuYEyZovROPBafQQF6o7cHCFkP6fGGt76uVX78RKXr8UJz4uHWkAh5Ucm7J6E8cnqVYDOkJT8ROW/WC/D7IYXX0ogo+HUw3EstIQpyLAWUXtgp23VKfiNzY/GcQOjt0k1wM4/C4z6//Y4GY8ibKUd+rx2vlv/9OuAqBcqAc7JqNJXvT33Jk1htk+nvbNEMO8j6eUd1D7ZI+HhQnEAx6K9Bl64okEw2aqQgDHKBovGCR2J6fAbkqOPE/3i+dYvp/e650NfvQjI4CdR2IHixVG/jTID2mZ+AIBsn77sU6dptAUVV2IPGduBxKLbJvxq8VLwE+udlhi4Wf6XXHtMFxJ9lGwABYXvStnqNLcIAetFaFkshjFgzKsSRGTz6FMBpgP3+U7VcM9d0fKPnHiVXFSq/EQYmOv
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:28:32.6569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19557a0e-e0b7-4b04-e57e-08dec7c5b70f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8731
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 14:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238443

These are licenses that are not used by any recipe in OE Core or
meta-openembedded, and are not in the SPDX database.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/files/common-licenses/Adobe              |  14 -
 meta/files/common-licenses/BitstreamVera      | 160 -------
 meta/files/common-licenses/DSSSL              |  49 --
 .../GPL-2-with-bison-exception                |   7 -
 .../LGPL-3.0-with-zeromq-exception            | 181 --------
 meta/files/common-licenses/RHeCos-1           | 401 ----------------
 meta/files/common-licenses/Simple-2.0         |  27 --
 meta/files/common-licenses/SugarCRM-1         | 431 ------------------
 meta/files/common-licenses/UCB                |  26 --
 meta/files/common-licenses/XFree86-1.0        |  22 -
 meta/files/common-licenses/XSL                |  48 --
 meta/files/common-licenses/bzip2-1.0.4        |  43 --
 meta/files/common-licenses/gSOAP-1            | 380 ---------------
 meta/files/common-licenses/unfs3              |  24 -
 14 files changed, 1813 deletions(-)
 delete mode 100644 meta/files/common-licenses/Adobe
 delete mode 100644 meta/files/common-licenses/BitstreamVera
 delete mode 100644 meta/files/common-licenses/DSSSL
 delete mode 100644 meta/files/common-licenses/GPL-2-with-bison-exception
 delete mode 100644 meta/files/common-licenses/LGPL-3.0-with-zeromq-excepti=
on
 delete mode 100644 meta/files/common-licenses/RHeCos-1
 delete mode 100644 meta/files/common-licenses/Simple-2.0
 delete mode 100644 meta/files/common-licenses/SugarCRM-1
 delete mode 100644 meta/files/common-licenses/UCB
 delete mode 100644 meta/files/common-licenses/XFree86-1.0
 delete mode 100644 meta/files/common-licenses/XSL
 delete mode 100644 meta/files/common-licenses/bzip2-1.0.4
 delete mode 100644 meta/files/common-licenses/gSOAP-1
 delete mode 100644 meta/files/common-licenses/unfs3

diff --git a/meta/files/common-licenses/Adobe b/meta/files/common-licenses/=
Adobe
deleted file mode 100644
index 64779da1df..0000000000
--- a/meta/files/common-licenses/Adobe
+++ /dev/null
@@ -1,14 +0,0 @@
-Copyright 1990-1998 Adobe Systems Incorporated.
-All Rights Reserved.
- =20
-Patents Pending
-
-NOTICE: All information contained herein is the property of Adobe
-Systems Incorporated.
-
-Permission is granted for redistribution of this file provided
-this copyright notice is maintained intact and that the contents
-of this file are not altered in any way from its original form.
-
-PostScript and Display PostScript are trademarks of Adobe Systems
-Incorporated which may be registered in certain jurisdictions.
diff --git a/meta/files/common-licenses/BitstreamVera b/meta/files/common-l=
icenses/BitstreamVera
deleted file mode 100644
index e6f03aa57a..0000000000
--- a/meta/files/common-licenses/BitstreamVera
+++ /dev/null
@@ -1,160 +0,0 @@
-Bitstream Vera Fonts Copyright
-
-The fonts have a generous copyright, allowing derivative works (as
-long as "Bitstream" or "Vera" are not in the names), and full
-redistribution (so long as they are not *sold* by themselves). They
-can be be bundled, redistributed and sold with any software.
-
-The fonts are distributed under the following copyright:
-
-Copyright
-=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Copyright (c) 2003 by Bitstream, Inc. All Rights Reserved. Bitstream
-Vera is a trademark of Bitstream, Inc.
-
-Permission is hereby granted, free of charge, to any person obtaining
-a copy of the fonts accompanying this license ("Fonts") and associated
-documentation files (the "Font Software"), to reproduce and distribute
-the Font Software, including without limitation the rights to use,
-copy, merge, publish, distribute, and/or sell copies of the Font
-Software, and to permit persons to whom the Font Software is furnished
-to do so, subject to the following conditions:
-
-The above copyright and trademark notices and this permission notice
-shall be included in all copies of one or more of the Font Software
-typefaces.
-
-The Font Software may be modified, altered, or added to, and in
-particular the designs of glyphs or characters in the Fonts may be
-modified and additional glyphs or characters may be added to the
-Fonts, only if the fonts are renamed to names not containing either
-the words "Bitstream" or the word "Vera".
-
-This License becomes null and void to the extent applicable to Fonts
-or Font Software that has been modified and is distributed under the
-"Bitstream Vera" names.
-
-The Font Software may be sold as part of a larger software package but
-no copy of one or more of the Font Software typefaces may be sold by
-itself.
-
-THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
-OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL
-BITSTREAM OR THE GNOME FOUNDATION BE LIABLE FOR ANY CLAIM, DAMAGES OR
-OTHER LIABILITY, INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL,
-OR CONSEQUENTIAL DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR
-OTHERWISE, ARISING FROM, OUT OF THE USE OR INABILITY TO USE THE FONT
-SOFTWARE OR FROM OTHER DEALINGS IN THE FONT SOFTWARE.
-
-Except as contained in this notice, the names of Gnome, the Gnome
-Foundation, and Bitstream Inc., shall not be used in advertising or
-otherwise to promote the sale, use or other dealings in this Font
-Software without prior written authorization from the Gnome Foundation
-or Bitstream Inc., respectively. For further information, contact:
-fonts at gnome dot org.
-
-Copyright FAQ
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-1. I don't understand the resale restriction... What gives?
-
-Bitstream is giving away these fonts, but wishes to ensure its
-competitors can't just drop the fonts as is into a font sale system
-and sell them as is. It seems fair that if Bitstream can't make money
-from the Bitstream Vera fonts, their competitors should not be able to
-do so either. You can sell the fonts as part of any software package,
-however.
-
-2. I want to package these fonts separately for distribution and
-sale as part of a larger software package or system. Can I do so?
-
-Yes. A RPM or Debian package is a "larger software package" to begin
-with, and you aren't selling them independently by themselves.
-See 1. above.
-
-3. Are derivative works allowed?
-Yes!
-
-4. Can I change or add to the font(s)?
-Yes, but you must change the name(s) of the font(s).
-
-5. Under what terms are derivative works allowed?
-
-You must change the name(s) of the fonts. This is to ensure the
-quality of the fonts, both to protect Bitstream and Gnome. We want to
-ensure that if an application has opened a font specifically of these
-names, it gets what it expects (though of course, using fontconfig,
-substitutions could still could have occurred during font
-opening). You must include the Bitstream copyright. Additional
-copyrights can be added, as per copyright law. Happy Font Hacking!
-
-6. If I have improvements for Bitstream Vera, is it possible they might ge=
t
-adopted in future versions?
-
-Yes. The contract between the Gnome Foundation and Bitstream has
-provisions for working with Bitstream to ensure quality additions to
-the Bitstream Vera font family. Please contact us if you have such
-additions. Note, that in general, we will want such additions for the
-entire family, not just a single font, and that you'll have to keep
-both Gnome and Jim Lyles, Vera's designer, happy! To make sense to add
-glyphs to the font, they must be stylistically in keeping with Vera's
-design. Vera cannot become a "ransom note" font. Jim Lyles will be
-providing a document describing the design elements used in Vera, as a
-guide and aid for people interested in contributing to Vera.
-
-7. I want to sell a software package that uses these fonts: Can I do so?
-
-Sure. Bundle the fonts with your software and sell your software
-with the fonts. That is the intent of the copyright.
-
-8. If applications have built the names "Bitstream Vera" into them,
-can I override this somehow to use fonts of my choosing?
-
-This depends on exact details of the software. Most open source
-systems and software (e.g., Gnome, KDE, etc.) are now converting to
-use fontconfig (see www.fontconfig.org) to handle font configuration,
-selection and substitution; it has provisions for overriding font
-names and subsituting alternatives. An example is provided by the
-supplied local.conf file, which chooses the family Bitstream Vera for
-"sans", "serif" and "monospace". Other software (e.g., the XFree86
-core server) has other mechanisms for font substitution.
-
-Show details Hide details
-
-Change log
-r2011 by mark.nickel on Mar 3, 2011   Diff
-
-Majority of Multi-Line text editing is in
-the commit.  Also added some specific free
-fonts to replace the existing set as we
-need some additional font metrics that we
-use in the Text Editing rendering
-pipeline.
-
-You can see the font licenses in the
-editor/fonts folder under each font.
-
-Still have some cleanup to do to add the
-text formatting (left,right,center) as
-...
-
-Go to: =09
-Hide comments
-Show comments
-
-Older revisions
-All revisions of this file
-
-File info
-Size: 5953 bytes, 123 lines
-View raw file
-
-File properties
-
-svn:executable
-    *
-
-
diff --git a/meta/files/common-licenses/DSSSL b/meta/files/common-licenses/=
DSSSL
deleted file mode 100644
index 7159dfbd66..0000000000
--- a/meta/files/common-licenses/DSSSL
+++ /dev/null
@@ -1,49 +0,0 @@
-Copyright
----------
-
-Copyright (C) 1997-2001 Norman Walsh
-
-The original inspiration for these stylesheets came from the
-work of Jon Bosak, Anders Berglund, Tony Graham, Terry Allen,
-James Clark, and many others.  I am indebted to them and to the
-community of users on dssslist@mulberrytech.com for making
-substantial contributions to this work and for answering my many
-questions.
-
-This software may be distributed under the same terms as Jade:
-
-Permission is hereby granted, free of charge, to any person
-obtaining a copy of this software and associated documentation
-files (the ``Software''), to deal in the Software without
-restriction, including without limitation the rights to use,
-copy, modify, merge, publish, distribute, sublicense, and/or
-sell copies of the Software, and to permit persons to whom the
-Software is furnished to do so, subject to the following
-conditions:
-
-The above copyright notice and this permission notice shall be
-included in all copies or substantial portions of the Software.
-
-Except as contained in this notice, the names of individuals
-credited with contribution to this software shall not be used in
-advertising or otherwise to promote the sale, use or other
-dealings in this Software without prior written authorization
-from the individuals in question.
-
-Any stylesheet derived from this Software that is publically
-distributed will be identified with a different name and the
-version strings in any derived Software will be changed so that
-no possibility of confusion between the derived package and this
-Software will exist.
-
-Warranty
---------
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
-OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-NONINFRINGEMENT.  IN NO EVENT SHALL NORMAN WALSH OR ANY OTHER
-CONTRIBUTOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
-WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-OTHER DEALINGS IN THE SOFTWARE.
diff --git a/meta/files/common-licenses/GPL-2-with-bison-exception b/meta/f=
iles/common-licenses/GPL-2-with-bison-exception
deleted file mode 100644
index dd3427397c..0000000000
--- a/meta/files/common-licenses/GPL-2-with-bison-exception
+++ /dev/null
@@ -1,7 +0,0 @@
-
-insert GPL v2 text here
-
-Bison Exception
-As a special exception, you may create a larger work that contains part or=
 all of the Bison parser skeleton and distribute that work under terms of y=
our choice, so long as that work isn`t itself a parser generator using the =
skeleton or a modified version thereof as a parser skeleton. Alternatively,=
 if you modify or redistribute the parser skeleton itself, you may (at your=
 option) remove this special exception, which will cause the skeleton and t=
he resulting Bison output files to be licensed under the GNU General Public=
 License without this special exception.
-This special exception was added by the Free Software Foundation in versio=
n 2.2 of Bison.
-
diff --git a/meta/files/common-licenses/LGPL-3.0-with-zeromq-exception b/me=
ta/files/common-licenses/LGPL-3.0-with-zeromq-exception
deleted file mode 100644
index 02e943c4ac..0000000000
--- a/meta/files/common-licenses/LGPL-3.0-with-zeromq-exception
+++ /dev/null
@@ -1,181 +0,0 @@
-		         GNU LESSER GENERAL PUBLIC LICENSE
-                       Version 3, 29 June 2007
-
- Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
- Everyone is permitted to copy and distribute verbatim copies
- of this license document, but changing it is not allowed.
-
-
-  This version of the GNU Lesser General Public License incorporates
-the terms and conditions of version 3 of the GNU General Public
-License, supplemented by the additional permissions listed below.
-
-  0. Additional Definitions.=20
-
-  As used herein, "this License" refers to version 3 of the GNU Lesser
-General Public License, and the "GNU GPL" refers to version 3 of the GNU
-General Public License.
-
-  "The Library" refers to a covered work governed by this License,
-other than an Application or a Combined Work as defined below.
-
-  An "Application" is any work that makes use of an interface provided
-by the Library, but which is not otherwise based on the Library.
-Defining a subclass of a class defined by the Library is deemed a mode
-of using an interface provided by the Library.
-
-  A "Combined Work" is a work produced by combining or linking an
-Application with the Library.  The particular version of the Library
-with which the Combined Work was made is also called the "Linked
-Version".
-
-  The "Minimal Corresponding Source" for a Combined Work means the
-Corresponding Source for the Combined Work, excluding any source code
-for portions of the Combined Work that, considered in isolation, are
-based on the Application, and not on the Linked Version.
-
-  The "Corresponding Application Code" for a Combined Work means the
-object code and/or source code for the Application, including any data
-and utility programs needed for reproducing the Combined Work from the
-Application, but excluding the System Libraries of the Combined Work.
-
-  1. Exception to Section 3 of the GNU GPL.
-
-  You may convey a covered work under sections 3 and 4 of this License
-without being bound by section 3 of the GNU GPL.
-
-  2. Conveying Modified Versions.
-
-  If you modify a copy of the Library, and, in your modifications, a
-facility refers to a function or data to be supplied by an Application
-that uses the facility (other than as an argument passed when the
-facility is invoked), then you may convey a copy of the modified
-version:
-
-   a) under this License, provided that you make a good faith effort to
-   ensure that, in the event an Application does not supply the
-   function or data, the facility still operates, and performs
-   whatever part of its purpose remains meaningful, or
-
-   b) under the GNU GPL, with none of the additional permissions of
-   this License applicable to that copy.
-
-  3. Object Code Incorporating Material from Library Header Files.
-
-  The object code form of an Application may incorporate material from
-a header file that is part of the Library.  You may convey such object
-code under terms of your choice, provided that, if the incorporated
-material is not limited to numerical parameters, data structure
-layouts and accessors, or small macros, inline functions and templates
-(ten or fewer lines in length), you do both of the following:
-
-   a) Give prominent notice with each copy of the object code that the
-   Library is used in it and that the Library and its use are
-   covered by this License.
-
-   b) Accompany the object code with a copy of the GNU GPL and this licens=
e
-   document.
-
-  4. Combined Works.
-
-  You may convey a Combined Work under terms of your choice that,
-taken together, effectively do not restrict modification of the
-portions of the Library contained in the Combined Work and reverse
-engineering for debugging such modifications, if you also do each of
-the following:
-
-   a) Give prominent notice with each copy of the Combined Work that
-   the Library is used in it and that the Library and its use are
-   covered by this License.
-
-   b) Accompany the Combined Work with a copy of the GNU GPL and this lice=
nse
-   document.
-
-   c) For a Combined Work that displays copyright notices during
-   execution, include the copyright notice for the Library among
-   these notices, as well as a reference directing the user to the
-   copies of the GNU GPL and this license document.
-
-   d) Do one of the following:
-
-       0) Convey the Minimal Corresponding Source under the terms of this
-       License, and the Corresponding Application Code in a form
-       suitable for, and under terms that permit, the user to
-       recombine or relink the Application with a modified version of
-       the Linked Version to produce a modified Combined Work, in the
-       manner specified by section 6 of the GNU GPL for conveying
-       Corresponding Source.
-
-       1) Use a suitable shared library mechanism for linking with the
-       Library.  A suitable mechanism is one that (a) uses at run time
-       a copy of the Library already present on the user's computer
-       system, and (b) will operate properly with a modified version
-       of the Library that is interface-compatible with the Linked
-       Version.=20
-
-   e) Provide Installation Information, but only if you would otherwise
-   be required to provide such information under section 6 of the
-   GNU GPL, and only to the extent that such information is
-   necessary to install and execute a modified version of the
-   Combined Work produced by recombining or relinking the
-   Application with a modified version of the Linked Version. (If
-   you use option 4d0, the Installation Information must accompany
-   the Minimal Corresponding Source and Corresponding Application
-   Code. If you use option 4d1, you must provide the Installation
-   Information in the manner specified by section 6 of the GNU GPL
-   for conveying Corresponding Source.)
-
-  5. Combined Libraries.
-
-  You may place library facilities that are a work based on the
-Library side by side in a single library together with other library
-facilities that are not Applications and are not covered by this
-License, and convey such a combined library under terms of your
-choice, if you do both of the following:
-
-   a) Accompany the combined library with a copy of the same work based
-   on the Library, uncombined with any other library facilities,
-   conveyed under the terms of this License.
-
-   b) Give prominent notice with the combined library that part of it
-   is a work based on the Library, and explaining where to find the
-   accompanying uncombined form of the same work.
-
-  6. Revised Versions of the GNU Lesser General Public License.
-
-  The Free Software Foundation may publish revised and/or new versions
-of the GNU Lesser General Public License from time to time. Such new
-versions will be similar in spirit to the present version, but may
-differ in detail to address new problems or concerns.
-
-  Each version is given a distinguishing version number. If the
-Library as you received it specifies that a certain numbered version
-of the GNU Lesser General Public License "or any later version"
-applies to it, you have the option of following the terms and
-conditions either of that published version or of any later version
-published by the Free Software Foundation. If the Library as you
-received it does not specify a version number of the GNU Lesser
-General Public License, you may choose any version of the GNU Lesser
-General Public License ever published by the Free Software Foundation.
-
-  If the Library as you received it specifies that a proxy can decide
-whether future versions of the GNU Lesser General Public License shall
-apply, that proxy's public statement of acceptance of any version is
-permanent authorization for you to choose that version for the
-Library.
-
---------------------------------------------------------------------------=
------
-
-           SPECIAL EXCEPTION GRANTED BY COPYRIGHT HOLDERS
-
-As a special exception, copyright holders give you permission to link this
-library with independent modules to produce an executable, regardless of
-the license terms of these independent modules, and to copy and distribute
-the resulting executable under terms of your choice, provided that you als=
o
-meet, for each linked independent module, the terms and conditions of
-the license of that module. An independent module is a module which is not
-derived from or based on this library. If you modify this library, you mus=
t
-extend this exception to your version of the library.
-
-Note: this exception relieves you of any obligations under sections 4 and =
5
-of this license, and section 6 of the GNU General Public License.
diff --git a/meta/files/common-licenses/RHeCos-1 b/meta/files/common-licens=
es/RHeCos-1
deleted file mode 100644
index 2ab40b77d3..0000000000
--- a/meta/files/common-licenses/RHeCos-1
+++ /dev/null
@@ -1,401 +0,0 @@
-
-Red Hat eCos Public License v1.1
-
-1. DEFINITIONS
-
-1.1. "Contributor" means each entity that creates or contributes to
-the creation of Modifications.
-
-1.2. "Contributor Version" means the combination of the Original
-Code, prior Modifications used by a Contributor, and the Modifications mad=
e by
-that particular Contributor.
-
-1.3. "Covered Code" means the Original Code or Modifications or the
-combination of the Original Code and Modifications, in each case including
-portions thereof.
-
-1.4. "Electronic Distribution Mechanism" means a mechanism generally
-accepted in the software development community for the electronic transfer=
 of
-data.
-
-1.5. "Executable" means Covered Code in any form other than Source
-Code.
-
-1.6. "Initial Developer" means the individual or entity identified as
-the Initial Developer in the Source Code notice required by Exhibit A.
-
-1.7. "Larger Work" means a work which combines Covered Code or
-portions thereof with code not governed by the terms of this License.
-
-1.8. "License" means this document.
-
-1.9. "Modifications" means any addition to or deletion from the
-substance or structure of either the Original Code or any previous
-Modifications. When Covered Code is released as a series of files, a
-Modification is:
-
-A. Any addition to or deletion from the contents of a file containing Orig=
inal
-Code or previous Modifications.
-
-B. Any new file that contains any part of the Original Code or previous
-Modifications.
-
-1.10. "Original Code" means Source Code of computer software code
-which is described in the Source Code notice required by Exhibit A as Orig=
inal
-Code, and which, at the time of its release under this License is not alre=
ady
-Covered Code governed by this License.
-
-1.11. "Source Code" means the preferred form of the Covered Code for
-making modifications to it, including all modules it contains, plus any
-associated interface definition files, scripts used to control compilation=
 and
-installation of an Executable, or a list of source code differential
-comparisons against either the Original Code or another well known, availa=
ble
-Covered Code of the Contributor's choice. The Source Code can be in a
-compressed or archival form, provided the appropriate decompression or de-
-archiving software is widely available for no charge.
-
-1.12. "You" means an individual or a legal entity exercising rights
-under, and complying with all of the terms of, this License or a future ve=
rsion
-of this License issued under Section 6.1. For legal entities, "You"
-includes any entity which controls, is controlled by, or is under common
-control with You. For purposes of this definition, "control" means
-(a) the power, direct or indirect, to cause the direction or management of=
 such
-entity, whether by contract or otherwise, or (b) ownership of fifty percen=
t
-(50%) or more of the outstanding shares or beneficial ownership of such en=
tity.
-
-1.13. "Red Hat Branded Code" is code that Red Hat distributes and/or
-permits others to distribute under different terms than the Red Hat eCos P=
ublic
-License. Red Hat's Branded Code may contain part or all of the Covered Cod=
e.
-
-2. SOURCE CODE LICENSE
-
-2.1. The Initial Developer Grant.
-The Initial Developer hereby grants You a world-wide, royalty-free, non-
-exclusive license, subject to third party intellectual property claims:
-
-(a) to use, reproduce, modify, display, perform, sublicense and distribute=
 the
-Original Code (or portions thereof) with or without Modifications, or as p=
art
-of a Larger Work; and
-
-(b) under patents now or hereafter owned or controlled by Initial Develope=
r, to
-make, have made, use and sell ("Utilize") the Original Code (or
-portions thereof), but solely to the extent that any such patent is reason=
ably
-necessary to enable You to Utilize the Original Code (or portions thereof)=
 and
-not to any greater extent that may be necessary to Utilize further
-Modifications or combinations.
-
-2.2. Contributor Grant.
-Each Contributor hereby grants You a world-wide, royalty-free, non-exclusi=
ve
-license, subject to third party intellectual property claims:
-
-(a) to use, reproduce, modify, display, perform, sublicense and distribute=
 the
-Modifications created by such Contributor (or portions thereof) either on =
an
-unmodified basis, with other Modifications, as Covered Code or as part of =
a
-Larger Work; and
-
-(b) under patents now or hereafter owned or controlled by Contributor, to
-Utilize the Contributor Version (or portions thereof), but solely to the e=
xtent
-that any such patent is reasonably necessary to enable You to Utilize the
-Contributor Version (or portions thereof), and not to any greater extent t=
hat
-may be necessary to Utilize further Modifications or combinations.
-
-3. DISTRIBUTION OBLIGATIONS
-
-3.1. Application of License.
-The Modifications which You create or to which You contribute are governed=
 by
-the terms of this License, including without limitation Section 2.2. The S=
ource
-Code version of Covered Code may be distributed only under the terms of th=
is
-License or a future version of this License released under Section 6.1, an=
d You
-must include a copy of this License with every copy of the Source Code You
-distribute. You may not offer or impose any terms on any Source Code versi=
on
-that alters or restricts the applicable version of this License or the
-recipients' rights hereunder. However, You may include an additional docum=
ent
-offering the additional rights described in Section 3.5.
-
-3.2. Availability of Source Code.
-Any Modification which You create or to which You contribute must be made
-available in Source Code form under the terms of this License via an accep=
ted
-Electronic Distribution Mechanism to anyone to whom you made an Executable
-version available and to the Initial Developer; and if made available via
-Electronic Distribution Mechanism, must remain available for at least twel=
ve
-(12) months after the date it initially became available, or at least six =
(6)
-months after a subsequent version of that particular Modification has been=
 made
-available to such recipients. You are responsible for ensuring that the So=
urce
-Code version remains available even if the Electronic Distribution Mechani=
sm is
-maintained by a third party. You are responsible for notifying the Initial
-Developer of the Modification and the location of the Source if a contact =
means
-is provided. Red Hat will be acting as maintainer of the Source and may pr=
ovide
-an Electronic Distribution mechanism for the Modification to be made avail=
able.
-You can contact Red Hat to make the Modification available and to notify t=
he
-Initial Developer. (http://sourceware.cygnus.com/ecos/)
-
-3.3. Description of Modifications.
-You must cause all Covered Code to which you contribute to contain a file
-documenting the changes You made to create that Covered Code and the date =
of
-any change. You must include a prominent statement that the Modification i=
s
-derived, directly or indirectly, from Original Code provided by the Initia=
l
-Developer and including the name of the Initial Developer in (a) the Sourc=
e
-Code, and (b) in any notice in an Executable version or related documentat=
ion
-in which You describe the origin or ownership of the Covered Code.
-
-3.4. Intellectual Property Matters
-(a) Third Party Claims.
-If You have knowledge that a party claims an intellectual property right i=
n
-particular functionality or code (or its utilization under this License), =
you
-must include a text file with the source code distribution titled
-"LEGAL" which describes the claim and the party making the claim in
-sufficient detail that a recipient will know whom to contact. If you obtai=
n
-such knowledge after You make Your Modification available as described in
-Section 3.2, You shall promptly modify the LEGAL file in all copies You ma=
ke
-available thereafter and shall take other steps (such as notifying appropr=
iate
-mailing lists or newsgroups) reasonably calculated to inform those who rec=
eived
-the Covered Code that new knowledge has been obtained.
-
-(b) Contributor APIs.
-If Your Modification is an application programming interface and You own o=
r
-control patents which are reasonably necessary to implement that API, you =
must
-also include this information in the LEGAL file.
-
-3.5. Required Notices.
-You must duplicate the notice in Exhibit A in each file of the Source Code=
, and
-this License in any documentation for the Source Code, where You describe
-recipients' rights relating to Covered Code. If You created one or more
-Modification(s), You may add your name as a Contributor to the Source Code=
. If
-it is not possible to put such notice in a particular Source Code file due=
 to
-its structure, then you must include such notice in a location (such as a
-relevant directory file) where a user would be likely to look for such a
-notice. You may choose to offer, and to charge a fee for, warranty, suppor=
t,
-indemnity or liability obligations to one or more recipients of Covered Co=
de.
-
-However, You may do so only on Your own behalf, and not on behalf of the
-Initial Developer or any Contributor. You must make it absolutely clear th=
at
-any such warranty, support, indemnity or liability obligation is offered b=
y You
-alone, and You hereby agree to indemnify the Initial Developer and every
-Contributor for any liability incurred by the Initial Developer or such
-Contributor as a result of warranty, support, indemnity or liability terms=
 You
-offer.
-
-3.6. Distribution of Executable Versions.
-You may distribute Covered Code in Executable form only if the requirement=
s of
-Section 3.1-3.5 have been met for that Covered Code, and if You include a
-notice stating that the Source Code version of the Covered Code is availab=
le
-under the terms of this License, including a description of how and where =
You
-have fulfilled the obligations of Section 3.2. The notice must be conspicu=
ously
-included in any notice in an Executable version, related documentation or
-collateral in which You describe recipients' rights relating to the Covere=
d
-Code. You may distribute the Executable version of Covered Code under a li=
cense
-of Your choice, which may contain terms different from this License, provi=
ded
-that You are in compliance with the terms of this License and that the lic=
ense
-for the Executable version does not attempt to limit or alter the recipien=
t's
-rights in the Source Code version from the rights set forth in this Licens=
e. If
-You distribute the Executable version under a different license You must m=
ake
-it absolutely clear that any terms which differ from this License are offe=
red
-by You alone, not by the Initial Developer or any Contributor. You hereby =
agree
-to indemnify the Initial Developer and every Contributor for any liability
-incurred by the Initial Developer or such Contributor as a result of any s=
uch
-terms You offer.
-
-If you distribute executable versions containing Covered Code, you must
-reproduce the notice in Exhibit B in the documentation and/or other materi=
als
-provided with the product.
-
-3.7. Larger Works.
-You may create a Larger Work by combining Covered Code with other code not
-governed by the terms of this License and distribute the Larger Work as a
-single product. In such a case, You must make sure the requirements of thi=
s
-License are fulfilled for the Covered Code.
-
-4. INABILITY TO COMPLY DUE TO STATUTE OR REGULATION
-
-If it is impossible for You to comply with any of the terms of this Licens=
e
-with respect to some or all of the Covered Code due to statute or regulati=
on
-then You must: (a) comply with the terms of this License to the maximum ex=
tent
-possible; (b) cite the statute or regulation that prohibits you from adher=
ing
-to the license; and (c) describe the limitations and the code they affect.=
 Such
-description must be included in the LEGAL file described in Section 3.4 an=
d
-must be included with all distributions of the Source Code. Except to the
-extent prohibited by statute or regulation, such description must be
-sufficiently detailed for a recipient of ordinary skill to be able to
-understand it. You must submit this LEGAL file to Red Hat for review, and =
You
-will not be able use the covered code in any means until permission is gra=
nted
-from Red Hat to allow for the inability to comply due to statute or regula=
tion.
-
-5. APPLICATION OF THIS LICENSE
-
-This License applies to code to which the Initial Developer has attached t=
he
-notice in Exhibit A, and to related Covered Code.
-
-Red Hat may include Covered Code in products without such additional produ=
cts
-becoming subject to the terms of this License, and may license such additi=
onal
-products on different terms from those contained in this License.
-
-Red Hat may license the Source Code of Red Hat Branded Code without Red Ha=
t
-Branded Code becoming subject to the terms of this License, and may licens=
e Red
-Hat Branded Code on different terms from those contained in this License.
-Contact Red Hat for details of alternate licensing terms available.
-
-6. VERSIONS OF THE LICENSE
-
-6.1. New Versions.
-Red Hat may publish revised and/or new versions of the License from time t=
o
-time. Each version will be given a distinguishing version number.
-
-6.2. Effect of New Versions.
-Once Covered Code has been published under a particular version of the Lic=
ense,
-You may always continue to use it under the terms of that version. You may=
 also
-choose to use such Covered Code under the terms of any subsequent version =
of
-the License published by Red Hat. No one other than Red Hat has the right =
to
-modify the terms applicable to Covered Code beyond what is granted under t=
his
-and subsequent Licenses.
-
-6.3. Derivative Works.
-If you create or use a modified version of this License (which you may onl=
y do
-in order to apply it to code which is not already Covered Code governed by=
 this
-License), you must (a) rename Your license so that the phrases
-"ECOS", "eCos", "Red Hat", "RHEPL" or
-any confusingly similar phrase do not appear anywhere in your license and =
(b)
-otherwise make it clear that your version of the license contains terms wh=
ich
-differ from the Red Hat eCos Public License. (Filling in the name of the
-Initial Developer, Original Code or Contributor in the notice described in
-Exhibit A shall not of themselves be deemed to be modifications of this
-License.)
-
-7. DISCLAIMER OF WARRANTY
-
-COVERED CODE IS PROVIDED UNDER THIS LICENSE ON AN "AS IS" BASIS,
-WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, WITH=
OUT
-LIMITATION, WARRANTIES THAT THE COVERED CODE IS FREE OF DEFECTS, MERCHANTA=
BLE,
-FIT FOR A PARTICULAR PURPOSE OR NON-INFRINGING. THE ENTIRE RISK AS TO THE
-QUALITY AND PERFORMANCE OF THE COVERED CODE IS WITH YOU. SHOULD ANY COVERE=
D
-CODE PROVE DEFECTIVE IN ANY RESPECT, YOU (NOT THE INITIAL DEVELOPER OR ANY
-OTHER CONTRIBUTOR) ASSUME THE COST OF ANY NECESSARY SERVICING, REPAIR OR
-CORRECTION. THIS DISCLAIMER OF WARRANTY CONSTITUTES AN ESSENTIAL PART OF T=
HIS
-LICENSE. NO USE OF ANY COVERED CODE IS AUTHORIZED HEREUNDER EXCEPT UNDER T=
HIS
-DISCLAIMER.
-
-8. TERMINATION
-
-This License and the rights granted hereunder will terminate automatically=
 if
-You fail to comply with terms herein and fail to cure such breach within 3=
0
-days of becoming aware of the breach. All sublicenses to the Covered Code =
which
-are properly granted shall survive any termination of this License. Provis=
ions
-which, by their nature, must remain in effect beyond the termination of th=
is
-License shall survive.
-
-9. LIMITATION OF LIABILITY
-
-UNDER NO CIRCUMSTANCES AND UNDER NO LEGAL THEORY, WHETHER TORT (INCLUDING
-NEGLIGENCE), CONTRACT, OR OTHERWISE, SHALL THE INITIAL DEVELOPER, ANY OTHE=
R
-CONTRIBUTOR, OR ANY DISTRIBUTOR OF COVERED CODE, OR ANY SUPPLIER OF ANY OF=
 SUCH
-PARTIES, BE LIABLE TO YOU OR ANY OTHER PERSON FOR ANY INDIRECT, SPECIAL,
-INCIDENTAL, OR CONSEQUENTIAL DAMAGES OF ANY CHARACTER INCLUDING, WITHOUT
-LIMITATION, DAMAGES FOR LOSS OF GOODWILL, WORK STOPPAGE, COMPUTER FAILURE =
OR
-MALFUNCTION, OR ANY AND ALL OTHER COMMERCIAL DAMAGES OR LOSSES, EVEN IF SU=
CH
-PARTY SHALL HAVE BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES. THIS
-LIMITATION OF LIABILITY SHALL NOT APPLY TO LIABILITY FOR DEATH OR PERSONAL
-INJURY RESULTING FROM SUCH PARTY'S NEGLIGENCE TO THE EXTENT APPLICABLE LAW
-PROHIBITS SUCH LIMITATION. SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION O=
R
-LIMITATION OF INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THAT EXCLUSION AND
-LIMITATION MAY NOT APPLY TO YOU.
-
-10. U.S. GOVERNMENT END USERS
-
-The Covered Code is a "commercial item," as that term is defined in
-48 C.F.R. 2.101 (Oct. 1995), consisting of "commercial computer
-software" and "commercial computer software documentation," as
-such terms are used in 48 C.F.R. 12.212 (Sept. 1995). Consistent with 48 C=
.F.R.
-12.212 and 48 C.F.R. 227.7202-1 through 227.7202-4 (June 1995), all U.S.
-Government End Users acquire Covered Code with only those rights set forth
-herein.
-
-11. MISCELLANEOUS
-
-This License represents the complete agreement concerning subject matter
-hereof. If any provision of this License is held to be unenforceable, such
-provision shall be reformed only to the extent necessary to make it
-enforceable. This License shall be governed by California law provisions
-(except to the extent applicable law, if any, provides otherwise), excludi=
ng
-its conflict-of-law provisions. With respect to disputes in which at least=
 one
-party is a citizen of, or an entity chartered or registered to do business=
 in,
-the United States of America: (a) unless otherwise agreed in writing, all
-disputes relating to this License (excepting any dispute relating to
-intellectual property rights) shall be subject to final and binding
-arbitration, with the losing party paying all costs of arbitration; (b) an=
y
-arbitration relating to this Agreement shall be held in Santa Clara County=
,
-California, under the auspices of JAMS/EndDispute; and (c) any litigation
-relating to this Agreement shall be subject to the jurisdiction of the Fed=
eral
-Courts of the Northern District of California, with venue lying in Santa C=
lara
-County, California, with the losing party responsible for costs, including
-without limitation, court costs and reasonable attorneys fees and expenses=
. The
-application of the United Nations Convention on Contracts for the Internat=
ional
-Sale of Goods is expressly excluded. Any law or regulation which provides =
that
-the language of a contract shall be construed against the drafter shall no=
t
-apply to this License.
-
-12. RESPONSIBILITY FOR CLAIMS
-
-Except in cases where another Contributor has failed to comply with Sectio=
n
-3.4, You are responsible for damages arising, directly or indirectly, out =
of
-Your utilization of rights under this License, based on the number of copi=
es of
-Covered Code you made available, the revenues you received from utilizing =
such
-rights, and other relevant factors. You agree to work with affected partie=
s to
-distribute responsibility on an equitable basis.
-
-13. ADDITIONAL TERMS APPLICABLE TO THE RED HAT ECOS PUBLIC LICENSE
-
-Nothing in this License shall be interpreted to prohibit Red Hat from lice=
nsing
-under different terms than this License any code which Red Hat otherwise w=
ould
-have a right to license.
-
-Red Hat and logo - This License does not grant any rights to use the trade=
mark
-Red Hat, the Red Hat logo, eCos logo, even if such marks are included in t=
he
-Original Code. You may contact Red Hat for permission to display the Red H=
at
-and eCos marks in either the documentation or the Executable version beyon=
d
-that required in Exhibit B.
-
-Inability to Comply Due to Contractual Obligation - To the extent that Red=
 Hat
-is limited contractually from making third party code available under this
-License, Red Hat may choose to integrate such third party code into Covere=
d
-Code without being required to distribute such third party code in Source =
Code
-form, even if such third party code would otherwise be considered
-"Modifications" under this License.
-
-EXHIBIT A
-
-"The contents of this file are subject to the Red Hat eCos Public License
-Version 1.1 (the "License"); you may not use this file except in
-compliance with the License. You may obtain a copy of the License at http:=
//
-www.redhat.com/
-
-Software distributed under the License is distributed on an "AS IS"
-basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the Li=
cense
-for the specific language governing rights and limitations under the Licen=
se.
-
-The Original Code is eCos - Embedded Configurable Operating System, releas=
ed
-September 30, 1998. The Initial Developer of the Original Code is Red Hat.
-Portions created by Red Hat are Copyright (C) 1998, 1999, 2000 Red Hat, In=
c.
-All Rights Reserved."
-
-EXHIBIT B
-
-Part of the software embedded in this product is eCos - Embedded Configura=
ble
-Operating System, a trademark of Red Hat. Portions created by Red Hat are
-Copyright (C) 1998, 1999, 2000 Red Hat, Inc. (http://www.redhat.com/). All
-Rights Reserved.
-
-THE SOFTWARE IN THIS PRODUCT WAS IN PART PROVIDED BY RED HAT AND ANY EXPRE=
SS OR
-IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES =
OF
-MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
-EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPE=
CIAL,
-EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUR=
EMENT
-OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINES=
S
-INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) AR=
ISING
-IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBI=
LITY
-OF SUCH DAMAGE.
-
-
-
-
-
-
diff --git a/meta/files/common-licenses/Simple-2.0 b/meta/files/common-lice=
nses/Simple-2.0
deleted file mode 100644
index d28357d5f2..0000000000
--- a/meta/files/common-licenses/Simple-2.0
+++ /dev/null
@@ -1,27 +0,0 @@
-
-Simple Public License (SimPL)
-
-Preamble
-This Simple Public License 2.0 (SimPL 2.0 for short) is a plain language i=
mplementation of GPL 2.0.  The words are different, but the goal is the sam=
e - to guarantee for all users the freedom to share and change software.  I=
f anyone wonders about the meaning of the SimPL, they should interpret it a=
s consistent with GPL 2.0.
-Simple Public License (SimPL) 2.0
-The SimPL applies to the software`s source and object code and comes with =
any rights that I have in it (other than trademarks). You agree to the SimP=
L by copying, distributing, or making a derivative work of the software.
-
-You get the royalty free right to:
-Use the software for any purpose;
-Make derivative works of it (this is called a "Derived Work");
-Copy and distribute it and any Derived Work.
-If you distribute the software or a Derived Work, you must give back to th=
e community by:
-Prominently noting the date of any changes you make;
-Leaving other people`s copyright notices, warranty disclaimers, and licens=
e terms  in place;
-Providing the source code, build scripts, installation scripts, and interf=
ace definitions in a form that is easy to get and best to modify;
-Licensing it to everyone under SimPL, or substantially similar terms (such=
 as GPL 2.0), without adding further restrictions to the rights provided;
-Conspicuously announcing that it is available under that license.
-There are some things that you must shoulder:
-You get NO WARRANTIES. None of any kind;
-If the software damages you in any way, you may only recover direct damage=
s up to the amount you paid for it (that is zero if you did not pay anythin=
g). You may not recover any other damages, including those called "conseque=
ntial damages." (The state or country where you live may not allow you to l=
imit your liability in this way, so this may not apply to you);
-The SimPL continues perpetually, except that your license rights end autom=
atically if:
-You do not abide by the "give back to the community" terms (your licensees=
 get to keep their rights if they abide);
-Anyone prevents you from distributing the software under the terms of the =
SimPL.
-License for the License
-You may do anything that you want with the SimPL text; it`s a license form=
 to use in any way that you find helpful.  To avoid confusion, however, if =
you change the terms in any way then you may not call your license the Simp=
le Public License or the SimPL (but feel free to acknowledge that your lice=
nse is "based on the Simple Public License").
-
diff --git a/meta/files/common-licenses/SugarCRM-1 b/meta/files/common-lice=
nses/SugarCRM-1
deleted file mode 100644
index acbb4e0bdc..0000000000
--- a/meta/files/common-licenses/SugarCRM-1
+++ /dev/null
@@ -1,431 +0,0 @@
-
-SUGARCRM PUBLIC LICENSE
-
-Version 1.1.3
-
-The SugarCRM Public License Version ("SPL") consists of the Mozilla
-Public License Version 1.1, modified to be specific to SugarCRM, with the
-Additional Terms in Exhibit B. The original Mozilla Public License 1.1 can=
 be
-found at: http://www.mozilla.org/MPL/MPL-1.1.html
-
-
-1. Definitions.
-
-1.0.1. "Commercial Use" means distribution or otherwise making the
-Covered Code available to a third party.
-1.1. ''Contributor'' means each entity that creates or contributes to the
-creation of Modifications.
-
-1.2. ''Contributor Version'' means the combination of the Original Code, p=
rior
-Modifications used by a Contributor, and the Modifications made by that
-particular Contributor.
-
-1.3. ''Covered Code'' means the Original Code or Modifications or the
-combination of the Original Code and Modifications, in each case including
-portions thereof.
-
-1.4. ''Electronic Distribution Mechanism'' means a mechanism generally acc=
epted
-in the software development community for the electronic transfer of data.
-
-1.5. ''Executable'' means Covered Code in any form other than Source Code.
-
-1.6. ''Initial Developer'' means the individual or entity identified as th=
e
-Initial Developer in the Source Code notice required by Exhibit A.
-
-1.7. ''Larger Work'' means a work which combines Covered Code or portions
-thereof with code not governed by the terms of this License.
-
-1.8. ''License'' means this document.
-
-1.8.1. "Licensable" means having the right to grant, to the maximum
-extent possible, whether at the time of the initial grant or subsequently
-acquired, any and all of the rights conveyed herein.
-
-1.9. ''Modifications'' means any addition to or deletion from the substanc=
e or
-structure of either the Original Code or any previous Modifications. When
-Covered Code is released as a series of files, a Modification is:
-
-A. Any addition to or deletion from the contents of a file containing Orig=
inal
-Code or previous Modifications.
-B. Any new file that contains any part of the Original Code or previous
-Modifications.
-1.10. ''Original Code'' means Source Code of computer software code which =
is
-described in the Source Code notice required by Exhibit A as Original Code=
, and
-which, at the time of its release under this License is not already Covere=
d
-Code governed by this License.
-1.10.1. "Patent Claims" means any patent claim(s), now owned or
-hereafter acquired, including without limitation, method, process, and
-apparatus claims, in any patent Licensable by grantor.
-
-1.11. ''Source Code'' means the preferred form of the Covered Code for mak=
ing
-modifications to it, including all modules it contains, plus any associate=
d
-interface definition files, scripts used to control compilation and
-installation of an Executable, or source code differential comparisons aga=
inst
-either the Original Code or another well known, available Covered Code of =
the
-Contributor's choice. The Source Code can be in a compressed or archival f=
orm,
-provided the appropriate decompression or de-archiving software is widely
-available for no charge.
-
-1.12. "You'' (or "Your") means an individual or a legal entity
-exercising rights under, and complying with all of the terms of, this Lice=
nse
-or a future version of this License issued under Section 6.1. For legal
-entities, "You'' includes any entity which controls, is controlled by, or
-is under common control with You. For purposes of this definition,
-"control'' means (a) the power, direct or indirect, to cause the direction
-or management of such entity, whether by contract or otherwise, or (b)
-ownership of more than fifty percent (50%) of the outstanding shares or
-beneficial ownership of such entity.
-
-2. Source Code License.
-2.1. The Initial Developer Grant.
-The Initial Developer hereby grants You a world-wide, royalty-free, non-
-exclusive license, subject to third party intellectual property claims:
-(a) under intellectual property rights (other than patent or trademark)
-Licensable by Initial Developer to use, reproduce, modify, display, perfor=
m,
-sublicense and distribute the Original Code (or portions thereof) with or
-without Modifications, and/or as part of a Larger Work; and
-(b) under Patents Claims infringed by the making, using or selling of Orig=
inal
-Code, to make, have made, use, practice, sell, and offer for sale, and/or
-otherwise dispose of the Original Code (or portions thereof).
-
-(c) the licenses granted in this Section 2.1(a) and (b) are effective on t=
he
-date Initial Developer first distributes Original Code under the terms of =
this
-License.
-(d) Notwithstanding Section 2.1(b) above, no patent license is granted: 1)=
 for
-code that You delete from the Original Code; 2) separate from the Original
-Code; or 3) for infringements caused by: i) the modification of the Origin=
al
-Code or ii) the combination of the Original Code with other software or
-devices.
-2.2. Contributor Grant.
-Subject to third party intellectual property claims, each Contributor here=
by
-grants You a world-wide, royalty-free, non-exclusive license
-
-(a) under intellectual property rights (other than patent or trademark)
-Licensable by Contributor, to use, reproduce, modify, display, perform,
-sublicense and distribute the Modifications created by such Contributor (o=
r
-portions thereof) either on an unmodified basis, with other Modifications,=
 as
-Covered Code and/or as part of a Larger Work; and
-(b) under Patent Claims infringed by the making, using, or selling of
-Modifications made by that Contributor either alone and/or in combination =
with
-its Contributor Version (or portions of such combination), to make, use, s=
ell,
-offer for sale, have made, and/or otherwise dispose of: 1) Modifications m=
ade
-by that Contributor (or portions thereof); and 2) the combination of
-Modifications made by that Contributor with its Contributor Version (or
-portions of such combination).
-
-(c) the licenses granted in Sections 2.2(a) and 2.2(b) are effective on th=
e
-date Contributor first makes Commercial Use of the Covered Code.
-
-(d) Notwithstanding Section 2.2(b) above, no patent license is granted: 1)=
 for
-any code that Contributor has deleted from the Contributor Version; 2) sep=
arate
-from the Contributor Version; 3) for infringements caused by: i) third par=
ty
-modifications of Contributor Version or ii) the combination of Modificatio=
ns
-made by that Contributor with other software (except as part of the Contri=
butor
-Version) or other devices; or 4) under Patent Claims infringed by Covered =
Code
-in the absence of Modifications made by that Contributor.
-
-
-3. Distribution Obligations.
-
-3.1. Application of License.
-The Modifications which You create or to which You contribute are governed=
 by
-the terms of this License, including without limitation Section 2.2. The S=
ource
-Code version of Covered Code may be distributed only under the terms of th=
is
-License or a future version of this License released under Section 6.1, an=
d You
-must include a copy of this License with every copy of the Source Code You
-distribute. You may not offer or impose any terms on any Source Code versi=
on
-that alters or restricts the applicable version of this License or the
-recipients' rights hereunder. However, You may include an additional docum=
ent
-offering the additional rights described in Section 3.5.
-3.2. Availability of Source Code.
-Any Modification which You create or to which You contribute must be made
-available in Source Code form under the terms of this License either on th=
e
-same media as an Executable version or via an accepted Electronic Distribu=
tion
-Mechanism to anyone to whom you made an Executable version available; and =
if
-made available via Electronic Distribution Mechanism, must remain availabl=
e for
-at least twelve (12) months after the date it initially became available, =
or at
-least six (6) months after a subsequent version of that particular Modific=
ation
-has been made available to such recipients. You are responsible for ensuri=
ng
-that the Source Code version remains available even if the Electronic
-Distribution Mechanism is maintained by a third party.
-
-3.3. Description of Modifications.
-You must cause all Covered Code to which You contribute to contain a file
-documenting the changes You made to create that Covered Code and the date =
of
-any change. You must include a prominent statement that the Modification i=
s
-derived, directly or indirectly, from Original Code provided by the Initia=
l
-Developer and including the name of the Initial Developer in (a) the Sourc=
e
-Code, and (b) in any notice in an Executable version or related documentat=
ion
-in which You describe the origin or ownership of the Covered Code.
-
-3.4. Intellectual Property Matters
-
-(a) Third Party Claims.
-If Contributor has knowledge that a license under a third party's intellec=
tual
-property rights is required to exercise the rights granted by such Contrib=
utor
-under Sections 2.1 or 2.2, Contributor must include a text file with the S=
ource
-Code distribution titled "LEGAL'' which describes the claim and the party
-making the claim in sufficient detail that a recipient will know whom to
-contact. If Contributor obtains such knowledge after the Modification is m=
ade
-available as described in Section 3.2, Contributor shall promptly modify t=
he
-LEGAL file in all copies Contributor makes available thereafter and shall =
take
-other steps (such as notifying appropriate mailing lists or newsgroups)
-reasonably calculated to inform those who received the Covered Code that n=
ew
-knowledge has been obtained.
-(b) Contributor APIs.
-If Contributor's Modifications include an application programming interfac=
e and
-Contributor has knowledge of patent licenses which are reasonably necessar=
y to
-implement that API, Contributor must also include this information in the =
LEGAL
-file.
-(c) Representations.
-Contributor represents that, except as disclosed pursuant to Section 3.4(a=
)
-above, Contributor believes that Contributor's Modifications are Contribut=
or's
-original creation(s) and/or Contributor has sufficient rights to grant the
-rights conveyed by this License.
-
-3.5. Required Notices.
-You must duplicate the notice in Exhibit A in each file of the Source Code=
. If
-it is not possible to put such notice in a particular Source Code file due=
 to
-its structure, then You must include such notice in a location (such as a
-relevant directory) where a user would be likely to look for such a notice=
. If
-You created one or more Modification(s) You may add your name as a Contrib=
utor
-to the notice described in Exhibit A. You must also duplicate this License=
 in
-any documentation for the Source Code where You describe recipients' right=
s or
-ownership rights relating to Covered Code. You may choose to offer, and to
-charge a fee for, warranty, support, indemnity or liability obligations to=
 one
-or more recipients of Covered Code. However, You may do so only on Your ow=
n
-behalf, and not on behalf of the Initial Developer or any Contributor. You=
 must
-make it absolutely clear than any such warranty, support, indemnity or
-liability obligation is offered by You alone, and You hereby agree to inde=
mnify
-the Initial Developer and every Contributor for any liability incurred by =
the
-Initial Developer or such Contributor as a result of warranty, support,
-indemnity or liability terms You offer.
-
-3.6. Distribution of Executable Versions.
-You may distribute Covered Code in Executable form only if the requirement=
s of
-Section 3.1-3.5 have been met for that Covered Code, and if You include a
-notice stating that the Source Code version of the Covered Code is availab=
le
-under the terms of this License, including a description of how and where =
You
-have fulfilled the obligations of Section 3.2. The notice must be conspicu=
ously
-included in any notice in an Executable version, related documentation or
-collateral in which You describe recipients' rights relating to the Covere=
d
-Code. You may distribute the Executable version of Covered Code or ownersh=
ip
-rights under a license of Your choice, which may contain terms different f=
rom
-this License, provided that You are in compliance with the terms of this
-License and that the license for the Executable version does not attempt t=
o
-limit or alter the recipient's rights in the Source Code version from the
-rights set forth in this License. If You distribute the Executable version
-under a different license You must make it absolutely clear that any terms
-which differ from this License are offered by You alone, not by the Initia=
l
-Developer or any Contributor. You hereby agree to indemnify the Initial
-Developer and every Contributor for any liability incurred by the Initial
-Developer or such Contributor as a result of any such terms You offer.
-
-3.7. Larger Works.
-You may create a Larger Work by combining Covered Code with other code not
-governed by the terms of this License and distribute the Larger Work as a
-single product. In such a case, You must make sure the requirements of thi=
s
-License are fulfilled for the Covered Code.
-
-4. Inability to Comply Due to Statute or Regulation.
-If it is impossible for You to comply with any of the terms of this Licens=
e
-with respect to some or all of the Covered Code due to statute, judicial o=
rder,
-or regulation then You must: (a) comply with the terms of this License to =
the
-maximum extent possible; and (b) describe the limitations and the code the=
y
-affect. Such description must be included in the LEGAL file described in
-Section 3.4 and must be included with all distributions of the Source Code=
.
-Except to the extent prohibited by statute or regulation, such description=
 must
-be sufficiently detailed for a recipient of ordinary skill to be able to
-understand it.
-
-5. Application of this License.
-This License applies to code to which the Initial Developer has attached t=
he
-notice in Exhibit A and to related Covered Code.
-
-6. Versions of the License.
-6.1. New Versions.
-SugarCRM Inc. (''SugarCRM'') may publish revised and/or new versions of th=
e
-License from time to time. Each version will be given a distinguishing ver=
sion
-number.
-6.2. Effect of New Versions.
-Once Covered Code has been published under a particular version of the Lic=
ense,
-You may always continue to use it under the terms of that version. You may=
 also
-choose to use such Covered Code under the terms of any subsequent version =
of
-the License published by SugarCRM. No one other than SugarCRM has the righ=
t to
-modify the terms applicable to Covered Code created under this License.
-
-6.3. Derivative Works.
-If You create or use a modified version of this License (which you may onl=
y do
-in order to apply it to code which is not already Covered Code governed by=
 this
-License), You must (a) rename Your license so that the phrases ''SugarCRM'=
',
-''SPL'' or any confusingly similar phrase do not appear in your license (e=
xcept
-to note that your license differs from this License) and (b) otherwise mak=
e it
-clear that Your version of the license contains terms which differ from th=
e
-SugarCRM Public License. (Filling in the name of the Initial Developer,
-Original Code or Contributor in the notice described in Exhibit A shall no=
t of
-themselves be deemed to be modifications of this License.)
-
-7. DISCLAIMER OF WARRANTY.
-COVERED CODE IS PROVIDED UNDER THIS LICENSE ON AN "AS IS'' BASIS, WITHOUT
-WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, WITHOUT
-LIMITATION, WARRANTIES THAT THE COVERED CODE IS FREE OF DEFECTS, MERCHANTA=
BLE,
-FIT FOR A PARTICULAR PURPOSE OR NON-INFRINGING. THE ENTIRE RISK AS TO THE
-QUALITY AND PERFORMANCE OF THE COVERED CODE IS WITH YOU. SHOULD ANY COVERE=
D
-CODE PROVE DEFECTIVE IN ANY RESPECT, YOU (NOT THE INITIAL DEVELOPER OR ANY
-OTHER CONTRIBUTOR) ASSUME THE COST OF ANY NECESSARY SERVICING, REPAIR OR
-CORRECTION. THIS DISCLAIMER OF WARRANTY CONSTITUTES AN ESSENTIAL PART OF T=
HIS
-LICENSE. NO USE OF ANY COVERED CODE IS AUTHORIZED HEREUNDER EXCEPT UNDER T=
HIS
-DISCLAIMER.
-
-8. TERMINATION.
-8.1. This License and the rights granted hereunder will terminate automati=
cally
-if You fail to comply with terms herein and fail to cure such breach withi=
n 30
-days of becoming aware of the breach. All sublicenses to the Covered Code =
which
-are properly granted shall survive any termination of this License. Provis=
ions
-which, by their nature, must remain in effect beyond the termination of th=
is
-License shall survive.
-8.2. If You initiate litigation by asserting a patent infringement claim
-(excluding declatory judgment actions) against Initial Developer or a
-Contributor (the Initial Developer or Contributor against whom You file su=
ch
-action is referred to as "Participant") alleging that:
-
-(a) such Participant's Contributor Version directly or indirectly infringe=
s any
-patent, then any and all rights granted by such Participant to You under
-Sections 2.1 and/or 2.2 of this License shall, upon 60 days notice from
-Participant terminate prospectively, unless if within 60 days after receip=
t of
-notice You either: (i) agree in writing to pay Participant a mutually agre=
eable
-reasonable royalty for Your past and future use of Modifications made by s=
uch
-Participant, or (ii) withdraw Your litigation claim with respect to the
-Contributor Version against such Participant. If within 60 days of notice,=
 a
-reasonable royalty and payment arrangement are not mutually agreed upon in
-writing by the parties or the litigation claim is not withdrawn, the right=
s
-granted by Participant to You under Sections 2.1 and/or 2.2 automatically
-terminate at the expiration of the 60 day notice period specified above.
-
-(b) any software, hardware, or device, other than such Participant's
-Contributor Version, directly or indirectly infringes any patent, then any
-rights granted to You by such Participant under Sections 2.1(b) and 2.2(b)=
 are
-revoked effective as of the date You first made, used, sold, distributed, =
or
-had made, Modifications made by that Participant.
-
-8.3. If You assert a patent infringement claim against Participant allegin=
g
-that such Participant's Contributor Version directly or indirectly infring=
es
-any patent where such claim is resolved (such as by license or settlement)
-prior to the initiation of patent infringement litigation, then the reason=
able
-value of the licenses granted by such Participant under Sections 2.1 or 2.=
2
-shall be taken into account in determining the amount or value of any paym=
ent
-or license.
-
-8.4. In the event of termination under Sections 8.1 or 8.2 above, all end =
user
-license agreements (excluding distributors and resellers) which have been
-validly granted by You or any distributor hereunder prior to termination s=
hall
-survive termination.
-
-9. LIMITATION OF LIABILITY.
-UNDER NO CIRCUMSTANCES AND UNDER NO LEGAL THEORY, WHETHER TORT (INCLUDING
-NEGLIGENCE), CONTRACT, OR OTHERWISE, SHALL YOU, THE INITIAL DEVELOPER, ANY
-OTHER CONTRIBUTOR, OR ANY DISTRIBUTOR OF COVERED CODE, OR ANY SUPPLIER OF =
ANY
-OF SUCH PARTIES, BE LIABLE TO ANY PERSON FOR ANY INDIRECT, SPECIAL, INCIDE=
NTAL,
-OR CONSEQUENTIAL DAMAGES OF ANY CHARACTER INCLUDING, WITHOUT LIMITATION,
-DAMAGES FOR LOSS OF GOODWILL, WORK STOPPAGE, COMPUTER FAILURE OR MALFUNCTI=
ON,
-OR ANY AND ALL OTHER COMMERCIAL DAMAGES OR LOSSES, EVEN IF SUCH PARTY SHAL=
L
-HAVE BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES. THIS LIMITATION OF
-LIABILITY SHALL NOT APPLY TO LIABILITY FOR DEATH OR PERSONAL INJURY RESULT=
ING
-FROM SUCH PARTY'S NEGLIGENCE TO THE EXTENT APPLICABLE LAW PROHIBITS SUCH
-LIMITATION. SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF
-INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THIS EXCLUSION AND LIMITATION MAY =
NOT
-APPLY TO YOU.
-
-10. U.S. GOVERNMENT END USERS.
-The Covered Code is a ''commercial item,'' as that term is defined in 48 C=
.F.R.
-2.101 (Oct. 1995), consisting of ''commercial computer software'' and
-''commercial computer software documentation,'' as such terms are used in =
48
-C.F.R. 12.212 (Sept. 1995). Consistent with 48 C.F.R. 12.212 and 48 C.F.R.
-227.7202-1 through 227.7202-4 (June 1995), all U.S. Government End Users
-acquire Covered Code with only those rights set forth herein.
-
-11. MISCELLANEOUS.
-This License represents the complete agreement concerning subject matter
-hereof. If any provision of this License is held to be unenforceable, such
-provision shall be reformed only to the extent necessary to make it
-enforceable. This License shall be governed by California law provisions
-(except to the extent applicable law, if any, provides otherwise), excludi=
ng
-its conflict-of-law provisions. With respect to disputes in which at least=
 one
-party is a citizen of, or an entity chartered or registered to do business=
 in
-the United States of America, any litigation relating to this License shal=
l be
-subject to the jurisdiction of the Federal Courts of the Northern District=
 of
-California, with venue lying in Santa Clara County, California, with the l=
osing
-party responsible for costs, including without limitation, court costs and
-reasonable attorneys' fees and expenses. The application of the United Nat=
ions
-Convention on Contracts for the International Sale of Goods is expressly
-excluded. Any law or regulation which provides that the language of a cont=
ract
-shall be construed against the drafter shall not apply to this License.
-
-12. RESPONSIBILITY FOR CLAIMS.
-As between Initial Developer and the Contributors, each party is responsib=
le
-for claims and damages arising, directly or indirectly, out of its utiliza=
tion
-of rights under this License and You agree to work with Initial Developer =
and
-Contributors to distribute such responsibility on an equitable basis. Noth=
ing
-herein is intended or shall be deemed to constitute any admission of liabi=
lity.
-
-13. MULTIPLE-LICENSED CODE.
-Initial Developer may designate portions of the Covered Code as
-"Multiple-Licensed". "Multiple-Licensed" means that the
-Initial Developer permits you to utilize portions of the Covered Code unde=
r
-Your choice of the SPL or the alternative licenses, if any, specified by t=
he
-Initial Developer in the file described in Exhibit A.
-SugarCRM Public License 1.1.3 - Exhibit A
-
-The contents of this file are subject to the SugarCRM Public License Versi=
on
-1.1.3
-("License"); You may not use this file except in compliance with the
-License. You may obtain a copy of the License at http://www.sugarcrm.com/S=
PL
-Software distributed under the License is distributed on an "AS IS"
-basis,
-WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License f=
or
-the specific language governing rights and limitations under the License.
-
-The Original Code is: SugarCRM Open Source
-
-The Initial Developer of the Original Code is SugarCRM, Inc.
-Portions created by SugarCRM are Copyright (C) 2004 SugarCRM, Inc.;
-All Rights Reserved.
-Contributor(s): ______________________________________.
-[NOTE: The text of this Exhibit A may differ slightly from the text of the
-notices in the Source Code files of the Original Code. You should use the =
text
-of this Exhibit A rather than the text found in the Original Code Source C=
ode
-for Your Modifications.]
-
-SugarCRM Public License 1.1.3 - Exhibit B
-
-Additional Terms applicable to the SugarCRM Public License.
-
-I. Effect.
-These additional terms described in this SugarCRM Public License &ndash;
-Additional Terms shall apply to the Covered Code under this License.
-
-II. SugarCRM and logo.
-This License does not grant any rights to use the trademarks
-"SugarCRM" and the "SugarCRM" logos even if such marks are
-included in the Original Code or Modifications.
-
-However, in addition to the other notice obligations, all copies of the Co=
vered
-Code in Executable and Source Code form distributed must, as a form of
-attribution of the original author, include on each user interface screen =
(i)
-the "Powered by SugarCRM" logo and (ii) the copyright notice in the
-same form as the latest version of the Covered Code distributed by SugarCR=
M,
-Inc. at the time of distribution of such copy. In addition, the "Powered
-by SugarCRM" logo must be visible to all users and be located at the very
-bottom center of each user interface screen. Notwithstanding the above, th=
e
-dimensions of the "Powered By SugarCRM" logo must be at least 106 x
-23 pixels. When users click on the "Powered by SugarCRM" logo it must
-direct them back to http://www.sugarforge.org. In addition, the copyright
-notice must remain visible to all users at all times at the bottom of the =
user
-interface screen. When users click on the copyright notice, it must direct=
 them
-back to http://www.sugarcrm.com
-
-
-
-
-
-
diff --git a/meta/files/common-licenses/UCB b/meta/files/common-licenses/UC=
B
deleted file mode 100644
index 79a757af95..0000000000
--- a/meta/files/common-licenses/UCB
+++ /dev/null
@@ -1,26 +0,0 @@
-   Copyright (c) 1987, 1989, 1990, 1991, 1992, 1993, 1994
-        The Regents of the University of California.  All rights reserved.
-
-   Redistribution and use in source and binary forms, with or without
-   modification, are permitted provided that the following conditions
-   are met:
-   1. Redistributions of source code must retain the above copyright
-      notice, this list of conditions and the following disclaimer.
-   2. Redistributions in binary form must reproduce the above copyright
-      notice, this list of conditions and the following disclaimer in the
-      documentation and/or other materials provided with the distribution.
-   3. Neither the name of the University nor the names of its contributors
-      may be used to endorse or promote products derived from this softwar=
e
-      without specific prior written permission.
-
-   THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
-   ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURP=
OSE
-   ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABL=
E
-   FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENT=
IAL
-   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-   OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-   HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STR=
ICT
-   LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY W=
AY
-   OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-   SUCH DAMAGE.
diff --git a/meta/files/common-licenses/XFree86-1.0 b/meta/files/common-lic=
enses/XFree86-1.0
deleted file mode 100644
index b1f3bf45b0..0000000000
--- a/meta/files/common-licenses/XFree86-1.0
+++ /dev/null
@@ -1,22 +0,0 @@
-Copyright (C) 1994-2003 The XFree86 Project, Inc. All Rights Reserved.
-
-Permission is hereby granted, free of charge, to any person obtaining a co=
py of
-this software and associated documentation files (the "Software"), to deal=
 in
-the Software without restriction, including without limitation the rights =
to
-use, copy, modify, merge, publish, distribute, sublicense, and/or sell cop=
ies
-of the Software, and to permit persons to whom the Software is furnished t=
o do
-so, subject to the following conditions:
-
-The above copyright notice and this permission notice shall be included in=
 all
-copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL TH=
E
-XFREE86 PROJECT BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETH=
ER IN
-AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNE=
CTION
-WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-
-Except as contained in this notice, the name of the XFree86 Project shall =
not
-be used in advertising or otherwise to promote the sale, use or other deal=
ings
-in this Software without prior written authorization from the XFree86 Proj=
ect.
diff --git a/meta/files/common-licenses/XSL b/meta/files/common-licenses/XS=
L
deleted file mode 100644
index 0a82d60c1c..0000000000
--- a/meta/files/common-licenses/XSL
+++ /dev/null
@@ -1,48 +0,0 @@
-Copyright
----------
-Copyright (C) 1999-2007 Norman Walsh
-Copyright (C) 2003 Ji=C5=99=C3=AD Kosek
-Copyright (C) 2004-2007 Steve Ball
-Copyright (C) 2005-2008 The DocBook Project
-Copyright (C) 2011-2012 O'Reilly Media
-
-Permission is hereby granted, free of charge, to any person
-obtaining a copy of this software and associated documentation
-files (the ``Software''), to deal in the Software without
-restriction, including without limitation the rights to use,
-copy, modify, merge, publish, distribute, sublicense, and/or
-sell copies of the Software, and to permit persons to whom the
-Software is furnished to do so, subject to the following
-conditions:
-
-The above copyright notice and this permission notice shall be
-included in all copies or substantial portions of the Software.
-
-Except as contained in this notice, the names of individuals
-credited with contribution to this software shall not be used in
-advertising or otherwise to promote the sale, use or other
-dealings in this Software without prior written authorization
-from the individuals in question.
-
-Any stylesheet derived from this Software that is publically
-distributed will be identified with a different name and the
-version strings in any derived Software will be changed so that
-no possibility of confusion between the derived package and this
-Software will exist.
-
-Warranty
---------
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
-OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-NONINFRINGEMENT.  IN NO EVENT SHALL NORMAN WALSH OR ANY OTHER
-CONTRIBUTOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
-WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-OTHER DEALINGS IN THE SOFTWARE.
-
-Contacting the Author
----------------------
-The DocBook XSL stylesheets are maintained by Norman Walsh,
-<ndw@nwalsh.com>, and members of the DocBook Project,
-<docbook-developers@sf.net>
diff --git a/meta/files/common-licenses/bzip2-1.0.4 b/meta/files/common-lic=
enses/bzip2-1.0.4
deleted file mode 100644
index 4458e35bb5..0000000000
--- a/meta/files/common-licenses/bzip2-1.0.4
+++ /dev/null
@@ -1,43 +0,0 @@
-
---------------------------------------------------------------------------
-
-This program, "bzip2", the associated library "libbzip2", and all
-documentation, are copyright (C) 1996-2006 Julian R Seward.  All
-rights reserved.
-
-Redistribution and use in source and binary forms, with or without
-modification, are permitted provided that the following conditions
-are met:
-
-1. Redistributions of source code must retain the above copyright
-   notice, this list of conditions and the following disclaimer.
-
-2. The origin of this software must not be misrepresented; you must=20
-   not claim that you wrote the original software.  If you use this=20
-   software in a product, an acknowledgment in the product=20
-   documentation would be appreciated but is not required.
-
-3. Altered source versions must be plainly marked as such, and must
-   not be misrepresented as being the original software.
-
-4. The name of the author may not be used to endorse or promote=20
-   products derived from this software without specific prior written=20
-   permission.
-
-THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
-OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
-DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
-GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-
-Julian Seward, Cambridge, UK.
-jseward@bzip.org
-bzip2/libbzip2 version 1.0.4 of 20 December 2006
-
---------------------------------------------------------------------------
diff --git a/meta/files/common-licenses/gSOAP-1 b/meta/files/common-license=
s/gSOAP-1
deleted file mode 100644
index 3f8638add3..0000000000
--- a/meta/files/common-licenses/gSOAP-1
+++ /dev/null
@@ -1,380 +0,0 @@
-
-gSOAP Public License
-
-Version 1.3b
-
-The gSOAP public license is derived from the Mozilla Public License (MPL1.=
1).
-The sections that were deleted from the original MPL1.1 text are 1.0.1, 2.=
1.
-(c),(d), 2.2.(c),(d), 8.2.(b), 10, and 11. Section 3.8 was added. The modi=
fied
-sections are 2.1.(b), 2.2.(b), 3.2 (simplified), 3.5 (deleted the last
-sentence), and 3.6 (simplified).
-This license applies to the gSOAP software package, with the exception of =
the
-soapcpp2 and wsdl2h source code located in gsoap/src and gsoap/wsdl, all c=
ode
-generated by soapcpp2 and wsdl2h, the UDDI source code gsoap/uddi2, and th=
e Web
-server sample source code samples/webserver. To use any of these software =
tools
-and components commercially, a commercial license is required and can be
-obtained from www.genivia.com.
-1 DEFINITIONS.
-
-1.0.1.
-1.1. "Contributor"
-means each entity that creates or contributes to the creation of Modificat=
ions.
-1.2. "Contributor Version"
-means the combination of the Original Code, prior Modifications used by a
-Contributor, and the Modifications made by that particular Contributor.
-1.3. "Covered Code"
-means the Original Code, or Modifications or the combination of the Origin=
al
-Code, and Modifications, in each case including portions thereof.
-1.4. "Electronic Distribution Mechanism"
-means a mechanism generally accepted in the software development community=
 for
-the electronic transfer of data.
-1.5. "Executable"
-means Covered Code in any form other than Source Code.
-1.6. "Initial Developer"
-means the individual or entity identified as the Initial Developer in the
-Source Code notice required by Exhibit A.
-1.7. "Larger Work"
-means a work which combines Covered Code or portions thereof with code not
-governed by the terms of this License.
-1.8. "License"
-means this document.
-1.8.1. "Licensable"
-means having the right to grant, to the maximum extent possible, whether a=
t the
-time of the initial grant or subsequently acquired, any and all of the rig=
hts
-conveyed herein.
-1.9. "Modifications"
-means any addition to or deletion from the substance or structure of eithe=
r the
-Original Code or any previous Modifications. When Covered Code is released=
 as a
-series of files, a Modification is:
-A.
-Any addition to or deletion from the contents of a file containing Origina=
l
-Code or previous Modifications.
-B.
-Any new file that contains any part of the Original Code, or previous
-Modifications.
-1.10. "Original Code"
-means Source Code of computer software code which is described in the Sour=
ce
-Code notice required by Exhibit A as Original Code, and which, at the time=
 of
-its release under this License is not already Covered Code governed by thi=
s
-License.
-1.10.1. "Patent Claims"
-means any patent claim(s), now owned or hereafter acquired, including with=
out
-limitation, method, process, and apparatus claims, in any patent Licensabl=
e by
-grantor.
-1.11. "Source Code"
-means the preferred form of the Covered Code for making modifications to i=
t,
-including all modules it contains, plus any associated interface definitio=
n
-files, scripts used to control compilation and installation of an Executab=
le,
-or source code differential comparisons against either the Original Code o=
r
-another well known, available Covered Code of the Contributor's choice. Th=
e
-Source Code can be in a compressed or archival form, provided the appropri=
ate
-decompression or de-archiving software is widely available for no charge.
-1.12. "You" (or "Your")
-means an individual or a legal entity exercising rights under, and complyi=
ng
-with all of the terms of, this License or a future version of this License
-issued under Section 6.1. For legal entities, "You" includes any
-entity which controls, is controlled by, or is under common control with Y=
ou.
-For purposes of this definition, "control" means (a) the power,
-direct or indirect, to cause the direction or management of such entity,
-whether by contract or otherwise, or (b) ownership of more than fifty perc=
ent
-(50%) of the outstanding shares or beneficial ownership of such entity.
-2 SOURCE CODE LICENSE.
-
-2.1. The Initial Developer Grant.
-
-The Initial Developer hereby grants You a world-wide, royalty-free, non-
-exclusive license, subject to third party intellectual property claims:
-(a)
-under intellectual property rights (other than patent or trademark) Licens=
able
-by Initial Developer to use, reproduce, modify, display, perform, sublicen=
se
-and distribute the Original Code (or portions thereof) with or without
-Modifications, and/or as part of a Larger Work; and
-(b)
-under patents now or hereafter owned or controlled by Initial Developer, t=
o
-make, have made, use and sell ("offer to sell and import") the
-Original Code, Modifications, or portions thereof, but solely to the exten=
t
-that any such patent is reasonably necessary to enable You to utilize, alo=
ne or
-in combination with other software, the Original Code, Modifications, or a=
ny
-combination or portions thereof.
-(c)
-(d)
-
-2.2. Contributor Grant.
-
-Subject to third party intellectual property claims, each Contributor here=
by
-grants You a world-wide, royalty-free, non-exclusive license
-(a)
-under intellectual property rights (other than patent or trademark) Licens=
able
-by Contributor, to use, reproduce, modify, display, perform, sublicense an=
d
-distribute the Modifications created by such Contributor (or portions ther=
eof)
-either on an unmodified basis, with other Modifications, as Covered Code a=
nd/or
-as part of a Larger Work; and
-(b)
-under patents now or hereafter owned or controlled by Contributor, to make=
,
-have made, use and sell ("offer to sell and import") the Contributor
-Version (or portions thereof), but solely to the extent that any such pate=
nt is
-reasonably necessary to enable You to utilize, alone or in combination wit=
h
-other software, the Contributor Version (or portions thereof).
-(c)
-(d)
-3 DISTRIBUTION OBLIGATIONS.
-
-3.1. Application of License.
-
-The Modifications which You create or to which You contribute are governed=
 by
-the terms of this License, including without limitation Section 2.2. The S=
ource
-Code version of Covered Code may be distributed only under the terms of th=
is
-License or a future version of this License released under Section 6.1, an=
d You
-must include a copy of this License with every copy of the Source Code You
-distribute. You may not offer or impose any terms on any Source Code versi=
on
-that alters or restricts the applicable version of this License or the
-recipients' rights hereunder. However, You may include an additional docum=
ent
-offering the additional rights described in Section 3.5.
-
-3.2. Availability of Source Code.
-
-Any Modification created by You will be provided to the Initial Developer =
in
-Source Code form and are subject to the terms of the License.
-
-3.3. Description of Modifications.
-
-You must cause all Covered Code to which You contribute to contain a file
-documenting the changes You made to create that Covered Code and the date =
of
-any change. You must include a prominent statement that the Modification i=
s
-derived, directly or indirectly, from Original Code provided by the Initia=
l
-Developer and including the name of the Initial Developer in (a) the Sourc=
e
-Code, and (b) in any notice in an Executable version or related documentat=
ion
-in which You describe the origin or ownership of the Covered Code.
-
-3.4. Intellectual Property Matters.
-(a) Third Party Claims.
-If Contributor has knowledge that a license under a third party's intellec=
tual
-property rights is required to exercise the rights granted by such Contrib=
utor
-under Sections 2.1 or 2.2, Contributor must include a text file with the S=
ource
-Code distribution titled "LEGAL" which describes the claim and the
-party making the claim in sufficient detail that a recipient will know who=
m to
-contact. If Contributor obtains such knowledge after the Modification is m=
ade
-available as described in Section 3.2, Contributor shall promptly modify t=
he
-LEGAL file in all copies Contributor makes available thereafter and shall =
take
-other steps (such as notifying appropriate mailing lists or newsgroups)
-reasonably calculated to inform those who received the Covered Code that n=
ew
-knowledge has been obtained.
-(b) Contributor APIs.
-If Contributor's Modifications include an application programming interfac=
e and
-Contributor has knowledge of patent licenses which are reasonably necessar=
y to
-implement that API, Contributor must also include this information in the =
LEGAL
-file.
-(c) Representations.
-Contributor represents that, except as disclosed pursuant to Section 3.4(a=
)
-above, Contributor believes that Contributor's Modifications are Contribut=
or's
-original creation(s) and/or Contributor has sufficient rights to grant the
-rights conveyed by this License.
-
-3.5. Required Notices.
-
-You must duplicate the notice in Exhibit A in each file of the Source Code=
. If
-it is not possible to put such notice in a particular Source Code file due=
 to
-its structure, then You must include such notice in a location (such as a
-relevant directory) where a user would be likely to look for such a notice=
. If
-You created one or more Modification(s) You may add your name as a Contrib=
utor
-to the notice described in Exhibit A. You must also duplicate this License=
 in
-any documentation for the Source Code where You describe recipients' right=
s or
-ownership rights relating to Covered Code. You may choose to offer, and to
-charge a fee for, warranty, support, indemnity or liability obligations to=
 one
-or more recipients of Covered Code. However, You may do so only on Your ow=
n
-behalf, and not on behalf of the Initial Developer or any Contributor.
-
-3.6. Distribution of Executable Versions.
-
-You may distribute Covered Code in Executable form only if the requirement=
s of
-Section 3.1-3.5 have been met for that Covered Code. You may distribute th=
e
-Executable version of Covered Code or ownership rights under a license of =
Your
-choice, which may contain terms different from this License, provided that=
 You
-are in compliance with the terms of this License and that the license for =
the
-Executable version does not attempt to limit or alter the recipient's righ=
ts in
-the Source Code version from the rights set forth in this License. If You
-distribute the Executable version under a different license You must make =
it
-absolutely clear that any terms which differ from this License are offered=
 by
-You alone, not by the Initial Developer or any Contributor. If you distrib=
ute
-executable versions containing Covered Code as part of a product, you must
-reproduce the notice in Exhibit B in the documentation and/or other materi=
als
-provided with the product.
-
-3.7. Larger Works.
-
-You may create a Larger Work by combining Covered Code with other code not
-governed by the terms of this License and distribute the Larger Work as a
-single product. In such a case, You must make sure the requirements of thi=
s
-License are fulfilled for the Covered Code.
-
-3.8. Restrictions.
-
-You may not remove any product identification, copyright, proprietary noti=
ces
-or labels from gSOAP.
-4 INABILITY TO COMPLY DUE TO STATUTE OR REGULATION.
-
-If it is impossible for You to comply with any of the terms of this Licens=
e
-with respect to some or all of the Covered Code due to statute, judicial o=
rder,
-or regulation then You must: (a) comply with the terms of this License to =
the
-maximum extent possible; and (b) describe the limitations and the code the=
y
-affect. Such description must be included in the LEGAL file described in
-Section 3.4 and must be included with all distributions of the Source Code=
.
-Except to the extent prohibited by statute or regulation, such description=
 must
-be sufficiently detailed for a recipient of ordinary skill to be able to
-understand it.
-5 APPLICATION OF THIS LICENSE.
-
-This License applies to code to which the Initial Developer has attached t=
he
-notice in Exhibit A and to related Covered Code.
-6 VERSIONS OF THE LICENSE.
-
-6.1. New Versions.
-
-Grantor may publish revised and/or new versions of the License from time t=
o
-time. Each version will be given a distinguishing version number.
-
-6.2. Effect of New Versions.
-
-Once Covered Code has been published under a particular version of the Lic=
ense,
-You may always continue to use it under the terms of that version. You may=
 also
-choose to use such Covered Code under the terms of any subsequent version =
of
-the License.
-
-6.3. Derivative Works.
-
-If You create or use a modified version of this License (which you may onl=
y do
-in order to apply it to code which is not already Covered Code governed by=
 this
-License), You must (a) rename Your license so that the phrase "gSOAP"
-or any confusingly similar phrase do not appear in your license (except to=
 note
-that your license differs from this License) and (b) otherwise make it cle=
ar
-that Your version of the license contains terms which differ from the gSOA=
P
-Public License. (Filling in the name of the Initial Developer, Original Co=
de or
-Contributor in the notice described in Exhibit A shall not of themselves b=
e
-deemed to be modifications of this License.)
-7 DISCLAIMER OF WARRANTY.
-
-COVERED CODE IS PROVIDED UNDER THIS LICENSE ON AN "AS IS" BASIS,
-WITHOUT WARRANTY OF ANY KIND, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLU=
DING,
-WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY, OF FITNESS =
FOR A
-PARTICULAR PURPOSE, NONINFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY
-RIGHTS, AND ANY WARRANTY THAT MAY ARISE BY REASON OF TRADE USAGE, CUSTOM, =
OR
-COURSE OF DEALING. WITHOUT LIMITING THE FOREGOING, YOU ACKNOWLEDGE THAT TH=
E
-SOFTWARE IS PROVIDED "AS IS" AND THAT THE AUTHORS DO NOT WARRANT THE
-SOFTWARE WILL RUN UNINTERRUPTED OR ERROR FREE. LIMITED LIABILITY THE ENTIR=
E
-RISK AS TO RESULTS AND PERFORMANCE OF THE SOFTWARE IS ASSUMED BY YOU. UNDE=
R NO
-CIRCUMSTANCES WILL THE AUTHORS BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDE=
NTAL,
-EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY KIND OR NATURE WHATSOEVER, WHETH=
ER
-BASED ON CONTRACT, WARRANTY, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY=
 OR
-OTHERWISE, ARISING OUT OF OR IN ANY WAY RELATED TO THE SOFTWARE, EVEN IF T=
HE
-AUTHORS HAVE BEEN ADVISED ON THE POSSIBILITY OF SUCH DAMAGE OR IF SUCH DAM=
AGE
-COULD HAVE BEEN REASONABLY FORESEEN, AND NOTWITHSTANDING ANY FAILURE OF
-ESSENTIAL PURPOSE OF ANY EXCLUSIVE REMEDY PROVIDED. SUCH LIMITATION ON DAM=
AGES
-INCLUDES, BUT IS NOT LIMITED TO, DAMAGES FOR LOSS OF GOODWILL, LOST PROFIT=
S,
-LOSS OF DATA OR SOFTWARE, WORK STOPPAGE, COMPUTER FAILURE OR MALFUNCTION O=
R
-IMPAIRMENT OF OTHER GOODS. IN NO EVENT WILL THE AUTHORS BE LIABLE FOR THE =
COSTS
-OF PROCUREMENT OF SUBSTITUTE SOFTWARE OR SERVICES. YOU ACKNOWLEDGE THAT TH=
IS
-SOFTWARE IS NOT DESIGNED FOR USE IN ON-LINE EQUIPMENT IN HAZARDOUS ENVIRON=
MENTS
-SUCH AS OPERATION OF NUCLEAR FACILITIES, AIRCRAFT NAVIGATION OR CONTROL, O=
R
-LIFE-CRITICAL APPLICATIONS. THE AUTHORS EXPRESSLY DISCLAIM ANY LIABILITY
-RESULTING FROM USE OF THE SOFTWARE IN ANY SUCH ON-LINE EQUIPMENT IN HAZARD=
OUS
-ENVIRONMENTS AND ACCEPTS NO LIABILITY IN RESPECT OF ANY ACTIONS OR CLAIMS =
BASED
-ON THE USE OF THE SOFTWARE IN ANY SUCH ON-LINE EQUIPMENT IN HAZARDOUS
-ENVIRONMENTS BY YOU. FOR PURPOSES OF THIS PARAGRAPH, THE TERM "LIFE-
-CRITICAL APPLICATION" MEANS AN APPLICATION IN WHICH THE FUNCTIONING OR
-MALFUNCTIONING OF THE SOFTWARE MAY RESULT DIRECTLY OR INDIRECTLY IN PHYSIC=
AL
-INJURY OR LOSS OF HUMAN LIFE. THIS DISCLAIMER OF WARRANTY CONSTITUTES AN
-ESSENTIAL PART OF THIS LICENSE. NO USE OF ANY COVERED CODE IS AUTHORIZED
-HEREUNDER EXCEPT UNDER THIS DISCLAIMER.
-8 TERMINATION.
-
-8.1.
-This License and the rights granted hereunder will terminate automatically=
 if
-You fail to comply with terms herein and fail to cure such breach within 3=
0
-days of becoming aware of the breach. All sublicenses to the Covered Code =
which
-are properly granted shall survive any termination of this License. Provis=
ions
-which, by their nature, must remain in effect beyond the termination of th=
is
-License shall survive.
-8.2.
-8.3.
-If You assert a patent infringement claim against Participant alleging tha=
t
-such Participant's Contributor Version directly or indirectly infringes an=
y
-patent where such claim is resolved (such as by license or settlement) pri=
or to
-the initiation of patent infringement litigation, then the reasonable valu=
e of
-the licenses granted by such Participant under Sections 2.1 or 2.2 shall b=
e
-taken into account in determining the amount or value of any payment or
-license.
-8.4.
-In the event of termination under Sections 8.1 or 8.2 above, all end user
-license agreements (excluding distributors and resellers) which have been
-validly granted by You or any distributor hereunder prior to termination s=
hall
-survive termination.
-9 LIMITATION OF LIABILITY.
-
-UNDER NO CIRCUMSTANCES AND UNDER NO LEGAL THEORY, WHETHER TORT (INCLUDING
-NEGLIGENCE), CONTRACT, OR OTHERWISE, SHALL YOU, THE INITIAL DEVELOPER, ANY
-OTHER CONTRIBUTOR, OR ANY DISTRIBUTOR OF COVERED CODE, OR ANY SUPPLIER OF =
ANY
-OF SUCH PARTIES, BE LIABLE TO ANY PERSON FOR ANY INDIRECT, SPECIAL, INCIDE=
NTAL,
-OR CONSEQUENTIAL DAMAGES OF ANY CHARACTER INCLUDING, WITHOUT LIMITATION,
-DAMAGES FOR LOSS OF GOODWILL, WORK STOPPAGE, COMPUTER FAILURE OR MALFUNCTI=
ON,
-OR ANY AND ALL OTHER COMMERCIAL DAMAGES OR LOSSES, EVEN IF SUCH PARTY SHAL=
L
-HAVE BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES. THIS LIMITATION OF
-LIABILITY SHALL NOT APPLY TO LIABILITY FOR DEATH OR PERSONAL INJURY RESULT=
ING
-FROM SUCH PARTY'S NEGLIGENCE TO THE EXTENT APPLICABLE LAW PROHIBITS SUCH
-LIMITATION. SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF
-INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THIS EXCLUSION AND LIMITATION MAY =
NOT
-APPLY TO YOU.
-10 U.S. GOVERNMENT END USERS.
-
-11 MISCELLANEOUS.
-
-12 RESPONSIBILITY FOR CLAIMS.
-
-As between Initial Developer and the Contributors, each party is responsib=
le
-for claims and damages arising, directly or indirectly, out of its utiliza=
tion
-of rights under this License and You agree to work with Initial Developer =
and
-Contributors to distribute such responsibility on an equitable basis. Noth=
ing
-herein is intended or shall be deemed to constitute any admission of liabi=
lity.
-EXHIBIT A.
-
-"The contents of this file are subject to the gSOAP Public License Version
-1.3 (the "License"); you may not use this file except in compliance
-with the License. You may obtain a copy of the License at
-http://www.cs.fsu.edu/ engelen/soaplicense.html
-Software distributed under the License is distributed on an "AS IS"
-basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the Li=
cense
-for the specific language governing rights and limitations under the Licen=
se.
-The Original Code of the gSOAP Software is: stdsoap.h, stdsoap2.h, stdsoap=
.c,
-stdsoap2.c, stdsoap.cpp, stdsoap2.cpp, soapcpp2.h, soapcpp2.c, soapcpp2_le=
x.l,
-soapcpp2_yacc.y, error2.h, error2.c, symbol2.c, init2.c, soapdoc2.html, an=
d
-soapdoc2.pdf, httpget.h, httpget.c, stl.h, stldeque.h, stllist.h, stlvecto=
r.h,
-stlset.h.
-The Initial Developer of the Original Code is Robert A. van Engelen. Porti=
ons
-created by Robert A. van Engelen are Copyright (C) 2001-2004 Robert A. van
-Engelen, Genivia inc. All Rights Reserved.
-Contributor(s):
-"________________________."
-[Note: The text of this Exhibit A may differ slightly form the text of the
-notices in the Source Code files of the Original code. You should use the =
text
-of this Exhibit A rather than the text found in the Original Code Source C=
ode
-for Your Modifications.]
-EXHIBIT B.
-
-"Part of the software embedded in this product is gSOAP software.
-Portions created by gSOAP are Copyright (C) 2001-2009 Robert A. van Engele=
n,
-Genivia inc. All Rights Reserved.
-THE SOFTWARE IN THIS PRODUCT WAS IN PART PROVIDED BY GENIVIA INC AND ANY
-EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIREC=
T,
-INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT N=
OT
-LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA=
, OR
-PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLI=
GENCE
-OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
-
-
-
-
-
-
diff --git a/meta/files/common-licenses/unfs3 b/meta/files/common-licenses/=
unfs3
deleted file mode 100644
index 7f2b53f167..0000000000
--- a/meta/files/common-licenses/unfs3
+++ /dev/null
@@ -1,24 +0,0 @@
-UNFS3 user-space NFSv3 server
-(C) 2003, Pascal Schmidt <unfs3-server@ewetel.net>
-
-Redistribution and use in source and binary forms, with or without
-modification, are permitted provided that the following conditions are met=
:
-
-1. Redistributions of source code must retain the above copyright notice,
-   this list of conditions and the following disclaimer.
-2. Redistributions in binary form must reproduce the above copyright notic=
e,
-   this list of conditions and the following disclaimer in the documentati=
on
-   and/or other materials provided with the distribution.
-3. The name of the author may not be used to endorse or promote products
-   derived from this software without specific prior written permission.
-
-THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLI=
ED
-WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
-EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED T=
O,
-PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS=
;
-OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

