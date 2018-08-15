Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0E90C78D29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 14:33:24 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id f12-v6so1303304wrv.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7FVI++SOR3hMBNSNQVjlEfAH96fPtILusQ8xRQAzPco=;
	b=J935ATVeBk+SMFs0J8Sp5KCUDiLoKIh5l5LpUfQag1l3KsmE35Qsf1yv+BlcVjbXD3
	/K2wP77vuhMBKLAShwvUgvJEiNrn93UtbWkPab2nUnIrIYnbXy+cPVh9AF+6EfSKNw1k
	PS3kUZxbqExoHbjPR43JIjGUmzkLu5/WSwoss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7FVI++SOR3hMBNSNQVjlEfAH96fPtILusQ8xRQAzPco=;
	b=ctH/ZSMyoN9V8ZhdiJozKpHxNem7152likd/rF+ixEEHAH5h76te3OI0mgII20Mqy6
	0NUNwoz+UfQoBzjHwbUVzAyp/QyjrY64E2PN8rlU9vdaNgQPeRtIS2yG/w6dxpw10NYd
	A4PIaCPy5TuERUbniB+7W6QmMNeBVX6VB5LN/RKlusFCkfY0zAG/MtVlheSW2I/GjHrn
	JHFfa9Ia/GazoQoMx2IHzovqm/azjWbrr/Q7vz0qIy8l6RXNDhIFbvnZSTagQmRUEIyv
	6caiDQIMmnZMbFQ3FaXP3hPsdn3S3NmzJELGjq85+IPfrZ3lcEQUSuQNgn9kThu3qgJU
	M6fQ==
X-Gm-Message-State: AOUpUlGBbdeBNtH2HTKLalr/z066AGRNnjmbQuZZLvxeRc5NvwdjKbJU
	lIZ19Eeub6rM3xVo9vXck/tQvi6+x/U=
X-Google-Smtp-Source: AA+uWPzwRqUIvfMq84Ta2mrP+kfrCXMqL4ewTD5Afj6B8VbrWDM9OTcn43NNGVaHphWeP7/oBdobFQ==
X-Received: by 2002:adf:808f:: with SMTP id
	15-v6mr16320695wrl.204.1534343605585; 
	Wed, 15 Aug 2018 07:33:25 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y18-v6sm22403535wrh.85.2018.08.15.07.33.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 07:33:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 15:33:21 +0100
Message-Id: <20180815143321.21443-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180815143321.21443-1-richard.purdie@linuxfoundation.org>
References: <20180815143321.21443-1-richard.purdie@linuxfoundation.org>
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
Subject: [PATCH 2/2] sstate: Optimise SSTATE_EXCLUDEDEPS_SYSROOT handling
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
X-List-Received-Date: Wed, 15 Aug 2018 14:33:25 -0000

Using re.compile() is around six times faster than recompiling the regexp
each time so maintain a cache.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6f2fa583f29..c0e54a398d6 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -980,9 +980,16 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
             # them in.
             # See also http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html
             not_needed = False
-            for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or "").split():
-                if re.match(excl.split('->', 1)[0], taskdependees[dep][0]):
-                    if re.match(excl.split('->', 1)[1], taskdependees[task][0]):
+            excludedeps = d.getVar('_SSTATE_EXCLUDEDEPS_SYSROOT')
+            if excludedeps is None:
+                # Cache the regular expressions for speed
+                excludedeps = []
+                for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or "").split():
+                    excludedeps.append((re.compile(excl.split('->', 1)[0]), re.compile(excl.split('->', 1)[1])))
+                d.setVar('_SSTATE_EXCLUDEDEPS_SYSROOT', excludedeps)
+            for excl in excludedeps:
+                if excl[0].match(taskdependees[dep][0]):
+                    if excl[1].match(taskdependees[task][0]):
                         not_needed = True
                         break
             if not_needed:
-- 
2.17.1


