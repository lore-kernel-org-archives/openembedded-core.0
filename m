Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0LLR-0003W7-Ew for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 00:11:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MN38kU002914
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:03:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01958-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:03:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MN31Uf002908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:03:02 GMT
Message-ID: <1329951781.32110.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 23:03:01 +0000
In-Reply-To: <ef33b676fa87aa7da14c583aa6134ab7738a5335.1329888524.git.edwin.zhai@intel.com>
References: <cover.1329888524.git.edwin.zhai@intel.com>
	<ef33b676fa87aa7da14c583aa6134ab7738a5335.1329888524.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q1MN38kU002914
Subject: Re: [PATCH 3/3] vte: fix scroll issue
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
X-List-Received-Date: Wed, 22 Feb 2012 23:11:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-22 at 13:33 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
>=20
> On qemu x86-64, scrollbar in vte got broken with one commit to change t=
he way
> of emiting "changed" signal. This patch revert it as work around.
>=20
> [YOCTO #1906] got fixed.


This patch worries me a bit (well, a lot really). Why is this only
broken on 64 bit? How does this revert fix things? It looks like its not
the real problem to me?

Cheers,

Richard

> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  meta/recipes-support/vte/vte.inc                 |    3 +-
>  meta/recipes-support/vte/vte/scrollbar_fix.patch |  122 ++++++++++++++=
++++++++
>  meta/recipes-support/vte/vte_0.28.2.bb           |    2 +-
>  3 files changed, 125 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/vte/vte/scrollbar_fix.patch
>=20
> diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vt=
e/vte.inc
> index 54bd8ae..d3406e5 100644
> --- a/meta/recipes-support/vte/vte.inc
> +++ b/meta/recipes-support/vte/vte.inc
> @@ -6,7 +6,8 @@ RDEPENDS_libvte =3D "vte-termcap"
> =20
>  inherit gnome
> =20
> -SRC_URI +=3D "file://introspection.patch"
> +SRC_URI +=3D "file://introspection.patch\=20
> +            file://scrollbar_fix.patch"
> =20
>  EXTRA_OECONF =3D "--disable-gtk-doc --disable-python --disable-introsp=
ection"
> =20
> diff --git a/meta/recipes-support/vte/vte/scrollbar_fix.patch b/meta/re=
cipes-support/vte/vte/scrollbar_fix.patch
> new file mode 100644
> index 0000000..707377a
> --- /dev/null
> +++ b/meta/recipes-support/vte/vte/scrollbar_fix.patch
> @@ -0,0 +1,122 @@
> +On qemu x86-64, matchbox-terminal has broken scrollbar, because of fol=
lowing
> +commit in vte. This patch revert it as work around.
> +
> +Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> +
> +Upstream-Status: Inappropriate [workaround]
> +
> +commit 6eadb8494797e44910b86b5e101823cf527c04e1
> +Author: Kristian H=C3=B8gsberg <krh@bitplanet.net>
> +Date:   Thu Jul 15 09:07:51 2010 -0400
> +
> +    Use accessors for setting adjustment
> +   =20
> +    We use g_object_freeze_notify() to emit the same amount of ::chang=
ed
> +    signals.
> +
> +Index: vte-0.28.2/src/vte.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- vte-0.28.2.orig/src/vte.c	2011-08-29 05:31:45.000000000 +0800
> ++++ vte-0.28.2/src/vte.c	2012-02-21 11:03:22.000000000 +0800
> +@@ -2018,15 +2018,13 @@
> + 		glong v;
> + 		gdouble current;
> +=20
> +-		g_object_freeze_notify (G_OBJECT (terminal->adjustment));
> +-
> + 		v =3D _vte_ring_delta (screen->row_data);
> + 		current =3D gtk_adjustment_get_lower(terminal->adjustment);
> + 		if (current !=3D v) {
> + 			_vte_debug_print(VTE_DEBUG_ADJ,
> + 					"Changing lower bound from %.0f to %ld\n",
> + 					 current, v);
> +-			gtk_adjustment_set_lower(terminal->adjustment, v);
> ++			terminal->adjustment->lower =3D v;
> + 			changed =3D TRUE;
> + 		}
> +=20
> +@@ -2039,19 +2037,19 @@
> + 			_vte_debug_print(VTE_DEBUG_ADJ,
> + 					"Changing upper bound from %.0f to %ld\n",
> + 					 current, v);
> +-			gtk_adjustment_set_upper(terminal->adjustment, v);
> ++			terminal->adjustment->upper =3D v;
> + 			changed =3D TRUE;
> + 		}
> +=20
> +-		g_object_thaw_notify (G_OBJECT (terminal->adjustment));
> +-
> +-		if (changed)
> ++		if (changed) {
> + 			_vte_debug_print(VTE_DEBUG_SIGNALS,
> + 					"Emitting adjustment_changed.\n");
> ++			gtk_adjustment_changed(terminal->adjustment);
> ++		}
> + 		terminal->pvt->adjustment_changed_pending =3D FALSE;
> + 	}
> + 	if (terminal->pvt->adjustment_value_changed_pending) {
> +-		glong v, delta;
> ++		glong v;
> + 		_vte_debug_print(VTE_DEBUG_SIGNALS,
> + 				"Emitting adjustment_value_changed.\n");
> + 		terminal->pvt->adjustment_value_changed_pending =3D FALSE;
> +@@ -2062,9 +2060,9 @@
> + 			 * via the adjustment - e.g. user interaction with the
> + 			 * scrollbar
> + 			 */
> +-			delta =3D terminal->pvt->screen->scroll_delta;
> ++			terminal->adjustment->value =3D terminal->pvt->screen->scroll_delt=
a;
> + 			terminal->pvt->screen->scroll_delta =3D v;
> +-			gtk_adjustment_set_value(terminal->adjustment, delta);
> ++			gtk_adjustment_value_changed(terminal->adjustment);
> + 		}
> + 	}
> + }
> +@@ -2141,15 +2139,13 @@
> +=20
> + 	_vte_terminal_adjust_adjustments(terminal);
> +=20
> +-        g_object_freeze_notify(G_OBJECT(terminal->adjustment));
> +-
> + 	/* The step increment should always be one. */
> + 	v =3D gtk_adjustment_get_step_increment(terminal->adjustment);
> + 	if (v !=3D 1) {
> + 		_vte_debug_print(VTE_DEBUG_ADJ,
> + 				"Changing step increment from %.0lf to %ld\n",
> + 				v, terminal->row_count);
> +-		gtk_adjustment_set_step_increment(terminal->adjustment, 1);
> ++		terminal->adjustment->step_increment =3D 1;
> + 		changed =3D TRUE;
> + 	}
> +=20
> +@@ -2160,8 +2156,7 @@
> + 		_vte_debug_print(VTE_DEBUG_ADJ,
> + 				"Changing page size from %.0f to %ld\n",
> + 				 v, terminal->row_count);
> +-		gtk_adjustment_set_page_size(terminal->adjustment,
> +-					     terminal->row_count);
> ++		terminal->adjustment->page_size =3D terminal->row_count;
> + 		changed =3D TRUE;
> + 	}
> +=20
> +@@ -2173,16 +2168,15 @@
> + 				"Changing page increment from "
> + 				"%.0f to %ld\n",
> + 				v, terminal->row_count);
> +-		gtk_adjustment_set_page_increment(terminal->adjustment,
> +-						  terminal->row_count);
> ++		terminal->adjustment->page_increment =3D terminal->row_count;
> + 		changed =3D TRUE;
> + 	}
> +=20
> +-	g_object_thaw_notify(G_OBJECT(terminal->adjustment));
> +-
> +-	if (changed)
> ++	if (changed) {
> + 		_vte_debug_print(VTE_DEBUG_SIGNALS,
> + 				"Emitting adjustment_changed.\n");
> ++		gtk_adjustment_changed(terminal->adjustment);
> ++	}
> + }
> +=20
> + /* Scroll a fixed number of lines up or down in the current screen. *=
/
> diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-supp=
ort/vte/vte_0.28.2.bb
> index 33f71b5..507e272 100644
> --- a/meta/recipes-support/vte/vte_0.28.2.bb
> +++ b/meta/recipes-support/vte/vte_0.28.2.bb
> @@ -2,7 +2,7 @@ require vte.inc
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb85406=
3f7e7"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI[archive.md5sum] =3D "f07a4bf943194f94b7f142db8f7f36dc"
>  SRC_URI[archive.sha256sum] =3D "8d04e202b617373dfb47689e5e628febe2c588=
40b34cccc4af4feb88c48df903"
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




