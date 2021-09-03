Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.4092.1630705239398164834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 14:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=IkwHvdkz;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1630705239;
  x=1662241239;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gX3OwI4iqPobb/KhIlu6Y9b7hYmsUERNcy9/rkF9ysM=;
  b=IkwHvdkzukA4A9Eud8019+cbNxo+ZS2nXu+ZzQTDEHR+2P11yQzPZnFz
   QLpRo+M1j/xxP3lIZMW1tArFN/Jopo8dU2JGE53Swz9xpysnL79L6Uh3S
   TaF5cXP2zGcEW4tQg6JYuNemw06v6A0astH1ygfz43LxerYvQVzrfYv7p
   JZ+Zo6tnmUehw3Hy0ZHlKLuMnYpvmhuxXgq85oJE/Qy5wmBM6zY64ndL2
   W8XNrIhCGKtRvRaw9J7KNW1b2etzi7OywCKpGO65BQk1WJIa8Ipqygdmo
   cKrKcRNoAVKuBG99kLlm0immWzMeRMhsm5akc/ZXnpuaYWuTZAb7vgO3f
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] common-licenses, licenses.conf: Remove duplicate licenses
Date: Fri, 3 Sep 2021 23:40:14 +0200
Message-ID: <20210903214014.7093-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This removes BSD-0-Clause, Nauman, tcl and vim and adds mappings for
them to their SPDX counterparts (0BSD, Naumen, TCL and Vim).

It also removes FreeType, which already had a mapping to FTL.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

In case anyone is interested, the following command (executed in
meta/files/common-licenses) can be used to list all licenses that are
not present in spdx-licenses.json:

  ls | grep -Ev "^($(sed -nre 's/.*"licenseId": "(.*)".*/\1/p' ../../files/spdx-licenses.json | sort | tr '\n' '|'))\$"

 meta/conf/licenses.conf                 |  30 +++--
 meta/files/common-licenses/BSD-0-Clause |  12 --
 meta/files/common-licenses/FreeType     | 170 ------------------------
 meta/files/common-licenses/Nauman       |  50 -------
 meta/files/common-licenses/tcl          |  40 ------
 meta/files/common-licenses/vim          |  81 -----------
 6 files changed, 18 insertions(+), 365 deletions(-)
 delete mode 100644 meta/files/common-licenses/BSD-0-Clause
 delete mode 100644 meta/files/common-licenses/FreeType
 delete mode 100644 meta/files/common-licenses/Nauman
 delete mode 100644 meta/files/common-licenses/tcl
 delete mode 100644 meta/files/common-licenses/vim

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index e2bd58f84a..991fb6cc23 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -19,6 +19,9 @@ SPDXLICENSEMAP[AGPLv3.0+] = "AGPL-3.0-or-later"
 SPDXLICENSEMAP[AGPL-3.0] = "AGPL-3.0-only"
 SPDXLICENSEMAP[AGPL-3.0+] = "AGPL-3.0-or-later"
 
+# BSD variations
+SPDXLICENSEMAP[BSD-0-Clause] = "0BSD"
+
 # GPL variations
 SPDXLICENSEMAP[GPL-1] = "GPL-1.0-only"
 SPDXLICENSEMAP[GPL-1+] = "GPL-1.0-or-later"
@@ -45,7 +48,7 @@ SPDXLICENSEMAP[GPLv3.0+] = "GPL-3.0-or-later"
 SPDXLICENSEMAP[GPL-3.0] = "GPL-3.0-only"
 SPDXLICENSEMAP[GPL-3.0+] = "GPL-3.0-or-later"
 
-#LGPL variations
+# LGPL variations
 SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0-only"
 SPDXLICENSEMAP[LGPLv2+] = "LGPL-2.0-or-later"
 SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0-only"
@@ -63,49 +66,52 @@ SPDXLICENSEMAP[LGPLv3+] = "LGPL-3.0-or-later"
 SPDXLICENSEMAP[LGPL-3.0] = "LGPL-3.0-only"
 SPDXLICENSEMAP[LGPL-3.0+] = "LGPL-3.0-or-later"
 
-#MPL variations
+# MPL variations
 SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
 SPDXLICENSEMAP[MPLv1] = "MPL-1.0"
 SPDXLICENSEMAP[MPLv1.1] = "MPL-1.1"
 SPDXLICENSEMAP[MPLv2] = "MPL-2.0"
 
