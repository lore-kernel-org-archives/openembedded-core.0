Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE077FC1B
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 21:37:31 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id i6so14776062pfc.1
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 13:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wYOndmW8PwdcJ3PKUOcEGaBSTPs+5MNBSP4Ch0YXVCI=;
	b=sTqBK8+bte9Z7fssqE6r54QNsnRwRPUpw3gARHqgSCEXYZA2IbvXcYMiaRFfiILh47
	w8HlheICoViioaTBYEYWzYe/VuTlRyy+Tc/J4UOupK525BxYcQ2F0Iw91uu9KXMTOZJv
	nwSRauXDPeLjLVKnnohhSVSeDU2Ic7L9iziclZROY1LQTmyUpQ2Zw5JDXbAb9mSSCVxl
	LZjYmPyBVka3Ucx4cNoZ2BefjWazoo46wclz2EXhJJnJfcVuhOOPDDxpk+266v6xQxUQ
	hQwZF+6t6GjFftEg5MUYXARpXpxBWVu7IYqgtTN6v8VJ23MfjrqYEn6Vd5R9XYeOgROc
	6L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wYOndmW8PwdcJ3PKUOcEGaBSTPs+5MNBSP4Ch0YXVCI=;
	b=K+fGl5dgmvk6V6/AzTgapbxGdaJSyZwfzJMQl0+5yZzSoh7onXtPOPExt4C+lJY8PE
	F0iKk+9y6kjYRCMa3cfsA8br1wptLt/NYiyQ6fCS+QYrGpdDY3kj3VSIPtdcCHrpTIOH
	fR+S3zbjvHggF1k90ySVI61dXAw0HBvDXdIFl8MlG+oEOEhbfebXDirZJq0kExGfNEij
	nGMiLK8+X2o0zWcyu+438at2hdzNJVhPzlBtrW9seTU27rCziyA5QeWt3R48tPg1gk2j
	JQXygdmX9D92BJPj6/6Z1FToLNCTnjd8QogCvL28QBrclciidK+/s4u1KI5fhF7QKRWo
	Pv2w==
X-Gm-Message-State: APjAAAVcw//d4HAW8Jn5Vax9rswWQesbjU32m6pfj3KdGboU6Ry2xdJg
	ay53Ixj0TCSVHR2iizhoZM4H42gp
X-Google-Smtp-Source: APXvYqw4sYv48NjfNjh59uPsyhOmWgPBe7wda4rCC+JNqkVLh5KUezyZDb10RMbrYndOrU7ZmmIJtw==
X-Received: by 2002:a62:1d4b:: with SMTP id d72mr14664129pfd.130.1579469852238;
	Sun, 19 Jan 2020 13:37:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	q15sm34912518pgi.55.2020.01.19.13.37.31
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 13:37:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 19 Jan 2020 13:37:24 -0800
Message-Id: <2bba0052597020ea887c84419440df11f9859283.1579469619.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579469619.git.akuster808@gmail.com>
References: <cover.1579469619.git.akuster808@gmail.com>
Subject: [zeus 6/6] sstatesig: Improve debug output if getpwuid() fails
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
X-List-Received-Date: Sun, 19 Jan 2020 21:37:31 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If getpwduid fails, we don't see which file it failed on which is key information
to aid debugging. Print this information when exceptions are raised.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9d7a5219713af8117eda145052c6d9abdf577d8f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/sstatesig.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 24a221eb1a..b2316b12b8 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -521,8 +521,12 @@ def OEOuthashBasic(path, sigfile, task, d):
                     add_perm(stat.S_IXOTH, 'x')
 
                 if include_owners:
-                    update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
-                    update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
+                    try:
+                        update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
+                        update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
+                    except KeyError:
+                        bb.warn("KeyError in %s" % path)
+                        raise
 
                 update_hash(" ")
                 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
-- 
2.17.1


