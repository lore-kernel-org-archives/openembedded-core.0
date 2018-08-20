Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
	[209.85.161.50])
	by mail.openembedded.org (Postfix) with ESMTP id B6AFD79017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:15:11 +0000 (UTC)
Received: by mail-yw1-f50.google.com with SMTP id r3-v6so6535812ywc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 01:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LppR8pINdBsKdWfat3pvKk4nxLhHUMj96p98ArEI4/E=;
	b=V/TB+PR192xKs5w1K1FyIL0qJe8ekn79DiHK3zrAJHhSVib2znfzeMNttkp9Jm/SVK
	LB9JLbem+0y2LR6yjUmRTh31GVMpt3JG7P3cwo2LoCTACjwHnk3E93anZ6TowM1B6anh
	pozALnqoNhl6qQ4OD2h7VSmFdDPXi/0Nn41tFMu4uH47/1FvF5gZ3r9wbI9NnO7Eslpz
	xTrZQ37qI9nc9GSpOtNwE6RN+B4xpzAiz7Pzp9Eyr1Eq8RYxYF7ZRXy7kw1G7+4tos93
	XkLzTgeI3i1EMh/r+S+SfY6v7TMDxzcuQUt+G4JXv524zmZJUvMUZAf7M8ecyucUKby7
	Hn2A==
X-Gm-Message-State: APzg51AB7KAcy/qX5LRMq6CKHNaaTYcC4f8tjNdhH/axejYS8zk1CeWw
	KcOidD3KfhDWU7JellUk5g65rvfN
X-Google-Smtp-Source: ANB0VdZ13mgyLT1Y+AOIxZdJptPZ3TBseM7hrXo77kxSmCAgHGkAupIZKnENGPAP/mSMZo2alUqwvg==
X-Received: by 2002:a81:5e03:: with SMTP id
	s3-v6mr2268420ywb.456.1534752912480; 
	Mon, 20 Aug 2018 01:15:12 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	135-v6sm4447140ywm.74.2018.08.20.01.15.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 01:15:11 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 09:15:09 +0100
Message-Id: <20180820081509.13459-1-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180309130000.1937-1-git@andred.net>
References: <20180309130000.1937-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3] rootfs-postcommands: put image testdata under sstate control
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
X-List-Received-Date: Mon, 20 Aug 2018 08:15:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The testdata.json is being written to DEPLOY_DIR_IMAGE directly,
thus bypassing sstate, which results in an ever growing list
of files.

Write them to IMGDEPLOYDIR instead, so as to benefit from the
automatic management via sstate.

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v3: rebased
v2: fix typo in subject line
---
 meta/classes/rootfs-postcommands.bbclass | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index ca690a6e59..e816824f28 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -316,17 +316,18 @@ rootfs_sysroot_relativelinks () {
 python write_image_test_data() {
     from oe.data import export2json
 
-    testdata = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_NAME'))
-    testdata_link = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_LINK_NAME'))
+    deploy_dir = d.getVar('IMGDEPLOYDIR')
+    link_name = d.getVar('IMAGE_LINK_NAME')
+    testdata_name = os.path.join(deploy_dir, "%s.testdata.json" % d.getVar('IMAGE_NAME'))
 
-    bb.utils.mkdirhier(os.path.dirname(testdata))
     searchString = "%s/"%(d.getVar("TOPDIR")).replace("//","/")
-    export2json(d, testdata,searchString=searchString,replaceString="")
+    export2json(d, testdata_name, searchString=searchString, replaceString="")
 
-    if testdata_link != testdata:
+    if os.path.exists(testdata_name):
+        testdata_link = os.path.join(deploy_dir, "%s.testdata.json" % link_name)
         if os.path.lexists(testdata_link):
-           os.remove(testdata_link)
-        os.symlink(os.path.basename(testdata), testdata_link)
+            os.remove(testdata_link)
+        os.symlink(os.path.basename(testdata_name), testdata_link)
 }
 write_image_test_data[vardepsexclude] += "TOPDIR"
 
-- 
2.18.0


