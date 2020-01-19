Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id AAC557F977
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 19:00:06 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id n21so31342118ioo.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 11:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9EsPgn5jOJTYvvRG8Thm66iPnnZ2jrH/5txWb4dLa0A=;
	b=VwrVP0B2M+InD2sIpnouWw9pLkzwc4LqFOJP8ubq0RQ9sTbra3TlccPjeNYdXUEAKQ
	rq6NaYLINMQfn8HTuNd4BqE3mHsXpkGS88NJM/J1kKTN9lHBbTshCCc8XIOkI4UWW546
	adr7cT8LKSBe9DpyNQky1ckIDIYmJUUK3mVHMLUyyRWc6/4WrMUTJNGGzOQ8699zqwVR
	8dgebaRhZG5WaPxF5/licUqfvYY9BmpciOPbaNB9TSpedIQBYBl1lZSI/kJbG5yBqKxc
	gyXQ6f6GdWz39gsvk6RGp1fFmpQMuiIFYVYO+NNL892d3b6pEALge7CD6HGvMN1MlgvW
	KgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9EsPgn5jOJTYvvRG8Thm66iPnnZ2jrH/5txWb4dLa0A=;
	b=QrJ/Jn1LdPWKtxPPAzpnUdbEK7W5RiduS1tnHWhN9i3MqVtX6vViAu6j0GfPdeUws4
	YNnvgLCzUaVZguv5tD7uroIOfm2pJM1bmzZTErBg1QV05OWp0cR3yiNo0WJWcY672i01
	qD7vfa5Tip28wR49QdN9DZ6uYQlqWjOjo/+TKQ2kfyefvhYy/8N08x2MZJGq+lktsnUE
	25Kn9L8pE/f21ukjvVyZh7lthTwx0BLaurwWWIbOFNFdSEbt/WbfL+7/JPPqb6jDSsC4
	m/3lJoLFwvHJftW33PvJoSOCrK/Xo7IG774QThuYaVBwJTUQsDCwb2PXRRi5AyC50zr9
	D03Q==
X-Gm-Message-State: APjAAAXcAu6+12KeYibP1ri9n3hPCfQ9eIbTlgU+bbMkW/Y4JuZv+ECb
	aDngGcSBrqBFp1dt9UeSQYT+9Kiq
X-Google-Smtp-Source: APXvYqwHkEeKPCSQjW6xiKLxBJ6lvZqHcRx4FudtTmK31oMUHBSdN7C4F+Td0CG7WUyeXZFe6XMyqw==
X-Received: by 2002:a5d:8cce:: with SMTP id k14mr40239591iot.294.1579460407571;
	Sun, 19 Jan 2020 11:00:07 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	x77sm10726714ilk.34.2020.01.19.11.00.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 11:00:07 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 12:59:56 -0600
Message-Id: <20200119185959.406212-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 0/3] selftest: reproducible: Various improvements
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
X-List-Received-Date: Sun, 19 Jan 2020 19:00:07 -0000
Content-Transfer-Encoding: 8bit

Adds improvements and bug fixes to reproducible builds to make it easier
to diagnose reproducibility problems.

Joshua Watt (3):
  oeqa: reproducible: Add flag for building from sstate
  oeqa: reproducible: Fix extra data reporting
  oeqa: reproducible: Do not strip packages

 meta/lib/oeqa/selftest/cases/reproducible.py | 77 +++++++++++---------
 1 file changed, 41 insertions(+), 36 deletions(-)

-- 
2.24.1


