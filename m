Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6F7FF7FF78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so2548899wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HqFe8sD1ZIF5M3fQR/f+hGQ19XYpvWbxfXiu39FxGUo=;
	b=uRHqeux+JgvaVZNN5QhXOVBEK3mzRCUeK56FNWGfMcCR90lVXmmrZ/IBPZN5vWo/LA
	ekMGcOH3eNnWLtZIkPeQ41fzoCsigd1o0HbRinjrfnrv6UR7bd77UyQAfRFw7wggRpEV
	UNUS+4+oriOz9ZtbRf/mFcT+Yp5F3gxEwUovWdaac24U3xkD0t4jpZRpHguy3vUThmjy
	r1gnepiTIyIkGvoC2dtHCCW1JfTB5L7n2M2L/Bac97THxjq1elHlP9DcLvXva+/Zk6ai
	MjpPJKANUQbm9RIruvrGSh5rb2H8kfpu/tbqBZT/ih3VY0hYzx4L6ljLzBn3tFj+mink
	oGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HqFe8sD1ZIF5M3fQR/f+hGQ19XYpvWbxfXiu39FxGUo=;
	b=F/7GPzgp8CypsLWAWdR+P6m2qOR6iATiuA5kLKTf1cHEiW1DZuiGqEGUQQQ2/J3qFz
	1uQyWxzI9C8ZOT7WOeWA7XlLIm12jHfB6ZYLcEdO3DxMxuPbg+L0HdBBt1nuoOp9jiZ4
	Penq/zogsDJqFGdpEKSIML5rFDnibHCgEffN2SsYUooF3SFtDi6zPGZ+N1NbbUlcCSRc
	ElHYDtctvr9FU/ZQ1K9HdpgfZxZUadXf99IX/edASBNjcGN9h9pBDCypboO5KR92m+f9
	tNy6Mc8rJq6WtNbkD5hDtofMPLW7WpOQ7Cs+iBSX+imU8M5c/lY9ONE5cW7hR9LVAsbC
	Dnwg==
X-Gm-Message-State: APjAAAWBo3nq9Om/0cN9YsqIrMYyz2M/thff/U2kwH4V2A3Ucacw9aTr
	sRFkYKSX587eO0S6t83ZwO9F6cn+m74=
X-Google-Smtp-Source: APXvYqwvZO2ATUeL3SJXOkWkMh+um5LXHEypCru+416IDfZRR53nV94SjJVGBkS/cI4gjvZp4n3TZQ==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr3434848wrv.148.1576679896929; 
	Wed, 18 Dec 2019 06:38:16 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:48 +0100
Message-Id: <20191218143758.129308-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/25] externalsrc: always set SRCPV
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:16 -0000

If devupstream is in use by the recipe, then that
variant has SRCPV, but the main variant may not,
in which case bitbake throws an expansion error.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/externalsrc.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index ea59d02ed93..d2001299876 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -73,9 +73,8 @@ python () {
 
         d.setVar('SRC_URI', ' '.join(local_srcuri))
 
-        if '{SRCPV}' in d.getVar('PV', False):
-            # Dummy value because the default function can't be called with blank SRC_URI
-            d.setVar('SRCPV', '999')
+        # Dummy value because the default function can't be called with blank SRC_URI
+        d.setVar('SRCPV', '999')
 
         if d.getVar('CONFIGUREOPT_DEPTRACK') == '--disable-dependency-tracking':
             d.setVar('CONFIGUREOPT_DEPTRACK', '')
-- 
2.17.1


