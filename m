Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UUylN-0002t8-IE for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 14:25:33 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UUyUF-00027u-MG
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 14:07:47 +0200
Message-ID: <1366805267.14512.29.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 13:07:47 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Set umask to 002 before packaging runs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 12:25:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise we might end up creating directories under sstate-cache with whatever
random umask has been selected for the task that we're trying to package.  This
would be a bad thing since it might result in losing group write access for
newly created dirs, and/or losing group read access for the sstate files 
themselves.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/sstate.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 03f083e..380eb66 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -507,7 +507,11 @@ python sstate_task_postfunc () {
     sstate_install(shared_state, d)
     for intercept in shared_state['interceptfuncs']:
         bb.build.exec_func(intercept, d)
+    omask = os.umask(002)
+    if omask != 002:
+       bb.note("Using umask 002 (not %0o) for sstate packaging" % omask)
     sstate_package(shared_state, d)
+    os.umask(omask)
 }
   
 
-- 
1.7.10.4





