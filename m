Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DD2677F22D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 10:17:40 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y21so6364201wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 03:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=cPBmXBwAnpsXMIeig3GQzPRKgyU7ZwcY/zeofqN/A0w=;
	b=BWfVHeAbDfen5S9lLRjKT++KpQRJv2OF17X7zf2XFdiIDTPGqpIH26FeMn/TWG/dRL
	1gV/n/wwV/DYPi512PtosnGtsNqPvSdOdFTrc94l3OvC8KoJkGKeLfzZQFW6RkQHGdlj
	orOqiqC0HCKaCPd1Go3r7T/6NMYxBE4u8FAZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cPBmXBwAnpsXMIeig3GQzPRKgyU7ZwcY/zeofqN/A0w=;
	b=RTAvCe1LQBZc5lp34QKwLcRZBuJptRy2IOKq79xhlQ1WpmjGL6UA1b1GLv58bkjvke
	c2orvzryvjMt2VM/IM0JCYW6vAjfbWFW5ttWs6CcVoJyCMhWsroi2xlsXG5wDecS+KKB
	U1mqSgm/sRQWFNjhX8n5ahGbYNF33dkOFQo6u6aYaYNCI82/FQcG91ukTXFn0eNXw3BD
	T9ka5eLaUZsnHvsESMs/gyP3taD92gtdGQwVZ0dohrYlhpH3spPlpmYJBvcKiNroPpZM
	mJzNFm1am69bJgc8EPpHn89PeKABKEmFu+Yw4A6gHRhdBeWu1kVq67S4kdLmCyEUm5+A
	mECA==
X-Gm-Message-State: APjAAAWrFaeonmOwYKdIZYkJluYkNGicrCUapvf6ABpFzK3dH3Ahx36l
	35Tkd9BeGMz9eRGIHYnNKRjPyQ80DvI=
X-Google-Smtp-Source: APXvYqwN1Yk+HbkQx+uHzb+dVVx3ZTx/LwyW2EAyPy52Fg6gDQ2dg1ViLVF6sGjIHfw5kJilOeoPnw==
X-Received: by 2002:a1c:2501:: with SMTP id l1mr2071392wml.74.1570011461211;
	Wed, 02 Oct 2019 03:17:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v16sm23290410wrt.12.2019.10.02.03.17.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 03:17:40 -0700 (PDT)
Message-ID: <4ad724ca50b35e495d2eae800edd83c60b7128bf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Scherer <konrad.scherer@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 02 Oct 2019 11:17:38 +0100
In-Reply-To: <20190927185642.29251-1-konrad.scherer@windriver.com>
References: <20190927185642.29251-1-konrad.scherer@windriver.com>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [master][PATCH] gen-lockedsig-cache: Replace glob lookup with hash to filename lookup
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
X-List-Received-Date: Wed, 02 Oct 2019 10:17:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-09-27 at 14:56 -0400, Konrad Scherer wrote:
> From: Konrad Scherer <Konrad.Scherer@windriver.com>
> 
> Using the glob function to map signatures to sstate files is very
> slow
> when the sstate is large and accessed over nfs. The lookup now only
> loads the necessary prefixes and doesn't use glob as all.
> 
> Unfortunately I don't have access to the systems where the
> performance
> isse was noticed and on my test system the glob is fast enough that
> the performance numbers aren't useful. I could verify that file list
> returned by the new code is the same.
> 
> [YOCTO #13539]
> 
> Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
> ---
>  meta/lib/oe/copy_buildsystem.py |  3 ++-
>  scripts/gen-lockedsig-cache     | 44 +++++++++++++++++++++++++++++
> ----
>  2 files changed, 41 insertions(+), 6 deletions(-)

Thanks for this, its hugely appreciated!

I aimed to do some profile measurements to show the difference in speed
but when testing it failed with:

Filtering out gdb-cross-x86_64:do_patch
Filtering out gdb-cross-x86_64:do_prepare_recipe_sysroot
Filtering out gdb-cross-x86_64:do_unpack
Gathering file list
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 77, in <module>
    sstate_content_cache[prefix] = build_sha_cache(prefix)
  File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 39, in build_sha_cache
    map_sha_to_files(sstate_dir, prefix, sha_map)
  File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 29, in map_sha_to_files
    sha = extract_sha(f)
  File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 21, in extract_sha
    return filename.split(':')[7].split('_')[0]
IndexError: list index out of range

and then when I fixed that by ignoring files which don't match the pattern:

Gathering file list
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 80, in <module>
    sstate_content_cache[prefix] = build_sha_cache(prefix)
  File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 45, in build_sha_cache
    map_sha_to_files(native_sstate_dir, prefix, sha_map)
  File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 27, in map_sha_to_files
    sstate_files = os.listdir(sstate_prefix_path)
FileNotFoundError: [Errno 2] No such file or directory: '/srv/autobuilder/autobuilder.yoctoproject.org/pub/sstateuniversal/b6/'


I therefore added:

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index ae5e09d89f..48cb67112f 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -26,10 +26,13 @@ def map_sha_to_files(dir_, prefix, sha_map):
     sstate_prefix_path = dir_ + '/' + prefix + '/'
     sstate_files = os.listdir(sstate_prefix_path)
     for f in sstate_files:
-        sha = extract_sha(f)
-        if sha not in sha_map:
-            sha_map[sha] = []
-        sha_map[sha].append(sstate_prefix_path + f)
+        try:
+            sha = extract_sha(f)
+            if sha not in sha_map:
+                sha_map[sha] = []
+            sha_map[sha].append(sstate_prefix_path + f)
+        except IndexError:
+            continue
 
 # given a prefix build a map of hash to list of files
 def build_sha_cache(prefix):
@@ -38,7 +41,7 @@ def build_sha_cache(prefix):
     sstate_dir = sys.argv[2]
     map_sha_to_files(sstate_dir, prefix, sha_map)
 
-    native_sstate_dir = sys.argv[2] + sys.argv[4]
+    native_sstate_dir = sys.argv[2] + '/' + sys.argv[4]
     map_sha_to_files(native_sstate_dir, prefix, sha_map)
 
     return sha_map


My benchmark before was seeing it spend over 30 minutes in bitbake
core-image-minimal:do_populate_sdk_ext on an otherwise idle autobuilder
cluster/NAS (35 minutes from a clean tmpdir).

With the patch applied and my above tweak, I saw:

real	6m58.120s

and I'd note this was with a full build running on the other workers so
the NAS was under load. I could try and get an exact time for the above
but didn't really see the point in spending another 30 minutes on it.

This is the time for the whole SDK image, not just the time this script
takes but its enough for me to say its a vast improvement! :)

Konrad: Mind if I squash in the above tweaks?

Also, the new code is a bit too chatty and leads to a lot of log
output, we'll need to tweak that too.

Cheers,

Richard



