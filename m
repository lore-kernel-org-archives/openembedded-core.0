Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3709C44515
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:20 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1654.1784055853921531514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hkj0yfqY;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-451e2a978a3so816705fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055853; x=1784660653; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vfcs/JPUPQVmVnAhNtPZgc2cwMcCR4nr8o5cWkLM2v8=;
        b=hkj0yfqYZfhasXdvWaPHWodiZI6e+phKVa17cZcHZFFTk1xPT6lJxPCBWQB6SrTrg3
         EJkm21bBlw+3NQCvaEPedf/ub5Dhyet4Bbz6fGkFxXF1QQqP7dwFyyo6S59cwEky9rmS
         RG3wTpK3iHhpfSdA95IoNLjElUQ3UjJtJ3S1E83uGHQ7AYZGxwNI19LaVQNAUfjnnS6y
         KR9R3jsg6v9diJmg7XZw1d84iGpUr5p4dmlsVo8kErx2V9hw+QG17RTuqg8od2uu8kJm
         OeFlS9+ymCZGimcd8wlUcnmSGNf4hCoY4jsy9cCwHj2X8ez2pQaQDKBv7SJx5P5yguty
         FjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055853; x=1784660653;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vfcs/JPUPQVmVnAhNtPZgc2cwMcCR4nr8o5cWkLM2v8=;
        b=sfgPckeNmCrjIu5Gji339ukcAkc9Z3C8Mrm/kPmuOQ91BWFjuCIbBT0NPd0fJhEGq3
         0/fNGDsj+2Y2po3EVbnXizYZebxYelqudtDxF0yQ3fbT2RrnlsuYKgv68AWAvqMm1Lz7
         Hw0Xmr7fqVIJFhCvNKBvB7FgI/0G1FWGeTbbtcK8yWQuhNoS5qLfkZD0oQi+7BJXghw5
         YyuPssSm9q9L1Ah/egzFXgRYLmUO7yGyx8FI2sDeora131OTqsCDwhJpAPyCICXDYdVq
         g4Rb1BB5tLMwkwlNTIRV04d7UNp0VsFcC6TUH0WDJF9bScLUMVy7G2KA+3dzGtORdct+
         jMug==
X-Gm-Message-State: AOJu0YwQBeGClb8Cm9iNgIDxLSxCqG1hB2mVmkF6cuCNXL3u1wcV4Gqf
	r42zqKKwt4ZVIQFup3ggMYJDkqheGWJfDxvF/IdgL6jomYEHw4tMy2YUohfYWA==
X-Gm-Gg: AfdE7cniAveoSRCFwHNC4+FQo672y0wNKk8YbAXOij/pG59dsLJz9y8MLt59LjIwf0U
	LBNcS98IFm9eX+heDp9qNBsAls92jW2JHHP10G1bQxsY1BHBPiaE8IO95LQi4oWolR82GqOp7Ug
	la69AACZ68AkbgKo0ZcOuTZru3CQQkICsCweZIRdEVDNELYs5g0yJVb0kCeXm8G6ByGHfiEwE07
	fcnxLbVOGkwb30b+JAr65CLReE9lXspJ9KXEZCOTK5CoSbBYKXXXzGd4M9R5ZYn99sgDyQ2ZaQo
	rRaRuy634M2dqg8gCeWaCxjz4f1lzccF9wq28rYetmLA3U6ZndMoG0RB0V0ouUS+yyYHAy2kY7m
	xpC0KApXiXqzhGOQ+sPa1f5TYgWHTYLuAYr014cOctB6bAC+Gu2ex8ewxL9l1a5PWLgZK08lo+s
	Gg+0zHHMurflJbIwEKIhFo
X-Received: by 2002:a05:6870:5ba0:b0:451:3852:25a9 with SMTP id 586e51a60fabf-451f13c8191mr8955438fac.21.1784055850272;
        Tue, 14 Jul 2026 12:04:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:09 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 02/22] Add SPDX License Exceptions
Date: Tue, 14 Jul 2026 12:31:12 -0600
Message-ID: <20260714190405.3328796-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240912

Adds the JSON file that lists the SPDX license exceptions, as well as
the exception license files themselves.

This was done automatically using the pull-spdx-licenses.py script

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/files/common-licenses/389-exception      |   7 +
 meta/files/common-licenses/Asterisk-exception |   5 +
 .../Asterisk-linking-protocols-exception      |  13 +
 .../common-licenses/Autoconf-exception-2.0    |   5 +
 .../common-licenses/Autoconf-exception-3.0    |  26 +
 .../Autoconf-exception-generic                |   4 +
 .../Autoconf-exception-generic-3.0            |   6 +
 .../common-licenses/Autoconf-exception-macro  |  12 +
 .../common-licenses/Bison-exception-1.24      |   4 +
 .../files/common-licenses/Bison-exception-2.2 |   5 +
 .../common-licenses/Bootloader-exception      |  10 +
 .../common-licenses/CGAL-linking-exception    |   4 +
 .../files/common-licenses/CLISP-exception-2.0 |  15 +
 .../common-licenses/Classpath-exception-2.0   |   3 +
 .../Classpath-exception-2.0-short             |  11 +
 .../common-licenses/DigiRule-FOSS-exception   |  54 +
 .../Digia-Qt-LGPL-exception-1.1               |   9 +
 meta/files/common-licenses/FLTK-exception     |  17 +
 .../common-licenses/Fawkes-Runtime-exception  |   1 +
 meta/files/common-licenses/Font-exception-2.0 |   1 +
 meta/files/common-licenses/GCC-exception-2.0  |   1 +
 .../common-licenses/GCC-exception-2.0-note    |  16 +
 meta/files/common-licenses/GCC-exception-3.1  |  33 +
 meta/files/common-licenses/GNAT-exception     |   6 +
 .../common-licenses/GNOME-examples-exception  |   1 +
 .../common-licenses/GNU-compiler-exception    |   6 +
 .../GPL-3.0-389-ds-base-exception             |  10 +
 .../GPL-3.0-interface-exception               |   7 +
 .../common-licenses/GPL-3.0-linking-exception |   3 +
 .../GPL-3.0-linking-source-exception          |   3 +
 meta/files/common-licenses/GPL-CC-1.0         |  46 +
 .../common-licenses/GStreamer-exception-2005  |   1 +
 .../common-licenses/GStreamer-exception-2008  |   1 +
 meta/files/common-licenses/Gmsh-exception     |  16 +
 .../Independent-modules-exception             |  18 +
 .../common-licenses/KiCad-libraries-exception |   1 +
 .../LGPL-3.0-linking-exception                |  16 +
 meta/files/common-licenses/LLGPL              |  56 +
 meta/files/common-licenses/LLVM-exception     |  15 +
 meta/files/common-licenses/LZMA-exception     |   3 +
 meta/files/common-licenses/Libtool-exception  |   1 +
 meta/files/common-licenses/Linux-syscall-note |  12 +
 meta/files/common-licenses/OCCT-exception-1.0 |   3 +
 .../OCaml-LGPL-linking-exception              |   1 +
 .../OpenJDK-assembly-exception-1.0            |  31 +
 meta/files/common-licenses/PCRE2-exception    |   8 +
 .../PS-or-PDF-font-exception-20170817         |   8 +
 .../QPL-1.0-INRIA-2004-exception              |   5 +
 .../common-licenses/Qt-GPL-exception-1.0      |  21 +
 .../common-licenses/Qt-LGPL-exception-1.1     |  22 +
 meta/files/common-licenses/Qwt-exception-1.0  |  12 +
 .../RRDtool-FLOSS-exception-2.0               |  66 ++
 meta/files/common-licenses/SANE-exception     |  20 +
 meta/files/common-licenses/SHL-2.0            |  22 +
 meta/files/common-licenses/SHL-2.1            |  49 +
 meta/files/common-licenses/SWI-exception      |   7 +
 .../Simple-Library-Usage-exception            |  33 +
 meta/files/common-licenses/Swift-exception    |   6 +
 meta/files/common-licenses/Texinfo-exception  |   4 +
 meta/files/common-licenses/UBDL-exception     |  59 ++
 .../Universal-FOSS-exception-1.0              |  11 +
 .../common-licenses/WxWindows-exception-3.1   |   9 +
 .../cryptsetup-OpenSSL-exception              |  12 +
 meta/files/common-licenses/eCos-exception-2.0 |   3 +
 .../erlang-otp-linking-exception              |  11 +
 meta/files/common-licenses/fmt-exception      |   6 +
 .../common-licenses/freertos-exception-2.0    |  19 +
 .../common-licenses/gnu-javamail-exception    |   1 +
 meta/files/common-licenses/harbour-exception  |  23 +
 .../common-licenses/i2p-gpl-java-exception    |   1 +
 .../common-licenses/kvirc-openssl-exception   |  30 +
 .../common-licenses/libpri-OpenH323-exception |   4 +
 meta/files/common-licenses/mif-exception      |   1 +
 meta/files/common-licenses/mxml-exception     |  16 +
 .../common-licenses/openvpn-openssl-exception |   3 +
 .../files/common-licenses/polyparse-exception |   7 +
 meta/files/common-licenses/romic-exception    |   6 +
 .../common-licenses/rsync-linking-exception   |   6 +
 .../sqlitestudio-OpenSSL-exception            |   9 +
 meta/files/common-licenses/stunnel-exception  |   5 +
 .../common-licenses/u-boot-exception-2.0      |   6 +
 .../common-licenses/vsftpd-openssl-exception  |   5 +
 .../common-licenses/x11vnc-openssl-exception  |   9 +
 meta/files/spdx-exceptions.json               | 971 ++++++++++++++++++
 84 files changed, 2035 insertions(+)
 create mode 100644 meta/files/common-licenses/389-exception
 create mode 100644 meta/files/common-licenses/Asterisk-exception
 create mode 100644 meta/files/common-licenses/Asterisk-linking-protocols-e=
xception
 create mode 100644 meta/files/common-licenses/Autoconf-exception-2.0
 create mode 100644 meta/files/common-licenses/Autoconf-exception-3.0
 create mode 100644 meta/files/common-licenses/Autoconf-exception-generic
 create mode 100644 meta/files/common-licenses/Autoconf-exception-generic-3=
.0
 create mode 100644 meta/files/common-licenses/Autoconf-exception-macro
 create mode 100644 meta/files/common-licenses/Bison-exception-1.24
 create mode 100644 meta/files/common-licenses/Bison-exception-2.2
 create mode 100644 meta/files/common-licenses/Bootloader-exception
 create mode 100644 meta/files/common-licenses/CGAL-linking-exception
 create mode 100644 meta/files/common-licenses/CLISP-exception-2.0
 create mode 100644 meta/files/common-licenses/Classpath-exception-2.0
 create mode 100644 meta/files/common-licenses/Classpath-exception-2.0-short
 create mode 100644 meta/files/common-licenses/DigiRule-FOSS-exception
 create mode 100644 meta/files/common-licenses/Digia-Qt-LGPL-exception-1.1
 create mode 100644 meta/files/common-licenses/FLTK-exception
 create mode 100644 meta/files/common-licenses/Fawkes-Runtime-exception
 create mode 100644 meta/files/common-licenses/Font-exception-2.0
 create mode 100644 meta/files/common-licenses/GCC-exception-2.0
 create mode 100644 meta/files/common-licenses/GCC-exception-2.0-note
 create mode 100644 meta/files/common-licenses/GCC-exception-3.1
 create mode 100644 meta/files/common-licenses/GNAT-exception
 create mode 100644 meta/files/common-licenses/GNOME-examples-exception
 create mode 100644 meta/files/common-licenses/GNU-compiler-exception
 create mode 100644 meta/files/common-licenses/GPL-3.0-389-ds-base-exception
 create mode 100644 meta/files/common-licenses/GPL-3.0-interface-exception
 create mode 100644 meta/files/common-licenses/GPL-3.0-linking-exception
 create mode 100644 meta/files/common-licenses/GPL-3.0-linking-source-excep=
tion
 create mode 100644 meta/files/common-licenses/GPL-CC-1.0
 create mode 100644 meta/files/common-licenses/GStreamer-exception-2005
 create mode 100644 meta/files/common-licenses/GStreamer-exception-2008
 create mode 100644 meta/files/common-licenses/Gmsh-exception
 create mode 100644 meta/files/common-licenses/Independent-modules-exception
 create mode 100644 meta/files/common-licenses/KiCad-libraries-exception
 create mode 100644 meta/files/common-licenses/LGPL-3.0-linking-exception
 create mode 100644 meta/files/common-licenses/LLGPL
 create mode 100644 meta/files/common-licenses/LLVM-exception
 create mode 100644 meta/files/common-licenses/LZMA-exception
 create mode 100644 meta/files/common-licenses/Libtool-exception
 create mode 100644 meta/files/common-licenses/Linux-syscall-note
 create mode 100644 meta/files/common-licenses/OCCT-exception-1.0
 create mode 100644 meta/files/common-licenses/OCaml-LGPL-linking-exception
 create mode 100644 meta/files/common-licenses/OpenJDK-assembly-exception-1=
.0
 create mode 100644 meta/files/common-licenses/PCRE2-exception
 create mode 100644 meta/files/common-licenses/PS-or-PDF-font-exception-201=
70817
 create mode 100644 meta/files/common-licenses/QPL-1.0-INRIA-2004-exception
 create mode 100644 meta/files/common-licenses/Qt-GPL-exception-1.0
 create mode 100644 meta/files/common-licenses/Qt-LGPL-exception-1.1
 create mode 100644 meta/files/common-licenses/Qwt-exception-1.0
 create mode 100644 meta/files/common-licenses/RRDtool-FLOSS-exception-2.0
 create mode 100644 meta/files/common-licenses/SANE-exception
 create mode 100644 meta/files/common-licenses/SHL-2.0
 create mode 100644 meta/files/common-licenses/SHL-2.1
 create mode 100644 meta/files/common-licenses/SWI-exception
 create mode 100644 meta/files/common-licenses/Simple-Library-Usage-excepti=
on
 create mode 100644 meta/files/common-licenses/Swift-exception
 create mode 100644 meta/files/common-licenses/Texinfo-exception
 create mode 100644 meta/files/common-licenses/UBDL-exception
 create mode 100644 meta/files/common-licenses/Universal-FOSS-exception-1.0
 create mode 100644 meta/files/common-licenses/WxWindows-exception-3.1
 create mode 100644 meta/files/common-licenses/cryptsetup-OpenSSL-exception
 create mode 100644 meta/files/common-licenses/eCos-exception-2.0
 create mode 100644 meta/files/common-licenses/erlang-otp-linking-exception
 create mode 100644 meta/files/common-licenses/fmt-exception
 create mode 100644 meta/files/common-licenses/freertos-exception-2.0
 create mode 100644 meta/files/common-licenses/gnu-javamail-exception
 create mode 100644 meta/files/common-licenses/harbour-exception
 create mode 100644 meta/files/common-licenses/i2p-gpl-java-exception
 create mode 100644 meta/files/common-licenses/kvirc-openssl-exception
 create mode 100644 meta/files/common-licenses/libpri-OpenH323-exception
 create mode 100644 meta/files/common-licenses/mif-exception
 create mode 100644 meta/files/common-licenses/mxml-exception
 create mode 100644 meta/files/common-licenses/openvpn-openssl-exception
 create mode 100644 meta/files/common-licenses/polyparse-exception
 create mode 100644 meta/files/common-licenses/romic-exception
 create mode 100644 meta/files/common-licenses/rsync-linking-exception
 create mode 100644 meta/files/common-licenses/sqlitestudio-OpenSSL-excepti=
on
 create mode 100644 meta/files/common-licenses/stunnel-exception
 create mode 100644 meta/files/common-licenses/u-boot-exception-2.0
 create mode 100644 meta/files/common-licenses/vsftpd-openssl-exception
 create mode 100644 meta/files/common-licenses/x11vnc-openssl-exception
 create mode 100644 meta/files/spdx-exceptions.json

diff --git a/meta/files/common-licenses/389-exception b/meta/files/common-l=
icenses/389-exception
new file mode 100644
index 0000000000..fe5bff900a
--- /dev/null
+++ b/meta/files/common-licenses/389-exception
@@ -0,0 +1,7 @@
+This Program is free software; you can redistribute it and/or modify it un=
der the terms of the GNU General Public License as published by the Free So=
ftware Foundation; version 2 of the License.
+
+This Program is distributed in the hope that it will be useful, but WITHOU=
T ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FIT=
NESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more =
details.
+
+You should have received a copy of the GNU General Public License along wi=
th this Program; if not, write to the Free Software Foundation, Inc., 59 Te=
mple Place, Suite 330, Boston, MA 02111-1307 USA.
+
+In addition, as a special exception, Red Hat, Inc. gives You the additiona=
l right to link the code of this Program with code not covered under the GN=
U General Public License ("Non-GPL Code") and to distribute linked combinat=
ions including the two, subject to the limitations in this paragraph. Non-G=
PL Code permitted under this exception must only link to the code of this P=
rogram through those well defined interfaces identified in the file named E=
XCEPTION found in the source code files (the "Approved Interfaces"). The fi=
les of Non-GPL Code may instantiate templates or use macros or inline funct=
ions from the Approved Interfaces without causing the resulting work to be =
covered by the GNU General Public License. Only Red Hat, Inc. may make chan=
ges or additions to the list of Approved Interfaces. You must obey the GNU =
General Public License in all respects for all of the Program code and othe=
r code used in conjunction with the Program except the Non-GPL Code covered=
 by this exception. If you modify this file, you may extend this exception =
to your version of the file, but you are not obligated to do so. If you do =
not wish to provide this exception without modification, you must delete th=
is exception statement from your version and license this file solely under=
 the GPL without exception.