-#MIT variations
+# MIT variations
 SPDXLICENSEMAP[MIT-X] = "MIT"
 SPDXLICENSEMAP[MIT-style] = "MIT"
 
-#Openssl variations
+# Openssl variations
 SPDXLICENSEMAP[openssl] = "OpenSSL"
 
-#PSF variations
+# PSF variations
 SPDXLICENSEMAP[PSF] = "PSF-2.0"
 SPDXLICENSEMAP[PSFv2] = "PSF-2.0"
 
-#Python variations
+# Python variations
 SPDXLICENSEMAP[Python-2] = "Python-2.0"
 
-#Apache variations
+# Apache variations
 SPDXLICENSEMAP[Apachev2] = "Apache-2.0"
 SPDXLICENSEMAP[Apache-2] = "Apache-2.0"
 
-#Artistic variations
+# Artistic variations
 SPDXLICENSEMAP[Artisticv1] = "Artistic-1.0"
 SPDXLICENSEMAP[Artistic-1] = "Artistic-1.0"
 
-#Academic variations
+# Academic variations
 SPDXLICENSEMAP[AFL-2] = "AFL-2.0"
 SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
 SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
 SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
 
-#CDDL variations
+# CDDL variations
 SPDXLICENSEMAP[CDDLv1] = "CDDL-1.0"
 SPDXLICENSEMAP[CDDL-1] = "CDDL-1.0"
 
-#Other variations
+# Other variations
 SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
 SPDXLICENSEMAP[FreeType] = "FTL"
+SPDXLICENSEMAP[Nauman] = "Naumen"
+SPDXLICENSEMAP[tcl] = "TCL"
+SPDXLICENSEMAP[vim] = "Vim"
 
-#Silicon Graphics variations
+# Silicon Graphics variations
 SPDXLICENSEMAP[SGIv1] = "SGI-1"
 
 # Additional license directories. Add your custom licenses directories this path.
