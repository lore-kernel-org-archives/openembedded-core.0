Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1880960CC9
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:16 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 4so2407289pfz.9
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hj77ug5Ue6q1TB85IJAYLPUZZnCmgeFo72FAhPLkBbk=;
	b=fxFtn3CwkeUaR3ffJg+o9yEUYWUMQJSp9YCgeqyvF40ohdUbrhhhILhwmqzz0CkB7C
	VUMUaRM7KkV0Lu6FhBoKyPEne+KLMdpPpJWHYiRFtewS/72kPYAYvyJfTgbFLOH8TZL0
	rDhxNE8/LIw2JVlKY7awu6ltqXBfm699W1gPe/nOKsgudZ8bxJMI7ZFNJQKNl4TB2Wpp
	jcn84jP9Ll/Ib+X0srwTvIvj5pysc0TCXNFC/Frxf0xJ13w9PSN/oWgvKj+doF09E++e
	PJ8mXbdQxnXNr/2PVSMkjNgXV7c1Cj/ROUvxDQZK49egQnwkiqAbTbZll2mhVaOMR2G6
	CXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hj77ug5Ue6q1TB85IJAYLPUZZnCmgeFo72FAhPLkBbk=;
	b=jE+wzIB72EVMknho3ztrfFkCK50g3L2Qm8dMCHiX60Oomh2d5ku+ot4tFFGE0fIExa
	XlZZABqtuYP3RfJ+vux3VeXgZkESMBy1RS/aPga8ivq0rWKHyTG+5khUEU2oshdInceK
	UO+gYsNlgbdQb4TYGpFdpI4PMfS9ryVgVJq7NCoFUXaKQAMOdAwJhwud3L+gBvMTfkDL
	ytDvXp9Emn1cfbeDGpXXYZAV1sGguPTANOTwcrYL72uxAQLqW/FGmeNLlmH/vQqzaRZR
	RY/tzu6S3gShg8mpNcAdCaBtVHft/qvT42G678gP8HAbMViZO2hAn6KxEy3XmQO3AHB1
	RNYA==
X-Gm-Message-State: APjAAAW6oZ0Ju0E3/s99vpLJcZ2Pk/e1vyHYQQ1em3p/jVzdpYYdfWbM
	zDqu/o+6Uu9x261wad82bajKyRbs
X-Google-Smtp-Source: APXvYqxQEglqxQEG/jyyVX+Ujf/wRwf0OEc2dXLrWPFy2FhTgy2sC2KX39pBAqAo5fXxSXI/pBF9Rg==
X-Received: by 2002:a63:3689:: with SMTP id d131mr9794355pga.250.1581264616434;
	Sun, 09 Feb 2020 08:10:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.15
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:44 -0800
Message-Id: <8cd9176a541f682393e76a8792269e9457a82e29.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 16/29] tar: Fix build determinism, disable rsh
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:16 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

rsh is insecure and obsolete but tar will enable support if the binary is
on the host system. Some systems point it at ssh. Lets explictly disable it
for now unless someone actually needs/uses this at which point it could
become a packageconfig.

(From OE-Core rev: d14a4b0db92a9a7d1ff72a2e0faca7f1a23a0b68)

(From OE-Core rev: 6bdc5f787af46e9c849947cad06ad40aa401b767)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tar/tar_1.32.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index 18f09b5711..ebe6cb0dbd 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -22,6 +22,8 @@ PACKAGECONFIG[acl] = "--with-posix-acls,--without-posix-acls,acl"
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
+CACHED_CONFIGUREVARS += "tar_cv_path_RSH=no"
+
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since tar has a lot of m4 files, otherwise there might
 # be an "Argument list too long" error when it is built in a long/deep
-- 
2.17.1