diff --git a/meta/files/common-licenses/Asterisk-exception b/meta/files/com=
mon-licenses/Asterisk-exception
new file mode 100644
index 0000000000..88253f12d3
--- /dev/null
+++ b/meta/files/common-licenses/Asterisk-exception
@@ -0,0 +1,5 @@
+In addition, when this program is distributed with Asterisk in any=20
+form that would qualify as a 'combined work' or as a 'derivative work'=20
+(but not mere aggregation), you can redistribute and/or modify the=20
+combination under the terms of the license provided with that copy=20
+of Asterisk, instead of the license terms granted here.
diff --git a/meta/files/common-licenses/Asterisk-linking-protocols-exceptio=
n b/meta/files/common-licenses/Asterisk-linking-protocols-exception
new file mode 100644
index 0000000000..6705829f47
--- /dev/null
+++ b/meta/files/common-licenses/Asterisk-linking-protocols-exception
@@ -0,0 +1,13 @@
+Specific permission is also granted to link Asterisk with OpenSSL, OpenH323
+UniMRCP, and/or the UW IMAP Toolkit and distribute the resulting binary fi=
les.
+
+In addition, Asterisk implements several management/control protocols.
+This includes the Asterisk Manager Interface (AMI), the Asterisk Gateway
+Interface (AGI), and the Asterisk REST Interface (ARI). It is our belief
+that applications using these protocols to manage or control an Asterisk
+instance do not have to be licensed under the GPL or a compatible license,
+as we believe these protocols do not create a 'derivative work' as referred
+to in the GPL. However, should any court or other judiciary body find that
+these protocols do fall under the terms of the GPL, then we hereby grant y=
ou a
+license to use these protocols in combination with Asterisk in external
+applications licensed under any license you wish.
diff --git a/meta/files/common-licenses/Autoconf-exception-2.0 b/meta/files=
/common-licenses/Autoconf-exception-2.0
new file mode 100644
index 0000000000..00cddeba4d
--- /dev/null
+++ b/meta/files/common-licenses/Autoconf-exception-2.0
@@ -0,0 +1,5 @@
+As a special exception, the Free Software Foundation gives unlimited permi=
ssion to copy, distribute and modify the configure scripts that are the out=
put of Autoconf. You need not follow the terms of the GNU General Public Li=
cense when using or distributing such scripts, even though portions of the =
text of Autoconf appear in them. The GNU General Public License (GPL) does =
govern all other use of the material that constitutes the Autoconf program.
+
+Certain portions of the Autoconf source text are designed to be copied (in=
 certain cases, depending on the input) into the output of Autoconf. We cal=
l these the "data" portions. The rest of the Autoconf source text consists =
of comments plus executable code that decides which of the data portions to=
 output in any given case. We call these comments and executable code the "=
non-data" portions. Autoconf never copies any of the non-data portions into=
 its output.
+
+This special exception to the GPL applies to versions of Autoconf released=
 by the Free Software Foundation. When you make and distribute a modified v=
ersion of Autoconf, you may extend this special exception to the GPL to app=
ly to your modified version as well, *unless* your modified version has the=
 potential to copy into its output some of the text that was the non-data p=
ortion of the version that you started with. (In other words, unless your c=
hange moves or copies text from the non-data portions to the data portions.=
) If your modification has such potential, you must delete any notice of th=
is special exception to the GPL from your modified version.
diff --git a/meta/files/common-licenses/Autoconf-exception-3.0 b/meta/files=
/common-licenses/Autoconf-exception-3.0
new file mode 100644
index 0000000000..f212f9c7bc
--- /dev/null
+++ b/meta/files/common-licenses/Autoconf-exception-3.0
@@ -0,0 +1,26 @@
+AUTOCONF CONFIGURE SCRIPT EXCEPTION
+
+Version 3.0, 18 August 2009
+Copyright =C2=A9 2009 Free Software Foundation, Inc. <http://fsf.org/>
+
+Everyone is permitted to copy and distribute verbatim copies of this licen=
se document, but changing it is not allowed.
+
+This Exception is an additional permission under section 7 of the GNU Gene=
ral Public License, version 3 ("GPLv3"). It applies to a given file that be=
ars a notice placed by the copyright holder of the file stating that the fi=
le is governed by GPLv3 along with this Exception.
+
+The purpose of this Exception is to allow distribution of Autoconf's typic=
al output under terms of the recipient's choice (including proprietary).
+
+0. Definitions.
+
+"Covered Code" is the source or object code of a version of Autoconf that =
is a covered work under this License.
+
+"Normally Copied Code" for a version of Autoconf means all parts of its Co=
vered Code which that version can copy from its code (i.e., not from its in=
put file) into its minimally verbose, non-debugging and non-tracing output.
+
+"Ineligible Code" is Covered Code that is not Normally Copied Code.
+
+1. Grant of Additional Permission.
+
+You have permission to propagate output of Autoconf, even if such propagat=
ion would otherwise violate the terms of GPLv3. However, if by modifying Au=
toconf you cause any Ineligible Code of the version you received to become =
Normally Copied Code of your modified version, then you void this Exception=
 for the resulting covered work. If you convey that resulting covered work,=
 you must remove this Exception in accordance with the second paragraph of =
Section 7 of GPLv3.
+
+2. No Weakening of Autoconf Copyleft.
+
+The availability of this Exception does not imply any general presumption =
that third-party software is unaffected by the copyleft requirements of the=
 license of Autoconf.
diff --git a/meta/files/common-licenses/Autoconf-exception-generic b/meta/f=
iles/common-licenses/Autoconf-exception-generic
new file mode 100644
index 0000000000..b39f827673
--- /dev/null
+++ b/meta/files/common-licenses/Autoconf-exception-generic
@@ -0,0 +1,4 @@
+As a special exception to the GNU General Public License,=20
+if you distribute this file as part of a program that contains=20
+a configuration script generated by Autoconf, you may include=20
+it under the same distribution terms that you use for the rest of that pro=
gram.
diff --git a/meta/files/common-licenses/Autoconf-exception-generic-3.0 b/me=
ta/files/common-licenses/Autoconf-exception-generic-3.0
new file mode 100644
index 0000000000..2d3036772c
--- /dev/null
+++ b/meta/files/common-licenses/Autoconf-exception-generic-3.0
@@ -0,0 +1,6 @@
+As a special exception to the GNU General Public License, if you=20
+distribute this file as part of a program that contains a=20=20
+configuration script generated by Autoconf, you may include it under=20=20
+the same distribution terms that you use for the rest of that=20
+program.  This Exception is an additional permission under section 7=20=20
+of the GNU General Public License, version 3 ("GPLv3").
diff --git a/meta/files/common-licenses/Autoconf-exception-macro b/meta/fil=
es/common-licenses/Autoconf-exception-macro
new file mode 100644
index 0000000000..8b5b4677f3
--- /dev/null
+++ b/meta/files/common-licenses/Autoconf-exception-macro
@@ -0,0 +1,12 @@
+As a special exception, the respective Autoconf Macro's copyright owner
+gives unlimited permission to copy, distribute and modify the configure
+scripts that are the output of Autoconf when processing the Macro. You
+need not follow the terms of the GNU General Public License when using
+or distributing such scripts, even though portions of the text of the
+Macro appear in them. The GNU General Public License (GPL) does govern
+all other use of the material that constitutes the Autoconf Macro.
+
+This special exception to the GPL applies to versions of the Autoconf
+Macro released by the Autoconf Archive. When you make and distribute a
+modified version of the Autoconf Macro, you may extend this special
+exception to the GPL to apply to your modified version as well.
diff --git a/meta/files/common-licenses/Bison-exception-1.24 b/meta/files/c=
ommon-licenses/Bison-exception-1.24
new file mode 100644
index 0000000000..7f3c3009ee
--- /dev/null
+++ b/meta/files/common-licenses/Bison-exception-1.24
@@ -0,0 +1,4 @@
+As a special exception, when this file is copied by Bison into a
+Bison output file, you may use that output file without restriction.
+This special exception was added by the Free Software Foundation
+in version 1.24 of Bison.
diff --git a/meta/files/common-licenses/Bison-exception-2.2 b/meta/files/co=
mmon-licenses/Bison-exception-2.2
new file mode 100644
index 0000000000..91140decee
--- /dev/null
+++ b/meta/files/common-licenses/Bison-exception-2.2
@@ -0,0 +1,5 @@
+Bison Exception
+
+As a special exception, you may create a larger work that contains part or=
 all of the Bison parser skeleton and distribute that work under terms of y=
our choice, so long as that work isn't itself a parser generator using the =
skeleton or a modified version thereof as a parser skeleton. Alternatively,=
 if you modify or redistribute the parser skeleton itself, you may (at your=
 option) remove this special exception, which will cause the skeleton and t=
he resulting Bison output files to be licensed under the GNU General Public=
 License without this special exception.
+
+This special exception was added by the Free Software Foundation in versio=
n 2.2 of Bison.
diff --git a/meta/files/common-licenses/Bootloader-exception b/meta/files/c=
ommon-licenses/Bootloader-exception
new file mode 100644
index 0000000000..c557826705
--- /dev/null
+++ b/meta/files/common-licenses/Bootloader-exception
@@ -0,0 +1,10 @@
+Bootloader Exception
+--------------------
+
+In addition to the permissions in the GNU General Public License, the
+authors give you unlimited permission to link or embed compiled bootloader
+and related files into combinations with other programs, and to distribute
+those combinations without any restriction coming from the use of those
+files. (The General Public License restrictions do apply in other respects;
+for example, they cover modification of the files, and distribution when
+not linked into a combine executable.)
diff --git a/meta/files/common-licenses/CGAL-linking-exception b/meta/files=
/common-licenses/CGAL-linking-exception
new file mode 100644
index 0000000000..c6dbd55ca6
--- /dev/null
+++ b/meta/files/common-licenses/CGAL-linking-exception
@@ -0,0 +1,4 @@
+As a special exception, you have permission to link this library
+with the CGAL library (http://www.cgal.org) and distribute executables,
+as long as you follow the requirements of the GNU GPL in regard to
+all of the software in the executable aside from CGAL.
diff --git a/meta/files/common-licenses/CLISP-exception-2.0 b/meta/files/co=
mmon-licenses/CLISP-exception-2.0
new file mode 100644
index 0000000000..9c981f9b97
--- /dev/null
+++ b/meta/files/common-licenses/CLISP-exception-2.0
@@ -0,0 +1,15 @@
+Summary:
+
+This program is free software; you can redistribute it and/or modify it un=
der the terms of the GNU General Public License version 2 as published by t=
he Free Software Foundation; see file GNU-GPL.
+
+This program is distributed in the hope that it will be useful, but WITHOU=
T ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FIT=
NESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more =
details.
+
+You should have received a copy of the GNU General Public License along wi=
th this program; if not, write to the Free Software Foundation, Inc., 51 Fr=
anklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+
+Note:
+
+This copyright does NOT cover user programs that run in CLISP and third-pa=
rty packages not part of CLISP, if a) They only reference external symbols =
in CLISP's public packages that define API also provided by many other Comm=
on Lisp implementations (namely the packages COMMON-LISP, COMMON-LISP-USER,=
 KEYWORD, CLOS, GRAY, EXT), i.e. if they don't rely on CLISP internals and =
would as well run in any other Common Lisp implementation. Or b) They only =
reference external symbols in CLISP's public packages that define API also =
provided by many other Common Lisp implementations (namely the packages COM=
MON-LISP, COMMON-LISP-USER, KEYWORD, CLOS, GRAY, EXT) and some external, no=
t CLISP specific, symbols in third-party packages that are released with so=
urce code under a GPL compatible license and that run in a great number of =
Common Lisp implementations, i.e. if they rely on CLISP internals only to t=
he extent needed for gaining some functionality also available in a great n=
umber of Common Lisp implementations. Such user programs are not covered by=
 the term """"derived work"""" used in the GNU GPL. Neither is their compil=
ed code, i.e. the result of compiling them by use of the function COMPILE-F=
ILE. We refer to such user programs as """"independent work"""".
+
+You may copy and distribute memory image files generated by the function S=
AVEINITMEM, if it was generated only from CLISP and independent work, and p=
rovided that you accompany them, in the sense of section 3 of the GNU GPL, =
with the source code of CLISP - precisely the same CLISP version that was u=
sed to build the memory image -, the source or compiled code of the user pr=
ograms needed to rebuild the memory image (source code for all the parts th=
at are not independent work, see above), and a precise description how to r=
ebuild the memory image from these.
+
+Foreign non-Lisp code that is linked with CLISP or loaded into CLISP throu=
gh dynamic linking is not exempted from this copyright. I.e. such code, whe=
n distributed for use with CLISP, must be distributed under the GPL.
diff --git a/meta/files/common-licenses/Classpath-exception-2.0 b/meta/file=
s/common-licenses/Classpath-exception-2.0
new file mode 100644
index 0000000000..1a0045415c
--- /dev/null
+++ b/meta/files/common-licenses/Classpath-exception-2.0
@@ -0,0 +1,3 @@
+Linking this library statically or dynamically with other modules is makin=
g a combined work based on this library. Thus, the terms and conditions of =
the GNU General Public License cover the whole combination.
+
+As a special exception, the copyright holders of this library give you per=
mission to link this library with independent modules to produce an executa=
ble, regardless of the license terms of these independent modules, and to c=
opy and distribute the resulting executable under terms of your choice, pro=
vided that you also meet, for each linked independent module, the terms and=
 conditions of the license of that module. An independent module is a modul=
e which is not derived from or based on this library. If you modify this li=
brary, you may extend this exception to your version of the library, but yo=
u are not obligated to do so. If you do not wish to do so, delete this exce=
ption statement from your version.
diff --git a/meta/files/common-licenses/Classpath-exception-2.0-short b/met=
a/files/common-licenses/Classpath-exception-2.0-short
new file mode 100644
index 0000000000..2e7df40484
--- /dev/null
+++ b/meta/files/common-licenses/Classpath-exception-2.0-short
@@ -0,0 +1,11 @@
+As a special exception, the copyright holders of this library give
+you permission to link this library with independent modules to
+produce an executable, regardless of the license terms of these
+independent modules, and to copy and distribute the resulting
+executable under terms of your choice, provided that you also
+meet, for each linked independent module, the terms and conditions
+of the license of that module. An independent module is a module
+which is not derived from or based on this library. If you modify
+this library, you may extend this exception to your version of
+the library, but you are not obligated to do so. If you do not
+wish to do so, delete this exception statement from your version.
diff --git a/meta/files/common-licenses/DigiRule-FOSS-exception b/meta/file=
s/common-licenses/DigiRule-FOSS-exception
new file mode 100644
index 0000000000..2fa106b38e
--- /dev/null
+++ b/meta/files/common-licenses/DigiRule-FOSS-exception
@@ -0,0 +1,54 @@
+DigiRule Solutions=E2=80=99s FOSS License Exception Terms and Conditions
+
+1. Definitions.
+
+=E2=80=9CDerivative Work=E2=80=9D means a derivative work, as defined unde=
r applicable copyright law, formed entirely from the Program and one or mor=
e FOSS Applications.
+
+=E2=80=9CFOSS Application=E2=80=9D means a free and open source software a=
pplication distributed subject to a license listed in the section below tit=
led =E2=80=9CFOSS License List.=E2=80=9D
+
+=E2=80=9CFOSS Notice=E2=80=9D means a notice placed by DigiRule Solutions =
in a copy of the Client Libraries stating that such copy of the Client Libr=
aries may be distributed under DigiRule Solutions's or FOSS License Excepti=
on.
+
+=E2=80=9CIndependent Work=E2=80=9D means portions of the Derivative Work t=
hat are not derived from the Program and can reasonably be considered indep=
endent and separate works.
+
+=E2=80=9CProgram=E2=80=9D means a copy of DigiRule Solutions=E2=80=99s Cli=
ent Libraries that contain a FOSS Notice.
+
+2. A FOSS application developer (=E2=80=9Cyou=E2=80=9D or =E2=80=9Cyour=E2=
=80=9D) may distribute a Derivative Work provided that you and the Derivati=
ve Work meet all of the following conditions:
+
+     1. You obey the GPL in all respects for the Program and all portions =
(including modifications) of the Program included in the Derivative Work (p=
rovided that this condition does not apply to Independent Works);
+
+     2. The Derivative Work does not include any work licensed under the G=
PL other than the Program;
+
+     3. You distribute Independent Works subject to a license listed in th=
e section below titled =E2=80=9CFOSS License List=E2=80=9D;
+
+     4. You distribute Independent Works in object code or executable form=
 with the complete corresponding machine-readable source code on the same m=
edium and under the same FOSS license applying to the object code or execut=
able forms;
+
+     5. All works that are aggregated with the Program or the Derivative W=
ork on a medium or volume of storage are not derivative works of the Progra=
m, Derivative Work or FOSS Application, and must reasonably be considered i=
ndependent and separate works.
+
+3. DigiRule Solutions reserves all rights not expressly granted in these t=
erms and conditions. If all of the above conditions are not met, then this =
FOSS License Exception does not apply to you or your Derivative Work.
+
+FOSS License List
+License Name Version(s)/Copyright Date
+Release Early Certified Software
+Academic Free License 2.0
+Apache Software License 1.0/1.1/2.0
+Apple Public Source License 2.0
+Artistic license From Perl 5.8.0
+BSD license =E2=80=9CJuly 22 1999=E2=80=9D
+Common Development and Distribution License (CDDL) 1.0
+Common Public License 1.0
+Eclipse Public License 1.0
+GNU Library or =E2=80=9CLesser=E2=80=9D General Public License (LGPL) 2.0/=
2.1/3.0
+Jabber Open Source License 1.0
+MIT License (As listed in file MIT-License.txt) -
+Mozilla Public License (MPL) 1.0/1.1
+Open Software License 2.0
+OpenSSL license (with original SSLeay license) =E2=80=9C2003=E2=80=9D (=E2=
=80=9C1998=E2=80=9D)
+PHP License 3.0/3.01
+Python license (CNRI Python License) -
+Python Software Foundation License 2.1.1
+Sleepycat License =E2=80=9C1999=E2=80=9D
+University of Illinois/NCSA Open Source License -
+W3C License =E2=80=9C2001=E2=80=9D
+X11 License =E2=80=9C2001=E2=80=9D
+Zlib/libpng License -
+Zope Public License 2.0
diff --git a/meta/files/common-licenses/Digia-Qt-LGPL-exception-1.1 b/meta/=
files/common-licenses/Digia-Qt-LGPL-exception-1.1
new file mode 100644
index 0000000000..66cddd38aa
--- /dev/null
+++ b/meta/files/common-licenses/Digia-Qt-LGPL-exception-1.1
@@ -0,0 +1,9 @@
+Digia Qt LGPL Exception version 1.1
+
+As a special exception to the GNU Lesser General Public License version 2.=
1,
+the object code form of a "work that uses the Library" may incorporate mat=
erial
+from a header file that is part of the Library. You may distribute such ob=
ject
+code under terms of your choice, provided that the incorporated material (=
i)
+does not exceed more than 5% of the total size of the Library; and (ii) is
+limited to numerical parameters, data structure layouts, accessors, macros,
+inline functions and templates.
diff --git a/meta/files/common-licenses/FLTK-exception b/meta/files/common-=
licenses/FLTK-exception
new file mode 100644
index 0000000000..836c954b33
--- /dev/null
+++ b/meta/files/common-licenses/FLTK-exception
@@ -0,0 +1,17 @@
+The FLTK library and included programs are provided under the terms of the=
 GNU Library General Public License (LGPL) with the following exceptions:
