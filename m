Return-Path: <geissonator@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0C870799F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 21:33:27 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id w11-v6so7204110iob.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 14:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AmHR2eMfrHBTMMv7vIxjfOAOxwOpXh6yXd8/l9u8UXQ=;
	b=lb6WPlFDcj81DFa4vQFug2L/D+7n1/vFr41xmstUfU7j4yyshqLpH0jCXjLTtemt+k
	9LsTKQQSOfR0bZRew4EkdD7SCR7Gq0LcwtWykNJQx7oFfFEWOvuEdsApkp9x0vq70Yww
	vHK/ARoJ/2uHSY7LMuV2xJsFxGmWlPCMT7e3Ty5Hd8ZrRV5m7EvQ87iZ1mbSm0EbLiel
	Mfss+wsaMljUJ5D9deeR8QONwmInaWFHsuRUnoY6ftc2J/Xszi/MEa7ZuKKe1VwtqhYj
	YXqraSjqOTu+szmzJpTUlKiaEyLI6BOmq7/SUkECaFalg8Qyl+rH9avlKZI7BekSATND
	NnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AmHR2eMfrHBTMMv7vIxjfOAOxwOpXh6yXd8/l9u8UXQ=;
	b=Oae1VQlX3C/YjskIwAyqa4CCTAt/bh6lDIdM2z02kQWR7ejTG3UCO6Wak0raIyyNvI
	jMPwAwuArXk3yzHy0U9QpMmpKIVIXlYW9eFHhSA28AO/CcflvyChN9biZ0m7kJ7AtKyu
	01dnN1/F7M8Bod7rWRtvEm/bpjyAqmfdJWkx4E+ocH9uKyuZRZAiWvsTUsGU4zcHxeI2
	ZH4jfipUE546YXt0wlFrTLXuIHsFLEToxQhyldEQnqUnxSoNyOjn5PIiT4p1tL4quiL0
	6rw2WtcyhEx+YtIAs9ymulp3UHCa0YHrArEcnGdqiPRNcBiB4Seyi1B7wiarDjyqIGxN
	u3dw==
X-Gm-Message-State: APzg51Bpkt3y+F3CRnsuCJdoGa/bsleHOG/zE52nN6+iOSLQ/N2ssIjS
	8M8Aoflc+rSTrG3kc7nlPPBdClgt
X-Google-Smtp-Source: ANB0VdZL+g/oHfY5zhmF8dszn9p2tdzJo7puWpApLd6f7KMYzln0WVpHpBSVnaHit2mwQTemV/4sGA==
X-Received: by 2002:a6b:d00b:: with SMTP id
	x11-v6mr11511242ioa.181.1536960808893; 
	Fri, 14 Sep 2018 14:33:28 -0700 (PDT)
Received: from andrewg-VirtualBox.ibm.com ([32.97.110.56])
	by smtp.gmail.com with ESMTPSA id
	y21-v6sm2584215ioa.54.2018.09.14.14.33.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Sep 2018 14:33:28 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2018 14:33:07 -0700
Message-Id: <1536960788-26056-2-git-send-email-geissonator@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536960788-26056-1-git-send-email-geissonator@gmail.com>
References: <1536960788-26056-1-git-send-email-geissonator@gmail.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
	alejandro.enedino.hernandez-samaniego@xilinx.com
Subject: [PATCH 2/3] python: respect package order in manifest
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
X-List-Received-Date: Fri, 14 Sep 2018 21:33:28 -0000

Don't sort the manifest when using it to generate packaging rules, so
ordering can be used to have complex packaging rules.

This is a backport of the same changes done by Ross Burton for python3

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


