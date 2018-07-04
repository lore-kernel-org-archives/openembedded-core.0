Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id F0C30788F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 09:44:02 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id b188-v6so5121838wme.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 02:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+73GYXBUr/nmk5u0UT3OAua3V32FCvkYT42s5a7dU3E=;
	b=fLvcob3nzuBM0CJ5hP5kVvHrEeQfa9QH2tabSHsFaTslPrNwZq2mplw8Z10v0IADy2
	zS+Hc7eknMENaFstiLhj9xhXsM/OXCrziuPzLBs0/BsFwKjJBLMUAMZWp9OA+FOAorTj
	XEHQ/znAmSL/6jg7eQ4xN9gMaCiycpvVUKONE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+73GYXBUr/nmk5u0UT3OAua3V32FCvkYT42s5a7dU3E=;
	b=o9nw2fKIoCZ6lNt4KexLNcIV2iLkoNw6HEUqJaK+kOxt3F0kWT365age/i+D2ImyU9
	zTb312H5u/wfF2xRW3Fdc9nlbdJk//2FaQxC/HuUxzxv0flhBcEbVVK/R4MegATFiuE8
	7KpuXdUe5BMlaFWf6B6Z+IRWmIndhxpHY9bLOhkNt55ya7P6811LUENikoE/avBe6aJt
	Y1So1vHu3VmiOvXuSReX8YwcEMBWHhJyRyLQJxRqEJhYYNJlcCLFZFPl4RoK+T6ElEnE
	OkQhzZfHHxaLljRwWv6yg+tNtXBLUOvwkVmGC6roX9BLnd+fcZRs3avEe6ioZ/Rz8hHW
	SWrw==
X-Gm-Message-State: APt69E00bRsVx2SXz1ErHQyra8A/2TItGhO6/iS+aC64QGrPzQwb3+dl
	/8CnbQWZAjEzOBOPzNbWc8seur/+gE0=
X-Google-Smtp-Source: AAOMgpe1chrJ+fw29Cma06Nrb9FOjv7YLmzmxbHBjha2RrVDKqrgCK0by4xOk56Ku1UMHXBOMjSBAA==
X-Received: by 2002:a1c:b609:: with SMTP id g9-v6mr1029056wmf.73.1530697443539;
	Wed, 04 Jul 2018 02:44:03 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o17-v6sm2855303wrp.62.2018.07.04.02.44.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 02:44:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2018 10:44:00 +0100
Message-Id: <20180704094400.9746-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180704094400.9746-1-richard.purdie@linuxfoundation.org>
References: <20180704094400.9746-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] send-error-report: Fix test for name > 50 chars
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
X-List-Received-Date: Wed, 04 Jul 2018 09:44:03 -0000

A name > 50 chars causes a 500 internal server error and should be warned
to the user but the code to do so currently doesn't work. Fix the logic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/send-error-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 02014ba9d85..8939f5f594a 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -88,7 +88,7 @@ def prepare_data(args):
         log.error("Name needs to be provided either via "+userfile+" or as an argument (-n).")
         sys.exit(1)
 
-    while len(args.name) <= 0 and len(args.name) < 50:
+    while len(args.name) <= 0 or len(args.name) > 50:
         print("\nName needs to be given and must not more than 50 characters.")
         args.name, args.email = ask_for_contactdetails()
 
-- 
2.17.1


