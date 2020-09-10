Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.20718.1599740603220801832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YhI+yUl+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id y15so5608246wmi.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ynhuv0t6vADpCcmlkh3E0YDMaGpBtyIDGG8O4lqlgoE=;
        b=YhI+yUl+SwO6cQUQO2RKJMjAh9RhdYJ4V6wGxl2tA0Q8miRYHY0rMhbDSr3l+AHnac
         HXn4+nRyf15XJudPBbD3Aa3IShzzLvRyUbQuoV/15jueGWVy0qkWWM0LDfTiG8/MbnIK
         r6GJ7+GP2lM/fclDiKn/rxjKydT0WUQ2EGzWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ynhuv0t6vADpCcmlkh3E0YDMaGpBtyIDGG8O4lqlgoE=;
        b=jh8KvfUgGvZChC4YNP65Bj2qT8Exu1vUHhDjMrLhpHCvqbNsoiJ3IFb+g82jBQMtQ+
         jkNFbjihdA21E9m5GFotEH5qoQY7/tjcxiUYeRcFOBgVbEahxL1ub9ugyO91FbBR+85R
         acqonoU+GsZcJn8ewe0bs1GqFBUbKHwh+mHpCUKnUHfgL7PWLJzW+nGP6B3i3X2qtJOb
         0rXj9h6SZ1ki8ZTVLWVTk/X2OuSxZyQ37xrI9qfLZdBCEf6K6rd6puhWehqj+BQgqwLh
         3vsCFp0wp7wUlwmB6hRAPNmxCbp8FBHbUiw1p9daMJfF1ZfBto7u2A1A47otX6EXUC2a
         Ri8g==
X-Gm-Message-State: AOAM531+ll47BktMuM5OzYf4f6Onhpc1SmWnHQfqkvUfwr7Y+Mu7Jjd3
	jNW92g0w4DzsCYLbYNzkMFCSv8gZL+LL6w==
X-Google-Smtp-Source: ABdhPJxWBfeU/sIOSmALD4mdaNOseM7PcJXuhNEn23X+MhI/rW1Vr6o3Mrldz2UhnBtfz9oz1A+yOg==
X-Received: by 2002:a1c:cc0c:: with SMTP id h12mr7953419wmb.57.1599740601366;
        Thu, 10 Sep 2020 05:23:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:20 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 15/22] oeqa/testsdk: Use original PATH
Date: Thu, 10 Sep 2020 13:22:59 +0100
Message-Id: <20200910122306.2040194-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We want to test the SDK with PATH from the original host, not with our own
tools injected via HOSTTOOLS. It even uses some tools which aren't in
HOSTTOOLS.

This is necessary after changing the SDK to not reset PATH to the system
default which is bad for other reasons and brings the testing into sync
with that change.

(From OE-Core rev: 87c9602fd0dedc7bcf75b822aaf5f6ebfc17737c)

(From OE-Core rev: de3f405b6cf96311ced86bccf7202370e4d1481a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdkext/testsdk.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 785b5dda53a..c5c46df6cda 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -25,11 +25,8 @@ class TestSDKExt(TestSDKBase):
 
         subprocesstweak.errors_have_output()
 
-        # extensible sdk can be contaminated if native programs are
-        # in PATH, i.e. use perl-native instead of eSDK one.
-        paths_to_avoid = [d.getVar('STAGING_DIR'),
-                        d.getVar('BASE_WORKDIR')]
-        os.environ['PATH'] = avoid_paths_in_environ(paths_to_avoid)
+        # We need the original PATH for testing the eSDK, not with our manipulations
+        os.environ['PATH'] = d.getVar("BB_ORIGENV", False).getVar("PATH")
 
         tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
         if not os.path.exists(tcname):
-- 
2.25.1

