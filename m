Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 71A2D708B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 15:04:18 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id l18so586602wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Oct 2014 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZyjvcW9fCml5KgdFUPx1dT1QtdFmB21sCR2S4YiPt3U=;
	b=om9JdhZPcl7Rxk+sTTH4adYl6M+k0f67dBDEBOgu60Pv7qVw04tM99eDLAibnujJfC
	XzhBQQtmLJJYoPWlP8mYS3VCLE7x1GqSMvzCkwMqunX+q6S4SeLEidTQdG7JNYsW4qBA
	jaliNqKDmUAzLO6Hl0rLFo00DpOlvY5ABUl2/VLJocK4v2O1KOV9tfjqHs7ojBzX1Lf0
	tFpGRWlTx1dWcLVfCxRrzVb9U6OYV7M66Q/fL8fXLrSfflVUnrNEHjViQGgM6C9rJHVp
	t6nL1YjmlpyFaoNSOfeIcfbwRNdAIaTSPDhTklH5br2rYjlfFFu5I3AkahI5AUuoiCTK
	dnMQ==
X-Received: by 10.180.20.33 with SMTP id k1mr4870292wie.14.1412262259846;
	Thu, 02 Oct 2014 08:04:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wm6sm4901249wjb.5.2014.10.02.08.04.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Oct 2014 08:04:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Oct 2014 17:05:15 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20141002150515.GH25706@jama>
References: <cover.1410177322.git.ross.burton@intel.com>
	<0d89eb7181ce4f386f585597b9f04e786b759434.1410177322.git.ross.burton@intel.com>
	<CALbNGRQAAGk9PM=E=DReoY36OtZh8WTBgRTxoovtXWpJeKudLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQAAGk9PM=E=DReoY36OtZh8WTBgRTxoovtXWpJeKudLg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 26/27] qemu.bbclass: add -r ${OLDEST_KERNEL} parameter
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
X-List-Received-Date: Thu, 02 Oct 2014 15:04:21 -0000
X-Groupsio-MsgNum: 58323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DlCDOi0rxj7hgWX9"
Content-Disposition: inline

--DlCDOi0rxj7hgWX9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2014 at 11:22:11AM +0200, Andreas M=FCller wrote:
> On Mon, Sep 8, 2014 at 1:58 PM, Ross Burton <ross.burton@intel.com> wrote:
>=20
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > * in some cases (e.g. with external toolchain which doesn't respect our
> >   reasonably old version set in OLDEST_KERNEL) it's possible to have li=
bc
> >   which requires newer kernel than what we have on builders, qemu suppo=
rts
> >   -r param to use different uname than what's returned by host system.
> > * change qemu_run_binary to pass -r ${OLDEST_KERNEL} and add the same to
> >   QEMU_OPTIONS which are used by qemuwrapper-cross
> > * maybe we should eventually convert all qemu_run_binary usages always
> > include
> >   qemuwrapper-cross dependency and always call qemu through that (it
> >   seems very strange that qemu_target_binary is called from qemuwrapper
> >   and for allarch recipes it can return qemu-allarch as qemu binary).
> >
> >   qemu_run_binary is used by:
> >   meta/classes/gtk-immodules-cache.bbclass:
> > ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-$maj_ver.0')=
} \
> >   meta/classes/qemu.bbclass:def qemu_run_binary(data, rootfs_path, bina=
ry):
> >   meta/recipes-core/systemd/systemd_213.bb:         ${@qemu_run_binary(=
d,
> > '$D', '${base_bindir}/udevadm')} hwdb --update \
> >   meta/recipes-graphics/pango/pango.inc:    ${@qemu_run_binary(d,
> > '$D','${bindir}/${MLPREFIX}pango-querymodules')} \
> >
> >   and qemuwrapper directly by:
> >   scripts/postinst-intercepts/update_font_cache:PSEUDO_UNLOAD=3D1
> > qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D/${base_libdir}\
> >   scripts/postinst-intercepts/update_pixbuf_cache:PSEUDO_UNLOAD=3D1
> > qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D/${base_libdir}\
> >
> > Somehow related but I don't understand fully yet:
>=20
> do_rootfs complains:
> NOTE: > Executing update_pixbuf_cache intercept ...
> FATAL: kernel too old
> WARNING: The postinstall intercept hook 'update_pixbuf_cache' failed (exit
> code: 127)! See log for details!
>=20
> and many other 'kernel too old' messages. Target kernel is 3.14.19 / Host
> is 3.14.17. Too old?

What is your OLDEST_KERNEL value? and what does "file" show as required
kernel on those binaries?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DlCDOi0rxj7hgWX9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQtaasACgkQN1Ujt2V2gBwZxwCfWF0Bch70XebpNWczNvZgYTzy
ACUAn2iUAA+MZ4Z4rFGadnHlIsTZaJwo
=mNrj
-----END PGP SIGNATURE-----

--DlCDOi0rxj7hgWX9--
