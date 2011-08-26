Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qwskj-0003K7-DJ
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 11:31:05 +0200
Received: by vwe42 with SMTP id 42so2887693vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 02:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JEBlxCRSYZGtxqP3eNnFvWc1466KF55PbkBg3gzhRsM=;
	b=gP4u7qKp/rJVvJFkq4cBJZ6B/BBsRNbicovgwQ766vMYdxzQct6hQPDuUZGW45hRYa
	Ka4cMeWPK6JfDWCWlY1nIa5aFSWzn/Ho1czWP5mnBvGOzYGLR4L2cAxILSNVRhfIobyJ
	AQfWgXKcebUWdseFCHUx9JFt8LJUBewJ/LCfA=
MIME-Version: 1.0
Received: by 10.52.178.164 with SMTP id cz4mr839764vdc.467.1314350776717; Fri,
	26 Aug 2011 02:26:16 -0700 (PDT)
Received: by 10.52.113.5 with HTTP; Fri, 26 Aug 2011 02:26:16 -0700 (PDT)
In-Reply-To: <1314280367-22179-1-git-send-email-dbaryshkov@gmail.com>
References: <1314280367-22179-1-git-send-email-dbaryshkov@gmail.com>
Date: Fri, 26 Aug 2011 13:26:16 +0400
Message-ID: <CALT56yO-k4XkHUsMELBP=7_REBYX7T5JRU4BJU8GEUVLwz8e4g@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] opkg-utils: ignore packages disapperaring filelist generation
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
X-List-Received-Date: Fri, 26 Aug 2011 09:31:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8/25/11, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
> Package files disappearing during index generation don't cause a fatal
> error. Make package file disappearing during filelist generation also
> a non-fatal error.

Please ignore this, I'll send a V2 soon.

>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  .../opkg-utils/no-ioerror-during-filelist.patch    |   31
> ++++++++++++++++++++
>  meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    3 +-
>  2 files changed, 33 insertions(+), 1 deletions(-)
>  create mode 100644
> meta/recipes-devtools/opkg-utils/no-ioerror-during-filelist.patch
>
> diff --git
> a/meta/recipes-devtools/opkg-utils/no-ioerror-during-filelist.patch
> b/meta/recipes-devtools/opkg-utils/no-ioerror-during-filelist.patch
> new file mode 100644
> index 0000000..dc85cb6
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg-utils/no-ioerror-during-filelist.patch
> @@ -0,0 +1,31 @@
> +From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> +Subject: Ignore IOError errors while populating filelist
> +Upstream-Status: Pending/Not-Applicable
> +
> +While populating Packages.filelist there is a possibility that the package
> file
> +will disappear while reading. So ignore errors during filelist generation.
> +
> +
> +Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> +
> +Index: opkg-utils/opkg-make-index
> +===================================================================
> +--- opkg-utils.orig/opkg-make-index	2011-08-25 16:45:41.000000000 +0400
> ++++ opkg-utils/opkg-make-index	2011-08-25 17:38:57.000000000 +0400
> +@@ -197,7 +197,15 @@
> + names = packages.packages.keys()
> + names.sort()
> + for name in names:
> +-     for fn in packages[name].get_file_list():
> ++     try:
> ++          fnlist = packages[name].get_file_list()
> ++     except OSError, e:
> ++          sys.stderr.write(e)
> ++          continue
> ++     except IOError, e:
> ++          sys.stderr.write(e)
> ++          continue
> ++     for fn in fnlist:
> +           (h,t) = os.path.split(fn)
> +           if not t: continue
> +           if not files.has_key(t): files[t] = name+':'+fn
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> index fd2b5e6..7659465 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> @@ -8,12 +8,13 @@ RDEPENDS_${PN} = "python"
>  RDEPENDS_${PN}_virtclass-native = ""
>  SRCREV = "4747"
>  PV = "0.1.8+svnr${SRCPV}"
> -PR = "r4"
> +PR = "r5"
>
>  SRC_URI =
> "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
>             file://index-ignore-filenotfound.patch \
>             file://mtime-int.patch \
>             file://add-license-field.patch \
> +           file://no-ioerror-during-filelist.patch \
>             "
>
>  S = "${WORKDIR}/opkg-utils"
> --
> 1.7.2.5
>
>


-- 
With best wishes
Dmitry


