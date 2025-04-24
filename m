Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF6FC369D7
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 11:10:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.12423.1745493023286507671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 04:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SC6qdAje;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf848528aso6123845e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 04:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745493021; x=1746097821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxUwNeRRnxdmW6ZSA8EID0+bHFWko7I58vyAO59ps44=;
        b=SC6qdAje7QzdIjbTLpilPLXcM23o4H4sK0NJFeoGKinvT9JyIqkAixq23SzZD4M/CE
         Jxh+jOE+3UTKsJlfQPV8jpEN9TOLZKJPIEu+C+b7LC6gnx6AT6yiuPDAVfEheM6xDvvG
         hNB8soe0DlvIPpK8GwleoBSZQm/EBew0prN48HExYFOPSmEFnG2TfXIlpwMZD+bJz2zF
         Ig88wJy7vnRfNupj4CrnNypz6YFjwjmDIENjaVoYMc1IBxfZEvtmPgB81mSgWulupjzt
         Z8r8imZXzcCU1sf77WyelKzNjVTS26fcwkWquTPJFE9tO+zQYYW2g7zHfKJSnNhnXgJs
         MpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493021; x=1746097821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxUwNeRRnxdmW6ZSA8EID0+bHFWko7I58vyAO59ps44=;
        b=hMk9y+IzCURECBeFYfm1iCvrVfBsJJi3eoP9yFALkBlVVeXBOcEsUGHViIL8lXsmsD
         10Ni+bV+ltxSalweVzx40Mv0tVwMB1MJXLGI5qHe0lWDksy5LvSp4IPiin3wTqfTDwj6
         dEYfbdE2twDUKUHmpHKxhT530Cpuu4ceiu2+lhhBFKfTcWfQpdvMZSOVKtX+rDDSB6vD
         Qa1qCnHxzuc/310tQgedz8zNKM+HcFGTF2kooOONSjsUKS+4R4ruoyH19HP2BJrFET5J
         6E+Cosf0Lyo9jHwAeDuJTuZEct/px4rzJypRKSIQEFM6juC5Q/EAduU9hbE04vJWaLJ+
         Su/g==
X-Gm-Message-State: AOJu0YwsaVqpWzNAn4lx+FeSH2fDuGhHzsg7OeZEDoLGwUYwV/4tmJbB
	b4QHVROONngPgVZ8wlnfMzHKhE4biCb6cWZ86v1XPKrj97BEu07n0WKuyQ==
X-Gm-Gg: ASbGnctSElMF5QzZ1VXn16zyDOvChWz/WOa7/30GZ+FUsDFJyouVKGc9swWB99AM+mA
	XPsI3l7b7CA6sbpHNjuWCe7orKsmfwJDeUZov8rY97DnTE6PPgvRY1Fed5r+0MpSfnqF5nvKEXt
	KKxsyYmYyIfnTr8vKi/RESzzmq+0ufPL55g3Jr4rGcGxTGnMbQKlz4dyqXmn6Trqkbd8+spB0+y
	zXi1zgyoe0UutmMlz3YLgDqQpAQX899GYvUGQJfyWOzduIyqTp+iPtPhy+Uz0JLSH++u/z5/+uy
	TgXdK8jGLe3gAxbpR3nupkLT11F/jp4c7D/h0Xg/BP/LP6GjeXQVh9uTZwQ0SyXFbdvXeohtgoB
	S9Q==
X-Google-Smtp-Source: AGHT+IE4/Vv1CI2rBZhcSppSzKhBwFKNn3QdqoAIIlJ0kryfF1P05DvXUGQBbNEM/1rsH0PhLdIuiQ==
X-Received: by 2002:a05:6000:4022:b0:39c:1f11:bb2 with SMTP id ffacd0b85a97d-3a06cf5ee5amr1638721f8f.22.1745493021454;
        Thu, 24 Apr 2025 04:10:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d5323b4sm1753499f8f.66.2025.04.24.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:10:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] libarchive: correct upstream version check
Date: Thu, 24 Apr 2025 13:10:13 +0200
Message-Id: <20250424111014.905507-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424111014.905507-1-alex.kanavin@gmail.com>
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 11:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215362

From: Alexander Kanavin <alex@linutronix.de>

File index works now:
http://libarchive.org/downloads/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/libarchive/libarchive_3.7.9.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 9d134f7d381..d70cdb3d835 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -31,8 +31,6 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-UPSTREAM_CHECK_URI = "http://libarchive.org/"
-
 SRC_URI[sha256sum] = "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b5cf6af66fd009f"
 
 inherit autotools update-alternatives pkgconfig
-- 
2.39.5


