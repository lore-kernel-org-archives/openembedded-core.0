Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 535BF7FF1D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 16:55:17 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id l11so181446wrx.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6AxQsk+RhZTCVPB3J5Eqyj4JVUq4ATVO+FloZEgELqg=;
	b=YmhYEtDGatkSw47oCxoMgIy57wvOFZDJXw1G/Dw7PS8MaoFswCCf6nyMxscr3Pc+Ef
	OTpliXBAIVEbj787nsofFkNu6NO5Nzbxe/p/zBp86KOawCsKWDiWW7ldbzvAd2dCUCdE
	s0Dpsnj0If69fUHqxmfqUxUgJjbf/MsGdqPl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6AxQsk+RhZTCVPB3J5Eqyj4JVUq4ATVO+FloZEgELqg=;
	b=dXItiK716CrW0Iq9HyBn26t3xH45282dsUInpK2lVLmNk2mwc21cKpvoyZiRU0Pzor
	eSBYeBlGpIpYi6bAFyQZqqqpMYrSPZTgS7kwxa7A7xxgooPpJseZzvr9U+eagjncDwKS
	AcEHBk/mw6AgSXAO6NF2gVv2DGqLtHi92OUKFQTb7t1GgYlOokytC3ciKUjS/ho/MEf8
	/68d0vELXaaav0+Sad13T8NDGst7UoFcIzNRXAmTxAGNORKLG1P6sPQQTI2GtUMbmqnf
	zofyThK0o6iLOfsTUnFZt8lsnhHde0wHzfDrHnWpxECxm7Mp7lreweR7AZR072RHV55g
	D0GA==
X-Gm-Message-State: APjAAAX7MZlWVZFIS1otRv2Ha+Ru00YUEB8VIyP/KT4a3ZXcn8PhfTdd
	VBxhRrn4MaTk2lVB4bBpaBmNUQgj8CE=
X-Google-Smtp-Source: APXvYqw8L42NsB6O3YKkcA7dqQVhX1F298c8S//jt/WJvnOZqaB1BkFTRmMRPvTQeE5ZLSYj6jWiMA==
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr3645766wrw.314.1568825717724; 
	Wed, 18 Sep 2019 09:55:17 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x2sm8623195wrn.81.2019.09.18.09.55.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 09:55:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 17:55:15 +0100
Message-Id: <20190918165515.27999-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190918165515.27999-1-richard.purdie@linuxfoundation.org>
References: <20190918165515.27999-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] systemd: Handle slow to boot mips hwdb update timeouts
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
X-List-Received-Date: Wed, 18 Sep 2019 16:55:17 -0000
Content-Transfer-Encoding: 8bit

This is a temporary workaround to avoid autobuilder failures until
https://github.com/systemd/systemd/issues/13581 is resolved.

Its being done globally even though its a mips problem for simplicity,
it doesn't hurt anything else to have a longer timeout.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_243.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index 3ae1516dfb5..f0e8c569b81 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -298,6 +298,11 @@ do_install() {
 	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
 }
 
+do_install_append () {
+       # Mips qemu is extremely slow, allow more time for the hwdb update
+       # This is a workaround until https://github.com/systemd/systemd/issues/13581 is resolved
+       sed -i -e s#TimeoutSec=90s#TimeoutSec=180s# ${D}${systemd_unitdir}/system/systemd-hwdb-update.service
+}
 
 python populate_packages_prepend (){
     systemdlibdir = d.getVar("rootlibdir")
-- 
2.20.1


