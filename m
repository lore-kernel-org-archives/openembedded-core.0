Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 04F6672B06
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 11:48:39 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so100090783igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 04:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=3qjgDxe5oNCJJnu3hLZpyLirw7ohF6jJbMpoVCODQ+c=;
	b=jtmOdRaqymgrgUkiGOjYAMeABO1fgUow1By932OaFN3XpMq8Lni7Qo+6Zyq5LxGN0/
	wZeiDkup3/9F0FercF4V8QSE8QZD5I6E4XztNg9YN2YWSf4Mzk6PTLZRdzuvyxQoE2Rz
	F/aq/Y3/dL/NVgcw2tlYJizMfoJ+7FOr6b06b2DG+shhg+Y0pMA/51nglv17yGVY98vc
	BQEkRQ8wOkQWrmE5nPfpYUBprHTynGzKCWNdJTe/fWGlW64AA1i9ynkcqXykL9a+Wdqb
	GC5ZpGokdZqKDAV8t6/QFsDETr5E6jK7ShrNN9m+MKqm44i4srtOY/YNxWsiXQQBktc1
	rPxQ==
X-Gm-Message-State: ALoCoQlulucVsr2kQPJ5IBA4MvdYcwu6IIB64mdd/AKeATzffq8z7UULuN0skV7XLpUm27uPfM84
X-Received: by 10.107.36.207 with SMTP id k198mr9103516iok.69.1432122520837;
	Wed, 20 May 2015 04:48:40 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p57A56B24.dip0.t-ipconnect.de.
	[87.165.107.36])
	by mx.google.com with ESMTPSA id o15sm1416373igw.11.2015.05.20.04.48.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 May 2015 04:48:39 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 13:48:20 +0200
Message-Id: <f4ee80aed6d6c20ba6c01e92ec1495a5d20d6a58.1432122320.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1432122320.git.patrick.ohly@intel.com>
References: <cover.1432122320.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1432122320.git.patrick.ohly@intel.com>
References: <cover.1432122320.git.patrick.ohly@intel.com>
Subject: [PATCH 1/1] combo-layer: handle unset dest_dir in sanity_check()
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
X-List-Received-Date: Wed, 20 May 2015 11:48:41 -0000

The previous "clean up dest_dir checking" patch (f8cdbe7497) improved
handling of empty dest_dir but made handling of unset dest_dir worse:
instead showing the "Option dest_dir is not defined for component ..."
error, it fails with a Python exception.

Avoid that by providing a sane fallback for the unset case. With that
change, dest_dir is no longer strictly required, but the check for it
is kept to ensure that a combo-layer.conf also works with older
combo-layer versions.

[Yocto #7773]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index b0b7c28..698d3e3 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -145,8 +145,10 @@ class Configuration(object):
                     msg = "%s\nOption %s is not defined for component %s" %(msg, option, name)
                     missing_options.append(option)
             # Sanitize dest_dir so that we do not have to deal with edge cases
-            # (empty string, double slashes) in the rest of the code.
-            dest_dir = os.path.normpath(self.repos[name]["dest_dir"])
+            # (unset, empty string, double slashes) in the rest of the code.
+            # It not being set will still be flagged as error because it is
+            # listed as required option above; that could be changed now.
+            dest_dir = os.path.normpath(self.repos[name].get("dest_dir", "."))
             self.repos[name]["dest_dir"] = "." if not dest_dir else dest_dir
         if msg != "":
             logger.error("configuration file %s has the following error: %s" % (self.conffile,msg))
-- 
2.1.4


