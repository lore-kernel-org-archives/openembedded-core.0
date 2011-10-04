Received: from fluxnetz.de ([213.133.97.20] helo=digox.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mokml@mnet-online.de>) id 1RBBPo-0004LX-I9
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 22:16:36 +0200
Received: from gonzales.palutemo by digox.de with esmtp (emil_xPX2m_4l9S5yx);
	Tue, 04 Oct 2011 22:06:51 +0200
Date: Tue, 4 Oct 2011 22:05:38 +0200
From: Klaus 'mrmoku' Kurzmann <mokml@mnet-online.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20111004200537.GA28173@gonzales.palutemo>
References: <1317634209-3154-1-git-send-email-mokml@mnet-online.de>
	<4E8A114C.4050106@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4E8A114C.4050106@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc-2.14: add patch to fix libdl crash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Klaus Kurzmann <mok@fluxnetz.de>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 04 Oct 2011 20:16:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On Mon, 03 Oct 2011, Khem Raj wrote:

> On 10/3/2011 2:30 AM, mokml@mnet-online.de wrote:
> >From: Klaus Kurzmann<mok@fluxnetz.de>
> >
> >* Without this patch programs using alsa-lib crash (alsamixer for example).
> >* This patch is taken verbatim from ArchLinux.
> >

> can you add appropriate header for this?

Sorry, still have to find my way into the new stuff :) Martin pointed
that out to me - after I sent the mail.

I tried googling to find out about the upstream status for more than an
hour - without success. And glibc commit messages seem to be not very
informative mostly ;)

> secondly this reverts the license year text
> from 2011 to 2010 that should not be needed.

yeah, I have seen that. I think that comes from the patch being a revert
(or partial revert) of some commit. If it is ok to change 'stolen'
patches I can remove that.

Klaus 'mrmoku' Kurzmann

