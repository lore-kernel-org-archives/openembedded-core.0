Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzhpM-0008J5-31
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 04:55:16 +0100
Received: by gxk3 with SMTP id 3so500357gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 20:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=5jeqEwyN8pp5bP3KXjy4XKC4OyTTHTEarHEjaLVAzv4=;
	b=sTmt8blrtTsQ+yhnsviIFt+x7b3BI8HiSzjg+4N3U9JpdqPkLVB+prC5eoU9m5MHOW
	a5l9/RlhiOP2fIqc696CZkt142e8Zs6kufgW7fOXJLE8xTp9tXBRkpz0/hzg8ArIBRzh
	5P5SzVtwW+r9aOJEDhnBH6p49GwfKBVQpNeBI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jlmqTl1faTcWdqdgLqe91vZzaYpohiyZqs0MoR6A9ejYQGIy4ezdZfzgSljI9C5S4W
	kE/IAg23iMR06gVWZGOZkwnbzYRdo0IPEyXEfFqe5G4Tq5ja8ES5vegCuZa4yn4cMQsZ
	/ZnQhHSr0zSG+bv8Kq4knost5CputAata+o0I=
Received: by 10.150.137.16 with SMTP id k16mr895989ybd.48.1300247611531;
	Tue, 15 Mar 2011 20:53:31 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t16sm467789ybe.4.2011.03.15.20.53.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 20:53:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Mar 2011 20:53:28 -0700
Message-Id: <25530fcd5ccb232f0236a03d8fcd45167fa8488e.1300247367.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300247367.git.raj.khem@gmail.com>
References: <cover.1300247367.git.raj.khem@gmail.com>
Subject: [PATCH, v2 1/1] send-pull-request: Fetch TO email address from git config if specified
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
X-List-Received-Date: Wed, 16 Mar 2011 03:55:16 -0000

Usually people using git send-email has git config sendmail.to
configured to the usual mailing list or person so we harness that
here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/send-pull-request |   21 +++++++++++++++------
 1 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 7f51a1b..3af2a9f 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -109,15 +109,17 @@ if [ $AUTO -eq 1 ]; then
     harvest_recipients CC "^.*-[Bb][Yy]: *"
 fi
 
-if [ -z "$TO" ] && [ -z "$CC" ]; then
-    echo "ERROR: you have not specified any recipients."
-    usage
-    exit 1
-fi
-
 case "$PULL_MTA" in
     git)
         FROM="$(git config sendemail.from)"
+	AUTO_TO="$(git config sendemail.to)"
+	if [ -n "$AUTO_TO" ]; then
+	    if [ -n "$TO" ]; then
+		TO="$TO,$AUTO_TO"
+	    else
+		TO="$AUTO_TO"
+	    fi
+	fi
         ;;
     sendmail)
         if [ -z "$FROM" ]; then
@@ -131,6 +133,13 @@ case "$PULL_MTA" in
         ;;
 esac
 
+if [ -z "$TO" ] && [ -z "$CC" ]; then
+    echo "ERROR: you have not specified any recipients."
+    usage
+    exit 1
+fi
+
+
 # Generate report for the user and require confirmation before sending
 cat <<EOM
 The following patches:
-- 
1.7.4.1



