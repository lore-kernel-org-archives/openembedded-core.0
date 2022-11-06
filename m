Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C93C4321E
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:21 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.16786.1667744293403046839
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=75Ec9WvJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id p12so3425920plq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h6weqAD9xa3p3LV0uS4nscUohy13EduPZcOMzZg4x0=;
        b=75Ec9WvJNGYsXIfji1S08JwR8OahtojnuTUL0lP+YSqYEk8SvW+pSdlQm0qkeLNOcF
         qP3hsl4vCXgRVkuiR+1jaNjyeizQgZV6am9wrg+hK0W6SbxpbnjkapLct/qt7rO040kj
         5lVkW/H2HqjdHc7FgxeK0clB1EoTWgVdwQl+2QmuCm5To+ZfctJSNKOJNwy4Zk06mzsO
         HWLkl65qGkMDlIk4+xTX80kwq3f8q/A9lMa26fG3YW/fvuNebn6OEVEhItLGcBEtlQrE
         LcB+an35r8F7OQFDhGrUAgOscxmOn1WT3De05uSGFpEH2j3TZ6oFI/lptRl+qntIAT7n
         Heqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2h6weqAD9xa3p3LV0uS4nscUohy13EduPZcOMzZg4x0=;
        b=MiFxE2/BUn1Fxz9v3dd+bg05QuT2+vfh0A+nUT6cfdb0+TOYXPszgl+jP7G4ms9jzy
         ytzP2hq0TvB+FZ3F+pQpd/N95v13/2eKCDJqnqY4gVSgmBnLIltPp8mn32z9e/A9oFBo
         g8aYngN6ZVoL8w0NYw0ZVqbk1YKbOTLQsUkFNozvYF/5lEGdgGrrqcS2C/0IvZCvToUM
         OxV+CGkqsl6eDmDWIhwfsIkRz8cOxgde6ogKAEiTg8rHkdB9oqVIAheQ8U9B5G0WP1LA
         HkGpTOjaWn20JvPD6H2M43n6/jPuMFVYSPfPafHm0rNDTQc1tAuVOidl/d0Q6lPde/+b
         gvfQ==
X-Gm-Message-State: ACrzQf0Amc4juenKU6pK6vwV6xBFpy5gdDuXAwt4fRQa2lWKLx30l85f
	WwDB+rX8fhbObAp0iO+7uauPs2nfVeudoCNg
X-Google-Smtp-Source: AMsMyM4WOwXbOj6FXpXx579c6pbog8QMsWWW2IFW0ixmCRRKZ8hq00WxjUDHSKfJkBzN1lDxxabuig==
X-Received: by 2002:a17:903:100c:b0:186:63a1:3b5d with SMTP id a12-20020a170903100c00b0018663a13b5dmr46782371plb.148.1667744292507;
        Sun, 06 Nov 2022 06:18:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/34] kern-tools: fix relative path processing
Date: Sun,  6 Nov 2022 04:17:04 -1000
Message-Id: <d56e29947176976e172a3e731a6ae37df98af4bb.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172789

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The previous fix for processing of paths with relative components, broke
uses cases that were a mix of patches and configuration fragments.

Updating the SRCREV to include a simplied fix for relative paths, and
a cleanup patch from Jose:

[
  Author: Jose Quaresma <quaresma.jose@gmail.com>
  Date:   Thu Sep 29 16:37:23 2022 +0000

      scc: only look for error in scc_output_file if it has valid content

      When process_file function fails the output of the processed script is show to
      the user, some parsing is performed as well to look for common errors so we
      can point to the right input file.

      This can only be done when the scc_output_file have some valid content
      otherwise it will show invalid messages to the user.

      Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
      Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

  Author: Bruce Ashfield <bruce.ashfield@gmail.com>
  Date:   Wed Oct 5 19:13:33 2022 +0000

      spp: ensure that prefix check uses absolute paths

      The previous fix for this issue was too broad, and impacted
      all calls to the prefix check and removal. With this change,
      we only expand the input on scc/spp operations that may
      execute with relative paths.

      Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 533720a1756454447341769c4a0969fce8d6f287)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index dea7b65a7c..07d7daf5fb 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "ba600ef61a85966596126a6e8d936971905e8749"
+SRCREV = "6a4752ebbe7d242c02b3c74a5772926edd243626"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.25.1


