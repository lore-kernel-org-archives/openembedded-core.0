Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 300887F37D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:22:24 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id g17so77584610wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hnlyYF/MZtBZEjxKl79xdnfvaOsCKi5yygUPx32ukBc=;
	b=IX+WfP1gXYYvq9x6HP7Wz9h4I2KWqpr3BMRk3vXY4mmWSsIbSq6qkZfCzsngCbsfaJ
	Ll3vHPJwWKHTem1R9QxzQdojUi1Wizyp8Q1/HUux/+GCOq9G5fizQjcY72y5Om7/5BQQ
	FTorspLCk6E9lXcJDB5i2ev8cHUOqN5aaAkCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hnlyYF/MZtBZEjxKl79xdnfvaOsCKi5yygUPx32ukBc=;
	b=V2R9ISLh0YbC10QhRr6AOVSNi34osM0uSskmBzFd63JJexXmZFoAIkxS2lnDpOifoY
	l2vPEwLB8jg0pV4hfxZ0wynFZgURSK9L/EQJ5oQwd8SQe9OqMM9VnXDGFlgFM2KoLlyZ
	eQ+Da2751/Hnj4OtFyCk8OyXDdrjPzLKRdhA55ngWKlc3IWf+kbuOXsrwvZagU4IpAwt
	WHGrSSZrkF/gDz35fSEtS0Ia1lozLszkqBqc+uQUVgnHT5GU7oM86z41VM8pV2wTrsdB
	oRVqGDndfoxndM1aamRBQ02nCwe/CofIBrhCO4Vu58lnXq0ZgN0yyZER7y/oJbrw9AOb
	PvyA==
X-Gm-Message-State: APjAAAUj7ymn25asw4EcS3H01yEIWr7887DY0+yLzpnr8vlQKDuOnHZE
	Lv8iuFB8VQZiju7NXU3I9YnUdkOZa2w=
X-Google-Smtp-Source: APXvYqzTbmb8iTyg/HIgxohgLptQEwqqO0F6816UDPhktCS9QqOrHl7x0dQMfMZUG+atzza5UuokLA==
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr5881933wre.241.1564759344743; 
	Fri, 02 Aug 2019 08:22:24 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r4sm46734991wrq.82.2019.08.02.08.22.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:22:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 16:22:16 +0100
Message-Id: <20190802152220.16954-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
References: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/8] sstatesig: Add debug for incorrect hash server settings
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
X-List-Received-Date: Fri, 02 Aug 2019 15:22:24 -0000
Content-Transfer-Encoding: 8bit

If the hash server settings are incorrect, show the user useful
error messages instead of tracebacks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 35d48f328de..eff5adfc602 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -272,7 +272,11 @@ class SignatureGeneratorOEEquivHash(bb.siggen.SignatureGeneratorUniHashMixIn, Si
     def init_rundepcheck(self, data):
         super().init_rundepcheck(data)
         self.server = data.getVar('SSTATE_HASHEQUIV_SERVER')
+        if not self.server:
+            bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_SERVER to be set")
         self.method = data.getVar('SSTATE_HASHEQUIV_METHOD')
+        if not self.method:
+            bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_METHOD to be set")
         self.unihashes = bb.persist_data.persist('SSTATESIG_UNIHASH_CACHE_v1_' + self.method.replace('.', '_'), data)
 
 
-- 
2.20.1


