Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E160719C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 09:00:11 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i131so662755wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 02:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=88QzsgXNgBbR4SfNNA+NuJvLH+bIrgOEUcKWnUm2dQM=;
	b=lb8gx/9A4b9cL50TilGB6L3Lt8EELSf5Ku3E4JMnZAiYC+2jZG7vteA14pNV8lrz+L
	+zLxhCfhSqFvhH7C8TxpCVuD9tbfufjzosc8nW+ZJr3h+QOna/+Otl/bTolfem653Fk8
	YLKNLX7BtX2t6vrdWZL0VE7tOMEio2w8cm/mIFBsNuMW+vzKXGFjyPKZCTjx8iRosUoR
	9VcBYY+ixWXSHI17OtmB4K5+/jYOP6Rvk9H8F4LAzV7z1J3/srnBzgWYNpVGYjRSvpFP
	S/+Yaa1UbL9TsYAW/3Qvt0MxaxNKQrJic6hKgFTxSs9sS9c6uezDYs5JzY/mc+AwpHhX
	jeXQ==
X-Gm-Message-State: AHPjjUiazAC4RUx+UMV4XgqnhrYA/xlHf2J8Ovg+dlV0ENCJFw0/elmp
	ilt1Rn7HxGrZJPAEuqmE4HOf5CvN
X-Google-Smtp-Source: AOwi7QDREXV61+ISfty+qLsv5VXczuWEDARG1FbR1akTtVDyA3242p8VzQcYWqnQ+sqTNucYIzHfkQ==
X-Received: by 10.80.134.16 with SMTP id o16mr3964950edo.158.1506070812569;
	Fri, 22 Sep 2017 02:00:12 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	l33sm2064845edd.94.2017.09.22.02.00.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 02:00:11 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 10:00:10 +0100
Message-Id: <20170922090010.9685-1-git@andred.net>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170904093726.11472-1-git@andred.net>
References: <20170904093726.11472-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] useradd-staticids: don't create username-group if gid is specified
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
X-List-Received-Date: Fri, 22 Sep 2017 09:00:12 -0000
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

---
v2: bring this even more in line with useradd
---
 meta/classes/useradd-staticids.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index ce4ac62ab5..eb8e59e67a 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -102,9 +102,13 @@ def update_useradd_static_config(d):
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
2.14.1


