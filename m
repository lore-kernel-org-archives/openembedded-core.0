Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36BDCCF2CF
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 18:25:22 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1813.1792261519491895727
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 11:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WxzK5nfi;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-353804b591eso1453914eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261519; x=1792866319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYfCDJeu8dXtvSKc94kclxKBS85ucSIgQ/hpGXxG7vw=;
        b=WxzK5nfiq/9nJ/9qaG7n3WwT4roxfUGIr+44o15VxAfBn/RuN9GjkT3kpL4AlfilO+
         vZYnXnboLZLIPVc+19Sfbnf7fkg2Zk8+n9wxHZ6Uhgs/NPc0/5bbWnkv+WhVDNuC7GZb
         AH6oJadxQqKGmpmD+GRZCmRxKI3U0BxHQduxfeA8Fbgm1C/ahrpW149roRr/UK3H3DGL
         ouCapMz51aueyhiNMT05XwnFw0571wtGlbYroM86W6hI6yZax21Z7H/gBF3TG+E1OXE5
         hCIipran1MHMp12diQDxNzEdJ7sDSGQOJm/KxKd+pb3OfVgI58CPg+JzudVyRxVop5Q2
         aFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261519; x=1792866319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iYfCDJeu8dXtvSKc94kclxKBS85ucSIgQ/hpGXxG7vw=;
        b=clTOh2e8W3ZAqbFV5lRXa84n8NcVCIQPXP6+adu2tsEyHHGWlnXGBH9NCCzKLDdt8+
         HhKMI88NUmDmk3A0TnJ+6vgv9MJFKgrHdBhjfDcjORBKzw23s7Qp6K8knl0qje4IcGwe
         fnUKFlq/cIE74czuKtpK9rIeF6xwUe2dQTEdhaSn64J8f5UM+FtKUI9O8HShSadDL66j
         4/tq3We/tBTMQbn7Yod3iEvgwnO9I6w1Dzuej93OziUzK7pjVwuIireSNC2fpPIypikX
         YaQRZ7nnMILogPL6jqyyY+YhOh9UYIvDOTJwM7/AKuohi0NS5zw15T887kU2egRPD+qE
         17mw==
X-Gm-Message-State: AFq9FYL7bqAmgS42MU2MXeQKsCFKIkmkx0yEkHKjsnTJauWbNPNd5kvu
	25C9SWMTJZ0dMWLir3yKioRCvTI1rwKWWbg1S5PvXJpQ9weZLVFMyreTpDZRtf1+hx4=
X-Gm-Gg: AYBFou0/8fMVF3TKSYwrAdcOK1rFqSZZ67IkaFotWkfYoImWYCorhD8hvQfuEcVD4HL
	XcLJRKmyEleJc+C5Yzyy3v+/KCgABQM2Lc1+3MFQ7M84WzAiHmkn1NyvY6Ua5TnhSScM9QggLq5
	n4AsA3CmSvjTyf++WmwXC6OvREBWhrTMz4/7iAAtgWPQYHegrnsNdGFBiImlPkZ9+DLqyrrU6X0
	oDr2npPtxETvrEdtBHzLDcYjl/LLCddT5PoElCHo02OV0rM5shN7jndxMEDq8TmS9uIcAjaRYRy
	tbYYonzUSIlroE6SoW6NFYuDtLv19xlKY2kKrEjC1t/Rv2Bor/7W8I1pfhInCJsesT1mBaBQ8RL
	0gYF/Il2Q2f9F/+NJvg93LT2qMKR9I7uArYamhkiI4gdfMa5bAjkU35YA4/G5VGgqZ6d+q/2hKy
	greB/8FVBfGeBZKkARlqJCQFJdqjHNMBPVWrJ9t3dO0jBUDEnhqBSyBuJySCWsSzKN2AiuZafEc
	/7Ln63SnQc7h0kKrCNan6lcKGmYE/vVg1He61ZUdMu876cNvM6Uhi/+HZXlkuo/nHSSpRWMLQkI
	JJt9XOiMse0CXtdn8yrcI0lppdyj1Xa4nZAAQurXGXmjBGMIlJbBzkzLOL0+gVFtcaeM4VHk/6i
	LDI3P/7FA841W/4lK2Xj6JRjobXf9rnZQ1bgsU7VubV2aitWtZngjAKOTS2RkR5V8F5M8Du7tem
	EG9AoYJqZbTMPM092yxfAPZM07+jmIV0tN+N9K/qAbd2eG9Q==
X-Received: by 2002:a05:7022:7e0e:b0:154:fa0b:6df1 with SMTP id a92af1059eb24-185139aa6b9mr4981561c88.37.1792261518757;
        Sat, 17 Oct 2026 11:25:18 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm19173325eec.8.2026.10.17.11.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:25:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/3] python3-babel: Add python3-zoneinfo to RDEPENDS
Date: Sat, 17 Oct 2026 11:25:12 -0700
Message-ID: <20261017182513.3727673-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017182513.3727673-1-khem.raj@oss.qualcomm.com>
References: <20261017182513.3727673-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 18:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248095

babel.dates falls back to zoneinfo when pytz is not installed, so
importing it fails on target:

  ModuleNotFoundError: No module named 'zoneinfo'

Seen in python3-breathe ptests.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/python/python3-babel_2.18.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-babel_2.18.0.bb b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
index 969f6d711e..9beb002db1 100644
--- a/meta/recipes-devtools/python/python3-babel_2.18.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
@@ -19,6 +19,7 @@ RDEPENDS:${PN} += " \
     python3-pickle \
     python3-shell \
     python3-threading \
+    python3-zoneinfo \
 "
 
 BBCLASSEXTEND = "native nativesdk"

