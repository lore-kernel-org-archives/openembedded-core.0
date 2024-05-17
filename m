Return-Path: <d.makhnin@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0EDC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 12:45:35 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.39750.1715949925626756973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 05:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=lDdlnRXe;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=VjMVeCQF;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: d.makhnin@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 250C6C0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1715949922; bh=XrxMoFO3LPFerBeeCGLq2NFe60VyRSFNTrfefPVVVS0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=lDdlnRXevCJ4RrTdqC97JIwe64+I/arCvk6tl+SXnHXI1g8xsqbeespRe3gEDpIcE
	 CfMWNF/5uSWBEnf3wnKC53kYfqQwYJoaXR9q3FIIOjNNsprOud6CGP/GpbEzbOiBHO
	 QVW5SQymnTjACkh74tiOd2WGyS5JDnerL6kgC93CAuAk35PZ1aiYLrMXI0SdrHFJqU
	 7yHYP3v+tvlRJv+/lYFSqmGMW4mwCy29T+/TJW7efWc5phDZeYi04zuDsHUE9s4pEl
	 kt0mshknx0e/nbBbAiynH+xEb78ClLEx40O052E0/6JkRNwHFLWeQuZQBmBJImBZBT
	 WJgmEbb1mbP0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1715949922; bh=XrxMoFO3LPFerBeeCGLq2NFe60VyRSFNTrfefPVVVS0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=VjMVeCQFxUKsjo3ZbcsDxFPSfbHqHq5zkdw7QDeUHyvBjxXmr3ImG0PlYCRkbY6Wj
	 3RIAtCt+BfL/QupdoPJ7Md8ZYdyPJo04JE+nGmxxQyROAwGTqCE2ZKpVLjaROwSKoE
	 UN86z4CC8IdKoaUYZMrHm0vmuXpUSOZjyPTE82ig3Yt5ewuW8Pz3CzI4WO0Gy/5SdS
	 SBL4TigfOKD3lmPA+WDk9X1QXReWVUDn/PEdnFPrQd4XFe9Gnl7Ju8TOkhtQGlHfiR
	 JX8nZvsDSS8E8gNDDS6zpN3nUyWl6JzIy9h0i6cJsLg/cLDdFVKQrMjqLf6UQe/LAs
	 X0w5D2gEtosjw==
From: Dmitry Makhnin <d.makhnin@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Dmitry Makhnin <d.makhnin@yadro.com>
Subject: [PATCH] go.bbclass: support gitsm fetcher
Date: Fri, 17 May 2024 15:43:40 +0300
Message-ID: <20240517124340.2668637-1-d.makhnin@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
 T-EXCH-12.corp.yadro.com (172.17.11.143)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 12:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199513

Implement gitsm fetcher support along with the git one.
This makes go.bbclass properly handle source code with git submodules.

Signed-off-by: Dmitry Makhnin <d.makhnin@yadro.com>
---
 meta/classes-recipe/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbcl=
ass
index d32509aa6d..052fdd69ba 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -87,7 +87,7 @@ python go_do_unpack() {
=20
     fetcher =3D bb.fetch2.Fetch(src_uri, d)
     for url in fetcher.urls:
-        if fetcher.ud[url].type =3D=3D 'git':
+        if fetcher.ud[url].type =3D=3D 'git' or fetcher.ud[url].type =3D=
=3D 'gitsm':
             if fetcher.ud[url].parm.get('destsuffix') is None:
                 s_dirname =3D os.path.basename(d.getVar('S'))
                 fetcher.ud[url].parm['destsuffix'] =3D os.path.join(s_di=
rname, 'src', d.getVar('GO_IMPORT')) + '/'
--=20
2.30.2


