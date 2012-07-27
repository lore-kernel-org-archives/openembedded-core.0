Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1SumJC-00088v-9g
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 17:18:30 +0200
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6RF6ujK020031
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 08:06:57 -0700 (PDT)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>) id 1Sum80-0000tI-0o
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 11:06:56 -0400
Date: Fri, 27 Jul 2012 11:06:55 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120727150655.GA3419@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] openssh: openssh's init fails to restart if sshd is not running
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
X-List-Received-Date: Fri, 27 Jul 2012 15:18:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

openssh: openssh's init fails to restart if sshd is not running
    
Because of "set -e", it's necessary to specify the -o (or --oknodo)
so that start-stop-daemon returns an exit status of 0 if no actions
are taken.
    
Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 init |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-5.9p1/init b/meta/recipes-connectivity/openssh/openssh-5.9p1/init
index 055dd22..6beec84 100644
--- a/meta/recipes-connectivity/openssh/openssh-5.9p1/init
+++ b/meta/recipes-connectivity/openssh/openssh-5.9p1/init
@@ -76,7 +76,7 @@ case "$1" in
   	check_keys
 	check_config
         echo -n "Restarting OpenBSD Secure Shell server: sshd"
-	start-stop-daemon -K -x /usr/sbin/sshd
+	start-stop-daemon -K --oknodo -x /usr/sbin/sshd
 	check_for_no_start
 	check_privsep_dir
 	sleep 2


