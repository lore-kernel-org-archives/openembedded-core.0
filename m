Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD03BCCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:46:01 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7984.1762461952415202377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzitS/LW;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b67684e2904so32360a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 12:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762461952; x=1763066752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRsuRMQDWWV1l4x40ZIiwdkTxe6BAKrMJILD0aKzfX4=;
        b=XzitS/LWXrXuSZ4TUGzKS2cimvJozQ5WyAqibSMWYMr3pR8AiYDFbF/LmwpjxwCbdu
         VuKsbnsUEgn7HUfTKaiWo8Csw6M2QEqxx3jUMrqS3gjnWyumkZcjL/BfIW1pjcQvJETe
         oNW9kV53Arwl0bJUSkfcsf7JI8XRAcKv5Ffjfu8O0K1VSgzhY5GuaSUm8DuDeEyMdsdo
         aZNVW6Z48R5nlNCrquVHOm8AgwiohV3pzjOT7n75lSpAS+9znoGy+KtfhRVbCCnNEaMD
         HjB150XQU491Omd7W6A/cuU30si9xYsVJxIrjMeiAtW/0cdJgadagd8IXj6wsaG43CE0
         2mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762461952; x=1763066752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nRsuRMQDWWV1l4x40ZIiwdkTxe6BAKrMJILD0aKzfX4=;
        b=eDgPK9Dszk38RQog8T9UeHUOL7LkAfTJMEBJJNSPY9tGKH+PSiiDFeGZN26srba8Fl
         /XNu1235TGJXfk5U5pOIAkPffnaGRuQbBKamiSjhh2lxT5cTW6LX5uYkeNhNyCHqoRX5
         mJFL6Z+b0K2HEyG4pRgmaHcv+oZcGKZR1q0Qjh0LOePyVbSeVyeWbApetDkTS3u5XqI7
         q3bdp5aCn/m18RDVQycqmat1CFpeqWK1v6svuqqA4vcRb8OgY71Q+DDRhrOIYfoRGd8a
         9UwjlHL0wzhIsHveKh5ZvQYJQldT+6KJaLN/zfCRmiQhmXdWdsYPEqvMnDTCqjG+EnzM
         zCcA==
X-Gm-Message-State: AOJu0Yzm3n+tsDb7A7MZ8f1O4rZ0FRvLFqTPojkV1tNqNKv7LJYmlXuZ
	I9igLNOM4+Yx/QHu0PDM+QqqTngGgV5c512NHgX5k75d5KgowzbGyr1m7PbYrQ==
X-Gm-Gg: ASbGncvSOhzKYfm9wmjH9LtljADF+eXh6LLk0nlhkSxY658kN0ruJnwtKXVR3xsOL6T
	IpFFQ0Tby5vzBfYqITAAcwDG+t2pdO/nRTEovG+sAlxds+/SeAh5I67Y3Y4etAKDRYyXohceNV3
	baSB0ESIArL6JJjB1TZGPI5gyQPqJtKCbIK+AuM2Qn360hiDqA5jZffNfxoZiqXKUg8ogOxl8BB
	j3A26nI+ws5BGG5N1pG5mtE/0kzQgj5GRpvW+KGWOevdnGxwPsTdxoPz9ZtDw1ICDrih8uaIw9L
	IrgzA6/TrRkVzM/JiezQwuRUEnj7bpAkuxRB4ELIsWLyfKE2qrNgAM4l7d13E2FFy8lImx+K+Mm
	WeOcQp6RugASpJcJPIcBkzUYPLij4bivKskS6VKzTc0f835Q1LhJSqWOujwb56j4Nm7pEr1lVBR
	TtgYAA8BSNjN3FfQ==
X-Google-Smtp-Source: AGHT+IH43W+p4Jtx5cCvvERWLZFAZyLO1D1i0hHlywg++PsYHN7oRAJTlfjdh7X/kGgUb+0QnQhdaw==
X-Received: by 2002:a17:902:d4c9:b0:295:7804:13dc with SMTP id d9443c01a7336-297c049312fmr9328285ad.48.1762461951549;
        Thu, 06 Nov 2025 12:45:51 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cb47dbsm37527085ad.96.2025.11.06.12.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 12:45:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 4/4] lighttpd: upgrade 1.4.81 -> 1.4.82
Date: Fri,  7 Nov 2025 09:45:36 +1300
Message-ID: <20251106204536.2079412-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106204536.2079412-1-ankur.tyagi85@gmail.com>
References: <20251106204536.2079412-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225999

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.lighttpd.net/2025/9/12/1.4.82/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.81.bb => lighttpd_1.4.82.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.81.bb => lighttpd_1.4.82.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
index 40abef784b..8221d30283 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "d7d42c3fd2fd94b63c915aa7d18f4da3cac5937ddba33e909f81cf50842a5840"
+SRC_URI[sha256sum] = "abfe74391f9cbd66ab154ea07e64f194dbe7e906ef4ed47eb3b0f3b46246c962"
 
 DEPENDS = "virtual/crypt"
 

