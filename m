Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RE6YQ-0006I0-2p
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 23:41:34 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 12 Oct 2011 14:35:49 -0700
Received: by bke5 with SMTP id 5so547491bke.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:35:46 -0700 (PDT)
Received: by 10.223.60.73 with SMTP id o9mr1296471fah.18.1318455345843;
	Wed, 12 Oct 2011 14:35:45 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id x22sm5897913faa.5.2011.10.12.14.35.42
	(version=SSLv3 cipher=OTHER); Wed, 12 Oct 2011 14:35:43 -0700 (PDT)
Message-ID: <4E96082C.3040803@intel.com>
Date: Wed, 12 Oct 2011 14:35:40 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1318426805.23801.164.camel@ted>
In-Reply-To: <1318426805.23801.164.camel@ted>
Subject: Re: [PATCH] eds: Update to work with glib-2.0
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
X-List-Received-Date: Wed, 12 Oct 2011 21:41:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2011 06:39 AM, Richard Purdie wrote:
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-sato/eds/eds-dbus/depbuildfix.patch b/meta/recipes-sato/eds/eds-dbus/depbuildfix.patch
> new file mode 100644
> index 0000000..0785a93
> --- a/dev/null
> +++ b/meta/recipes-sato/eds/eds-dbus/depbuildfix.patch
> @@ -0,0 +1,78 @@
> +G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
> +build failures. Also resolve other deprecation issues.
> +
> +RP 2011/10/12
> +
Shouldn't this really be a "Signed-off-by" line?

Sau!

> +Upstream-Status: Pending
> +
> +Index: git/libedataserver/e-data-server-util.c
> +===================================================================
> +--- git.orig/libedataserver/e-data-server-util.c	2011-10-12 01:42:40.622045788 +0100
> ++++ git/libedataserver/e-data-server-util.c	2011-10-12 01:48:16.732045664 +0100
> +@@ -165,7 +165,8 @@
> + static gunichar
> + stripped_char (gunichar ch)
> + {
> +-        gunichar *decomp, retval;
> ++        gunichar decomp[4];
> ++        gunichar retval;
> +         GUnicodeType utype;
> +         gsize dlen;
> +
> +@@ -175,7 +176,7 @@
> +         case G_UNICODE_CONTROL:
> +         case G_UNICODE_FORMAT:
> +         case G_UNICODE_UNASSIGNED:
> +-        case G_UNICODE_COMBINING_MARK:
> ++        case G_UNICODE_SPACING_MARK:
> +                 /* Ignore those */
> +                 return 0;
> +                break;
> +@@ -183,7 +184,7 @@
> +                 /* Convert to lowercase, fall through */
> +                 ch = g_unichar_tolower (ch);
> +         case G_UNICODE_LOWERCASE_LETTER:
> +-                if ((decomp = g_unicode_canonical_decomposition (ch,&dlen))) {
> ++                if ((dlen = g_unichar_fully_decompose (ch, FALSE, decomp, 4))) {
> +                         retval = decomp[0];
> +                         g_free (decomp);
> +                         return retval;
> +Index: git/addressbook/libedata-book/e-data-book-factory.c
> +===================================================================
> +--- git.orig/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 01:52:25.692045500 +0100
> ++++ git/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 01:53:31.862045707 +0100
> +@@ -238,7 +238,7 @@
> + 	return g_strdup_printf (
> + 		"/org/gnome/evolution/dataserver/addressbook/%d/%u",
> + 		getpid (),
> +-		g_atomic_int_exchange_and_add (&counter, 1));
> ++		g_atomic_int_add (&counter, 1));
> + }
> +
> + static void
> +Index: git/addressbook/libedata-book/e-data-book.c
> +===================================================================
> +--- git.orig/addressbook/libedata-book/e-data-book.c	2011-10-12 01:54:40.752045465 +0100
> ++++ git/addressbook/libedata-book/e-data-book.c	2011-10-12 01:55:16.012045897 +0100
> +@@ -553,7 +553,7 @@
> +
> + 	return g_strdup_printf ("/org/gnome/evolution/dataserver/addressbook/BookView/%d/%d",
> + 				getpid (),
> +-				g_atomic_int_exchange_and_add ((int*)&counter, 1));
> ++				g_atomic_int_add ((int*)&counter, 1));
> + }
> +
> + static void
> +Index: git/calendar/libedata-cal/e-data-cal-factory.c
> +===================================================================
> +--- git.orig/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57:56.612045081 +0100
> ++++ git/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57:58.832045211 +0100
> +@@ -227,7 +227,7 @@
> + 	return g_strdup_printf (
> + 		"/org/gnome/evolution/dataserver/calendar/%d/%u",
> + 		getpid (),
> +-		g_atomic_int_exchange_and_add (&counter, 1));
> ++		g_atomic_int_add (&counter, 1));
> + }
> +
> + static void
> diff --git a/meta/recipes-sato/eds/eds-dbus_git.bb b/meta/recipes-sato/eds/eds-dbus_git.bb
> index 7fa8311..9424353 100644
> --- a/meta/recipes-sato/eds/eds-dbus_git.bb
> +++ b/meta/recipes-sato/eds/eds-dbus_git.bb
> @@ -12,7 +12,7 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
>
>   SRCREV = "7337d11aed576e7caaa12b4e881ad8d33668799f"
>   PV = "2.30+git${SRCPV}"
> -PR = "r1"
> +PR = "r3"
>
>   SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
>              file://oh-contact.patch;striplevel=0 \
> @@ -20,6 +20,7 @@ SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
>              file://optional_imapx_provider.patch \
>              file://new-contact-fix.patch \
>              file://old-gdk-api.patch \
> +           file://depbuildfix.patch \
>              file://iconv-detect.h"
>
>   S = "${WORKDIR}/git"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



