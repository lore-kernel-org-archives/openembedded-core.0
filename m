Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4FA7F696
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:52 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id c184so1887375pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7MnOYxcNinRORXQJPvCRTk7t8Oouos/PX+2a+PltYdY=;
	b=GXBi0peVNwaD4360+98XZ8jClZpMI+u5YGqNjadHn019AKzWkjHoNcxWU+4sdxdze5
	qCK72HXewDoN9e4mJb60LWX8UrHGHhTyaiSzFm3i/Cr6Me6ClcqG3NUFGTDA8t5F5Hnp
	DFLhicZt3gCmlUQTR+fNlRp/eo5tGS2/cGsMC5jJYVclRI+Zo1MmXl6fL/fczYS8su3+
	X5N7RU3tHdMqZtGio1qaFLp1niD+m6jom2qWv2pnRgeI71cdiQFVEN+FIOXdjWG6qrZX
	kOy+VArbWoFOpNnTViyOi85HGhzmb0AQ1v6Mg7XB5Si2WreXf97SPjmXlUSZSePCEItm
	tF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7MnOYxcNinRORXQJPvCRTk7t8Oouos/PX+2a+PltYdY=;
	b=ZiJlPRRoQaS/NCDDRVoRpE50hpHkeSWd7F23cD2sTW5tzeCl1bZ7RrljXVCZASFdNl
	+B5diQKfU+Pxv687FEma/twXrZROUqN7yXCSPgNRZfkyVDol36FqShS55vpOXqs53syD
	7HXP2hfXdsXX2pxUlIU1sIFiMR9HRQ09gVmAblTMUWotezdpcpfNQkfUh3k9McA7U4ZK
	l/XHiS6wtoa0Ni4aNQ2m/kSnk2fTm7Ow74pVSQ11BdeGtEnhRrNp2eKO8UrHB5PQQrCw
	q52dL6JmVkKgXYJgTk3xHAtlJhKMETvsJPqfX+8yRsoyAVCVn+wgrdtVxsEXJXHujihx
	Tvvg==
X-Gm-Message-State: APjAAAVkotIO2YKdJ/zsvujbphOE/sD3hZm3qShuxgdnk76DK+2IYjsL
	cFdd1xWP4wtYhqzgfaU5W3QJb1tV
X-Google-Smtp-Source: APXvYqy29HZdQDrGbdQXX/2fU1h4LvXsw3FiiS48eCf5rhqDoCKxWusOrKxpeo4F4VpY0Fz1VIuOkg==
X-Received: by 2002:a62:1605:: with SMTP id 5mr5058136pfw.206.1573658393213;
	Wed, 13 Nov 2019 07:19:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:10 -0800
Message-Id: <62f79dbbc656dc72423a7788ed7439e7d730fd81.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 07/25] devtool: finish: Keep patches ordered when updating bbappend
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:52 -0000

From: Niclas Svensson <niclass@axis.com>

The _get_patchset_revs() function returns the patches in an
OrderedDict to keep them ordered. However, this information was lost
when the patches were added to the bbappend file.

Signed-off-by: Niclas Svensson <niclas.svensson@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/devtool/standard.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index dcb6bf9..b944ec3 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1520,17 +1520,17 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                                           patches_dir, changed_revs)
         logger.debug('Pre-filtering: update: %s, new: %s' % (dict(upd_p), dict(new_p)))
         if filter_patches:
-            new_p = {}
-            upd_p = {k:v for k,v in upd_p.items() if k in filter_patches}
+            new_p = OrderedDict()
+            upd_p = OrderedDict((k,v) for k,v in upd_p.items() if k in filter_patches)
             remove_files = [f for f in remove_files if f in filter_patches]
         updatefiles = False
         updaterecipe = False
         destpath = None
         srcuri = (rd.getVar('SRC_URI', False) or '').split()
         if appendlayerdir:
-            files = dict((os.path.join(local_files_dir, key), val) for
+            files = OrderedDict((os.path.join(local_files_dir, key), val) for
                          key, val in list(upd_f.items()) + list(new_f.items()))
-            files.update(dict((os.path.join(patches_dir, key), val) for
+            files.update(OrderedDict((os.path.join(patches_dir, key), val) for
                               key, val in list(upd_p.items()) + list(new_p.items())))
             if files or remove_files:
                 removevalues = None
-- 
2.7.4


