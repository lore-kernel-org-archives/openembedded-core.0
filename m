Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1020475560
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:36:59 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t6-v6so29457249wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+SnBywMU7jJYFR+3CmpKP/Ocmslh/UQIulpOwL+7Pl4=;
	b=LBtFiq0vkiQ2YVKOGezQo9B4X4UU029D75Z6og8d2348K/y1KwvpMSdeO7N9ioOWzp
	aECoUEEcPQEESdtZj98vhEdfB+LptbpMXD6pQ3ARdp/LlyrbbnFVL32pfVADw2XLK3Jo
	rAHYq9DfcqbwHG+4hefiyvVQDFu0v5sj3tIHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+SnBywMU7jJYFR+3CmpKP/Ocmslh/UQIulpOwL+7Pl4=;
	b=qs+UPgA5TLyd+DspiyB5KCI98crUOdWbGBKqfWbH1j8WB7VLTKHTuFlW6Cvj8oy8Yp
	nEkRbxChz3fIK54jV57uwfYie7zV4bPp4w1gNobntonbfLKPVfb+MbMOQuRyxMhcogUF
	mnEAGkVCdh1vdyFXFxiYhX9JjRdlANEqpK4EaH79KaElNQKDAis3lzIuQHZwEPbtsdjl
	1sWkkoWv4bVNMZ2S+8JDfFSrjnVsz1N4T+JqXHYWB/kU0W3BND8AkK7H7TvlxBzX2EOV
	ZVSIJvEHAUMOoSxHfQLECIZzhFK4rDU+Fzju2OyPzoXWbNSfD+HuNbm+7NUv/2hSNsXz
	gghA==
X-Gm-Message-State: AOUpUlFYg2yl8FWRQAWeZU4Ng+aS3npCcGe1vs8jtHrQkn+XqgFkjQYc
	WxAEtno9rC/QJ+RvwXn4/psLv34z3tU=
X-Google-Smtp-Source: AAOMgpcNvKxOzNjvc3PQ63wro77XQeUW1II568RSmwHTX/3gK81/f6ZHlDu63dFRBa4zETA3/W+XYg==
X-Received: by 2002:adf:a14a:: with SMTP id
	r10-v6mr9566216wrr.104.1531669020622; 
	Sun, 15 Jul 2018 08:37:00 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.36.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:36:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:40 +0100
Message-Id: <20180715153641.21029-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
References: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/12] oeqa/sdkbuildproject: Capture output to quieten selftest logs
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
X-List-Received-Date: Sun, 15 Jul 2018 15:37:00 -0000

Only show the output in the failure case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
index 4e251142d7c..0519911e8f4 100644
--- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
+++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
@@ -42,4 +42,9 @@ class SDKBuildProject(BuildProject):
 
     def _run(self, cmd):
         self.log("Running . %s; " % self.sdkenv + cmd)
-        return subprocess.call(". %s; " % self.sdkenv + cmd, shell=True)
+        try:
+            output = subprocess.check_output(". %s; " % self.sdkenv + cmd, shell=True, stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as exc:
+            print(exc.output.decode('utf-8'))
+            return exc.returncode
+        return 0
-- 
2.17.1


