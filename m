Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 82F097E993
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:44 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id f19so281879plr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DV3wxV7U8GnVd9aHr7mE3uyL2SY8eDkb5vMJu0tnB9A=;
	b=TCzbjh4ptAtAzTxUAD3QWFWRXY0jQXT+nVUUzBCnTe+c/EOvv4SXbAeDjAx5xF8Eqn
	5tBhpVnduY2F4S+ww976G3aE4DqEWCeF2PItrIdQHhP0uetSvphzJE2BDeDBTPjGbYBH
	3SxaC9/hICfw5SbmX52849IoJawx5Pa4wTDUuIrJZDhgDnj49O67PcgPez/4YWjrbDV4
	8xiFcnZvmkoZgMK3OLo2BD0STObqEanXKlxdJvEjnN1YdN0cMg3J9tmw2oX4JY9T4nAY
	e7o04hybc7YTRvoIq3gYyk5XgqB+ruHR2RP60w7kzWyQRHFFiBV6KZlSxNxmlCn4+QKk
	2UdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DV3wxV7U8GnVd9aHr7mE3uyL2SY8eDkb5vMJu0tnB9A=;
	b=R53noaLS6G7q/l4Y06l+STzxNFUM1ptG5nKRflZkNHgtXxKRl1H7Klms4FuY6cwP6U
	e88SJmomHNogTXrn5n6RN7zjPtiOwdrZJESqRZVT2etoWMZpbLWBnWs/9/z1x7KqNWNx
	l4EFKEffWIJW0fCYwFl5Enp5sEPSnle8uZRiWx1JpHgFuDCxypOLMdeOFwRgdvc9cnYQ
	E1LCMJQyypkOuxaBZ7FfaR8Hvc/pTFqbulmYD1YFbxuSR+YUW3lfr4jQvHxeTdAWStCB
	LIpsoe4hLVljBLVhLuQCNt+ymMrTX475YPsfl5FYo4CZ8qvD0AjZ7mRfRv2/aVMJphx0
	viHw==
X-Gm-Message-State: APjAAAXFPSDWKEyHqzhgVqRTgS+9DMfU3FFBK7y7L/kXFcR28h3y8u8A
	/5iG9uSRL6hSm5kp0MieU+lpgzQFCko=
X-Google-Smtp-Source: APXvYqyBsrgWgLP9f2t9vZI/AzJIWqNDO75AiPXJf3tovYdM1hS7CS9qwqvpO39t8EIqKe+y7rQB0w==
X-Received: by 2002:a17:902:5a89:: with SMTP id
	r9mr476066pli.206.1569293385569; 
	Mon, 23 Sep 2019 19:49:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:48:52 -0700
Message-Id: <184672b59e4c20ec34da0974fa59a045f9d478c1.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 12/50] package: Improve determinism
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:44 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Its possible in cases with multiple shlib providers we were not being
deterministic. Add in a couple of sorted() calls to fix the shlibs and
pkgconfig cases with this potential issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 meta/lib/oe/package.py       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index eef1f7b..2c44fc1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1918,7 +1918,7 @@ python package_do_pkgconfig () {
     for dir in reversed(shlibs_dirs):
         if not os.path.exists(dir):
             continue
-        for file in os.listdir(dir):
+        for file in sorted(os.listdir(dir)):
             m = re.match(r'^(.*)\.pclist$', file)
             if m:
                 pkg = m.group(1)
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index b595132..b8585d4 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -265,7 +265,7 @@ def read_shlib_providers(d):
         bb.debug(2, "Reading shlib providers in %s" % (dir))
         if not os.path.exists(dir):
             continue
-        for file in os.listdir(dir):
+        for file in sorted(os.listdir(dir)):
             m = list_re.match(file)
             if m:
                 dep_pkg = m.group(1)
-- 
2.7.4


