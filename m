Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6773C636D7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:41 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.113.1675289794797654589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lygOhFRT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id z3so13629110pfb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJx97jxBL2RwutUkyRnIFZwsz3f9Hs+xeEQxt/VKpj8=;
        b=lygOhFRT5hr9NDZJjVMDPNbZsElmL/fo9piTzYk0fgR4Ay8rGySmpzIZ0qXA2pkTL5
         giJIt2nL4WF9NHkBmXuGeEbwsA7BBf8u0ceBlrxOTtQgS0W1SI8Awof5aXXC7i8sRKqx
         KUzjn1uxbqbR6b/BpP5irv5yhSDS4UW5vAO5a3Go2qtxqdv4fO1EeTwQKvH5YXxiY9tZ
         XbJ0YVO1OzY9fTuapFa1LDQcHFD+vD8yixQdAxWphzPsk3NlXX2MGicQuhulKuuP8+vY
         vxBxXQwoe+OL1ZD3YwC/2gUaD5SAaDkTnKeF43hLBtKjP7bBn1zA5lcQl7DwK/yFPuvF
         Hlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJx97jxBL2RwutUkyRnIFZwsz3f9Hs+xeEQxt/VKpj8=;
        b=ImM++5tP0qryuqeY5d8PCfx/x+h9im0DXkoQY8994dz9CUEJh/H3COKo/2m7Ek34ak
         B7gJ7a6IPa9P+K5RRvUw5IHvuv7KQ4GADTMkih9oAnKduCEDP8sK/n4f6vz+kB/Zt2DF
         UOC0g+C3oip8Ds2LotUFBTciBJQwhrBlM9LvXc5TVUxFk0rvJPVEvdiY+3c8kqhWj9h/
         zR4EbqcqwHN8nfGuQMOmpfVtRNKNEax1g6CMcHUolZvGC9ykOSTBr1EujnfrJH1wGHjg
         DR7BnlUNGzHPT1OrcX146Z6sklEfC8jVjgiJAU0HdN+Wuhvp7FqXyGp9fhfIlL4H0KDs
         OYuw==
X-Gm-Message-State: AO0yUKUtDIGWbpSbAVtsuxKPC8Iq/8k61i52jw06mOjzI9PsP+I00pCN
	W9v+7WBG5ykeYgbAZyMEBFVOaBlRVRux3agTELA=
X-Google-Smtp-Source: AK7set/HVlO0PZfCiqb9z+M4sM2i4dZZ3VXHj8vW3zb4zWA8giq0+ew1hfW1fOshOWlpDxiIDQ7/0g==
X-Received: by 2002:a05:6a00:230c:b0:593:b49a:f490 with SMTP id h12-20020a056a00230c00b00593b49af490mr4842153pfh.4.1675289793845;
        Wed, 01 Feb 2023 14:16:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/13] devtool: fix devtool finish when gitmodules file is empty
Date: Wed,  1 Feb 2023 12:16:02 -1000
Message-Id: <3c3b16ed1c2e74389d570fba8800ffdec62fdd48.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176668

From: Thomas Roos <throos@amazon.de>

When a .gitmodules file exists but is empty then devtool finish fails.
Add an additional check for this.

[YOCTO #14999]

Signed-off-by: Thomas Roos <throos@amazon.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4f0f7c4934bade9e4d4a1086f9d8b29d8e9ad45)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 57135f2e4c..a649bcdff8 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -229,7 +229,7 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            if os.path.exists(os.path.join(s_dir, ".gitmodules")):
+            if os.path.exists(os.path.join(s_dir, ".gitmodules")) and os.path.getsize(os.path.join(s_dir, ".gitmodules")) > 0:
                 submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
                 for line in submodule_helper.splitlines():
                     module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-- 
2.25.1


