Return-Path: <andrew@bradfordembedded.com>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 78BFE6FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 19:46:35 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id E7EBC21156;
	Wed, 25 May 2016 15:46:35 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Wed, 25 May 2016 15:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	bradfordembedded.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=zEIGv
	wO0/hGioH/k+aypSg0m3IM=; b=luVlqK1DlUX4p8R+KcmqfABJfkFX3iiz55I4c
	9SJ5YZbhVm+npf5wbqvG99zUS90gdHviyepGD4pNk//R6hutqWdwvH6SjTod8rjO
	3Iu45MwsMq1Jl28+vHVI73lz7r/PnRs9Ezo7NDmJFeb08f9tBtRPWf831Tlx32kq
	mT1PQQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=zEIG
	vwO0/hGioH/k+aypSg0m3IM=; b=F6kNLwGqRKeLOcRFMG0KCZpoBng/O+QR3e43
	Haah0hn6Iuqh/rmSjqva8CODjs7yngdxWg/ag/Nnp7Dvhds5+uBzcWk85hV8kx+j
	27ojfh7QFLgBnSUDHOcYLtbjxagQZRZ5LEfw4mP4WZeV0xo9bpaVq7CwffzX/387
	dxK3Lbk=
X-Sasl-enc: z6bvN9xQd75eJ14P1WA8FUJsadkxMTiJAwA49myetdbv 1464205595
Received: from kaim-eeyore.kodakalaris.net (clr-vpn01.kodakalaris.com
	[198.140.222.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id 86B77CCD8C;
	Wed, 25 May 2016 15:46:35 -0400 (EDT)
From: Andrew Bradford <andrew@bradfordembedded.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 15:46:11 -0400
Message-Id: <1464205571-26293-4-git-send-email-andrew@bradfordembedded.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
References: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>
Subject: [PATCH 3/3] base.bbclass: p4 fetcher supports srcrev
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
X-List-Received-Date: Wed, 25 May 2016 19:46:37 -0000

From: Andrew Bradford <andrew.bradford@kodakalaris.com>

Enable the perforce fetcher to call bb.fetch2.get_srcrev() as it can use
'SRCREV = "${AUTOREV}"'.

Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>
---
 meta/classes/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4be0a7e..9f3945c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -569,6 +569,10 @@ python () {
             needsrcrev = True
             d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
 
+        # Perforce packages support SRCREV = "${AUTOREV}"
+        elif scheme == "p4":
+            needsrcrev = True
+
         # OSC packages should DEPEND on osc-native
         elif scheme == "osc":
             d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')
-- 
2.8.1


