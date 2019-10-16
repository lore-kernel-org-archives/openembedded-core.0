Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1427C556
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 09:18:33 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v17so1911024wml.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=udQL3sgL/36AImWrLnf/BRU+iDXHqWbJoNaINettAC4=;
	b=HA9C6W1iXvPEjwrV6jqKjdXxz9v7gA/L755Eq9SJYvu5MtK7PRtJ+n021yfCjIEdCj
	iXQ425NHYPvekfc/Zicf1W/z634qAhvTiFdk/RKJIdZgeRc0pJ/e1ROjllJi4oCJr2ZM
	rjQYjRHB+q2tDY3zltGeRHqBWk7RQkZW9Qmf3Qh6nzphnxOHyL4vLwQEZmFGO4dc44cj
	xJP+RkM4kq53YCTaez9dTFG/sJvu2DOiti6A/f9w54yHNiEeXhebr7uARcilrKZYzqkh
	cKhxhMTpuv2mIT+0XkytAfgYVQzQGaut2MZpwjx3DO2fKNm8p21zno9rKh7roTQVoqId
	MozA==
X-Gm-Message-State: APjAAAWt5r3ya+1rvZmTZh76fKKRekioYJX7aHZJHJBczN4yuGS/Q7ue
	EazmVCrGF5WwTHp0JEzSfxwwSPUT
X-Google-Smtp-Source: APXvYqzFfrdJndExPF5jLWlGShXt58pdsoMfcUZkwkd95x6t8K/NjjTFn2Z8xahEDm6IUtG9gUUy1w==
X-Received: by 2002:a1c:9d4a:: with SMTP id g71mr2608572wme.26.1571217513800; 
	Wed, 16 Oct 2019 02:18:33 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v8sm31907518wra.79.2019.10.16.02.18.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 02:18:33 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 10:18:21 +0100
Message-Id: <20191016091825.1910-3-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191016091825.1910-1-git@andred.net>
References: <20191016091825.1910-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/6] testimage.bbclass: enable ssh agent forwarding
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
X-List-Received-Date: Wed, 16 Oct 2019 09:18:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some targets might use ssh to do their power- or serial-
control. In that case, ssh might need access to the
ssh agent, or otherwise won't work.

So export it into the environment.

Note that the (old) oeqa/controllers/masterimage.py
tries to do that as well by exporting all of BB_ORIGENV
into the test environment. Here in testimage.bbclass we
are a bit more strict and only pass the ssh related
environment variables.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/testimage.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index befda6b72c..844ed87944 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -268,6 +268,18 @@ def testimage_main(d):
     target_kwargs['serialcontrol_cmd'] = d.getVar("TEST_SERIALCONTROL_CMD") or None
     target_kwargs['serialcontrol_extra_args'] = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS") or ""
 
+    def export_ssh_agent(d):
+        import os
+
+        variables = ['SSH_AGENT_PID', 'SSH_AUTH_SOCK']
+        for v in variables:
+            if v not in os.environ.keys():
+                val = d.getVar(v)
+                if val is not None:
+                    os.environ[v] = val
+
+    export_ssh_agent(d)
+
     # runtime use network for download projects for build
     export_proxies(d)
 
-- 
2.23.0.rc1


