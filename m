Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 599B670674
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 03:10:13 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hy4so6439222vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 20:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=F/58Xc5kQfanzpptl8lCPV8A28rqnbf6vcKut5gycBM=;
	b=sMSY5947fLmwI3Istt1tS232nC61MAs5N90+8pVjYzn2Dy1lzIHOCXBHVJEALvx/Jt
	vbuRdU14xm78/ill73ahL83x0+zgq7Ct4TUXLHE13Z91xi4S/GFnVGEp5eZDO0Mgnt5t
	QO4wsaqMYfhgJL4pEvBte0otMLi2SzPkIWhuVgmntHl0I8qsRUQ8qmhjiYBIpk9KeWD0
	Q5EXxmx1Kv02QW5Ggzjrfr6Nhe/MpRHwI+rVG1iNksrK+SKFw7Bkv6eG55cBobxZ+TOZ
	h5wgSFNztoWk0o2n3amjhMl2yb+YGdRgvt6ToJNqziPLps7lHCLqXWWkx+rAcOGAbl/X
	vrvA==
X-Received: by 10.220.144.147 with SMTP id z19mr1618083vcu.26.1405653015242;
	Thu, 17 Jul 2014 20:10:15 -0700 (PDT)
Received: from localhost.localdomain ([201.53.220.248])
	by mx.google.com with ESMTPSA id 3sm8222020vde.6.2014.07.17.20.10.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Jul 2014 20:10:14 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jul 2014 00:09:26 -0300
Message-Id: <1405652966-7359-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1405652966-7359-1-git-send-email-joaohf@gmail.com>
References: <1405378518-4832-1-git-send-email-joaohf@gmail.com>
	<1405652966-7359-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [PATCH v3 2/2] populate_sdk_base: ensure that filenames with empty space character are handled
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
X-List-Received-Date: Fri, 18 Jul 2014 03:10:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When extracting toolchain, if the list $executable_files has filenames
with empty space character, the list will created but relocate_sdk.sh
will not handle it well. This will lead to the below erro:

    ./tmp/deploy/sdk/buildtools-mytools-x86_64-nativesdk-standalone-1.6.1.0.sh
    Enter target directory for SDK (default: /opt/mydistro/mytoolset/1.6.1.0):
    You are about to install the SDK to "/opt/mydistro/mytoolset/1.6.1.0". Proceed[Y/n]?
    Extracting SDK...done
    Setting it up.../opt/mydistro/mytoolset/1.6.1.0/relocate_sdk.sh: line 2: sintaxe error `token'  `('
    /opt/mydistro/mytoolset/1.6.1.0/relocate_sdk.sh: line 2: `e

The same occurs with replacement of ${SDKPATH} in configs/scripts/etc files.

We should ensure that full path is protected before relocate_sdk.sh
and ${SDKPATH} replacement calls.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/classes/populate_sdk_base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index a12bf11..0df98db 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -252,7 +252,7 @@ if [ "$dl_path" = "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
 	exit 1
 fi
-executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111)
+executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 -printf "'%h/%f' ")
 
 tdir=`mktemp -d`
 if [ x$tdir = x ] ; then
@@ -273,7 +273,7 @@ if [ $relocate = 1 ] ; then
 fi
 
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
-$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|cut -d':' -f1|$SUDO_EXEC xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
+$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|awk -F':' '{printf "%s\0", $1}'|$SUDO_EXEC xargs -0 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
 
 # change all symlinks pointing to ${SDKPATH}
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
-- 
1.9.1


