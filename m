Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6EECF71A39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 16:15:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x124so566838wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FLcqYwsy6qI7dJOHSP2bM6scm+8j3pF9yUNJbsVWgh8=;
	b=Aw76YC8kQLJdGk/45R65qtUPKuqrpFhRpMn9JQhIyyttGgMhOdOsf8I3qZoV6/0fQb
	di5+VYwI2PdLB+7qQUIejpBVx8Oey42uFXAnHhXkjZCtC8TJzjMHkbpPSPvejYTNdzd9
	O8ogWgPEqqkwVeXH3H0A01woKi9zlD8ysvSGm4C9ssupASpRAy+aAHKXDbg/qeIKgxoc
	GOZPFLItkpapipuZlPi1Hy3NvFXz8kVUM8ycSeMhfcmsFwooLVvDz4M/qTKl5SsBBEoO
	c68/W46X87ipSvcxzLguIpkeYmKjpSZa5pO+nELz59izqB+vDBcnour1UUVZaLimkgxe
	RV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FLcqYwsy6qI7dJOHSP2bM6scm+8j3pF9yUNJbsVWgh8=;
	b=riPGQeoFJafdAzzyAbWbHn6FEkp0Rxq/3ZbgZmDLzbNzFkx7cthqzGOTqqcliWGlIc
	0vQgNiz9eSYIsZ89rekWgy31DK+kcE/gOMUkg2QBslqu4PDh7GHPg9cvDMdryQRDaUTN
	q5B0R6f5CtEwuG8HP1hQ+OuoEfXu7TBHRI4Yu89L6qFL1TtigPmEobZaS2I/Tp0lzlXv
	XnS/NVzjDrgr3IjIGX+uC45RbQ9kg+voQXc5OOXdFJmsiCXPSzApGbgZ2Eon0n3fILw5
	3KY973fk9gaPV8OWiKH5UXnzYiX3VQA9Fwb4BEzlqNTdyqkgM4SAiqKV3RzZgtfjFJd7
	0y3A==
X-Gm-Message-State: AFeK/H12xLNzhO4x07P4eMB4h3JJjxDxB8XwObw5p7YRk333bcSS2THQuzB4ubEOLt/V4A==
X-Received: by 10.28.6.6 with SMTP id 6mr15286505wmg.111.1490717721675;
	Tue, 28 Mar 2017 09:15:21 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	a18sm5462946wrc.58.2017.03.28.09.15.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Mar 2017 09:15:20 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 21:14:55 +0500
Message-Id: <e27ba598309bd86ef6fb238a2d02100e9359ce27.1490717618.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1490717618.git.chris_larson@mentor.com>
References: <cover.1490717618.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] sysroot-relativelinks: also consider links to dirs on the host
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
X-List-Received-Date: Tue, 28 Mar 2017 16:15:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

Dead symlinks, or symlinks to existing files will show up in 'files' of an
os.walk, but symlinks to existing directories show up in 'dirs', so we need to
consider both.

As one example where this is an issue, the symlink from /usr/lib/ssl/certs was
left pointing to /etc/ssl/certs rather than the relative path when the sdk was
built on hosts where the latter exists.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/sysroot-relativelinks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sysroot-relativelinks.py b/scripts/sysroot-relativelinks.py
index e44eba2b11..ffe254728b 100755
--- a/scripts/sysroot-relativelinks.py
+++ b/scripts/sysroot-relativelinks.py
@@ -24,7 +24,7 @@ def handlelink(filep, subdir):
     os.symlink(os.path.relpath(topdir+link, subdir), filep)
 
 for subdir, dirs, files in os.walk(topdir):
-    for f in files:
+    for f in dirs + files:
         filep = os.path.join(subdir, f)
         if os.path.islink(filep):
             #print("Considering %s" % filep)
-- 
2.11.1


