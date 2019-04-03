Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Greylist: delayed 1269 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Apr 2019 16:02:49 UTC
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 5B49C7D2A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 16:02:49 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	x33FfdYS020619
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Apr 2019 17:41:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1554306100;
	bh=r5VX5iQIfIbzoV/gHc7GkX48dHkhWzFGVZsFJsLyEPU=; l=618;
	h=From:To:Cc:Subject:Date;
	b=FMFeRdvHav8mSdgVbAFlUr7z1U2PlW5qGqv+a4kOv6QjV5W8r6sn/O0QOueluK4Mj
	xctPb8yF3QRY05BdEdfUi78FGwMOk78qyliTaSoHdnzVFdxf4gyvTZViMW2l6Y1xw8
	NAbbAzGQG7lH8OjrAN/cYis/c1IAYHKcSG6MZTWk=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	x33FfXCX029918 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Wed, 3 Apr 2019 17:41:34 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 58C0A4A5214;
	Wed, 3 Apr 2019 17:41:32 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	x33FfW0U029915
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 3 Apr 2019 17:41:32 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.92) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1hBi16-003qck-IU; Wed, 03 Apr 2019 17:41:32 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 17:41:31 +0200
Message-Id: <20190403154131.917232-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] utils.py: added sh_quote() function
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
X-List-Received-Date: Wed, 03 Apr 2019 16:02:49 -0000
Content-Transfer-Encoding: 8bit

This function is a wrapper around "shlex.quote()" and can be used in
"${@...}" context where shlex (or pipes, which provides similar
functionality) is unavailable.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/lib/oe/utils.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 3a496090f3..cedd053d36 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -490,3 +490,6 @@ class ImageQAFailed(bb.build.FuncFailed):
 
         return msg
 
+def sh_quote(string):
+    import shlex
+    return shlex.quote(string)
-- 
2.20.1