+
+Modifications to the FLTK configure script, config header file, and makefi=
les by themselves to support a specific platform do not constitute a modifi=
ed or derivative work.
+
+The authors do request that such modifications be contributed to the FLTK =
project - send all contributions to "fltk-bugs@fltk.org".
+
+Widgets that are subclassed from FLTK widgets do not constitute a derivati=
ve work.
+
+Static linking of applications and widgets to the FLTK library does not co=
nstitute a derivative work and does not require the author to provide sourc=
e code for the application or widget, use the shared FLTK libraries, or lin=
k their applications or widgets against a user-supplied version of FLTK.
+
+If you link the application or widget to a modified version of FLTK, then =
the changes to FLTK must be provided under the terms of the LGPL in section=
s 1, 2, and 4.
+
+You do not have to provide a copy of the FLTK license with programs that a=
re linked to the FLTK library, nor do you have to identify the FLTK license=
 in your program or documentation as required by section 6 of the LGPL.
+
+However, programs must still identify their use of FLTK. The following exa=
mple statement can be included in user documentation to satisfy this requir=
ement:
+
+[program/widget] is based in part on the work of the FLTK project (http://=
www.fltk.org).
diff --git a/meta/files/common-licenses/Fawkes-Runtime-exception b/meta/fil=
es/common-licenses/Fawkes-Runtime-exception
new file mode 100644
index 0000000000..0ec93c748b
--- /dev/null
+++ b/meta/files/common-licenses/Fawkes-Runtime-exception
@@ -0,0 +1 @@
+Linking this library statically or dynamically with other modules is makin=
g a combined work based on this library. Thus, the terms and conditions of =
the GNU General Public License cover the whole combination. As a special ex=
ception, the copyright holders of this library give you permission to link =
this library with independent modules to produce an executable, regardless =
of the license terms of these independent modules, and to copy and distribu=
te the resulting executable under terms of your choice, provided that you a=
lso meet, for each linked independent module, the terms and conditions of t=
he license of that module. An independent module is a module which is not d=
erived from or based on this library. If you modify this library, you may e=
xtend this exception to your version of the library, but you are not obliga=
ted to do so. If you do not wish to do so, delete this exception statement =
from your version. Additionally if other files instantiate templates or use=
 macros or inline functions from this file, or you compile this file and li=
nk it with other files to produce an executable, this file does not by itse=
lf cause the resulting executable to be covered by the GNU General Public L=
icense. This exception does not however invalidate any other reasons why th=
e executable file might be covered by the GNU General Public License.
diff --git a/meta/files/common-licenses/Font-exception-2.0 b/meta/files/com=
mon-licenses/Font-exception-2.0
new file mode 100644
index 0000000000..a78eeae73c
--- /dev/null
+++ b/meta/files/common-licenses/Font-exception-2.0
@@ -0,0 +1 @@
+As a special exception, if you create a document which uses this font, and=
 embed this font or unaltered portions of this font into the document, this=
 font does not by itself cause the resulting document to be covered by the =
GNU General Public License. This exception does not however invalidate any =
other reasons why the document might be covered by the GNU General Public L=
icense. If you modify this font, you may extend this exception to your vers=
ion of the font, but you are not obligated to do so. If you do not wish to =
do so, delete this exception statement from your version.
diff --git a/meta/files/common-licenses/GCC-exception-2.0 b/meta/files/comm=
on-licenses/GCC-exception-2.0
new file mode 100644
index 0000000000..642ecdd736
--- /dev/null
+++ b/meta/files/common-licenses/GCC-exception-2.0
@@ -0,0 +1 @@
+In addition to the permissions in the GNU General Public License, the Free=
 Software Foundation gives you unlimited permission to link the compiled ve=
rsion of this file into combinations with other programs, and to distribute=
 those combinations without any restriction coming from the use of this fil=
e. (The General Public License restrictions do apply in other respects; for=
 example, they cover modification of the file, and distribution when not li=
nked into a combine executable.)
diff --git a/meta/files/common-licenses/GCC-exception-2.0-note b/meta/files=
/common-licenses/GCC-exception-2.0-note
new file mode 100644
index 0000000000..654099aac0
--- /dev/null
+++ b/meta/files/common-licenses/GCC-exception-2.0-note
@@ -0,0 +1,16 @@
+ In addition to the permissions in the GNU Lesser General Public
+   License, the Free Software Foundation gives you unlimited
+   permission to link the compiled version of this file with other
+   programs, and to distribute those programs without any restriction
+   coming from the use of this file. (The GNU Lesser General Public
+   License restrictions do apply in other respects; for example, they
+   cover modification of the file, and distribution when not linked
+   into another program.)
+
+   Note that people who make modified versions of this file are not
+   obligated to grant this special exception for their modified
+   versions; it is their choice whether to do so. The GNU Lesser
+   General Public License gives permission to release a modified
+   version without this exception; this exception also makes it
+   possible to release a modified version which carries forward this
+   exception.
diff --git a/meta/files/common-licenses/GCC-exception-3.1 b/meta/files/comm=
on-licenses/GCC-exception-3.1
new file mode 100644
index 0000000000..3d8345bec5
--- /dev/null
+++ b/meta/files/common-licenses/GCC-exception-3.1
@@ -0,0 +1,33 @@
+GCC RUNTIME LIBRARY EXCEPTION
+
+Version 3.1, 31 March 2009
+
+General information: http://www.gnu.org/licenses/gcc-exception.html
+Copyright (C) 2009 Free Software Foundation, Inc. <http://fsf.org/>
+
+Everyone is permitted to copy and distribute verbatim copies of this licen=
se document, but changing it is not allowed.
+This GCC Runtime Library Exception ("Exception") is an additional permissi=
on under section 7 of the GNU General Public License, version 3 ("GPLv3"). =
It applies to a given file (the "Runtime Library") that bears a notice plac=
ed by the copyright holder of the file stating that the file is governed by=
 GPLv3 along with this Exception.
+
+When you use GCC to compile a program, GCC may combine portions of certain=
 GCC header files and runtime libraries with the compiled program. The purp=
ose of this Exception is to allow compilation of non-GPL (including proprie=
tary) programs to use, in this way, the header files and runtime libraries =
covered by this Exception.
+
+0. Definitions.
+
+A file is an "Independent Module" if it either requires the Runtime Librar=
y for execution after a Compilation Process, or makes use of an interface p=
rovided by the Runtime Library, but is not otherwise based on the Runtime L=
ibrary.
+
+"GCC" means a version of the GNU Compiler Collection, with or without modi=
fications, governed by version 3 (or a specified later version) of the GNU =
General Public License (GPL) with the option of using any subsequent versio=
ns published by the FSF.
+
+"GPL-compatible Software" is software whose conditions of propagation, mod=
ification and use would permit combination with GCC in accord with the lice=
nse of GCC.
+
+"Target Code" refers to output from any compiler for a real or virtual tar=
get processor architecture, in executable form or suitable for input to an =
assembler, loader, linker and/or execution phase. Notwithstanding that, Tar=
get Code does not include data in any format that is used as a compiler int=
ermediate representation, or used for producing a compiler intermediate rep=
resentation.
+
+The "Compilation Process" transforms code entirely represented in non-inte=
rmediate languages designed for human-written code, and/or in Java Virtual =
Machine byte code, into Target Code. Thus, for example, use of source code =
generators and preprocessors need not be considered part of the Compilation=
 Process, since the Compilation Process can be understood as starting with =
the output of the generators or preprocessors.
+
+A Compilation Process is "Eligible" if it is done using GCC, alone or with=
 other GPL-compatible software, or if it is done without using any work bas=
ed on GCC. For example, using non-GPL-compatible Software to optimize any G=
CC intermediate representations would not qualify as an Eligible Compilatio=
n Process.
+
+1. Grant of Additional Permission.
+
+You have permission to propagate a work of Target Code formed by combining=
 the Runtime Library with Independent Modules, even if such propagation wou=
ld otherwise violate the terms of GPLv3, provided that all Target Code was =
generated by Eligible Compilation Processes. You may then convey such a com=
bination under terms of your choice, consistent with the licensing of the I=
ndependent Modules.
+
+2. No Weakening of GCC Copyleft.
+
+The availability of this Exception does not imply any general presumption =
that third-party software is unaffected by the copyleft requirements of the=
 license of GCC.
diff --git a/meta/files/common-licenses/GNAT-exception b/meta/files/common-=
licenses/GNAT-exception
new file mode 100644
index 0000000000..2b5a96a62b
--- /dev/null
+++ b/meta/files/common-licenses/GNAT-exception
@@ -0,0 +1,6 @@
+As a special exception, if other files instantiate generics from this
+unit, or you link this unit with other files to produce an executable,
+this unit does not by itself cause the resulting executable to be
+covered by the GNU General Public License. This exception does not
+however invalidate any other reasons why the executable file might be
+covered by the GNU Public License.
diff --git a/meta/files/common-licenses/GNOME-examples-exception b/meta/fil=
es/common-licenses/GNOME-examples-exception
new file mode 100644
index 0000000000..0f0cd53b50
--- /dev/null
+++ b/meta/files/common-licenses/GNOME-examples-exception
@@ -0,0 +1 @@
+As a special exception, the copyright holders give you permission to copy,=
 modify, and distribute the example code contained in this document under t=
