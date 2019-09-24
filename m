Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id B534D7ECC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:48 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d22so291052pls.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eUthZrTjpLjld+E3kjiQNxNY284z5Qh/gYW7uFklMjk=;
	b=fqZfhJQjqNfMUzvXJmi5LLn2VrIrnHzBXy9rVbMEV+Esbaxz3r0lDK05/tcxL5l0Sc
	uY/5e61Y3oIq1EQCs2kZvspCNx6OFwo9r+MrCoZgLwlznw1ZTXK7jNLuaiMTGQKaUqzG
	y7OOPSS6S2znuRSgCnIgfa6EKDygbIAI0VJWXsDgWL/WeAbPCCO3aqnZZ44e3jSXq4S1
	3weh5UDel1JvJUspGTMx46HXmG7s12QthHy24NJtmyJuZdvKaxuCDlpLj+y+xGtsSMRX
	Fuwr+PAGGC5QDslAC97AweRHjwF8mQwuS+667S4AIcBmFZVj5X2S6fTd7lPpZDlKJEPI
	YUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eUthZrTjpLjld+E3kjiQNxNY284z5Qh/gYW7uFklMjk=;
	b=YSNO0O2fQE6JNkQcVhXPzIZEkQoxbk4zL+CqCnZ89TtjdvTPschK+dZdn1gGIHbcO9
	QavnlMi96sPCZ/JscqZZvJo371Q0JYFZsxvSsh8bSMt7aWGXR1H2OkCJy7+WF7Arqrjq
	oo+HdaDhmqPSA8MlEF7uxqA9eJFcUDV0sAdw37ZjDYKgcZzdRE0QW72WODQ/9PJRLh0U
	gvT6QGrDAmjQrNlNuoreV04e9gQxrIAvF0Vc0VQdCYAHxFXpatRSTKA5MMxjLqn2pDeL
	x/23KqOnh1rHQiTKKjkDzxZhdb9upDvo5mMKIYXuo+eWeHW6FMlMsnYT2Y/yWBz6Qa80
	90ZQ==
X-Gm-Message-State: APjAAAUktHutLOO4YbnHUEAyOBsY7TJXszrSTRID4yf9Ofo2aKK/2iNK
	i9ezRqB19GzgMxoRwf8V6UhAV2qErXc=
X-Google-Smtp-Source: APXvYqzK2l4O8urG+1qb58DSFIn0UxoC8b7dLphAfHlQTjOt+QurT2XU4eUtCvOi/g47OYvVgKDDtA==
X-Received: by 2002:a17:902:d891:: with SMTP id
	b17mr446895plz.119.1569293389823; 
	Mon, 23 Sep 2019 19:49:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:48:56 -0700
Message-Id: <412676ac26ac78cfb42997f0d39174e62e2c6462.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 16/50] rng-tools: fix very long shutdown delay with systemd
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:49 -0000

From: "Bedel, Alban" <alban.bedel@aerq.com>

The systemd service file has DefaultDependencies=no but is not
properly configured to also stop the unit. Because of this the unit
keep running after shutdown but systemd still waits for it to finish to
then later resort to a hard kill. All this take 1m30s with the default
configuration.

To fix this problem add the missing Before=shutdown.target and
Conflicts=shutdown.target to have systemd stop the unit on shutdown.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index f0355db..5c8253b 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -2,7 +2,8 @@
 Description=Hardware RNG Entropy Gatherer Daemon
 DefaultDependencies=no
 After=systemd-udev-settle.service
-Before=sysinit.target
+Before=sysinit.target shutdown.target
+Conflicts=shutdown.target
 
 [Service]
 ExecStart=@SBINDIR@/rngd -f -r /dev/hwrng
-- 
2.7.4


