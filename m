Return-Path: <marek.belisko@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421DDC433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 10:53:32 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.43353.1636368811453164680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 02:53:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aRtFow4h;
 spf=pass (domain: gmail.com, ip: 209.85.219.172,
 mailfrom: marek.belisko@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 131so42304393ybc.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 02:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=DH+7sybetLAZYNFNBjS6KFtX03HX3F/2hJbC0C/34mg=;
        b=aRtFow4hx3iUe0q5TgIEkSIEMoU3/9YqUUMwg6pDEI4x+2WLg+cTN5kIUfT8zDeN0k
         aSccuf7M1lTB/sy05I1bWVYFQzYS+eE6zbbWfTUGtkPG5qIfsUL9/fRPSlRdcinsRrYJ
         QOWLcAiX0i3NBEo4sJBrkMk6XVqIHvqovXxQ3Mnfm3dRiuCpLQWXps59M+hEerE8nL0H
         HY6Xlp6H4I+FOptHdGDmnGh3pPKXra1jr3qVLdR6/32lxKBmBEjNwoNHONWm83+/R4Ds
         sLs0ky5l5Tkh5hqhMVMAJ64sGp9zvFD+9jBaBYWrYLOJpO9PCMBxCG1mWQuImA6Nt+aM
         vlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=DH+7sybetLAZYNFNBjS6KFtX03HX3F/2hJbC0C/34mg=;
        b=uirrydWRL0lTOmJq7O8zHMqiURMGiwgM2ARuCpsOU+AwjB+cmX0WKTEpNxVU0IpRWh
         emXIuND9jQdmJKKDTH5F6eHpXDWJCMqstVc22HuFF218EAKRB1OxKGSBkKv7JYsOGRUa
         AZ6oUl+dGcw7jHdyqEQK7nsNeSyMop0+AxKNp//FafLBaPoa4S5vxlFK7WbQGeE7LOtm
         OA2HxdDyZoTg7WLe/6Lu8WH6QgxYYF5pFbUbX4VXxtznqptH9KHVendCnuyWZb5mR1vJ
         dFNAlieuGfq7l089eGZESyLGbwvjBnnkVV/rlEm9yep2E4y21nyppTjuVmmH8357EdbB
         QWCA==
X-Gm-Message-State: AOAM532k+KF5M8izFIy6MHo80wWyMv6SqvXET22eBR0rAdOSs9+CKwHM
	kV51ixtkPyJX/dhOwHKkFf0r7U1WuITcGJ64W8qisqlq+es=
X-Google-Smtp-Source: 
 ABdhPJwTHAXJ2S6z8GPXgnITViynu+cJPDE19lMr/HCRwlJ/uGE3Vh0fWqp9KEsXsP4BCo5zpbwGPIoSOYQ9gAH7Y60=
X-Received: by 2002:a25:610d:: with SMTP id v13mr84338497ybb.1.1636368810510;
 Mon, 08 Nov 2021 02:53:30 -0800 (PST)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 8 Nov 2021 11:53:19 +0100
Message-ID: 
 <CAAfyv37SVDPteJkaLzZB7bYRdCPGK4ndKJ=gZig75GoxYAvR-A@mail.gmail.com>
Subject: broken dunfell
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: maira.canal@usp.br, akuster808 <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 10:53:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157969

Hello, latest commit in meta-openembedded on dunfell branch raise an error:

meta-openembedded/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb:14:
unparsed line: 'RDEPENDS:${PN} += "    ${PYTHON_PN}-logging
${PYTHON_PN}-fcntl "'

Seems new syntax is used in this commit, fix is simple:

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
index 1ba2c6f..7ebaa45 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =
"b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba334

 inherit pypi setuptools3

-RDEPENDS:${PN} += "\
+RDEPENDS_${PN} += "\
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-fcntl \
 "

Thanks and BR,

marek

