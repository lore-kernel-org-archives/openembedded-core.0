Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 06C50748E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 12:25:55 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id j4-v6so31452371wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 05:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QUzQlsfNScKvMZOhGbIEiuhBa3tTnCFdxIAYOOmyBDU=;
	b=BJinijhmC5RFui2iXwQxgiVDAzC4yKV1mbH3LBdtTJIuJRhy0J66/ongL25+ZaQGU3
	7oQujT/fh0eI4fZ7tMQBC7MW+oP87KN9Yt/ZhaPWKjDOj5Na3gSkysRHmwYWfzyh26zH
	8TEFLCpwQxpgShhZGLeXHHpremc4oyx5DhS7aJiZ78YYRlmMhmGksyIpsqFq9gubECOk
	kFRPXRhTw8YEbCdNsnRSS/dB7M/GMZ7MZDk6wdEpQ3KbZQlxsx48EpG0JjKq1PrxktkL
	QaFboQsKfnXiGEqyjmtYjzU/Qpnlv/qDyRvgDGMW8jLYy0VxATCHJUVrUcFedDn0Mdbt
	6qJw==
X-Gm-Message-State: ALKqPwd8ZkVPytConXHecFyqxrlICoe0ImRYwSVRCcvA+2zkjujtZ7An
	qP0cKnpkUyg+2Xxckod4Fqn431DL
X-Google-Smtp-Source: AB8JxZqq29lPPwx3WzkgJBK1ui0TYgehZrwuPYC3bqMkS/53CRrhw+Mqvf1rU7CUpoMUlhO3zvR1ig==
X-Received: by 2002:a50:8c8c:: with SMTP id
	q12-v6mr2026954edq.17.1526991956415; 
	Tue, 22 May 2018 05:25:56 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a2-v6sm8752163edd.39.2018.05.22.05.25.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 May 2018 05:25:55 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 13:25:52 +0100
Message-Id: <20180522122553.29109-3-git@andred.net>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180522122553.29109-1-git@andred.net>
References: <20180522122553.29109-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 3/4] sstate: use SSTATE_EXCLUDEDEPS_SYSROOT for skipping base-passwd|shadow-sysroot recipes
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
X-List-Received-Date: Tue, 22 May 2018 12:25:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Use the newly introduced SSTATE_EXCLUDEDEPS_SYSROOT for specifying
the base-passwd|shadow-sysroot recipes to be excluded from a recipe sysroot.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/sstate.bbclass | 3 ---
 meta/conf/layer.conf        | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 362729376a..531c8f3fdb 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -952,9 +952,6 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
         # Consider sysroot depending on sysroot tasks
         if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
-            # base-passwd/shadow-sysroot don't need their dependencies
-            if taskdependees[dep][0].endswith(("base-passwd", "shadow-sysroot")):
-                continue
             # Allow excluding certain recursive dependencies. If a recipe needs it should add a
             # specific dependency itself, rather than relying on one of its dependees to pull
             # them in.
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index a8bebe102c..0a8f8ed9eb 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -79,8 +79,10 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 "
 
 # Nothing needs to depend on libc-initial/gcc-cross-initial
+# base-passwd/shadow-sysroot don't need their dependencies
 SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->.*-initial.* \
+    .*(base-passwd|shadow-sysroot)->.* \
 "
 
 # We need to keep bitbake tools in PATH
-- 
2.17.0


