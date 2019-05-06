Return-Path: <s.mueller-klieser@phytec.de>
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
	by mail.openembedded.org (Postfix) with ESMTP id 71EEE7D485
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1557131355; x=1559723355;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gFKqiU1+q5Nln4P9disJbACrd69KXylWzOe7xvFUUNg=;
	b=ReQdNrQbGGozdUPg4qyI0rNZcxpUZaw/dQghXk1+C/QKse1mxacQRb71xWSha2Hc
	UnBnTDJByqBfMJhZm4HEtM1VDZsWB2eQQr1tN9hny8kRbEfVpoPFKy0DFbuOI4Aw
	KaqniUEL1OsIRC7EsXVakymrBsQo1TgXp6VcjxY7Ht4=;
X-AuditID: c39127d2-4f7ff70000000d5a-e7-5ccff05b6300
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
	03.40.03418.B50FFCC5; Mon,  6 May 2019 10:29:15 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.21.77])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2019050610291496-314405 ;
	Mon, 6 May 2019 10:29:14 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 6 May 2019 10:29:13 +0200
Message-Id: <20190506082913.15560-1-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 06.05.2019 10:29:15,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 06.05.2019 10:29:15
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmluLIzCtJLcpLzFFi42JZI8DApRv94XyMwb09/BZ3fr5jd2D0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxuzX89gL5rBXLF8/g6mB8SdrFyMnh4SAiUTD/tvsILaQwA5G
	iRPvzboYuYDsi4wSm092sHQxcnCwCfhILJ1pCWKKCOhIvPnoBWIKC1hIHJsmC9LJIqAisaT3
	FhuIzSvgIPFl/wwmiOnyEud717FDxAUlTs58wgIyXULgCtD0Wb0sEEVCEqcXn2UGmcksoC6x
	fp4QSJhZQFti2cLXzBMY+WYhaZ+FUDULSdUCRuZVjEK5mcnZqUWZ2XoFGZUlqcl6KambGIFB
	dHii+qUdjH1zPA4xCnAwKvHweiidjxFiTSwrrsw9xCjBwawkwpv47FyMEG9KYmVValF+fFFp
	TmrxIUZpDhYlcd4NvCVhQgLpiSWp2ampBalFMFkmDk6pBsY9Gkd0vrEknq+z41io9Gj2i5jH
	b/c8zT4/R03Pq6G1suysYHpf1kzdUIf7USobis+WmR1l/ibm4Lp6QTv/zn5+bT4LzkhZL6t/
	E4x3WxgpStfHXnwr8qtK8d+bebbSn+3mB1ZfsQ2e9Cr35Mf1Z9PUOL2VlM+VLnX6GS7INmu7
	fIrmn68ttUosxRmJhlrMRcWJAPGsu2MeAgAA
Subject: [PATCH v2] cml1.bbclass: fix undefined behavior
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
X-List-Received-Date: Mon, 06 May 2019 08:29:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Whenever cml1 do=5Fconfigure is used with a defconfig, oldconfig waits for
input. This silently fails on recent kconfig projects with:
"Error in reading or end of file."
We cannot use a more up to date kconfig target such as olddefconfig,
because busybox does not support it.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
v2:
 - switch to good old yes '' | to support busybox
 - adapt commit message

 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 98d24cec746b..c7f6723cb3de 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -1,7 +1,7 @@
 cml1=5Fdo=5Fconfigure() {
 	set -e
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe=5Frunmake oldconfig
+	yes '' | oe=5Frunmake oldconfig
 }
=20
 EXPORT=5FFUNCTIONS do=5Fconfigure
--=20
2.20.1


