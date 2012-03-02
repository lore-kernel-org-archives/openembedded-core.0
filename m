Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S3bVT-0004Sp-5q
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 00:03:23 +0100
Received: by dado14 with SMTP id o14so2201107dad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 14:54:50 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.218.228 as permitted sender) client-ip=10.68.218.228; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.218.228 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.218.228])
	by 10.68.218.228 with SMTP id pj4mr21763156pbc.167.1330728890884
	(num_hops = 1); Fri, 02 Mar 2012 14:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=zXPBjuTXomcHmkHS9YXh4I7tfjGUh1a45HE1o1R97jE=;
	b=b5xviadsazbgvZGl/xJ6S/Z5HE/7A8d2AEV8ptq4EezHwLmgtuzooNlCzZ1fW+vsMX
	vESFslkY+9L+h/J+PhnV5DEvavxVsZfga8ad1GF9WqGHNuZ+a+1PgoAWW9Oktn1IA6g1
	yHCs6LQMnvX0NNwYoX+Tipy5IFmh7T9ONBQrXbKrDJ9cvgwv1o3rZuOIIM9/3ASX2nPE
	pWmpY4hFRKczZC8Bmwe2S6CrYXjQElZa5ZJcYz0txtJfE9ZO/RtjPo7fbHsPNfPT6yf6
	X7SCIQBsEbFAg5tFt4T23TtcT6I7bQbIU4YVsTnQNRG/iySQvduZd2LbVDR3asX4CLhp
	qBaQ==
Received: by 10.68.218.228 with SMTP id pj4mr18215081pbc.167.1330728890830;
	Fri, 02 Mar 2012 14:54:50 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id y3sm6100411pbr.46.2012.03.02.14.54.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 14:54:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2012 14:54:25 -0800
Message-Id: <1330728865-21682-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] gcc-cross.inc: Fix cross testing scripts to work with dash
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
X-List-Received-Date: Fri, 02 Mar 2012 23:03:23 -0000

dash does not like >& so be explicit and say 2>&1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index b16c57d..e7a5e41 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -65,7 +65,7 @@ then
 	exit 1;
 fi
 
-echo "\$target" | grep "@" >& /dev/null
+echo "\$target" | grep "@" 2>&1 > /dev/null
 if [ "x\$?" = "x0" ]
 then
    user=\$(echo \$target | cut -d '@' -f 1)
@@ -73,7 +73,7 @@ then
 else
    user=\$USER
 fi
-ssh \$user@\$target date >& /dev/null
+ssh \$user@\$target date 2>&1 > /dev/null
 if [ "x\$?" != "x0" ]
 then
 	echo "Failed connecting to \$user@\$target it could be because"
-- 
1.7.5.4



