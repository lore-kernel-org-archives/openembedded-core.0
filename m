Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56670F357B2
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:21 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21279.1771943111990683179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NWp/a0CL;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4837584120eso39253935e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943110; x=1772547910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vMr9kFBxyDJ/4Xa9As0mKVdRQMMPLg2dqm43fVtePc=;
        b=NWp/a0CLkdcqfRxn7ptwDx9Tat/h3uBX/BVmJhHlPW7SEbTX0u9GPXN3KQuq3LMYFU
         FTgZ7GJbynJzM1dztIjswC6zEFyd+MqeM0csoUe7S/+DpvaDGUV+F4HuxuG7iPqW5zB4
         ZrEUiYWSLkI+PrU793LQ5/2gAmXNG7+F2k/f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943110; x=1772547910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0vMr9kFBxyDJ/4Xa9As0mKVdRQMMPLg2dqm43fVtePc=;
        b=i2KqYf96lvsDafFgKav3qkskGiYm64tQPDHht3Mj+JSSRx7qc74/otm1E0QiwBBUY9
         O8NjY22IAOkQ3xQzmMjn6+BBVea3oIa5sf8L2NDTvzi9V2oghhvPOVsDQ7399yLc3Bzg
         AcuZGgXGnH4OwpN3R/r5mtaH0bpQGtYkI7KX/ATEVF2WVNbX+lCra9EHtBodnAWSUZOx
         tzIEqQ50pFy9hllKHkMGLU9yDyfzNAZ/lneIYbKfWsBelO4dXPMWBqOHt4Qjargjfw2X
         xPiBrz8B8TV3h6y7O274+Jn5JTtbSTTtvG4B/Zv9teNNagIeXM+HnDWo3ZCsG+/ILFIW
         kArg==
X-Gm-Message-State: AOJu0YxM075yKUWmd8a7bN9vl/d6DSyvkjbmXLHGHeSDsADbHP01vtgf
	KIZRqqOLr/Uxln+At692RjlbJuUOPkanmruBr43slQaK2OT71sj1LPnlkV4cXvcSZx+QuM479As
	eRCIyurw=
X-Gm-Gg: AZuq6aKVJwbNBaIZM5a+q2emKnecdHjfWvjV30LGd1412mVT9TLEAx4x7/IpuXLnTYl
	79YvG+USEL/bd2hyv1/spZvkOql0+P936c98ubg4Dj+4cMSdbFIwt4U7d043RpCBRPWqwyZCv3s
	BlaPv82id0bgTq2GOSvFI1OoJjQ6PGmlZFiEihEOtCUycTR4ytfz+fAZtBJ5diXXlljp2IdFSXp
	L7Xo4Ac+p1t6Aq6+m7L2Gb8W3rkq/HBLLQBKcRkMeEKI23t5zkt9BmmzoYYZ7TN5hwzQTP9vidG
	wFT+tYSxZ4CrpPc+PI7TAOLapJIXnU/qW4DSCPV5Ag9K1G9FefTksHAISigDVa4xhpjRqBYzpMH
	VJCtBdp60sUaNYgNA6+8N1YQuHW9uKYagYi4PMfdzdgphYABZi0IAt6rO7mhMfnuLvgzEfW3nKo
	pQYzJoPCTMaOSw2cJUhYLHLIayVhTM2EVDuoPNMjVRMvVKxqOsTjj+x4BQ2X9e2ssfXUV6Dxgsd
	KQ0p3D7/FHTtawz1Yzm+UC82DpNofPN9iEfCcAqFLan
X-Received: by 2002:a05:600c:3b27:b0:483:702f:4641 with SMTP id 5b1f17b1804b1-483a95bd842mr193873795e9.3.1771943109996;
        Tue, 24 Feb 2026 06:25:09 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/38] classes/buildhistory: Do not sign buildhistory commits
Date: Tue, 24 Feb 2026 15:24:13 +0100
Message-ID: <f46f4f74045020951ffad19450c90180a8bca6b4.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231787

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
index 83993f5752c..52f886dff68 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -859,7 +859,7 @@ result: $result
 metadata revisions:
 END
 	cat ${BUILDHISTORY_DIR}/metadata-revs >> $commitmsgfile
-	git commit $commitopts -F $commitmsgfile --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+	git commit --no-gpg-sign $commitopts -F $commitmsgfile --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 	rm $commitmsgfile
 }
 

