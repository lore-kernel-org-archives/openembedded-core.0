Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 006D86107D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 17:28:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k11so19282405wrd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 09:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8Yxdc/3C3J+WtKIj8OMktfa4yx01avXHjRJx++gndHM=;
	b=p2nFz73Msy/2f6VWlAuRt4I7P+6XQVwnPYYGHkEhQZJ6Wsk4jHBK8XFyTW3l64mmld
	foYztSoYNbbCK5ckKnHnHz32qAxrNMD18g9jwd/qaZ6c3/9WlQmmpWgrP2au5Ne3Tz8O
	E3VT6lE4vTg723XE7H1Rpbkjo/PIFp9SQtQV4g3TAiN/CFO0xp2rnZDIfCtJi67qxwfO
	a5vuU8rvy2519rwasLL0n61S+UI/TSahTqk1rdYQ/YB2TbFFi2vuDx5QMTBhqDkXMnbw
	zHJnWdw31bK60Yx35rrLIqLRBylzcTE8m1TpUh4WrTIWUyrSEHqthJ+EQIuanhvqtc/l
	wK2A==
X-Gm-Message-State: APjAAAUq9xOjFgeP/GNyhkx55Rgo76tl2b4C9TpVCXns2ZQYTNX0vMlh
	Gx7+3WF5iyyhHW5mpMLt7lZZHN8F
X-Google-Smtp-Source: APXvYqwXbMqCg2Cxjgx+vVvU8gxeygYLbBBGesqvGPSWsQiyBQKuUkogfHd+zyOXR6fXLwL0aJnWJg==
X-Received: by 2002:adf:90ee:: with SMTP id
	i101mr16445997wri.417.1580750895460; 
	Mon, 03 Feb 2020 09:28:15 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f8sm10253657wru.12.2020.02.03.09.28.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 09:28:14 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 17:28:13 +0000
Message-Id: <20200203172813.12800-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200203172813.12800-1-git@andred.net>
References: <20200203172813.12800-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/2] rt-tests: modernise subprocess: preexec_fn=os.setsid -> start_new_session=True
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
X-List-Received-Date: Mon, 03 Feb 2020 17:28:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

start_new_session was added to python3 subprocess in v3.2 and
is meant to take the place of the common use of preexec_fn to
call os.setsid() in the child - as done here.

Update to use the new equivalent.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-rt/rt-tests/files/rt_bmark.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 57b39b52a1..3b84447a0f 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -166,12 +166,12 @@ def start_stress(*args):
         log("  Command: '", stress_cmd_str, "'")
         log()
 
-        # preexec_fn=os.setsid causes stress to be executed in a separate
+        # start_new_session causes stress to be executed in a separate
         # session, => it gets a new process group (incl. children). It
         # can then be terminated using os.killpg in end_stress without
         # terminating this script.
 
-        p = subprocess.Popen(stress_cmd, preexec_fn=os.setsid)
+        p = subprocess.Popen(stress_cmd, start_new_session=True)
 
         return p
 
-- 
2.23.0.rc1


