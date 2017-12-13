Return-Path: <tobias.hagelborn@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BCA678863
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 10:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 50439183B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:53:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ixbzA2-ZhltK
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:53:56 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 55198183AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:53:56 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F5A51E06E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:53:56 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3432A1E06C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:53:56 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:53:56 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 288D0DBE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:53:56 +0100 (CET)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 13 Dec 2017 11:53:55 +0100
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Dec 2017 11:53:17 +0100
Message-ID: <1513162397-21000-3-git-send-email-tobiasha@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1513162397-21000-1-git-send-email-tobiasha@axis.com>
References: <1513162397-21000-1-git-send-email-tobiasha@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH v3 2/2] devtool: srctree: New command for setting up browsable source-code
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
X-List-Received-Date: Wed, 13 Dec 2017 10:53:58 -0000
Content-Type: text/plain

Setup a directory tree for source code according to section name.
(if known).

This tree is intended for code browsing ONLY.
If source is moved, for instance with devtool modify,
this command should be rerun to be up-to-date with that move.

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
---
 scripts/lib/devtool/srctree.py | 87 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 scripts/lib/devtool/srctree.py

diff --git a/scripts/lib/devtool/srctree.py b/scripts/lib/devtool/srctree.py
new file mode 100644
index 0000000..f32088e
--- /dev/null
+++ b/scripts/lib/devtool/srctree.py
@@ -0,0 +1,87 @@
+# Development tool - srctree command plugin
+#
+# Copyright (C) 2016-2017 Axis Communications AB
+# Author: Tobias Hagelborn <tobias.hagelborn@axis.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+
+"""Devtool srctree plugin"""
+
+import os
+import logging
+import tempfile
+import bb
+
+from devtool import exec_build_env_command
+
+logger = logging.getLogger('devtool')
+
+
+def _create_conf_file(values, conf_file=None):
+    """ Create bitbake config for use with srctree devtool command """
+    if not conf_file:
+        _, conf_file = tempfile.mkstemp(suffix='.conf')
+    elif not os.path.exists(os.path.dirname(conf_file)):
+        logger.debug("Creating folder %s", os.path.dirname(conf_file))
+        bb.utils.mkdirhier(os.path.dirname(conf_file))
+    if values:
+        with open(conf_file, 'w') as f:
+            for key, value in values.items():
+                f.write('%s = "%s"\n' % (key, value))
+    return conf_file
+
+
+#pylint: disable=unused-argument
+def srctree(args, config, basepath, workspace):
+    """Entry point for the devtool 'srctree' subcommand"""
+
+    values = {}
+    if args.destination:
+        values['SRCTREE_DIR'] = os.path.abspath(args.destination)
+        logger.info('Setting up srctree in: %s', values['SRCTREE_DIR'])
+    if args.verbose:
+        values['SRCTREE_VERBOSE'] = "1"
+    conf_file = _create_conf_file(values)
+
+    with open(conf_file, 'a') as f:
+        f.write('INHERIT += "srctree"\n')
+
+    workdir = basepath
+    exec_build_env_command(
+        config.init_path, workdir,
+        'bitbake -k -R %s -c srctree_all %s' % (conf_file, ' '.join(args.recipename)),
+        watch=True)
+    os.unlink(conf_file)
+
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
+    parser_search = subparsers.add_parser(
+        'srctree',
+        help='Setup a directory tree for source code browsing',
+        description='Setup a directory tree for source code according to section name (if known). '
+                    'This tree is intended for code browsing ONLY. '
+                    'If source is moved, for instance with devtool modify, '
+                    'this command should be rerun to be up-to-date with that move. '
+                    'Please read the README file that is created together with '
+                    'the source tree for more information.')
+    parser_search.add_argument('recipename', nargs='+',
+                               help='Recipe to use. Multiple recipes are accepted. '
+                               'Example: core-image-minimal')
+    parser_search.add_argument('-D', '--destination',
+                               help='Destination root folder. Default: ${TMPDIR}/srctree.')
+    parser_search.add_argument('-v', '--verbose', action="store_true",
+                               help='Be more verbose.')
+    parser_search.set_defaults(func=srctree)
-- 
2.1.4


