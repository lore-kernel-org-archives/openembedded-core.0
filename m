Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BCDC4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:53 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.143551.1671132072200312332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=p3rKlra2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so109734pjo.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2GmPDzbcvxJtZII8T0IJmjlIFcgkPalFlWc5TP+82k=;
        b=p3rKlra2exnHTBK9zkK9wGj02ZClkL0cOqFcY3KwDaqVfzotGBCigH4cLVCOpWa0GY
         OEafnyhpYrbpDd2n5gXOJLag2Y0YQjJ3y0xFWBB//LFICor7DSnkPdlNEDkbshL/LRDV
         8Kope5bMPFWHYI8pwkkuiVEfl76OODLtDFwUxEBoLupvwoUBLPn2dBV3qVacwQ+RBSEg
         /Av/NViIB98f//0wYLrlLpknaL0lP+0BnZUnODs9B8tL0PzibOPt2f6b5CgNZ7at51Q8
         ieczi9cblYk9AZ0mjstVLml5YQNCm/1vBm8RyEQY4PRzujPX32gVWZZcasDEcj04S/UW
         6bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2GmPDzbcvxJtZII8T0IJmjlIFcgkPalFlWc5TP+82k=;
        b=oukMcWwP7pSuTxTr6+pXKfTK7kFZYXzkNYwHWkzBa8+es4JuYKdisN/yNFMFtxiVoq
         yMdz5/h0Ykxdxsmv199NVgi5/Fp7HLz685Heys730cXnuDwp9TUYiuMCI69rUR8Bursw
         ooya6zIwkdP8tU/+Rr4RZzQx35NkSoyb09GvShaYXs/gvFyhUsGjoxr9HV5xjB+Ci7nD
         Ubw2LoB8q6RIS6u+ddfjGZXW/a0a8gBqXGtRiKrxCebTDKLmOblHLMsSCUbF6EqeFVOu
         i5Sk81GQGqSE405gOx/jIBceppx4vuneZeYKzt16C/ekx6t/uiodR908Vly/SqUrKYYt
         Jucg==
X-Gm-Message-State: ANoB5pk5vMWTNdhJZRW7naR29dNZb9Y/A3vWi6EhoH5QBGYpnFp3wNtv
	Ud3vD4vg3Tbe3XnWxdsalsQwVFPIrbeuuOdB0WE=
X-Google-Smtp-Source: AA0mqf6ZGAzEIkTfPXNniMeIp7e7ENCC5gYR7fRkr7RgwaRn0iPJ/H2Mux0CzzuJNt7NazuvE/1zjA==
X-Received: by 2002:a17:902:684c:b0:189:5f5c:da1d with SMTP id f12-20020a170902684c00b001895f5cda1dmr30742865pln.18.1671132104304;
        Thu, 15 Dec 2022 11:21:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 25/30] externalsrc: fix lookup for .gitmodules
Date: Thu, 15 Dec 2022 09:20:49 -1000
Message-Id: <216fb4a981ef7c8e40603aae603f473a3b199c40.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174617

From: Peter Marko <peter.marko@siemens.com>

Commit 0533edac277080e1bd130c14df0cbac61ba01a0c broke
bitbake parsing when bitbake is executed from directory with existing .gitmodules
and the recipe in externalsrc does not have .gitmodules

The check needs to search for .gitmodules in sources path, not cwd.

iParsing recipes...ERROR: ExpansionError during parsing <path to recipe>
...
bb.data_smart.ExpansionError: Failure expanding variable do_compile[file-checksums], expression was ${@srctree_hash_files(d)} which triggered exception CalledProcessError: Command '['git', 'config', '--file', '.gitmodules', '--get-regexp', 'path']' returned non-zero exit status 1.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 66ff3d1f65cd2e7f5319e98fa41f47a59b714c72)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 75fb91bcb0..0deb5dbf5f 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -230,7 +230,7 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            if os.path.exists(".gitmodules"):
+            if os.path.exists(os.path.join(s_dir, ".gitmodules")):
                 submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
                 for line in submodule_helper.splitlines():
                     module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-- 
2.25.1


