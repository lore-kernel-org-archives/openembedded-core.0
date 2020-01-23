Return-Path: <danismostlikely@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8F2CA7F87A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 21:45:09 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d10so69296qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 13:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TO7z2wBNB83WUqXGssenTLf79p+/ACLJSlKWtj+TjKQ=;
	b=rTLV5A7IO+qy+L98RAdFOYpQrodyNH1BNXrOqXKoX+mA7BzDaB4Pq6vg93MTeO365x
	H1x8kR9/8ZzZ71auInSCE5woxMNO7anoFPlaKiPtSnuyky9xQMVbrG0TLLXm34+iLrM4
	lClW9WYcnTunmUbS0uWrROx9wfOz9YyFAGvBuQnKxSjqdCsXp/kGI/d/QoLG0y/m8I7e
	94whtgjB1vxoJJLKuR1uz82b5KB1pMyjV5uUFmJVoVgdwNqbQyyDAI5+Zm6R8W4n0r9b
	Vhw2/tz9D0WCQyXQ1lT5ujt1BUIfOEi8wUqfEOY4PjlE1wxivIa6jEwGlEnIeNuci9g8
	264A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TO7z2wBNB83WUqXGssenTLf79p+/ACLJSlKWtj+TjKQ=;
	b=dvZhviExuWYkg2KbKpFLLTdRddxKJOtvmeNRuWp3L1rFJa+h809PK3s6gw7eUobFe3
	Ycfr3/bXgCFArYtynVTnzJnrn6GjmeY5rOh1nTcZt+2SCmXigR2DIRHvu0Im2GGOVJCe
	w7XwYg4NT2XycF6vWqFNqVa5iUiHpzjXNZC1Hur3kQiaCEjptCfgJxFQwAXYTvbkYgSp
	QxIrT5oJpFFFREtRz6DnZ9M26+ImxMNDKPlwMutWm//WrUj5VvIe2u3eM0/AST3qc0NT
	dQfnf2LaO5/SjYOeroktAlGr/jjhut1mmyXTPl4/SQAv1wqmyQCUaUXZUmPjQJknWuk8
	lA+A==
X-Gm-Message-State: APjAAAWIfwDN9lRNr4tRpNV/QNMifnuDu8jFghqPzw4T6eCsrd2JDSpK
	lcWqIaPIlfBLuOcquqpr1IKv07oI
X-Google-Smtp-Source: APXvYqz5ax1r+Vde+fhJCaLMf5apoMJXtEtP/+BqD74eHLiMNz4R9vKOZK7sUjn5mQzcyB2fJjplkg==
X-Received: by 2002:a37:ad17:: with SMTP id f23mr350717qkm.24.1579815910101;
	Thu, 23 Jan 2020 13:45:10 -0800 (PST)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	d25sm1706243qkk.77.2020.01.23.13.45.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 13:45:09 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 15:44:41 -0600
Message-Id: <20200123214443.1431756-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123203037.693694-1-danismostlikely@gmail.com>
References: <20200123203037.693694-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/3] procps: enable optional systemd support
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
X-List-Received-Date: Thu, 23 Jan 2020 21:45:09 -0000
Content-Transfer-Encoding: 8bit

From: Daniel McGregor <daniel.mcgregor@vecima.com>

procps includes support for listing the owning unit of a process, but
this support is disabled by default. Enable support using
a PACKAGECONFIG that depends on the systemd DISTRO_FEATURE.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-extended/procps/procps_3.3.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipes-extended/procps/procps_3.3.15.bb
index f240e54fd8..17abd96dca 100644
--- a/meta/recipes-extended/procps/procps_3.3.15.bb
+++ b/meta/recipes-extended/procps/procps_3.3.15.bb
@@ -24,6 +24,9 @@ S = "${WORKDIR}/procps-ng-${PV}"
 
 EXTRA_OECONF = "--enable-skill --disable-modern-top"
 
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
+
 do_install_append () {
 	install -d ${D}${base_bindir}
 	[ "${bindir}" != "${base_bindir}" ] && for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i; done
-- 
2.24.1


