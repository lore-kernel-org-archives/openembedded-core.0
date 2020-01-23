Return-Path: <danismostlikely@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7885E7FDA3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 20:30:59 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c17so4829585qkg.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TO7z2wBNB83WUqXGssenTLf79p+/ACLJSlKWtj+TjKQ=;
	b=avFZOzpD4gqxan8FyOG3zsYF0J2uByZztlgxmbENgt9by5arYLZXa7TwHm8441BWhR
	9b2yk1bxSeYIxrRc+IpkSkvfEHxj2qD4SfBxkAmgK7kTMkSuKNtr0u+fy2G1+JWV+uLt
	skmhGeo/6rCvyCfoC0BSHKb0nW5u1gAqftVeKWOyqKQD6MnWzs7GdQY4u5/D7ZcQqI/x
	aZwDsExJ7EtOaHOflu4Pyz5MY0DwdKhZY3Fd7yrgOyGJX0oamL3ujCMR7qqV0GmTMzuV
	d2VyeNNl1xEcAQ6kv7Ld0b/FesJYEFHhCrnpvZJU5hPeqk+2165P4hk0FY8hu7s7RGy+
	//hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TO7z2wBNB83WUqXGssenTLf79p+/ACLJSlKWtj+TjKQ=;
	b=rQ7XDQhnx/tVLg9QBXn9a23PG8rpYMfDYttttU6QROB0iHAMO2DrGBzNm0u+JKM/IY
	BvTkCy5ojeL+DZxZ3s/5y290sWBfPQSdoOuCndDB+u9Zt5HCiP16aD5zTvNTcEnBDZ68
	SonwyJhKcXofpRTPaTc7wdEhawjzD8hJduFSEQwCckXMgp9RPiHVFS11rFN47z3T7bUg
	aE9pD4W9z4csrnEtiD918yoplS7q+LDqPkZ9N3I8ijbIwFkW88btEzw7mMH6fHOvp7Ik
	StOlmsCGAyJdrn84nd50kQCKpOhMLWZedRuGlrFXclaCtdcFVjJ3AUvkdChkaeIH4uJa
	0X8w==
X-Gm-Message-State: APjAAAXQo4KdOZB+gIY0KgsJAK4n/i/VPr7ON8g+h7NCtnzzTfAMSXMv
	2ba9qeM46ithKBOLVYh3bL48n1dK
X-Google-Smtp-Source: APXvYqzNwiJTYDSKFAYLBgKaGs9QCSdFaefISJqlUluzly/ehSA4R1s8lplOTPycaPzy0bsN4MOWhQ==
X-Received: by 2002:a37:483:: with SMTP id 125mr17538672qke.377.1579811460012; 
	Thu, 23 Jan 2020 12:31:00 -0800 (PST)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	w60sm1584244qte.39.2020.01.23.12.30.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 12:30:59 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 14:30:35 -0600
Message-Id: <20200123203037.693694-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/3] procps: enable optional systemd support
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
X-List-Received-Date: Thu, 23 Jan 2020 20:30:59 -0000
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


