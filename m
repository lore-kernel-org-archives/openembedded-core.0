Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4DE70F06
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Sep 2014 20:19:00 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id rd3so514688pab.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Sep 2014 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=8166dVsC2zJxO7PEfacF2swOBUeRizXtob+nbidpb3A=;
	b=HWdcYOxIBKPB6QWuFfxWy8yP4Fem9kYaMzyPrJQ1loGlYhQOdAR/FdHKJyd9wX1UUC
	50Rh5KJGja+YhQnPxxEdua98gbzJv8rHULqtS4NYL0K2s8oKcwgAaDHaiRZdcB7n/9gW
	jW/v7G9r+uw0jCLLBsfa8nn4sNZOQIfH5E+3L9Kp9aYL4smLl/SSotgl/tYppf3BIu0h
	zoYEe6rkIiTMLBOauTwYLTIkUV3XNiTwg6iNIkJcGj1FSvBbrXKQtbZMEcFnfbNHRtyV
	ERfyrcwhooR5jPCHh5xdRyttbJMIdYKRhbIdTWzJGfiZk2Q6SjhYnCuL7k37R6V8otMn
	iKrg==
X-Received: by 10.66.66.101 with SMTP id e5mr13093236pat.100.1411244341834;
	Sat, 20 Sep 2014 13:19:01 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:45e0:336d:c8bc:e4d9?
	([2601:c:9380:601:45e0:336d:c8bc:e4d9])
	by mx.google.com with ESMTPSA id r7sm5259999pdj.75.2014.09.20.13.18.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Sep 2014 13:19:00 -0700 (PDT)
