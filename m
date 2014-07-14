Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id B9DB67038D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 22:55:37 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id a41so647183yho.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=c1tHiCA5am5OcXNLIZZBYVu7YET4a7rpI+SE9bbu2iM=;
	b=Cn7maHsSIAB/ODvb8cwW2bXm+5oipv46pcADBdXnpDHn3ttRaQuNLQxPYq4VYL/qcJ
	48h3eyENODIJ9OEQ0jG+nZXxJnOfBkZxEQ2tE6ZDm+wpFDk2qtWyFfhn+xWxO443wJlI
	QOd8gejJ7XRY6i8sWMZ1est0o0392PUQ9MEFAKhEBW1jN94SAGa98QL42lVgAAR7KnSr
	V0tRRPcH+zNdBqPDOuXUCCuLCJ38bBngdYZ87x8ruaS45CHogmH5exfrkV7Xguny14q2
	QuGeFs7u4m/Rct+/Da+5UpK3nIARGoyqntqlVy/6iK2YjWVSOW+TQ5OxzOYS7DQVBk6V
	RE+w==
X-Received: by 10.236.35.198 with SMTP id u46mr33697577yha.54.1405378538633;
	Mon, 14 Jul 2014 15:55:38 -0700 (PDT)
Received: from localhost.localdomain ([201.53.220.248])
	by mx.google.com with ESMTPSA id f63sm23721868yhf.1.2014.07.14.15.55.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Jul 2014 15:55:37 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jul 2014 19:55:18 -0300
Message-Id: <1405378518-4832-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1405378518-4832-1-git-send-email-joaohf@gmail.com>
References: <1404266329-13524-1-git-send-email-joaohf@gmail.com>
	<1405378518-4832-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [PATCH v2 2/2] populate_sdk_base: ensure that filenames with empty space character are handled
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
X-List-Received-Date: Mon, 14 Jul 2014 22:55:37 -0000
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
index a12bf11..a6e23a1 100644
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
+$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|cut -d':' -f1|tr "\n" "\0"|$SUDO_EXEC xargs -0 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
 
 # change all symlinks pointing to ${SDKPATH}
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
-- 
1.9.1


