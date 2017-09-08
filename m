Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 2A07A78230
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 17:33:31 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v88HXWTE029907
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Sep 2017 19:33:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1504892012;
	bh=0A/lLJiFyTxxwRt5JJIjCpDgiJVvfc6I+8zwbACZCeE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Sender;
	b=ozVU6QHTkJjYhfZJqr7MHhOq2OMrimUliDgGLOHZJjbgOXULNasEPZmRLZqER1YlQ
	MIKOnflWiYgaDIDk8ig1CBaJ0B/mQ3x5j/dMXvD86Cs2yK1JvRbHHFkTcIqqng1Vl+
	vMs5cfQ13zEeGlvcVoytRW2WmlUK32bJxtGKUpfc=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v88HXPF5002444 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 8 Sep 2017 19:33:26 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 1FD1A2A18A3;
	Fri, 8 Sep 2017 19:28:27 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v88HXNhH002441
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 8 Sep 2017 19:33:23 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1dqN9f-0007jP-IC; Fri, 08 Sep 2017 19:33:23 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 19:33:01 +0200
Message-Id: <20170908173303.29634-2-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
References: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.79
Cc: Enrico Scholz <enrico.scholz@ensc.de>
Subject: [PATCH 1/3] wic: accept '-' in bitbake variables
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
X-List-Received-Date: Fri, 08 Sep 2017 17:33:32 -0000

From: Enrico Scholz <enrico.scholz@ensc.de>

'-' is valid and common in bitbake variables (e.g. 'FOO_pn-bar'). Accept
it and other characters when reading the .env file.

Also, allow variables to be empty.

Signed-off-by: Enrico Scholz <enrico.scholz@ensc.de>
---
 scripts/lib/wic/misc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 4e07cd6..0792480 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -183,7 +183,7 @@ class BitbakeVars(defaultdict):
         self.default_image = None
         self.vars_dir = None
 
-    def _parse_line(self, line, image, matcher=re.compile(r"^(\w+)=(.+)")):
+    def _parse_line(self, line, image, matcher=re.compile(r"^([a-zA-Z0-9\-_+./~]+)=(.*)")):
         """
         Parse one line from bitbake -e output or from .env file.
         Put result key-value pair into the storage.
-- 
2.9.5


