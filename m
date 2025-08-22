Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D30CA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 14:25:55 +0000 (UTC)
Received: from bumble.maple.relay.mailchannels.net (bumble.maple.relay.mailchannels.net [23.83.214.25])
 by mx.groups.io with SMTP id smtpd.web11.11374.1755872744956904915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 07:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=Odd8/Bz4;
 spf=pass (domain: rootcommit.com, ip: 23.83.214.25, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0793622C93
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 14:25:44 +0000 (UTC)
Received: from uk-fast-smtpout8.hostinger.io (trex-blue-1.trex.outbound.svc.cluster.local [100.96.9.136])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 57514240F7
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 14:25:43 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1755872743; a=rsa-sha256;
	cv=none;
	b=jruPKcHmdHMZmrD+t72Wa0W35pz70xPqZiUBst8M729DVGad8Shx/yhP3kWP41yJyh7MqQ
	a1L3rJeXgyabT0l5yW2qQDuYstsdcZ7246H/1c79dip2DIpW8n7ZG65Yq7jUVZc3yqtWwE
	FF5NuhplLTgZ6QDDZ3inyxUlGfrNOa/tCZ7NGzxggUK2MjqvXz4s+Kzhb41G0l97Jbpfp3
	Usl3gHCNv3jZ7eyoXGwcnZDb7cmJaPGjv0dQbEOGST9JzExAvWLWLZtVaWzkfdaIks3XIQ
	YopU6YNNc5CNYJRNhbIltzpk6NVsp0F/rpXijc5BTnGg0n518SmOWbXn2L0AEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1755872743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=kMVYFSnQvo4m+qaMnKn1VJtLCS/je2J1ZU+Q1Q0P+p4=;
	b=9zSwj6YVfARTGzqcpLAAEk7yc2x4WtcxqhyDC5iZ0QHyRgY7GxG3dviP2L9DrM/MmZ5l7n
	fk6Q45aQtUdJnnPBFq3p0hCmKYjVkjA5KVKrEiTPfll1/u5bS16Z4b3gm2WqZNQQtTXRPP
	yptbmoDS6HEZFYbLbNbxx1gcXDudvhhbvQSmTbuqw+RW6+wZyuAeAz+nUNatXqw2FpzZpn
	frGRUBhiWAsyPZqELCfLfwa41KF/mXyWjrIq1HHnTB3PiI+RfIWK/DtPK0DnOdu3M8Ni7v
	+QKFVAaIlRanDlP3sA6TU76FjMu9Prm+HaeCbdaS2uqACW01G760jJDEBITLCA==
ARC-Authentication-Results: i=1;
	rspamd-6b4c98bb9b-zfwct;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Coil-Duck: 3721c85d7bf3e66a_1755872743836_2502817430
X-MC-Loop-Signature: 1755872743836:1874780623
X-MC-Ingress-Time: 1755872743836
Received: from uk-fast-smtpout8.hostinger.io (uk-fast-smtpout8.hostinger.io
 [31.220.23.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.9.136 (trex/7.1.3);
	Fri, 22 Aug 2025 14:25:43 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4448:6b00:d2cb:e819:c16:3b7c])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4c7jCT1KtHzPJQb;
	Fri, 22 Aug 2025 14:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1755872741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kMVYFSnQvo4m+qaMnKn1VJtLCS/je2J1ZU+Q1Q0P+p4=;
	b=Odd8/Bz48BnRKY+i3j9g3EyiMg1raYLSV5kJIx0RJ2ASfRIbi+Tnv4cjvjec5yWaKkPpIX
	Lh2OKRvdriVniJYAWdatsjrtQWkjeD6liIRqixP40TUIE3DQUobZ1d/uWKxDLzck/Tdbi2
	8D/JhIsnvDv14sqh+1VXN4vwKxugksbBZ5mDL5BJCkOKXu952uAOa033b9Y+cbTJ4ploGa
	BnzPuSwzR5s4Lgd1iFyOjD1HWgT2Q26oXaUav0HrHpJ2c4ByrP5dqie2DzIPTsb9DluGqB
	4uR8mU8lz1yxRSKLxruSmoe53pzdJTy9YII7nqkmwarL5df3qZVLcGB7EJJ62A==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH] lighttpd: upgrade 1.4.79 -> 1.4.81
Message-ID: <20250822142447.222477-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Fri, 22 Aug 2025 14:25:40 +0000 (UTC)
X-CM-Envelope: MS4xfEJOxdwBBD7w+5n2p/aEX5yz0VPeY3bk0LGv9FHscO3V/K8dzGAGFLYGe4eI8cMx3oYr2KqUK24ZxASvnUqTcd37z3I2CQ3JWoRkzMdh0tfQaKpmsJBz hpxRf/t381n2H3LFaOrsal6XwtJUuzuRdd07aCNPu8MQpW+H3zX6QX4O2LPo2A7fJSxLk7QEPkryozGGpMlfj3g7Ziaj3eAKZl8+Qq1wqymfBaSNZgSQW7O7 CdFrqBamdbtmGqT1MDS4pDDaSe5tO2y/B2HtSTBW5pfrsILh9gi8AtQGVK7KB13AkfYbE414TjVQu5YHzGqPdpYqyhiQk5Xneq/j5OSaklt7uu8pN23xz4Uf 4+ec34vX
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68a87de5 a=JoLFIMGfN0f3S/O5RYgKwg==:617 a=xqWC_Br6kY4A:10 a=Y8zkqK7kAAAA:8 a=d70CFdQeAAAA:8 a=z30WyHCAtYXQorjMgUMA:9 a=PMfRXvGH5xpD9em-gAiF:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 14:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222332

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Remove "libev" configuration option, no longer in use since 1.4.80

Upstream changes

1.4.81:
- security: fix to reject disallowed trailers

1.4.80:
- detect and issue error trace for HTTP/2 MadeYouReset VU#767506 CVE-2025=
-8671
- stricter HTTP request/response header, trailer, and chunked validation/=
parsing
- support HTTP response trailers
- support HTTP request trailers merge to headers (if not streaming reques=
t body)
- bug fixes

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 .../lighttpd/{lighttpd_1.4.79.bb =3D> lighttpd_1.4.81.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.79.bb =3D> lighttpd_=
1.4.81.bb} (95%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.79.bb b/meta/rec=
ipes-extended/lighttpd/lighttpd_1.4.81.bb
similarity index 95%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.79.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb
index cd6790dff9..40abef784b 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.79.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "http://download.lighttpd.net/lighttpd/rele=
ases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
=20
-SRC_URI[sha256sum] =3D "3b29a625b3ad88702d1fea4f5f42bb7d87488f2e4efc977d=
7f185329ca6084bd"
+SRC_URI[sha256sum] =3D "d7d42c3fd2fd94b63c915aa7d18f4da3cac5937ddba33e90=
9f81cf50842a5840"
=20
 DEPENDS =3D "virtual/crypt"
=20
@@ -24,7 +24,6 @@ PACKAGECONFIG ??=3D "openssl pcre zlib \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
 "
=20
-PACKAGECONFIG[libev] =3D "-Dwith_libev=3Denabled,-Dwith_libev=3Ddisabled=
,libev"
 PACKAGECONFIG[mysql] =3D "-Dwith_mysql=3Denabled,-Dwith_mysql=3Ddisabled=
,mariadb"
 PACKAGECONFIG[ldap] =3D "-Dwith_ldap=3Denabled,-Dwith_ldap=3Ddisabled,op=
enldap"
 PACKAGECONFIG[attr] =3D "-Dwith_xattr=3Dtrue,-Dwith_xattr=3Dfalse,attr"

