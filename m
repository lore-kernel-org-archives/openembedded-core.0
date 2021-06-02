Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.13090.1622640444839178057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 06:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rhnv7WeB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so1292510wmc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EUIo3sAMnLCpj5YS6raOIctzL0ChJMzqv7HJeUTd8Kw=;
        b=Rhnv7WeBbwfbnRQLMTph9dHpxFxpC/RprGNoL/POdCBBv+3uLc8qjqPBskaB1uYn1Y
         xxxsQmhye1CNnCgjTIXmjkLJsOlZU2NSAPhvPCHlKrArjbIt3NfACuTSI4yAEd4iNvWB
         Y8xQoKZ/sLh0S/umC/MzoxRBnzTUzvR5eibXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EUIo3sAMnLCpj5YS6raOIctzL0ChJMzqv7HJeUTd8Kw=;
        b=B7qAw9ron2yL1HRBp+oN2OkQ4bbkppZcuOH8roUw79Gb6zNnTCsZsF/MtRJTvShzem
         2WkR4NzOAphwM6FLQXvGNzNS3qvpnGECFPgqFYkwoaVJOGTZ/ajcgfkbaJ7GqnPb+rFR
         MHUY9MZMJQ5d3CA8318Lm551rPa1wtIE9sEja/qGRkEShK6HKPAHQHv1Ko8ITTEixnY8
         lxck08u22zIANsrn2a/C2JTmYdbn2Pv4LixKZew2Cf5zVhjppZACdPIp8h5uYfSgU5h3
         AFFmYrGs3XXA7ugLeHMnzDJmCxP19Z/4Ro9ow/Lfh3jNV7pd2ooFzfhMcsS5zter8Ia8
         KDdg==
X-Gm-Message-State: AOAM531jFO3yYpHKJSBzaaFAq7GBGB+8eZTajt6DJTE+RNnvtvau+5ep
	foxFqCP+AKJtIo+2yVzBW0jPiLM1gcpFkw==
X-Google-Smtp-Source: ABdhPJz382u8IlRZDleHhoVBUjL6+QM86SifS5dVz98K329lGl7dqKHL+zRfgLMKJWsKdi24dvLDpA==
X-Received: by 2002:a05:600c:4145:: with SMTP id h5mr2313271wmm.124.1622640443292;
        Wed, 02 Jun 2021 06:27:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id i16sm2799498wmm.9.2021.06.02.06.27.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 06:27:22 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 5/5] oeqa/runtime/rpm: Drop log message counting test component
Date: Wed,  2 Jun 2021 14:27:20 +0100
Message-Id: <20210602132720.2921099-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
References: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This test is flawed since multiple parts of the system can write to the log
and we obtain different numbers of log messages depending on factors we
can't control.

Drop the log testing component of the test.

[YOCTO #12465]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 8e18b426f8b..7a9d62c0038 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -141,13 +141,4 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
 
         self.tc.target.run('rm -f %s' % self.dst)
 
-        # if using systemd this should ensure all entries are flushed to /var
-        status, output = self.target.run("journalctl --sync")
-        # Get the amount of entries in the log file
-        status, output = self.target.run(check_log_cmd)
-        msg = 'Failed to get the final size of the log file.'
-        self.assertEqual(0, status, msg=msg)
 
-        # Check that there's enough of them
-        self.assertGreaterEqual(int(output), 80,
-                                   'Cound not find sufficient amount of rpm entries in /var/log/messages, found {} entries'.format(output))
-- 
2.30.2

