Return-Path: <mattias.waldo@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF3860017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 18:58:31 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id 33so4167633lfw.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vLjeO9mEiLSoP8dS9DiWMO+fFfRyLwPes++xN1CUVwA=;
	b=D04WR8g7PmMDun+dzLPv2Mdhd0GCYBJIK4YE6yo5IrUxHTO4vZE+8ETzcyyUbK4Bfq
	377MP5NlGhD1GW178GV7TIxdkREBefCots/6/uRtYTy6BosR6JUYDoiYI598mzXeVdnS
	hC0vNEx2wIUfoU4/pzuQXq0rRWI90ORO8/syqKFvV83gfzemM9K3+EYeBhApbLbwsHia
	J7ioPuMxx4TsCExUJ6DszNx9A9kw5WM7u4FCqmReRjwyy3txM6FIDMrJ2MECJAxBXYY8
	Kjq4HbOpQ5VJdtN16TF4Siip7RcEdQl2rSbcQma9WeW5fiJtbjaIo1aD44PwNL6MhNp0
	S3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vLjeO9mEiLSoP8dS9DiWMO+fFfRyLwPes++xN1CUVwA=;
	b=dvJ+62VAXzb5fWh35GhVKPFrKOqONO0z/v4lLt1z82POOfFrJV5MyOeSWbwmhtbW0f
	9TPVKRa1PhugrnSmo0L7mA0V63tg2kmmzjQj5Tt3q/DCWieBL11wCtYmyKbtynCukAQG
	VLFR1QAmaeoW+UCjcK2bNYPnGgFs79raWf8ExlS8+JBWTfW/EkDMb7JmArcAAU9nYAI7
	wYTzGy1HY3C0F8geJyF7DzbjS06COyOqtVpmZD+OpXxtBc6gyTC6+/VsQPH7IDEps3Vb
	kyaRtwisnojAFzKrgUho23/JTLGEvGLzjS80kD7Y4nHA8ECGCu46VEiR41Y1mgl1FIfV
	rP/A==
X-Gm-Message-State: AE9vXwMfY0BpNqPwLTb7+7yoeWgxO1NzvjfD18Onuh0RBiCNf6Ydb52Wda9W4mI2jDQTfA==
X-Received: by 10.25.15.98 with SMTP id e95mr2159130lfi.55.1472237912149;
	Fri, 26 Aug 2016 11:58:32 -0700 (PDT)
Received: from localhost.lan.
	(c-6dc5e455.04-597-6c6b701.cust.bredbandsbolaget.se.
	[85.228.197.109])
	by smtp.gmail.com with ESMTPSA id 136sm4266354ljj.0.2016.08.26.11.58.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Aug 2016 11:58:31 -0700 (PDT)
From: Mattias Waldo <mattias.waldo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 20:58:06 +0200
Message-Id: <1472237886-7172-1-git-send-email-mattias.waldo@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v4] kernel.bbclass: include signing keys when copying files required for module builds
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
X-List-Received-Date: Fri, 26 Aug 2016 18:58:32 -0000

The absence of certs/signing_key.* in $kerneldir made signing of
out-of-tree kernel modules fail (silently). Add copying of these
files during the shared_workdir task.

Signed-off-by: Mattias Waldo <mattias.waldo@saabgroup.com>
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index db42744..07761e7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -364,6 +364,8 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	mkdir -p $kerneldir/certs
+	cp certs/signing_key.* $kerneldir/certs
 
 	# We can also copy over all the generated files and avoid special cases
 	# like version.h, but we've opted to keep this small until file creep starts
-- 
1.9.1


