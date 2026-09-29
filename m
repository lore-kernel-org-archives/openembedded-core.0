Return-Path: <gael.portay+rtone@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40CDCA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 09:30:34 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3881.1790674230401750727
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 02:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X6Z5vMlC;
 spf=pass (domain: gmail.com, ip: 74.125.225.99, mailfrom: gael.portay+rtone@gmail.com)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48879b94823so459817f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674228; x=1791279028; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yZOeQDU2i+DDpgVUzCXA1D8a71C9TnoUU7FAK7diSkc=;
        b=X6Z5vMlCiBUflk4WVZ2LQ98h5HXDsZOv+95aK5j3zFK/UbxUfNaBGoJZG17dugODjE
         8JGPrUJcaURCt040WQ3IvZehIGApzunYXZupSZ2CWNJirIs0gz8b5mJWBDmJyBd2Cw7v
         4ZBtCacSn625FlDv56XGqP9ZcvqqHn9gmaO9Pgp7Z3glhi8sVwwjyao4i8HD+X6WuJ0j
         gv2ju34LnubSzxb1aVjoFyzXabYJ+rtpR1h6BsEGGjnIKodXtbaePLyssHlns8vr7Lsw
         hvm1dGxozUI6Iz83ooIXIcc5dH8468XLXUJgcxfUee4VNaRpxNPPAj+/zuhug64jeR6K
         ESjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674228; x=1791279028;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yZOeQDU2i+DDpgVUzCXA1D8a71C9TnoUU7FAK7diSkc=;
        b=Pgy43CLMEyVI8uZ7JDh/pPhhXZwGDExmhODcTjDl/SJAHUo2JcRFEBPWSENzGTPXqb
         2ij1VPdrs/KX28FrHCpOskU7gfIgSkYjG6C+6BpxeCWUDdgsUYah8Ys9J7ZpinJFXSZ3
         TxmK8+T4zXT9wsadf54cyyAZKvO31pDhyfN/lL1Iu8OuRCkd2VEdCfhGWwbgUot8LaH7
         0S0YvmSJQl8Tz8Ssso1DYB/PbGmFdJOojnXfyaWtabesgSYMnRvvqAZ8FkIjyT/wFwGI
         +mne1bZrMTD5e2+gpZmohhmJOL2WsJgr5GWgNqgt75qOKMvm1j6FFJmXTy9bV+JdNZVA
         679Q==
X-Gm-Message-State: AFuF++lW5gEsTeD3EpaaTKaaUogFzZvy5yypAR3Ec+SHNjHzUY+tPGqh
	2sdqBvEQuJXKSYV0Et/3CK8ozhGJbUhwR8AivkzAVITBeZ6J1b7gEvR5v3WkXMZ1
X-Gm-Gg: AYBFou3dAiSvB/CAkauTa1SQlmuQ23po2PLc8nQhhMJRIjNC8gwyjzrnBqobz4kiZYm
	UGnJTEleimDjF1P2vmR4bzYX7B7XGN3c/N/M6modoJvltlqHbOhf+H2u0NiKmDD1vAQPGsO/gf3
	zkbgjZ4d9XelRrPT9onbayBdKSCV+AVwRqu5gthWcQ0rB97zHAn6emUIfvsSiclsWCwujzxsCsl
	IwrLwfJLwpg5DHFhsvDeJDGSAVjT7FaN7Oczfwf63msNNQEPaygjScyVey6XT+/AYrYnm4qfq8e
	WG5v5uUGIRQLeSnSf9eXsXGCsRzmgCGMQVcQTq/FNJQBvdFD6aIsDgY8TU3gZJM7vblX2Q29q3U
	MUJT7Ns/EW5jWH1efp2grZj8tT3qMRo+WhYkV2/oELdaGL/vgvlaCMvPj0fZCbvURM47b5LxPFl
	rsva8ptN1n6HbK2ooULPheHLLpdZYWb9TAbqQ1ApKnS+YuVXgGhuSLD/OIsCZP8DPNHfqcqdu2a
	UO5gPcO+anTGnC/g77BgXf2pERXxfPORc4/ew/JFIc=
X-Received: by 2002:a05:600c:c48e:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-49fedd2c6dfmr189061065e9.0.1790674228320;
        Tue, 29 Sep 2026 02:30:28 -0700 (PDT)
Received: from chipmunk-161.. ([212.114.28.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe0ea4sm74150145e9.3.2026.09.29.02.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:30:27 -0700 (PDT)
Sender: =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay@gmail.com>
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Subject: [scarthgap][PATCH] connman: fix syslog identity with glibc
Date: Tue, 29 Sep 2026 11:30:09 +0200
Message-ID: <20260929093009.847328-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 09:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246849

The connman syslog patch modifies the handling of the ident string to
solve a build issue with musl. This introduces a regression with glibc
that does not make an internally copy of the indent string[1], while
musl copies it[2]. Thus, that change is unsafe to apply in the glibc
world.

Also, syslog(3)[3] man page tells:

	NOTES

	The argument ident in the call of openlog() is probably stored
	as-is. Thus, if the string it points to is changed, syslog() may
	start prepending the changed string, and if the string it points
	to ceases to exist, the results are undefined. Most portable is
	to use a string constant.

This removes 0001-src-log.c-Include-libgen.h-for-basename-API.patch[4]
from the SRC_URI if libc-glibc overrides so that it is not applied when
using glibc.

Note: The patch was submitted to connamn, and was never get merged[5].
Moreover the patch was removed from poky after bumping to 1.43[6].

Fixes:

	Sep  7 06:10:36 qemux86-64 daemon.info ^A[776]: Connection Manager version 1.42

This fixes commit 992d59564b84333740e6465ec696238274b73938.

[1]: https://sourceware.org/git/?p=glibc.git;a=blob;f=misc/syslog.c;h=b7414e7b43a510342273bece335b4258e8754905;hb=47dd7e0dacf50c740b04c78d3f85fbf983d53aba#l338
[2]: https://git.musl-libc.org/cgit/musl/tree/src/misc/syslog.c?h=v1.2.4#n64
[3]: https://linux.die.net/man/3/syslog
[4]: https://git.yoctoproject.org/poky/tree/meta/recipes-connectivity/connman/connman/0001-src-log.c-Include-libgen.h-for-basename-API.patch?h=scarthgap
[5]: https://lore.kernel.org/connman/0caf957f-e046-4453-a8ae-fd6c994ac95d@gmail.com/
[6]: https://github.com/openembedded/openembedded-core/commit/467d28f5d243d821722cf8dcdbb9675a2820cd4f

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
---
 meta/recipes-connectivity/connman/connman_1.42.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/recipes-connectivity/connman/connman_1.42.bb
index 9b3abbe258..5c8bdd43f2 100644
--- a/meta/recipes-connectivity/connman/connman_1.42.bb
+++ b/meta/recipes-connectivity/connman/connman_1.42.bb
@@ -5,13 +5,14 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
            file://connman \
            file://no-version-scripts.patch \
-           file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
            file://0001-src-log.c-Include-libgen.h-for-basename-API.patch \
            file://CVE-2025-32743.patch \
            file://CVE-2025-32366.patch \
            "
 
-SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
+SRC_URI:append:libc-musl = " file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
+                             file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+                           "
 
 SRC_URI[sha256sum] = "a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c20283ac0ca81423c2aa"
 
-- 
2.43.0


