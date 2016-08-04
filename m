Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id CB79F60132
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 22:06:32 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id f93so16031480lfi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 15:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=g9W0SIZJ6nWsLgoB0WsluQWdoYdmqu6tZcnKinVMtTE=;
	b=sR3spz/1FDWmBNBjPC0qEX59Wzmr9S7MOugvlokRzwwV4oB2tNAOkJW7P1j3fFe5sc
	Z2crJHZcrQbxY1Mlmw2N669rMroYcsq9fFbbhlGs354BzSeLeuQ+M4VugvArF0se01gb
	a/uikQOOqaoHvFHbLjhHsPbt1NgfraXu+G/kpRrt67OQb90HnN3pNbYBjLXj47mrZe5h
	M3EIBgbO2dOoFjJjRHGTJ6qthmvgMgbNp8BYYshJPLN1Xdu2FOj0VZn6hd40AuAOH+tn
	X4W/h6m+A0jY/o5/hH3zqYS2n5ZOmmP1pr6drklwZT+Pv/kWVa4cDeJT+IGCuZiiJcD2
	1c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=g9W0SIZJ6nWsLgoB0WsluQWdoYdmqu6tZcnKinVMtTE=;
	b=LHJvY/bXCHMloVD0PGFnRs6jJEZhtO+KyzsNwpZWKUP55pecKmo1yBR59fGWhwR9PE
	+cS08ORGkpLKAdUSA+FOQuCXFti42ds38z8RYKCHOTce99iEPfyzhquLDxKp809Trc52
	371x1JWdD9TUTtM47rpvyozK6oLW4h1rYczRRNUz1KdsGDMcG3ftBYn9Iu0K3/xNRcxe
	2kFj4lghhqWr5SDkmss7UVUD3IT0gd/rPxJceRc8fMXdjAUcolvk7eoaVdX6/stH/BH7
	nfPb/RJKgk/b8Cy+L8QbZTwOmSV/6fCh3VKVFcI1w3xEuEBGNY5H9Ha1H2XscZWm7oZQ
	VJsw==
X-Gm-Message-State: AEkoouuTrO+7FIGx7GpPKYZUK4EJNVPuywt+T0buovMEdRlO9oj02we2QYLdfMyi5s1VMQ==
X-Received: by 10.25.160.139 with SMTP id j133mr20588660lfe.227.1470348392010; 
	Thu, 04 Aug 2016 15:06:32 -0700 (PDT)
Received: from skeletor.greyskull (89-253-118-72.customers.ownit.se.
	[89.253.118.72]) by smtp.gmail.com with ESMTPSA id
	n128sm2733226lfb.45.2016.08.04.15.06.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Aug 2016 15:06:31 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 00:04:26 +0200
Message-Id: <1470348266-32210-1-git-send-email-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] terminal: Add sleep in pid-monitor loop
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
X-List-Received-Date: Thu, 04 Aug 2016 22:06:34 -0000

Monitoring the process started by gnome-terminal was
spinning in a busy-loop. Insert some sleeping so that
we don't eat all the cpu.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/lib/oe/terminal.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 6d6a29f..3901ad3 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -76,9 +76,11 @@ class Gnome(XTerminal):
         finally:
             os.unlink(pidfile)
 
+        import time
         while True:
             try:
                 os.kill(pid, 0)
+                time.sleep(0.1)
             except OSError:
                return
 
-- 
2.7.4


