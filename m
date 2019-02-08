Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id BB2DE7C5B9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:04:32 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t200so3538007wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ONLmQyLeH7VSRXMSWoOuXwyBqTZPix25+Un9iPjpiL4=;
	b=EIzy18vsU+FbDSpi7b7UsZURiM/jUg1Qo6vZZfMNHB8wKGPDqfe4sO9O96AMqVIkmp
	RwEg50TkkFEFhQgUBPFeMIS9SkeWzwywFDWl8c5uR6qcpKQAYCO6F9w3/wh8xqdyWfJ0
	xFYgIY7DHt74ZKUhWl9JoRb1PpfU1CpZblsAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ONLmQyLeH7VSRXMSWoOuXwyBqTZPix25+Un9iPjpiL4=;
	b=UGYEy2cblCP7D2uWBGQYxFZCbADUAQd3+8Gz89nNZaxQbgNXksP1gtC1qjqOfSsXNm
	Yk4Pb/6yNMEA+inZmHODZ/Krrts9B9nHMRaLwHl1WCRPxcpfxrb/XTKljWaI6JJyc6LI
	FB9jOp2/g9D8cfRITCYvC4P3hmmk4GALgRuUx+tC+2/+ZrRcucpksMtDWwQkNLpxMd+5
	zS4herUmusjcG0lbB/CmrBKeQFm9YYHTlZvZxZUJSiNwt5f6MpxafXVOyZD1UCU7Hzxq
	0Aq8Xj+Bw6peWJ+SC8PUuGQpujum2/10aD5wGBzvCxiowUZaazaVJ+JPFQHGHz5eyUL+
	wdxQ==
X-Gm-Message-State: AHQUAuZPdhFCEDMjA1Y6qVShb8fCXEsPyqRQF0IkCd1RpA6lUOp1YAbB
	nH4nltWT1XpjGwIowYCdJHZorFah6jw=
X-Google-Smtp-Source: AHgI3IaV1HuWjD6yInEt3RtCZ9w9TSvoy+4wkNFJkerx8Ur8B40LnhIGLq2TTVGpEg6nnCK43KqMRQ==
X-Received: by 2002:a7b:cd85:: with SMTP id y5mr11311119wmj.129.1549634672917; 
	Fri, 08 Feb 2019 06:04:32 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y8sm3684493wmg.13.2019.02.08.06.04.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:04:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 14:04:29 +0000
Message-Id: <20190208140430.19985-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] oe-build-perf-report: Allow branch without hostname
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
X-List-Received-Date: Fri, 08 Feb 2019 14:04:33 -0000
Content-Transfer-Encoding: 8bit

Allow the branch to be set without the hostname option. Previously
if hostname wasn't set, branch would be overwritten regardless of
whether it was set or not.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-build-perf-report | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 0bd05f44ef0..c91f74192b3 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -512,10 +512,10 @@ def auto_args(repo, args):
 
         key = split[0]
         val = split[1].strip()
-        if key == 'hostname':
+        if key == 'hostname' and not args.hostname:
             log.debug("Using hostname %s", val)
             args.hostname = val
-        elif key == 'branch':
+        elif key == 'branch' and not args.branch:
             log.debug("Using branch %s", val)
             args.branch = val
 
-- 
2.20.1


