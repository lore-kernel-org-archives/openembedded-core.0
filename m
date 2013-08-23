Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 306C56B1FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 16:29:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NGf30l025239 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:41:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kdfiiZZOLkO2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:41:03 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NGeu0m025176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:40:58 +0100
Message-ID: <1377275329.6762.102.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Aug 2013 17:28:49 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] Add memory resident bitbake script
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
X-List-Received-Date: Fri, 23 Aug 2013 16:29:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This adds an init script which instead of the standard bitbake, launches
a memory resident bitbake, defaulting to port 12345. It expects a port
number to use as the first option.

Right now this is experimental but I think its probably worth wrapping
up in a form people can more easily experiment with it. There are some
known issues:

a) It throws some debug output due to the lack of a UI which we need
   to clean up
b) It should probably be able to auto select a free port
c) You get a nice backtrace if you specify a build directory but
   not a port number

I'd also highlight there are security issues here if you don't trust
users who can connect into localhost. We might need to look at named
pipes or something similar for something limited to the current user.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
new file mode 100755
index 0000000..15e4f44
--- /dev/null
+++ b/oe-init-build-env-memres
@@ -0,0 +1,55 @@
+#!/bin/sh
+
+# OE Build Environment Setup Script
+#
+# Copyright (C) 2006-2011 Linux Foundation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+
+#
+# Normally this is called as '. ./oe-init-build-env builddir <portnumber> <builddir>'
+#
+# This works in most shells (not dash), but not all of them pass arg1 when
+# being sourced.   To workaround the shell limitation use "set arg1" prior 
+# to sourcing this script.
+#
+if [ -z "$1" ]; then
+    echo "No port specified, using 12345"
+    port=12345
+else
+    port=$1
+    shift
+fi
+if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./oe-init-build-env" ]; then
+   echo "Error: This script needs to be sourced. Please run as '. ./oe-init-build-env'"
+else
+   if [ -n "$BASH_SOURCE" ]; then
+      OEROOT="`dirname $BASH_SOURCE`"
+   elif [ -n "$ZSH_NAME" ]; then
+      OEROOT="`dirname $0`"
+   else
+      OEROOT="`pwd`"
+   fi
+   OEROOT=`readlink -f "$OEROOT"`
+   export OEROOT
+   . $OEROOT/scripts/oe-buildenv-internal && \
+        $OEROOT/scripts/oe-setup-builddir && \
+        [ -n "$BUILDDIR" ] && cd $BUILDDIR
+   unset OEROOT
+   unset BBPATH
+fi
+bitbake --server-only -t xmlrpc -B localhost:$port
+export BBSERVER=localhost:$port
+echo "Bitbake server started on port %s, use bitbake -m to shut it down"



