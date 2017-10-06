Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 940E878258
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:28 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l10so2930053wre.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=f1UjAPK+PQcxzg5BpoJ5x8e6fz4HxnFtN1C2vcXB/Oo=;
	b=mNVwEvut2s7de7P6zomK3k/wmTseOngboAYGEurjWkCb1DzatQ67GZyA4nrKQn1dbG
	a3aviMxRwnvPOzWTk78/jtqaZb5C9vc7N6Cm9YKAzh8eGGQPli5KwdEVQR5uHCbSQX8m
	HT11AZDGyV5Am5W3UVJi+N4Ehg75NE9yc4wOP88IC7AhxffH52KRzcRWEdfsarIXu7ob
	oEn+/CDwUpWvpT4t6Wzydb+nxWiPZ4fYf47hVebV0D19Z0u+XvjQHRpQlXuWpCrCNWr4
	x5+WOgsq6EDwtJGPGyMseRDyfyxF+wAhpp2F98iaIcP8Ld1g05AeSZpCsruhjr7otUKG
	Q70g==
X-Gm-Message-State: AMCzsaVHFti0Vk0900K5POMSLq9mbN5JxH0KhgJJSfdpAt8WGmig2Bfl
	wX3xfxeN8vNkvaLx+bLCaphWfbhY
X-Google-Smtp-Source: AOwi7QCyrGQHXENlqQDZgYiryfwr5J1ez8eF1WxJAvuSPSZ3PRNlb8Qv2+6alAkkcVfVOiEibb3jtw==
X-Received: by 10.223.154.199 with SMTP id a65mr1845071wrc.18.1507292009049;
	Fri, 06 Oct 2017 05:13:29 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:28 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:59 +0100
Message-Id: <20171006121259.5817-18-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 17/17] useradd-staticids: don't create username-group if gid is specified
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:29 -0000
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
- if a primary group using --gid was not specified, or
- if --no-user-group was not specified

To be in line with useradd, if gid is not given, and
--no-user-group is given, we add the user to the group
'users', which mimics useradd's behaviour.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit fc3a86ae68919cec72c1a8ae0f9ba1f98ae13f0d)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/useradd-staticids.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 2d282c0d71..6ebf7600f6 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -141,9 +141,13 @@ def update_useradd_static_config(d):
             # So if the implicit username-group creation is on, then the implicit groupname (LOGIN)
             # is used, and we disable the user_group option.
             #
-            user_group = uaargs.user_group is None or uaargs.user_group is True
-            uaargs.groupname = uaargs.LOGIN if user_group else uaargs.gid
-            uaargs.groupid = field[3] or uaargs.gid or uaargs.groupname
+            if uaargs.gid:
+                uaargs.groupname = uaargs.gid
+            elif uaargs.user_group is not False:
+                uaargs.groupname = uaargs.LOGIN
+            else:
+                uaargs.groupname = 'users'
+            uaargs.groupid = field[3] or uaargs.groupname
 
             if uaargs.groupid and uaargs.gid != uaargs.groupid:
                 newgroup = None
-- 
2.14.2


