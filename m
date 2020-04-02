Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.4306.1585860142151209908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 13:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YD823TiR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id m17so5805439wrw.11
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 13:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6Z+apjpNvjSueSlExDBtLtd2u8Zg4OHMNsK8P1Zzhcw=;
        b=YD823TiRNnN7cxK3ORbQA8n1ZQDb+mP7Aj82cJergazpTjBiG3tfGcg/loLz7zRMI3
         DgRklWHInfMw+3103pmTW4hf6/338y7ZJaQYzwQHKFT6d7x0weI5kKMPEnVoue0nrPm6
         3GVVJODJ7W8CIk9N9iG0ry4qbkJKsyTtyFtBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6Z+apjpNvjSueSlExDBtLtd2u8Zg4OHMNsK8P1Zzhcw=;
        b=F3GPAQKvXKsU1d0mcj0bi7fqW1LhRdmFXR1Flo3Od2bIawDDFJ6UBG34enaQxNm/cq
         swdUMYwwwMFYF+dmtE5zPRCtqSLuwP97VVDSOFunh+FDyPiBvIukGFGC8D626b1UBDVm
         cWEMwgsyhNLfNRnZIvHL5P1qANyTXIH/9YnNWFMwBOtunrVLPVa96MGg62MhpuElr5t+
         UkAYbc0F8eOyR9aZlNZxvix3vlB47fnN5fNsbK81A9S3HBOrjJQaVgR4g5pJV99k3zFs
         6kW8cSuhXGAHI1xjyBOb0KIocC9B4UxXaCd4RihwCNROzQopunSNaBs5qsJDEFMnARWC
         KWJw==
X-Gm-Message-State: AGi0PualUF//bz++vcLCgk3rhn1RBLkflB5SxtCHN/m8A8qUOMHZ341C
	2j+bqTuvUGlmmze9M/IyIyP1jg==
X-Google-Smtp-Source: APiQypIU1JQFy7TRMvc3+HFSDHt5zZOWtUQEZgR9/sx3Uq87jALwxrtztHxeUQPDB3exzZuZYd3w4Q==
X-Received: by 2002:adf:e650:: with SMTP id b16mr5062318wrn.328.1585860140566;
        Thu, 02 Apr 2020 13:42:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id f187sm8749482wme.9.2020.04.02.13.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 13:42:19 -0700 (PDT)
Message-ID: <b69366f4b2632b18997691497c8799a93cb36b27.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/reproducible_build: Skip SDE for non-finalizing virtual recipes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Apr 2020 21:42:18 +0100
In-Reply-To: <20200402180832.12814-1-JPEWhacker@gmail.com>
References: <20200402180832.12814-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-02 at 13:08 -0500, Joshua Watt wrote:
> Don't capture the source date epoch for recipes that are not being
> finalized. This prevents a virtual recipe (e.g. multilib) from
> attempting to read the source date epoch file from the non-virtual
> recipes workdir.
> 
> [YOCTO #13851]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/reproducible_build.bbclass | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

What puzzles me with this is that we're telling bitbake to ignore the
variable for hashing purposes, yet it still goes ahead and executes it.

If we decide that is a bug, we can come up with the patch that follows
below, which I think should also fix this issue and perhaps some
others?

data/siggen: Don't expand ignored variables

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/lib/bb/data.py       | 4 ++--
 bitbake/lib/bb/siggen.py     | 2 +-
 bitbake/lib/bb/tests/data.py | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bitbake/lib/bb/data.py b/bitbake/lib/bb/data.py
index 6dc02172cb..b0683c5180 100644
--- a/bitbake/lib/bb/data.py
+++ b/bitbake/lib/bb/data.py
@@ -365,7 +365,7 @@ def build_dependencies(key, keys, shelldeps, varflagsexcl, d):
     #bb.note("Variable %s references %s and calls %s" % (key, str(deps), str(execs)))
     #d.setVarFlag(key, "vardeps", deps)
 
-def generate_dependencies(d):
+def generate_dependencies(d, whitelist):
 
     keys = set(key for key in d if not key.startswith("__"))
     shelldeps = set(key for key in d.getVar("__exportlist", False) if d.getVarFlag(key, "export", False) and not d.getVarFlag(key, "unexport", False))
@@ -380,7 +380,7 @@ def generate_dependencies(d):
         newdeps = deps[task]
         seen = set()
         while newdeps:
-            nextdeps = newdeps
+            nextdeps = newdeps - whitelist
             seen |= nextdeps
             newdeps = set()
             for dep in nextdeps:
diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index 8bfc45235d..4c8d81c5da 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -146,7 +146,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
     def _build_data(self, fn, d):
 
         ignore_mismatch = ((d.getVar("BB_HASH_IGNORE_MISMATCH") or '') == '1')
-        tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d)
+        tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d, self.basewhitelist)
 
         taskdeps, basehash = bb.data.generate_dependency_hash(tasklist, gendeps, lookupcache, self.basewhitelist, fn)
 
diff --git a/bitbake/lib/bb/tests/data.py b/bitbake/lib/bb/tests/data.py
index 2b137706dd..5f195047de 100644
--- a/bitbake/lib/bb/tests/data.py
+++ b/bitbake/lib/bb/tests/data.py
@@ -476,7 +476,7 @@ class Contains(unittest.TestCase):
 class TaskHash(unittest.TestCase):
     def test_taskhashes(self):
         def gettask_bashhash(taskname, d):
-            tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d)
+            tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d, set())
             taskdeps, basehash = bb.data.generate_dependency_hash(tasklist, gendeps, lookupcache, set(), "somefile")
             bb.warn(str(lookupcache))
             return basehash["somefile:" + taskname]

