Return-Path: <tossel@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id C3EA4793DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 15:35:27 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id d8-v6so11867486edv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=66R9kiKsNmQaFXh0b5Pj9PH9Q87xLqvSF/g1VdXn1WA=;
	b=isjulmB5c4SYgZf/2YdpnGSQ0UZ+hjRb8reCaKvea5KuOFd2EXKF3q93q+g7/EHEqk
	5zVM2bLYfb/jsZ/RdQmVvnVy2H85+dcODJrYAzEpbI0y8+VJPxgyWTp9x/Cj8TM3Zs6w
	YHEtqHxPiFQo74TiJIwsBasGNKxIBQImw4g9nOSSZXwu3ZuWLbd3D10anNkxP6V2anAm
	ZOE8rc/YlWoVmGZt1/AXYCanSZRl692txoGl2iPJfYxJqb+y8xEAmbeJxDgkBw3NpECN
	RULKw3VFsWmIZKkdr5n65JXGvyOxYALMpJWOktTSmp4Mhcszt1ukNyLwxC6Scuh85azN
	1sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=66R9kiKsNmQaFXh0b5Pj9PH9Q87xLqvSF/g1VdXn1WA=;
	b=iymLZKCmUoptfHeQ6sBDAHL97sQQqZYSzL30NTLQ3ykVtPTWOpyAvA90BJMZSA4iaf
	DS6h5h/1s8mejUg4RKfqbqJwhPmHbQuJB+orQIoF5Jd373XuwspXOyWVXHYulHywi2qA
	gi5ncpdN4iuTNNoe1la08rL4+C4sf1Ht//2POnifD2TX9C5vL4phGEE5SQbz5gr/UWrs
	MQx0rt+gGzU+TXUqwD9rh6hJprYbJAi72uetDntdF5VxyoqPw7mOlPAJ9gAp9W7hWfkH
	ay/szMefcZ2lXfnyUSbGHHXZnor2+9RgxwCQDrkH1cJzNpwUtj7h6YrsE8PsWUKl3pFV
	FwgA==
X-Gm-Message-State: APzg51Abz2+5YoruuqKlyl0LwPU3tz1ppLgUuYqAzH9Fq9JOjru+MAd4
	rZ3M0fXtHLjaAV3mINFuG1aUWsYn
X-Google-Smtp-Source: ANB0Vdb5VM/wbeAuSvgCUA/uh64BbJ4/FOV6XxUCz6SrTkhDsl20dCYOlhSrMOur35qswQnCGcbSdg==
X-Received: by 2002:a50:8843:: with SMTP id
	c3-v6mr9386489edc.146.1536334528087; 
	Fri, 07 Sep 2018 08:35:28 -0700 (PDT)
Received: from marvin.ad.here.com ([2003:a:f1f:7600:dcd1:3a2c:3f9b:f60b])
	by smtp.gmail.com with ESMTPSA id
	k33-v6sm4236976edb.31.2018.09.07.08.35.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 08:35:27 -0700 (PDT)
From: Anton Gerasimov <tossel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2018 17:41:47 +0200
Message-Id: <20180907154147.7995-1-tossel@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] systemd: set split-bin to true by default
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
X-List-Received-Date: Fri, 07 Sep 2018 15:35:28 -0000

Not doing so will make meson chose where to install init binary
based on irrelevant features of the build machine.

PACKAGECONFIG option is defined to override this behavior.

Signed-off-by: Anton Gerasimov <tossel@gmail.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 84906f97b7..55e3986935 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -168,6 +168,7 @@ PACKAGECONFIG[time-epoch] = "-Dtime-epoch=0,,"
 PACKAGECONFIG[timedated] = "-Dtimedated=true,-Dtimedated=false"
 PACKAGECONFIG[timesyncd] = "-Dtimesyncd=true,-Dtimesyncd=false"
 PACKAGECONFIG[usrmerge] = "-Dsplit-usr=false,-Dsplit-usr=true"
+PACKAGECONFIG[sbinmerge] = "-Dsplit-bin=false,-Dsplit-bin=true"
 PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
 PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"
 PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${PN}-vconsole-setup"
-- 
2.18.0


