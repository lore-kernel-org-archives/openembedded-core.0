Return-Path: <armccurdy@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 33CDF789D6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 02:42:03 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id l25so22946375qtj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 18:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JotDyJgN3BTao2AoF34dRXFadkLi1Nq0hvbGJ8nrDlo=;
	b=UloVw8i4dIAU6Y2K/ndEmAN7/ZqWkBld4Rx+O4pWEe3oqc5KYc2xUpH7b4R6wCaadJ
	emwReYZiazsL8VXXjYTQZrTRW0CVvPrbpAqMSNTWZNeBIxsPvjgpn/sAyYlJkvmzn6k0
	ncABuaNg4W9CZQiM+JAW/YDcyOG2YSTR3IGO5N5zgYJoz9YjFA536Vyx1NPvxsVSInjJ
	gWC9N/Hpa36/sb0ikX+oehdTbNoStsLPvKy+C5/JCQR0Gf5lxBZP3gbLf9zoX16c2KF6
	Q+6Kzk59LTzIXUcusobIo3JH6jxjtjHxXy8s4F+aCVWWXJjQTshdt6TifLDh7jY+SKVm
	r6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JotDyJgN3BTao2AoF34dRXFadkLi1Nq0hvbGJ8nrDlo=;
	b=jZnrUD2YPrLOQHapgh6cyaMu4nv+8qmgRbMhEqUeFNWwQdhQHQxbNEkN6ZQqpIKXiQ
	2PnQw+iQIb14alC+cJMn57xuzqfmES0pOzSqcHijAEfVawooy0WEA40MR7N029TP8imp
	WtULcM4yqdrrSGdald7cEv6nhLrdbz3yAHyxshjH5kGwaLERJDH8cWfAIy8m0PCHKozk
	rsfNlIyB9kVe5n2eAi0ZpSSxZJNJjw1WJg6KTpym82VCK6epnlThMXOwdOMwNEvZ3VWG
	RXAKZBKU9fjiDwjt+yF8CdrwR9TWDB6LfeI0Kyx0SNqB7iiNAzl0ipdkUtSVBmGMM1h/
	szXA==
X-Gm-Message-State: AElRT7EE29iS/pM+Wtvr7F573uzy8bYZakA+wkK13OtyWlzCXBPEypjK
	kOAX++SV1oYNzPF15R2EaXDkCA==
X-Google-Smtp-Source: AG47ELt219qkIJPCzYbcmLaOF+C/2dPtdXiPTCztJArk0o15Ef10BEZWULBmy7yTRvaMytneJaN8Sg==
X-Received: by 10.200.46.136 with SMTP id h8mr26203752qta.253.1520304124848;
	Mon, 05 Mar 2018 18:42:04 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id j1sm5059137qkk.39.2018.03.05.18.42.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Mar 2018 18:42:03 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 18:41:57 -0800
Message-Id: <1520304117-32718-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] flex: create separate package for libfl
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
X-List-Received-Date: Tue, 06 Mar 2018 02:42:04 -0000

Target binaries linked with libfl currently generate a runtime
dependency on the entire flex package (and therefore m4 and bison
too). Copy Debian's approach and create a separate package for libfl.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/flex/flex_2.6.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
index a906fe8..b89b751 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -43,6 +43,10 @@ do_install_append_class-nativesdk() {
 	create_wrapper ${D}/${bindir}/flex M4=${M4}
 }
 
+PACKAGES =+ "${PN}-libfl"
+
+FILES_${PN}-libfl = "${libdir}/libfl.so.* ${libdir}/libfl_pic.so.*"
+
 RDEPENDS_${PN} += "m4"
 RDEPENDS_${PN}-ptest += "bash gawk"
 
-- 
1.9.1


