Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyQW6-00028L-EN
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Mar 2011 16:14:06 +0100
Received: by pvc30 with SMTP id 30so596441pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2011 07:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=zRtwFuv8gbNxLnYrtrQRTgjX0zyQneI7K9NNeDpZm7U=;
	b=K+2AMgWulNBROEGjyZShU7/D+umHofBH3kZFBpYhA96M4LLFzZ9BosJghBDLzJIGZB
	hkuYr0fpgfktOJ559D7WM9IjU734rOQNR+zgqqadVUHwIKWB318Gn29Xmv2unrInohFj
	w+DM7vI/3EYHAMZm/vt7qLooF22i7hNkxncaI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vyFBm0ZEwgdWicJ6eK5hbkNyHdU7r/erYOawGxj7mccLozU2VFQ8jrY8iaN2KAfOfF
	D5V4Bx3tcVNspah68Khin0D94k2B6vctafoBtUckfj2PiUozehXEzVLheH9ph35o5jZn
	AVoqx8z1cAjgk1ly5mGK2oJNu/12358SRrepY=
Received: by 10.142.201.5 with SMTP id y5mr8599285wff.74.1299942742139;
	Sat, 12 Mar 2011 07:12:22 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w27sm7073447wfd.4.2011.03.12.07.12.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 07:12:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 12 Mar 2011 07:12:18 -0800
Message-Id: <9d1bcc0f0467186a24ddd8acd4bd7fbc1ae5ebea.1299942641.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1299942641.git.raj.khem@gmail.com>
References: <cover.1299942641.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] send-pull-request: Fetch TO email address from git config if specified
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
X-List-Received-Date: Sat, 12 Mar 2011 15:14:06 -0000

Usually people using git send-email has git config sendmail.to
configured to the usual mailing list or person so we harness that
here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/send-pull-request |   21 +++++++++++++++------
 1 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 7f51a1b..c5dc9a9 100755
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
+	if [ ! -e "$AUTO_TO" ]; then
+	    if [ ! -e $TO ]; then
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



