Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9A47B7C3DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 19:59:49 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id l14so8692845ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 11:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Fb9gBfCidwy/eAQuDsKO6o6f1v66K7GdP/FizhjZFt0=;
	b=PiacCctJJOuVnHoBI+txCKnV9mrnzsTMoUVYhoEWrzUhm9wyGRa2nfW97NCLI/xhXP
	TjDgGR0BZoORyZkUTRUd94K+eWC+DDqMS17ojotedh2ixrqi59jTtbAhTjsNrVfxMygb
	tSyR6P7wAzyjL9l/m0oj/dh2b3iTLA2D2VNZobKWE5s6zpZhnubes/UmvgaPt/YxJMNd
	KkNz5rzIlkoLTig1zSLMPjZtYQ6MFVt1k5TB04E8nWWzTe2BslK/ZVFgmk2CumaNN62C
	v/y6YrsP0SSWHi52W9lZyA7FpU/dC19zb8Ay/yF+BCBTJoBMWlJmM9+K+zM5CJUKEwmZ
	iklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Fb9gBfCidwy/eAQuDsKO6o6f1v66K7GdP/FizhjZFt0=;
	b=rJP1vaMB05umNrgpR6e8X8wA2w/k0jBc8LiF275Gs5qHbG77BisDUKiOULt+U9ILb+
	1nKK/R7xN/sr6YgF1s3toFRPEKixj/1KsP6Ae/mdTjaGLzwoX5ib6YxvEZ+IYkznuGUH
	ehzH6MtcM0QUZJFcjZql/2I5ZnI4f/TczG8RLN/hAmkoT+FKqZsjaamMSb/FIPnDM56S
	L1VOrgG0YRqDqI+5YZsAwT4gur8oHH97R3ic9tPU8saSygMctszlc5ahkZusjl1CHEzb
	qfV4GTtYenlsbrGLu/wUqeqXRxrVdmcytsvZzXLS/mD5y/SWPdC5ZYllyvcmK3HyVOzc
	lvRg==
X-Gm-Message-State: AHQUAuYNexkoaGWS06Ojg50SAeAXrDCNenhX/vpja4g/hx8qkvO7APoO
	r307eUB97YE7XNBVHGW5/1TWT1Pvpf9p/VC4agQNLYS4LqE=
X-Google-Smtp-Source: AHgI3IZbjdt6ze+phxJoSDCsAr9CxeeuyheZukrMGJw1dCAJYPjo7ZIey4yGdYHyzxgbvYqM2JP2c27NSuFhoQhiv/g=
X-Received: by 2002:a5d:9ad8:: with SMTP id x24mr7254663ion.19.1548446390216; 
	Fri, 25 Jan 2019 11:59:50 -0800 (PST)
MIME-Version: 1.0
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Fri, 25 Jan 2019 20:55:33 +0100
Message-ID: <CAJkqNs36diCh3qUHA8+ssmi_BGKjgY_xd_bs1sDAFvWwwGp6ew@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] lib/oe/patch.py: Fix applying a directory as a patch
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
X-List-Received-Date: Fri, 25 Jan 2019 19:59:49 -0000
Content-Type: text/plain; charset="UTF-8"

If a SRC_URI content ends with '.patch' bitbake is
trying to apply it as it's a patch file.

It causes that if we use git repository for 'patch' package
the bare clone is extracted to a directory
(i.e. build/downloads/git2/git.mirror.org.patch/) which is considered
to be a patch file, so patch.py tries to apply that directory as a patch
which ends up with a failure.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/lib/oe/patch.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 07a40fc50e..3d0b7d7289 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -793,6 +793,8 @@ def patch_path(url, fetch, workdir, expand=True):
     """Return the local path of a patch, or None if this isn't a patch"""

     local = fetch.localpath(url)
+    if os.path.isdir(local):
+        return
     base, ext = os.path.splitext(os.path.basename(local))
     if ext in ('.gz', '.bz2', '.xz', '.Z'):
         if expand:
-- 
2.19.1

