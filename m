Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1D6CCD18D
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:59 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.9260.1760038312698604600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l5kGs7Rn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so1106886b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038312; x=1760643112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWNn1BSyFPRTmczqeovMy/TecTbayiVYy+rRk6YgGjM=;
        b=l5kGs7RnyrakykjXdY2psW1DNH0o3vSsSkO2jERXF5lN2CnrB500s/Zh22iw7yV3hf
         vIm2wyCbXH3CuTvy3ULH4gxmFWm2iRwtaHru0B6I3pdPD4Y9V6tsUEGM9FzeXnj57ZQf
         /+UF38fujah+cHvOyHnDpoz69CKiC4zjl5l415PA71WSIGoYBrm3iRiM8WDeAneVbq05
         BsewUVQQPK5Bjb9xHf82Vatp1URPQhSzIAKG7gvef3rUYib/AqRNKzqwLAo/oUeFVJ6E
         Yo8KfYGwY5/0T2XUvLLluTF3soKnHH1Mv4ei2+fxdIG55HGEePsmbaGPB93ApjH58gMX
         B07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038312; x=1760643112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWNn1BSyFPRTmczqeovMy/TecTbayiVYy+rRk6YgGjM=;
        b=uEvzpAhA9CNz+UmCKNdw7cE7icDD6IBVSea9xv6UM3PRWIwKyMA8T17tMXV3wOw1Di
         Xavri9DMPxyoBR6RuMoIr1rTyhmQb1OY2pvr9dRAVs/Jj4mIXZypUSAoOMj8NbfQuSAE
         /TxzHGsltT5cwuzsbSKsQVFf8exZL5GqDcBYNtkr9xbWvck6lUtccoIT3vKzcy5hMVfc
         w9f9cQZ2ou+uEh5h8fij75INpfUur0RBAn0JwLlbWdPcUHGwYHJGD/UeJMLYIw1oOfeR
         5kECnNDT+ghaIYjVICYfF3QwRVMMS9GDu1a6LuZfnfWkDmMmIBnHkItoP478gKYhVlo0
         fHXg==
X-Gm-Message-State: AOJu0YwrfmbDgiGDDSbdfR4nb29cjSnhIaH0EkswePppz5Zpu1+KXbbQ
	qZzZcdazJGz8KmFYTvTABPPZGQfqPuoSwoDLDbF2IGpynDSQgbZoCyTUW87PBdSss2fxqvrYe4S
	kl3me
X-Gm-Gg: ASbGncvJGqjKRVXjqiUTDjy+a3RovZjRtGvMd/KnLTAmEZv6NlTVL7P6Ql/vJlLD6Fe
	XjRak1yM0wJI+AhHEQPYWJvRaXizAkhaNj18N+JHgfquPF6rUgj+awqJLKFa0UrHEj45jvKt5VX
	XJmCtMYXi4aTFGD9bCgaclSivK9/0xOn13hral0VPAanv5dbtj47O+6TLtOTxYWGOm7WmOAslw6
	qV1bfr9VKn5hXyWyXAWle0opfraMd1KD1f4FSdNHIfsWRNXcpxNyJOKN/P9C5U8iESlOY7TTUyj
	FTzyBlZXkuOJXo0mSjI5zNpYalqvLSUvE/5eUGFFFuOg/NbB+NvQymNAycbrNlKx0ee9gVS7weh
	ll18VYiNjz4v/nWQYGnNB2qRCaCEP+Y1Rj0GiPQ==
X-Google-Smtp-Source: AGHT+IEgKMUL1zRXMnzTU3Wmh+Kp/rIPPLF8dalHh2Yz4t21q+Hk5GFXpFu7xOMo8yHTsKZSp1d2Cw==
X-Received: by 2002:a05:6a20:3d91:b0:2c6:cdcc:5dc0 with SMTP id adf61e73a8af0-32da81304f8mr12581888637.16.1760038311968;
        Thu, 09 Oct 2025 12:31:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/24] selftest/cases/meta_ide.py: use use gnu mirror instead of main server
Date: Thu,  9 Oct 2025 12:31:07 -0700
Message-ID: <97939775d2b81af392a2f98c922165763ff0ae5f.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224642

ftp.gnu.org is the main server of the GNU project, however download speed
can vary greatly based on one's location.

Using ftpmirror.gnu.org should redirect the request to the closest up-to-date mirror,
which should result sometimes in significantly faster download speed, depending
on one's location. This should also distribute the traffic more across the mirrors.

This information was sourced from https://www.gnu.org/prep/ftp.html

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 6f10d30dc9..3dc81b20a7 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -40,7 +40,7 @@ class MetaIDE(OESelftestTestCase):
     def test_meta_ide_can_build_cpio_project(self):
         dl_dir = self.td.get('DL_DIR', None)
         self.project = SDKBuildProject(self.tmpdir_metaideQA + "/cpio/", self.environment_script_path,
-                        "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
+                        "https://ftpmirror.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
         self.assertEqual(self.project.run_configure('$CONFIGURE_FLAGS --disable-maintainer-mode','sed -i -e "/char \*program_name/d" src/global.c;'), 0,
-- 
2.43.0


