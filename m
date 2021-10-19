Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580B0C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.15311.1634673315181159688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MPPdasXY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so745052pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=V34BBl/nJDOt3+8OMfK34uerBzcN6ZHqGqj0/z1RqkQ=;
        b=MPPdasXYbv3Wy1B9qwdL0WK3WwHymUQi+lCg2zjo5hJUiQFn7/Rswfh+5BGch561As
         6elQRutF6vlyZX0Hw6Rwgq1LXkexoOLR1c6+WCViZbwh6OwWdFZqLN56amcyxcKvatEu
         s8YNHueQr99Wy4wKdGmueMv2/fSOqCe9EqFlcOXKh5tWEN9HShNa46PjUheoZwamkCuz
         7czxhNppr+aBji8XClFQLOlVa2PoskScQNZBsI9rhtrk0W1hLsKasTPS8FV/UuCpGIXV
         +EHf+xe44psHJvuDUyDloCpkWKnck84mtAx8EZyFg9bXhTGqpLIHTw11wMjaDqqSebSe
         w6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V34BBl/nJDOt3+8OMfK34uerBzcN6ZHqGqj0/z1RqkQ=;
        b=6F/dSjBJAoxGW3gW9vjvnJAGdSpri51WpPzbPIn7Wwd1BHvTQdPs2dY7LRRd5Pb45I
         koPzz6VoNy7ZOko/sWJIfbsPfqnfviAgWJy9SvGIclWN+/Zp6kc699OMp82En/EHiyYj
         CsTutNGiVhKA5y8CavxftNXekicT8NxdPiQTlj8c5knm2e1XCuOdU+UOEgwb5OzVe9mS
         2/ZcL7AcBMJ9nq32ZpHNNrf/Ih+8Jn9MsLAny3Dx5rj8gw6kwiYc9XUSMG1Dk8brRBHG
         pewa46v16QtgB1m1ylCiNiidTSJfC+7ln/b/7paZlweWpUUDJmNjzMM4KbAUF6+8IGwv
         WVrw==
X-Gm-Message-State: AOAM530bvTL/pJ7UjDl0d7l8hIL2jZ5BoaGB7NGPt5KEVwd20dSrRPL1
	yvWYsbNI8G+ox8nnqyngkOT6vRa6rCa6I/57vps=
X-Google-Smtp-Source: 
 ABdhPJwF7eFiiPmblAPM2xK30ozeqK2L301GinOcr5Y8mM5YSqKj58AsWjToEm6qRB5z870qz7AawA==
X-Received: by 2002:a17:902:ea0a:b0:13e:8b24:b94 with SMTP id
 s10-20020a170902ea0a00b0013e8b240b94mr35049659plg.45.1634673314244;
        Tue, 19 Oct 2021 12:55:14 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/38] gnupg: Be deterministic about sendmail
Date: Tue, 19 Oct 2021 09:53:39 -1000
Message-Id: 
 <a8ec8c9eaed898c3cc719efd87a2f4296c6304a6.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157233

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Set a path to where sendmail would exist making the output deterministic
as it no longer depends on the build host and the presense of sendmail
there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 32e03a430f13960fe07f08c04eaa58017d977f6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/gnupg_2.2.27.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.27.bb b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
index 1181c8341b..18bb855769 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.27.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
@@ -32,6 +32,7 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-zlib=${STAGING_LIBDIR}/.. \
 		--with-bzip2=${STAGING_LIBDIR}/.. \
 		--with-readline=${STAGING_LIBDIR}/.. \
+		--with-mailprog=${sbindir}/sendmail \
 		--enable-gpg-is-gpg2 \
                "
 
-- 
2.25.1


