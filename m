Return-Path: <hainsvdbosch@ziggo.nl>
Received: from smtpq4.tb.mail.iss.as9143.net (smtpq4.tb.mail.iss.as9143.net
	[212.54.42.167])
	by mail.openembedded.org (Postfix) with ESMTP id 265966FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 20:32:57 +0000 (UTC)
Received: from [212.54.34.114] (helo=smtp6.mnd.mail.iss.as9143.net)
	by smtpq4.tb.mail.iss.as9143.net with esmtp (Exim 4.82)
	(envelope-from <hainsvdbosch@ziggo.nl>) id 1anBBB-0002Vu-9U
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2016 22:32:57 +0200
Received: from 52496b87.cm-4-2b.dynamic.ziggo.nl ([82.73.107.135]
	helo=localhost.localdomain)
	by smtp6.mnd.mail.iss.as9143.net with esmtpsa
	(TLS1.2:RSA_AES_128_CBC_SHA256:128) (Exim 4.82)
	(envelope-from <hainsvdbosch@ziggo.nl>)
	id 1anBBB-0005LD-5T; Mon, 04 Apr 2016 22:32:57 +0200
From: Hains van den Bosch <hainsvdbosch@ziggo.nl>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 22:32:48 +0200
Message-Id: <1459801968-2522-1-git-send-email-hainsvdbosch@ziggo.nl>
X-Mailer: git-send-email 2.7.4
X-Authenticated-Sender: hainsvdbosch@ziggo.nl (via SMTP)
X-Ziggo-spamsetting: Instelling=Ziggo Scorelimiet=10
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.1 cv=HOo+bdZv c=1 sm=0 tr=0
	a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=kziv93cY1bsA:10
	a=e5mUnYsNAAAA:8 a=CribuYeqOnIuZtXs3QAA:9
	xcat=Undefined/Undefined none
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
Subject: [PATCH] Revert "gstreamer1.0-plugins-bad_git: Remove obsolete PACKAGESPLITFUNCS_append = " handle_hls_rename ""
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
X-List-Received-Date: Mon, 04 Apr 2016 20:33:00 -0000

This reverts commit de9456df7d1591eac56b522cae853b77e7cf4e15.

It gives a smooth upgrade path from gstreamer 1.6.x to gstreamer >= 1.7.1
---
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb                | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index cb562ef..ef6581b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -51,3 +51,15 @@ do_configure_prepend() {
 	${S}/autogen.sh --noconfigure
 }
 
+# In 1.6.2, the "--enable-hls" configure option generated an installable package
+# called "gstreamer1.0-plugins-bad-fragmented". In 1.7.1 that HLS plugin package
+# has become "gstreamer1.0-plugins-bad-hls". See:
+# http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=efe62292a3d045126654d93239fdf4cc8e48ae08
+
+PACKAGESPLITFUNCS_append = " handle_hls_rename "
+
+python handle_hls_rename () {
+    d.setVar('RPROVIDES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
+    d.setVar('RREPLACES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
+    d.setVar('RCONFLICTS_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
+}
-- 
2.7.4


