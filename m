Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Tsg45-00024d-RO
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 21:46:32 +0100
Received: by mail-pa0-f44.google.com with SMTP id hz11so550421pad.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 12:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=VFcQ3r5OZ2kTUuDx8e5/HOhTiBMqvpOKa4UQc0sjJp0=;
	b=oGvT4IQ1HfsAkRIlWwpXo4HD23hDTr7ZjxgIj2ZpQWXAZ0dZwLhkMvxHAPymc8Eezo
	hniu0qHAkcqflKGnpI6dm+NcLICEG1JWvFFX0Nb15uuYCVIcXSGz+kTQK5EHqm6jZ2u1
	/inG61ZCimUm/52qSO/gj9Q69pn8H3UCKhZLRpfahqISJhtgXTEt1UE1k5gJ2l3fMsOr
	l3cvjJeRFcT8bl/vvt6ba8EmXANE1AVstWOplQeamftVprpMBO4Bqj4L8HpJWAII4Kul
	jgjrA2dHQcnejxwXJvQdZRgoingto2wm84Mf3SNYxdJmKGyZ/AcXnp6YWl5gpf1Z3/YP
	KlzQ==
X-Received: by 10.66.83.165 with SMTP id r5mr183748568pay.3.1357677077157;
	Tue, 08 Jan 2013 12:31:17 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id bc1sm41318458pab.3.2013.01.08.12.31.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 12:31:15 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 13:31:07 -0700
Message-Id: <1357677067-26082-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.0.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] buildhistory-diff: prepend to sys.path
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
X-List-Received-Date: Tue, 08 Jan 2013 20:46:32 -0000

From: Christopher Larson <chris_larson@mentor.com>

This ensures that regardless of what else is in our search path, we always use
the bitbake corresponding to the running buildhistory-diff command.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/buildhistory-diff | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 3f27eab..8493da4 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -44,7 +44,7 @@ def main():
             print("Unable to find bitbake by searching parent directory of this script or PATH")
             sys.exit(1)
 
-    sys.path.extend([newpath, bitbakepath + '/lib'])
+    sys.path[0:0] = [newpath, bitbakepath + '/lib']
     import oe.buildhistory_analysis
 
     if len(sys.argv) > 3:
-- 
1.8.0.3



