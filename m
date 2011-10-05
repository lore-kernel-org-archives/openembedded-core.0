Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RBJd0-0002ok-Vb
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 07:02:47 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Oct 2011 21:57:10 -0700
Received: by bke5 with SMTP id 5so1501894bke.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 21:57:09 -0700 (PDT)
Received: by 10.223.42.24 with SMTP id q24mr927177fae.45.1317790628998;
	Tue, 04 Oct 2011 21:57:08 -0700 (PDT)
Received: from [10.6.18.233] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id o22sm627429fab.11.2011.10.04.21.57.06
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 21:57:08 -0700 (PDT)
Message-ID: <4E8BE3A0.2030500@intel.com>
Date: Tue, 04 Oct 2011 21:57:04 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317634209-3154-1-git-send-email-mokml@mnet-online.de>
	<4E8A114C.4050106@gmail.com>
	<20111004200537.GA28173@gonzales.palutemo>
	<CAMKF1sqgd94K8AiRyZn_+dX1PFig+bUYNP0R84K0AAueebPO9A@mail.gmail.com>
In-Reply-To: <CAMKF1sqgd94K8AiRyZn_+dX1PFig+bUYNP0R84K0AAueebPO9A@mail.gmail.com>
Cc: Klaus Kurzmann <mok@fluxnetz.de>
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
X-List-Received-Date: Wed, 05 Oct 2011 05:02:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2011 01:17 PM, Khem Raj wrote:
> On Tue, Oct 4, 2011 at 1:05 PM, Klaus 'mrmoku' Kurzmann
> <mokml@mnet-online.de>  wrote:
>> Hello,
>>
>> On Mon, 03 Oct 2011, Khem Raj wrote:
>>
>>> On 10/3/2011 2:30 AM, mokml@mnet-online.de wrote:
>>>> From: Klaus Kurzmann<mok@fluxnetz.de>
>>>>
>>>> * Without this patch programs using alsa-lib crash (alsamixer for example).
>>>> * This patch is taken verbatim from ArchLinux.
>>>>
>>
>>> can you add appropriate header for this?
>>
>> Sorry, still have to find my way into the new stuff :) Martin pointed
>> that out to me - after I sent the mail.
>>
>> I tried googling to find out about the upstream status for more than an
>> hour - without success. And glibc commit messages seem to be not very
>> informative mostly ;)
>>
I think you should look at the following wiki page for the header and 
SOB info:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Sau!

