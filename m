Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E93C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:10:23 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3671.1787303415691614369
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IC7JarB8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fe89fb333so406456f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 02:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787303414; x=1787908214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D4CgimPS177t3LUUsjSqB4OewD85VEgfxx6Z+AXrAMU=;
        b=IC7JarB8tdqqjBhlm1tBS4XNWQhu4PJZtONewhws5Jm70Zbay7YBEWmF1vZBAbK1Fz
         B4qzxpLokZ1VGL3s0mUjn4lGXO/mLbnybfz4PwYchT/TQOBINXpH0H3bJ/ap090fC02G
         zXwDsVp4YXawdVL3X94wnVk7fCHq9R/VKfqvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787303414; x=1787908214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D4CgimPS177t3LUUsjSqB4OewD85VEgfxx6Z+AXrAMU=;
        b=nZ+zfFDkKJitoWjASDjPyJPvmdkaow19vEJLbYS+ZU7GBdhGiG5o3eLoAfRbIizIHB
         1Bze0YZgGPZmbhcxgphLmzPRnUezjQNLvkJCl72QK7k/8p+7iZWuxW0Utwz+zUoY5PFo
         hvzxJckKg8eoCEW76aj9wjKK29A5lVSUCNThvLxJPkr6Hd/Bl+k35zyJKtZTJ7fypUpA
         O6HzVPcgrK2jjPbBZ9hqQlxfrPewlGQfVoHo9HwzfhJLFZPBqyQVOFkY9Kb21ij1fZCr
         OqjdOjfF/8/CH4TVg3mJFglNa6aFMlGflL3hmUcRtbLIXosEW4eKoU5+3wqa9tFqvUQc
         kAIQ==
X-Gm-Message-State: AFuF++nt2JIVn4Jx3yAJewSKwW2ZOF/evwUDylfmQus0sWh3way5pYHl
	CN8+4YQYhvC92sz0F4bOKHQ/gU+GORptoRsfdv0cnIN+8JXl/UdaUDLlSb7tEnJiTyrfg7hWRfK
	8DYSpacw=
X-Gm-Gg: AR+sD13v45pulcGKKVFJRAs7fqSViNzOyRbXj3y4F1pFhfcJUhNFLPIN+bmZddz+eD6
	hyn9nw7o/FDY07s/AtHLpVDznDNZiUXQ9XrSlsk38ZAcRV2QMd8JcvTgi0FaXOjLaaieWIOcL3D
	Vz9QFPdpVDk/A7HVurBaCbnWA/JQK2BvjZ79GnDdwASuqKxdXUtr/Axibn7a2s9VNSXCTYDSxc/
	AQ0djsfE1xe4BvS9jWWMIZxgd/Q9UT3bM6ceuyXymRM/ccsh29PYwa1eShOW/wOwpcW7ywbQfZQ
	Ci7xzzuBMT+d7DmiA8R9Dx7KXtp1gMMxu5wOPm4q9lryTRfKd2cGDSVW3TJGolzBQ8M8qmTqBBH
	uEv/JlUhyRGiNmhmEB5P73AJdpzA2ShiDylsZJLjXwaD0zYUE0oDToY3amPJB+z6eLc0dXWYSsW
	GYwF9Zf5gJzk9GpG3APfwcXYCs2Zj5Rjt3ypVi1lRBXqVW9gHx/Py4YAUhGgI7FncF7yvntWGDy
	UMlrWp5HgE/JZOLdzI=
X-Received: by 2002:a05:6000:2412:b0:47f:9ac6:ca60 with SMTP id ffacd0b85a97d-482c0b05a84mr6665851f8f.0.1787303413874;
        Fri, 21 Aug 2026 02:10:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d23sm17049620f8f.22.2026.08.21.02.10.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:10:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] python3-vcs-versioning: upgrade 2.2.4 -> 2.3.1
Date: Fri, 21 Aug 2026 10:09:59 +0100
Message-ID: <20260821090959.3859632-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
References: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 09:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243915

- Fix a `FileNotFoundError` crash in the git file finder when a submodule is tracked in the index but its
  working tree directory does not exist - such gitlinks are now skipped like not checked out submodules.

- Add a ``vcs_versioning.dynamic_metadata`` provider for the dynamic-metadata system.

- Make the `tag.strict` and `scm.git.describe_command` diagnostics actionable and non-conflicting.

  The `tag.strict` future-default notice is now reported by the git backend rather than at configuration
  time, and only when the future default would actually select a different tag for the repository -- the
  message names both the current and the future version string. Projects the change cannot affect are silent,
  and setting an explicit `describe_command` no longer triggers it at all, so the two warnings can no longer contradict each other.

  The `describe_command` notice is likewise limited to the case where it and an explicit `tag.strict`
  really disagree, and no longer claims that `tag.prefix` has no effect -- prefix stripping applies regardless
  of how the tag was selected.

  Both are logged at warning level instead of raised as warnings, so `SETUPTOOLS_SCM_DEBUG=ERROR` silences them.

- Honour `export-ignore` on directories and submodules again in the git file finder.

  The switch from `git archive` to `git ls-files --recurse-submodules` lost two parts of the archive semantics:
  `--recurse-submodules` listed every submodule regardless of `export-ignore`, and the `:(exclude,attr:export-ignore)`
  pathspec only matches files, so an `export-ignore` on a directory no longer excluded the files below it. Projects
  that kept vendored submodules in an `export-ignore`d directory suddenly shipped them in their sdists.

  The finder now lists a repository without recursion, checks `export-ignore` for directories via `git check-attr`
  (which is what `git archive` effectively does when it skips a tree), and only then descends into the submodules
  that survived. Submodule contents are still listed - with their own `.gitattributes` applied - so `export-ignore`
  in the parent repository now controls exactly which submodules get packaged. Submodules that are not checked out
  are skipped instead of failing the listing.

- Honour `tag.strict` on Mercurial changesets that carry tags of their own, and report the coming strict default
  for Mercurial repositories.

  `tag.strict` was only applied when looking for the latest tag, so a checked-out changeset tagged `event-2024`
  still produced version `2024` even with `tag.strict = true`, while git rejected the same tag. Strict matching
  now applies to the tags on the changeset too: a changeset carrying only event-style tags is treated as untagged
  and versioning continues from the last real version tag, matching `git describe --match`. When several tags
  sit on one changeset, the version-shaped one is now selected instead of whichever Mercurial happened to list first.

  The `tag.strict` divergence diagnostic added in #1429 now covers Mercurial as well, naming the current and
  future version whenever the coming default would change them. Both backends share the message, and the
  git-only helpers moved to `_backends/_scm_workdir.py`.

  Note that the Mercurial backend required a dot in version tags before setuptools-scm 9, so for Mercurial
  projects the coming strict default restores the historical behavior.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-vcs-versioning_2.2.4.bb => python3-vcs-versioning_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.2.4.bb => python3-vcs-versioning_2.3.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb
index c8665d90c9c..1800475dff4 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "ed718fdee42170e128a8add6f23f53aa64dc7d9ab2de87d3083a691df881a809"
+SRC_URI[sha256sum] = "806635bd0ea653c96af98a70624be758d408a989f2cd0b390e63474d99f96b63"
 
 SRC_URI += "\
     file://run-ptest \

