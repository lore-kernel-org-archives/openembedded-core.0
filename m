Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0C0EE49AD
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:35 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71911.1767125551120502174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lzZHPGr9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0d6f647e2so166144285ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125550; x=1767730350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XXMZDBeZX2X/bJ/rI9phB6Uf+nOypwNAlicwGQpUXQ=;
        b=lzZHPGr902pXIRE8uzoyCTigP2GHMnU9fOIFYNLk6T7CNih8fekWstDSTN79bHYCFQ
         meUDqwX+uvz3/NoZ1I9XVDk0dnFN5+SlhNK++2zlkcmyGn4IDIEkvz88WfASM88fq4oH
         AfQjz0LMh5/xGequYPsNnJIHF+5SEsz7CLl2KwSxzBAEc+NUsiWM4+L57Ov5ccUp1H27
         n5XORWy0DBw3pBHnWEwj5+oq6cB6HUaddx+aOGK56D38yFnzybBrMaOuZIwl5XIi2/tR
         hf4LvAofjfGOU7ltpeWisEV+23VW9QvMabcLu0Irgjhwn/u/W/2tUKBkC2k5/NEf83t/
         2Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125550; x=1767730350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XXMZDBeZX2X/bJ/rI9phB6Uf+nOypwNAlicwGQpUXQ=;
        b=ALXkGAfgH7NfN55NFgH08FueZT5yGpliKzoufpNLibJdcd1B6pYnDCWpR1q6CYZfSX
         hIK2TDWXnICUkh4bXKpxa5V5SbIzAiDEzPZRTgS8e85pNNN/y13PJtSWJ/sgXdF2eoFX
         C+UrvnNdGHciuM2wzSvXwGfHvxe8RW/ArjXwO6RAkP/0xMhb9ehlMLRqWCe3yW/p9aOx
         FsbtPj2phXz9i88bpZ+Bf2Gx13KwN+V3SxAOPuN3+Zcc4fBUW8TLdv94DOU3MskKBPjh
         c8eljgqMs6zuhEHCmumTW6DlzTjCuMuIYY+MNBHtu1rXfgytrpqjugCVf3itIlMzK9Nm
         R1/A==
X-Gm-Message-State: AOJu0YxHxP7fCG/ou7YQLy0U9KT72/mI72ILohsUg8/Gpa4wau9YOweo
	hG6NFgehbJp6Ltl+Qwz5LuZ2kz1CVx5i4PpG5ynWVlaR/oX0Uj7f0y/KNCwXMFq5kSZjnEA9Yjt
	dlt7x
X-Gm-Gg: AY/fxX6p3RFYg6++A9lEj8QNaRKPLKI5ZNuDQnpijCww7OuWg/S8hFpbl4tiA3OQNXi
	bfW9X9/HrzJQx41/tdLmuRVEy8BJWc55bQJ2J7Zn0hc5wXJVM8tSUoI0Osqp72arfdNPIE12WV9
	AwgJRNAZAKw6pi03BCF760xNvagZ++29lsZzpmV2yO/QXYmwNMSQqVZvrVLbKT4oujXNzzVV9Nl
	hhPNXU2wiMm3kJSolZetaegDXFX0kgcbo5dknkAiDFM2MJYntEzQorJrM1HWsYW7Yu/qP3zZUkG
	QqQkh5tBBVOE5KZxmMnPD7XD8bmP1F1dyGoY/myhSK21ZCAEsPGeAWfsinv2o2ay2Q84GyHxysV
	M5D5UmQu4PX6pbknXXph5s3uh6n6BGWeW03yJrr+lo/SIoPCXF+ZbtyZGmQZSCUz0N4X8p0rDWx
	to2A==
X-Google-Smtp-Source: AGHT+IEnL5KuJjY2xvIB7tMj01SLdJk327wvHY5YkaHP0xx8iKVo3zxPZrkfaqpuP+Sj0A2UcFuw4g==
X-Received: by 2002:a17:902:f552:b0:2a0:c933:beed with SMTP id d9443c01a7336-2a2f2209461mr340352845ad.4.1767125550450;
        Tue, 30 Dec 2025 12:12:30 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 13/29] gstreamer1.0-plugins-bad: upgrade 1.26.5 -> 1.26.7
Date: Tue, 30 Dec 2025 12:11:43 -0800
Message-ID: <3be59123a48bdf1d06c5725cbf39846ebda7bc00.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228705

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit aa9909912ad4734a2a2f6e4fb4e49baebfe7b099)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
index c1d416c2bc..f19979c4b4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "9890f262f3b2a9564dcb629e9eb697d77b93d1f71897eda1a8170b7dcfe73294"
+SRC_URI[sha256sum] = "a0ab17dddd4c029ecd7a423c30badd5a3c7599ea42707016d1d57545f5723ccf"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.43.0


