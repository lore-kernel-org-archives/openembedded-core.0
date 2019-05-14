Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2C03F7DF1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:24 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z26so8429077pfg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JLaEt9Vg8M2wa6MTuZTEdtJcvrhIOEiJQyp4qU8HFVE=;
	b=SKtbR9NbEV/rsX60LbtTaCe7p9nTbudQ/QD1dfZh1+KQzi8s92b24wKxjPgH+iaWiP
	rrkNpSkS97Wfz09365PAQT8pRFdG7unumvXv/sCi8ErhdksnMZNqEugumwa0Y7x9i6Pe
	bcuPfeHrPrQFGgkY4a/bICwmkRKGyqomL9gRQy+ZP+obWAykzuf+/zDiwejAoEHKooJw
	0F5c0zsaHJD9KB77pkLuWVGC2brJet44MAEDFifBqePfxJns8MabL4FgjYCdhEdOxDSg
	3+l6SjuuMAIqD67t/thlAkX/LNyuZ+udThJiKEDmKQqKaCJ54jSyvo9ONj/ZGWVQhWIU
	W8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JLaEt9Vg8M2wa6MTuZTEdtJcvrhIOEiJQyp4qU8HFVE=;
	b=CU7wUdtN0Igy8nX2+pjRHJaOGf5g67aaO7EjZboPnTrvdIB+1NcUvHhhN4PQWKlRU2
	gu3px06ZMf2jUiDx+Wtz6dYCmnZrcbSFLZpUun81K9sPSgiGkPGSVPj94K68cOy/cptM
	ssU4h0cM0qzlNyuIOewyqxCV3OgFaCO04qHhwUp+gTHb1MuP++21lo2j/1G9cEz5XRfG
	18gBpW+KVtNI+ATHaz/WsSVlJr/YVj4RT4pcg6XmgA69irKriUikRfxk1g/CvhqAbz4D
	ezkYwHRLtqZAKpQBRviqtV7H8mFdTlsHy8PIFmx4GoOGw5e+wg6UF4dqVJ8meeEHU9wT
	BtuQ==
X-Gm-Message-State: APjAAAWvhBi4T0ffJk9k+qqPiyCQkaOh3xP66uxxT0GQFtBOIePTh3vH
	vX1TPq1pgMAyImm2uC1mHXfDFkid
X-Google-Smtp-Source: APXvYqxGxalfgNwUUbzDeYAgg9rW6f7VaXEXsBvXVyItM6/YpM+kTGW8yuTtPAR2cwzv6gr3wcIQEQ==
X-Received: by 2002:a63:1316:: with SMTP id i22mr35811812pgl.274.1557809665231;
	Mon, 13 May 2019 21:54:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:54:01 -0700
Message-Id: <c3a325b5c2d9315629d014e5ebba552fe045171c.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 19/23] acpica: use update-alternatives for acpidump
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
X-List-Received-Date: Tue, 14 May 2019 04:54:24 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

acpidump is both provided by acpica and pmtools, so use
update-alternatives to fix conflicts:
...
|Error: Transaction check error:
|  file /usr/bin/acpidump conflicts between attempted installs of
pmtools-20130209+git0+3ebe0e54c5-r0.i586 and acpica-20190405-r0.i586
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/acpica/acpica_20180508.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20180508.bb b/meta/recipes-extended/acpica/acpica_20180508.bb
index b5c89fa..cd5f466 100644
--- a/meta/recipes-extended/acpica/acpica_20180508.bb
+++ b/meta/recipes-extended/acpica/acpica_20180508.bb
@@ -29,7 +29,7 @@ S = "${WORKDIR}/acpica-unix2-${PV}"
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "acpixtract"
+ALTERNATIVE_${PN} = "acpixtract acpidump"
 
 EXTRA_OEMAKE = "CC='${CC}' 'OPT_CFLAGS=-Wall'"
 
-- 
2.7.4


