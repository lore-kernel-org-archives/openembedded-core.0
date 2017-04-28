Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id DEE2C77E51
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 18:38:23 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 6A256AD01850; Fri, 28 Apr 2017 20:38:22 +0200 (CEST)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Apr 2017 20:38:21 +0200
Message-Id: <1493404702-17520-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] package_deb.bbclass: Fix multi-line package descriptions
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
X-List-Received-Date: Fri, 28 Apr 2017 18:38:24 -0000

In deb control files, each line of a long description starts with
a single space. Empty lines are represented by a single space
followed by a single full stop character.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 Please note: As opkg uses the same format, I believe this to be broken in
 do_package_ipk, too, which generates '.' for empty lines instead of ' .'.

 Contrary to the removed comment, the use of textwrap.fill is pointless here.

 meta/classes/package_deb.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 1f1bc81..3cd5efa 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -176,10 +176,7 @@ python do_package_deb () {
                  if '\\n' in description:
                      # Manually indent
                      for t in description.split('\\n'):
-                         # We don't limit the width when manually indent, but we do
-                         # need the textwrap.fill() to set the initial_indent and
-                         # subsequent_indent, so set a large width
-                         ctrlfile.write('%s\n' % textwrap.fill(t, width=100000, initial_indent=' ', subsequent_indent=' '))
+                         ctrlfile.write(' %s\n' % (t.strip() or '.'))
                  else:
                      # Auto indent
                      ctrlfile.write('%s\n' % textwrap.fill(description.strip(), width=74, initial_indent=' ', subsequent_indent=' '))
-- 
2.7.4


