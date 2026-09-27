Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FF5CA5FA5
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 16:46:47 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40585.1790527601068129151
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 09:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lmk0eIKq;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so13377015e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790527599; x=1791132399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WHcV/vJNMfkrajbMwxDQ8sPGT3aQiZMRgmZvy3tHZzE=;
        b=Lmk0eIKqj3BP6A9CZahRsvSzqpTsIfHecYlwglfm11Y5zqKNY1al/TbvNp/atTpGUW
         c0Ix/FVskqSi5aRlp1ycb4dmnnI0s8HyMPbXseDOIfFZONueTwC0uhX8a1t97uaHt7Kv
         rJ0gwzyYpxU4oh4MYFC8uA3uBAITA/Hd7TBGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527599; x=1791132399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WHcV/vJNMfkrajbMwxDQ8sPGT3aQiZMRgmZvy3tHZzE=;
        b=mUkRQqDc2hzQ/W+JiJUzoQEt6wqUfZpOow20ltnF83QhkIIS6jLPBdJNoU1D2yx4BA
         F3lkguhgvwUmnA7z5rLoy24n7MAZRBQHJKWrr25Xc/xrEBB8kI4FSakCKwYgOLNN4GOL
         xm3cyEzdWs7PvvUF5LLnR3nWptWhECvDmoKNz/ADfW63zZ0IZCTJcRhnenoSrMp0HsHI
         L3Ox4DGMVjD0X2EZg9IgdrLIUPAS2Nxu74gR9GM6GEJ7/DcHhRK0SiVct12P7yqVHrtm
         IgJnPYz9am9hnLMv1TeV3ztmZRQdJ5mjkRR0IdzWWzpnIk93TFKUGV7av7wUEui+aNkb
         hDrA==
X-Gm-Message-State: AFuF++nFKa2JM+cVxACXXOvdwdnPe+Wc6A97q55CqVUaqM+m9iVrlJWL
	U/i1zMwrIw4yov99fMisqXFBcT69jOjXhGO3cZpApSQk2roa1XAO23cxh4s1HBSjA6ZRbdEozQS
	7O0WZRt4=
X-Gm-Gg: AYBFou150rRrAGEg1XOjrigIfCmPXJ1URTWOjribjKb1RsBPGe6ES3z+Wp23kLQnCDk
	qq6s6Kv1gJQkqoY3f66l/p2PJc01lqP1P+QFQl62V/SY7E4qnYdH617d7OPxt5N44nQGTVU0ZjB
	waHeVtLOd6DZvCxA0WGQSwuSi6U4LccljuoUH3adQdyXu0H5wZQ9IaO3iKzS+YoZxn6IsjKrV+l
	e9cRdYnlDOdRc/Ffcr5eaSZ0XAoNwA8OWhzRvLm3dQKmubTGcxi5Z4EuhYgWvzXxXGssK8/rAau
	HuxsbFJofI22uiMfGbQpb7y+uuoUKcyguxenjh42/POcl2bU+9GbPdVJvo/yCqfAQpZUcrg/CXK
	I6w8B3S/cjlwCd3L+okpZ2eP0mtI2qD53/k3J3aF2C3toiE655H3HUfdsafQhOAr/+mbKm0Ea4M
	+Vnc2S7EFCtVdrRCgqyMbYQ2E/d764TFE3GXKoviBC/4jvjUSUCabXPlJDkNUKx46hIvuwF615H
	19AyapO/zyBKa4Eyjt6s19LJjE=
X-Received: by 2002:a05:600c:1d1c:b0:49f:db7d:856 with SMTP id 5b1f17b1804b1-49fe6708033mr186425515e9.33.1790527599156;
        Sun, 27 Sep 2026 09:46:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6474:fa9a:9a9b:3f85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0029203absm54683365e9.6.2026.09.27.09.46.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:46:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] python3-markdown: upgrade 3.10.3 -> 3.11
Date: Sun, 27 Sep 2026 17:46:26 +0100
Message-ID: <20260927164631.2484854-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
References: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 16:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246693

Changed

    Inline processors now resume searching after the previous match, improving
    performance for repeated inline patterns (#1619).
    Officially support Python 3.15 and drop support for Python 3.10
    Walk backtick runs in BacktickInlineProcessor without a regex (#1620).
    Switch static site generator for documentation from MkDocs to Zensical
    (#1627, #1635, #1637, and #1638).

Fixed

    Ensure removing Abbreviations does not raise an error (#1634).
    Fix an issue with excessive backtracking when matching inline code blocks (#1617).
    md_in_html now honors tags added to Markdown.block_level_elements after
    the extension is loaded (#1246).
    Fix quadratic-time regex backtracking in ReferenceProcessor when a link
    reference definition has no URL, e.g. a line consisting only of [id]:
    followed by many trailing spaces (#798).
    Document attr_list usage for def_list (#1123).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-markdown_3.10.3.bb => python3-markdown_3.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.10.3.bb => python3-markdown_3.11.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.10.3.bb b/meta/recipes-devtools/python/python3-markdown_3.11.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.10.3.bb
rename to meta/recipes-devtools/python/python3-markdown_3.11.bb
index a7fd3d78406..709e7cdb709 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.10.3.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3589362618f743188b4d955b874402bc814f4f83f544dc207719f4baa7d9c45f"
+SRC_URI[sha256sum] = "180224db6aed87ba9ce1f2781ebcd5826253de8ff637112090e24b84502bbf9f"
 
 BBCLASSEXTEND = "native nativesdk"
 

