Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4E07FF07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 16:55:16 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r17so5219808wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uCwW0Xj8K8l9c5p/uyPw4qf92aw7MhODVSU08n+q5Wo=;
	b=KwRbjbqIVx/ut6RbqYhKds6xcZKPVkbf4EjO8+Hm6nfJFEKKL53rXhsd6zsRxhVtx0
	kgViSvyyLeZO1nr38L0Wqttpq7Lh5JrbVKMt8RtvaG0ESDwAM7fXaMMbZdfv2I4yU0ri
	vjdLcusWt00Izr8Fv9Jf2nRY5mtWujNbhoLtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uCwW0Xj8K8l9c5p/uyPw4qf92aw7MhODVSU08n+q5Wo=;
	b=cwCr9rB4PirNk5D+t5Wf11T3Jnm36ftQbvczt+RZCnMu3A60n5riav7zlxp0YBcQyr
	cHr4MVARJY+t8vgPChLnxmE0iVi8dqntmXZ+lSjuHh9CykMyF3YBxvIrySwej6NAhSJ5
	ZQ/uF5nSjMOKtrtFFLy+ToYChlWm+6y7gwLqst3xc4cHetybI3jc2pAMlvmkYIpqYF4n
	1pU9OaPHyFZ0k8bChQLvBaUvaBFtUZtJo+f+iXWFldb4FrSv3Ec598XDAWt74xrTOXEB
	uD8kr0D0q2fTPtWDYtsrKAtL7UuMYMPdU8WvoYslPgxUhHmiBuBODEbKmPQU/Qye3hJN
	7neA==
X-Gm-Message-State: APjAAAWgc8wnX8grQb22OnXMLSp9O36cOVUoKsY9qiP5I4KRo3cQmrL1
	hhwEQBAFAQi4ncuaW4po0l23hidr1Uc=
X-Google-Smtp-Source: APXvYqwwV7Ki0L1nt5sO5uowUWxs1+OmLq2CX6wLhmGaeeyVOejSUyGdVUkUdadLwvVS2Wdtc6PEMw==
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr3691921wmc.19.1568825716792; 
	Wed, 18 Sep 2019 09:55:16 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x2sm8623195wrn.81.2019.09.18.09.55.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 09:55:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 17:55:14 +0100
Message-Id: <20190918165515.27999-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] meta-extsdk: Either an sstate task is a proper task or it isn't
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
X-List-Received-Date: Wed, 18 Sep 2019 16:55:16 -0000
Content-Transfer-Encoding: 8bit

Ensure the task is properly regsistered as an sstate task as this
"half way" state confuses new code in bitbake and it isn't supported.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/meta-extsdk-toolchain.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index 235d6ecc0f4..b4009ceaa18 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -24,3 +24,8 @@ python do_locked_sigs() {
     sigfile = os.path.join(outdir, 'locked-sigs-extsdk-toolchain.inc')
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
 }
+
+python do_locked_sigs_setscene () {
+    sstate_setscene(d)
+}
+addtask do_locked_sigs_setscene
-- 
2.20.1


