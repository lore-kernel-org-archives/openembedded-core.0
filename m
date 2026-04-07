Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E8EEDB7DE
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75678.1775546025777870082
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SzXKfDDo;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4887eca00c4so31465455e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546024; x=1776150824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFSjZKpY+ZOBlTnU1ZhWa2/FzL7hm+4wH1p530QQaSk=;
        b=SzXKfDDob/zR8q+HggZtgf4/VMCwuGhOk3QrexZohMeif1hIfS+at/ppSENv8PTedI
         pCr0AUwfRJWnPN/MUTXMdzpbrCCG09PZUpFqN+HqEVHHyP6EwnYhtDq+jzmS01eFjEHv
         wbYAynKMO1/Y8jaQj4aysfhlY61XB8h1ogr6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546024; x=1776150824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFSjZKpY+ZOBlTnU1ZhWa2/FzL7hm+4wH1p530QQaSk=;
        b=lYxF+p7lbjB1ZU9DFQ44UtFymNEg7CH4Bf/iEfvkieB2GSs+JDhI/F+HLzbu6264lT
         nkzh+C+ipx0HxaGAgjB8UE6NdQkBbsQhTan6b44SWItNKL31q5UI2rvidjtjZwjQ9ISH
         H3wUEj1pQuJItrSh5p3mPcbcijZ1lWXxevV1dxVhY3LutYUI2GiinlfcgWDIVqCZiFt9
         hkcOkkujRK3LRcX/11ufxUd3Ph/R672+zv/3pG+NaAZNSUACeW7IQiy57QQ8jwlOqWLP
         7h4QCbJrpp/EpCwm/9TgwJVoXKiJMYQVTwZCqRvWhAQppPu0uoBAANUpVBR322pXrXoZ
         KqnA==
X-Gm-Message-State: AOJu0YyXtuUUZDhJ1A7wr1Y2ptuMxsCoBaYr2MS6Pxf7V3FvUPVJzPhL
	g2LrQSI5ILt+ESzxT0N1Gv5z9isNlmJMPmYXgdXEYHb33ivw7QZgPjO+qJ5DEA6nDuuvtWm1PJl
	LG9TDfAk=
X-Gm-Gg: AeBDieuuE9tTBFlgtU6cqf34fbP7xcWUk8Edd9se509KJ3AS36rKyyvPnPt33v34m2D
	1Ttj+lgaYgOUxZSPoVVjhJz7D3Sc6UhHu8BAHo/u/2hUF7kdlbZVyLqfRFTJJf57pfplAYceXqt
	XVZ86Gm3TZK6iLwIuzHfQtrYvjv3DiMwYQgCHyfGWPJwx7W1s7uZb6iDVE6HMWZo85/YwQW6Bmm
	2KN5QW1xTT/McvmyvwxzXg2EPnmsM6e2YQNBgN75RfAUUCo8GniySRUj0kMgfvb/B4rvFm+nSlX
	nh1M0FLDRG6FcPUJ0u3fimnS1r567LrbqVVdA8gnsoRW1o+/W282P7eHj9ioMwYvQLXMJq3oY8h
	8sE/HOlPpXnRo+Rs/tFxJ3hdxmk+VuqgUVUTcKcBHQVXRLrzPcOY/3dBgzzBb+jQ0aM/5pa6IwY
	XG4K34S1Jz9LOvsoRbg3Om/6WotfjkrREiIYb0MuirdtDGNnEuxLnnnbs0+Zu9Xy4W2YCMFRGkE
	9yhfVurcxBFegTUWsMNvaj1Rxc=
X-Received: by 2002:a05:600c:a404:b0:488:b749:8478 with SMTP id 5b1f17b1804b1-488b74988e4mr48722135e9.6.1775546023864;
        Tue, 07 Apr 2026 00:13:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 03/18] create-pull-request: Keep commit hash to be pulled in cover email
Date: Tue,  7 Apr 2026 09:13:11 +0200
Message-ID: <58138d386f1c221e87d2217bddc7e31d02cab58c.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234707

From: Paul Barker <paul@pbarker.dev>

The cover email mangling in create-pull-request was cutting off the
actual commit hash to be pulled, making it difficult to verify that the
changes a maintainer merges exactly match those intended by the pull
request author.

The extra lines we want to include are, for example from a recent
whinlatter stable branch PR:

    for you to fetch changes up to 6c4c6d39ea3202d756acc13f8ce81b114a468541:

      cups: upgrade from 2.4.14 to 2.4.15 (2025-12-29 09:49:31 -0800)

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c78f5ae4a5ba3675b78cc226feb7b9fbbfd8da19)
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 885105fab3d..5c4414ecd5f 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -219,7 +219,7 @@ fi
 
 # The cover letter already has a diffstat, remove it from the pull-msg
 # before inserting it.
-sed -n "0,\#$REMOTE_URL# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
+sed -n "0,\#^----------------------------------------------------------------# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
 rm "$PM"
 
 # If this is an RFC, make that clear in the cover letter