diff --git a/meta/files/common-licenses/BSD-0-Clause b/meta/files/common-licenses/BSD-0-Clause
deleted file mode 100644
index 328bdd6aee..0000000000
--- a/meta/files/common-licenses/BSD-0-Clause
+++ /dev/null
@@ -1,12 +0,0 @@
-Copyright (C) <YEAR> by <OWNER>
-
-Permission to use, copy, modify, and/or distribute this software for any
-purpose with or without fee is hereby granted.
-
-THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
-WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
-MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
-ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
-ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
-OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/FreeType b/meta/files/common-licenses/FreeType
deleted file mode 100644
index 3666649f3e..0000000000
--- a/meta/files/common-licenses/FreeType
+++ /dev/null
@@ -1,170 +0,0 @@
-                    The FreeType Project LICENSE
-                    ----------------------------
-
-                            2006-Jan-27
-
-                    Copyright 1996-2002, 2006 by
-          David Turner, Robert Wilhelm, and Werner Lemberg
-
-
-
-Introduction
-============
-
-  The FreeType  Project is distributed in  several archive packages;
-  some of them may contain, in addition to the FreeType font engine,
-  various tools and  contributions which rely on, or  relate to, the
-  FreeType Project.
-
-  This  license applies  to all  files found  in such  packages, and
-  which do not  fall under their own explicit  license.  The license
-  affects  thus  the  FreeType   font  engine,  the  test  programs,
-  documentation and makefiles, at the very least.
-
-  This  license   was  inspired  by  the  BSD,   Artistic,  and  IJG
-  (Independent JPEG  Group) licenses, which  all encourage inclusion
-  and  use of  free  software in  commercial  and freeware  products
-  alike.  As a consequence, its main points are that:
-
-    o We don't promise that this software works. However, we will be
-      interested in any kind of bug reports. (`as is' distribution)
-
-    o You can  use this software for whatever you  want, in parts or
-      full form, without having to pay us. (`royalty-free' usage)
-
-    o You may not pretend that  you wrote this software.  If you use
-      it, or  only parts of it,  in a program,  you must acknowledge
-      somewhere  in  your  documentation  that  you  have  used  the
-      FreeType code. (`credits')
-
-  We  specifically  permit  and  encourage  the  inclusion  of  this
-  software, with  or without modifications,  in commercial products.
-  We  disclaim  all warranties  covering  The  FreeType Project  and
-  assume no liability related to The FreeType Project.
-
-
-  Finally,  many  people  asked  us  for  a  preferred  form  for  a
-  credit/disclaimer to use in compliance with this license.  We thus
-  encourage you to use the following text:
-
-   """  
-    Portions of this software are copyright © <year> The FreeType
-    Project (www.freetype.org).  All rights reserved.
-   """
-
-  Please replace <year> with the value from the FreeType version you
-  actually use.
-
-
-Legal Terms
-===========
-
-0. Definitions
---------------
-
-  Throughout this license,  the terms `package', `FreeType Project',
-  and  `FreeType  archive' refer  to  the  set  of files  originally
-  distributed  by the  authors  (David Turner,  Robert Wilhelm,  and
-  Werner Lemberg) as the `FreeType Project', be they named as alpha,
-  beta or final release.
-
-  `You' refers to  the licensee, or person using  the project, where
-  `using' is a generic term including compiling the project's source
-  code as  well as linking it  to form a  `program' or `executable'.
-  This  program is  referred to  as  `a program  using the  FreeType
-  engine'.
-
-  This  license applies  to all  files distributed  in  the original
-  FreeType  Project,   including  all  source   code,  binaries  and
-  documentation,  unless  otherwise  stated   in  the  file  in  its
-  original, unmodified form as  distributed in the original archive.
-  If you are  unsure whether or not a particular  file is covered by
-  this license, you must contact us to verify this.
-
-  The FreeType  Project is copyright (C) 1996-2000  by David Turner,
-  Robert Wilhelm, and Werner Lemberg.  All rights reserved except as
-  specified below.
-
-1. No Warranty
---------------
-
-  THE FREETYPE PROJECT  IS PROVIDED `AS IS' WITHOUT  WARRANTY OF ANY
-  KIND, EITHER  EXPRESS OR IMPLIED,  INCLUDING, BUT NOT  LIMITED TO,
-  WARRANTIES  OF  MERCHANTABILITY   AND  FITNESS  FOR  A  PARTICULAR
-  PURPOSE.  IN NO EVENT WILL ANY OF THE AUTHORS OR COPYRIGHT HOLDERS
-  BE LIABLE  FOR ANY DAMAGES CAUSED  BY THE USE OR  THE INABILITY TO
-  USE, OF THE FREETYPE PROJECT.
-
-2. Redistribution
------------------
-
-  This  license  grants  a  worldwide, royalty-free,  perpetual  and
-  irrevocable right  and license to use,  execute, perform, compile,
-  display,  copy,   create  derivative  works   of,  distribute  and
-  sublicense the  FreeType Project (in  both source and  object code
-  forms)  and  derivative works  thereof  for  any  purpose; and  to
-  authorize others  to exercise  some or all  of the  rights granted
-  herein, subject to the following conditions:
-
-    o Redistribution of  source code  must retain this  license file
-      (`FTL.TXT') unaltered; any  additions, deletions or changes to
-      the original  files must be clearly  indicated in accompanying
-      documentation.   The  copyright   notices  of  the  unaltered,
-      original  files must  be  preserved in  all  copies of  source
-      files.
-
-    o Redistribution in binary form must provide a  disclaimer  that
-      states  that  the software is based in part of the work of the
-      FreeType Team,  in  the  distribution  documentation.  We also
-      encourage you to put an URL to the FreeType web page  in  your
-      documentation, though this isn't mandatory.
-
-  These conditions  apply to any  software derived from or  based on
-  the FreeType Project,  not just the unmodified files.   If you use
-  our work, you  must acknowledge us.  However, no  fee need be paid
-  to us.
-
-3. Advertising
---------------
-
-  Neither the  FreeType authors and  contributors nor you  shall use
-  the name of the  other for commercial, advertising, or promotional
-  purposes without specific prior written permission.
-
-  We suggest,  but do not require, that  you use one or  more of the
-  following phrases to refer  to this software in your documentation
-  or advertising  materials: `FreeType Project',  `FreeType Engine',
-  `FreeType library', or `FreeType Distribution'.
-
-  As  you have  not signed  this license,  you are  not  required to
-  accept  it.   However,  as  the FreeType  Project  is  copyrighted
-  material, only  this license, or  another one contracted  with the
-  authors, grants you  the right to use, distribute,  and modify it.
-  Therefore,  by  using,  distributing,  or modifying  the  FreeType
-  Project, you indicate that you understand and accept all the terms
-  of this license.
-
-4. Contacts
------------
-
-  There are two mailing lists related to FreeType:
-
-    o freetype@nongnu.org
-
-      Discusses general use and applications of FreeType, as well as
-      future and  wanted additions to the  library and distribution.
-      If  you are looking  for support,  start in  this list  if you
-      haven't found anything to help you in the documentation.
-
-    o freetype-devel@nongnu.org
-
-      Discusses bugs,  as well  as engine internals,  design issues,
-      specific licenses, porting, etc.
-
-  Our home page can be found at
-
-    https://www.freetype.org
-
-
---- end of FTL.TXT ---
-
diff --git a/meta/files/common-licenses/Nauman b/meta/files/common-licenses/Nauman
deleted file mode 100644
index 69ce785ff3..0000000000
--- a/meta/files/common-licenses/Nauman
+++ /dev/null
@@ -1,50 +0,0 @@
-
-NAUMEN Public License
-This software is Copyright (c) NAUMEN (tm) and Contributors.
-All rights reserved.
-
-Redistribution and use in source and binary forms, with or
-without modification, are permitted provided that the following
-conditions are met:
-
-1. Redistributions in source code must retain the above
-copyright notice, this list of conditions, and the following
-disclaimer.
-
-2. Redistributions in binary form must reproduce the above
-copyright notice, this list of conditions, and the following
-disclaimer in the documentation and/or other materials
-provided with the distribution.
-
-3. The name NAUMEN (tm) must not be used to
-endorse or promote products derived from this software without prior
-written permission from NAUMEN.
-
-4. The right to distribute this software or to use it for any
-purpose does not give you the right to use Servicemarks (sm)
-or Trademarks (tm) of NAUMEN.
-
-5. If any files originating from NAUMEN or Contributors are modified, you must
-cause the modified files to carry prominent notices stating
-that you changed the files and the date of any change.
-
-Disclaimer:
-
-THIS SOFTWARE IS PROVIDED BY NAUMEN "AS IS" AND ANY EXPRESSED
-OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL NAUMEN
-OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
-GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
-DAMAGE.
-
-This software consists of contributions made by NAUMEN
-and Contributors. Specific attributions are listed in the
-accompanying credits file.
-
diff --git a/meta/files/common-licenses/tcl b/meta/files/common-licenses/tcl
deleted file mode 100644
index d8049cd9e7..0000000000
--- a/meta/files/common-licenses/tcl
+++ /dev/null
@@ -1,40 +0,0 @@
-This software is copyrighted by the Regents of the University of
-California, Sun Microsystems, Inc., Scriptics Corporation, ActiveState
-Corporation and other parties.  The following terms apply to all files
-associated with the software unless explicitly disclaimed in
-individual files.
-
-The authors hereby grant permission to use, copy, modify, distribute,
-and license this software and its documentation for any purpose, provided
-that existing copyright notices are retained in all copies and that this
-notice is included verbatim in any distributions. No written agreement,
-license, or royalty fee is required for any of the authorized uses.
-Modifications to this software may be copyrighted by their authors
-and need not follow the licensing terms described here, provided that
-the new terms are clearly indicated on the first page of each file where
-they apply.
-
-IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY
-FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
-ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
-DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED OF THE
-POSSIBILITY OF SUCH DAMAGE.
-
-THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
-INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
-FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
-IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE
-NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
-MODIFICATIONS.
-
-GOVERNMENT USE: If you are acquiring this software on behalf of the
-U.S. government, the Government shall have only "Restricted Rights"
-in the software and related documentation as defined in the Federal
-Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
-are acquiring the software on behalf of the Department of Defense, the
-software shall be classified as "Commercial Computer Software" and the
-Government shall have only "Restricted Rights" as defined in Clause
-252.227-7014 (b) (3) of DFARs.  Notwithstanding the foregoing, the
-authors grant the U.S. Government and others acting in its behalf
-permission to use and distribute the software in accordance with the
-terms specified in this license.
diff --git a/meta/files/common-licenses/vim b/meta/files/common-licenses/vim
deleted file mode 100644
index 4aa818eb24..0000000000
--- a/meta/files/common-licenses/vim
+++ /dev/null
@@ -1,81 +0,0 @@
-VIM LICENSE
-
-I)  There are no restrictions on distributing unmodified copies of Vim except
-    that they must include this license text.  You can also distribute
-    unmodified parts of Vim, likewise unrestricted except that they must
-    include this license text.  You are also allowed to include executables
-    that you made from the unmodified Vim sources, plus your own usage
-    examples and Vim scripts.
-
-II) It is allowed to distribute a modified (or extended) version of Vim,
-    including executables and/or source code, when the following four
-    conditions are met:
-    1) This license text must be included unmodified.
-    2) The modified Vim must be distributed in one of the following five ways:
-       a) If you make changes to Vim yourself, you must clearly describe in
-	  the distribution how to contact you.  When the maintainer asks you
-	  (in any way) for a copy of the modified Vim you distributed, you
-	  must make your changes, including source code, available to the
-	  maintainer without fee.  The maintainer reserves the right to
-	  include your changes in the official version of Vim.  What the
-	  maintainer will do with your changes and under what license they
-	  will be distributed is negotiable.  If there has been no negotiation
-	  then this license, or a later version, also applies to your changes.
-	  The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
-	  changes it will be announced in appropriate places (most likely
-	  vim.sf.net, www.vim.org and/or comp.editors).  When it is completely
-	  impossible to contact the maintainer, the obligation to send him
-	  your changes ceases.  Once the maintainer has confirmed that he has
-	  received your changes they will not have to be sent again.
-       b) If you have received a modified Vim that was distributed as
-	  mentioned under a) you are allowed to further distribute it
-	  unmodified, as mentioned at I).  If you make additional changes the
-	  text under a) applies to those changes.
-       c) Provide all the changes, including source code, with every copy of
-	  the modified Vim you distribute.  This may be done in the form of a
-	  context diff.  You can choose what license to use for new code you
-	  add.  The changes and their license must not restrict others from
-	  making their own changes to the official version of Vim.
-       d) When you have a modified Vim which includes changes as mentioned
-	  under c), you can distribute it without the source code for the
-	  changes if the following three conditions are met:
-	  - The license that applies to the changes permits you to distribute
-	    the changes to the Vim maintainer without fee or restriction, and
-	    permits the Vim maintainer to include the changes in the official
-	    version of Vim without fee or restriction.
-	  - You keep the changes for at least three years after last
-	    distributing the corresponding modified Vim.  When the maintainer
-	    or someone who you distributed the modified Vim to asks you (in
-	    any way) for the changes within this period, you must make them
-	    available to him.
-	  - You clearly describe in the distribution how to contact you.  This
-	    contact information must remain valid for at least three years
-	    after last distributing the corresponding modified Vim, or as long
-	    as possible.
-       e) When the GNU General Public License (GPL) applies to the changes,
-	  you can distribute the modified Vim under the GNU GPL version 2 or
-	  any later version.
-    3) A message must be added, at least in the output of the ":version"
-       command and in the intro screen, such that the user of the modified Vim
-       is able to see that it was modified.  When distributing as mentioned
-       under 2)e) adding the message is only required for as far as this does
-       not conflict with the license used for the changes.
-    4) The contact information as required under 2)a) and 2)d) must not be
-       removed or changed, except that the person himself can make
-       corrections.
-
-III) If you distribute a modified version of Vim, you are encouraged to use
-     the Vim license for your changes and make them available to the
-     maintainer, including the source code.  The preferred way to do this is
-     by e-mail or by uploading the files to a server and e-mailing the URL.
-     If the number of changes is small (e.g., a modified Makefile) e-mailing a
-     context diff will do.  The e-mail address to be used is
-     <maintainer@vim.org>
-
-IV)  It is not allowed to remove this license from the distribution of the Vim
-     sources, parts of it or from a modified version.  You may use this
-     license for previous Vim releases instead of the license that they came
-     with, at your option.
-
-===
-Read more about this license at http://vimdoc.sourceforge.net/htmldoc/uganda.html#license
