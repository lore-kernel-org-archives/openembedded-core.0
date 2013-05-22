Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7B96A364
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 19:46:06 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so2051676pbc.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 12:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=l39QjFogM6iUScbIbSaCUAc/IwVcL0DHub/Etm7XC4k=;
	b=UWC5W2bcovxItj2NRUXIffJ9NwFBHu5PW4lOVDNS5/558md47zL/r//LTANU/QUdra
	KgDykTV6O/LfSSV3gEIR5gTfBlYHC/GMfox4sIXdMYc9nULzk+guWXAbfTMSGPoZCCxL
	Q48mGH+oOT8LSqSOxogV0OWncoGwHK7A3qD309oh6tIij9H708h5lH+aShWGwZL0TOHh
	7hAgUr0D53uc7Kwymg7hFqszJF+tsDfa/4a1fRb6RKCwM1quSlwCRl3cTC4IglKYc+zF
	/TddYoHQsV3iQcnoS+zychPN1ycuA44wKJuCR2CDkV5D3ig4rUakkf4y2klSzloypVZC
	vk8g==
X-Received: by 10.69.0.226 with SMTP id bb2mr9494522pbd.34.1369251967163;
	Wed, 22 May 2013 12:46:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	lq4sm9284209pab.19.2013.05.22.12.46.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 May 2013 12:46:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2013 19:59:41 +0200
Message-Id: <1369245581-11492-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [RFC][PATCH] buildhistory: adapt to fetcher changes
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
X-List-Received-Date: Wed, 22 May 2013 19:46:06 -0000

* bitbake commit:
  commit fb068bee47bb1a06f02447daf16c2b2a79c03288
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Sun May 19 13:17:58 2013 +0300

    fetch2/git: Clean up sortable_revision

    Now we no longer try and provide increasing values from the fetcher,
    we can simplify the function structure for the sortable_revision
    pieces and move the AUTOINC handling directly into the function
    which needs it, simplifying the code.

  changed sortable_revision API and now it returns tuple. Maybe we should
  modify buildhistory to support both variants, this is just quick build-fix.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildhistory.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3b6ce99..0d74d7c 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -547,15 +547,12 @@ def _get_srcrev_values(d):
         if urldata[u].method.supports_srcrev():
             scms.append(u)
 
-    autoinc_templ = 'AUTOINC+'
     dict_srcrevs = {}
     dict_tag_srcrevs = {}
     for scm in scms:
         ud = urldata[scm]
         for name in ud.names:
-            rev = ud.method.sortable_revision(scm, ud, d, name)
-            if rev.startswith(autoinc_templ):
-                rev = rev[len(autoinc_templ):]
+            autoinc, rev = ud.method.sortable_revision(scm, ud, d, name)
             dict_srcrevs[name] = rev
             if 'tag' in ud.parm:
                 tag = ud.parm['tag'];
-- 
1.8.2.1


