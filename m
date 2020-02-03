Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 416B560697
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 21:26:42 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id l14so7525774qvu.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 13:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QqktG0nIkaCHuYsKkauqURqXct5F/yHK+w9wopv3978=;
	b=Q9tKQ3JhITqyHjOrMST3HgvsTokd6fPkpHYkgYo2d5AZxwOin7qFzBV7oZTrQiq8U9
	q/FksAoKWrpA5TyqGQTU/dLbKzGJ3ockjDuXLXRG7u2KEO9eLZ+V81YrGS7AwjO3BxJF
	HW6aZ016X1lozhzYDcDLpciwYJa9hdk+NNP1yPMtiArsLYv80sRFHvUs8fe33w0zi/wm
	od9Fe1mpGOxhr5ybqWVYDVdV4k3ka/7wnyGquiaIzFGMRVzTygWbtvNEGP7K4Y1iyo3y
	5/d0WyPehhUALpNfK4qev0k6wM+S6oM69Hn8S0zm53mnrn1nL2GAIxGZqXXdbPD4oSEr
	t3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QqktG0nIkaCHuYsKkauqURqXct5F/yHK+w9wopv3978=;
	b=HQ4Y2A368i8tVqLmNEcvD3glvTos8Z7JzWP/QLAbUn9xVUSJxM0uEgL2ZSZiH0vySq
	8hCyTgs7h9BRn364YUJ0iZQQpLvxcLfYeiVd1YJibZFY94ZLl12ysgULpMa2Lk9cQjHh
	ftNyculqUKfymuNUM5XJcbjyBW+pVNEh6MiW4+vCHd3qThjTJOrkiqoRAFETagJV88wj
	11WuxW9r3qOSVx9j+6TStszLwZKiq5u/Q0V1j585fUi79xHeHw3ibdJuh/RJAK9JNZ7M
	fB8xgHX+RbxFzDmA5oqhF0vNjpGNquDG5yoPMJ5yO+kXwguIUze7YxAjbUfTivamyvc9
	c8kg==
X-Gm-Message-State: APjAAAViFIQgyZY6DRR+dfnOax4G2y6LqD1fEbqH5I9z9pMrGYldZefz
	d5G6Dw8BoYiy1oNqlEypMEI=
X-Google-Smtp-Source: APXvYqyK/XkR3ypkMCQ4tkpyLc7F0OGrgJASuJsXxvRGFaBtKdQ2/GFpn4+Yl2YzxTOJqsEcgMlABQ==
X-Received: by 2002:a0c:ea92:: with SMTP id d18mr24706811qvp.201.1580765202994;
	Mon, 03 Feb 2020 13:26:42 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id b9sm9837627qkh.83.2020.02.03.13.26.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 13:26:42 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon,  3 Feb 2020 16:26:41 -0500
Message-Id: <20200203212641.57611-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kern-tools: tweak symbol_why to be python safe
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
X-List-Received-Date: Mon, 03 Feb 2020 21:26:42 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the SRCREV to pickup tweaks to symbol_why.py to be
python3 safe:

  - we explicitly call /usr/bin/env python3
  - we full specifiy our symbols
  - do not assume that 'None' can be converted to a string

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

I didn't realized the v5.4 series had gone in, or I would have
send this sooner. This should resolve the errors that are thrown
when symbol_why is run to detect missing symbol dependencies.

Bruce

 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index a4c0b6fb8a..57ec1abc6d 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=9c30e971d435
 
 DEPENDS = "git-native"
 
-SRCREV = "7465c8497893ef8f6503c918aeede969f7e9753b"
+SRCREV = "5358eb293399867db05fd73d04ce908d69a03bed"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1


