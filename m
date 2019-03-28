Return-Path: <andrey.z@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 416257D141
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 09:47:15 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id a25so16616148edc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8EUBDyrTkcxBPoENmOI36uFAvizrB7QXiO/bQFEQ3Eg=;
	b=PpL61sXhewnKu2ocYpW286J2S35ZFQ7L6k6iCkdLWKWrezOFD6woSLN68xI1aq571c
	MOwMpA0Xn3yXxpYxKtYzEb7JQWUcRc4tfqEeK9TXUs1wXEZz9K1B2Z9SANtVcNxqRZ/D
	nZ3iuZgw9UCT6C8qlSIp2yAh9HjyFoE/udoapwhEqNwXa+zYH12kMs5xmeedwjyVOQxM
	qDAHNT4zVhCPd4ZVVOMvFLilAOqgbY9Gs3oXr/hirGvkc+MEFqWnkDnmJM0WlJFRLEW+
	dLN6FRxICmzBLiZiPp6ozMXNM2HFn0OTKenCYelrRQAWMHbRKVomQhWIGPPIkkJcOElf
	5uDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8EUBDyrTkcxBPoENmOI36uFAvizrB7QXiO/bQFEQ3Eg=;
	b=kDf7eDbRQbhMKbsIGbr3G8kF20XeyHFfBkhVPsU4vWdmBOS4nMBMGhzfOV50TiWcAt
	zLVJTpoLvPKNQsRQn3afAr0bUt6KUiJ1zDif4/mvIvT2ubJLjjNdeAftEOlQfQD1XKr6
	yfUUTsPJYP2P87aO7VVjt1ZdItY9P58A3x73HYrZ11EyeOi7ybw7C2mJ2SNO9j/YbYx5
	GGGtZWvLjUG/XAvqv0CvD9C8diXndhGZe0dGRrK9W3BA3WVhyAYlMTZyKG5GaFJazGuO
	TuHf/RgCDOGBNgRhzLivPDnO6DQcB6lxw59bqlwvoaK9lxPzwO94YUCDQOTgd4IFs3x9
	jfBg==
X-Gm-Message-State: APjAAAW+lT65Hqz8nwL8Vd1jl+Ob12ILTZBi8RONKc4MJuHOHOl3v+3+
	UMqnRN5YhXYnFPFnephuP5NiASLT
X-Google-Smtp-Source: APXvYqyEXOkuDUcSJdM+jGOZBn7eFw6f5sPjOMU2sFlIDvufyKj/dlZ/hutDYo3zO4DXrXhucnUtEw==
X-Received: by 2002:a50:b18a:: with SMTP id m10mr25994830edd.79.1553766436046; 
	Thu, 28 Mar 2019 02:47:16 -0700 (PDT)
Received: from ahersrvbspbld01.lgs-net.com ([193.8.40.126])
	by smtp.gmail.com with ESMTPSA id s11sm272262ejq.59.2019.03.28.02.47.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 02:47:15 -0700 (PDT)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 09:46:52 +0000
Message-Id: <20190328094652.19336-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] package_ipk: handle exception for subprocess command
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
X-List-Received-Date: Thu, 28 Mar 2019 09:47:16 -0000

When opkg-build command fails to execute, subprocess is returned with
exception instead of printing to stderr. This causes the error logging
not to be printed out, as the "finally" statement does not contain any
bitbake error output.

One example of this behavior is when the package name contains uppercase
character, which are rejected by opkg-build, subprocess.check_output
would except and no error log would be produced.

This commit catches the exception subprocess.CalledProcessError and
produces bb.error output visible to the user.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta/classes/package_ipk.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d1b317b42b..f181f5b4fd 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -234,6 +234,8 @@ def ipk_write_pkg(pkg, d):
             ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH'))
             sign_ipk(d, ipk_to_sign)
 
+    except subprocess.CalledProcessError as exc:
+        bb.error("OPKG Build failed: %s" % exc.output)
     finally:
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
-- 
2.17.1


