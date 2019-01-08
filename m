Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 61DA77BD20
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 15:25:36 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c14so4494373wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 07:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=E/xPVyCISal7AXqUOoOXUeXk+8WLTDmiswZvvCg5A7I=;
	b=FTO62gFcFLq9t0m+2XR4pFKObp2Sb8eLBEbFGRnkbB30NmmTwK2OzKWlvNlIFE9eC/
	/SVf3ukqX0n5gP8SaaeAJzqgE5YIEGeym14RtCMJXpnaY6Tt5TLsw6cmbdr8y48bB4Hi
	Z47q9xrgHqhDkqa1rQeelbIKiFH3dZL3cH8S/S2Gcn2aSMPZB71nPwLd0hL0us/IkuV9
	LMwAstpNcx9cSGKvkDtiVZB3sGA9Ljgl7Ag4fAIO3Bp1l/wk0ZtXjig78xjsZK0y3QE0
	ukUJ5laVifR6cmUuOK2UrsCRAaFt3q1pRmHSnEXNn17/Jt3iXxdwqM+p+31ar5j1aVaV
	CUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E/xPVyCISal7AXqUOoOXUeXk+8WLTDmiswZvvCg5A7I=;
	b=D27q57TkW4G7Y9ec7IYEwD72Dh1hQTCDGZU4RXFRkPP6tzvNEATRCO4LfW39bbUicd
	LtnTzLrjcOKMxCLEKEbBoxjEA9D5P+UeETZaziVOz7+BTPiWSCDQ/o2DQrF491upxRzH
	9eO4od22MfQUB8ZUsDHlUZ/Zg43JXZxaQypgeUct8a7Dj3qGDoeaBIlWruYfaS5RR5OJ
	+ScAgEQRRSItkWeo6td8aKxuqud+i88RNI8VJbbHS3+Ml9ItHy69atvyNl0qWYOloAjD
	AnsP6VM+0bOZd7N8pKE+I/RrPqzjDq9zNhEhbVWY1kye+xEjR8UVXvm8qe119BimycUJ
	mrbA==
X-Gm-Message-State: AJcUukcukzreoDztE6v72DMNRS4qD9PJ2RyTcnS0tORdPmqk6J/WLK+U
	lbopxObBf+FMEMIwJoNsXk5dcLBFD68=
X-Google-Smtp-Source: ALg8bN4fBtwvn9uMDfJqNXbgkgWQOzETRlW+FGmcB+xNOhubyV6eZdUA0yzBKg3Gh6UIesYOQmvkWA==
X-Received: by 2002:adf:f091:: with SMTP id n17mr1806778wro.292.1546961136678; 
	Tue, 08 Jan 2019 07:25:36 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id v4sm10316825wme.6.2019.01.08.07.25.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 07:25:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 16:25:27 +0100
Message-Id: <20190108152529.55111-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] bitbake.conf: add --enable-new-dtags to linker
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
X-List-Received-Date: Tue, 08 Jan 2019 15:25:36 -0000

Various versions of ld have different defaults for this
(even between e.g. Ubuntu 16.04 and 18.04). This has the
consequence of putting either RPATH or RUNPATH into the binary,
depending on the linker, which have different priorities
vs LD_LIBRARY_PATH env var. Also, I think, the original
executable binary is looked up for the tags when resolving
a dependency of a shared library when using RPATH, but not
RUNPATH.

Let's make this deterministic.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e64ce6a6dab..68700e9e7cb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -573,6 +573,7 @@ export TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
 
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -L${STAGING_BASE_LIBDIR_NATIVE} \
+                        -Wl,--enable-new-dtags \
                         -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_LIBDIR_NATIVE} \
-- 
2.17.1


