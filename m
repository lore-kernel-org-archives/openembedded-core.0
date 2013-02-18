Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7UHG-0006Jk-4g
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 18:13:22 +0100
Received: by mail-wg0-f42.google.com with SMTP id 12so2882576wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 08:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=/IRXUlQ512Ak/EHvNjspbPZgYSyR78v4H2/L7AZTBr4=;
	b=eJE8ZAhGXWjA1J30p2lDdOm9BuYCnkwpzg/SpVA0iS8Hi/4cSIBK+nDSAPS0bqGFmF
	1kEmlbtPJvoHdAhLLcuDryWk9tiiGf/j+SWh95M9KYQw+BFIhrNzllm8vKOOLnDiGLES
	9UpSuWwkG5Lj4vFApGiXO6syAORkQi5BnVgruLAAhRkiYRNOVjnYKVt9gmbY8ntBlRSk
	F4PgWb6FPfrhSnsTtzTVXDoemo91+qSBcWVtVj2v+BeO3x7Xf+alKZFrhhkJpetrNVKB
	r9kXo7YgSOIi8O85SDwBroWWX3mgSzkysAMCyv9R+k7GCbXQ36ahs/FnF/QgpUR8bCGs
	A/EQ==
X-Received: by 10.180.94.135 with SMTP id dc7mr11949893wib.11.1361206630246;
	Mon, 18 Feb 2013 08:57:10 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo1sm20958966wib.8.2013.02.18.08.57.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 08:57:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 16:54:48 +0000
Message-Id: <2ee6d593467cf4ab49bf8a51f35550be5bf0360e.1361206387.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361206387.git.ross.burton@intel.com>
References: <cover.1361206387.git.ross.burton@intel.com>
In-Reply-To: <cover.1361206387.git.ross.burton@intel.com>
References: <cover.1361206387.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm9iZYl5XNAueh9jDw3ZJ8L6HenzN5r5JGJ/pmdrybkcTu4SpXAmBilturtlY2LwDEzobk7
Subject: [PATCH 3/3] matchbox-session-sato: start the keyboard applet if we have no keyboard
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
X-List-Received-Date: Mon, 18 Feb 2013 17:13:33 -0000

If the formfactor says we have no physical keyboard, add the keyboard applet so
the user can force the keyboard to show/hide on demand.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/matchbox-sato/matchbox-session-sato/session |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
index 1a7e99c..a3138b6 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
@@ -8,13 +8,20 @@ else
     SHOWCURSOR="yes"
 fi
 
+if [ "$HAVE_KEYBOARD" = "1" ]; then
+    KEYBOARD_APPLET=""
+else
+    KEYBOARD_APPLET="keyboard"
+fi
+
+
 matchbox-desktop &
 
 # Lines containing feature-[foo] are removed at build time if the machine
 # doesn't have the feature "foo".
 
 START_APPLETS=showdesktop,windowselector
-END_APPLETS=clock,battery,systray,startup-notify,notify
+END_APPLETS=clock,battery,$KEYBOARD_APPLET,systray,startup-notify,notify
 END_APPLETS=openmoko-panel-gsm,$END_APPLETS # feature-phone
 
 matchbox-panel --titlebar --start-applets $START_APPLETS --end-applets $END_APPLETS &
-- 
1.7.10.4



