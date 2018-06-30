Return-Path: <freebendy@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 01A89745D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 09:53:55 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 31-v6so5633413plc.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 02:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=SoZi9s6/ZZJbVuByyZ+wlhHPLh9WulEHjMldwJ7iA6g=;
	b=bSSZzo7JL7ewjHqNSZ5aTsJIczmI3z/hRzcMSOtJR0aTTBFrLOvuHwlLo21S0d54xd
	Iijqtc51zh76Ri/sq9HxxMIC1v43xLywUJLW0CR5qtK95W5ah5qVTsI5PR+cFduy0AIR
	gbUnEjSsYkawNChaTrUP/pfzR3VXRdU9UIMo3vqiSQmVwSfTsZ1C0s5RH0Hlq2++kfSz
	3YfCCrqfcTR+4xUcv9KciXQSohSg1SSE5bdMyCx/R/ENmMpS6DS/yGRXlR3MmtMDm2bn
	hI0f5Y++5LyMM/jBiFAdRlj9Fb1cfj577lj1dWihKXbbj8KcOIfZISgLWvj/DlB/PUdW
	b/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SoZi9s6/ZZJbVuByyZ+wlhHPLh9WulEHjMldwJ7iA6g=;
	b=eBp9Fpi1wJvcReaayJkwLRvb/fQyHV+VQXtqYxNKA9bVzd0y/LyCMPZ5y92iUHJX+A
	XaqRuvC1p+vrNq4m650XAB6mLIsGRwJcax8cM7GaOc5WoW4pQNgbOR7fSjqV5i4REBoE
	cgcMjAMO0+KH/vNWXw90LIhS9SX8dn5YHtrHemnSPYT3QPVxJaHBfKa5QzXuX1eXa2k/
	j3F3dmfjfPlDOlcARNaEu45YgPkmBafecl4AO3UZLrYMSctbsbCcyaBZRxlFJFxctq7q
	S+uw3DVNSi5p/IEYNtjbTAQD/OcIG51nDvYz14R3JMUz7SqUl9oZX0/GZAlHp+s/ZvOO
	EvRg==
X-Gm-Message-State: APt69E3SZzIyMw+KvcoGxsQdfBpFwBw1zrPYOOrelK9OtLah2ClrQoPQ
	0lFBao5lRfKqoya0I0YRD+Cd
X-Google-Smtp-Source: ADUXVKLoLRZ0aBsXTUji8HAErYhu2eipRAoQvU3zsoezxw77F0IlQ7VtwFSy6rnEOSmww8vFbwkGgg==
X-Received: by 2002:a17:902:89:: with SMTP id
	a9-v6mr17880867pla.326.1530352436989; 
	Sat, 30 Jun 2018 02:53:56 -0700 (PDT)
Received: from ben.localdomain ([116.7.218.75])
	by smtp.gmail.com with ESMTPSA id
	a27-v6sm19528978pfc.18.2018.06.30.02.53.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jun 2018 02:53:56 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jun 2018 17:53:34 +0800
Message-Id: <1530352414-13342-1-git-send-email-freebendy@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oe.types.boolean: treat None as False
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
X-List-Received-Date: Sat, 30 Jun 2018 09:53:56 -0000

It is better to return False for None. E.g. checking an undefined
variable returned d.getVar().

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta/lib/oe/types.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index f778c1d..f401713 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -103,8 +103,11 @@ def boolean(value):
     """OpenEmbedded 'boolean' type
 
     Valid values for true: 'yes', 'y', 'true', 't', '1'
-    Valid values for false: 'no', 'n', 'false', 'f', '0'
+    Valid values for false: 'no', 'n', 'false', 'f', '0', None
     """
+    if value is None:
+        return False
+
     if isinstance(value, bool):
         return value
 
-- 
2.7.4


