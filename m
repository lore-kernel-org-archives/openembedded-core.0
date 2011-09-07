Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1M6U-0001l5-EE for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 19:40:02 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87HeuWE018014 for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 18:40:57 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vIis4EjxmFeu
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2011 18:40:56 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87Hen7j017988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 18:40:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 07 Sep 2011 18:34:47 +0100
Message-ID: <1315416887.13021.13.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: sstate: Avoid contention between sstate packages
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
X-List-Received-Date: Wed, 07 Sep 2011 17:40:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If several sstate packages are decompressing at the same time, they can
conflict over the "fixmepath". If two packages try to write to this at
the same time it results in an error. To avoid this we remove the file
once we've finished processing it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d7631ca..91f209a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -183,6 +183,9 @@ def sstate_installpkg(ss, d):
             os.system("sed -i -e s:FIXMESTAGINGDIRTARGET:%s:g %s" % (staging_target, sstateinst + file))
             os.system("sed -i -e s:FIXMESTAGINGDIRHOST:%s:g %s" % (staging_host, sstateinst + file))
             os.system("sed -i -e s:FIXMESTAGINGDIR:%s:g %s" % (staging, sstateinst + file))
+        # Need to remove this or we'd copy it into the target directory and may 
+        # conflict with another writer
+        os.remove(fixmefn)
 
     for state in ss['dirs']:
         prepdir(state[1])



