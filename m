Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E56F3C993
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:41:13 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21677.1771944072060577906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lwrI0zSP;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso45329945e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771944070; x=1772548870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkRzwdqJOOPIFvuK37LsmMNGeyv2Mn8Ms8icZ/07Isg=;
        b=lwrI0zSPyU9RwpBW8yl0gfsGF9mwuVaFYuoEfidY/6NGR9V0D26wjQbEAZa+1KKKYp
         J7/NcX0F5sWIMwU8zWSY/PZy7Yi1t+bB6KFVxHQNduT8GsKtjQN3r8SfBP2qIJvi9qYa
         e/QEB2B1LWKYXTPVjceNVeuFI+x8Y2mYNUWZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944070; x=1772548870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZkRzwdqJOOPIFvuK37LsmMNGeyv2Mn8Ms8icZ/07Isg=;
        b=DIWXSaOeLKy7JPjP6QQG1akrBVeJMMd2WrXgJzYsD2jBJX7wkkJVfnz64gKS2xnG2y
         vw7uy+IwzpC6Guj5AIodSDy5Chx/U8T29H9dji2H56smqUfpR2xozxcYzjjePJa+EeXi
         CLyLU/UI/ZNsFmaLvTmXFsFnNmywcVZJeVdkLm0fg4RsfkzsKCB6uz92jflUxOHVlvBo
         mg2cbZdPjKYdwmbQt2SkKvu4pc5ausB806jclEqJA0hkVBGJmta1c+qsHcxWMHYs4v/B
         xISf31h0zWurcLNKDBh2cAJfdqHHx3IkFMD6I5yCclUgxsZlxyj0H3kMvDBNcKU5CPhT
         +oYA==
X-Gm-Message-State: AOJu0YzN0fvohjOdDLs2tPU/IxKAuSApKT62EHcIIPfO3pydSZSPFh7i
	UhH6hfy8H6cmwFKZxfghaCM85F1TuC9JUVpMmF6ihUYI7+NkPj/OkbxisxwUz6Qji2G0yacZAtd
	G+47Ctxw=
X-Gm-Gg: ATEYQzyNfi2FOgd7hduHo9I5xPpIDiwaVuESWNk821fItiZOwYmOe9EumZynZreKAot
	b+3HlHd3MjsMSrliSSaTrWg1EwUM4p1jdjZPGJI6jtqqcEkUlHRqf2707dt7PiCpJGlTp6HaOSN
	cjwmu4zFwlNhzmNp3fSNyk3eTCW4LOvg+jk0wIwnQnJ1cM9Wfc1jdIhNY3yj8R4MH8N7fMDKnHE
	L4PLprivbXI7tQkRfj2M/EIhPaEeRVLD44YQdIB1w6RbxLrtg4x7j103zmxyZWrb/oSr9GSlD7k
	HYsD16bkIujixbsteK0u2QLvamGRDNF0Gdla2cowe3JnjrrVwZUefVNPtNE6P0O5/HUecINzwU5
	l2gvPhsEIaWqpm7bGIhTZZCKXLELdsgXgzw+TmgNcW1V4glmVacTeQrqkX4lsmPywpsQJ/rb0K3
	h5p0EFJ4xmZu6Tp/OFRa6vdvbnKAZkAtQg/LXBV9zbaXgdz0ECkPmmZpR4MIEFkDGDPfa62TpSQ
	iM9/ax/WYOuPZ7F2Xmb2n6TiNK2R1arJA==
X-Received: by 2002:a05:6000:2f86:b0:437:6efe:94d2 with SMTP id ffacd0b85a97d-4396f153ad3mr23040020f8f.4.1771944069396;
        Tue, 24 Feb 2026 06:41:09 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm28711195f8f.25.2026.02.24.06.41.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:41:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 6/9] classes/buildhistory: Do not sign buildhistory commits
Date: Tue, 24 Feb 2026 15:40:59 +0100
Message-ID: <fe813f613c79049bb376e2cb05b71dbfd401dcc3.1771943829.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943829.git.yoann.congal@smile.fr>
References: <cover.1771943829.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231859

From: Fabio Berton <fabio.berton@ctw.bmwgroup.com>

This change adds the --no-gpg-sign option to prevent buildhistory
commits from failing due to GPG signing issues. Depending on the setup,
buildhistory may fail to create a commit if the user has the
commit.gpgsign option enabled.

For example, if the user creates a signing key that requires a password,
the commit won't be created and will fail with the following error:

/
|error: Enter passphrase: Load key "/home/<user>/.ssh/id_ed25519":
|incorrect passphrase supplied to decrypt private key?
|fatal: failed to write commit object
\

The bitbake command won't fail, but buildhistory won't have a commit.
Also, the commit may silently fail when building inside a container due
to missing packages or issues with accessing the GPG agent.

This is similar to [1], and signing the buildhistory commit
should be avoided to prevent such issues.

1 - https://git.openembedded.org/openembedded-core/commit/?id=7595a0a63a933af9dd9d1e458dc34a4ba80d9eae

Signed-off-by: Fabio Berton <fabio.berton@ctw.bmwgroup.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5e18714aee52db898aaf9d222fb5a4168bde96e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 4a380c10c6d..f8ef3d029ff 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -797,7 +797,7 @@ result: $result
 metadata revisions:
 END
 	cat ${BUILDHISTORY_DIR}/metadata-revs >> $commitmsgfile
-	git commit $commitopts -F $commitmsgfile --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+	git commit --no-gpg-sign $commitopts -F $commitmsgfile --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 	rm $commitmsgfile
 }
 

