Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 19CCC61B22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 08:47:31 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t11so1325050wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 00:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9SfALA5kWAw2eVQbS/YXC+LsCpWMPCoFDNcaLhRqurI=;
	b=YzdLkjiGNJf2la97fNvbG+2ComDVPgqvHYVzNzXh48SxpHpD5UaXOR3ZX603EC8QA1
	SWeAK/CaIWGqyiB6j+wNXcQXOZFo3cQ6ZzuSnpHo3PUGZVSIKHzFMyXizh9wFUD5ChGb
	9fT5IAtLqmZfMntcOCL7bOLW8vmADvrBlbV0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9SfALA5kWAw2eVQbS/YXC+LsCpWMPCoFDNcaLhRqurI=;
	b=PfXMGJwx9EYjxlWvUbKSS2IclK1F2JHWRZLc1/tKZz/Njpegk7nEBUlotYhZ3c5Aqc
	bFdAJwZFcWyajqBMoQpNknk97YLKjuyO8njSSRixVto+6n3XQkTuc153AyTjmVX7xMLA
	Ar+AIWtc7JWTRms6hOXhBc8ybb4eiWdd+/1MFMcKcn7kL/eLO18k/84MjBMBve5smmJE
	9/9SPPg8ukIJtHeCjisixcEOr74PIRcQRS8QpPVnAMqwxDVMb1YlB1ZOtNYpBn0tME+m
	a2L6FE+h0gYdNd743q3iuTr7xoYkOllt6uJvoCwJ1cZ7ZFiXBeLiss1CaxGPbr7H7ksj
	hRAA==
X-Gm-Message-State: ANhLgQ2NT6M3ZEa8DQnEz40+MJlZ7khLQIpw6UdK6+E+uKuhS8ll2DY0
	W3TptgYyLyqfFlGBJ9x+97lOPFpBNzs=
X-Google-Smtp-Source: ADFU+vsvEViS4xkNWBsGqty/mGPKEntdhP/qZpIHjT2Z8raG5BQl8Dg3anh09m+Mtpg+yJ9YjB7aTw==
X-Received: by 2002:a5d:5148:: with SMTP id u8mr3036895wrt.132.1583484452448; 
	Fri, 06 Mar 2020 00:47:32 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c9sm14259367wmc.3.2020.03.06.00.47.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 00:47:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2020 08:47:30 +0000
Message-Id: <20200306084730.1009856-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] sstate: Drop obsolete check in hash validation
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
X-List-Received-Date: Fri, 06 Mar 2020 08:47:32 -0000
Content-Transfer-Encoding: 8bit

Now this function has a summary parameter we can drop this check.

It could well be why the mysterious "locked sigs" selftest fails
interemittently if this function were called with a single hash
to check.

[YOCTO #13605] (with luck)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0beeb33707b..c73c3b42a7f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -966,10 +966,6 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             if len(tasklist) >= min_tasks:
                 bb.event.fire(bb.event.ProcessFinished(msg), d)
 
-    # Likely checking an individual task hash again for multiconfig sharing of sstate tasks so skip reporting
-    if len(sq_data['hash']) == 1:
-        return found
-
     inheritlist = d.getVar("INHERIT")
     if "toaster" in inheritlist:
         evdata = {'missed': [], 'found': []};
-- 
2.25.0


