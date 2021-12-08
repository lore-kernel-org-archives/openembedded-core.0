Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DB1C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.3087.1639000798795334904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 13:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RXbHLDoY;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso5226735wms.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 13:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xxcg3aWoo3tF3XVG/HIxkR0luOARuf7gLLld801GHok=;
        b=RXbHLDoYUV4orLJp0+oOXOOqtFChKG57jv3t+a+R93nob2anLlUC79byRcBxKCai1/
         HRizdy91BtdOQZg+EFCKbYIak+1rdygWWwPuAsAdeeVctJ/jbel7kIJMufZ6LbFEYwks
         nUuMZVBZQ4NDWXSFsbJod4N/S+vJNoj0kumD1FCPsjdZV+ongeEIa2piG3YJ3hpB63Ol
         mDUNZE7jNJT6BdkhQ3A2QRCN7QmQozZk2De4DRWBiqO2r5yOtYy7PTA7mt31KnJOhZD5
         d/FNZAQC104RdMKVCmVZpEMohCUyMtYeiWVc4T0CGiB+QByXYZGS6nWSDfNanREQ3AMu
         s7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xxcg3aWoo3tF3XVG/HIxkR0luOARuf7gLLld801GHok=;
        b=xVSvOPMIlAReWGRt4JYEfI9QF+6plIuYPLZ2G+CBPDfjfPDAbX81NECrE5FNMFsX3u
         98a1oWANcpOSnBgmBh7q9xZSUechBJ/DZWCPOprSxQup4m/vwKhwd3o08rWD12EQ/750
         1OAzwYlZWFA/Laa7QGcNTTrWtuTBR2vfwRJib7/m4kLMvDFKKJfnFYrDPudPX6OI6Ky9
         wZ3L77xtMUQLJtwqo8u3gczny7BtjmzMJPp16NlkC81SuWDyneF9iOziXKo5M6Asep1n
         E6DQTuxofEnzGDOqtFydkBu+hCRRxEoVHTOiaMaEw2xtkKj2VxWdmRvoEhptNd7v7GNl
         JQ2w==
X-Gm-Message-State: AOAM533ElhCadLwCosnjbg9C/7ivm0LjCTr/5h3XgnHzUeABuUN+gyKW
	XMAWk2L0Xmuj1WcHF8zDezjPao6FcHMCNw==
X-Google-Smtp-Source: 
 ABdhPJx8EFqcC7+3KGDjbfoKRjWJeuOOK2gurwJfyVwjbGxjAeRWMDOkdD4Z+qkoBcX8gLKQ7OQiHA==
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr1839348wmk.77.1639000797099;
        Wed, 08 Dec 2021 13:59:57 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.13.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 13:59:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/29] fetch: add a test for version check where compression
 changes
Date: Wed,  8 Dec 2021 22:59:19 +0100
Message-Id: <20211208215947.1979470-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159367

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../debian/pool/main/m/minicom/index.html     | 59 +++++++++++++++++++
 bitbake/lib/bb/tests/fetch.py                 |  6 ++
 2 files changed, 65 insertions(+)
 create mode 100644 bitbake/lib/bb/tests/fetch-testdata/debian/pool/main/m/minicom/index.html

