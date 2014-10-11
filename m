Return-Path: <paul.betafive@gmail.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 828EC65DA3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 14:42:07 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id n8so2860506qaq.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 07:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=sDegNQVtW8GqJwfRee/totA0qS3eSz6kHdhDYBLc+60=;
	b=PHpQYHwmj/iy1jrNP1wPiBr+fLXK4ZdBGTeQ66aFHIXS6nTkPfn/LFDFpFsmBGgp4O
	nPwkB2SL6cZr+ovbMvfJStEBNt3v2Z2n5T/0JjYTRGcq6d2gQfYVJ3TjCglwtIs9wowz
	6SCU7OcgwIuJ0lWjhoNBborkjq244hCR+VnuRg8kCmIjE2aH0GCFvqdXeKc3v6vu7XBP
	RQGwmlWy9D4lDHFFOcgar7w2ZbmiU28nyB8EAK9R52K3OsiZtzoy6wW8aXyIZNv4DVsp
	eQrbXAA6T1HiADShbYMHr6NXTiFsx0+CH9/sfi/xcaGFR95katLUngfj7ChKzgX3Vt3D
	7lwQ==
X-Received: by 10.224.51.138 with SMTP id d10mr20612404qag.37.1413038528531;
	Sat, 11 Oct 2014 07:42:08 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Sat, 11 Oct 2014 07:41:28 -0700 (PDT)
In-Reply-To: <54380D3A.8060904@urbanec.net>
References: <54380D3A.8060904@urbanec.net>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 11 Oct 2014 15:41:28 +0100
X-Google-Sender-Auth: XV2-ltBlbJydPpVpiZWyJwjvf4o
Message-ID: <CANyK_8cZMz-JBdWku-yTgA1+RXbt0wGxww+eCf2CBMeb4cFXdA@mail.gmail.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Better support for upgrading packages in opkg and update-rc.d.bbclass
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
X-List-Received-Date: Sat, 11 Oct 2014 14:42:11 -0000
Content-Type: text/plain; charset=UTF-8

On 10 October 2014 17:45, Peter Urbanec <openembedded-devel@urbanec.net> wrote:
> init-ifupdown inherits default implementations of prerm, postrm, preinst
> and postinst from update-rc.d.bbclass. Unfortunately these default
> implementations don't deal with package upgrades as well as they could.
>
> What ends up happening is that opkg starts downloading and unpacking
> packages sequentially. As it downloads and unpacks each package, opkg
> calls prerm, preinst and postrm hook scripts. Once all packages are
> unpacked, the postinst script is finally called for all packages as part
> of the "configure" stage.
>
> In the case of init-ifupdown, the default prerm and preinst scripts stop
> networking. Networking is not brought back up again until the init-ifupdown
> postinst is called, but that only happens after all the packages have been
> downloaded, unpacked and installed. This leaves a window where any package
> that needs to be downloaded after init-ifupdown is encountered will fail.
>
> This patch fixes the problem by enhancing opkg to also provide the "upgrade"
> argument to prerm and postrm, to (partially) match what dpkg does. See
> https://wiki.debian.org/MaintainerScripts for dpkg diagrams that clarify
> the intended process. opkg lacks the full functionality of dpkg, but for
> the purpose of this exercise, they are similar enough.
>
> I have submitted a patch to the opkg-devel list to include the "upgrade"
> argument in future version of opkg.
>
> The second part of the solution is an update to the default implementations
> of the pre- and post- scripts provided by update-rc.d.bbclass. The scripts
> are now careful to remove the package init scripts using the old package
> context and to delay the restart of a service until the configure stage,
> called from the postinst script.
>

This patch needs a Signed-off-by line and a better subject as per the
OpenEmbedded guidelines
(http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines).

It may also be better to split this into two consecutive patches, the
first of which makes changes to opkg, and the second of which makes
changes to update-rc.d.bbclass.

