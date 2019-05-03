Return-Path: <s.mueller-klieser@phytec.de>
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBF67D67B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1556875263; x=1559467263;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aVUPX78sNB80NC50lhjJeyaQf6k/DL0eqNNlG9SjCtk=;
	b=mdjuHKGvYrxv7M4/PcoOIh/dsxaURC1q20f8BFf7j3oDFsgu2atT469oV3RINled
	frF6Y2D47f3ij5r7Wuut1RhXOtZTX+AMCtlgmtfZP3x6ihpepopZYfJkaPWZnQz4
	4qBi1jCQOWGsf5nQEpxUa4RclKkxZvjAExhbbYafhm0=;
X-AuditID: c39127d2-4dfff70000000d5a-79-5ccc07ffd812
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
	7F.D6.03418.FF70CCC5; Fri,  3 May 2019 11:21:03 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.21.77])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2019050311210319-302967 ;
	Fri, 3 May 2019 11:21:03 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 3 May 2019 11:21:00 +0200
Message-Id: <20190503092100.21596-1-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 03.05.2019 11:21:03,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 03.05.2019 11:21:03
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmluLIzCtJLcpLzFFi42JZI8DApfuf/UyMwe/XKhZ3fr5jd2D0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxo62p+wF29kqLj1tZGpg3MjaxcjJISFgInH232+2LkYuDiGB
	HYwSr3rbwRJCAhcZJRadjO9i5OBgE/CRWDrTEsQUEdCRePPRC6RCWMBU4sfkNywgNouAisSK
	/8fBOnkFHCR+n53NBDFeXuJ87zp2iLigxMmZT1gg4lcYJRpX20LYQhKnF59lBhnPLKAusX6e
	EEiYWUBbYtnC18wTGPlmIemehVA1C0nVAkbmVYxCuZnJ2alFmdl6BRmVJanJeimpmxiBQXR4
	ovqlHYx9czwOMQpwMCrx8BY8OBUjxJpYVlyZe4hRgoNZSYQ37iNQiDclsbIqtSg/vqg0J7X4
	EKM0B4uSOO8G3pIwIYH0xJLU7NTUgtQimCwTB6dUA6Mgy5vYh0qHy4u3Ha/eEylc825i1/vT
	an75Advu3JV1mcKwOWxJxWEeLp6rgfn/pe/ypf1mc/ZbvjpcLuT0RU0dp9KetOgQe8fDvwKS
	oxdF3NFL31veqC8VOYf5wteH7OlHFHQbjaLWiM3it7/EsWTR1Ec3CxgDZLnvd62RsZe7dX9b
	8NQXlkosxRmJhlrMRcWJAJdFQiEeAgAA
Subject: [PATCH] cml1.bbclass: fix undefined behavior
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
X-List-Received-Date: Fri, 03 May 2019 09:21:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Whenever cml1 do=5Fconfigure is used with a defconfig, oldconfig waits for
input. This silently fails with:
"Error in reading or end of file."
Replace the call with olddefconfig, which will have the same effect in
setting all defaults, but has a defined behavior.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 98d24cec746b..f3b8a84073c8 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -1,7 +1,7 @@
 cml1=5Fdo=5Fconfigure() {
 	set -e
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe=5Frunmake oldconfig
+	oe=5Frunmake olddefconfig
 }
=20
 EXPORT=5FFUNCTIONS do=5Fconfigure
--=20
2.20.1