Message-ID: <541DE132.7090000@gmail.com>
Date: Sat, 20 Sep 2014 13:18:58 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1410657580-5311-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1410657580-5311-1-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH][Daisy] eglibc: CVE-2014-5119 fix
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
X-List-Received-Date: Sat, 20 Sep 2014 20:19:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Did I sent this to the wrong list (wouldn't have been the first time)?

- Armin

On 09/13/2014 06:19 PM, Armin Kuster wrote:
> __gconv_translit_find: Disable function [BZ #17187]
>
> This functionality has never worked correctly, and the implementation
> contained a security vulnerability (CVE-2014-5119).
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   .../eglibc/eglibc-2.19/CVE-2014-5119.patch         | 240 +++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc_2.19.bb            |   1 +
>   2 files changed, 241 insertions(+)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-5119.patch
>
> diff --git a/meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-5119.patch b/meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-5119.patch
> new file mode 100644
> index 0000000..51c7037
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-5119.patch
> @@ -0,0 +1,240 @@
> +CVE-2014-5119
> +
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +Upstream commit:
> +
> +https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=a1a6a401ab0a3c9f15fb7eaebbdcee24192254e8
> +
> +
> +From a1a6a401ab0a3c9f15fb7eaebbdcee24192254e8 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Tue, 26 Aug 2014 19:38:59 +0200
> +Subject: [PATCH] __gconv_translit_find: Disable function [BZ #17187]
> +
> +This functionality has never worked correctly, and the implementation
> +contained a security vulnerability (CVE-2014-5119).
> +---
> + ChangeLog           |    7 ++
> + NEWS                |    9 ++-
> + iconv/gconv_trans.c |  177 +-------------------------------------------------
> + 3 files changed, 19 insertions(+), 174 deletions(-)
> +
> +Index: libc/NEWS
> +===================================================================
> +--- libc.orig/NEWS
> ++++ libc/NEWS
> +@@ -26,7 +26,7 @@ Version 2.19
> +   16271, 16274, 16283, 16289, 16293, 16314, 16316, 16330, 16337, 16338,
> +   16356, 16365, 16366, 16369, 16372, 16375, 16379, 16384, 16385, 16386,
> +   16387, 16390, 16394, 16398, 16400, 16407, 16408, 16414, 16430, 16431,
> +-  16453, 16474, 16506, 16510, 16529
> ++  16453, 16474, 16506, 16510, 16529, 17187
> +
> + * Slovenian translations for glibc messages have been contributed by the
> +   Translation Project's Slovenian team of translators.
> +Index: libc/iconv/gconv_trans.c
> +===================================================================
> +--- libc.orig/iconv/gconv_trans.c
> ++++ libc/iconv/gconv_trans.c
> +@@ -241,181 +241,12 @@ __gconv_transliterate (struct __gconv_st
> +   return __GCONV_ILLEGAL_INPUT;
> + }
> +
> +-
> +-/* Structure to represent results of found (or not) transliteration
> +-   modules.  */
> +-struct known_trans
> +-{
> +-  /* This structure must remain the first member.  */
> +-  struct trans_struct info;
> +-
> +-  char *fname;
> +-  void *handle;
> +-  int open_count;
> +-};
> +-
> +-
> +-/* Tree with results of previous calls to __gconv_translit_find.  */
> +-static void *search_tree;
> +-
> +-/* We modify global data.   */
> +-__libc_lock_define_initialized (static, lock);
> +-
> +-
> +-/* Compare two transliteration entries.  */
> +-static int
> +-trans_compare (const void *p1, const void *p2)
> +-{
> +-  const struct known_trans *s1 = (const struct known_trans *) p1;
> +-  const struct known_trans *s2 = (const struct known_trans *) p2;
> +-
> +-  return strcmp (s1->info.name, s2->info.name);
> +-}
> +-
> +-
> +-/* Open (maybe reopen) the module named in the struct.  Get the function
> +-   and data structure pointers we need.  */
> +-static int
> +-open_translit (struct known_trans *trans)
> +-{
> +-  __gconv_trans_query_fct queryfct;
> +-
> +-  trans->handle = __libc_dlopen (trans->fname);
> +-  if (trans->handle == NULL)
> +-    /* Not available.  */
> +-    return 1;
> +-
> +-  /* Find the required symbol.  */
> +-  queryfct = __libc_dlsym (trans->handle, "gconv_trans_context");
> +-  if (queryfct == NULL)
> +-    {
> +-      /* We cannot live with that.  */
> +-    close_and_out:
> +-      __libc_dlclose (trans->handle);
> +-      trans->handle = NULL;
> +-      return 1;
> +-    }
> +-
> +-  /* Get the context.  */
> +-  if (queryfct (trans->info.name, &trans->info.csnames, &trans->info.ncsnames)
> +-      != 0)
> +-    goto close_and_out;
> +-
> +-  /* Of course we also have to have the actual function.  */
> +-  trans->info.trans_fct = __libc_dlsym (trans->handle, "gconv_trans");
> +-  if (trans->info.trans_fct == NULL)
> +-    goto close_and_out;
> +-
> +-  /* Now the optional functions.  */
> +-  trans->info.trans_init_fct =
> +-    __libc_dlsym (trans->handle, "gconv_trans_init");
> +-  trans->info.trans_context_fct =
> +-    __libc_dlsym (trans->handle, "gconv_trans_context");
> +-  trans->info.trans_end_fct =
> +-    __libc_dlsym (trans->handle, "gconv_trans_end");
> +-
> +-  trans->open_count = 1;
> +-
> +-  return 0;
> +-}
> +-
> +-
> + int
> + internal_function
> + __gconv_translit_find (struct trans_struct *trans)
> + {
> +-  struct known_trans **found;
> +-  const struct path_elem *runp;
> +-  int res = 1;
> +-
> +-  /* We have to have a name.  */
> +-  assert (trans->name != NULL);
> +-
> +-  /* Acquire the lock.  */
> +-  __libc_lock_lock (lock);
> +-
> +-  /* See whether we know this module already.  */
> +-  found = __tfind (trans, &search_tree, trans_compare);
> +-  if (found != NULL)
> +-    {
> +-      /* Is this module available?  */
> +-      if ((*found)->handle != NULL)
> +-	{
> +-	  /* Maybe we have to reopen the file.  */
> +-	  if ((*found)->handle != (void *) -1)
> +-	    /* The object is not unloaded.  */
> +-	    res = 0;
> +-	  else if (open_translit (*found) == 0)
> +-	    {
> +-	      /* Copy the data.  */
> +-	      *trans = (*found)->info;
> +-	      (*found)->open_count++;
> +-	      res = 0;
> +-	    }
> +-	}
> +-    }
> +-  else
> +-    {
> +-      size_t name_len = strlen (trans->name) + 1;
> +-      int need_so = 0;
> +-      struct known_trans *newp;
> +-
> +-      /* We have to continue looking for the module.  */
> +-      if (__gconv_path_elem == NULL)
> +-	__gconv_get_path ();
> +-
> +-      /* See whether we have to append .so.  */
> +-      if (name_len <= 4 || memcmp (&trans->name[name_len - 4], ".so", 3) != 0)
> +-	need_so = 1;
> +-
> +-      /* Create a new entry.  */
> +-      newp = (struct known_trans *) malloc (sizeof (struct known_trans)
> +-					    + (__gconv_max_path_elem_len
> +-					       + name_len + 3)
> +-					    + name_len);
> +-      if (newp != NULL)
> +-	{
> +-	  char *cp;
> +-
> +-	  /* Clear the struct.  */
> +-	  memset (newp, '\0', sizeof (struct known_trans));
> +-
> +-	  /* Store a copy of the module name.  */
> +-	  newp->info.name = cp = (char *) (newp + 1);
> +-	  cp = __mempcpy (cp, trans->name, name_len);
> +-
> +-	  newp->fname = cp;
> +-
> +-	  /* Search in all the directories.  */
> +-	  for (runp = __gconv_path_elem; runp->name != NULL; ++runp)
> +-	    {
> +-	      cp = __mempcpy (__stpcpy ((char *) newp->fname, runp->name),
> +-			      trans->name, name_len);
> +-	      if (need_so)
> +-		memcpy (cp, ".so", sizeof (".so"));
> +-
> +-	      if (open_translit (newp) == 0)
> +-		{
> +-		  /* We found a module.  */
> +-		  res = 0;
> +-		  break;
> +-		}
> +-	    }
> +-
> +-	  if (res)
> +-	    newp->fname = NULL;
> +-
> +-	  /* In any case we'll add the entry to our search tree.  */
> +-	  if (__tsearch (newp, &search_tree, trans_compare) == NULL)
> +-	    {
> +-	      /* Yickes, this should not happen.  Unload the object.  */
> +-	      res = 1;
> +-	      /* XXX unload here.  */
> +-	    }
> +-	}
> +-    }
> +-
> +-  __libc_lock_unlock (lock);
> +-
> +-  return res;
> ++  /* Transliteration module loading has been removed because it never
> ++     worked as intended and suffered from a security vulnerability.
> ++     Consequently, this function always fails.  */
> ++  return 1;
> + }
> +Index: libc/ChangeLog
> +===================================================================
> +--- libc.orig/ChangeLog
> ++++ libc/ChangeLog
> +@@ -1,3 +1,10 @@
> ++2014-08-26  Florian Weimer  <fweimer@redhat.com>
> ++
> ++	[BZ #17187]
> ++	* iconv/gconv_trans.c (struct known_trans, search_tree, lock,
> ++	trans_compare, open_translit, __gconv_translit_find):
> ++	Remove module loading code.
> ++
> + 2014-02-06  Carlos O'Donell  <carlos@redhat.com>
> +
> + 	[BZ #16529]
> diff --git a/meta/recipes-core/eglibc/eglibc_2.19.bb b/meta/recipes-core/eglibc/eglibc_2.19.bb
> index c65e6a5..090cfe6 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.19.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
> @@ -26,6 +26,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25
>              file://fix-tibetian-locales.patch \
>              file://ppce6500-32b_slow_ieee754_sqrt.patch \
>              file://grok_gold.patch \
> +           file://CVE-2014-5119.patch \
>             "
>   SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
>   SRC_URI[sha256sum] = "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
>

