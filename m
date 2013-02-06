Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U36A0-0001LM-D4
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 15:39:40 +0100
Received: by mail-pa0-f49.google.com with SMTP id kp6so847821pab.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2013 06:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=vNPyBaPAWNh64CdnJp+wOT6pOgnMghh3pNWG0j1x2CM=;
	b=0wQgq+6LZleWH904R5K7++GA/h8YTf4QrI1BpN+6aSHc22aB6JD/QmbMc5A7dqDMvD
	7IcMJWiY1OiDHG74AAg4y+lA2XAaJqklhRE/Tp6GtL5cFm8FFVLYnajujFQ54LVOisya
	iHauPDuNfcSvGQ+Ls+bv+9OAdJCjwBgQoV1aC64fndh5+MEoLAwiQSFsI/mTFjQt22VZ
	Ruc2vFzx55a/0jnMXGnKDxVJITo/lg8pOzajJ62zUMnj1wKIOUP8sN8OdaPzLcAt0RJG
	1yjsG9cNZkAdqTf+1SVFv/sxq8RMUv66v70T4y1vQtqtnPkWdExsWR7eyjQU3Tiwh1k6
	TYjQ==
X-Received: by 10.66.77.200 with SMTP id u8mr76272998paw.43.1360160628642;
	Wed, 06 Feb 2013 06:23:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a1sm38125785pav.2.2013.02.06.06.23.45
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 06:23:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 15:23:38 +0100
Message-Id: <1360160618-13505-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] bitbake-prserv-tool: show error when export file does not exist
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 14:39:41 -0000

* otherwise it shows error about failing import

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/bitbake-prserv-tool | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
index 4654e6d..96a3470 100755
--- a/scripts/bitbake-prserv-tool
+++ b/scripts/bitbake-prserv-tool
@@ -61,8 +61,16 @@ do_migrate_localcount ()
     clean_cache
     echo "Exporting LOCALCOUNT to AUTOINCs..."
     bitbake -R conf/migrate_localcount.conf -p
-    [ ! $? -eq 0 ] && echo "Exporting failed!" && exit 1
+    [ ! $? -eq 0 ] && echo "Exporting to file $df failed!" && exit 1
 
+    if [ -e $df ];
+    then
+        echo "Exporting to file $df succeeded!"
+    else
+        echo "Exporting to file $df failed!"
+        exit 1
+    fi
+    
     echo "Importing generated AUTOINC entries..."
     [ -e $df ] && do_import $df
 
-- 
1.8.1.2



