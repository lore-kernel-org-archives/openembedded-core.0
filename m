Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC3078473
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:30:29 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q189so8116904wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zxIk+bmTa1TYvQTOd3OtqjaAbQHTuPam/ahoT/NMtlE=;
	b=gY7PUyYQycx2QsgDw2stX6OHJUaSw5JXnl6yUoyVhjBoubP/hCkP+6AuflhVftY9Q5
	40IDCjHuBFa6lmnA7C8ri/3lQHsNsXuqYvZguGs9iuLLGZ3slg1u8H7SCGAqA5+BTmEp
	HGO/5pHuzvHvvSASK2hwIKK9pxSb8oaF4uSs0FrZphF9b26mGmuDPEVTJiLhTDlhNrig
	m0opx7a/ugj1Rydms4WYkg2JWJyybwCh7UkoBYlrtwjip+MWW57fxtGkbMhMoDzJ8RFO
	00lBKYtHOKVzxucDQFFrCEN+r0dF6B0KUPRGHpBTK3wmgcyej2rt5iwx8/lqmhfkSi/E
	2rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zxIk+bmTa1TYvQTOd3OtqjaAbQHTuPam/ahoT/NMtlE=;
	b=ACHBbFt5srWADEGkAP+5aW36ilKfEQETpzJ5gnwTrFvYeOxkvmySdxt6HrkSWqihTn
	3CaewSICB9zPyHemn07hXgwVJOTZkJ99IE1j52KnJ99sBXMJlS+J06nYUxsgfL+g7Rpa
	yYjTVN8f+gtcRX6U5TvwTux6hG+OGXD8gsYNsMA59HrR9MCR8sMGjbqF6CberUIueXMw
	Umy8J6JMWHN1ntoibbvtUD2Z8YWyKxzH1nWT+fxi+kC/+neyDm3F0q5DtENGFpnNzLuw
	KE7tZIlThH9qv5VciIAUaoUVzzfvcGy/YZURleJKypHtqHGapsxIwhrJ1o1grIsGHSzb
	QE8Q==
X-Gm-Message-State: AHYfb5gAdeu0WkSYLtoNhamHEvitOX42ExKOSOwrZXImqdr4WUfKGP8Q
	b0xrGzCXnNM5m9Yr
X-Received: by 10.28.166.81 with SMTP id p78mr188673wme.147.1502497829841;
	Fri, 11 Aug 2017 17:30:29 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b186sm225302wma.24.2017.08.11.17.30.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 17:30:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 02:31:59 +0200
Message-Id: <20170812003159.27431-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <CA+chaQc_Cc8gyBGeOpXuOQXBZoX+XRE4cC+c_N+tCNcD20=3vw@mail.gmail.com>
References: <CA+chaQc_Cc8gyBGeOpXuOQXBZoX+XRE4cC+c_N+tCNcD20=3vw@mail.gmail.com>
Subject: [PATCH] rm_work: fix build break for do_image_complete
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
X-List-Received-Date: Sat, 12 Aug 2017 00:30:30 -0000

* since following commit:
  commit 2ff9d40dc88d43567472218cf3d3faf414398c71
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Sun Jul 30 16:06:57 2017 +0100

    image/rm_work: Promote do_image_complete to be more sstate like

  all image rm_work tasks are failing with:
  mv: 1.0-r0.do_image_complete.228730130ba309f85b73b72222ba11d7.raspberrypi3 and
      1.0-r0.do_image_complete.228730130ba309f85b73b72222ba11d7.raspberrypi3 are the same file

  it's because for $i 1.0-r0.do_image_complete.228730130ba309f85b73b72222ba11d7.raspberrypi3
  there will be first SSTATETASK in $j do_deploy, so the sed call doesn't replace anything

  It might be different order of SSTATETASKS in my builds (it might work only when
  do_image_complete is the first one in the list), but here:
  SSTATETASKS="do_deploy do_image_complete do_image_qa do_package do_package_qa do_package_write_ipk do_packagedata do_populate_lic do_populate_sdk do_populate_sdk_ext do_populate_sysroot"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rm_work.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 3d7fb52e81..13a9e75d85 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -62,7 +62,7 @@ do_rm_work () {
                 break
                 ;;
             *do_image_complete*)
-                mv $i `echo $i | sed -e "s#${j}#${j}_setscene#"`
+                mv $i `echo $i | sed -e "s#do_image_complete#do_image_complete_setscene#"`
                 i=dummy
                 break
                 ;;
-- 
2.14.0


