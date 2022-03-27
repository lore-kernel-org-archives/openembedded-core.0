Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53C9C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 16:41:23 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.775.1648399282821097586
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Zof6n2XV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id f10so2513065plr.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IjZ3Ajf4x//2FC2Qk4HWp3o2bYKT2rnDiZ9dx7A1HdE=;
        b=Zof6n2XVlCH3Qv88vZYchxhQ0QEzw7ou6DkW2b7Dv/KCYBiBB0te2YzOf6ujpth3mm
         TbBxb2egBLhqWmV9xOlHYlpgoAd7uO2iYHgT2IIOo2cm/bF8sudZSxYs/N1z1uYcIL1J
         1yUVJOBpJ8X5y1YN4lXUeifXOQxlrvGbr24o7FyLkk0g36OksoAgIRoVlFimTsXpNTsH
         C50w6u5+D+q9+zFQpGPx+mijy6+flNsgl/5BupQbGONIY0zIF/ft4Twei28uTifFNo4w
         1OuufNk74iFFDQZus1qidiM141hhj4Z00P3v2IIe4DMB8v1Dp3ucSybZQECWKAZF58VE
         J0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjZ3Ajf4x//2FC2Qk4HWp3o2bYKT2rnDiZ9dx7A1HdE=;
        b=UId8SjtsJMuxThSpnweF8JnkE2OUB4JWwUT7FTPM+g2hFe+bH92gJv72C3vwE6NAH/
         E4Ba8936sqiybFRxvD/CEg5kIKTP0+qo/kKFkYfAEoF1ZvrXcb8cq4EfYS9BQO6Nc2g/
         n6to4sJD5Mzhaio6xhcJZWEGOk+AlHlZdwslp3BEwWBjDqapvWc82arlrfOR7dD5rcgZ
         92eL124pw3sf3Jn5cIZhReTG0JvxaWS4B5TF3xnxr5BicfCyLlSIqVcPbZsUBv+PeubE
         O3O2yY/2ExB9TSw0ENbCAgGKAO0OQX1e44YJ05gMQ3/+nk8mOrLkB42JAk6FiR7IwfCs
         Z9Qg==
X-Gm-Message-State: AOAM532ymFi3cmzP8vurMo+NHDQYz23bZigMjHkeuSAe+09o+zsorxWY
	vX9oJZKpUDZvR9AiI+jmA773BG5e7MlnW6L2MA8=
X-Google-Smtp-Source: 
 ABdhPJyOrwjWoFLnrNc6UzapSVAw+usHU54GUDcCyA+k38YuYwPEcpmu9BU6UTeIbFmp9ICJKnkvfg==
X-Received: by 2002:a17:903:2285:b0:154:7dd3:c949 with SMTP id
 b5-20020a170903228500b001547dd3c949mr22284791plh.108.1648399281705;
        Sun, 27 Mar 2022 09:41:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm14583732pfh.143.2022.03.27.09.41.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 09:41:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/10] apt: backport patch fix for CVE-2020-3810
Date: Sun, 27 Mar 2022 06:40:54 -1000
Message-Id: 
 <2c58d4691b07230616272f2727e0ad0a345064be.1648399113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648399113.git.steve@sakoman.com>
References: <cover.1648399113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 16:41:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163670

From: Davide Gardenal <davidegarde2000@gmail.com>

Upstream commit:
https://salsa.debian.org/apt-team/apt/-/blob/dceb1e49e4b8e4dadaf056be34088b415939cda6/apt-pkg/contrib/arfile.cc

