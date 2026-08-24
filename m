Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B27BC61DBD
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:00:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16159.1787576455397250929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tbb9cKPX;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so19065405e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576454; x=1788181254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nq4TaHQ1E2/X5v6YRvZUqadvrmZEfBok6U4XiBV4CwQ=;
        b=tbb9cKPXjShUvldOdkvv7BRUSAjX8VmS02K0d+2NJYalaMNoAs4fPMgrHQKb3Rrf+v
         FCRw3kaBy10q28gRnuV2OqFLrD19V3Rp16mCzIzzakX8SUKlGaGNNpqGNkLyidMj93WV
         SBTtzPp5FEPYsurPUiA1Kvnv84ONZEVhyXVxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576454; x=1788181254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nq4TaHQ1E2/X5v6YRvZUqadvrmZEfBok6U4XiBV4CwQ=;
        b=A7NiFa3N9KLzc+auo0kPypA24TlNO7cS1cD83yacplnygemEpoOZpCSGvhYqiy478L
         NMLqVChobJKj2HiIESvi0zoy51paQAFnf1AybNWYqHlMbhyTLluDPej7cowltIDrzOW5
         66iVKdhAPKciDWxt0kyeiiszAuFGYxhxKE4BKukug+NuIHnJhM8Ga/UupbL9n947yOPc
         FsxdSyNxi/i/5R078tVBe1MKY4IG5h42uWVe5gjIJsW46m4+wggQsbOo4dOW46YgK3sK
         CA4xZFOTRfx2NiMI9UD8b5vidJ/ByH2VVgt4lBHSk3PAYtC9nfLJuT/oRHJry1bnLFbf
         801g==
X-Gm-Message-State: AFuF++kDfMqNMLoAniV6D8zKe/EswyeyoMLECKj6xapJxemdA6Gji3IZ
	VaMuihYiRkprR/zOIamiB6aMl/iPTAbUln9OU+jSWlNSCBzib41BXUcg1y4U7sQ6MsS2otp8Mi8
	0e28lE38=
X-Gm-Gg: AR+sD13wtBP3XFXs8qEdc09MdilvyW4voWQJx8ukfOJakugX7STfimzKUNXdIc7Co21
	Yl6yn3W0ZeRageraIO4UuNcpquGrAPVJMffuDbkuem8tgmXt4IF6jXS0zzxdkiAudAhEx8DXjP0
	YtCnxRWQKYDKqWjXb1R5YFJNdWjanXgkDirlXAiZ5lx8wFSFZay4pG0DAT+foIHLMq6ICn1OenT
	DZZLjCgv7Rh7WqZxDTuzfJuI1tEeROn3DzaH6eMTnSLYcoNc8zBqWLg1+WZ2ypF04qVtHZX1Tp9
	mC4t+HZ68wHfl4Hr/85ZHuWg85jGpVJeANsPk9OTKtgm9AISCEBKsC7jB1TIeLbvb54sB7tnQWZ
	etM/rKYdLMxh78axKWF5t+qBKGVuNL+BMYR0y7DEB0hkhKWdouJdG8rr6iDh8xPNf4CWpXOFkt0
	fR5Fx6y1G3Eo/bmX0LbuZDCAzl+xzgejdOVrwt1a4sJRDrHYrJNBvhtUsM0aSuCzfHvqZLRUddg
	UYMAMpWw8vW6cqNjzeUEBjXG/yNYZx0xa+y6jnbjqw/+VZKt+2i2IhYE/2cgrntQ4uMqDwe
X-Received: by 2002:a05:600c:5490:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-499b913eb08mr241109335e9.1.1787576453505;
        Mon, 24 Aug 2026 06:00:53 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/19] rpcbind: Drop dependency on quota
Date: Mon, 24 Aug 2026 14:59:59 +0200
Message-ID: <9704833693c5431c48ad85dd26a57ae9292e54cf.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244110

From: Michal Sieron <michalwsieron@gmail.com>

Originally added to provide rpcsvc/rquota.h header [1], it is no longer
needed since at least v1.2.6 where [2] was merged.
Not sure why, but distros like Arch and Ubuntu (possibly others too) did
not have this dependency at any point from what I could find.
Anyway, this builds just fine without quota present.

[1]: https://git.openembedded.org/openembedded-core/commit/?h=4771f4af5926d724958ba7cf46b937c53babfc7c
[2]: git://linux-nfs.org/~steved/rpcbind
     8bf0ce4a1858b5cd00440e416ecfe0fd74662a01
     rpcbind: always use inline rpcsvc constants

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4339890671f86119f7f85cb23ec84af8141f893d)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
index 692c421cd9a..000ffe37040 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "The rpcbind utility is a server that converts RPC \
 SECTION = "console/network"
 HOMEPAGE = "http://sourceforge.net/projects/rpcbind/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=201237&atid=976751"
-DEPENDS = "libtirpc quota"
+DEPENDS = "libtirpc"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \

