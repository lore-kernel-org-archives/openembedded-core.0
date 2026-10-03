Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11744CA5FEC
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 21:43:20 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13637.1791063796287690383
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 14:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wKLKZOhn;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b03eb33b2so198690f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 14:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791063794; x=1791668594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NwOVOGPxUrzVvvK63WqePqdtkl63bk87TrAAj/yEeq0=;
        b=wKLKZOhncnVF4bBTWfDMnt+9upuqtjg91TQ/CkShjVYyw5gjBsKhaoSw2H3H+WKRea
         ovaezo+vYr9J194cz1RWQO7IBYy/BUy3v2fcolYDfmsGKhEIdt4a9vzGSfNb3mLh3A1A
         WNXuzjxQP8EUzqyfs1VNsFuKBXJo9jqtI+Qlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063794; x=1791668594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NwOVOGPxUrzVvvK63WqePqdtkl63bk87TrAAj/yEeq0=;
        b=JjFyKcIVjuxYdX7I45HokV73z9KOAxmM5aySiXTV1/abWa3748MtWmioNADTVcXV0d
         r/tjJq438FH8EnASPZKLb2CXqRgxmEuqYFKH1/U4Fi1XxFUy2OaSgTKLjOvsyvOatlco
         c5lmUt66t2bOK9m4wtNQuDxGBewcyF6oFsXFhjdw2gmGYBjHOKyvzOeVkpot9CVRPgnQ
         EinL/4krQ5EEOE2H5/ZU9YcQs/n56DuW//a9DJDKTOl4CB+uHYWabUeGtp3NRVtkzWXq
         omfsfH55BR0F79iOL5ft4BcxaXAxlr8hBzRdRJzgPv0Zrk3CXvCuq7bGEf+hEtE/Xvju
         CBQQ==
X-Gm-Message-State: AFq9FYKHaHVNFECCbaD4rDnup3bkX15UEq3XWQkJp1HfMH14U+Koq3Df
	97OuBFkWjpmjV2SBlcDr2l1YF0cXC8BmI7rmMJw4WYd59Mboc9SUIcradsp+plWzOyj1z0hTScz
	kGY5ecOI=
X-Gm-Gg: AYBFou3Q8Ubm8ikYRbaJ1YatBPmpsCK3SvhbLh2YxsgNuD3Ek2I39sRAb/vvVxX2fEL
	H8kVta8ZdoAR8UTkk4hE/OW3KRnChpPbc9l8uZboxcTmVe3hOynlfHwSl1PogtMAeBl8pzksFtg
	rkZfqwrS0PLqITcIrNW/LjOxShM1CrOxKCYJw6SutI3AQMagb/teyQInQYtBpBPW/SxjV9t0YD5
	/mtjXhGXP1BYvmj/RTqCgokVR4ZqWlMqICTiT/+8OD0zBfUM55we5tWKdCVoai4/hh+28u4C8XC
	slH0Fy4xIlGhlZLDisKNVX7Ku9B94GEMnnzCpp6ZBhE88/qH1JTuL0ZdaaN5rnC/5KAuev4VAFX
	Qu6zq8QFSABSHcNRmcpq98AHUfUitDFL9IFUIGqIF85ySBuT60jAxBhECOZVpNtwULkvWNYYzZs
	b7mO7xxw+KNYMPH1ZtwkNCDWTBR+ZhD9uwEvt8vEmruwhAmTPpQWURS20MGupKi/Fj2xI6W05LA
	5ucsyGZ3RerLpZ9D2SWNFY3OQY1OVlS8CzWzNbYW8qdE+o653MGfB6Pns+DI71vMw8=
X-Received: by 2002:a05:6000:22c9:b0:48b:469:b562 with SMTP id ffacd0b85a97d-48b126f0b7fmr11804260f8f.2.1791063794555;
        Sat, 03 Oct 2026 14:43:14 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f04e2sm12832952f8f.15.2026.10.03.14.43.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:43:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/8] sstate: Update unpack touch code to be consistent
Date: Sat,  3 Oct 2026 23:42:14 +0200
Message-ID: <147004ef60987039372c977e6c2f304a5414f39f.1791061402.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791061402.git.yoann.congal@smile.fr>
References: <cover.1791061402.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 21:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247182

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When we unpack sstate files, we want to update the mtime+atime of the sstate
object and any sig/siginfo files, both for the files themselves and symlinks.

The logic was getting a bit hard to follow and wasn't entirely consistent with
only a time in some cases.

Clean it up and be consistent for all the files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5213ca88cbec4e86b50d8da1fe4c300ca8f5de17)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: for [YOCTO #15289] ]
---
 meta/classes-global/sstate.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index f2fc4e99524..9d2125c398e 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -932,12 +932,13 @@ sstate_unpack_package () {
 	fi
 
 	tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
-	# update .siginfo atime on local/NFS mirror if it is a symbolic link
-	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
-	# update each symbolic link instead of any referenced file
-	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
-	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true
-	[ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo 2>/dev/null || true
+
+	# Update both any file and any symlink pointing to the file for sigs as well as the file
+	for file in ${SSTATE_PKG} ${SSTATE_PKG}.sig ${SSTATE_PKG}.siginfo
+	do
+		[ ! -e $file ] || touch $file 2>/dev/null || true
+		[ ! -e $file ] || touch --no-dereference $file 2>/dev/null || true
+	done
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"

