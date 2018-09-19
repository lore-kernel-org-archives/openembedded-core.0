Return-Path: <geissonator@gmail.com>
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9B87982C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 16:22:51 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 36-v6so6338577oth.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9JSOWJK7U7LyRZOCe/lg8H6DGyrc6ARgCuShx32baFs=;
	b=CrKAsE71y8BMmloBRiNQgImVqpqGvOupaTNhNvZ65LkodaxnfOkYf+Kc1sclZL5yjj
	9e3CyAcFcWXVfjEDkm1zd5q1ETeWbEULm6d8G2m6kv82aAM7VohT0Q3m8BZYXg4pB4Xc
	B5fddvnz4nAur4ZwJoxVvZtbMsyxptk/635YuydCA2KTCVYbxu096Jqz5ZisUgkuvPcY
	Bu7EsgeDvbkQw+zzroGZFifNGPa0v176TPgouTK82CEwoYYP4ENXUf3NbhMMbo9nQXQb
	om1f9M9UTxxGTg0w9VvrPL81rUM9GUIZx3Dxb6347M9CNjJSzL7QwTgHmwRrJ+6ePV6a
	WOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9JSOWJK7U7LyRZOCe/lg8H6DGyrc6ARgCuShx32baFs=;
	b=tKXQxnUkDz1aSvR1VpmWectI2sGtedFqOUTAuKcO2+8dKce9CByY3e12KTHocTsi/w
	R4abHVdlAuUhM14KLxFpwFF1KM68LRkGpeLjgR89WP8BzfNTKVxtSO1zPpfzxLsZtmDu
	iQGPGrZPg37nFZ2y9DagbpsZt9Q21NQBB117TOlXUPUZU7sKyTZZ1JcWmO/2mS4eDpjI
	RdxOYY6y2Na5AuIccQRkWoWb6XmFphGUPnRCtEznN4cJP0jGU9YsApDHOpFfG00012Wr
	3CfCH7bj2VqVmgdv8ZFzpL+wteu8iDdpR8LroPyn0eTgWqsaJPdOu6hv6GK2ZjbCDG4h
	Y84w==
X-Gm-Message-State: APzg51C/LAi2+TeGNuj6l/QeE9XtP7WfOm0yS4TBG/qpcbWBqhTvPUlK
	9T9tYB++YB776UqQbdDsRFhbAzFoDt4=
X-Google-Smtp-Source: ANB0VdYcPbFHuEIGDddV+mb7oZ2uUKYEGTdlPrSRJiFlEYDL5mNi/7QerTpg75ZZ3x0smVVB+nZP6w==
X-Received: by 2002:a9d:604f:: with SMTP id
	v15-v6mr12853707otj.295.1537374172379; 
	Wed, 19 Sep 2018 09:22:52 -0700 (PDT)
Received: from andrewg-VirtualBox.ibm.com
	(45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
	by smtp.gmail.com with ESMTPSA id
	f9-v6sm7212450oth.31.2018.09.19.09.22.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Sep 2018 09:22:51 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 09:22:28 -0700
Message-Id: <1537374149-27017-2-git-send-email-geissonator@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537374149-27017-1-git-send-email-geissonator@gmail.com>
References: <1537374149-27017-1-git-send-email-geissonator@gmail.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
	alejandro.enedino.hernandez-samaniego@xilinx.com
Subject: [PATCH v3 2/3] python: respect package order in manifest
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
X-List-Received-Date: Wed, 19 Sep 2018 16:22:51 -0000

Don't sort the manifest when using it to generate packaging rules, so
ordering can be used to have complex packaging rules.

This is a backport of the same changes done by Ross Burton for python3

Changes since v1:
- Rebase

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.15.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index 43d9ff5..472c1da 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -207,7 +207,7 @@ RPROVIDES_${PN} += "${PN}-modules"
 INCLUDE_PYCS ?= "1"
 
 python(){
-    import json
+    import collections, json
 
     filename = os.path.join(d.getVar('THISDIR'), 'python', 'python2-manifest.json')
     # This python changes the datastore based on the contents of a file, so mark
@@ -215,7 +215,7 @@ python(){
     bb.parse.mark_dependency(d, filename)
 
     with open(filename) as manifest_file:
-        python_manifest=json.load(manifest_file)
+        python_manifest=json.load(manifest_file, object_pairs_hook=collections.OrderedDict)
 
     include_pycs = d.getVar('INCLUDE_PYCS')
 
@@ -248,8 +248,6 @@ python(){
             d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
         d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
 
-    # We need to ensure staticdev packages match for files first so we sort in reverse
-    newpackages.sort(reverse=True)
     # Prepending so to avoid python-misc getting everything
     packages = newpackages + packages
     d.setVar('PACKAGES', ' '.join(packages))
-- 
2.7.4


