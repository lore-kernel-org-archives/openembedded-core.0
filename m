Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnw3-0001nx-Ir
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:05:40 +0200
Received: by pzk36 with SMTP id 36so925649pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=b4AB4DDykbVp4aQyevR59FML6GfCPpvH46vzlSuvRiE=;
	b=E1mt37gZWVo71XpNUDytTXB3JLiGnOWCpm/u37U0nDhFfDgNCC0YTRu3AxjBJiReqS
	Xwp2xrcCOcK33S8HDdORSoNpdSigq2MzizjcQ5jUXnW8pB4eWFRIzFiwo00rKs77gzMr
	gSYgZGhbgku1n03bDfY+DmOJkhAxngnmX4hJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xd0IgWeO43PNd78vPT6ggwoWhIr5+8sAflTq89/jh8rO+nxcWZBcnfMrh1NO6yWqHN
	h2ZuGea772eDIshyAWcz8rrclPrNnZ550ePovCHWQ6dVkbBwQYArICITvNzTN6B0FoM9
	KlYIXOSt/cnCjaF//k9zBpYMrWzle3QVj974Q=
Received: by 10.143.40.4 with SMTP id s4mr609783wfj.53.1305752563284;
	Wed, 18 May 2011 14:02:43 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id k6sm1690201wfa.5.2011.05.18.14.02.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:02:42 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:02:30 -0700
Message-Id: <33f8286787326128301ce3ab8c1144bc86a9364e.1305752502.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305752502.git.chris_larson@mentor.com>
References: <cover.1305752502.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305752502.git.chris_larson@mentor.com>
References: <cover.1305752502.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/5] oe.data: expand the flags
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
X-List-Received-Date: Wed, 18 May 2011 21:05:40 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/lib/oe/data.py |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 8b7c3cd..4b4d03e 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -6,6 +6,11 @@ def typed_value(key, d):
     to determine the type and parameters for construction."""
     var_type = d.getVarFlag(key, 'type')
     flags = d.getVarFlags(key)
+    if flags is not None:
+        flags = dict((flag, bb.data.expand(value, d))
+                     for flag, value in flags.iteritems())
+    else:
+        flags = {}
 
     try:
         return oe.maketype.create(d.getVar(key, True) or '', var_type, **flags)
-- 
1.7.1



