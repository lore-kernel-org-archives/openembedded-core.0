Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9B66AF35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:27 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl14so2919209pab.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=mLtSJPaUqYMzgIOznO2zFtzSfUj+nPxz8Rucz0Krkxg=;
	b=Lmt+5Dn0GuHMXFlAPr8Otvc06xLLewPnTIJguPFAF9Fnx2whThgq8HSfQpzkKNCc3p
	MxYNpYyCBKHvdBRkQTl6+oxe8QiBIo0MjL/ng5rtapEDu+4PTZuD7ari+f19PMS9ram4
	cSXjXyu12F9V9hKa7Kuqhg6jLgwJ62/8tUEryR7bPJcqrxZZqYb5RjVVoZKahpF3Yvi9
	W7AvN6fKVacyqhCWu5df8VlaNHubD3f0s34DMPegi+QihtsEjSa5oBoQinARyMnbaVwn
	MrnJ4+8ta9likh4de77gPdsDASCvaz4N1H6erVH5u/sh0FCKVMky3n6HxzvfSOHes2dr
	i5/A==
X-Received: by 10.66.161.195 with SMTP id xu3mr2349448pab.56.1372457068539;
	Fri, 28 Jun 2013 15:04:28 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.27 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:03:48 -0700
Message-Id: <39ed900410e64702571f07f74086dc68827af42a.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 03/24] package_rpm.bbclass:Make the regexp less greedy
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:27 -0000

This causes issues when postinstalls have ERROR keywords
its interpreted as error and image build is cancelled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/package_rpm.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index c654cdb..eb618b4 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -60,7 +60,7 @@ rpm_log_check() {
 	lf_txt="`cat $lf_path`"
 	for keyword_die in "unpacking of archive failed" "Cannot find package" "exit 1" ERR Fail
 	do
-		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
+		if (echo "$lf_txt" | grep -v log_check | grep "\<$keyword_die\>") >/dev/null 2>&1
 		then
 			echo "log_check: There were error messages in the logfile"
 			printf "log_check: Matched keyword: [$keyword_die]\n\n"
-- 
1.7.9.5


