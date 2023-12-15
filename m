Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6D9C4167B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 21:22:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.78458.1702675326802917627
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 13:22:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=khmL2vyr;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-336447100e9so1050739f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 13:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702675325; x=1703280125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/PhEbHARN9VxP4MZey1qO+hWRr2rmDnyHz+4BuRyR7s=;
        b=khmL2vyrZ23xpPFuDIfjqFdXGIQO2IKGrp3wXBfV/jJs8IQdbCIBUbdQo544ytTxgi
         kgnuMAfUVkVoAFljK/8S0hSyjWizb06OPHLLaaASZAsaOQw8wFqhMHIPRThW7UEJ6kch
         oGYrQsa9n7jW22FwkPD7wqnUQ/KzwJY457rzRzwbVmKGeVx3ryEe8NSY3MHtOCumuxun
         G9+bAz6lRDIQhqj6Aj2NKZ79nnUe+V85wYt+e4hB+iWMksTMfUKkJylgetxGeRdERkXw
         YkrlruBGcdKwrOML8Fm3bc7kz0Djz4b+Lv+ik9cvRv4VSEmCQGtEYjnZ1svpPZzLLwg7
         a+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702675325; x=1703280125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PhEbHARN9VxP4MZey1qO+hWRr2rmDnyHz+4BuRyR7s=;
        b=XYPFm91aLqOhVDCOzEGUYcjXIn/4AROoPO6t3AskcLlorfHqwDcSYAa9tM8S2WPkSY
         hJzvfgP3BaOI6Y+YsDQIo3NSTOG0tz2JQ/V/zXnMJyTo1H8UAmG9jLpsT6gFTS41vhGA
         EQcmuPb/uExIg3ehGYmXnQIj226t88UFJ1kcIWTcQ4zsl0BVbqI6RAS3oZnF23GVMnlw
         j9A4ythxEcne6EgvYi4UHdfQ+/G1OYAAEunEeYsMt1WM31xGHCoP7mt/7ZMudSF3QGGr
         QSfbRs6sRADhrVJb3bxQrBl+uQnPAufxK3mxmIBPEgo/pCQKyQZLcBkysLtwYJe9BAhO
         cyBg==
X-Gm-Message-State: AOJu0YwOLWIZ87Sy/huwWJ9u1nFHBvD9onXoAkbqalI+8Rx65Vi3vJeO
	GfCWn0it4kxCyD0Fq3eXu0kCiebvb0SLh1ROTBc=
X-Google-Smtp-Source: AGHT+IH7wJrOtTwAwXweIfJgdLedeRnd05JR23k99pMWw+kFbjCzE7chow18OTbji3j4828OwcghIA==
X-Received: by 2002:a05:600c:1c01:b0:40b:5e1f:6fdb with SMTP id j1-20020a05600c1c0100b0040b5e1f6fdbmr5683099wms.48.1702675324606;
        Fri, 15 Dec 2023 13:22:04 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b0040c6dd9e7aesm2476516wmf.34.2023.12.15.13.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 13:22:04 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yoann Congal <yoann.congal@smile.fr>,
	Chris Wyse <chris.wyse@wysechoice.net>
Subject: [kirkstone][PATCH v2] externalsrc: Ensure SRCREV is processed before accessing SRC_URI
Date: Fri, 15 Dec 2023 22:21:51 +0100
Message-Id: <20231215212151.2709691-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 21:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192547

When SRCREV is used, call bb.fetch.get_srcrev() before accessing
SRC_URI. Without this new bb.fetch.get_srcrev() call, SRC_URI might be
accessed before SRCREV had a chance to be processed.

In master, this is fixed by https://git.yoctoproject.org/poky/commit/?id=62afa02d01794376efab75623f42e7e08af08526
However, this commit is not suited for backport since it is quite invasive.
The part of the commit that fix the bug is:
    --- a/meta/classes/externalsrc.bbclass
    +++ b/meta/classes/externalsrc.bbclass
    @@ -63,6 +63,7 @@ python () {
             else:
                 d.setVar('B', '${WORKDIR}/${BPN}-${PV}')

    +        bb.fetch.get_hashvalue(d)
             local_srcuri = []
             fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
             for url in fetch.urls:

NB: bb.fetch.get_hashvalue() does not exist in kirkstone but is
equivalent to bb.fetch.get_srcrev().

Fixes [YOCTO #14918]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Suggested-by: Chris Wyse <chris.wyse@wysechoice.net>
---
v1->v2:
* Only call get_srcrev() if SRCREV is used (without it the call may
  throw an exception e.g with a file:// SRC_URI)
---
 meta/classes/externalsrc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 97d7379d9f0..a209730240b 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -62,6 +62,10 @@ python () {
         else:
             d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
+        if d.getVar('SRCREV', "INVALID") != "INVALID":
+            # Ensure SRCREV has been processed before accessing SRC_URI
+            bb.fetch.get_srcrev(d)
+
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
         for url in fetch.urls:
-- 
2.30.2


