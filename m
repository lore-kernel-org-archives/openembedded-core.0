Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TAjk1-0007fq-Ry
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 17:48:09 +0200
Received: by eekb57 with SMTP id b57so545943eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Sep 2012 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pYFGhs7luPdLpZ0q7xUqLrHInblOg4EhzVeeXgXjYbM=;
	b=NiEEEXo75lgQzpLe7+Zzo/flYNdJlZLRKDxzncBtV4TUfwULMZa4YWQaz1prRXTbMg
	3Hi0b8jtTwcG9fwBbQfmiSZeoF7RwwftsQxK5vjK55UpM4BoEHDPBrTGtP79jOfHWsFv
	5FzMxCMlFBhkyYrsFvNK1DRbN6H+N6EKjMYXniWBs0pvAjZOwa3lprlgyDA3ShzD2uR+
	ZKFXtZyO9+qJad7SNoZaqdmiv14w8oRbkez6o/L/UgG2e2ZkuNCWsxJUsOLntBCQg/dp
	LTpgJtsxz39nGYnU+l6UuscZyHkhSMSZNlmhVEO9K6HnUvjBm4HtbNs4X6x/258WPODY
	Go9g==
Received: by 10.14.202.131 with SMTP id d3mr15890288eeo.32.1347204941709; Sun,
	09 Sep 2012 08:35:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Sun, 9 Sep 2012 08:35:10 -0700 (PDT)
In-Reply-To: <1347187725.4396.259.camel@x121e.pbcl.net>
References: <1347187725.4396.259.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Sep 2012 08:35:10 -0700
Message-ID: <CAMKF1soL0MPz7RPenc=SYV_7R7VRHvrHBjiFramP7xw3E4PBfQ@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow-native: Ensure that ${sbindir} and ${base_sbindir} are respected
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
X-List-Received-Date: Sun, 09 Sep 2012 15:48:10 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 9, 2012 at 3:48 AM, Phil Blundell <philb@gnu.org> wrote:
> These values need to be passed on the command line to "make install" otherwise
> shadow will use its own built-in idea of where those directories are located.
>

why would we care for it in a native recipe.

> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  .../shadow/shadow-native_4.1.4.3.bb                |   11 +++++++++--
>  1 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
> index cd5605f..0469306 100644
> --- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
> +++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
> @@ -7,7 +7,7 @@ LICENSE = "BSD | Artistic-1.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
>                      file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
>
> -PR = "r7"
> +PR = "r8"
>
>  SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
>             file://shadow.automake-1.11.patch \
> @@ -30,7 +30,14 @@ EXTRA_OECONF += "--without-audit \
>                   --without-selinux \
>                   --without-nscd"
>
> -do_install_append() {
> +do_install() {
> +       oe_runmake DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install
> +
> +       # Info dir listing isn't interesting at this point so remove it if it exists.
> +       if [ -e "${D}${infodir}/dir" ]; then
> +               rm -f ${D}${infodir}/dir
> +       fi
> +
>         # Enable CREATE_HOME by default.
>         sed -i 's/#CREATE_HOME/CREATE_HOME/g' ${D}${sysconfdir}/login.defs
>
> --
> 1.7.9
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


