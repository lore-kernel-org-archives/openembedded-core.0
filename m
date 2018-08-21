Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0627479234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 18:30:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u12-v6so16655646wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 11:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=wWdnYae73h10I9vrlfJ3k3fobCYurE8I8+zpi2GKBeg=;
	b=eU9alJldGNN5I4aTg/CdB+SrDGA9uQhj+PsaZZ+aIdc77LrJZRS3QwiR8pV80LGx7H
	hSHPbK5qXHJYC2WPjeqYt2FJQUsJ+qswIqTITb8mBnManO4aKe6yY5aIunnxHMWgyXJi
	d3hZvRy8ofhsp6ibnTrqZTNg1p9MvN3zAB+uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wWdnYae73h10I9vrlfJ3k3fobCYurE8I8+zpi2GKBeg=;
	b=tN7twvfdfmMzvKkpUE7prL16vyLP+UNowgkTOnWSp7TmR3HTk1cUbn0/AGuriEsK9P
	+B3FEzMsewxhs0ySOzJhbNEWSF/+EC0JTjY8gnFCxg1Uqij3orTxRhUfQxvGaW4Dsu1+
	3J4OhNlwPjtQLzJWcg6CYWbGyDJTdrM+OtuHeCNGvw1CyuP9HHOTP3qREz8qh/cbiWnI
	lbCcWQpOOiOk88SgnDh4e2KIOhG7pK1NnPzTKfw+YNFs3bVBtZooEJoV8at8iXuXIH8i
	y1HqinIJIW5riSczhS8/MggD7a0AGdqya05N6KwpvEA9DIr/GnNh9EKJCJk4Pbab7pv9
	EHDA==
X-Gm-Message-State: AOUpUlFvGOpYSgjGinAgqcEyRbcp6TDDOn8zyAGVfoPXiOSjUDXMBAmS
	ahIVYqIK2TJI6OmXEWjGzk7tgwDCGxU=
X-Google-Smtp-Source: ANB0VdZN4xDtu+CuI5f+PpafI3zDmLXsOVSxeIinMU86yNIHFTXKyDrDa5QMt5A+tN1dwDVCNjyTOw==
X-Received: by 2002:adf:9ae5:: with SMTP id
	a92-v6mr6573057wrc.125.1534876235418; 
	Tue, 21 Aug 2018 11:30:35 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w4-v6sm11282663wrt.40.2018.08.21.11.30.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 11:30:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 19:30:33 +0100
Message-Id: <20180821183033.8080-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/concurrencytest: Ensure subunit streams are flushed at exit
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
X-List-Received-Date: Tue, 21 Aug 2018 18:30:35 -0000

Without this, error output such as that in the teardown can be lost
and processes may recieve signals they're not expecting causing other
strange errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 850586516a4..6404cb4668c 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -225,7 +225,9 @@ def fork_for_tests(concurrency_num, suite):
                 finally:
                     if newbuilddir:
                         removebuilddir(newbuilddir)
+                    stream.flush()
                     os._exit(1)
+            stream.flush()
             os._exit(0)
         else:
             os.close(c2pwrite)
-- 
2.17.1


