Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3599D7FCF8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 12:20:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y11so15934687wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2019 04:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wXIVAr+2zHiVRflmDHtLui+FNJ2q9zVFt0jOnRYziVE=;
	b=lrS7opwQHtHwg2vE14/9+2iSeesdfWBt92Gnh9Qh2SOTy69L9oCWKZPafyAdKjhFUn
	QNkRZ4I3ivrMNUNFOoFhJ2DbfVactnGRggdG54JbW9h79gsCm+/Q3hcwBl2o3q6jPRV1
	hV40TJgwXkP8get5ci8Rz2hFvQEfvNSmIrsk6zQfL/9wMdasY5E/4Pw5FaAooloAbbmn
	GpKZMscS7LOm3XdL3g2Hwn6cAd42l6Qceq5VIpENWgtowrz+9FLuDpG6+mD4ampMEDqr
	KnyrMsih+uGDqBDQ5hRLZAOrAlsbmnfHg5isOGEZPASounhMU3EIopLAKZL55BJ/zbqo
	aQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wXIVAr+2zHiVRflmDHtLui+FNJ2q9zVFt0jOnRYziVE=;
	b=TpWD8qHm9e8PrR6N/JdKwHzStoN4leQFZ/au8x55ziRtmd7qbGMLPBAVtud8YvFJ3y
	GYhJ0MoMR0u/gRsNE+VGjG26akrA1ADip2Ps6GIQEE+6nOjCdNCaQ7c5IAWFZE97IFwf
	vlkfEBfUz0vOwX8ToxNoCDTJi1fbgxfFAyvlVUYWk1j6nflwtnPC4DYtPLcoK/uXupRv
	Qb7Sh+n4VQ0BJXv23dhhsB4dGWcP94DffRkrjfWIHSSXvkY736mQfLrKc2n1TwgMUCcq
	kxf6dA081ZXK8/wCRh/cvM8forIySph8RX/Iam58SnjdriqPIMRquD0DEqwHis1Uu0mg
	GKgg==
X-Gm-Message-State: APjAAAW8KQfv+1YbtDNR2fSWZY9+ukgOc9VfY7iQhrzWiLm1xeza1SsZ
	oTWso3Hrp+wT1mlmzY+lPZq63RZXsf0=
X-Google-Smtp-Source: APXvYqxD0GMUpkLORhjXp/NJT7YZMzuJ00FlAARR4Sg316Ig6Nt/iWz01q1LOMrZSZn80DJoRuVEag==
X-Received: by 2002:adf:82f3:: with SMTP id 106mr1920438wrc.69.1575894016717; 
	Mon, 09 Dec 2019 04:20:16 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a3sm14611177wmh.5.2019.12.09.04.20.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 04:20:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 12:20:06 +0000
Message-Id: <20191209122007.13306-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209122007.13306-1-ross.burton@intel.com>
References: <20191209122007.13306-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] rootfs: don't use oe.cachedpath
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
X-List-Received-Date: Mon, 09 Dec 2019 12:20:16 -0000
Content-Transfer-Encoding: 8bit

Unless cachedpath is used correctly then it's just a glorified clone of
os.walk, but without any of the recent optimisations in os.walk.  In
this codepath there is no point to using cachedpath.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/rootfs.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index c62fa5f54ad..cd65e620300 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -126,17 +126,16 @@ class Rootfs(object, metaclass=ABCMeta):
             bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
             shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir, symlinks=True)
 
-        cpath = oe.cachedpath.CachedPath()
         # Copy files located in /usr/lib/debug or /usr/src/debug
         for dir in ["/usr/lib/debug", "/usr/src/debug"]:
             src = self.image_rootfs + '-orig' + dir
-            if cpath.exists(src):
+            if os.path.exists(src):
                 dst = self.image_rootfs + dir
                 bb.utils.mkdirhier(os.path.dirname(dst))
                 shutil.copytree(src, dst)
 
         # Copy files with suffix '.debug' or located in '.debug' dir.
-        for root, dirs, files in cpath.walk(self.image_rootfs + '-orig'):
+        for root, dirs, files in os.walk(self.image_rootfs + '-orig'):
             relative_dir = root[len(self.image_rootfs + '-orig'):]
             for f in files:
                 if f.endswith('.debug') or '/.debug' in relative_dir:
-- 
2.20.1


