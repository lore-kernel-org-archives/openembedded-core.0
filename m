Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 83FE160EA8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 17:19:24 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id j1so5109953oag.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2013 10:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4mU38IJblu/b/poLMNjjEo10ZgE1RHioe4rUxDb+yKo=;
	b=h6H9v6YgKZcpEVRmlTcr3COb3/0pG66PqO/mNjrismhh4Hz/MZSwRFh8L7SrVP7+aJ
	v4eZv8++dyNvGtNo+oRcj/w7TLP7+rZvVGUGisvuOfEeoHsNdMk58HfMRkbQYCQvMRim
	/3FkjakhkNrjeJBjmQYr6Kltmi7iwtLtq8DFgxOuxtguqtqi1gYX32in+au/g/bA4q66
	+6MGL8BXhAK5zGv9iuht2oSH3d2z/B/J36waBxrG+sCzgmVXW0LPTvA8hQ2BZm/u3tzO
	+WhPczyThXkpBrufemHGqwNULUstMa38ld8eUmp1aeZvsoTOvqtcsrd8gyDO1A8ivwpH
	9S9Q==
X-Gm-Message-State: ALoCoQkIMvOUyYwZ27Kn7OyJBwalUBmeMP5e8Bas8Lf5pn3vH5lqoZtAGNS6a6D2v0jZOkJj+OyY
X-Received: by 10.60.96.131 with SMTP id ds3mr2787813oeb.50.1380647965863;
	Tue, 01 Oct 2013 10:19:25 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id u3sm13795349oeq.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 01 Oct 2013 10:19:24 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2013 10:19:18 -0700
Message-Id: <1380647958-5424-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] update-rc: Stop and remove service if updating package
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
X-List-Received-Date: Tue, 01 Oct 2013 17:19:25 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

Since when updating packages packages managers do not remove the previous package,
it just replaces new files and run pre/post install scripts. This causes not
to update update-rc scripts if they were changed.

This patch is useful in case the newer package version updated the update-rc
script.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/classes/update-rc.d.bbclass | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 5588569..773ca60 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -13,7 +13,23 @@ INITSCRIPT_PARAMS ?= "defaults"
 INIT_D_DIR = "${sysconfdir}/init.d"
 
 updatercd_postinst() {
-if test "x$D" != "x"; then
+IN_TARGET=`test "x$D" = "x"`
+
+# test if there is a previous init script there, ie, we are updating the package
+# if so, we stop the service and remove it before we install from the new package
+if type update-rc.d >/dev/null 2>/dev/null; then
+	if [ $IN_TARGET -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ]; then
+		${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+	fi
+	if [ $IN_TARGET ]; then
+		OPT="-f -r $D"
+	else
+		OPT="-f"
+	fi
+	update-rc.d $OPT ${INITSCRIPT_NAME} remove
+fi
+
+if [ $IN_TARGET ]; then
 	OPT="-r $D"
 else
 	OPT="-s"
-- 
1.8.3.1


