Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 533826607F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 01:59:00 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id q9so6204205ykb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jul 2014 18:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=nJZ2cpHc2gRRbd5szBQcRrAUg38eg7AF5qrhO6RcIRw=;
	b=UMJt/TqBmSPkK1WmoRxrIvQyRpfncxfFfKojI/CIPgWVwi1JiF25OmhxRXbLzxUg0q
	PA9HynXj1Lgro8fiavgLDwsiUMU2BaNkMU4EWJZOGCn6ZkL3oOrxKFCNKeumJ55KCapD
	4zh3LnAkgH8axP41RRg2ha1aCDJGkBbpQTZbZaLf1WMfrhTAy8ila0MqzJwLHAF/WC3a
	B0YFzsDBgLYNbHzn7yRmrUDPtyZdL/NCb+tt+9QXkBXczLeJaEuKRHwrse9/Boya6UM/
	roD0SRzXYszSyddNPJ9uTm0ceN3eWEpRpzSwJKMt3XfA5kxN+NpGtylS6VCpbcJ28qm+
	kfwQ==
X-Received: by 10.236.221.162 with SMTP id r32mr28710219yhp.94.1404266342153; 
	Tue, 01 Jul 2014 18:59:02 -0700 (PDT)
Received: from localhost.localdomain ([201.53.220.248])
	by mx.google.com with ESMTPSA id
	d71sm28106373yho.24.2014.07.01.18.59.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Jul 2014 18:59:01 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Jul 2014 22:58:48 -0300
Message-Id: <1404266329-13524-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404266329-13524-1-git-send-email-joaohf@gmail.com>
References: <1404266329-13524-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 2/2] populate_sdk_base: ensure that filenames with empty space character are handled
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
X-List-Received-Date: Wed, 02 Jul 2014 01:59:01 -0000
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
index a12bf11..5311271 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -252,7 +252,7 @@ if [ "$dl_path" = "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
 	exit 1
 fi
-executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111)
+executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 -exec echo \'{}\' \;)
 
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


