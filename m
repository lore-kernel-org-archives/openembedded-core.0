Received: from smtpout.karoo.kcom.com ([212.50.160.34])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1TPFqn-00019K-RB
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 18:55:09 +0200
X-IronPort-AV: E=Sophos;i="4.80,613,1344207600"; d="scan'208";a="671816184"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 19 Oct 2012 17:41:36 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1TPFdg-0003uP-LN
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 17:41:36 +0100
Date: Fri, 19 Oct 2012 17:41:36 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121019164136.GA14620@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: RFC bitbake patch: siggen.py: report individual changes to dict
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
X-List-Received-Date: Fri, 19 Oct 2012 16:55:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I found it quite difficult to find the actual change among the copious
output of bitbake-diffsigs when the environment differs so I came up
with this to simplify the reporting.

-----8<----

    siggen.py: If changed variable is a dict then report the individual values
    that have changed
    
    If the signature has changed due to a variable changing and that variable
    is a dict then try and report the individual values that have changed.

diff --git a/lib/bb/siggen.py b/lib/bb/siggen.py
index 862c73b..c72b164 100644
--- a/lib/bb/siggen.py
+++ b/lib/bb/siggen.py
@@ -363,7 +363,16 @@ def compare_sigfiles(a, b, recursecb = None):
     changed, added, removed = dict_diff(a_data['varvals'], b_data['varvals'])
     if changed:
         for dep in changed:
-            output.append("Variable %s value changed from %s to %s" % (dep, a_data['varvals'][dep], b_data['varvals'][dep]))
+            if isinstance(a_data['varvals'][dep], dict) and isinstance(b_data['varvals'][dep], dict):
+                subchanged, subadded, subremoved = dict_diff(a_data['varvals'][dep], b_data['varvals'][dep])
+                for k in subchanged:
+                    output.append("Variable %s value ['%s'] changed from '%s' to '%s'. " % (dep, k, a_data['varvals'][dep][k], b_data['varvals'][dep][k]))
+                for k in subadded:
+                    output.append("Variable %s value ['%s'] changed from not present to '%s'. " % (dep, k, b_data['varvals'][dep][k]))
+                for k in subremoved:
+                    output.append("Variable %s value ['%s'] changed from '%s' to not present. " % (dep, k, a_data['varvals'][dep][k]))
+            else:
+                output.append("Variable %s value changed from %s to %s" % (dep, a_data['varvals'][dep], b_data['varvals'][dep]))
 
     changed, added, removed = dict_diff(a_data['file_checksum_values'], b_data['file_checksum_values'])
     if changed:


