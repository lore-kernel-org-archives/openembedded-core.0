Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id B7F6278967
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 16:31:32 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id j4so5886024qth.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 09:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qOmcSxF8SkKe9eBgkvNG1ET/5R4FQvI6znIbr9x03lY=;
	b=NhQHmILMjJIfEWuh14fs39T2Ho6EDxF/BmPdHy7i8z8xDojb4vdf93Ms2+UiEgmh49
	DLbIvqzTZVW0E1w1SVHdbTQbbWkrhACueGCLkooX7bOLrG4Uit8TkDhudxRTITJsax93
	1OUnPmN1XjHKTKcJ39guJCn6+uXwUf3fwAIJNe5JWpj8Xk6MHRsr5geub6oLyoqXFlEz
	AX+4OB9nyoguCa908zPw01K6gfygUW3ezg+kooPH6lJUCYen5AY55JbiMRyeeyIw/NyB
	HenNnDHIAHUK+zgxu8uZv4ruBZP+7yzoyt5OGLlnK9LEKpV2k0SJ1A4GXngATpf9KOMn
	3HYQ==
X-Gm-Message-State: AElRT7GRZoxMqc/LqwYhB5XdYVnekGvGfRycrHRQpMNTCqTOHBvV7b36
	IRmXAYad6Bg8bKz5OSFQozCCFFmT
X-Google-Smtp-Source: AG47ELsn0GPxNEGgQShi4ySrVuzEq9XcFl2sNYqaArUg4iAGTwN2OZzEvNxdymmKS1c+oYkilixmrQ==
X-Received: by 10.200.10.75 with SMTP id f11mr29844995qti.214.1521649893411;
	Wed, 21 Mar 2018 09:31:33 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	p12sm3691179qkl.41.2018.03.21.09.31.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Mar 2018 09:31:32 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2018 16:31:30 +0000
Message-Id: <20180321163130.23765-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180309130000.1937-1-git@andred.net>
References: <20180309130000.1937-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] rootfs-postcommands: put image testdata under sstate control
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
X-List-Received-Date: Wed, 21 Mar 2018 16:31:33 -0000
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
v2: fix typo in subject line
---
 meta/classes/rootfs-postcommands.bbclass | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index a4e627fef8..01eee350b8 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -303,17 +303,18 @@ rootfs_sysroot_relativelinks () {
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
2.16.2


