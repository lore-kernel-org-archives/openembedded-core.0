Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B884F6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 09:37:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e204so5871807wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 02:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jS3dXOEiCFXubDwe51ackEn1VgpBxt6hmHhNCLJYfHk=;
	b=WvBwMec/J8uqeHnBBQRHnOjTbPMxnEubn26+UYO1y4ubL2ky6OrR/r8/m4nfc6lmRL
	4olekKOy/z6ES3UH7Uaxp0kH0x6yEfQTvEj7TGMlvefz02XetJeh4isJbivOO9JdJAgx
	XqlETKVfDhzllFroWnbivwFnk5dlrJMqFmKvw/bFQgaMOnQf8F5Q4TB9VeNNKvY2TtMN
	dHMkQmuTWKaMQMhwaKtk4UQOIw3WEhoSk36G+0zeCPcOHS43s4lIRrnG/nsW6389Phew
	ejZB+BBIFg+rnvsvOkxcbaQKK2v+1VFFUkZN7T67z3Ne2Gyn5vj4jCfHU5YenIlthDDN
	nVOg==
X-Gm-Message-State: AHPjjUg1crSKnUIpXmr1nCqqMaZ5KwmuolZ75H5Us6BJfKh4g5txVgvI
	rohCZ0hWUxfqEfomlDc=
X-Google-Smtp-Source: ADKCNb5CsdmCBvEdZeVMbzIHftygPaAeEcUGBevCsUtQN6a7/VLWnhcDQbq8C4ZWDhsLR1tWZKAFbQ==
X-Received: by 10.28.109.77 with SMTP id i74mr136342wmc.67.1504517849106;
	Mon, 04 Sep 2017 02:37:29 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 52sm4415258wru.59.2017.09.04.02.37.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 02:37:28 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Sep 2017 10:37:26 +0100
Message-Id: <20170904093726.11472-1-git@andred.net>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH] useradd-staticids: don't create username-group if gid is specified
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
X-List-Received-Date: Mon, 04 Sep 2017 09:37:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Adding distcc to an image, and having staticids enabled,
doesn't work as it causes a a superfluous 'distcc' group
being added using a conflicting  GID, thus failing the
build:
 | ERROR: distcc-3.2-r0 do_prepare_recipe_sysroot: distcc: groupadd command did not succeed.

Compared to other recipes, the distcc recipe only
specifies --gid for the primary group, and doesn't specify
--no-user-group, but when --gid is given, it doesn't make
sense to create a matching username-group in addition,
even if --no-user-group was not specified, and 'useradd'
actually complains if --gid and --user-group are given
both.

If only --gid is given, the current code in here
effectively behaves as if --user-group was specified,
taking the group-id of the username-group from the
--gid parameter. This causes the error above, as we try
to add a new group (distcc) with an existing group-id
(nogroup).

This is contrary to the comment in this file just above,
contrary to what useradd can do, contrary to behaviour
without the useradd-staticids bbclass, and non-intuitive.

Change the code such that a username-group is only created
if actually requested, of if a primary group using --gid
was *not* specified.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/useradd-staticids.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index ce4ac62ab5..1b61a8bf9b 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -102,7 +102,7 @@ def update_useradd_static_config(d):
             # So if the implicit username-group creation is on, then the implicit groupname (LOGIN)
             # is used, and we disable the user_group option.
             #
-            user_group = uaargs.user_group is None or uaargs.user_group is True
+            user_group = uaargs.gid is None or uaargs.user_group is True
             uaargs.groupname = uaargs.LOGIN if user_group else uaargs.gid
             uaargs.groupid = field[3] or uaargs.gid or uaargs.groupname
 
-- 
2.14.1


