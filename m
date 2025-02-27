Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB422C19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:31 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.17131.1740678023138800326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=imCNw91n;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22114b800f7so26184395ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678022; x=1741282822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzY4evn96VhS+rlJN6Rmv773Evp5Lma+By5S9PiAUXE=;
        b=imCNw91nojLqfLkKCrTxN5kZRXL6hC9SC6tJ8Wlwk1v2jngl2U764zTho6Bk/6OTYc
         drqWaNuVfeKJE616vAfZk117ZtQ2XMH8QHDeQBJ2ajw/pKQ3POzy23l3UkSPRAikbv5z
         ZqFATesDmwBkd3+WyvjRXV6TD7F71xGBZLdH4nojhbkaSZIb9PMojUl80xbdjQ5XyXFI
         kVlsoxTQ0lzUxX0+eV8XCLQ5rMsRy6vbT/OQ5SU/3IkNCNnnxm0WJ8poBvWwS2+fl66T
         kHQfDDnEJOAMjLt5UVeLP2tfXv1c+pndkAYo3qHqQZxCWdJQk4mSDLw+kfEIJkhBi0tD
         eI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678022; x=1741282822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzY4evn96VhS+rlJN6Rmv773Evp5Lma+By5S9PiAUXE=;
        b=wpVy/anjn1+p5oHBW+v4VlNjWUWUEP/F1WtBqc4RLk2gSDc8F7Yg/jzCQdpDo3iDgT
         l7yPvnrAZtC+Un9fp0W1Wtcbxqj4O92ElxRTOpXwJFtH/V00i2avOyYbmE4A7MwWFRt9
         HtYYVaKvcB8bg9f2PUqcdYfNjL/EMwfvwbSjXrarjINLNU1Jli4L8FxhZdFjoeO4s32Q
         rC9b6sp6oGDoyEJG48kU2Z6YfidQCpJ7fiVsKxKQiy6g+50hd65LwBpv/2UnZKzxwVpM
         NU7pzb5q0Kb6PDWANMItPZIQdJ5gmD77r2kUIN7nqvEqvOuh4EKAQpxiQiexJHLCbH7Z
         Dwiw==
X-Gm-Message-State: AOJu0YwmlNWxv9zJ2H3A1B5OQ5BhtmuqkXUvqjCEeK0U1yridKHarjDw
	73fmCaEshjV72sC+fZVBTOnjfz2T4EIIG/AsiwFUZRtnBF/1aLsRz2ut/p+6nX+OXGguVN6oNJ8
	p
X-Gm-Gg: ASbGnctZY5YiN+0xaswyhrLLxr9WSB0d1CiMJTp0W1IeKHytPQs1JE10c/auIeNo823
	IYvSifyDEk56c++MKrqV+NjAKmGCX8/ebbG6b6+LuhiiQfS4Hjkw1iIWrOZkLVbnk9RtxB87aT2
	t0YBtXSUfbrmvFhiOe5jpr1aNK9Znr0qunwtQVV3Ez1LynP7CPs5Tkqg7bF8DPSglIbpDkMQTms
	abur5b6EOVgOMgTy35eNTkXS3W7p4/A53Xz1fFcr5EMu7flEHJ5qKNMBAlRQXI9YV/38nJKTSHw
	zfU9ZDJlANnHeHlBxQ==
X-Google-Smtp-Source: AGHT+IHrGJEiw9B2OeTPgsoaGVNeLpaY8bmBuLeh445BA1iOvqt+5RDJKbsaO1yecaPjWV8ardMigg==
X-Received: by 2002:a05:6a20:7f98:b0:1ee:8435:6b6d with SMTP id adf61e73a8af0-1f10acd9a4emr12356648637.5.1740678022423;
        Thu, 27 Feb 2025 09:40:22 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/15] tzcode: Update SRC_URI
Date: Thu, 27 Feb 2025 09:39:49 -0800
Message-ID: <b663540d143b0e5fcb9ceeec45cde7fe3e68f9bb.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212036

From: Guocai He <guocai.he.cn@windriver.com>

Update SRC_URI for tzcode.
Update the http to https in SRC_URI to fix the do_fetch issue.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-extended/timezone/timezone.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index adf095280f..8935d1cd8c 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -1,20 +1,20 @@
 SUMMARY = "Timezone data"
 DESCRIPTION = "The Time Zone Database contains code and data that represent \
 the history of local time for many representative locations around the globe."
-HOMEPAGE = "http://www.iana.org/time-zones"
+HOMEPAGE = "https://www.iana.org/time-zones"
 SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 PV = "2024b"
 
-SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
-           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
+SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
+           https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
            "
 
 S = "${WORKDIR}/tz"
 
-UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
+UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
 SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
 SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
-- 
2.43.0