>
> the patch is not applied upstream last time I looked quickly.
>
>>> secondly this reverts the license year text
>>> from 2011 to 2010 that should not be needed.
>>
>> yeah, I have seen that. I think that comes from the patch being a revert
>> (or partial revert) of some commit. If it is ok to change 'stolen'
>> patches I can remove that.\
>
> yes licenses dont change because of a single revert there might be more
> changes that were done in that time frame which should have used the
> current year.
>
>>
>> Klaus 'mrmoku' Kurzmann
>>
>>>> Signed-off-by: Klaus Kurzmann<mok@fluxnetz.de>
>>>> ---
>>>>   .../eglibc-2.14/glibc-2.14-libdl-crash.patch       |  132 ++++++++++++++++++++
>>>>   meta/recipes-core/eglibc/eglibc_2.14.bb            |    3 +-
>>>>   2 files changed, 134 insertions(+), 1 deletions(-)
>>>>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
>>>>
>>>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch b/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
>>>> new file mode 100644
>>>> index 0000000..ee29f8c
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
>>>> @@ -0,0 +1,132 @@
>>>> +diff --git a/elf/dl-close.c b/elf/dl-close.c
>>>> +index 73b2a2f..9bd91e3 100644
>>>> +--- a/elf/dl-close.c
>>>> ++++ b/elf/dl-close.c
>>>> +@@ -1,5 +1,5 @@
>>>> + /* Close a shared object opened by `_dl_open'.
>>>> +-   Copyright (C) 1996-2007, 2009, 2010, 2011 Free Software Foundation, Inc.
>>>> ++   Copyright (C) 1996-2007, 2009, 2010 Free Software Foundation, Inc.
>>>> +    This file is part of the GNU C Library.
>>>> +
>>>> +    The GNU C Library is free software; you can redistribute it and/or
>>>> +@@ -119,17 +119,8 @@ _dl_close_worker (struct link_map *map)
>>>> +   if (map->l_direct_opencount>    0 || map->l_type != lt_loaded
>>>> +       || dl_close_state != not_pending)
>>>> +     {
>>>> +-      if (map->l_direct_opencount == 0)
>>>> +-   {
>>>> +-     if (map->l_type == lt_loaded)
>>>> +-       dl_close_state = rerun;
>>>> +-     else if (map->l_type == lt_library)
>>>> +-       {
>>>> +-         struct link_map **oldp = map->l_initfini;
>>>> +-         map->l_initfini = map->l_orig_initfini;
>>>> +-         _dl_scope_free (oldp);
>>>> +-       }
>>>> +-   }
>>>> ++      if (map->l_direct_opencount == 0&&    map->l_type == lt_loaded)
>>>> ++   dl_close_state = rerun;
>>>> +
>>>> +       /* There are still references to this object.  Do nothing more.  */
>>>> +       if (__builtin_expect (GLRO(dl_debug_mask)&    DL_DEBUG_FILES, 0))
>>>> +diff --git a/elf/dl-deps.c b/elf/dl-deps.c
>>>> +index 9e30594..3890d00 100644
>>>> +--- a/elf/dl-deps.c
>>>> ++++ b/elf/dl-deps.c
>>>> +@@ -478,6 +478,7 @@ _dl_map_object_deps (struct link_map *map,
>>>> +              nneeded * sizeof needed[0]);
>>>> +      atomic_write_barrier ();
>>>> +      l->l_initfini = l_initfini;
>>>> ++     l->l_free_initfini = 1;
>>>> +    }
>>>> +
>>>> +       /* If we have no auxiliary objects just go on to the next map.  */
>>>> +@@ -681,6 +682,7 @@ Filters not supported with LD_TRACE_PRELINKING"));
>>>> +   l_initfini[nlist] = NULL;
>>>> +   atomic_write_barrier ();
>>>> +   map->l_initfini = l_initfini;
>>>> ++  map->l_free_initfini = 1;
>>>> +   if (l_reldeps != NULL)
>>>> +     {
>>>> +       atomic_write_barrier ();
>>>> +@@ -689,5 +691,5 @@ Filters not supported with LD_TRACE_PRELINKING"));
>>>> +       _dl_scope_free (old_l_reldeps);
>>>> +     }
>>>> +   if (old_l_initfini != NULL)
>>>> +-      map->l_orig_initfini = old_l_initfini;
>>>> ++    _dl_scope_free (old_l_initfini);
>>>> + }
>>>> +diff --git a/elf/dl-libc.c b/elf/dl-libc.c
>>>> +index 7be9483..a13fce3 100644
>>>> +--- a/elf/dl-libc.c
>>>> ++++ b/elf/dl-libc.c
>>>> +@@ -265,13 +265,13 @@ libc_freeres_fn (free_mem)
>>>> +
>>>> +   for (Lmid_t ns = 0; ns<    GL(dl_nns); ++ns)
>>>> +     {
>>>> +-      /* Remove all additional names added to the objects.  */
>>>> +       for (l = GL(dl_ns)[ns]._ns_loaded; l != NULL; l = l->l_next)
>>>> +    {
>>>> +      struct libname_list *lnp = l->l_libname->next;
>>>> +
>>>> +      l->l_libname->next = NULL;
>>>> +
>>>> ++     /* Remove all additional names added to the objects.  */
>>>> +      while (lnp != NULL)
>>>> +        {
>>>> +          struct libname_list *old = lnp;
>>>> +@@ -279,6 +279,10 @@ libc_freeres_fn (free_mem)
>>>> +          if (! old->dont_free)
>>>> +            free (old);
>>>> +        }
>>>> ++
>>>> ++     /* Free the initfini dependency list.  */
>>>> ++     if (l->l_free_initfini)
>>>> ++       free (l->l_initfini);
>>>> +    }
>>>> +
>>>> +       if (__builtin_expect (GL(dl_ns)[ns]._ns_global_scope_alloc, 0) != 0
>>>> +diff --git a/elf/rtld.c b/elf/rtld.c
>>>> +index 4a9109e..617e30e 100644
>>>> +--- a/elf/rtld.c
>>>> ++++ b/elf/rtld.c
>>>> +@@ -2251,6 +2251,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
>>>> +          lnp->dont_free = 1;
>>>> +          lnp = lnp->next;
>>>> +        }
>>>> ++     l->l_free_initfini = 0;
>>>> +
>>>> +      if (l !=&GL(dl_rtld_map))
>>>> +        _dl_relocate_object (l, l->l_scope, GLRO(dl_lazy) ? RTLD_LAZY : 0,
>>>> +diff --git a/include/link.h b/include/link.h
>>>> +index e877104..051b99a 100644
>>>> +--- a/include/link.h
>>>> ++++ b/include/link.h
>>>> +@@ -1,6 +1,6 @@
>>>> + /* Data structure for communication from the run-time dynamic linker for
>>>> +    loaded ELF shared objects.
>>>> +-   Copyright (C) 1995-2006, 2007, 2009, 2010, 2011 Free Software Foundation, Inc.
>>>> ++   Copyright (C) 1995-2006, 2007, 2009, 2010 Free Software Foundation, Inc.
>>>> +    This file is part of the GNU C Library.
>>>> +
>>>> +    The GNU C Library is free software; you can redistribute it and/or
>>>> +@@ -192,6 +192,9 @@ struct link_map
>>>> +                                             during LD_TRACE_PRELINKING=1
>>>> +                                             contains any DT_SYMBOLIC
>>>> +                                             libraries.  */
>>>> ++    unsigned int l_free_initfini:1; /* Nonzero if l_initfini can be
>>>> ++                                  freed, ie. not allocated with
>>>> ++                                  the dummy malloc in ld.so.  */
>>>> +
>>>> +     /* Collected information about own RPATH directories.  */
>>>> +     struct r_search_path_struct l_rpath_dirs;
>>>> +@@ -240,9 +243,6 @@ struct link_map
>>>> +
>>>> +     /* List of object in order of the init and fini calls.  */
>>>> +     struct link_map **l_initfini;
>>>> +-    /* The init and fini list generated at startup, saved when the
>>>> +-       object is also loaded dynamically.  */
>>>> +-    struct link_map **l_orig_initfini;
>>>> +
>>>> +     /* List of the dependencies introduced through symbol binding.  */
>>>> +     struct link_map_reldeps
>>>> diff --git a/meta/recipes-core/eglibc/eglibc_2.14.bb b/meta/recipes-core/eglibc/eglibc_2.14.bb
>>>> index b2821db..4129947 100644
>>>> --- a/meta/recipes-core/eglibc/eglibc_2.14.bb
>>>> +++ b/meta/recipes-core/eglibc/eglibc_2.14.bb
>>>> @@ -3,7 +3,7 @@ require eglibc.inc
>>>>   SRCREV = "15225"
>>>>
>>>>   DEPENDS += "gperf-native"
>>>> -PR = "r0"
>>>> +PR = "r1"
>>>>   PR_append = "+svnr${SRCPV}"
>>>>
>>>>   EGLIBC_BRANCH="eglibc-2_14"
>>>> @@ -19,6 +19,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
>>>>              file://ppc-sqrt.patch \
>>>>              file://multilib_readlib.patch \
>>>>              file://eglibc-rpc-export-again.patch \
>>>> +       file://glibc-2.14-libdl-crash.patch \
>>>>         "
>>>>   LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
>>>>         file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
>>
>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