> >Signed-off-by: Klaus Kurzmann<mok@fluxnetz.de>
> >---
> >  .../eglibc-2.14/glibc-2.14-libdl-crash.patch       |  132 ++++++++++++++++++++
> >  meta/recipes-core/eglibc/eglibc_2.14.bb            |    3 +-
> >  2 files changed, 134 insertions(+), 1 deletions(-)
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
> >
> >diff --git a/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch b/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
> >new file mode 100644
> >index 0000000..ee29f8c
> >--- /dev/null
> >+++ b/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
> >@@ -0,0 +1,132 @@
> >+diff --git a/elf/dl-close.c b/elf/dl-close.c
> >+index 73b2a2f..9bd91e3 100644
> >+--- a/elf/dl-close.c
> >++++ b/elf/dl-close.c
> >+@@ -1,5 +1,5 @@
> >+ /* Close a shared object opened by `_dl_open'.
> >+-   Copyright (C) 1996-2007, 2009, 2010, 2011 Free Software Foundation, Inc.
> >++   Copyright (C) 1996-2007, 2009, 2010 Free Software Foundation, Inc.
> >+    This file is part of the GNU C Library.
> >+
> >+    The GNU C Library is free software; you can redistribute it and/or
> >+@@ -119,17 +119,8 @@ _dl_close_worker (struct link_map *map)
> >+   if (map->l_direct_opencount>  0 || map->l_type != lt_loaded
> >+       || dl_close_state != not_pending)
> >+     {
> >+-      if (map->l_direct_opencount == 0)
> >+-	{
> >+-	  if (map->l_type == lt_loaded)
> >+-	    dl_close_state = rerun;
> >+-	  else if (map->l_type == lt_library)
> >+-	    {
> >+-	      struct link_map **oldp = map->l_initfini;
> >+-	      map->l_initfini = map->l_orig_initfini;
> >+-	      _dl_scope_free (oldp);
> >+-	    }
> >+-	}
> >++      if (map->l_direct_opencount == 0&&  map->l_type == lt_loaded)
> >++	dl_close_state = rerun;
> >+
> >+       /* There are still references to this object.  Do nothing more.  */
> >+       if (__builtin_expect (GLRO(dl_debug_mask)&  DL_DEBUG_FILES, 0))
> >+diff --git a/elf/dl-deps.c b/elf/dl-deps.c
> >+index 9e30594..3890d00 100644
> >+--- a/elf/dl-deps.c
> >++++ b/elf/dl-deps.c
> >+@@ -478,6 +478,7 @@ _dl_map_object_deps (struct link_map *map,
> >+ 		  nneeded * sizeof needed[0]);
> >+ 	  atomic_write_barrier ();
> >+ 	  l->l_initfini = l_initfini;
> >++	  l->l_free_initfini = 1;
> >+ 	}
> >+
> >+       /* If we have no auxiliary objects just go on to the next map.  */
> >+@@ -681,6 +682,7 @@ Filters not supported with LD_TRACE_PRELINKING"));
> >+   l_initfini[nlist] = NULL;
> >+   atomic_write_barrier ();
> >+   map->l_initfini = l_initfini;
> >++  map->l_free_initfini = 1;
> >+   if (l_reldeps != NULL)
> >+     {
> >+       atomic_write_barrier ();
> >+@@ -689,5 +691,5 @@ Filters not supported with LD_TRACE_PRELINKING"));
> >+       _dl_scope_free (old_l_reldeps);
> >+     }
> >+   if (old_l_initfini != NULL)
> >+-      map->l_orig_initfini = old_l_initfini;
> >++    _dl_scope_free (old_l_initfini);
> >+ }
> >+diff --git a/elf/dl-libc.c b/elf/dl-libc.c
> >+index 7be9483..a13fce3 100644
> >+--- a/elf/dl-libc.c
> >++++ b/elf/dl-libc.c
> >+@@ -265,13 +265,13 @@ libc_freeres_fn (free_mem)
> >+
> >+   for (Lmid_t ns = 0; ns<  GL(dl_nns); ++ns)
> >+     {
> >+-      /* Remove all additional names added to the objects.  */
> >+       for (l = GL(dl_ns)[ns]._ns_loaded; l != NULL; l = l->l_next)
> >+ 	{
> >+ 	  struct libname_list *lnp = l->l_libname->next;
> >+
> >+ 	  l->l_libname->next = NULL;
> >+
> >++	  /* Remove all additional names added to the objects.  */
> >+ 	  while (lnp != NULL)
> >+ 	    {
> >+ 	      struct libname_list *old = lnp;
> >+@@ -279,6 +279,10 @@ libc_freeres_fn (free_mem)
> >+ 	      if (! old->dont_free)
> >+ 		free (old);
> >+ 	    }
> >++
> >++	  /* Free the initfini dependency list.  */
> >++	  if (l->l_free_initfini)
> >++	    free (l->l_initfini);
> >+ 	}
> >+
> >+       if (__builtin_expect (GL(dl_ns)[ns]._ns_global_scope_alloc, 0) != 0
> >+diff --git a/elf/rtld.c b/elf/rtld.c
> >+index 4a9109e..617e30e 100644
> >+--- a/elf/rtld.c
> >++++ b/elf/rtld.c
> >+@@ -2251,6 +2251,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
> >+ 	      lnp->dont_free = 1;
> >+ 	      lnp = lnp->next;
> >+ 	    }
> >++	  l->l_free_initfini = 0;
> >+
> >+ 	  if (l !=&GL(dl_rtld_map))
> >+ 	    _dl_relocate_object (l, l->l_scope, GLRO(dl_lazy) ? RTLD_LAZY : 0,
> >+diff --git a/include/link.h b/include/link.h
> >+index e877104..051b99a 100644
> >+--- a/include/link.h
> >++++ b/include/link.h
> >+@@ -1,6 +1,6 @@
> >+ /* Data structure for communication from the run-time dynamic linker for
> >+    loaded ELF shared objects.
> >+-   Copyright (C) 1995-2006, 2007, 2009, 2010, 2011 Free Software Foundation, Inc.
> >++   Copyright (C) 1995-2006, 2007, 2009, 2010 Free Software Foundation, Inc.
> >+    This file is part of the GNU C Library.
> >+
> >+    The GNU C Library is free software; you can redistribute it and/or
> >+@@ -192,6 +192,9 @@ struct link_map
> >+ 						 during LD_TRACE_PRELINKING=1
> >+ 						 contains any DT_SYMBOLIC
> >+ 						 libraries.  */
> >++    unsigned int l_free_initfini:1; /* Nonzero if l_initfini can be
> >++				       freed, ie. not allocated with
> >++				       the dummy malloc in ld.so.  */
> >+
> >+     /* Collected information about own RPATH directories.  */
> >+     struct r_search_path_struct l_rpath_dirs;
> >+@@ -240,9 +243,6 @@ struct link_map
> >+
> >+     /* List of object in order of the init and fini calls.  */
> >+     struct link_map **l_initfini;
> >+-    /* The init and fini list generated at startup, saved when the
> >+-       object is also loaded dynamically.  */
> >+-    struct link_map **l_orig_initfini;
> >+
> >+     /* List of the dependencies introduced through symbol binding.  */
> >+     struct link_map_reldeps
> >diff --git a/meta/recipes-core/eglibc/eglibc_2.14.bb b/meta/recipes-core/eglibc/eglibc_2.14.bb
> >index b2821db..4129947 100644
> >--- a/meta/recipes-core/eglibc/eglibc_2.14.bb
> >+++ b/meta/recipes-core/eglibc/eglibc_2.14.bb
> >@@ -3,7 +3,7 @@ require eglibc.inc
> >  SRCREV = "15225"
> >
> >  DEPENDS += "gperf-native"
> >-PR = "r0"
> >+PR = "r1"
> >  PR_append = "+svnr${SRCPV}"
> >
> >  EGLIBC_BRANCH="eglibc-2_14"
> >@@ -19,6 +19,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
> >             file://ppc-sqrt.patch \
> >             file://multilib_readlib.patch \
> >             file://eglibc-rpc-export-again.patch \
> >+	   file://glibc-2.14-libdl-crash.patch \
> >  	   "
> >  LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
> >        file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



