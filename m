Return-Path: <jean-tiare.le-bigot@easymile.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BB1E27E3E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 09:12:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s3so4947763wms.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 02:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=easymile.com; s=easymile;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XFq3/T3xgj4Ac9Qvs7m83YqXni/vlP+gQ2uPnzKwkp8=;
	b=erQPQg6kA2unafF/csV1ItHCY5o6jZ3WoqwDTAxtl8HeWRGW1Ctwmcp8rnR0wxLDIU
	n+wp7OOuk74cL5/RNd99kppsCViwnNDtsFmI8qjfhWK2nHSkPl7pT3f5IwmUpVOHqLN2
	Kn6Xxxkw/DGvh68CvRhGBo9caqwR3Aw3gE5f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XFq3/T3xgj4Ac9Qvs7m83YqXni/vlP+gQ2uPnzKwkp8=;
	b=AbI0w70sxuGsF520eh++Gs6CtjDi446SMa6FDm7g7keWQxQv0XGdGhQeHtthqWXRyH
	ocD1kUG5fz9p+YdFzqGfxFir+nHKyjsKJzxbOTZ19CeR1//3RbEFykyJzYqn8bDoMaaF
	ngBKeto7mUoBPloQqE9Lx3VsrvXCYoF6eF3rXmARvElyvoGquNjz7J3J0nomnvHiy8Hk
	I00fagLbg4u+kouKPebrptQ+7VfXhB385MZis8d6/3jmwdKQiFaEItBp6G6SPXzEiLj9
	09M43sIPvZKWHUs8jZVZb3MRCsoMMTBQrVsbrlOE/DrOMNaFyr6nJKvObdEX7ihCIMkQ
	Y+Bg==
X-Gm-Message-State: APjAAAWUtPzM9Tbo5th4v014OPoiHPlZPFUb4XaG5qyG2sDbLUsk93qL
	+ILVC9kmDSD4d3Qc1jhY0ikElYoQ9aYsyt8Q71eCxZ9+wo/IucA84yAIC4FWRbXgxEMEKMWOlEt
	ho5tae9eLSg/aNGoBz2pJlBgZxgAMFT+f/QNfoPZ81CdBS+RGk2KtSeBVRBzxz2U24n90XK5S7n
	JIed0O5fqXCAJ1Nc2bNSUZs9lvroLlQ8hn
X-Google-Smtp-Source: APXvYqzQNqNm6se02Y1DTgNVjf77mWcZyhAktGzu9TczAobAfIE4jPmA+rcOxQJv6rJdgS9foX9R8g==
X-Received: by 2002:a7b:c933:: with SMTP id h19mr509594wml.52.1561626729176;
	Thu, 27 Jun 2019 02:12:09 -0700 (PDT)
Received: from localhost.localdomain ([185.116.129.142])
	by smtp.gmail.com with ESMTPSA id
	b203sm5902896wmd.41.2019.06.27.02.12.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 02:12:08 -0700 (PDT)
From: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 11:12:04 +0200
Message-Id: <20190627091204.16342-1-jean-tiare.le-bigot@easymile.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Jo=C3=ABl=20Esponde?= <joel.esponde@easymile.com>
Subject: [PATCH] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Thu, 27 Jun 2019 09:12:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joël Esponde <joel.esponde@easymile.com>

populate_packages relies on ``mkdir`` to both create a directory and set
its permissions. However, ``mkdir`` honors the ``umask`` value.
Therefore, some bits may be lost in the operation. In our case, the
setgid bit on the directories were lost.

This commit fixes this by having a distinct call to create the directory
and to set the permissions.

Signed-off-by: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 20d72bba79..cd223a121e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1216,7 +1216,8 @@ python populate_packages () {
                 src = os.path.join(src, p)
                 dest = os.path.join(dest, p)
                 fstat = cpath.stat(src)
-                os.mkdir(dest, fstat.st_mode)
+                os.mkdir(dest)
+                os.chmod(dest, fstat.st_mode)
                 os.chown(dest, fstat.st_uid, fstat.st_gid)
                 if p not in seen:
                     seen.append(p)
-- 
2.19.1


