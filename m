Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA3BC4828C
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:19 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.8502.1706323094965687961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dWg0QB4C;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d7354ba334so8317075ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323094; x=1706927894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHXxdilNRkVSnIT+wDTEB6owcWGRtOZ72NiQom7ngls=;
        b=dWg0QB4C0fGdXMU7Qf8Mnuv+lGwwucJvgvt6cKmUsMBlJY79vWUFRr5Gr0hGAwfTJy
         ND54hd7stFLbS8hCl4UyIW16j/ERoLYdzU1egs68BPpTFQwDUtw9WvYyrsx0Z1HoCbrY
         x8+zpFlHFnjFMnkZaihI114NdOvKH97XBmndWugNpdhj7Ezh8swmpatxvpLGi2WhnnxM
         HfOgOEFOKi5JRrf/9CDto857oGAumxC7lNqgDBPz9y3aGa0bSxaFiJpmmRbej9D6zRpM
         YdDm9a71NuPpTUglrxS9yImuFzwMZRoa5UnTVQ+N5RJCrKFVOeWjVmKz+W0be65yXARG
         c62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323094; x=1706927894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHXxdilNRkVSnIT+wDTEB6owcWGRtOZ72NiQom7ngls=;
        b=BinueKBzv/TVj9LU2g9E+SnVPwbZogkr8VGGwZDE7Q+zowRICBBYBhLbdSVccRsyjk
         QIo1wUfVli1zy9pc+piU9836DILi6jAs9Qj+90ao4XE2RACpQ9OsrFCx0i1ZRzDVJoSf
         gxUEIFW/F3fxwGuSUI4kX11Lp4onrfPYw1DYmKLapOvkK4gK+l69rvEhmncF6AeKrS/d
         MLk0aOU4kRzcNlV18zUW0YIOXYzKlKwTtfbRT5LmPXsktILVFLVOUYUkoFgP+FqPYPzs
         Mv1Tu/lK3J+Em+os1zw1xR9O1DNoLQl9Y/3tjX7i9rtmyqhbmL6/d5u+IqRSCukg7i26
         OkFg==
X-Gm-Message-State: AOJu0YzB4mTONgQxFtuHIyDu3wtb8Hd4DydDKlI6gt20w+a9fC94cZbi
	UNHwalwAj4ZR7cqZ1Aa8eQaidJoroumJF0Dur3vHPi6vapejQK5V47dz9qLznrYyOP5RxMkN1NX
	P7fV9tg==
X-Google-Smtp-Source: AGHT+IHLS2Uh2d4xl6s+RWiOHQv89A3yD+momKXqR6HBHz0Y39nIhQOp+35HFCbwYHuf0YCZ/ZxTFA==
X-Received: by 2002:a17:903:644:b0:1d8:a697:b995 with SMTP id kh4-20020a170903064400b001d8a697b995mr762674plb.27.1706323093739;
        Fri, 26 Jan 2024 18:38:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.38.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:38:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 19/23] uninative-tarball.xz - reproducibility fix
Date: Fri, 26 Jan 2024 16:37:27 -1000
Message-Id: <3dabf663a772b49e2f324ce5e875d6e633384559.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194428

From: Robert Berger <oecore.mailinglist@gmail.com>

added --clamp-mtime --mtime to the tar command

see:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15148

Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2ef7c63871ab4fb62a9cea45a23a78bf9d541e4a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index dfd4bb1d4d..8fadfef942 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -285,7 +285,7 @@ python check_sdk_sysroots() {
     dir_walk(SCAN_ROOT)
 }
 
-SDKTAROPTS = "--owner=root --group=root"
+SDKTAROPTS = "--owner=root --group=root --clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}"
 
 fakeroot archive_sdk() {
 	# Package it up
-- 
2.34.1


