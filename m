Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQKnT-0004mR-H9
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 18:24:11 +0200
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 09:10:19 -0700
Received: by mail-ia0-f197.google.com with SMTP id j5so5074503iaf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 09:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=XLeoU/nxEGvO5n9gVXQRb/S8zj4LJwC1sEK2BrfhQmA=;
	b=EUGsU07OUt7SX5fJLk8VxSD8SGbmgQrC+HdcVqRcYuZz6E/jwsLec8tRhn89ca4jX/
	EBCKAnXLhpmAxX5HiqOsTd7Yhm0pjmeaJMZV8yZmEbojIOXZwsY3Z4Dj0xdmuEontGC4
	wzph+R1l7CTNfkWl0EPYtFfmk4m28CvGNvMG1DeU0RHpIfzIJ4ctDsSzMO3/Xy9mAVCC
	gRrtqPFtBQADKri8gC64CDPDaG7RtzXz5BdmhD1WdBWLE5jor1/7ZyNVLxwLQ0SzRPda
	krsmbQQTMaN553Tss2rSUZ0ZbHOB+CHfQTtGe0lbLxLMDBTBPZrKeKiVUssA/3x9e517
	y1wA==
Received: by 10.182.117.74 with SMTP id kc10mr7402649obb.63.1350922244454;
	Mon, 22 Oct 2012 09:10:44 -0700 (PDT)
Received: by 10.182.117.74 with SMTP id kc10mr7402642obb.63.1350922244317;
	Mon, 22 Oct 2012 09:10:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Mon, 22 Oct 2012 09:10:23 -0700 (PDT)
In-Reply-To: <1350920486.3259.330.camel@phil-desktop>
References: <1350920486.3259.330.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Oct 2012 17:10:23 +0100
Message-ID: <CAJTo0LZ1AR+bGvo=1uT=mpaZ5zH8dQ46_f8YoUfxDC-jenJhQg@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQngb/JloElOWcI7a9gicwilkgnzq7M0GHIwNSWQ66Y32+3en23yI2pkMu6YLfsvMLY5x2fnzLJnOOmET7UjnWZgo9qGq1Wz0belYZMWMyLqMZu4M56n3xt3pLUNpQd3ebUybhpCW1kiSkapB71jRt64eX+TlvjcbPpOUtesH55ySgjNMcLZvZeD+O+j0W047dUveFZx
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why does glib-2.0 DEPEND on zip?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 16:24:11 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2012 16:41, Phil Blundell <philb@gnu.org> wrote:
> It seems that glib-2.0 has had a dependency on zip for as far back as I
> could be bothered to trace the history.  However, I couldn't immediately
> see any reason why this should be the case.  Does anyone know where this
> came from and what purpose it serves?

Well, in oe-core it came from:

$ git bisect good
31180a56d1b6981fa9d5588ad3538f34e339e0fe is the first bad commit
commit 31180a56d1b6981fa9d5588ad3538f34e339e0fe
Author: Kevin Tian <kevin.tian@intel.com>
Date:   Fri Jun 25 15:07:01 2010 +0800

    glib-2.0: upgrade to 2.24.1

    (borrow from OE 2.24.0, with study about reason for detail changes)
    [Patches-Poky]
        KEEP     _configure-libtool.patch_: fix cross-build env
        REMOVE   _glibconfig-sysdefs.h_: introduced in glib-1.2.10,
which is actually
                                         not valid today
        KEEP     _glib-gettexize-dir.patch_: another quite old patch
added before 2.10.3
                                             add history info, and
mark for upstream
    [Patches-OE]
        NOTAKE   _gio.patch_: a private extension for a window
matching library (wncksync)
        NOTAKE   _gvavriant.patch_: in 2.24.1 now
        NOTAKE   _gasync.patch_: in 2.24.1 now
        TAKE     _60_wait-longer-for-threads-to-die.patch: said to fix
anonying warning
        TAKE     _gatomic-proper-get-cast.patch_: fix error about type
casting. Instead of
                 using OE's patch, I found a better one from latest repo
        NOTAKE   _g_once_init_enter.patch_: in OE since 2.22.1, not
quite sure of its purpose,
                 also it's not in upstream yet

    [Recipe]
        - fix metadata
        - keep glib-2.inc which is for python optimization
        - remove PRIORITY since 'optional' is the default
        - no need to specially install glibconfig.h in ad hoc path,
which is only relied
          by 'obexpush' which poky doesn't have and can be fixed in
'obexpush' itself as
          what OE does
        - no need to manually create glib2.0/glib, which is handled by
current code
        - remove 'acpaths' which only applies to versions before 2.12.4
        - below lines are not taken from OE
            * glib-mkenums tweaks, which exists in OE for a long time
but never in poky.
              since there's no way to find out original commit, keep
poky's style instead.
            * host libtool check. not sure about its purpose, and it's
also in OE for quite
              long time

    Signed-off-by Kevin Tian <kevin.tian@intel.com>

I don't have an oe-classic tree to hand but some casual digging
doesn't reveal any zip dependencies.  There's no good reason for that
dependency that I'm aware of (grep certainly doesn't show anything
relevant), so I say kill it.

Ross


