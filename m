Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45167C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 19:34:54 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.3366.1645472093271621392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:34:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oh9TSBoF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 gf13-20020a17090ac7cd00b001bbfb9d760eso116338pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y/THELtR3g7lDa9ldQy+G1jVV2aW9pPPW0UbX6xpScM=;
        b=oh9TSBoF78Ha8VvIy9Ofg8DpSb1Ks6Xzk2TTJgHjILH4DavMLRePHQYHkStp/YkQzX
         USW8WTNlnaJXoJfp/VkHSJ+qTgTFT/lApY17OqHTUOVsj0MGMlZLfAKzXhcOptyxBtkU
         sY3kANrRtj7Llg+tNHWIiavDu0ZxiyV8TOHsl/otzjNYiOzLiLh36907dKkhKou6lARK
         fnrj5HHdEXWqKQRcMlUlI8Bj8Pr3oiG5lt1s2QGmmqowEs/+dxdm25yNoLTIM5r73W47
         k3yBM0ddEgnQIOkamDOQ5/g1nDUH3NURi2q54LMmD01uysQQbZKipLpg2sW7plDWbgoV
         u2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y/THELtR3g7lDa9ldQy+G1jVV2aW9pPPW0UbX6xpScM=;
        b=bNceHc0nV3/OzIzkQfD55DNBPxiXNll45d9LzpXtQG6pm16zwjfwz6BtaJ+7pKVzt/
         R+F909YhPe8ndQc60e0oFJ+bCqKNPA2BEwAhBLluL+3YwDAFw16B/iZ5FosczTaJdKrQ
         6sew0OLFBDTqX4DWGMV9HvMHNTBcqSnHlmmP9Sx8icN/P6twimRf5jStSWWqfxNaoLh9
         daacs+OKl6iVUeDJHhRwvRF6wLq4mRqypQT6kVNgk2q9Nl1Py3/xRTQnKe2ipRsr/ICA
         USwMzm+xeE7nUZYJ8y2hrXOL0A7g28GIt7n8NQX5uL8efeJ5bEFlqREm9wzmRR1k9G4l
         +Q7A==
X-Gm-Message-State: AOAM531Nw1XVuQiKTipLO8l/53ejxBtrUYBCQa+/462oArHbtOstY6qd
	Mt0ajH3FneoVOhSic7LAOF2S7LS6k2c0vX8G
X-Google-Smtp-Source: 
 ABdhPJyipo0VFM4HAJifXotdQfVpDe2Ah4KsWfq1i8Ugy0MiVYZd14DbC321FikVsIvTQjynLZoI9Q==
X-Received: by 2002:a17:902:e949:b0:14b:1f32:e926 with SMTP id
 b9-20020a170902e94900b0014b1f32e926mr20939822pll.170.1645472092388;
        Mon, 21 Feb 2022 11:34:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s2sm14286657pfk.3.2022.02.21.11.34.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 11:34:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/8] vim: set PACKAGECONFIG idiomatically
Date: Mon, 21 Feb 2022 09:34:23 -1000
Message-Id: 
 <ad373242381feec72d0c257031da7671281c0321.1645465376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645465376.git.steve@sakoman.com>
References: <cover.1645465376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 19:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162069

From: Ross Burton <ross@burtonini.com>

Don't set an empty default value and them immediately assign to it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d7565241437487618a57d8f3f21da6fed69f6b8a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 11fed67527..e811de5981 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -67,9 +67,7 @@ do_compile() {
     autotools_do_compile
 }
 
-#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny selinux, elfutils, nls
-PACKAGECONFIG ??= ""
-PACKAGECONFIG += " \
+PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
     nls \
-- 
2.25.1


