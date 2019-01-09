Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id AE2E96BE2C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 20:31:08 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id t9-v6so7669132ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 12:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Bgt1QMb12Iaog87rhJ3Gvfu5XEkAsKrUu0e+wjMtZCo=;
	b=mEWhePNacv8C3hP7SUf+5ZzrD2LUohe607zJ8ayM+szoM37vZdUHUqVyEEKqSVbhH+
	Du5lhNScgSCaNHZZXkzvbpJC2BdrSBBYBQxGs/KkQPBA3IxvyFSturwUfwjEFRYE/1Rn
	7xUJjngH4vwtlGcO6Ba82kWJ2/V4oWrdrgPCnuEwe19XAOiCiux8drrFWooimKPP2ozY
	aZX1++5qn/oRjNRqLItprPsh3yXrZYzQZuEHVPYj646kT1KUDpv4A6FSq7ntwHdQr2Kv
	E6WCmeYlqSSlL4H/G43mG765jjkJKfBIajj2Sc4y/MQ/WDm66ImomdMQjU9jhYb68XPI
	Ag2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Bgt1QMb12Iaog87rhJ3Gvfu5XEkAsKrUu0e+wjMtZCo=;
	b=gyqBOhollZhBDgcxpufugDNP3duoO94YkX7xWOJi4KjBXpdP0+slXqUKWZlE0HEOJw
	2ayzYdimYCxhu+PIdjNumIny+Ln/ifeV7vLmuHQTsELzQTYj0vafW54aRH0S9WAgh5g8
	wm6SreHYB9hlTi0XpI04w6qoM6ZOE23qH7Y3d4z3utVoibAmtr0VV8lBQAxDdYbAY3SO
	waJUNsFJj+ZuzesfuGghexVodnQUrFFJ/5jocUqNeUCUVe+4RL8cTV5yDT8NG2jbgwh4
	abbUTZJdmlUMUE+Fainza4HVL3fMJOrqsFYsDGQUvEOMaF/AUrv55fK4Q3e2h/64hu19
	zbDA==
X-Gm-Message-State: AJcUukfG786rT2sK53OiCWZ1NlDJJhaHue9zB+itCvAVYg2oG5Kw3vHU
	Vg97hQsTU4uboTbkYa8opTZoDNqI5w4=
X-Google-Smtp-Source: ALg8bN5ofj7ZBClOnnN/QrGSGZ6IUKcj3bRXhjo8SzL/cKxPIZwsKmzavnXHORPo2lFlDGtVLVWuNg==
X-Received: by 2002:a2e:e02:: with SMTP id 2-v6mr2452917ljo.10.1547065868378; 
	Wed, 09 Jan 2019 12:31:08 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	q3sm13887132lff.42.2019.01.09.12.31.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Jan 2019 12:31:07 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2019 21:30:50 +0100
Message-Id: <20190109203051.12258-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2 1/2] buildhistory: simplify buildhistory_list_files()
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
X-List-Received-Date: Wed, 09 Jan 2019 20:31:09 -0000

Avoid duplicating shell code for the two cases, fakeroot/non-fakeroot.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/buildhistory.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index d1f3e6aa82..33eb1b00f6 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -519,12 +519,14 @@ buildhistory_get_sdk_installed_target() {
 
 buildhistory_list_files() {
 	# List the files in the specified directory, but exclude date/time etc.
-	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
+	# This is somewhat messy, but handles where the size is not printed for device files under pseudo
+	( cd $1
+	find_cmd='find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n"'
 	if [ "$3" = "fakeroot" ] ; then
-		( cd $1 && ${FAKEROOTENV} ${FAKEROOTCMD} find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
+		eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
 	else
-		( cd $1 && find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
-	fi
+		eval $find_cmd
+	fi | sort -k5 | sed 's/ * -> $//' > $2 )
 }
 
 buildhistory_list_pkg_files() {
-- 
2.11.0


