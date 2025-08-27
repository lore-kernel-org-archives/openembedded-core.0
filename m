Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC23CCA0FFC
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:49 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.6653.1756330249507335657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eQH8MH6w;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32326e8005bso315046a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330249; x=1756935049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryUeNSfEyGQHVMfue0MeK/2iDBg3avYcipDJTxqHuF8=;
        b=eQH8MH6wKCwrXPEgrcql+AHMPsJDxyz0+s5q9cnj/yrOanNCrbAToEQqjTAU3S+Keh
         yIXE0VS9PEMrqvOCM/QmywKDSJqlsJs9inJWappJGPsE3v/mnQPZWCikSOi97zapPeD7
         QQrvJaO67KzhTh4UWQS76u01+tVd2jmUP+gFmFas8eYFQIKak7cKxTW0eW1Dea77DxBy
         NMhakXE69HXeYsWdlEmHMV5RWxT7mXR5nHKBgSWGrRvbkYBLz3qD/Mk/fmdYlO+LQ3QM
         xwwzR4CoQ5zhRya52jtz5nr9+RPaGsVfHuU+PYnotsJH5+i8485Qymshcxwfv5yBDJPK
         NeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330249; x=1756935049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryUeNSfEyGQHVMfue0MeK/2iDBg3avYcipDJTxqHuF8=;
        b=mEd92WIHXEwKWM0g8mql347sObD/6Ten/XtBN81enq/0SWN4qvkl3mwd8hMlQU7LkW
         gbh1og56q+kyG92iC7z7PjALXEl1uC9VmQb0FQMkgJTxVRiduXELSOcfHN9cB/H82rhF
         B477BPrcPqVYZwArTbwnTV2FSTZJDkpsrhQBCcz1soiqltFZFft2Gpc5S22InONpBGND
         oET1sLeUmF3VXh7SojxDa4A3mS1f06qQBoUF2mRwrmhu6Gj60NyqkBhHYjIPRllTEdgS
         9DZFVMzgDiTDKae+byQsRGspo5eskVFgfJP+cvMcX3XFAQzHyKsqMcF0frlwhvQuAVPe
         ZmaA==
X-Gm-Message-State: AOJu0YxykInaNt9+hRIHIcmdbseM9v/EpSHMp/gwuXOQUsIms9iT3Yx+
	1gnoYj3G9llEMYHXEn6YoL30P7/llSPfD2U95dtGpoqWjYPIcvSwIsAYFanN/LrR8UQoXvbZhUd
	oZPgI
X-Gm-Gg: ASbGncuLDQhrtgzMeWzG0zA0gVkprJuHVJJrOYlA8mojai7TTOCytPY2WfkzQglM1ct
	ZztnbpI8mhT2pMs34LORXaaRkFeX0+Z5u4nfgVH40aRamv4OcEp3Ky/XfxZ1XlJtTLPqjFnuF4x
	MyoXIyAETDs5UwHBQWn18pCXnEbFqjdwFZ/sr1neAzFzuJ1Rsrff+hDiOtf7yM/pgawFu7l7A8K
	6vI/6ycOU96EGKF9WW3AZg95+/VI6JJBdDJMsa52MY1CfMQZKJL8Wea3BRAg85IC2ccrtihzFla
	NbO01yYecnE711XqxowIlPxrMlw3umn5w/K9XGzeTzqhi04Os+3wXvnwI0DBoTg1pkRFyOd84Vq
	gE5nDgBOFtjCcEA==
X-Google-Smtp-Source: AGHT+IF8mshk7/ZUKLg1J/2Zy7c8PYl0jfDvXfyAqbi27zcde6MZT1WVpYf7cjNBeAhHQLAqULjqjg==
X-Received: by 2002:a17:90b:4fd0:b0:325:c92:4a89 with SMTP id 98e67ed59e1d1-32515e3cad8mr23679980a91.5.1756330248781;
        Wed, 27 Aug 2025 14:30:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/33] cpio: Pin to use C17 std
Date: Wed, 27 Aug 2025 14:29:38 -0700
Message-ID: <874701c4fd96134e18f73eba4bd5c8b513ad251b.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222539

From: Khem Raj <raj.khem@gmail.com>

Fixes build with GCC-15 which is defaulting to C23

For scarthgap also add it in BUILD_CFLAGS.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index 95f82cdf3a..a5c9b76da2 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -20,6 +20,9 @@ CVE_STATUS[CVE-2023-7216] = "disputed: intended behaviour, see https://lists.gnu
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
+CFLAGS += "-std=gnu17"
+BUILD_CFLAGS += "-std=gnu17"
+
 do_install () {
     autotools_do_install
     if [ "${base_bindir}" != "${bindir}" ]; then
-- 
2.43.0


