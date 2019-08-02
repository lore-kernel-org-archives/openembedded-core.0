Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1877D2AE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:22:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s15so45357783wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5/aW3//vcFEClP42u3aHkHSqV7ceaKqg+TBZ+Qz8ug0=;
	b=badfSMnETVXG+V3BJ0KZyganm2uoXg6mCbfyqVzzsL21UqvDJ4IRiDSU6TgkCiuLvm
	zrVo50o6pg9lrHcCws1YfzW/SyjG7J4C2m3L2JFbdYcT+BvlLCy1flmiompiKbcc9XNU
	ds5KGX+16jFpSLcmJK6OW/eR9YYML9UbVShg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5/aW3//vcFEClP42u3aHkHSqV7ceaKqg+TBZ+Qz8ug0=;
	b=JfHvhERH//cTUXmIWD6bE1B8mPFVI9VrAP3DOY/VodRxbSvXcrL9iUKEMduOfzY2Ys
	boxOVoBwHlblkgzViNKmyvX930xPpgRLxVleSj75Y4l8JuvNEP34b3CGMw3wcryXEfYV
	16x5NLHieuiCiOZvmoMILyh1CH/bpRCmfXHn/bw60SPp6g9RvzqBxCN+36Y3Wd2Nw4OD
	rcGwbrMm4oPuy3o55JYPXR/bwVe7+Qj517S/xodIYlVO+XIktd5sYT7F3HnAg9gNYN28
	Zv5KGWJQQpcUnueHAH6HbVnPFVEZlrkw9PlGZhBS6zg+hmmW4YHnr3Iuu3zBS8t5pZ4z
	uNow==
X-Gm-Message-State: APjAAAXqaTf6poR8tsbUx2FjRLb5a0ucaV66UGCMLNwjSuCzKzD+3vD7
	DpCXQzNiCkNyJN7SjAlIciqm/G+O3Dk=
X-Google-Smtp-Source: APXvYqxcex6zxEGhcOIOM/blU8jJ/uEcORrItw6A/8jhW2bGWWq1ZhKdDoZuTC9EsAs/hSlSgMfPHA==
X-Received: by 2002:a1c:d185:: with SMTP id i127mr5113964wmg.63.1564759345516; 
	Fri, 02 Aug 2019 08:22:25 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r4sm46734991wrq.82.2019.08.02.08.22.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:22:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 16:22:17 +0100
Message-Id: <20190802152220.16954-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
References: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/8] sstatesig: Adpat to recent bitbake hash equiv runqueue changes
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
X-List-Received-Date: Fri, 02 Aug 2019 15:22:25 -0000
Content-Transfer-Encoding: 8bit

Upstream bitbake now hanes preserving the unihash data itself, drop
this usage of persist_data which was extremely problematic due to
concurrent task access issues, particulary on loaded systems.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index eff5adfc602..f1a5af69c5e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -277,8 +277,6 @@ class SignatureGeneratorOEEquivHash(bb.siggen.SignatureGeneratorUniHashMixIn, Si
         self.method = data.getVar('SSTATE_HASHEQUIV_METHOD')
         if not self.method:
             bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_METHOD to be set")
-        self.unihashes = bb.persist_data.persist('SSTATESIG_UNIHASH_CACHE_v1_' + self.method.replace('.', '_'), data)
-
 
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
-- 
2.20.1


