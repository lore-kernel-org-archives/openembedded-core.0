Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 28A106A8D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:18:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HNuxG002576 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:23:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id a1NigNtgM8Af
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 18:23:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HNoia002516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:23:51 +0100
Message-ID: <1370625515.6864.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Jun 2013 18:18:35 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sanity: Drop pseudo test, now unneeded
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
X-List-Received-Date: Fri, 07 Jun 2013 17:18:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6cea423..3c70a7b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -204,29 +204,6 @@ def check_sanity_version_change(data):
     # Sanity checks to be done when SANITY_VERSION changes
     return ""
 
-def check_pseudo_wrapper():
-    import sys
-    if not sys.argv[0].endswith('/bitbake'):
-        return ""
-
-    import subprocess as sub
-    # Check if bitbake wrapper is being used
-    pseudo_build = os.environ.get( 'PSEUDO_BUILD' )
-    if not pseudo_build:
-        bb.warn("Bitbake has not been run using the bitbake wrapper (scripts/bitbake); this is likely because your PATH has been altered from that normally set up by the oe-init-build-env script. Not using the wrapper may result in failures during package installation, so it is highly recommended that you set your PATH back so that the wrapper script is being executed.")
-
-    if (not pseudo_build) or pseudo_build == '2':
-        # pseudo ought to be working, let's see if it is...
-        p = sub.Popen(['sh', '-c', 'PSEUDO_DISABLED=0 id -u'],stdout=sub.PIPE,stderr=sub.PIPE)
-        out, err = p.communicate()
-        if out.rstrip() != '0':
-            msg = "Pseudo is not functioning correctly, which will cause failures during package installation. Please check your configuration."
-            if pseudo_build == '2':
-                return msg
-            else:
-                bb.warn(msg)
-    return ""
-
 def check_create_long_filename(filepath, pathname):
     testfile = os.path.join(filepath, ''.join([`num`[-1] for num in xrange(1,200)]))
     try:
@@ -552,10 +529,6 @@ def check_sanity(sanity_data):
         missing = missing.rstrip(',')
         messages = messages + "Please install the following missing utilities: %s\n" % missing
 
-    pseudo_msg = check_pseudo_wrapper()
-    if pseudo_msg != "":
-        messages = messages + pseudo_msg + '\n'
-
     check_supported_distro(sanity_data)
     if machinevalid:
         toolchain_msg = check_toolchain(sanity_data)