> ---
>  meta/classes/update-rc.d.bbclass                   | 75 +++++++++++++---------
>  .../opkg/upgrade-argument-for-pre_postrm.patch     | 30 +++++++++
>  meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
>  3 files changed, 77 insertions(+), 29 deletions(-)
>  create mode 100644 meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_postrm.patch
>
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
> index bc1aa7d..c29457f 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -14,45 +14,62 @@ INITSCRIPT_PARAMS ?= "defaults"
>   INIT_D_DIR = "${sysconfdir}/init.d"
>  -updatercd_preinst() {
> -if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
> -       ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> +# During an upgrade, the pre/postrm scripts from old package are called
> +# and the pre/postinst scripts called are from the new package.
> +# See https://wiki.debian.org/MaintainerScripts for dpkg diagrams.
> +# opkg uses a subset, which lacks most of the error handling.
> +
> +# Old package context, step 1
> +updatercd_prerm() {
> +if [ "x$1" != "xupgrade" ] ; then
> +  ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
>  fi
> -if type update-rc.d >/dev/null 2>/dev/null; then
> -       if [ -n "$D" ]; then
> -               OPT="-f -r $D"
> -       else
> -               OPT="-f"
> -       fi
> -       update-rc.d $OPT ${INITSCRIPT_NAME} remove
> +if [ -z "$D" ]; then
> +  OPT=""
> +else
> +  OPT="-r $D"
>  fi
> -}
> -
> -updatercd_postinst() {
>  if type update-rc.d >/dev/null 2>/dev/null; then
> -       if [ -n "$D" ]; then
> -               OPT="-r $D"
> -       else
> -               OPT="-s"
> -       fi
> -       update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
> +  update-rc.d $OPT ${INITSCRIPT_NAME} remove
>  fi
>  }
>  -updatercd_prerm() {
> -if [ -z "$D" ]; then
> -       ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> -fi
> +# New package context, step 2
> +updatercd_preinst() {
> +case "$1" in
> +  upgrade)
> +    ;;
> +  *)
> +    ;;
> +esac
>  }
>  +# Old package context, step 3
>  updatercd_postrm() {
> +case "$1" in
> +  upgrade)
> +    ;;
> +  *)
> +    ;;
> +esac
> +}
> +
> +# N.B. Step 4 runs after all packages have been through steps 1-3 and therefore we
> +#      need to delay service restarts during upgrade until here. Otherwise we end
> +#      up with situations, like networking going down in the middle of "opkg upgrade",
> +#      thus resulting in failures to fetch further packages.
> +
> +# New package context, step 4
> +updatercd_postinst() {
>  if type update-rc.d >/dev/null 2>/dev/null; then
> -       if [ -n "$D" ]; then
> -               OPT="-r $D"
> -       else
> -               OPT=""
> -       fi
> -       update-rc.d $OPT ${INITSCRIPT_NAME} remove
> +  if [ -n "$D" ]; then
> +    OPT="-r $D"
> +  else
> +    # This will catch the upgrade case and result in a restart.
> +    ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> +    OPT="-s"
> +  fi
> +  update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
>  fi
>  }

Someone else will have to review the above as I don't know much about
update-rc.d.

>  diff --git a/meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_postrm.patch b/meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_postrm.patch
> new file mode 100644
> index 0000000..5bea82a
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_postrm.patch
> @@ -0,0 +1,30 @@
> +From: Peter Urbanec
> +Subject: [opkg] Use "upgrade" argument in prerm and postrm scripts
> +
> +Current implementation of opkg makes it difficult to distinguish between
> +package removal or upgrade in prerm and postrm scripts. The following patch
> +will make it easier and is close(r) to what dpkg does.
> +

This patch file also requires a Signed-off-by line and an
Upstream-status line. The upstream status will be 'submitted' as this
patch has been sent to the opkg mailing list.

> +diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
> +index 07401b2..52454f8 100644
> +--- a/libopkg/opkg_remove.c
> ++++ b/libopkg/opkg_remove.c
> +@@ -292,7 +292,7 @@ opkg_remove_pkg(pkg_t *pkg, int from_upgrade)
> +      pkg->state_want = SW_DEINSTALL;
> +      opkg_state_changed++;
> + +-     if (pkg_run_script(pkg, "prerm", "remove") != 0) {
> ++     if (pkg_run_script(pkg, "prerm", from_upgrade ? "upgrade" : "remove") != 0) {
> +          if (!conf->force_remove) {
> +              opkg_msg(ERROR, "not removing package \"%s\", "
> +                              "prerm script failed\n", pkg->name);
> +@@ -310,7 +310,7 @@ opkg_remove_pkg(pkg_t *pkg, int from_upgrade)
> +        feel free to fix this. */
> +      remove_data_files_and_list(pkg);
> +
> +-     err = pkg_run_script(pkg, "postrm", "remove");
> ++     err = pkg_run_script(pkg, "postrm", from_upgrade ? "upgrade" : "remove");
> +
> +      remove_maintainer_scripts(pkg);
> +      pkg->state_status = SS_NOT_INSTALLED;

I'm happy with this change, both here and upstream.

> + diff --git a/meta/recipes-devtools/opkg/opkg_0.2.2.bb b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
> index 3dd7489..9c0045e 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.2.2.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
> @@ -4,6 +4,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
>             file://no-install-recommends.patch \
>             file://add-exclude.patch \
>             file://opkg-configure.service \
> +           file://upgrade-argument-for-pre_postrm.patch \
>  "
>   S = "${WORKDIR}/${BPN}-${PV}"

Again, this change looks good. If you're resubmitting this, put the
new patch above the service file just so that it's slightly easier to
see the grouping of file types.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

