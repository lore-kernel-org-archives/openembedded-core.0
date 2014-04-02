Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 550446F9FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 12:26:11 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id k14so132213wgh.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Apr 2014 05:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yY8yFNuXZs9v1+m4OZePxgxs5WQKnt50i15h3RIMRvs=;
	b=yCvo76lWX08VtiNVMC4fW9Zpk8tmOhddzDQr2GomHttdD7UOODl189JynwYP/Ns3Ln
	I9ahIOiftmaPlJqdQQbKUSWfGExPtsbsxWKHk3CZfG+qkIFMRlzdLa2sj9JLTPQKQiT3
	z4OPpkeq4v/ivERv/dVRGRNHj9a7fKN/KfdrESJpz3LmDl+C7B7uCbI4TnwcxVL9udJV
	XJ8qVPszMW/NXtrZ1n3efmhviezYwiZQZfRvsv54VLyLHfl1Z21nbbRojTWbeM+sYPNq
	fm8km+AiHNmu/gd1W9emHqeC9PleLSqwALUtaUkwZ8WBp/zp87gpgsJcc8JniCTD22iv
	CD1g==
X-Received: by 10.194.109.6 with SMTP id ho6mr300344wjb.21.1396441566856;
	Wed, 02 Apr 2014 05:26:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cb5sm4204175eeb.18.2014.04.02.05.26.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Apr 2014 05:26:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 14:25:37 +0200
Message-Id: <1396441537-2911-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396441537-2911-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396441537-2911-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] send-error-report: show response
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
X-List-Received-Date: Wed, 02 Apr 2014 12:26:12 -0000

* useful when debuging why it was refused by server

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/send-error-report | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 0d85776..8eea3cf 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -53,9 +53,11 @@ def sendData(json_file, server):
             print response.status, response.reason
             res = response.read()
             if response.status == 200:
-                print res
+                print(res)
             else:
-                print("There was a problem submiting your data")
+                print("There was a problem submiting your data, response written in %s.response.html" % json_file)
+                with open("%s.response.html" % json_file, "w") as f:
+                    f.write(res)
             conn.close()
         except:
                 print("Server connection failed")
-- 
1.9.1