diff --git a/bitbake/lib/bb/tests/fetch-testdata/debian/pool/main/m/minicom/index.html b/bitbake/lib/bb/tests/fetch-testdata/debian/pool/main/m/minicom/index.html
new file mode 100644
index 0000000000..4a1eb4de13
--- /dev/null
+++ b/bitbake/lib/bb/tests/fetch-testdata/debian/pool/main/m/minicom/index.html
@@ -0,0 +1,59 @@
+<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
+<html>
+ <head>
+  <title>Index of /debian/pool/main/m/minicom</title>
+ </head>
+ <body>
+<h1>Index of /debian/pool/main/m/minicom</h1>
+  <table>
+   <tr><th valign="top"><img src="/icons/blank.gif" alt="[ICO]"></th><th><a href="?C=N;O=D">Name</a></th><th><a href="?C=M;O=A">Last modified</a></th><th><a href="?C=S;O=A">Size</a></th></tr>
+   <tr><th colspan="4"><hr></th></tr>
+<tr><td valign="top"><img src="/icons/back.gif" alt="[PARENTDIR]"></td><td><a href="/debian/pool/main/m/">Parent Directory</a></td><td>&nbsp;</td><td align="right">  - </td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1+deb8u1.debian.tar.xz">minicom_2.7-1+deb8u1.debian.tar.xz</a></td><td align="right">2017-04-24 08:22  </td><td align="right"> 14K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1+deb8u1.dsc">minicom_2.7-1+deb8u1.dsc</a></td><td align="right">2017-04-24 08:22  </td><td align="right">1.9K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1+deb8u1_amd64.deb">minicom_2.7-1+deb8u1_amd64.deb</a></td><td align="right">2017-04-25 21:10  </td><td align="right">257K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1+deb8u1_armel.deb">minicom_2.7-1+deb8u1_armel.deb</a></td><td align="right">2017-04-26 00:58  </td><td align="right">246K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1+deb8u1_armhf.deb">minicom_2.7-1+deb8u1_armhf.deb</a></td><td align="right">2017-04-26 00:58  </td><td align="right">245K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1+deb8u1_i386.deb">minicom_2.7-1+deb8u1_i386.deb</a></td><td align="right">2017-04-25 21:41  </td><td align="right">258K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1.debian.tar.xz">minicom_2.7-1.1.debian.tar.xz</a></td><td align="right">2017-04-22 09:34  </td><td align="right"> 14K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1.dsc">minicom_2.7-1.1.dsc</a></td><td align="right">2017-04-22 09:34  </td><td align="right">1.9K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1_amd64.deb">minicom_2.7-1.1_amd64.deb</a></td><td align="right">2017-04-22 15:29  </td><td align="right">261K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1_arm64.deb">minicom_2.7-1.1_arm64.deb</a></td><td align="right">2017-04-22 15:29  </td><td align="right">250K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1_armel.deb">minicom_2.7-1.1_armel.deb</a></td><td align="right">2017-04-22 15:29  </td><td align="right">255K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1_armhf.deb">minicom_2.7-1.1_armhf.deb</a></td><td align="right">2017-04-22 15:29  </td><td align="right">254K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1_i386.deb">minicom_2.7-1.1_i386.deb</a></td><td align="right">2017-04-22 15:29  </td><td align="right">266K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1_mips.deb">minicom_2.7-1.1_mips.deb</a></td><td align="right">2017-04-22 15:29  </td><td align="right">258K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1_mips64el.deb">minicom_2.7-1.1_mips64el.deb</a></td><td align="right">2017-04-22 15:29  </td><td align="right">259K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1_mipsel.deb">minicom_2.7-1.1_mipsel.deb</a></td><td align="right">2017-04-22 15:29  </td><td align="right">259K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1_ppc64el.deb">minicom_2.7-1.1_ppc64el.deb</a></td><td align="right">2017-04-22 15:29  </td><td align="right">253K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7-1.1_s390x.deb">minicom_2.7-1.1_s390x.deb</a></td><td align="right">2017-04-22 15:29  </td><td align="right">261K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1+b1_amd64.deb">minicom_2.7.1-1+b1_amd64.deb</a></td><td align="right">2018-05-06 08:14  </td><td align="right">262K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1+b1_arm64.deb">minicom_2.7.1-1+b1_arm64.deb</a></td><td align="right">2018-05-06 07:58  </td><td align="right">250K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1+b1_armel.deb">minicom_2.7.1-1+b1_armel.deb</a></td><td align="right">2018-05-06 08:45  </td><td align="right">253K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1+b1_armhf.deb">minicom_2.7.1-1+b1_armhf.deb</a></td><td align="right">2018-05-06 10:42  </td><td align="right">253K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1+b1_i386.deb">minicom_2.7.1-1+b1_i386.deb</a></td><td align="right">2018-05-06 08:55  </td><td align="right">266K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1+b1_mips.deb">minicom_2.7.1-1+b1_mips.deb</a></td><td align="right">2018-05-06 08:14  </td><td align="right">258K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1+b1_mipsel.deb">minicom_2.7.1-1+b1_mipsel.deb</a></td><td align="right">2018-05-06 12:13  </td><td align="right">259K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1+b1_ppc64el.deb">minicom_2.7.1-1+b1_ppc64el.deb</a></td><td align="right">2018-05-06 09:10  </td><td align="right">260K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1+b1_s390x.deb">minicom_2.7.1-1+b1_s390x.deb</a></td><td align="right">2018-05-06 08:14  </td><td align="right">257K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1+b2_mips64el.deb">minicom_2.7.1-1+b2_mips64el.deb</a></td><td align="right">2018-05-06 09:41  </td><td align="right">260K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1.debian.tar.xz">minicom_2.7.1-1.debian.tar.xz</a></td><td align="right">2017-08-13 15:40  </td><td align="right"> 14K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.7.1-1.dsc">minicom_2.7.1-1.dsc</a></td><td align="right">2017-08-13 15:40  </td><td align="right">1.8K</td></tr>
+<tr><td valign="top"><img src="/icons/compressed.gif" alt="[   ]"></td><td><a href="minicom_2.7.1.orig.tar.gz">minicom_2.7.1.orig.tar.gz</a></td><td align="right">2017-08-13 15:40  </td><td align="right">855K</td></tr>
+<tr><td valign="top"><img src="/icons/compressed.gif" alt="[   ]"></td><td><a href="minicom_2.7.orig.tar.gz">minicom_2.7.orig.tar.gz</a></td><td align="right">2014-01-01 09:36  </td><td align="right">843K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8-2.debian.tar.xz">minicom_2.8-2.debian.tar.xz</a></td><td align="right">2021-06-15 03:47  </td><td align="right"> 14K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8-2.dsc">minicom_2.8-2.dsc</a></td><td align="right">2021-06-15 03:47  </td><td align="right">1.8K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8-2_amd64.deb">minicom_2.8-2_amd64.deb</a></td><td align="right">2021-06-15 03:58  </td><td align="right">280K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8-2_arm64.deb">minicom_2.8-2_arm64.deb</a></td><td align="right">2021-06-15 04:13  </td><td align="right">275K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8-2_armel.deb">minicom_2.8-2_armel.deb</a></td><td align="right">2021-06-15 04:13  </td><td align="right">271K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8-2_armhf.deb">minicom_2.8-2_armhf.deb</a></td><td align="right">2021-06-15 04:13  </td><td align="right">272K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8-2_i386.deb">minicom_2.8-2_i386.deb</a></td><td align="right">2021-06-15 04:13  </td><td align="right">285K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8-2_mips64el.deb">minicom_2.8-2_mips64el.deb</a></td><td align="right">2021-06-15 04:13  </td><td align="right">277K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8-2_mipsel.deb">minicom_2.8-2_mipsel.deb</a></td><td align="right">2021-06-15 04:13  </td><td align="right">278K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8-2_ppc64el.deb">minicom_2.8-2_ppc64el.deb</a></td><td align="right">2021-06-15 04:13  </td><td align="right">286K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8-2_s390x.deb">minicom_2.8-2_s390x.deb</a></td><td align="right">2021-06-15 03:58  </td><td align="right">275K</td></tr>
+<tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="minicom_2.8.orig.tar.bz2">minicom_2.8.orig.tar.bz2</a></td><td align="right">2021-01-03 12:44  </td><td align="right">598K</td></tr>
+   <tr><th colspan="4"><hr></th></tr>
+</table>
+<address>Apache Server at ftp.debian.org Port 80</address>
+</body></html>
diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index dc45eb2e13..6b77afe5f1 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -1346,6 +1346,12 @@ class FetchLatestVersionTest(FetcherTest):
         # http://ftp.debian.org/debian/pool/main/d/db5.3/
         ("db", "/berkeley-db/db-5.3.21.tar.gz", "/debian/pool/main/d/db5.3/", r"(?P<name>db5\.3_)(?P<pver>\d+(\.\d+)+).+\.orig\.tar\.xz")
             : "5.3.10",
+        #
+        # packages where the tarball compression changed in the new version
+        #
+        # http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.7.1.orig.tar.gz
+        ("minicom", "/debian/pool/main/m/minicom/minicom_2.7.1.orig.tar.gz", "", "")
+            : "2.8",
     }
 
     @skipIfNoNetwork()
-- 
2.20.1


