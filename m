Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RAoZR-0008V2-DC
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 21:53:01 +0200
Received: by yxj17 with SMTP id 17so3800462yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 12:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=awLe9ekSBX417ukRVmlYSQEc3dUlBoS3ciXw4+luBaM=;
	b=UlIzWRnsYCqsP2IvKdxULlqwTxlbGYgyexpihSfFkALYbNeXbJ1Egl7/V9naepO2fU
	oGnh7QSTcJgjw46RATeTnIaCsPldJ1o383hv8yoHYQG2IJ2FyuyXpCxGh/NBDNTOqm1d
	zpojKBvo8vw5jZIYNDTcfaHjysMEDjYaebVhA=
Received: by 10.100.213.16 with SMTP id l16mr312107ang.72.1317671248411;
	Mon, 03 Oct 2011 12:47:28 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id z5sm39055391anz.7.2011.10.03.12.47.26
	(version=SSLv3 cipher=OTHER); Mon, 03 Oct 2011 12:47:27 -0700 (PDT)
Message-ID: <4E8A114C.4050106@gmail.com>
Date: Mon, 03 Oct 2011 12:47:24 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1317634209-3154-1-git-send-email-mokml@mnet-online.de>
In-Reply-To: <1317634209-3154-1-git-send-email-mokml@mnet-online.de>
Subject: Re: [PATCH] eglibc-2.14: add patch to fix libdl crash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Oct 2011 19:53:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/2011 2:30 AM, mokml@mnet-online.de wrote:
> From: Klaus Kurzmann<mok@fluxnetz.de>
>
> * Without this patch programs using alsa-lib crash (alsamixer for example).
> * This patch is taken verbatim from ArchLinux.
>

can you add appropriate header for this?
secondly this reverts the license year text
from 2011 to 2010 that should not be needed.

