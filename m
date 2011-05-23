Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QOU4P-0007sx-HF
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 14:17:13 +0200
Received: by gwb11 with SMTP id 11so2169547gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=cIVBtELui5Ta6EyWXfD413w/852EQBD/ShyD6i3XE4w=;
	b=lj8t0S7dhtx18Nck7eiEqYe9NebGxVvvtC7GW4VjwXkzHfLbsYQHp8F0N2Dcy+chtG
	vr15dcn/GiFy7MIL7VSpU4ZWn2NaofvoURI2glGkMcLg/yiwFyJCmZEv7bQ5sdHTYXxr
	amhpv7YZ9kS3XoNsFa6jmFTL5JDl+vVher1bA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=H4aqubPKjPbb8y4XDym7IAptQ99/DEiwF9scAWsaKJnpmkszAAp3wf4sh62pviUbAx
	y0r/Gpn6OkfP+nf2rXGKjeO051G2RVWgcDjcFTjPM/Sgm+j1Mqds+/cWJj0xPJiQCM1Q
	VUq94HuXTKl4pvN3JdC28K6yKWg6DYJ4FsB6I=
Received: by 10.91.21.1 with SMTP id y1mr2917747agi.169.1306152852779;
	Mon, 23 May 2011 05:14:12 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q8sm4737950ann.19.2011.05.23.05.14.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 05:14:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 12:13:53 +0000
Message-Id: <3811cce2a92514982ffc6f8c80ec08d3e030f7ef.1306152724.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306152724.git.otavio@ossystems.com.br>
References: <cover.1306152724.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306152724.git.otavio@ossystems.com.br>
References: <cover.1306152724.git.otavio@ossystems.com.br>
Subject: [PATCH 1/3] send-pull-request: drop sendemail checks
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
X-List-Received-Date: Mon, 23 May 2011 12:17:13 -0000

git send-email has the correct check on it. Basically the From is
taken from the git 'user' and 'email' config values and in case
'sendemail.smtpserver' is not provided it defaults to use local
sendmail command.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/send-pull-request |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index cee9253..5dfc246 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -67,19 +67,6 @@ harvest_recipients()
 	unset IFS
 }
 
-check_git_sendemail_config()
-{
-	GIT_SMTP=$(git config sendemail.smtpserver)
-	GIT_FROM=$(git config sendemail.from)
-	if [ -z "$GIT_SMTP" ] || [ -z "$GIT_FROM" ]; then
-		echo "ERROR: git sendemail is not configured."
-		echo "Please read GIT-SEND-EMAIL(1) and configure:"
-		echo "  sendemail.smtpserver"
-		echo "  sendemail.from"
-		exit 1
-	fi
-}
-
 # Parse and verify arguments
 while getopts "achp:t:" OPT; do
 	case $OPT in
@@ -113,9 +100,6 @@ while getopts "achp:t:" OPT; do
 	esac
 done
 
-# Abort early if git-send-email is not properly configured
-check_git_sendemail_config
-
 if [ -z "$PDIR" ]; then
 	echo "ERROR: you must specify a pull-dir."
 	usage
-- 
1.7.2.5



