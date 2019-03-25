Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3DFA47D095
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 11:58:36 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id k17so1833226wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 04:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wwbSRTlbJTUKLVk9XxBU7Udc+Q0bdSaCQ+/2VVRodnM=;
	b=Uxt3L6pofFpGFJP4KIEKtdSRLNkNJFnMv+CUfpPbXK0BDgnlc3LmU1goUdiQBc35YU
	/okQ2FYNKQaTke85wV6DGQjxNJe8RnLKk/ETGJBy5p9G7SngQXbikOclM1uSjo3II/Q0
	2o0bAHHSqOHgCjVMAfcf6P8kMjf0u/E3bd7nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wwbSRTlbJTUKLVk9XxBU7Udc+Q0bdSaCQ+/2VVRodnM=;
	b=AyZAzw1HX/t6pHhDpmm/ODdDj3xfq9qrG6R0I5PT/0VE6He9L3psES3jAhtMq4y98N
	0GOUlUPjOXxdApTX+cKbv+eWpl3HQto8S7Z3ouQveSV9PzOyzQM+1TsoS+QqALt6bJRC
	0FZhKrzP6kQunzv5px+y/4MPe8uDAPjVFLYDbbGyg+B6zcwkYXAcB0X8ivZJDviXn/4J
	HzXTRt7vg2wNVmHWrBkQ1oTbd8U06AQ2aPqlr2ziHpG8sDw2IIWqZSm0lWGrKNA6rSgo
	wAiJN1q7CYmmZbyRjcx97VHOkvLYhFuWHc7BPHad/0aMFArG7/YqC1YlhIiXOFaA4pAl
	hAew==
X-Gm-Message-State: APjAAAXGGwijrH8SMy3jfzV8n5KhCAbKMFL9NPfoNAoiUCO3cbpPWGMs
	Q9l0oE4hNIJSgNXrx0jn6+CVWg3xgnjMQQ==
X-Google-Smtp-Source: APXvYqw+VwiXjD2C0glf6Bpf/4wXbpiomNrkR9Mfcve/ocUdZy+9feITBgiJTUoAFH949dkR4w8dBQ==
X-Received: by 2002:adf:de07:: with SMTP id b7mr14483502wrm.196.1553515117560; 
	Mon, 25 Mar 2019 04:58:37 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o10sm12139827wru.54.2019.03.25.04.58.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Mar 2019 04:58:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 11:58:36 +0000
Message-Id: <20190325115836.28534-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/qemurunner: Dont mix binary and non-binary strings
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
X-List-Received-Date: Mon, 25 Mar 2019 11:58:37 -0000
Content-Transfer-Encoding: 8bit

self.msg is a str(), bootlog is b'' so this code clearly doesn't work. Add
in a decode since its being used as a string.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 7ef506b60a2..49020c1e636 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -329,6 +329,7 @@ class QemuRunner:
                 self.logger.debug("Target didn't reach login banner in %d seconds (%s)" %
                                   (self.boottime, time.strftime("%D %H:%M:%S")))
             tail = lambda l: "\n".join(l.splitlines()[-25:])
+            bootlog = boolog.decode("utf-8")
             # in case bootlog is empty, use tail qemu log store at self.msg
             lines = tail(bootlog if bootlog else self.msg)
             self.logger.debug("Last 25 lines of text:\n%s" % lines)
-- 
2.20.1


