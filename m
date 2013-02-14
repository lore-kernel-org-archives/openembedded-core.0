Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U63H4-0005OH-4x
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 19:12:25 +0100
Received: by mail-wi0-f173.google.com with SMTP id hq4so208925wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 09:55:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=QNQXwzGD6udICc6lViMR8IMazwnyJrHU6sIVf9jk4do=;
	b=eig8hIzmiRpDJMGBhJC6vpxRZujyYljWaQayNycgX2x6Yq9dQAScQ3PTalLYqgCct2
	CPRSMfTEGAdb3Iil7R1Y6y/qtUeZTUpzS6QPdvKNbFQMJsZmj+JKUZFp6xMzupimkyKE
	daaAh35ArsXhsrGC5fr+4XHfdK1WiM92v/smelCiOwywmDf4GlbYmDQ4RwNytCvIE228
	NSBJoBzOsIthtk0uE4Phqht8MNntRp8Nhl3mQ1olQb7rLwekziYFfuiLTNs2Py9ZYo8p
	E6egG6U8MwAPSdi6WIAjNwZw1xwur49xfK/gD+RuartYpA7PLpu96JtiDN72duJVelzE
	C6GA==
X-Received: by 10.180.81.164 with SMTP id b4mr910693wiy.34.1360864507904;
	Thu, 14 Feb 2013 09:55:07 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id o8sm636905wix.7.2013.02.14.09.55.06
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 14 Feb 2013 09:55:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2013 17:52:50 +0000
Message-Id: <b1c98f2ddb9165ae580daa42c509caca1fe7cdbc.1360864224.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360864224.git.ross.burton@intel.com>
References: <cover.1360864224.git.ross.burton@intel.com>
In-Reply-To: <cover.1360864224.git.ross.burton@intel.com>
References: <cover.1360864224.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm5eyCHQUewESY317MahCHMqn+olQ+JU+2+ICGJtEqr70mJV0tWS7jX7aXfQqcxEaRh8ljp
Subject: [PATCH 1/3] package_ipk: check CONFFILES exist before adding them to metadata
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
X-List-Received-Date: Thu, 14 Feb 2013 18:13:48 -0000

opkg-build verifies that conffiles exist, so verify that the specified files
actually exist before writing them to conffiles.

This mirrors the behaviour of FILES and package_rpm's CONFFILES handling.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package_ipk.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d735051..e5e76ef 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -440,7 +440,8 @@ python do_package_ipk () {
                 bb.utils.unlockfile(lf)
                 raise bb.build.FuncFailed("unable to open conffiles for writing.")
             for f in conffiles_str.split():
-                conffiles.write('%s\n' % f)
+                if os.path.exists(oe.path.join(root, f)):
+                    conffiles.write('%s\n' % f)
             conffiles.close()
 
         os.chdir(basedir)
-- 
1.7.10.4



