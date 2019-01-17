Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id D8F737C211
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:36 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id q2-v6so9102420lji.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=k9NrlisDw1r21WdK0e51ADQcGewFGjEsZ1dUzppD5w0=;
	b=PLuZ+08zXP/g7ylLZmygSilF0Nsw/KY+pq4Qo69VqeIUEaGu/vRhvyUjDu8lGw9nZ/
	2CZJ/3Iao+y2U1HkcJw/DDEzwEfCGWz4TJZXx4lgWQwghTvBJJkIzuAb6/huhc5wrMbO
	WBa0UqQDV7mbBfDWJN3Z5Z33wwYgpriEHz3Cbtr3cXmYOwCezf7BdcnnHi5Gd7rqrjho
	L1wN4k8qcnkCMJHsoJLbYpzxzou6jEY5hGyn/LC7Ec6Bix/X4gN5C2FayWsjirLE52Tf
	TZavjdDhdN5fdpuoTRiZ7ayZHOKwx775fvEhxC0u8z+4U7Lzsgt2Wd4rjnJ0eswZnBFD
	m4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=k9NrlisDw1r21WdK0e51ADQcGewFGjEsZ1dUzppD5w0=;
	b=puPDTUcboXpLYEa3EjqpAnnbu5tSICkf2NngTUrEbMYrhCDyyM6nDw05y4L5nM+Uhl
	rvnYnZgrMW6Di3bFHp7eVPSNQYWoECfAlmov7GqN1doTRderFwsO2zXUwHH9cwGk3TnO
	kmRRvfUYKNHMi8HgpkLIYbvj0oL9hzwmjJXRjT4UgGBpDqDjJto2kQlwN+U/U/mxLO9S
	eG9YLKGxNW2IYV8HYpVL0y+DxQGktaXkMeS9pm1FfjR+TqSCh9PvoNFLx164ZxsWLt2+
	6CYECjWk9HAN6MOzzPnMHBRG1zc8FPkLjgBxPAoLV+m1Ja3Xz6MPiSdYd6tvHxUbhfhI
	tI9w==
X-Gm-Message-State: AJcUukd4oZ/lY8unMf93pQQoSJdZPc5aArS43xsFn4zs9JVVD/kPdFXV
	Dm2fvtLjSo1wxc9ndc6JDXRlA7b8
X-Google-Smtp-Source: ALg8bN4i0RJ0v7tpP0oWOr/Eix8gb5DtV96nKE4Yw+n8ZyKRqRQJh9VPSbUuqikO/1gpQxHtv9o/Eg==
X-Received: by 2002:a2e:561d:: with SMTP id
	k29-v6mr10021595ljb.91.1547743237046; 
	Thu, 17 Jan 2019 08:40:37 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:56 +0100
Message-Id: <2495a1572e1e482e3b1c2312af6be7ed5daf7f8f.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 11/27] mesa-gl: do not enable nativesdk variant to avoid clashes with main mesa recipe
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:37 -0000

An alternative would be setting PREFERRED_PROVIDER, but for native/nativesdk
builds mesa-gl is not a viable alternative to mesa, as it lacks all of the
bits that make accelerated qemu possible. Using PREFERRED_PROVIDER would
imply otherwise.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
index 73267eb4f0d..030db6c1440 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
@@ -7,3 +7,5 @@ PROVIDES = "virtual/libgl virtual/mesa"
 S = "${WORKDIR}/mesa-${PV}"
 
 PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+
+BBCLASSEXTEND_remove = "nativesdk"
-- 
2.17.1


