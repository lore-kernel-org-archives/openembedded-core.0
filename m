Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0D260F40
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:21 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id gv17so3109004pjb.1
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=A9hZZCcamefbogS6JasOKgdVkqTngdw8sY5VDMQe9og=;
	b=XXMR2qFQGtGus2hG4FDjVFwj3BBM1/7A0L5MB1JvLRW9VdqlSaWihKqKOqgul8fS0p
	pLy/KDQF0HJj42Foos+Sep/14CdNuHG0hgKr2OPX/NdTK2jxI+nMHmp1ujOE9EBnL9rb
	kEab4tInNed+/hvgzA5ALDUhf4UUGaCPQX87Ohnsy1CoBBblkF8iZhe424ovfwOhl3yo
	49JNsH7iXwjNvpObT+/b9BLVGo7PcNrVEcY5QP05ChS9PSxqjsqB1YWS1c/h4rx4yo3c
	g7fyHNxQZOYDTesyGrOx94XgttwN59m7TB4GcGaZCAp8bQG5Uja5WbOwK4io94ePMlhQ
	G+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A9hZZCcamefbogS6JasOKgdVkqTngdw8sY5VDMQe9og=;
	b=DIng8TYO59Wo7WsNgm53SgIzO2v24gPmrr4c7C/6WKEVZIyjHxnlNAQ4HvFPpH3iAb
	nXVvrslKmpN7FomlAwWS90OPQx0JfrPn6ePGLfYVOGpXn6H9Q11uwNQYjfJhfHpOeT8S
	rsX4scXyituJXZhpR/cKt63UnxmWwI+6fA6LtIg5uT16U6lLQs9x8clk0R5+sf3cYbgM
	AIJiOl6cxLOlBCrE/IVzJGc5ZnpHA3RcDG1KwfkxhRRPJ0NhiK/oZ+L7ZwaImw/uK2O1
	ogN57N5DkmGjoaPXAtQAne3v4hQ4+kxuXjp5oIuFVentzLyrsGFbAFHuKPprXJ2WOgjc
	6ujQ==
X-Gm-Message-State: APjAAAXUimu8h2vWZq+tu858QFskL1ZYmDxZeKoVDvmyg0hCVnB/LKAo
	ebHY7yMRo9b3GzuVNZDd6NaoQLwb
X-Google-Smtp-Source: APXvYqzZTpN9qVdaDjjLH5SfsRr+jNsCj5l4HP8VNU/a60fCF9gq1XbDePsiJSfMIUfcP9pfvrBrVg==
X-Received: by 2002:a17:902:6944:: with SMTP id
	k4mr8891047plt.214.1581264622113; 
	Sun, 09 Feb 2020 08:10:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.21
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:51 -0800
Message-Id: <1384b8121dc8bbf58454a0952744119b896f2fc1.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 23/29] iputils: Fix build determinism
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Feb 2020 16:10:21 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The suid/setcap code depends on whether setcap is on the host system or not
with suid as a fallback. Disable this functionality to be deterministic.

(From OE-Core rev: 8b00ec484fb851c301f13145e17707c0167feab1)

(From OE-Core rev: 3997c47dea49d583fd48cb03f83c007f61d2cb35)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/iputils/iputils_s20190709.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index 3f9e9917f0..42260f531e 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -32,7 +32,8 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson update-alternatives
 
-EXTRA_OEMESON += "--prefix=${root_prefix}/"
+# Have to disable setcap/suid as its not deterministic
+EXTRA_OEMESON += "--prefix=${root_prefix}/ -DNO_SETCAP_OR_SUID=true"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.17.1