he terms of your choosing, without restriction.
diff --git a/meta/files/common-licenses/GNU-compiler-exception b/meta/files=
/common-licenses/GNU-compiler-exception
new file mode 100644
index 0000000000..684833ffb4
--- /dev/null
+++ b/meta/files/common-licenses/GNU-compiler-exception
@@ -0,0 +1,6 @@
+As a special exception, if you link this library with files
+compiled with a GNU compiler to produce an executable, this
+does not cause the resulting executable to be covered by
+the GNU General Public License. This exception does not
+however invalidate any other reasons why the executable
+file might be covered by the GNU General Public License.
diff --git a/meta/files/common-licenses/GPL-3.0-389-ds-base-exception b/met=
a/files/common-licenses/GPL-3.0-389-ds-base-exception
new file mode 100644
index 0000000000..52be470c10
--- /dev/null
+++ b/meta/files/common-licenses/GPL-3.0-389-ds-base-exception
@@ -0,0 +1,10 @@
+Additional permission under GPLv3 section 7:
+
+If you modify this Program, or any covered work, by
+linking or combining it with OpenSSL, or a modified
+version of OpenSSL licensed under the OpenSSL license
+(https://www.openssl.org/source/license.html), the licensors of this
+Program grant you additional permission to convey the resulting work.=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
+Corresponding Source for a non-source form of such a combination
+shall include the source code for the parts that are licensed
+under the OpenSSL license as well as that of the covered work.
diff --git a/meta/files/common-licenses/GPL-3.0-interface-exception b/meta/=
files/common-licenses/GPL-3.0-interface-exception
new file mode 100644
index 0000000000..a86a7fffd7
--- /dev/null
+++ b/meta/files/common-licenses/GPL-3.0-interface-exception
@@ -0,0 +1,7 @@
+Linking [name of library] statically or dynamically with other modules is =
making a combined work based on [name of library]. Thus, the terms and cond=
itions of the GNU General Public License cover the whole combination.
+
+As a special exception, the copyright holders of [name of library] give yo=
u permission to combine [name of library] program with free software progra=
ms or libraries that are released under the GNU LGPL and with independent m=
odules that communicate with [name of library] solely through the [name of =
library's interface] interface. You may copy and distribute such a system f=
ollowing the terms of the GNU GPL for [name of library] and the licenses of=
 the other code concerned, provided that you include the source code of tha=
t other code when and as the GNU GPL requires distribution of source code a=
nd provided that you do not modify the [name of library's interface] interf=
ace.
+
+Note that people who make modified versions of [name of library] are not o=
bligated to grant this special exception for their modified versions; it is=
 their choice whether to do so. The GNU General Public License gives permis=
sion to release a modified version without this exception; this exception a=
lso makes it possible to release a modified version which carries forward t=
his exception. If you modify the [name of library's interface] interface, t=
his exception does not apply to your modified version of [name of library],=
 and you must remove this exception when you distribute your modified versi=
on.
+
+This exception is an additional permission under section 7 of the GNU Gene=
ral Public License, version 3 ("GPLv3")
diff --git a/meta/files/common-licenses/GPL-3.0-linking-exception b/meta/fi=
les/common-licenses/GPL-3.0-linking-exception
new file mode 100644
index 0000000000..56096c0706
--- /dev/null
+++ b/meta/files/common-licenses/GPL-3.0-linking-exception
@@ -0,0 +1,3 @@
+Additional permission under GNU GPL version 3 section 7
+
+If you modify this Program, or any covered work, by linking or combining i=
t with [name of library] (or a modified version of that library), containin=
g parts covered by the terms of [name of library's license], the licensors =
of this Program grant you additional permission to convey the resulting wor=
k.
diff --git a/meta/files/common-licenses/GPL-3.0-linking-source-exception b/=
meta/files/common-licenses/GPL-3.0-linking-source-exception
new file mode 100644
index 0000000000..58a1d1b3a4
--- /dev/null
+++ b/meta/files/common-licenses/GPL-3.0-linking-source-exception
@@ -0,0 +1,3 @@
+Additional permission under GNU GPL version 3 section 7
+
+If you modify this Program, or any covered work, by linking or combining i=
t with [name of library] (or a modified version of that library), containin=
g parts covered by the terms of [name of library's license], the licensors =
of this Program grant you additional permission to convey the resulting wor=
k. Corresponding Source for a non-source form of such a combination shall i=
nclude the source code for the parts of [name of library] used as well as t=
hat of the covered work.
diff --git a/meta/files/common-licenses/GPL-CC-1.0 b/meta/files/common-lice=
nses/GPL-CC-1.0
new file mode 100644
index 0000000000..a687e0ddb6
--- /dev/null
+++ b/meta/files/common-licenses/GPL-CC-1.0
@@ -0,0 +1,46 @@
+GPL Cooperation Commitment
+Version 1.0
+
+Before filing or continuing to prosecute any legal proceeding or claim
+(other than a Defensive Action) arising from termination of a Covered
+License, we commit to extend to the person or entity ('you') accused
+of violating the Covered License the following provisions regarding
+cure and reinstatement, taken from GPL version 3. As used here, the
+term 'this License' refers to the specific Covered License being
+enforced.
+
+    However, if you cease all violation of this License, then your
+    license from a particular copyright holder is reinstated (a)
+    provisionally, unless and until the copyright holder explicitly
+    and finally terminates your license, and (b) permanently, if the
+    copyright holder fails to notify you of the violation by some
+    reasonable means prior to 60 days after the cessation.
+
+    Moreover, your license from a particular copyright holder is
+    reinstated permanently if the copyright holder notifies you of the
+    violation by some reasonable means, this is the first time you
+    have received notice of violation of this License (for any work)
+    from that copyright holder, and you cure the violation prior to 30
+    days after your receipt of the notice.
+
+We intend this Commitment to be irrevocable, and binding and
+enforceable against us and assignees of or successors to our
+copyrights.
+
+Definitions
+
+'Covered License' means the GNU General Public License, version 2
+(GPLv2), the GNU Lesser General Public License, version 2.1
+(LGPLv2.1), or the GNU Library General Public License, version 2
+(LGPLv2), all as published by the Free Software Foundation.
+
+'Defensive Action' means a legal proceeding or claim that We bring
+against you in response to a prior proceeding or claim initiated by
+you or your affiliate.
+
+'We' means each contributor to this repository as of the date of
+inclusion of this file, including subsidiaries of a corporate
+contributor.
+
+This work is available under a Creative Commons Attribution-ShareAlike
+4.0 International license (https://creativecommons.org/licenses/by-sa/4.0/=
).
diff --git a/meta/files/common-licenses/GStreamer-exception-2005 b/meta/fil=
es/common-licenses/GStreamer-exception-2005
new file mode 100644
index 0000000000..95ff750da3
--- /dev/null
+++ b/meta/files/common-licenses/GStreamer-exception-2005
@@ -0,0 +1 @@
+The Totem project hereby grant permission for non-gpl compatible GStreamer=
 plugins to be used and distributed together with GStreamer and Totem. This=
 permission are above and beyond the permissions granted by the GPL license=
 Totem is covered by.
diff --git a/meta/files/common-licenses/GStreamer-exception-2008 b/meta/fil=
es/common-licenses/GStreamer-exception-2008
new file mode 100644
index 0000000000..28927e533e
--- /dev/null
+++ b/meta/files/common-licenses/GStreamer-exception-2008
@@ -0,0 +1 @@
+This project hereby grants permission for non-GPL compatible GStreamer plu=
gins to be used and distributed together with GStreamer and this project. T=
his permission is above and beyond the permissions granted by the GPL licen=
se by which this project is covered. If you modify this code, you may exten=
d this exception to your version of the code, but you are not obligated to =
do so.  If you do not wish to do so, delete this exception statement from y=
our version.
diff --git a/meta/files/common-licenses/Gmsh-exception b/meta/files/common-=
licenses/Gmsh-exception
new file mode 100644
index 0000000000..6d28f704e4
--- /dev/null
+++ b/meta/files/common-licenses/Gmsh-exception
@@ -0,0 +1,16 @@
+The copyright holders of Gmsh give you permission to combine Gmsh
+  with code included in the standard release of Netgen (from Joachim
+  Sch"oberl), METIS (from George Karypis at the University of
+  Minnesota), OpenCASCADE (from Open CASCADE S.A.S) and ParaView
+  (from Kitware, Inc.) under their respective licenses. You may copy
+  and distribute such a system following the terms of the GNU GPL for
+  Gmsh and the licenses of the other code concerned, provided that
+  you include the source code of that other code when and as the GNU
+  GPL requires distribution of source code.
+
+  Note that people who make modified versions of Gmsh are not
+  obligated to grant this special exception for their modified
+  versions; it is their choice whether to do so. The GNU General
+  Public License gives permission to release a modified version
+  without this exception; this exception also makes it possible to
+  release a modified version which carries forward this exception.
diff --git a/meta/files/common-licenses/Independent-modules-exception b/met=
a/files/common-licenses/Independent-modules-exception
new file mode 100644
index 0000000000..8f66dba6ab
--- /dev/null
+++ b/meta/files/common-licenses/Independent-modules-exception
@@ -0,0 +1,18 @@
+This is the file COPYING.FPC, it applies to the Free Pascal Run-Time Libra=
ry=20
+(RTL) and packages (packages) distributed by members of the Free Pascal=20
+Development Team.
+
+The source code of the Free Pascal Runtime Libraries and packages are=20
+distributed under the Library GNU General Public License=20
+(see the file COPYING) with the following modification:
+
+As a special exception, the copyright holders of this library give you
+permission to link this library with independent modules to produce an
+executable, regardless of the license terms of these independent modules,
+and to copy and distribute the resulting executable under terms of your ch=
oice,
+provided that you also meet, for each linked independent module, the terms
+and conditions of the license of that module. An independent module is a m=
odule
+which is not derived from or based on this library. If you modify this
+library, you may extend this exception to your version of the library, but=
 you are
+not obligated to do so. If you do not wish to do so, delete this exception
+statement from your version.
diff --git a/meta/files/common-licenses/KiCad-libraries-exception b/meta/fi=
les/common-licenses/KiCad-libraries-exception
new file mode 100644
index 0000000000..ae8854b119
--- /dev/null
+++ b/meta/files/common-licenses/KiCad-libraries-exception
@@ -0,0 +1 @@
+To the extent that the creation of electronic designs that use 'Licensed M=
aterial' can be considered to be 'Adapted Material', then the copyright hol=
der waives article 3 of the license with respect to these designs and any g=
enerated files which use data provided as part of the 'Licensed Material'.
diff --git a/meta/files/common-licenses/LGPL-3.0-linking-exception b/meta/f=
iles/common-licenses/LGPL-3.0-linking-exception
new file mode 100644
index 0000000000..186456fb0e
--- /dev/null
+++ b/meta/files/common-licenses/LGPL-3.0-linking-exception
@@ -0,0 +1,16 @@
+As a special exception to the GNU Lesser General Public License version 3
+("LGPL3"), the copyright holders of this Library give you permission to
+convey to a third party a Combined Work that links statically or dynamical=
ly
+to this Library without providing any Minimal Corresponding Source or
+Minimal Application Code as set out in 4d or providing the installation
+information set out in section 4e, provided that you comply with the other
+provisions of LGPL3 and provided that you meet, for the Application the
+terms and conditions of the license(s) which apply to the Application.
+
+Except as stated in this special exception, the provisions of LGPL3 will
+continue to comply in full to this Library. If you modify this Library, you
+may apply this exception to your version of this Library, but you are not
+obliged to do so. If you do not wish to do so, delete this exception
+statement from your version. This exception does not (and cannot) modify a=
ny
+license terms which apply to the Application, with which you must still
+comply.
diff --git a/meta/files/common-licenses/LLGPL b/meta/files/common-licenses/=
LLGPL
new file mode 100644
index 0000000000..889d0b92e5
--- /dev/null
+++ b/meta/files/common-licenses/LLGPL
@@ -0,0 +1,56 @@
+Preamble to the Gnu Lesser General Public License
+
+Copyright (c) 2016 Franz Inc., Berkeley, CA 94704
+
+The concept of the GNU Lesser General Public License version 2.1 ("LGPL")=
=20
+has been adopted to govern the use and distribution of above-mentioned=20
+application. However, the LGPL uses terminology that is more appropriate=20
+for a program written in C than one written in Lisp. Nevertheless, the
+LGPL can still be applied to a Lisp program if certain clarifications=20
+are made. This document details those clarifications. Accordingly, the=20
+license for the open-source Lisp applications consists of this document=20
+plus the LGPL. Wherever there is a conflict between this document and=20
+the LGPL, this document takes precedence over the LGPL.
+
+A "Library" in Lisp is a collection of Lisp functions, data and foreign=20
+modules. The form of the Library can be Lisp source code (for processing=20
+by an interpreter) or object code (usually the result of compilation of=20
+source code or built with some other mechanisms). Foreign modules are=20
+object code in a form that can be linked into a Lisp executable. When=20
+we speak of functions we do so in the most general way to include, in=20
+addition, methods and unnamed functions. Lisp "data" is also a general=20
+term that includes the data structures resulting from defining Lisp=20
+classes. A Lisp application may include the same set of Lisp objects=20
+as does a Library, but this does not mean that the application is=20
+necessarily a "work based on the Library" it contains.
+
+The Library consists of everything in the distribution file set before=20
+any modifications are made to the files. If any of the functions or=20
+classes in the Library are redefined in other files, then those=20
+redefinitions ARE considered a work based on the Library. If additional=20
+methods are added to generic functions in the Library, those additional=20
+methods are NOT considered a work based on the Library. If Library classes=
=20
+are subclassed, these subclasses are NOT considered a work based on the Li=
brary.=20
+If the Library is modified to explicitly call other functions that are nei=
ther=20
+part of Lisp itself nor an available add-on module to Lisp, then the funct=
ions=20
+called by the modified Library ARE considered a work based on the Library.=
=20
+The goal is to ensure that the Library will compile and run without gettin=
g=20
+undefined function errors.
+
+It is permitted to add proprietary source code to the Library, but it must=
=20
+be done in a way such that the Library will still run without that proprie=
tary=20
+code present. Section 5 of the LGPL distinguishes between the case of a=20
+library being dynamically linked at runtime and one being statically linke=
d=20
+at build time. Section 5 of the LGPL states that the former results in an=
=20
+executable that is a "work that uses the Library." Section 5 of the LGPL=20
+states that the latter results in one that is a "derivative of the Library=
",=20
+which is therefore covered by the LGPL. Since Lisp only offers one choice,=
=20
+which is to link the Library into an executable at build time, we declare =
that,=20
+for the purpose applying the LGPL to the Library, an executable that resul=
ts=20
+from linking a "work that uses the Library" with the Library is considered=
 a=20
+"work that uses the Library" and is therefore NOT covered by the LGPL.
+
+Because of this declaration, section 6 of LGPL is not applicable to the Li=
brary.=20
+However, in connection with each distribution of this executable, you must=
 also=20
+deliver, in accordance with the terms and conditions of the LGPL, the sour=
ce code=20
+of Library (or your derivative thereof) that is incorporated into this exe=
cutable.
diff --git a/meta/files/common-licenses/LLVM-exception b/meta/files/common-=
licenses/LLVM-exception
new file mode 100644
index 0000000000..fa4b725a0e
--- /dev/null
+++ b/meta/files/common-licenses/LLVM-exception
@@ -0,0 +1,15 @@
+---- LLVM Exceptions to the Apache 2.0 License ----
+
+   As an exception, if, as a result of your compiling your source code, po=
rtions
+   of this Software are embedded into an Object form of such source code, =
you
+   may redistribute such embedded portions in such Object form without com=
plying
+   with the conditions of Sections 4(a), 4(b) and 4(d) of the License.
+
+   In addition, if you combine or link compiled forms of this Software with
+   software that is licensed under the GPLv2 ("Combined Software") and if a
+   court of competent jurisdiction determines that the patent provision (S=
ection
+   3), the indemnity provision (Section 9) or other Section of the License
+   conflicts with the conditions of the GPLv2, you may retroactively and
+   prospectively choose to deem waived or otherwise exclude such Section(s=
) of
+   the License, but only in their entirety and only with respect to the Co=
mbined
+   Software.
diff --git a/meta/files/common-licenses/LZMA-exception b/meta/files/common-=
licenses/LZMA-exception
new file mode 100644
index 0000000000..6fc9c1352b
--- /dev/null
+++ b/meta/files/common-licenses/LZMA-exception
@@ -0,0 +1,3 @@
+I.6 Special exception for LZMA compression module
+
+Igor Pavlov and Amir Szekely, the authors of the LZMA compression module f=
or NSIS, expressly permit you to statically or dynamically link your code (=
or bind by name) to the files from the LZMA compression module for NSIS wit=
hout subjecting your linked code to the terms of the Common Public license =
version 1.0. Any modifications or additions to files from the LZMA compress=
ion module for NSIS, however, are subject to the terms of the Common Public=
 License version 1.0.
diff --git a/meta/files/common-licenses/Libtool-exception b/meta/files/comm=
on-licenses/Libtool-exception
new file mode 100644
index 0000000000..729b1e9530
--- /dev/null
+++ b/meta/files/common-licenses/Libtool-exception
@@ -0,0 +1 @@
+As a special exception to the GNU General Public License, if you distribut=
e this file as part of a program or library that is built using GNU Libtool=
, you may include this file under the same distribution terms that you use =
for the rest of that program.
diff --git a/meta/files/common-licenses/Linux-syscall-note b/meta/files/com=
mon-licenses/Linux-syscall-note
new file mode 100644
index 0000000000..fcd056364e
--- /dev/null
+++ b/meta/files/common-licenses/Linux-syscall-note
@@ -0,0 +1,12 @@
+   NOTE! This copyright does *not* cover user programs that use kernel
+ services by normal system calls - this is merely considered normal use
+ of the kernel, and does *not* fall under the heading of "derived work".
+ Also note that the GPL below is copyrighted by the Free Software
+ Foundation, but the instance of code that it refers to (the Linux
+ kernel) is copyrighted by me and others who actually wrote it.
+
+ Also note that the only valid version of the GPL as far as the kernel
+ is concerned is _this_ particular version of the license (ie v2, not
+ v2.2 or v3.x or whatever), unless explicitly otherwise stated.
+
+			Linus Torvalds
diff --git a/meta/files/common-licenses/OCCT-exception-1.0 b/meta/files/com=
mon-licenses/OCCT-exception-1.0
new file mode 100644
index 0000000000..d41c35bff5
--- /dev/null
+++ b/meta/files/common-licenses/OCCT-exception-1.0
@@ -0,0 +1,3 @@
+Open CASCADE Exception (version 1.0) to GNU LGPL version 2.1.
+
+The object code (i.e. not a source) form of a "work that uses the Library"=
 can incorporate material from a header file that is part of the Library. A=
s a special exception to the GNU Lesser General Public License version 2.1,=
 you may distribute such object code incorporating material from header fil=
es provided with the Open CASCADE Technology libraries (including code of C=
DL generic classes) under terms of your choice, provided that you give prom=
inent notice in supporting documentation to this code that it makes use of =
or is based on facilities provided by the Open CASCADE Technology software.
diff --git a/meta/files/common-licenses/OCaml-LGPL-linking-exception b/meta=
/files/common-licenses/OCaml-LGPL-linking-exception
new file mode 100644
index 0000000000..7fc88d7307
--- /dev/null
+++ b/meta/files/common-licenses/OCaml-LGPL-linking-exception
@@ -0,0 +1 @@
+As a special exception to the GNU Lesser General Public License, you may l=
ink, statically or dynamically, a "work that uses the OCaml Core System" wi=
th a publicly distributed version of the OCaml Core System to produce an ex=
ecutable file containing portions of the OCaml Core System, and distribute =
that executable file under terms of your choice, without any of the additio=
nal requirements listed in clause 6 of the GNU Lesser General Public Licens=
e. By "a publicly distributed version of the OCaml Core System", we mean ei=
ther the unmodified OCaml Core System as distributed by INRIA, or a modifie=
d version of the OCaml Core System that is distributed under the conditions=
 defined in clause 2 of the GNU Lesser General Public License. This excepti=
on does not however invalidate any other reasons why the executable file mi=
ght be covered by the GNU Lesser General Public License.
diff --git a/meta/files/common-licenses/OpenJDK-assembly-exception-1.0 b/me=
ta/files/common-licenses/OpenJDK-assembly-exception-1.0
new file mode 100644
index 0000000000..3a35f11ed2
--- /dev/null
+++ b/meta/files/common-licenses/OpenJDK-assembly-exception-1.0
@@ -0,0 +1,31 @@
+The OpenJDK source code made available by Oracle America, Inc.
+(Oracle) at openjdk.java.net ("OpenJDK Code") is distributed
+under the terms of the GNU General Public License
+<http://www.gnu.org/copyleft/gpl.html> version 2 only
+("GPL2"), with the following clarification and special
+exception.
+
+Linking this OpenJDK Code statically or dynamically with
+other code is making a combined work based on this
+library. Thus, the terms and conditions of GPL2 cover the
+whole combination.
+
+As a special exception, Oracle gives you permission to
+link this OpenJDK Code with certain code licensed by
+Oracle as indicated at
+http://openjdk.java.net/legal/exception-modules-2007-05-08.html
+("Designated Exception Modules") to produce an
+executable, regardless of the license terms of the
+Designated Exception Modules, and to copy and distribute
+the resulting executable under GPL2, provided that the
+Designated Exception Modules continue to be governed by
+the licenses under which they were offered by Oracle.
+
+As such, it allows licensees and sublicensees of Oracle's GPL2
+OpenJDK Code to build an executable that includes those
+portions of necessary code that Oracle could not provide under
+GPL2 (or that Oracle has provided under GPL2 with the Classpath
+exception). If you modify or add to the OpenJDK code, that new
+GPL2 code may still be combined with Designated Exception
+Modules if the new code is made subject to this exception by
+its copyright holder.
diff --git a/meta/files/common-licenses/PCRE2-exception b/meta/files/common=
-licenses/PCRE2-exception
new file mode 100644
index 0000000000..eb7fd11767
--- /dev/null
+++ b/meta/files/common-licenses/PCRE2-exception
@@ -0,0 +1,8 @@
+EXEMPTION FOR BINARY LIBRARY-LIKE PACKAGES
+------------------------------------------
+
+The second condition in the BSD licence (covering binary redistributions) =
does
+not apply all the way down a chain of software. If binary package A includ=
es
+PCRE2, it must respect the condition, but if package B is software that
+includes package A, the condition is not imposed on package B unless it us=
es
+PCRE2 independently.
diff --git a/meta/files/common-licenses/PS-or-PDF-font-exception-20170817 b=
/meta/files/common-licenses/PS-or-PDF-font-exception-20170817
new file mode 100644
index 0000000000..cf22439fff
--- /dev/null
+++ b/meta/files/common-licenses/PS-or-PDF-font-exception-20170817
@@ -0,0 +1,8 @@
+The font and related files in this directory are distributed under the
+GNU AFFERO GENERAL PUBLIC LICENSE Version 3 (see the file COPYING), with
+the following exemption:
+
+As a special exception, permission is granted to include these font
+programs in a Postscript or PDF file that consists of a document that
+contains text to be displayed or printed using this font, regardless
+of the conditions or license applying to the document itself.
diff --git a/meta/files/common-licenses/QPL-1.0-INRIA-2004-exception b/meta=
/files/common-licenses/QPL-1.0-INRIA-2004-exception
new file mode 100644
index 0000000000..2418a26377
--- /dev/null
+++ b/meta/files/common-licenses/QPL-1.0-INRIA-2004-exception
@@ -0,0 +1,5 @@
+As a special exception to the Q Public Licence, you may develop
+application programs, reusable components and other software items
+that link with the original or modified versions of the Software
+and are not made available to the general public, without any of the
+additional requirements listed in clause 6c of the Q Public licence.
diff --git a/meta/files/common-licenses/Qt-GPL-exception-1.0 b/meta/files/c=
ommon-licenses/Qt-GPL-exception-1.0
new file mode 100644
index 0000000000..761d0327a4
--- /dev/null
+++ b/meta/files/common-licenses/Qt-GPL-exception-1.0
@@ -0,0 +1,21 @@
+The Qt Company GPL Exception 1.0
+
+Exception 1:
+
+As a special exception you may create a larger work which contains the
+output of this application and distribute that work under terms of your
+choice, so long as the work is not otherwise derived from or based on
+this application and so long as the work does not in itself generate
+output that contains the output from this application in its original
+or modified form.
+
+Exception 2:
+
+As a special exception, you have permission to combine this application
+with Plugins licensed under the terms of your choice, to produce an
+executable, and to copy and distribute the resulting executable under
+the terms of your choice. However, the executable must be accompanied
+by a prominent notice offering all users of the executable the entire
+source code to this application, excluding the source code of the
+independent modules, but including any changes you have made to this
+application, under the terms of this license.
diff --git a/meta/files/common-licenses/Qt-LGPL-exception-1.1 b/meta/files/=
common-licenses/Qt-LGPL-exception-1.1
new file mode 100644
index 0000000000..bd94b5538f
--- /dev/null
+++ b/meta/files/common-licenses/Qt-LGPL-exception-1.1
@@ -0,0 +1,22 @@
+The Qt Company Qt LGPL Exception version 1.1
+
+As an additional permission to the GNU Lesser General Public License versi=
on
+2.1, the object code form of a "work that uses the Library" may incorporate
+material from a header file that is part of the Library.  You may distribu=
te
+such object code under terms of your choice, provided that:
+    (i)   the header files of the Library have not been modified; and
+    (ii)  the incorporated material is limited to numerical parameters, da=
ta
+          structure layouts, accessors, macros, inline functions and
+          templates; and
+    (iii) you comply with the terms of Section 6 of the GNU Lesser General
+          Public License version 2.1.
+
+Moreover, you may apply this exception to a modified version of the Librar=
y,
+provided that such modification does not involve copying material from the
+Library into the modified Library's header files unless such material is
+limited to (i) numerical parameters; (ii) data structure layouts;
+(iii) accessors; and (iv) small macros, templates and inline functions of
+five lines or less in length.
+
+Furthermore, you are not required to apply this additional permission to a
+modified version of the Library.
diff --git a/meta/files/common-licenses/Qwt-exception-1.0 b/meta/files/comm=
on-licenses/Qwt-exception-1.0
new file mode 100644
index 0000000000..b45cdd0b54
--- /dev/null
+++ b/meta/files/common-licenses/Qwt-exception-1.0
@@ -0,0 +1,12 @@
+Qwt License Version 1.0,
+January 1, 2003
+
+The Qwt library and included programs are provided under the terms of the =
GNU LESSER GENERAL PUBLIC LICENSE (LGPL) with the following exceptions:
+
+1. Widgets that are subclassed from Qwt widgets do not constitute a deriva=
tive work.
+
+2. Static linking of applications and widgets to the Qwt library does not =
constitute a derivative work and does not require the author to provide sou=
rce code for the application or widget, use the shared Qwt libraries, or li=
nk their applications or widgets against a user-supplied version of Qwt. If=
 you link the application or widget to a modified version of Qwt, then the =
changes to Qwt must be provided under the terms of the LGPL in sections 1, =
2, and 4.
+
+3. You do not have to provide a copy of the Qwt license with programs that=
 are linked to the Qwt library, nor do you have to identify the Qwt license=
 in your program or documentation as required by section 6 of the LGPL.
+
+However, programs must still identify their use of Qwt. The following exam=
ple statement can be included in user documentation to satisfy this require=
ment: [program/widget] is based in part on the work of the Qwt project (htt=
p://qwt.sf.net)."
diff --git a/meta/files/common-licenses/RRDtool-FLOSS-exception-2.0 b/meta/=
files/common-licenses/RRDtool-FLOSS-exception-2.0
new file mode 100644
index 0000000000..d88dae5868
--- /dev/null
+++ b/meta/files/common-licenses/RRDtool-FLOSS-exception-2.0
@@ -0,0 +1,66 @@
+FLOSS License Exception=20
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+(Adapted from http://www.mysql.com/company/legal/licensing/foss-exception.=
html)
+
+I want specified Free/Libre and Open Source Software ("FLOSS")
+applications to be able to use specified GPL-licensed RRDtool
+libraries (the "Program") despite the fact that not all FLOSS licenses are
+compatible with version 2 of the GNU General Public License (the "GPL").
+
+As a special exception to the terms and conditions of version 2.0 of the G=
PL:
+
+You are free to distribute a Derivative Work that is formed entirely from
+the Program and one or more works (each, a "FLOSS Work") licensed under one
+or more of the licenses listed below, as long as:
+
+1. You obey the GPL in all respects for the Program and the Derivative
+Work, except for identifiable sections of the Derivative Work which are
+not derived from the Program, and which can reasonably be considered
+independent and separate works in themselves,
+
+2. all identifiable sections of the Derivative Work which are not derived
+from the Program, and which can reasonably be considered independent and
+separate works in themselves,
+
+1. are distributed subject to one of the FLOSS licenses listed
+below, and
+
+2. the object code or executable form of those sections are
+accompanied by the complete corresponding machine-readable source
+code for those sections on the same medium and under the same FLOSS
+license as the corresponding object code or executable forms of
+those sections, and
+
+3. any works which are aggregated with the Program or with a Derivative
+Work on a volume of a storage or distribution medium in accordance with
+the GPL, can reasonably be considered independent and separate works in
+themselves which are not derivatives of either the Program, a Derivative
+Work or a FLOSS Work.
+
+If the above conditions are not met, then the Program may only be copied,
+modified, distributed or used under the terms and conditions of the GPL.
+
+FLOSS License List
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+License name	Version(s)/Copyright Date
+Academic Free License		2.0
+Apache Software License	1.0/1.1/2.0
+Apple Public Source License	2.0
+Artistic license		From Perl 5.8.0
+BSD license			"July 22 1999"
+Common Public License		1.0
+GNU Library or "Lesser" General Public License (LGPL)	2.0/2.1
+IBM Public License, Version    1.0
+Jabber Open Source License	1.0
+MIT License (As listed in file MIT-License.txt)	-
+Mozilla Public License (MPL)	1.0/1.1
+Open Software License		2.0
+OpenSSL license (with original SSLeay license)	"2003" ("1998")
+PHP License			3.01
+Python license (CNRI Python License)	-
+Python Software Foundation License	2.1.1
+Sleepycat License		"1999"
+W3C License			"2001"
+X11 License			"2001"
+Zlib/libpng License		-
+Zope Public License		2.0/2.1
diff --git a/meta/files/common-licenses/SANE-exception b/meta/files/common-=
licenses/SANE-exception
new file mode 100644
index 0000000000..198a8c67cc
--- /dev/null
+++ b/meta/files/common-licenses/SANE-exception
@@ -0,0 +1,20 @@
+As a special exception, the authors of sane-airscan give permission for
+additional uses of the libraries contained in this release of sane-airscan.
+
+The exception is that, if you link a sane-airscan library with other files
+to produce an executable, this does not by itself cause the
+resulting executable to be covered by the GNU General Public
+License. Your use of that executable is in no way restricted on
+account of linking the sane-airscan library code into it.
+
+This exception does not, however, invalidate any other reasons why
+the executable file might be covered by the GNU General Public
+License.
+
+If you submit changes to sane-airscan to the maintainers to be included in
+a subsequent release, you agree by submitting the changes that
+those changes may be distributed with this exception intact.
+
+If you write modifications of your own for sane-airscan, it is your choice
+whether to permit this exception to apply to your modifications.
+If you do not wish that, delete this exception notice.
diff --git a/meta/files/common-licenses/SHL-2.0 b/meta/files/common-license=
s/SHL-2.0
new file mode 100644
index 0000000000..9218b47a72
--- /dev/null
+++ b/meta/files/common-licenses/SHL-2.0
@@ -0,0 +1,22 @@
+# Solderpad Hardware Licence Version 2.0
+
+This licence (the =E2=80=9CLicence=E2=80=9D) operates as a wraparound lice=
nce to the Apache License Version 2.0 (the =E2=80=9CApache License=E2=80=9D=
) and grants to You the rights, and imposes the obligations, set out in the=
 Apache License (which can be found here: http://apache.org/licenses/LICENS=
E-2.0), with the following extensions. It must be read in conjunction with =
the Apache License. Section 1 below modifies definitions in the Apache Lice=
nse, and section 2 below replaces sections 2 of the Apache License. You may=
, at your option, choose to treat any Work released under this License as r=
eleased under the Apache License (thus ignoring all sections written below =
entirely). Words in italics indicate changes rom the Apache License, but ar=
e indicative and not to be taken into account in interpretation.
+
+1. The definitions set out in the Apache License are modified as follows:
+
+Copyright any reference to =E2=80=98copyright=E2=80=99 (whether capitalise=
d or not) includes =E2=80=98Rights=E2=80=99 (as defined below).
+
+Contribution also includes any design, as well as any work of authorship.
+
+Derivative Works shall not include works that remain reversibly separable =
from, or merely link (or bind by name) or physically connect to or interope=
rate with the interfaces of the Work and Derivative Works thereof.
+
+Object form shall mean any form resulting from mechanical transformation o=
r translation of a Source form or the application of a Source form to physi=
cal material, including but not limited to compiled object code, generated =
documentation, the instantiation of a hardware design or physical object an=
d conversions to other media types, including intermediate forms such as by=
tecodes, FPGA bitstreams, moulds, artwork and semiconductor topographies (m=
ask works).
+
+Rights means copyright and any similar right including design right (wheth=
er registered or unregistered), semiconductor topography (mask) rights and =
database rights (but excluding Patents and Trademarks).
+
+Source form shall mean the preferred form for making modifications, includ=
ing but not limited to source code, net lists, board layouts, CAD files, do=
cumentation source, and configuration files.
+Work also includes a design or work of authorship, whether in Source form =
or other Object form.
+
+2. Grant of Licence
+
+2.1 Subject to the terms and conditions of this License, each Contributor =
hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, roya=
lty-free, irrevocable license under the Rights to reproduce, prepare Deriva=
tive Works of, make, adapt, repair, publicly display, publicly perform, sub=
license, and distribute the Work and such Derivative Works in Source or Obj=
ect form and do anything in relation to the Work as if the Rights did not e=
xist.
diff --git a/meta/files/common-licenses/SHL-2.1 b/meta/files/common-license=
s/SHL-2.1
new file mode 100644
index 0000000000..de45054588
--- /dev/null
+++ b/meta/files/common-licenses/SHL-2.1
@@ -0,0 +1,49 @@
+SOLDERPAD HARDWARE LICENSE VERSION 2.1
+
+This license operates as a wraparound license to the Apache License Versio=
n 2.0 (the "Apache License") and incorporates the terms and conditions of t=
he Apache License (which can be found here: http://apache.org/licenses/LICE=
NSE-2.0), with the following additions and modifications. It must be read i=
n conjunction with the Apache License. Section 1 below modifies definitions=
 and terminology in the Apache License and Section 2 below replaces Section=
 2 of the Apache License. The Appendix replaces the Appendix in the Apache =
License. You may, at your option, choose to treat any Work released under t=
his license as released under the Apache License (thus ignoring all section=
s written below entirely).
+
+1.	Terminology in the Apache License is supplemented or modified as follow=
s:
+
+"Authorship": any reference to 'authorship' shall be taken to read "author=
ship or design".
+
+"Copyright owner": any reference to 'copyright owner' shall be taken to re=
ad "Rights owner".
+
+"Copyright statement": the reference to 'copyright statement' shall be tak=
en to read 'copyright or other statement pertaining to Rights'
+
+The following new definition shall be added to the Definitions section of =
the Apache License:
+
+"Rights" means copyright and any similar right including design right (whe=
ther registered or unregistered), rights in semiconductor topographies (mas=
k works) and database rights (but excluding Patents and Trademarks).
+
+The following definitions shall replace the corresponding definitions in t=
he Apache License:
+
+"License" shall mean this Solderpad Hardware License version 2.1, being th=
e terms and conditions for use, manufacture, instantiation, adaptation, rep=
roduction, and distribution as defined by Sections 1 through 9 of this docu=
ment.
+
+"Licensor" shall mean the Rights owner or entity authorized by the Rights =
owner that is granting the License.
+=20
+"Derivative Works" shall mean any work, whether in Source or Object form, =
that is based on (or derived from) the Work and for which the editorial rev=
isions, annotations, elaborations, or other modifications represent, as a w=
hole, an original work of authorship or design. For the purposes of this Li=
cense, Derivative Works shall not include works that remain reversibly sepa=
rable from, or merely link (or bind by name) or physically connect to or in=
teroperate with the Work and Derivative Works thereof.
+
+"Object" form shall mean any form resulting from mechanical transformation=
 or translation of a Source form or the application of a Source form to phy=
sical material, including but not limited to compiled object code, generate=
d documentation, the instantiation of a hardware design or physical object =
or material and conversions to other media types, including intermediate fo=
rms such as bytecodes, FPGA bitstreams, moulds, artwork and semiconductor t=
opographies (mask works).
+
+"Source" form shall mean the preferred form for making modifications, incl=
uding but not limited to source code, net lists, board layouts, CAD files, =
documentation source, and configuration files.
+
+"Work" shall mean the work of authorship or design, whether in Source or O=
bject form, made available under the License, as indicated by a notice rela=
ting to Rights that is included in or attached to the work (an example is p=
rovided in the Appendix below).
+
+2.	Grant of License. Subject to the terms and conditions of this License, =
each Contributor hereby grants to You a perpetual, worldwide, non-exclusive=
, no-charge, royalty-free, irrevocable license under the Rights to reproduc=
e, prepare Derivative Works of, make, adapt, repair, publicly display, publ=
icly perform, sublicense, and distribute the Work and such Derivative Works=
 in Source or Object form and do anything in relation to the Work as if the=
 Rights did not exist.
+
+
+APPENDIX
+
+Copyright [yyyy] [name of copyright owner]
+SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
+
+Licensed under the Solderpad Hardware License v 2.1 (the "License"); you m=
ay not use this file except in compliance with the License, or, at your opt=
ion, the Apache License version 2.0.
+You may obtain a copy of the License at
+
+https://solderpad.org/licenses/SHL-2.1/
+=20=20=20
+Unless required by applicable law or agreed to in writing, any work distri=
buted under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANT=
IES OR CONDITIONS OF ANY KIND, either express or implied.
+See the License for the specific language governing permissions and limita=
tions under the License.
+
+
+
+
diff --git a/meta/files/common-licenses/SWI-exception b/meta/files/common-l=
icenses/SWI-exception
new file mode 100644
index 0000000000..f2d1482789
--- /dev/null
+++ b/meta/files/common-licenses/SWI-exception
@@ -0,0 +1,7 @@
+As a special exception, if you link this library with other files,
+compiled with a Free Software compiler, to produce an executable, this
+library does not by itself cause the resulting executable to be covered
+by the GNU General Public License. This exception does not however
+invalidate any other reasons why the executable file might be covered by
+the GNU General Public License.
+
diff --git a/meta/files/common-licenses/Simple-Library-Usage-exception b/me=
ta/files/common-licenses/Simple-Library-Usage-exception
new file mode 100644
index 0000000000..2db2bbe10f
--- /dev/null
+++ b/meta/files/common-licenses/Simple-Library-Usage-exception
@@ -0,0 +1,33 @@
+EXCEPTION NOTICE
+
+1. As a special exception, the copyright holders of this library give
+permission for additional uses of the text contained in this release
+of the library as licensed under the Simple Library Usage License,
+applying either version 1 of the License, or (at your option) any
+later version of the License as published by the copyright holders of
+version 1 of the License document.
+
+2. The exception is that you may combine or link a "work that uses the
+Library" (as defined by the LGPL) with the Library to produce a work
+containing portions of the Library in binary form, and distribute that
+work under terms of your choice, provided that:
+
+  a) You give prominent notice with each copy of the work that the
+  Library is used in it.
+
+  b) If the work during execution displays copyright notices, you must
+  include the copyright notice for the Library among them.
+
+3. If you copy code from files distributed under the terms of the GNU
+General Public License or the GNU Lesser General Public License into a
+copy of this library, as this license permits, the exception does not
+apply to the code that you add in this way.  To avoid misleading
+anyone as to the status of such modified files, you must delete this
+exception notice from such code and/or adjust the licensing conditions
+notice accordingly.
+
+4. If you write modifications of your own for this library, it is your
+choice whether to permit this exception to apply to your
+modifications.  If you do not wish that, you must delete the exception
+notice from such code and/or adjust the licensing conditions notice
+accordingly.
diff --git a/meta/files/common-licenses/Swift-exception b/meta/files/common=
-licenses/Swift-exception
new file mode 100644
index 0000000000..32b573cea5
--- /dev/null
+++ b/meta/files/common-licenses/Swift-exception
@@ -0,0 +1,6 @@
+### Runtime Library Exception to the Apache 2.0 License: ###
+
+As an exception, if you use this Software to compile your source code and
+portions of this Software are embedded into the binary product as a result,
+you may redistribute such product without providing attribution as would
+otherwise be required by Sections 4(a), 4(b) and 4(d) of the License.
diff --git a/meta/files/common-licenses/Texinfo-exception b/meta/files/comm=
on-licenses/Texinfo-exception
new file mode 100644
index 0000000000..931a4070b4
--- /dev/null
+++ b/meta/files/common-licenses/Texinfo-exception
@@ -0,0 +1,4 @@
+As a special exception, when this file is read by TeX when
+processing a Texinfo source document, you may use the result without
+restriction. This Exception is an additional permission under
+section 7 of the GNU General Public License, version 3 ("GPLv3").
diff --git a/meta/files/common-licenses/UBDL-exception b/meta/files/common-=
licenses/UBDL-exception
new file mode 100644
index 0000000000..780ddcd775
--- /dev/null
+++ b/meta/files/common-licenses/UBDL-exception
@@ -0,0 +1,59 @@
+UNMODIFIED BINARY DISTRIBUTION LICENCE
+
+
+PREAMBLE
+
+The GNU General Public License provides a legal guarantee that
+software covered by it remains free (in the sense of freedom, not
+price).  It achieves this guarantee by imposing obligations on anyone
+who chooses to distribute the software.
+
+Some of these obligations may be seen as unnecessarily burdensome.  In
+particular, when the source code for the software is already publicly
+and freely available, there is minimal value in imposing upon each
+distributor the obligation to provide the complete source code (or an
+equivalent written offer to provide the complete source code).
+
+This Licence allows for the distribution of unmodified binaries built
+from publicly available source code, without imposing the obligations
+of the GNU General Public License upon anyone who chooses to
+distribute only the unmodified binaries built from that source code.
+
+The extra permissions granted by this Licence apply only to unmodified
+binaries built from source code which has already been made available
+to the public in accordance with the terms of the GNU General Public
+Licence.  Nothing in this Licence allows for the creation of
+closed-source modified versions of the Program.  Any modified versions
+of the Program are subject to the usual terms and conditions of the
+GNU General Public License.
+
+
+TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+This Licence applies to any Program or other work which contains a
+notice placed by the copyright holder saying it may be distributed
+under the terms of this Unmodified Binary Distribution Licence.  All
+terms used in the text of this Licence are to be interpreted as they
+are used in version 2 of the GNU General Public License as published
+by the Free Software Foundation.
+
+If you have made this Program available to the public in both source
+code and executable form in accordance with the terms of the GNU
+General Public License as published by the Free Software Foundation;
+either version 2 of the License, or (at your option) any later
+version, then you are hereby granted an additional permission to use,
+copy, and distribute the unmodified executable form of this Program
+(the "Unmodified Binary") without restriction, including the right to
+permit persons to whom the Unmodified Binary is furnished to do
+likewise, subject to the following conditions:
+
+- when started running, the Program must display an announcement which
+  includes the details of your existing publication of the Program
+  made in accordance with the terms of the GNU General Public License.
+  For example, the Program could display the URL of the publicly
+  available source code from which the Unmodified Binary was built.
+
+- when exercising your right to grant permissions under this Licence,
+  you do not need to refer directly to the text of this Licence, but
+  you may not grant permissions beyond those granted to you by this
+  Licence.
diff --git a/meta/files/common-licenses/Universal-FOSS-exception-1.0 b/meta=
/files/common-licenses/Universal-FOSS-exception-1.0
new file mode 100644
index 0000000000..4a79cbdcf6
--- /dev/null
+++ b/meta/files/common-licenses/Universal-FOSS-exception-1.0
@@ -0,0 +1,11 @@
+The Universal FOSS Exception, Version 1.0
+=20
+In addition to the rights set forth in the other license(s) included in th=
e distribution for this software, data, and/or documentation (collectively =
the "Software," and such licenses collectively with this additional permiss=
ion the "Software License"), the copyright holders wish to facilitate inter=
operability with other software, data, and/or documentation distributed wit=
h complete corresponding source under a license that is OSI-approved and/or=
 categorized by the FSF as free (collectively "Other FOSS").  We therefore =
hereby grant the following additional permission with respect to the use an=
d distribution of the Software with Other FOSS, and the constants, function=
 signatures, data structures and other invocation methods used to run or in=
teract with each of them (as to each, such software's "Interfaces"):
+=20
+(i) The Software's Interfaces may, to the extent permitted by the license =
of the Other FOSS, be copied into, used and distributed in the Other FOSS i=
n order to enable interoperability, without requiring a change to the licen=
se of the Other FOSS other than as to any Interfaces of the Software embedd=
ed therein.  The Software's Interfaces remain at all times under the Softwa=
re License, including without limitation as used in the Other FOSS (which u=
pon any such use also then contains a portion of the Software under the Sof=
tware License).
+=20
+(ii) The Other FOSS's Interfaces may, to the extent permitted by the licen=
se of the Other FOSS, be copied into, used and distributed in the Software =
in order to enable interoperability, without requiring that such Interfaces=
 be licensed under the terms of the Software License or otherwise altering =
their original terms, if this does not require any portion of the Software =
other than such Interfaces to be licensed under the terms other than the So=
ftware License.
+=20
+(iii) If only Interfaces and no other code is copied between the Software =
and the Other FOSS in either direction, the use and/or distribution of the =
Software with the Other FOSS shall not be deemed to require that the Other =
FOSS be licensed under the license of the Software, other than as to any In=
terfaces of the Software copied into the Other FOSS.  This includes, by way=
 of example and without limitation, statically or dynamically linking the S=
oftware together with Other FOSS after enabling interoperability using the =
Interfaces of one or both, and distributing the resulting combination under=
 different licenses for the respective portions thereof.
+=20
+For avoidance of doubt, a license which is OSI-approved or categorized by =
the FSF as free, includes, for the purpose of this permission, such license=
s with additional permissions, and any license that has previously been so-=
approved or categorized as free, even if now deprecated or otherwise no lon=
ger recognized as approved or free.  Nothing in this additional permission =
grants any right to distribute any portion of the Software on terms other t=
han those of the Software License or grants any additional permission of an=
y kind for use or distribution of the Software in conjunction with software=
 other than Other FOSS.
diff --git a/meta/files/common-licenses/WxWindows-exception-3.1 b/meta/file=
s/common-licenses/WxWindows-exception-3.1
new file mode 100644
index 0000000000..9e71b0ae3f
--- /dev/null
+++ b/meta/files/common-licenses/WxWindows-exception-3.1
@@ -0,0 +1,9 @@
+EXCEPTION NOTICE
+
+1. As a special exception, the copyright holders of this library give perm=
ission for additional uses of the text contained in this release of the lib=
rary as licenced under the wxWindows Library Licence, applying either versi=
on 3.1 of the Licence, or (at your option) any later version of the Licence=
 as published by the copyright holders of version 3.1 of the Licence docume=
nt.
+
+2. The exception is that you may use, copy, link, modify and distribute un=
der your own terms, binary object code versions of works based on the Libra=
ry.
+
+3. If you copy code from files distributed under the terms of the GNU Gene=
ral Public Licence or the GNU Library General Public Licence into a copy of=
 this library, as this licence permits, the exception does not apply to the=
 code that you add in this way. To avoid misleading anyone as to the status=
 of such modified files, you must delete this exception notice from such co=
de and/or adjust the licensing conditions notice accordingly.
+
+4. If you write modifications of your own for this library, it is your cho=
ice whether to permit this exception to apply to your modifications. If you=
 do not wish that, you must delete the exception notice from such code and/=
or adjust the licensing conditions notice accordingly.
diff --git a/meta/files/common-licenses/cryptsetup-OpenSSL-exception b/meta=
/files/common-licenses/cryptsetup-OpenSSL-exception
new file mode 100644
index 0000000000..25c1c420d2
--- /dev/null
+++ b/meta/files/common-licenses/cryptsetup-OpenSSL-exception
@@ -0,0 +1,12 @@
+In addition, as a special exception, the copyright holders give
+permission to link the code of portions of this program with the OpenSSL
+library under certain conditions as described in each individual source
+file, and distribute linked combinations including the two.
+
+You must obey the GNU General Public License in all respects for all of
+the code used other than OpenSSL. If you modify file(s) with this
+exception, you may extend this exception to your version of the file(s),
+but you are not obligated to do so. If you do not wish to do so, delete
+this exception statement from your version. If you delete this exception
+statement from all source files in the program, then also delete it
+here.
diff --git a/meta/files/common-licenses/eCos-exception-2.0 b/meta/files/com=
mon-licenses/eCos-exception-2.0
new file mode 100644
index 0000000000..a0bf0077c5
--- /dev/null
+++ b/meta/files/common-licenses/eCos-exception-2.0
@@ -0,0 +1,3 @@
+As a special exception, if other files instantiate templates or use macros=
 or inline functions from this file, or you compile this file and link it w=
ith other works to produce a work based on this file, this file does not by=
 itself cause the resulting work to be covered by the GNU General Public Li=
cense. However the source code for this file must still be made available i=
n accordance with section (3) of the GNU General Public License.
+
+This exception does not invalidate any other reasons why a work based on t=
his file might be covered by the GNU General Public License.
diff --git a/meta/files/common-licenses/erlang-otp-linking-exception b/meta=
/files/common-licenses/erlang-otp-linking-exception
new file mode 100644
index 0000000000..ca8b775480
--- /dev/null
+++ b/meta/files/common-licenses/erlang-otp-linking-exception
@@ -0,0 +1,11 @@
+If you modify this Program, or any covered work, by linking or
+combining it with runtime libraries of Erlang/OTP as released by
+Ericsson on https://www.erlang.org (or a modified version of these
+libraries), containing parts covered by the terms of the Erlang Public
+License (https://www.erlang.org/EPLICENSE), the licensors of this
+Program grant you additional permission to convey the resulting work
+without the need to license the runtime libraries of Erlang/OTP under
+the GNU Affero General Public License. Corresponding Source for a
+non-source form of such a combination shall include the source code
+for the parts of the runtime libraries of Erlang/OTP used as well as
+that of the covered work.
diff --git a/meta/files/common-licenses/fmt-exception b/meta/files/common-l=
icenses/fmt-exception
new file mode 100644
index 0000000000..6036f7d360
--- /dev/null
+++ b/meta/files/common-licenses/fmt-exception
@@ -0,0 +1,6 @@
+--- Optional exception to the license ---
+
+As an exception, if, as a result of your compiling your source code, porti=
ons
+of this Software are embedded into a machine-executable object form of such
+source code, you may redistribute such embedded portions in such object fo=
rm
+without including the above copyright and permission notices.
diff --git a/meta/files/common-licenses/freertos-exception-2.0 b/meta/files=
/common-licenses/freertos-exception-2.0
new file mode 100644
index 0000000000..0105e95971
--- /dev/null
+++ b/meta/files/common-licenses/freertos-exception-2.0
@@ -0,0 +1,19 @@
+Any FreeRTOS source code, whether modified or in its original release form=
, or whether in whole or in part, can only be distributed by you under the =
terms of the GNU General Public License plus this exception. An independent=
 module is a module which is not derived from or based on FreeRTOS.
+
+EXCEPTION TEXT:
+
+Clause 1
+
+Linking FreeRTOS statically or dynamically with other modules is making a =
combined work based on FreeRTOS. Thus, the terms and conditions of the GNU =
General Public License cover the whole combination.
+
+As a special exception, the copyright holder of FreeRTOS gives you permiss=
ion to link FreeRTOS with independent modules that communicate with FreeRTO=
S solely through the FreeRTOS API interface, regardless of the license term=
s of these independent modules, and to copy and distribute the resulting co=
mbined work under terms of your choice, provided that
+
+Every copy of the combined work is accompanied by a written statement that=
 details to the recipient the version of FreeRTOS used and an offer by your=
self to provide the FreeRTOS source code (including any modifications you m=
ay have made) should the recipient request it.
+
+The combined work is not itself an RTOS, scheduler, kernel or related prod=
uct.
+
+The independent modules add significant and primary functionality to FreeR=
TOS and do not merely extend the existing functionality already present in =
FreeRTOS.
+
+Clause 2
+
+FreeRTOS may not be used for any competitive or comparative purpose, inclu=
ding the publication of any form of run time or compile time metric, withou=
t the express permission of Real Time Engineers Ltd. (this is the norm with=
in the industry and is intended to ensure information accuracy).
diff --git a/meta/files/common-licenses/gnu-javamail-exception b/meta/files=
/common-licenses/gnu-javamail-exception
new file mode 100644
index 0000000000..8f3b9ab0d0
--- /dev/null
+++ b/meta/files/common-licenses/gnu-javamail-exception
@@ -0,0 +1 @@
+As a special exception, if you link this library with other files to produ=
ce an executable, this library does not by itself cause the resulting execu=
table to be covered by the GNU General Public License. This exception does =
not however invalidate any other reasons why the executable file might be c=
overed by the GNU General Public License.
diff --git a/meta/files/common-licenses/harbour-exception b/meta/files/comm=
on-licenses/harbour-exception
new file mode 100644
index 0000000000..25d75e9fc7
--- /dev/null
+++ b/meta/files/common-licenses/harbour-exception
@@ -0,0 +1,23 @@
+As a special exception, the Harbour Project gives permission for
+additional uses of the text contained in its release of Harbour.
+
+The exception is that, if you link the Harbour libraries with other
+files to produce an executable, this does not by itself cause the
+resulting executable to be covered by the GNU General Public License.
+Your use of that executable is in no way restricted on account of
+linking the Harbour library code into it.
+
+This exception does not however invalidate any other reasons why
+the executable file might be covered by the GNU General Public License.
+
+This exception applies only to the code released by the Harbour
+Project under the name Harbour.  If you copy code from other
+Harbour Project or Free Software Foundation releases into a copy of
+Harbour, as the General Public License permits, the exception does
+not apply to the code that you add in this way.  To avoid misleading
+anyone as to the status of such modified files, you must delete
+this exception notice from them.
+
+If you write modifications of your own for Harbour, it is your choice
+whether to permit this exception to apply to your modifications.
+If you do not wish that, delete this exception notice.
diff --git a/meta/files/common-licenses/i2p-gpl-java-exception b/meta/files=
/common-licenses/i2p-gpl-java-exception
new file mode 100644
index 0000000000..2b7277d778
--- /dev/null
+++ b/meta/files/common-licenses/i2p-gpl-java-exception
@@ -0,0 +1 @@
+In addition, as a special exception, <<var;name=3Dlicensor;original=3DXXXX=
;match=3D.+>> gives permission to link the code of this program with the pr=
oprietary Java implementation provided by Sun (or other vendors as well), a=
nd distribute linked combinations including the two. You must obey the GNU =
General Public License in all respects for all of the code used other than =
the proprietary Java implementation. If you modify this file, you may exten=
d this exception to your version of the file, but you are not obligated to =
do so. If you do not wish to do so, delete this exception statement from yo=
ur version.
diff --git a/meta/files/common-licenses/kvirc-openssl-exception b/meta/file=
s/common-licenses/kvirc-openssl-exception
new file mode 100644
index 0000000000..beb605b8bd
--- /dev/null
+++ b/meta/files/common-licenses/kvirc-openssl-exception
@@ -0,0 +1,30 @@
+                       _OpenSSL Exception_
+
+0. Definitions
+
+"KVIrc" means KVIrc software licensed under version 2 or any later
+version of the GNU General Public License (collectively, "GPL"), or a
+work based on such software and licensed under the GPL.
+
+"OpenSSL" means OpenSSL toolkit software distributed by the OpenSSL
+Project and licensed under the OpenSSL Licenses, or a work based on such
+software and licensed under the OpenSSL Licenses.
+
+"OpenSSL Licenses" means the OpenSSL License and Original SSLeay License
+under which the OpenSSL Project distributes the OpenSSL toolkit software,
+as those licenses appear in the file LICENSE-OPENSSL.
+
+1. Exception
+
+You have permission to copy, modify, propagate, and distribute a work
+formed by combining OpenSSL with KVIrc, or a work derivative of such a
+combination, even if such copying, modification, propagation, or
+distribution would otherwise violate the terms of the GPL. You must
+comply with the GPL in all respects for all of the code used other than
+OpenSSL.
+
+You may include this OpenSSL Exception and its grant of permissions when
+you distribute KVIrc. Inclusion of this notice with such a
+distribution constitutes a grant of such permission. If you do not wish
+to grant these permissions, remove this section entitled "OpenSSL
+Exception" from your distribution.
diff --git a/meta/files/common-licenses/libpri-OpenH323-exception b/meta/fi=
les/common-licenses/libpri-OpenH323-exception
new file mode 100644
index 0000000000..490d9596d6
--- /dev/null
+++ b/meta/files/common-licenses/libpri-OpenH323-exception
@@ -0,0 +1,4 @@
+As a special exception, libpri may also be linked to the
+OpenH323 library, so long as the entirity of the derivative
+work (as defined within the GPL) is licensed either under
+the MPL of the OpenH323 license or the GPL of libpri.
diff --git a/meta/files/common-licenses/mif-exception b/meta/files/common-l=
icenses/mif-exception
new file mode 100644
index 0000000000..ceb2626c6f
--- /dev/null
+++ b/meta/files/common-licenses/mif-exception
@@ -0,0 +1 @@
+As a special exception, you may use this file as part of a free software l=
ibrary without restriction. Specifically, if other files instantiate templa=
tes or use macros or inline functions from this file, or you compile this f=
ile and link it with other files to produce an executable, this file does n=
ot by itself cause the resulting executable to be covered by the GNU Genera=
l Public License. This exception does not however invalidate any other reas=
ons why the executable file might be covered by the GNU General Public Lice=
nse.
diff --git a/meta/files/common-licenses/mxml-exception b/meta/files/common-=
licenses/mxml-exception
new file mode 100644
index 0000000000..32928e8dd6
--- /dev/null
+++ b/meta/files/common-licenses/mxml-exception
@@ -0,0 +1,16 @@
+Mini-XML
+
+Copyright =C2=A9 2003-2024 by Michael R Sweet
+
+
+(Optional) Exceptions to the Apache 2.0 License:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+In addition, if you combine or link compiled forms of this Software with
+software that is licensed under the GPLv2 or LGPLv2 (=E2=80=9CCombined Sof=
tware=E2=80=9D) and if
+a court of competent jurisdiction determines that the patent provision (Se=
ction
+3), the indemnity provision (Section 9) or other Section of the License
+conflicts with the conditions of the GPLv2 or LGPLv2, you may retroactivel=
y and
+prospectively choose to deem waived or otherwise exclude such Section(s) o=
f the
+License, but only in their entirety and only with respect to the Combined
+Software.
diff --git a/meta/files/common-licenses/openvpn-openssl-exception b/meta/fi=
les/common-licenses/openvpn-openssl-exception
new file mode 100644
index 0000000000..e9e0a367ea
--- /dev/null
+++ b/meta/files/common-licenses/openvpn-openssl-exception
@@ -0,0 +1,3 @@
+Special exception for linking OpenVPN with OpenSSL:
+
+In addition, as a special exception, OpenVPN Technologies, Inc. gives perm=
ission to link the code of this program with the OpenSSL Library (or with m=
odified versions of OpenSSL that use the same license as OpenSSL), and dist=
ribute linked combinations including the two. You must obey the GNU General=
 Public License in all respects for all of the code used other than OpenSSL=
. If you modify this file, you may extend this exception to your version of=
 the file, but you are not obligated to do so. If you do not wish to do so,=
 delete this exception statement from your version.
diff --git a/meta/files/common-licenses/polyparse-exception b/meta/files/co=
mmon-licenses/polyparse-exception
new file mode 100644
index 0000000000..55ed918bb9
--- /dev/null
+++ b/meta/files/common-licenses/polyparse-exception
@@ -0,0 +1,7 @@
+As a relaxation of clause 6 of the LGPL, the copyright holders of this
+library give permission to use, copy, link, modify, and distribute,
+binary-only object-code versions of an executable linked with the
+original unmodified Library, without requiring the supply of any
+mechanism to modify or replace the Library and relink (clauses 6a,
+6b, 6c, 6d, 6e), provided that all the other terms of clause 6 are
+complied with.
diff --git a/meta/files/common-licenses/romic-exception b/meta/files/common=
-licenses/romic-exception
new file mode 100644
index 0000000000..57def44818
--- /dev/null
+++ b/meta/files/common-licenses/romic-exception
@@ -0,0 +1,6 @@
+Additional permission under the GNU Affero GPL version 3 section 7:
+
+If you modify this Program, or any covered work, by linking or
+combining it with other code, such other code is not for that reason
+alone subject to any of the requirements of the GNU Affero GPL
+version 3.
diff --git a/meta/files/common-licenses/rsync-linking-exception b/meta/file=
s/common-licenses/rsync-linking-exception
new file mode 100644
index 0000000000..ddad55cb28
--- /dev/null
+++ b/meta/files/common-licenses/rsync-linking-exception
@@ -0,0 +1,6 @@
+In addition, as a special exception, the copyright holders give
+permission to dynamically link rsync with the OpenSSL and xxhash
+libraries when those libraries are being distributed in compliance
+with their license terms, and to distribute a dynamically linked
+combination of rsync and these libraries.  This is also considered
+to be covered under the GPL's System Libraries exception.
diff --git a/meta/files/common-licenses/sqlitestudio-OpenSSL-exception b/me=
ta/files/common-licenses/sqlitestudio-OpenSSL-exception
new file mode 100644
index 0000000000..07fdc13f98
--- /dev/null
+++ b/meta/files/common-licenses/sqlitestudio-OpenSSL-exception
@@ -0,0 +1,9 @@
+In addition, as a special exception, the copyright holders give
+permission to link the code of portions of this program with the OpenSSL
+library.
+You must obey the GNU General Public License in all respects for all of
+the code used other than OpenSSL. If you modify file(s) with this
+exception, you may extend this exception to your version of the file(s),
+but you are not obligated to do so. If you do not wish to do so, delete
+this exception statement from your version. If you delete this exception
+statement from all source files in the program, then also delete it here.=
=20=20
diff --git a/meta/files/common-licenses/stunnel-exception b/meta/files/comm=
on-licenses/stunnel-exception
new file mode 100644
index 0000000000..5e38d00a0f
--- /dev/null
+++ b/meta/files/common-licenses/stunnel-exception
@@ -0,0 +1,5 @@
+Linking stunnel statically or dynamically with other modules is making a c=
ombined work based on stunnel. Thus, the terms and conditions of the GNU Ge=
neral Public License cover the whole combination.
+
+In addition, as a special exception, the copyright holder of stunnel gives=
 you permission to combine stunnel with free software programs or libraries=
 that are released under the GNU LGPL and with code included in the standar=
d release of OpenSSL under the OpenSSL License (or modified versions of suc=
h code, with unchanged license). You may copy and distribute such a system =
following the terms of the GNU GPL for stunnel and the licenses of the othe=
r code concerned.
+
+Note that people who make modified versions of stunnel are not obligated t=
o grant this special exception for their modified versions; it is their cho=
ice whether to do so. The GNU General Public License gives permission to re=
lease a modified version without this exception; this exception also makes =
it possible to release a modified version which carries forward this except=
ion.
diff --git a/meta/files/common-licenses/u-boot-exception-2.0 b/meta/files/c=
ommon-licenses/u-boot-exception-2.0
new file mode 100644
index 0000000000..3158dade32
--- /dev/null
+++ b/meta/files/common-licenses/u-boot-exception-2.0
@@ -0,0 +1,6 @@
+The U-Boot License Exception:
+
+Even though U-Boot in general is covered by the GPL-2.0/GPL-2.0+, this doe=
s *not* cover the so-called "standalone" applications that use U-Boot servi=
ces by means of the jump table provided by U-Boot exactly for this purpose =
- this is merely considered normal use of U-Boot, and does *not* fall under=
 the heading of "derived work".
+
+The header files "include/image.h" and "arch/*/include/asm/u-boot.h" defin=
e interfaces to U-Boot. Including these (unmodified) header files in anothe=
r file is considered normal use of U-Boot, and does *not* fall under the he=
ading of "derived work".
+-- Wolfgang Denk
diff --git a/meta/files/common-licenses/vsftpd-openssl-exception b/meta/fil=
es/common-licenses/vsftpd-openssl-exception
new file mode 100644
index 0000000000..a864761e48
--- /dev/null
+++ b/meta/files/common-licenses/vsftpd-openssl-exception
@@ -0,0 +1,5 @@
+vsftpd is licensed under version 2 of the GNU GPL.
+As copyright holder, I give permission for vsftpd to be linked to the Open=
SSL
+libraries. This includes permission for vsftpd binaries to be distributed
+linked against the OpenSSL libraries. All other obligations under the GPL =
v2
+remain intact.
diff --git a/meta/files/common-licenses/x11vnc-openssl-exception b/meta/fil=
es/common-licenses/x11vnc-openssl-exception
new file mode 100644
index 0000000000..040e31c7a9
--- /dev/null
+++ b/meta/files/common-licenses/x11vnc-openssl-exception
@@ -0,0 +1,9 @@
+In addition, as a special exception, Karl J. Runge
+gives permission to link the code of its release of x11vnc with the
+OpenSSL project's "OpenSSL" library (or with modified versions of it
+that use the same license as the "OpenSSL" library), and distribute
+the linked executables.  You must obey the GNU General Public License
+in all respects for all of the code used other than "OpenSSL".  If you
+modify this file, you may extend this exception to your version of the
+file, but you are not obligated to do so.  If you do not wish to do
+so, delete this exception statement from your version.
diff --git a/meta/files/spdx-exceptions.json b/meta/files/spdx-exceptions.j=
son
new file mode 100644
index 0000000000..f9a5bc74b2
--- /dev/null
+++ b/meta/files/spdx-exceptions.json
@@ -0,0 +1,971 @@
+{
+  "exceptions": [
+    {
+      "detailsUrl": "https://spdx.org/licenses/389-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "389-exception",
+      "name": "389 Directory Server Exception",
+      "reference": "https://spdx.org/licenses/389-exception.html",
+      "referenceNumber": 49,
+      "seeAlso": [
+        "http://directory.fedoraproject.org/wiki/GPL_Exception_License_Tex=
t",
+        "https://web.archive.org/web/20080828121337/http://directory.fedor=
aproject.org/wiki/GPL_Exception_License_Text"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Asterisk-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Asterisk-exception",
+      "name": "Asterisk exception",
+      "reference": "https://spdx.org/licenses/Asterisk-exception.html",
+      "referenceNumber": 3,
+      "seeAlso": [
+        "https://github.com/asterisk/libpri/blob/7f91151e6bd10957c746c031c=
1f4a030e8146e9a/pri.c#L22",
+        "https://github.com/asterisk/libss7/blob/03e81bcd0d28ff25d4c77c783=
51ddadc82ff5c3f/ss7.c#L24"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Asterisk-linking-protocols-=
exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Asterisk-linking-protocols-exception",
+      "name": "Asterisk linking protocols exception",
+      "reference": "https://spdx.org/licenses/Asterisk-linking-protocols-e=
xception.html",
+      "referenceNumber": 4,
+      "seeAlso": [
+        "https://github.com/asterisk/asterisk/blob/115d7c01e32ccf4566a99e9=
d74e2b88830985a0b/LICENSE#L27"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Autoconf-exception-2.0.json=
",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Autoconf-exception-2.0",
+      "name": "Autoconf exception 2.0",
+      "reference": "https://spdx.org/licenses/Autoconf-exception-2.0.html",
+      "referenceNumber": 30,
+      "seeAlso": [
+        "http://ac-archive.sourceforge.net/doc/copyright.html",
+        "http://ftp.gnu.org/gnu/autoconf/autoconf-2.59.tar.gz"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Autoconf-exception-3.0.json=
",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Autoconf-exception-3.0",
+      "name": "Autoconf exception 3.0",
+      "reference": "https://spdx.org/licenses/Autoconf-exception-3.0.html",
+      "referenceNumber": 51,
+      "seeAlso": [
+        "http://www.gnu.org/licenses/autoconf-exception-3.0.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Autoconf-exception-generic.=
json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Autoconf-exception-generic",
+      "name": "Autoconf generic exception",
+      "reference": "https://spdx.org/licenses/Autoconf-exception-generic.h=
tml",
+      "referenceNumber": 28,
+      "seeAlso": [
+        "https://launchpad.net/ubuntu/precise/+source/xmltooling/+copyrigh=
t",
+        "https://tracker.debian.org/media/packages/s/sipwitch/copyright-1.=
9.15-3",
+        "https://opensource.apple.com/source/launchd/launchd-258.1/launchd=
/compile.auto.html",
+        "https://git.savannah.gnu.org/gitweb/?p=3Dgnulib.git;a=3Dblob;f=3D=
gnulib-tool;h=3D029a8cf377ad8d8f2d9e54061bf2f20496ad2eef;hb=3D73c74ba0197e6=
566da6882c87b1adee63e24d75c#l407"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Autoconf-exception-generic-=
3.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Autoconf-exception-generic-3.0",
+      "name": "Autoconf generic exception for GPL-3.0",
+      "reference": "https://spdx.org/licenses/Autoconf-exception-generic-3=
.0.html",
+      "referenceNumber": 37,
+      "seeAlso": [
+        "https://src.fedoraproject.org/rpms/redhat-rpm-config/blob/rawhide=
/f/config.guess"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Autoconf-exception-macro.js=
on",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Autoconf-exception-macro",
+      "name": "Autoconf macro exception",
+      "reference": "https://spdx.org/licenses/Autoconf-exception-macro.htm=
l",
+      "referenceNumber": 27,
+      "seeAlso": [
+        "https://github.com/freedesktop/xorg-macros/blob/39f07f7db58ebbf3d=
cb64a2bf9098ed5cf3d1223/xorg-macros.m4.in",
+        "https://www.gnu.org/software/autoconf-archive/ax_pthread.html",
+        "https://launchpad.net/ubuntu/precise/+source/xmltooling/+copyrigh=
t"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Bison-exception-1.24.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Bison-exception-1.24",
+      "name": "Bison exception 1.24",
+      "reference": "https://spdx.org/licenses/Bison-exception-1.24.html",
+      "referenceNumber": 15,
+      "seeAlso": [
+        "https://github.com/arineng/rwhoisd/blob/master/rwhoisd/mkdb/y.tab=
.c#L180"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Bison-exception-2.2.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Bison-exception-2.2",
+      "name": "Bison exception 2.2",
+      "reference": "https://spdx.org/licenses/Bison-exception-2.2.html",
+      "referenceNumber": 74,
+      "seeAlso": [
+        "http://git.savannah.gnu.org/cgit/bison.git/tree/data/yacc.c?id=3D=
193d7c7054ba7197b0789e14965b739162319b5e#n141"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Bootloader-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Bootloader-exception",
+      "name": "Bootloader Distribution Exception",
+      "reference": "https://spdx.org/licenses/Bootloader-exception.html",
+      "referenceNumber": 29,
+      "seeAlso": [
+        "https://github.com/pyinstaller/pyinstaller/blob/develop/COPYING.t=
xt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/CGAL-linking-exception.json=
",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "CGAL-linking-exception",
+      "name": "CGAL Linking Exception",
+      "reference": "https://spdx.org/licenses/CGAL-linking-exception.html",
+      "referenceNumber": 62,
+      "seeAlso": [
+        "https://github.com/openscad/openscad/blob/openscad-2021.01/COPYIN=
G#L3",
+        "https://github.com/floriankirsch/OpenCSG/blob/opencsg-1-4-2-relea=
se/license.txt#L3"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Classpath-exception-2.0.jso=
n",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Classpath-exception-2.0",
+      "name": "Classpath exception 2.0",
+      "reference": "https://spdx.org/licenses/Classpath-exception-2.0.html=
",
+      "referenceNumber": 2,
+      "seeAlso": [
+        "http://www.gnu.org/software/classpath/license.html",
+        "https://fedoraproject.org/wiki/Licensing/GPL_Classpath_Exception"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Classpath-exception-2.0-sho=
rt.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Classpath-exception-2.0-short",
+      "name": "Classpath exception 2.0 - short",
+      "reference": "https://spdx.org/licenses/Classpath-exception-2.0-shor=
t.html",
+      "referenceNumber": 52,
+      "seeAlso": [
+        "https://sourceforge.net/projects/lazarus/files/Lazarus%20Zip%20_%=
20GZip/Lazarus%204.2/lazarus-4.2-0.tar.gz/download"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/CLISP-exception-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "CLISP-exception-2.0",
+      "name": "CLISP exception 2.0",
+      "reference": "https://spdx.org/licenses/CLISP-exception-2.0.html",
+      "referenceNumber": 21,
+      "seeAlso": [
+        "http://sourceforge.net/p/clisp/clisp/ci/default/tree/COPYRIGHT"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/cryptsetup-OpenSSL-exceptio=
n.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "cryptsetup-OpenSSL-exception",
+      "name": "cryptsetup OpenSSL exception",
+      "reference": "https://spdx.org/licenses/cryptsetup-OpenSSL-exception=
.html",
+      "referenceNumber": 1,
+      "seeAlso": [
+        "https://gitlab.com/cryptsetup/cryptsetup/-/blob/main/COPYING",
+        "https://gitlab.nic.cz/datovka/datovka/-/blob/develop/COPYING",
+        "https://github.com/nbs-system/naxsi/blob/951123ad456bdf5ac94e8d88=
19342fe3d49bc002/naxsi_src/naxsi_raw.c",
+        "http://web.mit.edu/jgross/arch/amd64_deb60/bin/mosh",
+        "https://sourceforge.net/p/linux-ima/ima-evm-utils/ci/master/tree/=
src/evmctl.c#l30",
+        "https://github.com/ocaml-omake/omake/blob/master/LICENSE.OMake#L2=
0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Digia-Qt-LGPL-exception-1.1=
.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Digia-Qt-LGPL-exception-1.1",
+      "name": "Digia Qt LGPL Exception version 1.1",
+      "reference": "https://spdx.org/licenses/Digia-Qt-LGPL-exception-1.1.=
html",
+      "referenceNumber": 5,
+      "seeAlso": [
+        "https://src.fedoraproject.org/rpms/qtlockedfile/blob/rawhide/f/LG=
PL_EXCEPTION"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/DigiRule-FOSS-exception.jso=
n",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "DigiRule-FOSS-exception",
+      "name": "DigiRule FOSS License Exception",
+      "reference": "https://spdx.org/licenses/DigiRule-FOSS-exception.html=
",
+      "referenceNumber": 80,
+      "seeAlso": [
+        "http://www.digirulesolutions.com/drupal/foss"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/eCos-exception-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "eCos-exception-2.0",
+      "name": "eCos exception 2.0",
+      "reference": "https://spdx.org/licenses/eCos-exception-2.0.html",
+      "referenceNumber": 36,
+      "seeAlso": [
+        "http://ecos.sourceware.org/license-overview.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/erlang-otp-linking-exceptio=
n.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "erlang-otp-linking-exception",
+      "name": "Erlang/OTP Linking Exception",
+      "reference": "https://spdx.org/licenses/erlang-otp-linking-exception=
.html",
+      "referenceNumber": 26,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-faq.en.html#GPLIncompatibleLibs",
+        "https://erlang.org/pipermail/erlang-questions/2012-May/066355.htm=
l",
+        "https://gitea.osmocom.org/erlang/osmo_ss7/src/commit/2286c1b8738d=
715950026650bf53f19a69d6ed0e/src/ss7_links.erl#L20"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Fawkes-Runtime-exception.js=
on",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Fawkes-Runtime-exception",
+      "name": "Fawkes Runtime Exception",
+      "reference": "https://spdx.org/licenses/Fawkes-Runtime-exception.htm=
l",
+      "referenceNumber": 25,
+      "seeAlso": [
+        "http://www.fawkesrobotics.org/about/license/"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/FLTK-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "FLTK-exception",
+      "name": "FLTK exception",
+      "reference": "https://spdx.org/licenses/FLTK-exception.html",
+      "referenceNumber": 32,
+      "seeAlso": [
+        "http://www.fltk.org/COPYING.php"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/fmt-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "fmt-exception",
+      "name": "fmt exception",
+      "reference": "https://spdx.org/licenses/fmt-exception.html",
+      "referenceNumber": 72,
+      "seeAlso": [
+        "https://github.com/fmtlib/fmt/blob/master/LICENSE",
+        "https://github.com/fmtlib/fmt/blob/2eb363297b24cd71a68ccfb20ff755=
430f17e60f/LICENSE#L22C1-L27C62"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Font-exception-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Font-exception-2.0",
+      "name": "Font exception 2.0",
+      "reference": "https://spdx.org/licenses/Font-exception-2.0.html",
+      "referenceNumber": 39,
+      "seeAlso": [
+        "http://www.gnu.org/licenses/gpl-faq.html#FontException"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/freertos-exception-2.0.json=
",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "freertos-exception-2.0",
+      "name": "FreeRTOS Exception 2.0",
+      "reference": "https://spdx.org/licenses/freertos-exception-2.0.html",
+      "referenceNumber": 38,
+      "seeAlso": [
+        "https://web.archive.org/web/20060809182744/http://www.freertos.or=
g/a00114.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GCC-exception-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GCC-exception-2.0",
+      "name": "GCC Runtime Library exception 2.0",
+      "reference": "https://spdx.org/licenses/GCC-exception-2.0.html",
+      "referenceNumber": 78,
+      "seeAlso": [
+        "https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob;f=3Dgcc/libgcc1.c;h=
=3D762f5143fc6eed57b6797c82710f3538aa52b40b;hb=3Dcb143a3ce4fb417c68f5fa2691=
a1b1b1053dfba9#l10",
+        "https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dcsu/abi-no=
te.c;h=3Dc2ec208e94fbe91f63d3c375bd254b884695d190;hb=3DHEAD"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GCC-exception-2.0-note.json=
",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GCC-exception-2.0-note",
+      "name": "GCC    Runtime Library exception 2.0 - note variant",
+      "reference": "https://spdx.org/licenses/GCC-exception-2.0-note.html",
+      "referenceNumber": 53,
+      "seeAlso": [
+        "https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/x8=
6_64/start.S"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GCC-exception-3.1.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GCC-exception-3.1",
+      "name": "GCC Runtime Library exception 3.1",
+      "reference": "https://spdx.org/licenses/GCC-exception-3.1.html",
+      "referenceNumber": 48,
+      "seeAlso": [
+        "http://www.gnu.org/licenses/gcc-exception-3.1.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Gmsh-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Gmsh-exception",
+      "name": "Gmsh exception",
+      "reference": "https://spdx.org/licenses/Gmsh-exception.html",
+      "referenceNumber": 22,
+      "seeAlso": [
+        "https://gitlab.onelab.info/gmsh/gmsh/-/raw/master/LICENSE.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GNAT-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GNAT-exception",
+      "name": "GNAT exception",
+      "reference": "https://spdx.org/licenses/GNAT-exception.html",
+      "referenceNumber": 20,
+      "seeAlso": [
+        "https://github.com/AdaCore/florist/blob/master/libsrc/posix-confi=
gurable_file_limits.adb"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GNOME-examples-exception.js=
on",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GNOME-examples-exception",
+      "name": "GNOME examples exception",
+      "reference": "https://spdx.org/licenses/GNOME-examples-exception.htm=
l",
+      "referenceNumber": 35,
+      "seeAlso": [
+        "https://gitlab.gnome.org/Archive/gnome-devel-docs/-/blob/master/p=
latform-demos/C/legal.xml?ref_type=3Dheads",
+        "http://meldmerge.org/help/"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GNU-compiler-exception.json=
",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GNU-compiler-exception",
+      "name": "GNU Compiler Exception",
+      "reference": "https://spdx.org/licenses/GNU-compiler-exception.html",
+      "referenceNumber": 19,
+      "seeAlso": [
+        "https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dlibi=
berty/unlink-if-ordinary.c;h=3De49f2f2f67bfdb10d6b2bd579b0e01cad0fd708e;hb=
=3DHEAD#l19",
+        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/arch/powerpc/lib/crtsavres.S?h=3Dv6.16-rc6#n34"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/gnu-javamail-exception.json=
",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "gnu-javamail-exception",
+      "name": "GNU JavaMail exception",
+      "reference": "https://spdx.org/licenses/gnu-javamail-exception.html",
+      "referenceNumber": 71,
+      "seeAlso": [
+        "http://www.gnu.org/software/classpathx/javamail/javamail.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-389-ds-base-excepti=
on.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GPL-3.0-389-ds-base-exception",
+      "name": "GPL-3.0 389 DS Base Exception",
+      "reference": "https://spdx.org/licenses/GPL-3.0-389-ds-base-exceptio=
n.html",
+      "referenceNumber": 13,
+      "seeAlso": []
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-interface-exception=
.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GPL-3.0-interface-exception",
+      "name": "GPL-3.0 Interface Exception",
+      "reference": "https://spdx.org/licenses/GPL-3.0-interface-exception.=
html",
+      "referenceNumber": 11,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-faq.en.html#LinkingOverControlle=
dInterface"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-linking-exception.j=
son",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GPL-3.0-linking-exception",
+      "name": "GPL-3.0 Linking Exception",
+      "reference": "https://spdx.org/licenses/GPL-3.0-linking-exception.ht=
ml",
+      "referenceNumber": 59,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-faq.en.html#GPLIncompatibleLibs"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-linking-source-exce=
ption.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GPL-3.0-linking-source-exception",
+      "name": "GPL-3.0 Linking Exception (with Corresponding Source)",
+      "reference": "https://spdx.org/licenses/GPL-3.0-linking-source-excep=
tion.html",
+      "referenceNumber": 69,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-faq.en.html#GPLIncompatibleLibs",
+        "https://github.com/mirror/wget/blob/master/src/http.c#L20"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-CC-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GPL-CC-1.0",
+      "name": "GPL Cooperation Commitment 1.0",
+      "reference": "https://spdx.org/licenses/GPL-CC-1.0.html",
+      "referenceNumber": 40,
+      "seeAlso": [
+        "https://github.com/gplcc/gplcc/blob/master/Project/COMMITMENT",
+        "https://gplcc.github.io/gplcc/Project/README-PROJECT.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GStreamer-exception-2005.js=
on",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GStreamer-exception-2005",
+      "name": "GStreamer Exception (2005)",
+      "reference": "https://spdx.org/licenses/GStreamer-exception-2005.htm=
l",
+      "referenceNumber": 16,
+      "seeAlso": [
+        "https://gstreamer.freedesktop.org/documentation/frequently-asked-=
questions/licensing.html?gi-language=3Dc#licensing-of-applications-using-gs=
treamer"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GStreamer-exception-2008.js=
on",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "GStreamer-exception-2008",
+      "name": "GStreamer Exception (2008)",
+      "reference": "https://spdx.org/licenses/GStreamer-exception-2008.htm=
l",
+      "referenceNumber": 41,
+      "seeAlso": [
+        "https://gstreamer.freedesktop.org/documentation/frequently-asked-=
questions/licensing.html?gi-language=3Dc#licensing-of-applications-using-gs=
treamer"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/harbour-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "harbour-exception",
+      "name": "harbour exception",
+      "reference": "https://spdx.org/licenses/harbour-exception.html",
+      "referenceNumber": 60,
+      "seeAlso": [
+        "https://github.com/harbour/core/blob/master/LICENSE.txt#L44-L66"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/i2p-gpl-java-exception.json=
",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "i2p-gpl-java-exception",
+      "name": "i2p GPL+Java Exception",
+      "reference": "https://spdx.org/licenses/i2p-gpl-java-exception.html",
+      "referenceNumber": 58,
+      "seeAlso": [
+        "http://geti2p.net/en/get-involved/develop/licenses#java_exception"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Independent-modules-excepti=
on.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Independent-modules-exception",
+      "name": "Independent Module Linking exception",
+      "reference": "https://spdx.org/licenses/Independent-modules-exceptio=
n.html",
+      "referenceNumber": 9,
+      "seeAlso": [
+        "https://gitlab.com/freepascal.org/fpc/source/-/blob/release_3_2_2=
/rtl/COPYING.FPC"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/KiCad-libraries-exception.j=
son",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "KiCad-libraries-exception",
+      "name": "KiCad Libraries Exception",
+      "reference": "https://spdx.org/licenses/KiCad-libraries-exception.ht=
ml",
+      "referenceNumber": 46,
+      "seeAlso": [
+        "https://www.kicad.org/libraries/license/"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/kvirc-openssl-exception.jso=
n",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "kvirc-openssl-exception",
+      "name": "kvirc OpenSSL Exception",
+      "reference": "https://spdx.org/licenses/kvirc-openssl-exception.html=
",
+      "referenceNumber": 34,
+      "seeAlso": [
+        "https://github.com/kvirc/KVIrc/blob/ba18690abb4f5ce77bb10164ee083=
5cc150f4a2a/doc/ABOUT-LICENSE#L34"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0-linking-exception.=
json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "LGPL-3.0-linking-exception",
+      "name": "LGPL-3.0 Linking Exception",
+      "reference": "https://spdx.org/licenses/LGPL-3.0-linking-exception.h=
tml",
+      "referenceNumber": 56,
+      "seeAlso": [
+        "https://raw.githubusercontent.com/go-xmlpath/xmlpath/v2/LICENSE",
+        "https://github.com/goamz/goamz/blob/master/LICENSE",
+        "https://github.com/juju/errors/blob/master/LICENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/libpri-OpenH323-exception.j=
son",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "libpri-OpenH323-exception",
+      "name": "libpri OpenH323 exception",
+      "reference": "https://spdx.org/licenses/libpri-OpenH323-exception.ht=
ml",
+      "referenceNumber": 81,
+      "seeAlso": [
+        "https://github.com/asterisk/libpri/blob/1.6.0/README#L19-L22"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Libtool-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Libtool-exception",
+      "name": "Libtool Exception",
+      "reference": "https://spdx.org/licenses/Libtool-exception.html",
+      "referenceNumber": 14,
+      "seeAlso": [
+        "http://git.savannah.gnu.org/cgit/libtool.git/tree/m4/libtool.m4",
+        "https://git.savannah.gnu.org/cgit/libtool.git/tree/libltdl/lt__al=
loc.c#n15"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Linux-syscall-note.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Linux-syscall-note",
+      "name": "Linux Syscall Note",
+      "reference": "https://spdx.org/licenses/Linux-syscall-note.html",
+      "referenceNumber": 44,
+      "seeAlso": [
+        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/COPYING"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LLGPL.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "LLGPL",
+      "name": "LLGPL Preamble",
+      "reference": "https://spdx.org/licenses/LLGPL.html",
+      "referenceNumber": 47,
+      "seeAlso": [
+        "http://opensource.franz.com/preamble.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LLVM-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "LLVM-exception",
+      "name": "LLVM Exception",
+      "reference": "https://spdx.org/licenses/LLVM-exception.html",
+      "referenceNumber": 82,
+      "seeAlso": [
+        "http://llvm.org/foundation/relicensing/LICENSE.txt",
+        "https://web.archive.org/web/20240423023852/https://foundation.llv=
m.org/relicensing/LICENSE.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LZMA-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "LZMA-exception",
+      "name": "LZMA exception",
+      "reference": "https://spdx.org/licenses/LZMA-exception.html",
+      "referenceNumber": 83,
+      "seeAlso": [
+        "http://nsis.sourceforge.net/Docs/AppendixI.html#I.6"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/mif-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "mif-exception",
+      "name": "Macros and Inline Functions Exception",
+      "reference": "https://spdx.org/licenses/mif-exception.html",
+      "referenceNumber": 43,
+      "seeAlso": [
+        "http://www.scs.stanford.edu/histar/src/lib/cppsup/exception",
+        "http://dev.bertos.org/doxygen/",
+        "https://www.threadingbuildingblocks.org/licensing"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/mxml-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "mxml-exception",
+      "name": "mxml Exception",
+      "reference": "https://spdx.org/licenses/mxml-exception.html",
+      "referenceNumber": 61,
+      "seeAlso": [
+        "https://github.com/michaelrsweet/mxml/blob/master/NOTICE",
+        "https://github.com/michaelrsweet/mxml/blob/master/LICENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Nokia-Qt-exception-1.1.json=
",
+      "isDeprecatedLicenseId": true,
+      "licenseExceptionId": "Nokia-Qt-exception-1.1",
+      "name": "Nokia Qt LGPL exception 1.1",
+      "reference": "https://spdx.org/licenses/Nokia-Qt-exception-1.1.html",
+      "referenceNumber": 7,
+      "seeAlso": [
+        "https://www.keepassx.org/dev/projects/keepassx/repository/revisio=
ns/b8dfb9cc4d5133e0f09cd7533d15a4f1c19a40f2/entry/LICENSE.NOKIA-LGPL-EXCEPT=
ION"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/OCaml-LGPL-linking-exceptio=
n.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "OCaml-LGPL-linking-exception",
+      "name": "OCaml LGPL Linking Exception",
+      "reference": "https://spdx.org/licenses/OCaml-LGPL-linking-exception=
.html",
+      "referenceNumber": 54,
+      "seeAlso": [
+        "https://caml.inria.fr/ocaml/license.en.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/OCCT-exception-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "OCCT-exception-1.0",
+      "name": "Open CASCADE Exception 1.0",
+      "reference": "https://spdx.org/licenses/OCCT-exception-1.0.html",
+      "referenceNumber": 67,
+      "seeAlso": [
+        "http://www.opencascade.com/content/licensing"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/OpenJDK-assembly-exception-=
1.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "OpenJDK-assembly-exception-1.0",
+      "name": "OpenJDK Assembly exception 1.0",
+      "reference": "https://spdx.org/licenses/OpenJDK-assembly-exception-1=
.0.html",
+      "referenceNumber": 23,
+      "seeAlso": [
+        "http://openjdk.java.net/legal/assembly-exception.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/openvpn-openssl-exception.j=
son",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "openvpn-openssl-exception",
+      "name": "OpenVPN OpenSSL Exception",
+      "reference": "https://spdx.org/licenses/openvpn-openssl-exception.ht=
ml",
+      "referenceNumber": 18,
+      "seeAlso": [
+        "http://openvpn.net/index.php/license.html",
+        "https://github.com/psycopg/psycopg2/blob/2_9_3/LICENSE#L14"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/PCRE2-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "PCRE2-exception",
+      "name": "PCRE2 exception",
+      "reference": "https://spdx.org/licenses/PCRE2-exception.html",
+      "referenceNumber": 55,
+      "seeAlso": [
+        "https://www.pcre.org/licence.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/polyparse-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "polyparse-exception",
+      "name": "Polyparse Exception",
+      "reference": "https://spdx.org/licenses/polyparse-exception.html",
+      "referenceNumber": 6,
+      "seeAlso": [
+        "https://hackage.haskell.org/package/polyparse-1.13/src/COPYRIGHT"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/PS-or-PDF-font-exception-20=
170817.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "PS-or-PDF-font-exception-20170817",
+      "name": "PS/PDF font exception (2017-08-17)",
+      "reference": "https://spdx.org/licenses/PS-or-PDF-font-exception-201=
70817.html",
+      "referenceNumber": 66,
+      "seeAlso": [
+        "https://github.com/ArtifexSoftware/urw-base35-fonts/blob/65962e27=
febc3883a17e651cdb23e783668c996f/LICENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/QPL-1.0-INRIA-2004-exceptio=
n.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "QPL-1.0-INRIA-2004-exception",
+      "name": "INRIA QPL 1.0 2004 variant exception",
+      "reference": "https://spdx.org/licenses/QPL-1.0-INRIA-2004-exception=
.html",
+      "referenceNumber": 10,
+      "seeAlso": [
+        "https://git.frama-c.com/pub/frama-c/-/blob/master/licenses/Q_MODI=
FIED_LICENSE",
+        "https://github.com/maranget/hevea/blob/master/LICENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Qt-GPL-exception-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Qt-GPL-exception-1.0",
+      "name": "Qt GPL exception 1.0",
+      "reference": "https://spdx.org/licenses/Qt-GPL-exception-1.0.html",
+      "referenceNumber": 64,
+      "seeAlso": [
+        "http://code.qt.io/cgit/qt/qtbase.git/tree/LICENSE.GPL3-EXCEPT"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Qt-LGPL-exception-1.1.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Qt-LGPL-exception-1.1",
+      "name": "Qt LGPL exception 1.1",
+      "reference": "https://spdx.org/licenses/Qt-LGPL-exception-1.1.html",
+      "referenceNumber": 79,
+      "seeAlso": [
+        "http://code.qt.io/cgit/qt/qtbase.git/tree/LGPL_EXCEPTION.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Qwt-exception-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Qwt-exception-1.0",
+      "name": "Qwt exception 1.0",
+      "reference": "https://spdx.org/licenses/Qwt-exception-1.0.html",
+      "referenceNumber": 75,
+      "seeAlso": [
+        "http://qwt.sourceforge.net/qwtlicense.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/romic-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "romic-exception",
+      "name": "Romic Exception",
+      "reference": "https://spdx.org/licenses/romic-exception.html",
+      "referenceNumber": 76,
+      "seeAlso": [
+        "https://web.archive.org/web/20210124015834/http://mo.morsi.org/bl=
og/2009/08/13/lesser_affero_gplv3/",
+        "https://sourceforge.net/p/romic/code/ci/3ab2856180cf0d8b007609af5=
3154cf092efc58f/tree/COPYING",
+        "https://github.com/moll/node-mitm/blob/bbf24b8bd7596dc6e091e62536=
3161ce91984fc7/LICENSE#L8-L11",
+        "https://github.com/zenbones/SmallMind/blob/3c62b5995fe7f27c453f14=
0ff9b60560a0893f2a/COPYRIGHT#L25-L30",
+        "https://github.com/CubeArtisan/cubeartisan/blob/2c6ab53455237b88a=
3ea07be02a838a135c4ab79/LICENSE.LESSER#L10-L15",
+        "https://github.com/savearray2/py.js/blob/b781273c08c8afa89f4954de=
4ecf42ec01429bae/README.md#license"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/RRDtool-FLOSS-exception-2.0=
.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "RRDtool-FLOSS-exception-2.0",
+      "name": "RRDtool FLOSS exception 2.0",
+      "reference": "https://spdx.org/licenses/RRDtool-FLOSS-exception-2.0.=
html",
+      "referenceNumber": 70,
+      "seeAlso": [
+        "https://github.com/oetiker/rrdtool-1.x/blob/master/COPYRIGHT#L25-=
L90",
+        "https://oss.oetiker.ch/rrdtool/license.en.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/rsync-linking-exception.jso=
n",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "rsync-linking-exception",
+      "name": "rsync Linking Exception",
+      "reference": "https://spdx.org/licenses/rsync-linking-exception.html=
",
+      "referenceNumber": 33,
+      "seeAlso": [
+        "https://github.com/RsyncProject/rsync/blob/master/COPYING"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/SANE-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "SANE-exception",
+      "name": "SANE Exception",
+      "reference": "https://spdx.org/licenses/SANE-exception.html",
+      "referenceNumber": 63,
+      "seeAlso": [
+        "https://github.com/alexpevzner/sane-airscan/blob/master/LICENSE",
+        "https://gitlab.com/sane-project/backends/-/blob/master/sanei/sane=
i_pp.c?ref_type=3Dheads",
+        "https://gitlab.com/sane-project/frontends/-/blob/master/sanei/san=
ei_codec_ascii.c?ref_type=3Dheads"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/SHL-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "SHL-2.0",
+      "name": "Solderpad Hardware License v2.0",
+      "reference": "https://spdx.org/licenses/SHL-2.0.html",
+      "referenceNumber": 24,
+      "seeAlso": [
+        "https://solderpad.org/licenses/SHL-2.0/"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/SHL-2.1.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "SHL-2.1",
+      "name": "Solderpad Hardware License v2.1",
+      "reference": "https://spdx.org/licenses/SHL-2.1.html",
+      "referenceNumber": 45,
+      "seeAlso": [
+        "https://solderpad.org/licenses/SHL-2.1/"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Simple-Library-Usage-except=
ion.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Simple-Library-Usage-exception",
+      "name": "Simple Library Usage Exception",
+      "reference": "https://spdx.org/licenses/Simple-Library-Usage-excepti=
on.html",
+      "referenceNumber": 8,
+      "seeAlso": [
+        "https://sourceforge.net/p/teem/code/HEAD/tree/teem/trunk/LICENSE.=
txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/sqlitestudio-OpenSSL-except=
ion.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "sqlitestudio-OpenSSL-exception",
+      "name": "sqlitestudio OpenSSL exception",
+      "reference": "https://spdx.org/licenses/sqlitestudio-OpenSSL-excepti=
on.html",
+      "referenceNumber": 12,
+      "seeAlso": [
+        "https://github.com/pawelsalawa/sqlitestudio/blob/master/LICENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/stunnel-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "stunnel-exception",
+      "name": "stunnel Exception",
+      "reference": "https://spdx.org/licenses/stunnel-exception.html",
+      "referenceNumber": 68,
+      "seeAlso": [
+        "https://github.com/mtrojnar/stunnel/blob/master/COPYING.md"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/SWI-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "SWI-exception",
+      "name": "SWI exception",
+      "reference": "https://spdx.org/licenses/SWI-exception.html",
+      "referenceNumber": 77,
+      "seeAlso": [
+        "https://github.com/SWI-Prolog/packages-clpqr/blob/bfa80b9270274f0=
800120d5b8e6fef42ac2dc6a5/clpqr/class.pl"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Swift-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Swift-exception",
+      "name": "Swift Exception",
+      "reference": "https://spdx.org/licenses/Swift-exception.html",
+      "referenceNumber": 57,
+      "seeAlso": [
+        "https://swift.org/LICENSE.txt",
+        "https://github.com/apple/swift-package-manager/blob/7ab2275f447a5=
eb37497ed63a9340f8a6d1e488b/LICENSE.txt#L205"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Texinfo-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Texinfo-exception",
+      "name": "Texinfo exception",
+      "reference": "https://spdx.org/licenses/Texinfo-exception.html",
+      "referenceNumber": 73,
+      "seeAlso": [
+        "https://git.savannah.gnu.org/cgit/automake.git/tree/lib/texinfo.t=
ex?h=3Dv1.16.5#n23"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/u-boot-exception-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "u-boot-exception-2.0",
+      "name": "U-Boot exception 2.0",
+      "reference": "https://spdx.org/licenses/u-boot-exception-2.0.html",
+      "referenceNumber": 84,
+      "seeAlso": [
+        "http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3DLicenses/Exceptio=
ns"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/UBDL-exception.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "UBDL-exception",
+      "name": "Unmodified Binary Distribution exception",
+      "reference": "https://spdx.org/licenses/UBDL-exception.html",
+      "referenceNumber": 31,
+      "seeAlso": [
+        "https://github.com/ipxe/ipxe/blob/master/COPYING.UBDL"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Universal-FOSS-exception-1.=
0.json",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "Universal-FOSS-exception-1.0",
+      "name": "Universal FOSS Exception, Version 1.0",
+      "reference": "https://spdx.org/licenses/Universal-FOSS-exception-1.0=
.html",
+      "referenceNumber": 50,
+      "seeAlso": [
+        "https://oss.oracle.com/licenses/universal-foss-exception/"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/vsftpd-openssl-exception.js=
on",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "vsftpd-openssl-exception",
+      "name": "vsftpd OpenSSL exception",
+      "reference": "https://spdx.org/licenses/vsftpd-openssl-exception.htm=
l",
+      "referenceNumber": 65,
+      "seeAlso": [
+        "https://git.stg.centos.org/source-git/vsftpd/blob/f727873674d9c9c=
d7afcae6677aa782eb54c8362/f/LICENSE",
+        "https://launchpad.net/debian/squeeze/+source/vsftpd/+copyright",
+        "https://github.com/richardcochran/vsftpd/blob/master/COPYING"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/WxWindows-exception-3.1.jso=
n",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "WxWindows-exception-3.1",
+      "name": "WxWindows Library Exception 3.1",
+      "reference": "https://spdx.org/licenses/WxWindows-exception-3.1.html=
",
+      "referenceNumber": 17,
+      "seeAlso": [
+        "http://www.opensource.org/licenses/WXwindows"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/x11vnc-openssl-exception.js=
on",
+      "isDeprecatedLicenseId": false,
+      "licenseExceptionId": "x11vnc-openssl-exception",
+      "name": "x11vnc OpenSSL Exception",
+      "reference": "https://spdx.org/licenses/x11vnc-openssl-exception.htm=
l",
+      "referenceNumber": 42,
+      "seeAlso": [
+        "https://github.com/LibVNC/x11vnc/blob/master/src/8to24.c#L22"
+      ]
+    }
+  ],
+  "licenseListVersion": "3.28.0",
+  "releaseDate": "2026-02-20T00:00:00Z"
+}
\ No newline at end of file
--=20
2.54.0


