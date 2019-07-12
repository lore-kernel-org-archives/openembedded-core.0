Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 83FB17CE73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 13:12:39 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id p17so9914998wrf.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 06:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3W/zjJ2FOU8dTfR7vFUusbO4+Ra1B9LCUVL9heB3lo4=;
	b=JNDoyHuK6Yw/uHpPNAi3cJdQrBKUWhaNIZeg+gjudJ21fai9eTZkQZ5ZBHnwh/U+oU
	zfN8LyG2Csnd3SIWzW8lsBvXvSkSTfqKFSv8bnoaZme+midlZy1Qtdtufy9ru6f7JF+F
	KwYqw303TWfzBbyO7HgoFWoCFTUWHXsn2SQd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3W/zjJ2FOU8dTfR7vFUusbO4+Ra1B9LCUVL9heB3lo4=;
	b=uMI6w5o+0ltXHs8ewxg4ZQXC3Ig+ZRmHw5edVLGbViCHaLHwukX3jPzteWVoKliCFf
	y5MFjzSvP5kyTapxh/nkZOswqroAOjOTBTYDUeSs2uPSZP9rWWmCvJVXHMUujud9OoGb
	aBLYoWqP/F6YUjxkjAhpzPD7abw8vxcQK4b6Q6L9UEzKIuIDOIh0qKbhPWe/DbomjfZe
	3+244kbrQkl8FvzXBZKVXgYLDLzSel7cFazd/QMpC2jCjcQ9xoawhOER3qMJiWjO9ooo
	OSm/wPvyT2vSKcpSgnftHzyNpRVHnLYNEqhzJ/7pTXb6qgSit5lu5L6DRoW1LPJvdBek
	0L0A==
X-Gm-Message-State: APjAAAW6X2zNBOgm71ferpgt5LMzK8BSxH25rGaKxhngCfcoQ0z2xf/5
	45tjogLIScx6rtc3LSzAkakhxPZ/elY=
X-Google-Smtp-Source: APXvYqzuwXz4/dIX15amJyfcH3E4zxeEA28JaUINhUrBoEWZKTiL3EbUetHrLMjHtoiziHk7/K0Zfg==
X-Received: by 2002:adf:f286:: with SMTP id k6mr1460043wro.320.1562937159652; 
	Fri, 12 Jul 2019 06:12:39 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k124sm12414205wmk.47.2019.07.12.06.12.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 06:12:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 14:12:37 +0100
Message-Id: <20190712131237.29639-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sstate: Add tweak to avoid multiple sstate stats messages
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
X-List-Received-Date: Fri, 12 Jul 2019 13:12:39 -0000
Content-Transfer-Encoding: 8bit

After the recent changes in bitbake to runqueue, we need to recheck sstate validity,
particularly in multiconfig builds where tasks have the same checksum.

Avoid printing summary messages in this case. Also avoid multiple events to toaster
which may not be expecting that at later points in the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 424acfb1557..b604729d84a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -927,6 +927,10 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False, *,
 
             bb.event.fire(bb.event.ProcessFinished(msg), d)
 
+    # Likely checking an individual task hash again for multiconfig sharing of sstate tasks so skip reporting
+    if len(sq_fn) == 1:
+        return ret
+
     inheritlist = d.getVar("INHERIT")
     if "toaster" in inheritlist:
         evdata = {'missed': [], 'found': []};
-- 
2.20.1


