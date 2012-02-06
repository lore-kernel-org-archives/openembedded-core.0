Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuIP7-0004YI-OY
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 07:50:21 +0100
Received: by mail-pw0-f47.google.com with SMTP id b4so4117785pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 22:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=MQ3RAQm3QRAB6ZhJAwdE3/uLkixK5eV7hdBUT6pnO3c=;
	b=tO1s+l05YkclmrYQdFi2WlVUdIS6JDo9plr39KEnifD9HhXsVH+nGNlZW8kBHmSjpM
	LYaetjvOH5J3zGinftM0Z6dujzzXLPHcpOJiUiBCKV+sYHKGKWS8H0mLoqpCzElnlZHb
	5C7NKy2keuMeCjuMe71/lO4SwDPkjeiyy/XQ0=
Received: by 10.68.222.133 with SMTP id qm5mr5148606pbc.78.1328510542966;
	Sun, 05 Feb 2012 22:42:22 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	li19sm37030710pbb.17.2012.02.05.22.42.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 22:42:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2012 22:40:45 -0800
Message-Id: <2f04aa9f17c455c3d42ecb81975e425746973bef.1328510189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328510187.git.raj.khem@gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 19/20] gcc-cross-testing: Fix evaluation of user and target name
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
X-List-Received-Date: Mon, 06 Feb 2012 06:50:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dont use -q to grep we pipe to /dev/null anyway all we
care is the return status of grep

Signed-off-by: Khem Raj <raj.khem@gmail.com>

xxx

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 6acf8c5..b16c57d 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -65,11 +65,11 @@ then
 	exit 1;
 fi
 
-echo "\$target" | grep −q "@" >& /dev/null
+echo "\$target" | grep "@" >& /dev/null
 if [ "x\$?" = "x0" ]
 then
-   user=echo \$target | cut -d '@' -f 1
-   target=echo \$target | cut -d '@' -f 2
+   user=\$(echo \$target | cut -d '@' -f 1)
+   target=\$(echo \$target | cut -d '@' -f 2)
 else
    user=\$USER
 fi
-- 
1.7.5.4



