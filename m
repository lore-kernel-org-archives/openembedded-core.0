Return-Path: <armccurdy@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 00E7960119
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 10:28:51 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id l188so114365908lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jul 2016 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6+DHpvlNsWZnHi4vuSGh3x/icZ2mcMUWSwLgIdvQcD8=;
	b=eajD9H+w3GwGkEfpH+z6FIIN+FfSg7kkwThmZmG+Y33tsz7fcH97XQ+r/GQ+IhDsgM
	5RK+PofilZiFzcMXWu/ehg/dm2JX2tBcRrjcdz27IKIjhoacj5buTzjXUMFRKeTz6oV/
	FE0t1Br9pXWROAh6nIzWDwJ8PBlbAZOdoOgTRiIRjoyB/fTSAA97pVNcZQmF/d/Iu7L0
	MlpD1jUgeOts708CoM39Ilaz2Z2RydEO1/ugueWvSObPQ+KrZoDUSmTdsr3yWD26GBzD
	Ge84TWRS6zwS4dxZnjWWPg9FU8hmdLBrBD4ZMnqDgZU0jnwOPkvNweiUsgunvnjfeB+V
	7Y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6+DHpvlNsWZnHi4vuSGh3x/icZ2mcMUWSwLgIdvQcD8=;
	b=fAkJ+C4ywnhYO8PZ7STzFLPlgB1RDW349zCmc3JIJuw4wY0+BjPKvEHchTxuRVaHAr
	/SOyAPvCDSCLEsUSZed8h5uusQogQ0YviQoHvTE7Xn2ppH4bwy7EVyHD+UTXdYgD6x8R
	ypg+/s9Ha6LfQptj14F58qNMrGvbIaMFpBLHJ8B/xfVGBLTU1MeQ8+yt6CBjqzutiBc5
	wqabOfZuLN4MxbdjTzdooIlzrBB6/XWSMj0XaJOU1Iai0ZGvj+q2jvKZK9jWRiGKhuqB
	i9G5pUd++bk4DGvABv5OSRc5xndEAsCq4nCMmhvR+rbROtNCSY1zNETD7sl2/eKTeAIi
	/4aw==
X-Gm-Message-State: ALyK8tI0MZHbEhnOf3H//gYgSn2ZDTs86Q5I21F1KE+tomr+tqV/o8b4T42BMB8mF/jqfQ==
X-Received: by 10.25.16.230 with SMTP id 99mr2568572lfq.21.1467628131479;
	Mon, 04 Jul 2016 03:28:51 -0700 (PDT)
Received: from e6520.dcclabs.tv ([212.75.108.115])
	by smtp.gmail.com with ESMTPSA id 142sm4592831ljj.4.2016.07.04.03.28.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jul 2016 03:28:50 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 03:28:40 -0700
Message-Id: <1467628120-21954-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: Spurious warning with nested meta layers?
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
X-List-Received-Date: Mon, 04 Jul 2016 10:28:52 -0000

Is it valid to nest a meta layer within another meta layer?

After applying the patch below (to create s test layer within the OE
core top-level meta directory) and updating bblayers.conf BBLAYERS
to include openembedded-core/meta/meta-foo, everything seems to work
OK (ie the foo recipe is parsed and usable) however I see a spurious
warning that no .bb files were found within meta-foo:

  WARNING: No bb files matched BBFILE_PATTERN_foo '^/home/andre/rdk/rdk-master/openembedded-core/meta/meta-foo/'

The warning goes away if meta-foo is not nested within another meta
layer.

---
 meta/meta-foo/conf/layer.conf               | 7 +++++++
 meta/meta-foo/recipes-foo/foo/files/foo.txt | 0
 meta/meta-foo/recipes-foo/foo/foo_0.1.bb    | 3 +++
 3 files changed, 10 insertions(+)
 create mode 100644 meta/meta-foo/conf/layer.conf
 create mode 100644 meta/meta-foo/recipes-foo/foo/files/foo.txt
 create mode 100644 meta/meta-foo/recipes-foo/foo/foo_0.1.bb

diff --git a/meta/meta-foo/conf/layer.conf b/meta/meta-foo/conf/layer.conf
new file mode 100644
index 0000000..ef23fc2
--- /dev/null
+++ b/meta/meta-foo/conf/layer.conf
@@ -0,0 +1,7 @@
+BBPATH .= ":${LAYERDIR}"
+
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
+
+BBFILE_COLLECTIONS += "foo"
+BBFILE_PATTERN_foo := "^${LAYERDIR}/"
+BBFILE_PRIORITY_foo = "1"
diff --git a/meta/meta-foo/recipes-foo/foo/files/foo.txt b/meta/meta-foo/recipes-foo/foo/files/foo.txt
new file mode 100644
index 0000000..e69de29
diff --git a/meta/meta-foo/recipes-foo/foo/foo_0.1.bb b/meta/meta-foo/recipes-foo/foo/foo_0.1.bb
new file mode 100644
index 0000000..a5b5412
--- /dev/null
+++ b/meta/meta-foo/recipes-foo/foo/foo_0.1.bb
@@ -0,0 +1,3 @@
+LICENSE = "CLOSED"
+
+SRC_URI = "file://foo.txt"
-- 
1.9.1