> Signed-off-by: Klaus Kurzmann<mok@fluxnetz.de>
> ---
>   .../eglibc-2.14/glibc-2.14-libdl-crash.patch       |  132 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc_2.14.bb            |    3 +-
>   2 files changed, 134 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
>
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch b/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
> new file mode 100644
> index 0000000..ee29f8c
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
> @@ -0,0 +1,132 @@
> +diff --git a/elf/dl-close.c b/elf/dl-close.c
> +index 73b2a2f..9bd91e3 100644
> +--- a/elf/dl-close.c
> ++++ b/elf/dl-close.c
> +@@ -1,5 +1,5 @@
> + /* Close a shared object opened by `_dl_open'.
> +-   Copyright (C) 1996-2007, 2009, 2010, 2011 Free Software Foundation, Inc.
> ++   Copyright (C) 1996-2007, 2009, 2010 Free Software Foundation, Inc.
> +    This file is part of the GNU C Library.
> +
> +    The GNU C Library is free software; you can redistribute it and/or
> +@@ -119,17 +119,8 @@ _dl_close_worker (struct link_map *map)
> +   if (map->l_direct_opencount>  0 || map->l_type != lt_loaded
> +       || dl_close_state != not_pending)
> +     {
> +-      if (map->l_direct_opencount == 0)
> +-	{
> +-	  if (map->l_type == lt_loaded)
> +-	    dl_close_state = rerun;
> +-	  else if (map->l_type == lt_library)
> +-	    {
> +-	      struct link_map **oldp = map->l_initfini;
> +-	      map->l_initfini = map->l_orig_initfini;
> +-	      _dl_scope_free (oldp);
> +-	    }
> +-	}
> ++      if (map->l_direct_opencount == 0&&  map->l_type == lt_loaded)
> ++	dl_close_state = rerun;
> +
> +       /* There are still references to this object.  Do nothing more.  */
> +       if (__builtin_expect (GLRO(dl_debug_mask)&  DL_DEBUG_FILES, 0))
> +diff --git a/elf/dl-deps.c b/elf/dl-deps.c
> +index 9e30594..3890d00 100644
> +--- a/elf/dl-deps.c
> ++++ b/elf/dl-deps.c
> +@@ -478,6 +478,7 @@ _dl_map_object_deps (struct link_map *map,
> + 		  nneeded * sizeof needed[0]);
> + 	  atomic_write_barrier ();
> + 	  l->l_initfini = l_initfini;
> ++	  l->l_free_initfini = 1;
> + 	}
> +
> +       /* If we have no auxiliary objects just go on to the next map.  */
> +@@ -681,6 +682,7 @@ Filters not supported with LD_TRACE_PRELINKING"));
> +   l_initfini[nlist] = NULL;
> +   atomic_write_barrier ();
> +   map->l_initfini = l_initfini;
> ++  map->l_free_initfini = 1;
> +   if (l_reldeps != NULL)
> +     {
> +       atomic_write_barrier ();
> +@@ -689,5 +691,5 @@ Filters not supported with LD_TRACE_PRELINKING"));
> +       _dl_scope_free (old_l_reldeps);
> +     }
> +   if (old_l_initfini != NULL)
> +-      map->l_orig_initfini = old_l_initfini;
> ++    _dl_scope_free (old_l_initfini);
> + }
> +diff --git a/elf/dl-libc.c b/elf/dl-libc.c
> +index 7be9483..a13fce3 100644
> +--- a/elf/dl-libc.c
> ++++ b/elf/dl-libc.c
> +@@ -265,13 +265,13 @@ libc_freeres_fn (free_mem)
> +
> +   for (Lmid_t ns = 0; ns<  GL(dl_nns); ++ns)
> +     {
> +-      /* Remove all additional names added to the objects.  */
> +       for (l = GL(dl_ns)[ns]._ns_loaded; l != NULL; l = l->l_next)
> + 	{
> + 	  struct libname_list *lnp = l->l_libname->next;
> +
> + 	  l->l_libname->next = NULL;
> +
> ++	  /* Remove all additional names added to the objects.  */
> + 	  while (lnp != NULL)
> + 	    {
> + 	      struct libname_list *old = lnp;
> +@@ -279,6 +279,10 @@ libc_freeres_fn (free_mem)
> + 	      if (! old->dont_free)
> + 		free (old);
> + 	    }
> ++
> ++	  /* Free the initfini dependency list.  */
> ++	  if (l->l_free_initfini)
> ++	    free (l->l_initfini);
> + 	}
> +
> +       if (__builtin_expect (GL(dl_ns)[ns]._ns_global_scope_alloc, 0) != 0
> +diff --git a/elf/rtld.c b/elf/rtld.c
> +index 4a9109e..617e30e 100644
> +--- a/elf/rtld.c
> ++++ b/elf/rtld.c
> +@@ -2251,6 +2251,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
> + 	      lnp->dont_free = 1;
> + 	      lnp = lnp->next;
> + 	    }
> ++	  l->l_free_initfini = 0;
> +
> + 	  if (l !=&GL(dl_rtld_map))
> + 	    _dl_relocate_object (l, l->l_scope, GLRO(dl_lazy) ? RTLD_LAZY : 0,
> +diff --git a/include/link.h b/include/link.h
> +index e877104..051b99a 100644
> +--- a/include/link.h
> ++++ b/include/link.h
> +@@ -1,6 +1,6 @@
> + /* Data structure for communication from the run-time dynamic linker for
> +    loaded ELF shared objects.
> +-   Copyright (C) 1995-2006, 2007, 2009, 2010, 2011 Free Software Foundation, Inc.
> ++   Copyright (C) 1995-2006, 2007, 2009, 2010 Free Software Foundation, Inc.
> +    This file is part of the GNU C Library.
> +
> +    The GNU C Library is free software; you can redistribute it and/or
> +@@ -192,6 +192,9 @@ struct link_map
> + 						 during LD_TRACE_PRELINKING=1
> + 						 contains any DT_SYMBOLIC
> + 						 libraries.  */
> ++    unsigned int l_free_initfini:1; /* Nonzero if l_initfini can be
> ++				       freed, ie. not allocated with
> ++				       the dummy malloc in ld.so.  */
> +
> +     /* Collected information about own RPATH directories.  */
> +     struct r_search_path_struct l_rpath_dirs;
> +@@ -240,9 +243,6 @@ struct link_map
> +
> +     /* List of object in order of the init and fini calls.  */
> +     struct link_map **l_initfini;
> +-    /* The init and fini list generated at startup, saved when the
> +-       object is also loaded dynamically.  */
> +-    struct link_map **l_orig_initfini;
> +
> +     /* List of the dependencies introduced through symbol binding.  */
> +     struct link_map_reldeps
> diff --git a/meta/recipes-core/eglibc/eglibc_2.14.bb b/meta/recipes-core/eglibc/eglibc_2.14.bb
> index b2821db..4129947 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.14.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.14.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>   SRCREV = "15225"
>
>   DEPENDS += "gperf-native"
> -PR = "r0"
> +PR = "r1"
>   PR_append = "+svnr${SRCPV}"
>
>   EGLIBC_BRANCH="eglibc-2_14"
> @@ -19,6 +19,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
>              file://ppc-sqrt.patch \
>              file://multilib_readlib.patch \
>              file://eglibc-rpc-export-again.patch \
> +	   file://glibc-2.14-libdl-crash.patch \
>   	   "
>   LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
>         file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \



