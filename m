Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5A7B6C567
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 16:23:49 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s14so3027048wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 08:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IsStna0V27kj9XaDKwG4Rk8TPmXkjr35Fl4hZAZ3upo=;
	b=Giasl16lwJKjEpN/tH6ZpagbGZrztlOmCsG6PnZ2t67z+dDoavXsLi6dipNEIMQ0Ml
	lVxQ1iAjCXIrmXhMtrmsNrgpy82mRjWkHtzwLrHdBxIs+75B1zpYibSu1zvwXm9+rc42
	dK0JAGk83u0FhSutqoltmMkkmXH7h3Rn2mE9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IsStna0V27kj9XaDKwG4Rk8TPmXkjr35Fl4hZAZ3upo=;
	b=W2QspZ5sbK2rkAZ603267GTfuGuDP15E7lN3agaykGAkSAhsg2Znzgh7+HQ1eCCNvH
	XjKOl1havfh6ngcAZtNj6Je4QEktZRlXYx5CyvrZSRIgoCtVtB9lNMrVxWs9TWSYJOHr
	Xra5775u6pJYOD4MW6VyUXIdEUNiW2lziWuO5e0NqxMlBJfmyiL/aJA7Tev9vNSLLmlH
	hm/Ax3kXEd2F07L0t4VWU0+cAFuaAuDm1eSVv5s1lOnGMjlOaQa5aFqL2Xy76BII2Zb4
	7xnP21FwHTVqu7lziC/XN/Gu/8UdW6raXbEsbm94oaAiiiJJRYPzIPeeZduZkjcETHhO
	BXNA==
X-Gm-Message-State: AA+aEWb++wSDSd5CqfYyncT0QyvUc42zcWkkxz9ah1o1/Xn45/RDmS7k
	s9h4sQZyqXh8V6wyLeG76ClHaaleClE=
X-Google-Smtp-Source: AFSGD/Ws2iNE/mNwWECCD51nodiId4Kbc43lcIDmf0e5IKHE+BEgY2c1nn4WxtgcAQIVChDihK+DYw==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr3477520wmf.97.1543422230028;
	Wed, 28 Nov 2018 08:23:50 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l3sm10033017wru.36.2018.11.28.08.23.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 08:23:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 16:23:45 +0000
Message-Id: <20181128162347.16512-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128162347.16512-1-richard.purdie@linuxfoundation.org>
References: <20181128162347.16512-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/4] oeqa/utils/commands: Avoid log message duplication
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
X-List-Received-Date: Wed, 28 Nov 2018 16:23:49 -0000

Each time a runqemu() fails, the log handler would be left behind meaning
messages from any subsequent run would be duplicated (or worse/more).

This ensures we remove the handler regardless and means we no longer
have the duplication.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index e6a35d3d259..2e6a2289cd9 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -345,11 +345,11 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
         yield qemu
 
     finally:
+        targetlogger.removeHandler(handler)
         try:
             qemu.stop()
         except:
             pass
-    targetlogger.removeHandler(handler)
 
 def updateEnv(env_file):
     """
-- 
2.17.1