CVE: CVE-2020-3810

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/apt/apt.inc             |   1 +
 .../apt/apt/CVE-2020-3810.patch               | 174 ++++++++++++++++++
 2 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/CVE-2020-3810.patch

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 3c4fc6df07..ba827848a7 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${BPN}/${P
            file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
            file://0001-apt-1.2.12-Fix-musl-build.patch \
            file://0001-Include-array.h-for-std-array.patch \
+           file://CVE-2020-3810.patch \
            "
 SRC_URI[md5sum] = "d30eed9304e82ea8238c854b5c5a34d9"
 SRC_URI[sha256sum] = "03ded4f5e9b8d43ecec083704b2dcabf20c182ed382db9ac7251da0b0b038059"
diff --git a/meta/recipes-devtools/apt/apt/CVE-2020-3810.patch b/meta/recipes-devtools/apt/apt/CVE-2020-3810.patch
new file mode 100644
index 0000000000..cf1206a3fa
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/CVE-2020-3810.patch
@@ -0,0 +1,174 @@
+From dceb1e49e4b8e4dadaf056be34088b415939cda6 Mon Sep 17 00:00:00 2001
+From: Julian Andres Klode <julian.klode@canonical.com>
+Date: Tue, 12 May 2020 11:49:09 +0200
+Subject: [PATCH] SECURITY UPDATE: Fix out of bounds read in .ar and .tar
+ implementation (CVE-2020-3810)
+
+When normalizing ar member names by removing trailing whitespace
+and slashes, an out-out-bound read can be caused if the ar member
+name consists only of such characters, because the code did not
+stop at 0, but would wrap around and continue reading from the
+stack, without any limit.
+
+Add a check to abort if we reached the first character in the
+name, effectively rejecting the use of names consisting just
+of slashes and spaces.
+
+Furthermore, certain error cases in arfile.cc and extracttar.cc have
+included member names in the output that were not checked at all and
+might hence not be nul terminated, leading to further out of bound reads.
+
+Fixes Debian/apt#111
+LP: #1878177
+
+CVE: CVE-2020-3810
+
+Upstream-Status: Backport:
+https://salsa.debian.org/apt-team/apt/-/commit/dceb1e49e4b8e4dadaf056be34088b415939cda6
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+apt-inst/contrib/arfile.cc                     | 11 ++-
+apt-inst/contrib/extracttar.cc                 |  2 +-
+.../test-github-111-invalid-armember          | 88 +++++++++++++++++++
+ 3 files changed, 98 insertions(+), 3 deletions(-)
+ create mode 100755 test/integration/test-github-111-invalid-armember
+
+diff --git a/apt-inst/contrib/arfile.cc b/st/contrib/arfile.cc
+index 3fc3afedb..5cb43c690 100644
+--- a/apt-inst/contrib/arfile.cc
++++ b/apt-inst/contrib/arfile.cc
+@@ -92,7 +92,7 @@ bool ARArchive::LoadHeaders()
+ 	  StrToNum(Head.Size,Memb->Size,sizeof(Head.Size)) == false)
+       {
+ 	 delete Memb;
+-	 return _error->Error(_("Invalid archive member header %s"), Head.Name);
++	 return _error->Error(_("Invalid archive member header"));
+       }
+ 	 
+       // Check for an extra long name string
+@@ -119,7 +119,14 @@ bool ARArchive::LoadHeaders()
+       else
+       {
+ 	 unsigned int I = sizeof(Head.Name) - 1;
+-	 for (; Head.Name[I] == ' ' || Head.Name[I] == '/'; I--);
++	 for (; Head.Name[I] == ' ' || Head.Name[I] == '/'; I--)
++	 {
++	    if (I == 0)
++	    {
++	       delete Memb;
++	       return _error->Error(_("Invalid archive member header"));
++	    }
++	 }
+ 	 Memb->Name = std::string(Head.Name,I+1);
+       }
+ 
+diff --git a/apt-inst/contrib/extracttar.cc b/apt-inst/contrib/extracttar.cc
+index 9bb0a55c0..b22f59dbc 100644
+--- a/apt-inst/contrib/extracttar.cc
++++ b/apt-inst/contrib/extracttar.cc
+@@ -254,7 +254,7 @@ bool ExtractTar::Go(pkgDirStream &Stream)
+ 	 
+ 	 default:
+ 	 BadRecord = true;
+-	 _error->Warning(_("Unknown TAR header type %u, member %s"),(unsigned)Tar->LinkFlag,Tar->Name);
++	 _error->Warning(_("Unknown TAR header type %u"), (unsigned)Tar->LinkFlag);
+ 	 break;
+       }
+       
+diff --git a/test/integration/test-github-111-invalid-armember b/test/integration/test-github-111-invalid-armember
+new file mode 100755
+index 000000000..ec2163bf6
+--- /dev/null
++++ b/test/integration/test-github-111-invalid-armember
+@@ -0,0 +1,88 @@
++#!/bin/sh
++set -e
++
++TESTDIR="$(readlink -f "$(dirname "$0")")"
++. "$TESTDIR/framework"
++setupenvironment
++configarchitecture "amd64"
++setupaptarchive
++
++# this used to crash, but it should treat it as an invalid member header
++touch ' '
++ar -q test.deb ' '
++testsuccessequal "E: Invalid archive member header" ${BUILDDIRECTORY}/../test/interactive-helper/testdeb test.deb
++
++
++rm test.deb
++touch 'x'
++ar -q test.deb 'x'
++testsuccessequal "E: This is not a valid DEB archive, missing 'debian-binary' member" ${BUILDDIRECTORY}/../test/interactive-helper/testdeb test.deb
++
++
++# <name><size> [ other fields] - name is not nul terminated here, it ends in .
++msgmsg "Unterminated ar member name"
++printf '!<arch>\0120123456789ABCDE.A123456789A.01234.01234.0123456.012345678.0.' > test.deb
++testsuccessequal "E: Invalid archive member header" ${BUILDDIRECTORY}/../test/interactive-helper/testdeb test.deb
++
++
++# unused source code for generating $tar below
++maketar() {
++	cat > maketar.c << EOF
++	#include <stdio.h>
++	#include <string.h>
++	struct tar {
++	   char Name[100];
++	   char Mode[8];
++	   char UserID[8];
++	   char GroupID[8];
++	   char Size[12];
++	   char MTime[12];
++	   char Checksum[8];
++	   char LinkFlag;
++	   char LinkName[100];
++	   char MagicNumber[8];
++	   char UserName[32];
++	   char GroupName[32];
++	   char Major[8];
++	   char Minor[8];
++	};
++
++	int main(void)
++	{
++		union {
++			struct tar t;
++			char buf[512];
++		} t;
++		for (int i = 0; i < sizeof(t.buf); i++)
++			t.buf[i] = '7';
++		memcpy(t.t.Name, "unterminatedName", 16);
++		memcpy(t.t.UserName, "userName", 8);
++		memcpy(t.t.GroupName, "thisIsAGroupNamethisIsAGroupName", 32);
++		t.t.LinkFlag = 'X'; // I AM BROKEN
++		memcpy(t.t.Size, "000000000000", sizeof(t.t.Size));
++		memset(t.t.Checksum,' ',sizeof(t.t.Checksum));
++
++		unsigned long sum = 0;
++		for (int i = 0; i < sizeof(t.buf); i++)
++			sum += t.buf[i];
++
++		int written = sprintf(t.t.Checksum, "%lo", sum);
++		for (int i = written; i < sizeof(t.t.Checksum); i++)
++			t.t.Checksum[i] = ' ';
++		fwrite(t.buf, sizeof(t.buf), 1, stdout);
++	}
++EOF
++
++	gcc maketar.c -o maketar -Wall
++	./maketar
++}
++
++
++#
++tar="unterminatedName77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777700000000000077777777777773544   X777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777userName777777777777777777777777thisIsAGroupNamethisIsAGroupName777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777"
++printf '%s' "$tar" | gzip > control.tar.gz
++cp control.tar.gz data.tar.gz
++touch debian-binary
++rm test.deb
++ar -q test.deb debian-binary control.tar.gz data.tar.gz
++testsuccessequal "W: Unknown TAR header type 88" ${BUILDDIRECTORY}/../test/interactive-helper/testdeb test.deb
+-- 
+GitLab 
-- 
2.25.1


