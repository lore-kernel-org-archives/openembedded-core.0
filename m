Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7366FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 18:25:36 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id k3so1903221pav.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=U7NhzvJVdT05ynGzv3Agu0MFp6aG9g99DQ/jx4fkZ4Y=;
	b=rMSzHUQ33T+BFo984u/PEH0iUL4iLzO7QS/Deu+9J9fB/wYdy+NYOTEbx4WyrBDhzz
	qTfeuU7N9FhITwBzEKa7kVK5Au/wG6p5Vh9quVL4d/J09lb32nSG6AmbVGDQvrlz3WVE
	clyaV3ObdgMj/iPOBvXzl3/sj9llaIj3iRAQ/VObkrIjnBW5dJqaTIU5mhJHWTtnZkHE
	J8j3oR+WBlbZGdsJCCLoof1f2aNO3qnzRQVw0aOs5abL5OjEIjznurIWidEfyJUwhWpH
	bBw+hBNxd9OiumpTkg9MBoGH9v/qnIAqfgJHUQ4OyTqHYkX7sM0vFFJsFrbgAo5NCp+Z
	AyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=U7NhzvJVdT05ynGzv3Agu0MFp6aG9g99DQ/jx4fkZ4Y=;
	b=MPfdMMgwqGM7n5qYbGhykBCYjIYhGvzV2rQeixfpaffFRrpfAJQN7l1VDZI9Toodxp
	Hh6XkenfYs8+bywc+JHmNOI+nJa10Zurvyv6gB1G2oUq5TST4mekaBBtCHBI3TSPV7pe
	RpR6teGWOsVcJXbw7INg8hEcu+PtVorjqXZVec9eqgW1f7ECP6+ruxFm+3RenMMnPVQU
	H1KuS/wz4R5VZ5PL81xoejCclZRW2tiA9IDFV5NB57ZFV5icvgMMb5qyFlpayT2HmUIP
	WcDxU7O57V4WZKP9O9Wlef1fR8WWzE4xiXYPN3lXmkVPvm3Be/+mfH4ndcdqRpFFvl2Z
	Z/Tg==
X-Gm-Message-State: AOPr4FU9UeiWkg/3rUuI11KvTdRogjzTG74bEidixPeTO19KdzDuOrtxdByqYmKicmI7mA==
X-Received: by 10.66.27.208 with SMTP id v16mr6676259pag.35.1460485537580;
	Tue, 12 Apr 2016 11:25:37 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	ud5sm45385274pac.11.2016.04.12.11.25.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Apr 2016 11:25:37 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 12:25:31 -0600
Message-Id: <1460485532-13735-2-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1460485532-13735-1-git-send-email-danismostlikely@gmail.com>
References: <1460485532-13735-1-git-send-email-danismostlikely@gmail.com>
Subject: [PATCH 2/3] sudo: fix pam config on systemd systems
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
X-List-Received-Date: Tue, 12 Apr 2016 18:25:37 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Pam_keyinit revoke causes issues on systemd systems. Make its use
optional. This brings it in line with Fedora 23 and Centos 7.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-extended/sudo/files/sudo.pam | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/files/sudo.pam b/meta/recipes-extended/sudo/files/sudo.pam
index 5bc26e7..515eab0 100644
--- a/meta/recipes-extended/sudo/files/sudo.pam
+++ b/meta/recipes-extended/sudo/files/sudo.pam
@@ -2,5 +2,5 @@
 auth       include      common-auth
 account    include      common-account
 password   include      common-password
-session    required     pam_keyinit.so revoke
+session    optional     pam_keyinit.so revoke
 session    required     pam_limits.so
-- 
2.8.1


