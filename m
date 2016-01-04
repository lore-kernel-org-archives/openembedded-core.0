Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC4C731C1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:37:10 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id to4so249593956igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 10:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RMyBZaUAPSTbHJBGx8dkDNWM/RomiP5BIVVdVwQKbz4=;
	b=U0LG1mBq3g1W/54bPXUmn/tBoXkUiySY8k2aJwTd7MeAy00yJuAfD9tOMDtBdP+Fk2
	QKU/X8f4YCRmNa/aDinupa7v4bkS2oj8tCd0q48zJv7kAcIFJ9id43Z5GyZ7ltptPC0/
	Kkhor71y6+P4DA5+LzTdulg4iGTFnSU+5nyify1QMdlgTpWVapWL3v07wIE6ltsYYJH+
	Q5hMYhM/dhPgUpvp8p2rxlFUjvVuBHPyhb6MAmV+nuejcaFMAaKSMV1mvEHWce8G2vnx
	5fJZKYsYV/0dIYjXVkiLZjQPFcK1HPBuomX+AlG5C5EqKUglQZbUTbMlffI+7LTb882Q
	N4ew==
X-Received: by 10.51.17.38 with SMTP id gb6mr56126143igd.75.1451932630971;
	Mon, 04 Jan 2016 10:37:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Mon, 4 Jan 2016 10:36:41 -0800 (PST)
In-Reply-To: <1451903012-22560-2-git-send-email-ross.burton@intel.com>
References: <1451903012-22560-1-git-send-email-ross.burton@intel.com>
	<1451903012-22560-2-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jan 2016 10:36:41 -0800
Message-ID: <CAMKF1soaRON--0ywMMeesGsakmcqS7tNZFxeVD=YCA2TE5532Q@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: add more compression and importd PACKAGECONFIGs
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
X-List-Received-Date: Mon, 04 Jan 2016 18:37:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 4, 2016 at 2:23 AM, Ross Burton <ross.burton@intel.com> wrote:
> Add explicit PACKAGECONFIGs for all of compression formats that systemd can
> detect at configure time, and an explicit enable/disable for importd.  importd
> defaults to disabled as it needs curl and all the compression formats to be
> enabled.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_228.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
> index 0f95390..6673042 100644
> --- a/meta/recipes-core/systemd/systemd_228.bb
> +++ b/meta/recipes-core/systemd/systemd_228.bb
> @@ -70,13 +70,13 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
>  # regardless of PACKAGECONFIG, libgcrypt is always required to expand
>  # the AM_PATH_LIBGCRYPT autoconf macro
>  DEPENDS += "libgcrypt"
> -# Compress the journal
> -PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
>  PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
>  PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
>  PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
>  PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
>  PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
> +# importd requires curl/xz/zlib/bzip2/gcrypt
> +PACKAGECONFIG[importd] = "--enable-importd,--disable-importd"

Would it thow some sensible configure errors on enabling importd
without the dependencies ? now that they are packageconfigs on their
own. ?

>  PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
>  PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
>  PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
> @@ -92,6 +92,10 @@ PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
>  PACKAGECONFIG[compat] = "--enable-compat-libs,--disable-compat-libs"
>  PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
>  PACKAGECONFIG[coredump] = "--enable-coredump,--disable-coredump"
> +PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
> +PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
> +PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
> +PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
>
>  CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
>  CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
> --
> 2.6.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

