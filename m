Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4877A6EAB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:11:48 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fa1so2621329pad.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gplRSQw34M1o8sOCs93ovAqGgiPW2vpcGU6qZK/vrLM=;
	b=p6xuIOQjWInsygHcP62t/JGL3j86B/JUHZfLwwqdF2ecbKK5JLvRMdfmBpJWlBIIuR
	lvs/znY7ReRpKmEBHj1oeEmd6gdu8QzxOVHJ/MosULMZa3iZ+FZWZFfSko52KXi6Rx+z
	BJ5BIEh7FWOEKUGQNX9i1VTot7TH/NUW63xVadcU7ffUqNESpE7XWbfV4eZHm27mmtKj
	+UUReSJkZqjo2HoJBZloWZeJzJxFUJaIVHTI1/ys8J6LV3KU1UiAJJ2el01OSMxGUx9+
	rE6rTkS1zQeLrINtRQ2N2xcfHyvQw4CTw7GpRiWMl5qBr2u47UOGl1f5hL3BTw5pX764
	vMKA==
X-Received: by 10.67.8.102 with SMTP id dj6mr12075247pad.10.1391055109469;
	Wed, 29 Jan 2014 20:11:49 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	iu7sm12388951pbc.45.2014.01.29.20.11.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:11:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:12:26 -0800
Message-Id: <a7d4efe50d36d63781ff7ae2be88eec56019ef76.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
References: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
Subject: [PATCH 04/15] package_rpm.bbclass: Trigger the regexp on exact keyword match
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
X-List-Received-Date: Thu, 30 Jan 2014 04:11:48 -0000

This causes issues when postinstalls have ERROR keywords
its interpreted as error and image build is cancelled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/package_rpm.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 2d193b7..e9a6ac8 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -65,7 +65,7 @@ rpm_log_check() {
 	lf_txt="`cat $lf_path`"
 	for keyword_die in "unpacking of archive failed" "Cannot find package" "exit 1" ERR Fail
 	do
-		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
+		if (echo "$lf_txt" | grep -v log_check | grep "\<$keyword_die\>") >/dev/null 2>&1
 		then
 			echo "log_check: There were error messages in the logfile"
 			printf "log_check: Matched keyword: [$keyword_die]\n\n"
-- 
1.7.10.4


