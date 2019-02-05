Return-Path: <guslees@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id F010A7BFFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 01:56:08 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w73so783060pfk.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 17:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=lPcjJBN3J1SdjVqY1Oo2AbOLSccmi7n03EgDNQtaNws=;
	b=UV7cRxTIn1QtOuXxdfOEVn0Om4pSA82Xk1iFnkZWUM4vG/JaK45fQUsF/vVUJr+86E
	1LFDYYlWYfktw0RQig7GfujxhG7E5FfIye750IYMbufBhHMDlWNN6GsWt+e3hLQmo367
	c5Pk9B38e1lj1A9UT++TQUmyjB14y4mzN70+0j23zUcOdSvbD6UJlLEmbjzMIEuGH436
	wboAy34hKhhmbK0QqOgItbLsuud7WmRxfmdLuRCy9SX5rAfje2RMTekkeJPj/Y5dCYb6
	LHkA0uaobI9tmNaXO5yHsAHV6lujOO5d8vN4H9C3B/q17ClU4z9EOIXLNY0PqSAbrHMx
	KTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=lPcjJBN3J1SdjVqY1Oo2AbOLSccmi7n03EgDNQtaNws=;
	b=nyJ8ZpyrT3b/951Aq7OF8rRQov9mKh1+dVWNyEWi4WcFfTOBPRYE7O4a3OMtbb5Q8h
	utMH06ETLbjcFhDJ0GG1+PrWECvezYkM8bgu/khyZpdy9YSyRgCH7vdeQOb/6ljIJoWi
	7/YDZrdMFM1KT+A3wO1mSdHB37DVEMHyzEYCKN66fUH6sA1KzTW4KqjSYlJu1Q98dlvU
	HLfB0JvuQqB7UCQ9yvvyDwPqIU6tlxSglYiHFrsnLElpRDMU+TEabSFUUN7prMpvuiL7
	rdPdGbRVcK5191czChR/Lioswim3H1ea8+tgKNkP3n9RSHKTIjdT7cKxmkp8UR6t/0pg
	TE+Q==
X-Gm-Message-State: AHQUAubj21VD9L6Oj/eUWT1ckNwqiXpO6NMCmT8t9sKmFsSLtSx7ZMnC
	mGDtTuL/krfMZEzMPnaM4StAmrw8
X-Google-Smtp-Source: AHgI3IYnqbs1sRnz5qQuFW6NARGnT5WWauypupMkLp0bFsslcqFLlcsLx9wPmuVpQmpJ1OQbIRakOA==
X-Received: by 2002:a63:e545:: with SMTP id z5mr2235602pgj.195.1549331769628; 
	Mon, 04 Feb 2019 17:56:09 -0800 (PST)
Received: from roachbait.lan
	(2001-44b8-3185-9c00-ea2a-eaff-fe60-e749.static.ipv6.internode.on.net.
	[2001:44b8:3185:9c00:ea2a:eaff:fe60:e749])
	by smtp.gmail.com with ESMTPSA id
	y184sm1687988pgd.71.2019.02.04.17.56.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 17:56:08 -0800 (PST)
Sender: Angus Lees <guslees@gmail.com>
From: Angus Lees <gus@inodes.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 12:55:33 +1100
Message-Id: <20190205015533.23646-1-gus@inodes.org>
X-Mailer: git-send-email 2.11.0
Cc: Angus Lees <gus@inodes.org>
Subject: [PATCH] package_manager.py: Use data.tar.xz for ipkg too
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
X-List-Received-Date: Tue, 05 Feb 2019 01:56:09 -0000

Commit b95b6ba1a2959e2294a8848fa35f20163388eb06 changed package_ipk.bbclass
to xz when building packages.  This updates OpkgDpkgPM.extract() accordingly.

Signed-off-by: Angus Lees <gus@inodes.org>
---

This should also be backported to sumo.

From a quick grep, I note recipes-devtools/build-compare probably also
needs updating.  I have not done so in this patch, because I don't
(knowingly) use that tool and have no idea how to test it.

 meta/lib/oe/package_manager.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2d8aeba037..6b45f1b2d4 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1030,10 +1030,7 @@ class OpkgDpkgPM(PackageManager):
         tmp_dir = tempfile.mkdtemp()
         current_dir = os.getcwd()
         os.chdir(tmp_dir)
-        if self.d.getVar('IMAGE_PKGTYPE') == 'deb':
-            data_tar = 'data.tar.xz'
-        else:
-            data_tar = 'data.tar.gz'
+        data_tar = 'data.tar.xz'
 
         try:
             cmd = [ar_cmd, 'x', pkg_path]
@@ -1432,7 +1429,7 @@ class OpkgPM(OpkgDpkgPM):
                      "trying to extract the package."  % pkg)
 
         tmp_dir = super(OpkgPM, self).extract(pkg, pkg_info)
-        bb.utils.remove(os.path.join(tmp_dir, "data.tar.gz"))
+        bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
 
         return tmp_dir
 
-- 
2.11.0


