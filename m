Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcNd-00070s-Ja
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 09:56:50 +0200
Received: by pzk36 with SMTP id 36so1800607pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=1cRme6sZeXqeFfSUNxRGy6FuHSKG3UnqEPyPRg2IUWc=;
	b=M7i+IkeAa0irw3KQG1YNNBWmNsdBaG0K4assaZYGCG61r0vHT5DkvCFzUChUKXj/b4
	PGdLsNE9Pk2bnMHIrVo1TmHIB2Bs0VEiihGkQtb/lONT1zDChaT990jmNj6uxjfjMXtp
	a5Lk9CDHEkHVh2SspaO7iIv84QoLb4oHCdTDU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=CRh74wWxB76dVkwtN7L4ZD+GAVJar22ENOb5n7kw74cfWvglfCkW9Fcd7ZeNpT+uNv
	dHPxmMSQKtzg0NhU62OobIt0qlV5u2eHnzZu2Bt3yIGivSF4/JxcAb82J/8N3YtJbzc6
	7J+EQCq6JruXLYeU5yrUHMq3lkC0c4eUt5wMM=
Received: by 10.142.141.18 with SMTP id o18mr2343533wfd.303.1304754847056;
	Sat, 07 May 2011 00:54:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z10sm5209740wfj.15.2011.05.07.00.54.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 00:54:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat,  7 May 2011 00:54:02 -0700
Message-Id: <0a674cfa8f7de53b7b75c0213a483aad0276986f.1304754527.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304754527.git.raj.khem@gmail.com>
References: <cover.1304754527.git.raj.khem@gmail.com>
Subject: [PATCH 8/8] scripts/send-pull-request: Add CC selectively
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
X-List-Received-Date: Sat, 07 May 2011 07:56:50 -0000

Currently a consolidated pull request adds all the participants
to every patch, which in essence is good but might lose focus
of developers who would be interested to know about the patch
that developer contributed to. This patch fixes the script by
extracting the to and cc information from each patch one by one
and add it to patch mail header instead of doing a sweeping one
pass over all patches to collect all email addresses. It should
reduce some email traffic for developers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/send-pull-request |   51 +++++++++++++++++++++++++-------------------
 1 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 3af2a9f..36a89f4 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -29,24 +29,38 @@ EOM
 # Collect To and CC addresses from the patch files if they exist
 # $1: Which header to add the recipients to, "TO" or "CC"
 # $2: The regex to match and strip from the line with email addresses
+# $3: The patch which we are preparing to send
 harvest_recipients()
 {
     TO_CC=$1
     REGX=$2
+    PATCH=$3
     export IFS=$',\n'
-    for PATCH in $PDIR/*.patch; do
-        # Grab To addresses
-        for EMAIL in $(sed '/^---$/q' $PATCH | grep -e "$REGX" | sed "s/$REGX//"); do
-            if [ "$TO_CC" == "TO" ] && [ "${TO/$EMAIL/}" == "$TO" ] && [ -n "$EMAIL" ]; then
-                if [ -z "$TO" ]; then TO=$EMAIL; else TO="$TO,$EMAIL"; fi
-            elif [ "$TO_CC" == "CC" ] && [ "${CC/$EMAIL/}" == "$CC" ] && [ -n "$EMAIL" ]; then
-                if [ -z "$CC" ]; then CC=$EMAIL; else CC="$CC,$EMAIL"; fi
-            fi
-        done
+    # Grab To addresses
+    for EMAIL in $(sed '/^---$/q' $PATCH | grep -e "$REGX" | sed "s/$REGX//"); do
+        if [ "$TO_CC" == "TO" ] && [ "${TO/$EMAIL/}" == "$TO" ] && [ -n "$EMAIL" ]; then
+           if [ -z "$TO" ]; then TO=$EMAIL; else TO="$TO,$EMAIL"; fi
+        elif [ "$TO_CC" == "CC" ] && [ "${CC/$EMAIL/}" == "$CC" ] && [ -n "$EMAIL" ]; then
+           if [ -z "$CC" ]; then CC=$EMAIL; else CC="$CC,$EMAIL"; fi
+        fi
     done
     unset IFS
 }
 
+# $1: The given patch
+create_recipient_lists()
+{
+    THEPATCH=$1
+    # Harvest emails from the generated patch and populate the TO and CC variables
+    # In addition to To and CC headers/lines, the common Signed-off-by, Tested-by,
+    # etc. (*-by) will be added to CC.
+    if [ $AUTO -eq 1 ]; then
+        harvest_recipients TO "^[Tt][Oo]: *" $THEPATCH
+        harvest_recipients CC "^[Cc][Cc]: *" $THEPATCH
+        harvest_recipients CC "^.*-[Bb][Yy]: *" $THEPATCH
+    fi
+}
+
 
 # Parse and verify arguments
 while getopts "af:ghp:t:" OPT; do
@@ -100,15 +114,6 @@ for TOKEN in SUBJECT BLURB; do
 done
 
 
-# Harvest emails from the generated patches and populate the TO and CC variables
-# In addition to To and CC headers/lines, the common Signed-off-by, Tested-by,
-# etc. (*-by) will be added to CC.
-if [ $AUTO -eq 1 ]; then
-    harvest_recipients TO "^[Tt][Oo]: *"
-    harvest_recipients CC "^[Cc][Cc]: *"
-    harvest_recipients CC "^.*-[Bb][Yy]: *"
-fi
-
 case "$PULL_MTA" in
     git)
         FROM="$(git config sendemail.from)"
@@ -158,11 +163,12 @@ if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
     ERROR=0
     case "$PULL_MTA" in
         git)
-            export IFS=$','
-            GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
-            GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
-            unset IFS
             for PATCH in $PDIR/*patch; do
+                create_recipient_lists $PATCH
+                export IFS=$','
+                GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
+                GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
+                unset IFS
                 # We harvest the emails manually, so force git not to.
                 eval "git send-email $GIT_TO $GIT_CC --no-chain-reply-to --suppress-cc=all $PATCH"
                 if [ $? -eq 1 ]; then
@@ -172,6 +178,7 @@ if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
             ;;
         sendmail)
             for PATCH in $PDIR/*patch; do
+                create_recipient_lists $PATCH
                 # Insert To and CC headers via formail to keep them separate and
                 # appending them to the sendmail command as -- $TO $CC has
                 # proven to be an exercise in futility.
-- 
1.7.4.1



