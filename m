Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 51F2F74B03
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 04:35:45 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id c41-v6so3817759plj.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 21:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ddO/tXr3LNbkuqO0SKy4fn631mlsA8+ON362crjzdJk=;
	b=V3mChshP7uFrxqSaDDkE5xePwbc20T2MbnlbYfCZrrnPhTGcBmkb6lh+jlgzAqSEBf
	8DAkRHXBLhMn7g7R3s/Su8d/HZw6AQ7DIF8szZ+URFTYpjgpLCqHU3rrlqVMRG8adgTK
	QEZOQzsUBoWFuRYNSGYqmIylAI9xnqLv9zgQhJZWzqmtOWUWfhdo/475P7LwoSPlLRrG
	QKL7It99k4FwtYKbdh1PSkPfQ+w5bAgNt2tdC0z1rVsMZAHpmavBPifaEjO3VM6jiod5
	7X5pUseQYRywcJtqOUzBdyAsTd6Q1sI38UGR6+YV9HjiqWcFil8+faI54qwNrzJewC2t
	P05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ddO/tXr3LNbkuqO0SKy4fn631mlsA8+ON362crjzdJk=;
	b=jOBsQb1cpfgKvGaPxY9mw32OV/AqPC+tIE0h6lt7rLJszhDrqhCA5/xTv2naRyVPKk
	N0is3v9Yw6SqDpR5uycHI8zMl7+zFg0VNNdQ8upxE/GL3Vb61SAB+g+sb9alFMAnK5ut
	myujw2b+r1+lRqMvoBcV8qeHcC8lSWkggeVbbnnhB7dP9e+pcBGjEhJ/id0QjcEBfeI/
	nGdNTY6WBLlMr4zkIs+6UpXWe3xSItO2axAOnHR8NyemLX9rpEpTEO+hiypXrYkSTK2e
	NdBZUGBYQsSHaT2EdqQrSq56jrGjIuqY/FZbib0PzjTdyUcD1NgHB6bZPMphzF5T4lUX
	MlnQ==
X-Gm-Message-State: ALKqPwcHf4+IhGng4yxTFA7vnOGE7WAptAHgSU/FfkvPqn7+Unr9L+2F
	Eq/EaaKXtgarIo3pMTu0x6VTPg==
X-Google-Smtp-Source: AB8JxZrJDiKct1PakfBdkf0iprYNzVrSJ7tvu7JQPA+fhKyYQdMvfA2vJsbowBbldssgZdEnlUoA4w==
X-Received: by 2002:a17:902:bd84:: with SMTP id
	q4-v6mr8097109pls.254.1526618146147; 
	Thu, 17 May 2018 21:35:46 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q64-v6sm10235801pfg.180.2018.05.17.21.35.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 21:35:45 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 21:35:35 -0700
Message-Id: <1526618135-7513-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526618135-7513-1-git-send-email-armccurdy@gmail.com>
References: <1526618135-7513-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] externalsrc.bbclass: don't configure with --disable-dependency-tracking
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
X-List-Received-Date: Fri, 18 May 2018 04:35:45 -0000

One of the uses of externalsrc is to enable iterative editing and
rebuilding of source files during development. In such situations,
disabling Automake dependency tracking can lead to sources not being
rebuilt even though files they depend on have been modified.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/externalsrc.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index c9f5cf7..ad87d85 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -77,6 +77,9 @@ python () {
             # Dummy value because the default function can't be called with blank SRC_URI
             d.setVar('SRCPV', '999')
 
+        if d.getVar('CONFIGUREOPT_DEPTRACK') == '--disable-dependency-tracking':
+            d.setVar('CONFIGUREOPT_DEPTRACK', '')
+
         tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
 
         for task in tasks:
-- 
1.9.1


