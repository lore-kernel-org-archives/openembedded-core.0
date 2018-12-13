Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id BD4526C4BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:11 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id e11so1017577plt.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1RZPFUlaC6XEYHYsnO4sdBM8lBwJiFQKFPaVlsi8FFQ=;
	b=XDik/CRRXSfBA64w97R9qyn+EEUjgZmrE5mI5+RRBLHmzJlz0zOrvif2wSRYr7OKW8
	GkQqoFvIWi5CqyZ4GQi+pH1HRRDmsKwMWG6ZF+ajwgRFSm3MwtlzJPz/o/3e1yVBDFPG
	+8kyvkAgC+w8RoX270uXKG48A1WKHZbGAhsAimTC8PSgp5SxRnCBI0zOitD5KsSYMYQz
	nkN9Mnrq8YYvWnsJSTtHaLN9LtcsAGp9Vc5+OaSCg18x2kjBebvWKGuwu23nOI17CROD
	UvugzYrMwvdBFWY89g92a0Cr2ly+SkNsYy9HgeD8IisDp4tlTzwEnFUoVjGZGth4+AFd
	QGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1RZPFUlaC6XEYHYsnO4sdBM8lBwJiFQKFPaVlsi8FFQ=;
	b=LrrLrYiER5Cp++SDdGJ6QuETGncWaUtwzRP0Pvq0pgoLIILTi+paiZtQrG2rmFsn4h
	gOtJJkARw27r+zSJH2tTM+HQBly+rQo/LeI3W0PuoMH0EN8Y2xDF8p2LkgjzcIRTKMvx
	4uyTGDsEJ/pTtorVT0DHHiMlDwTuYJFu0AxEKzUIGE9F05/AoKAJeujdbCezW0kkvSbx
	mI6PK4JGUk5HvjCzN+arB4ewEQDPxyboJVlfrdFOI/N+8qAelKMVoFfqlrhsPt/gUknn
	HZOA49TjHsf7BWbiPsF6xFZVSLqjjCLpssligw2CKddIGOyjFnrXWi0s1cektm/eioCj
	SijA==
X-Gm-Message-State: AA+aEWadlOyVHppwe5xZIVyN+Pq30MEV+Nd11MkXx6g7YhHOnSOK+yeh
	hIpwoDrsSBOjrBIC6nml0oBTIhmW
X-Google-Smtp-Source: AFSGD/UoVkT2rKeq4xuN1dhR7fuz1lrFLYeFVQc/MPHEtZovUoZdcsavdu1hZEc5oGwzmR7DMxCEFA==
X-Received: by 2002:a17:902:bf0c:: with SMTP id
	bi12mr478440plb.0.1544737152818; 
	Thu, 13 Dec 2018 13:39:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:18 -0800
Message-Id: <979585f201c065dc91df44d5dccc87d6a8dd5966.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 10/45] oeqa/utils/qemurunner: Fix python ResourceWarning for unclosed file
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:11 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fixes:

Stderr:
/media/build1/poky/meta/lib/oeqa/utils/qemurunner.py:381: ResourceWarning: unclosed file <_io.BufferedWriter name=16>
  self.runqemu = None

(From OE-Core rev: b9e0bf919e6fc1a58e02145a363ebe7066e5bf4f)

(From OE-Core rev: b8a9eec2c9e56181350269acd6b42a14cc4abb3e)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c962602..983c8c7 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -369,6 +369,8 @@ class QemuRunner:
             if self.runqemu.poll() is None:
                 self.logger.debug("Sending SIGKILL to runqemu")
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
+            self.runqemu.stdin.close()
+            self.runqemu.stdout.close()
             self.runqemu = None
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
-- 
2.7.4


