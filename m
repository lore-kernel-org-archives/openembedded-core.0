Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F770CCD18E
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:11 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.2333.1760064667024275988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MwCa+ntT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77f1f29a551so2189540b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064666; x=1760669466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TufANuGo8VJH9dDQuI3N+KNK4NxmchWvFvC25C4PMjs=;
        b=MwCa+ntTW7S2j2xBRtSfZkIqWZu0mmcZa0GhMiZzlM6TUoup3ewdI+tj64U+NTxDMI
         qXXYCY0HItofpyR/PCtIAuGIIAgeb4ZSfFw2IavWyKK3Nmm5hoDyD5m95vvtow+Ni1LA
         8ltMNB8ILwxNqg5jShqv6vXAv7ulY2NLAeqMy5glTiyp14NV+y+iilTL5AExLYI18hiS
         uSk6iDE7UvUqdZNeWYSM3hxcXEs/HOIaUGICiiklLjv53KWiC8xebfxAGU2Atg2QmlB5
         ih6ELMnPW47mRBp7b14vxDbuSBpHNBY2sFPNuEMFjsODRhHwtDJdNxiHAvvWnaeUIVkM
         gJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064666; x=1760669466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TufANuGo8VJH9dDQuI3N+KNK4NxmchWvFvC25C4PMjs=;
        b=BelJE4b1QcnP13gD7nuKtDepEGw4x4tR3e9MbUntdbqYn0c0/nskIMJm8VTPzP5Rnb
         mx1QcR7LnnaiSKODASf/HgMVHov0/yKb6Xa3VT4+MyTgvnip2AZ4qg+I49Z6viTIRU80
         eWHwTX0ifBpGhEnW9ZcIORWr5L/fzZwDx4Pab2IwrDEBRdI/fo8qcX3l9SY8Jyu4Qcqx
         awiSe2HYc72xg0dfc8qewQGIIkUrs2V1MALAubgqCXDOqfbmKEtMpkLFbuTs3oqqrsvs
         hlAVdruLHguSK2yXcBW4tK55v3UjhtGZuWKGTpe9N/bVKdR+IvW0rV4+aoKnwbC92Ohb
         OixA==
X-Gm-Message-State: AOJu0YxK9k+DVT5Kr3p2+BdIrHR1ehdsSvZfWJpq7a79hvYw3vbHgGau
	sn0NWvatGG4gou/TkrGTXt/gJJUbPbXWbUV8Rj76kkeegKkOaqfh/E0J/n2Bq5BbnW26vdtJTSG
	i/WvC
X-Gm-Gg: ASbGncs/iVHMUnSQCR5cDmHzSEGCFJW+79jWg8yuquYgoh7PYURId20OX5YJNgqoCpq
	Beayej/UM/sMCEA/pce2eQ0yerbzCK3M95Cjxxsox9ldgD7Pbb5pr/zqAIYhs5wgIRMVbf7H41Z
	71eNU7Sg0ow8iB8XRKTQoe3L5+An9ik/JPaA5yH9kM4kq7MbC7eAW/QojmL3yLVf34cSlRlnEbE
	7VBE4q2OdMyCI0AuI9bBNh0Zguh1G7mYlrJKdJcB9Xw09Psa4BPQmaou5Y500MX2xF+f7wkdgpR
	XxR/CXRgzAxur9b4TerxXj2Dj6PXBIxwqEekTriEpdeSXuS3iIXeEGEb5p2Af8y8wmmFGNpJnhx
	/3iqosY/bXPg8wCoWf/UmTD+DfeBFNxdy
X-Google-Smtp-Source: AGHT+IH9c3ll5KrF2VSbOopNCBvxp18oDWZYw610Vv1lIJ8O44FqgLIqLbUjO8rFFKzGSr7IuP7zig==
X-Received: by 2002:a05:6a00:c8a:b0:77f:49da:166f with SMTP id d2e1a72fcca58-79387829873mr11392050b3a.25.1760064666243;
        Thu, 09 Oct 2025 19:51:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.51.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:51:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/18] scripts/install-buildtools: Update to 5.0.12
Date: Thu,  9 Oct 2025 19:50:33 -0700
Message-ID: <07a17bbae81954796710e2e80cc386268ac5fabe.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224658

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.12 release of the 5.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 0dd23fe0e4..a449e45cff 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.11'
-DEFAULT_INSTALLER_VERSION = '5.0.11'
+DEFAULT_RELEASE = 'yocto-5.0.12'
+DEFAULT_INSTALLER_VERSION = '5.0.12'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


