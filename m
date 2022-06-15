Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02856C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:20:24 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.2133.1655281217791597725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IbwvZE/p;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655281215; i=@fujitsu.com;
	bh=EP5x2RPSNk2PoJkO53MsvR8Aj1ySr01y+dRzVBCkEFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IbwvZE/pMNqMVI5dQenILBlxIuVG41MrhkQzG2bZW6lCzAcgCdqyWFn7W1ulmFpBX
	 b84DJdXdccTHKOhl0XHh+vwlQCp+JOVVnZaN9cWeYW42yG11ME08ykaSmaQOejnemf
	 vS43ZR1KRMuhLI7jiII0cgQ374DZwyMmBleV4SGmqyU+sBxbvALIfW7STb74kNyVkY
	 4/bz5OMD6Vz8vflrqkKKCYLxgkX5uENzila6D8LA+6SG/T1Y2u1KAYt+EtSzweXQee
	 OTi8zflvodfNe/gBlQNg4hv7OLWKL5KKfMLNGzW+wb0LBesrSLvaslzyJS3MymjhXv
	 WR57sVVDhaIyQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSdd+2so
  kg9lbVS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxnT7YxF1xjrfi9bAZjA2MzaxcjF4eQwGNG
  ie1vpjFBOOeZJD7vvsYI4exhlJh0cRtbFyMnB5uAmsT0WzeAWjg4RAT0JK7+EwUJMwuoSLz43
  cMOYgsL2ErM3nSeHaSERUBVYvVGT5Awr4CjRHvrTLApEgIKElMevmcGsTkFnCQ+Ll3LAmILAd
  W0/O1mgqgXlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0jMmLENaqaaxNVzm5gnMArOQtI+C0n
  7AkamVYy2SUWZ6RkluYmZObqGBga6hoamQNoYSFvoJVbpJuqllurm5ReVZOga6iWWF+ulFhfr
  FVfmJuek6OWllmxiBAZySnF62Q7Gq/t+6R1ilORgUhLlVZ68MkmILyk/pTIjsTgjvqg0J7X4E
  KMMB4eSBK/rJKCcYFFqempFWmYOMKpg0hIcPEoivIlTgdK8xQWJucWZ6RCpU4y6HFevXNnLLM
  SSl5+XKiXOG9MJVCQAUpRRmgc3AhbhlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ864AWcW
  TmVcCt+kV0BFMQEc07lsBckRJIkJKqoFJ/0fzSYFO3um58y5++C/weIXk/zuc99dwTD56LlJv
  avLkRblHVK/zf7JfvY43N8+zvdn+H+/ek4tap0z/v+jddc3GC9d6nNgq+Ov3nYoy40wMvcBnZ
  C2vNePKw+7aC/HhW0PDZNR1zMLXzb9jpf72gEyQmnLrPfZZKvsznFRNDZ39Us1nGXpdagqbVi
  HzcvflVo6VZZ8Vm8Oznx3bIKW03Gz1X+7PH/u4NL4faWqQSdyfEnG6z5L51BbDuXERW5W6yng
  k1Zd/337ltrZsm0JjYHvO1tv7WbPLl1xdVntDPlB/1ayFn4NjW9yUGR2OZWuor/TKnam/5mfR
  x9ZjnPodxafVot5qHQrZtO+8500lluKMREMt5qLiRAB51hfxawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-732.messagelabs.com!1655281215!132260!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18651 invoked from network); 15 Jun 2022 08:20:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jun 2022 08:20:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DA92D1000EE
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:20:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B75DD1000CC
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:20:14 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 15 Jun 2022 09:20:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] piglit: upgrade to latest revision
Date: Wed, 15 Jun 2022 16:19:51 +0800
Message-ID: <1655281192-6663-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655281192-6663-1-git-send-email-wangmy@fujitsu.com>
References: <1655281192-6663-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:20:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166919

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 08f664ca61..7b8dc5f0b4 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "a1a1824b38f1d7bfe851633db416c6bed84ba557"
+SRCREV = "b84975ef4575d8121dbc50fca72341aad4572cdc"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.25.1


