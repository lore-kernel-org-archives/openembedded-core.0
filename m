Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD3F605BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 14:01:25 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t1so3167473wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 06:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=54UOR3eER0l73wg3R2OFZ29R1hTft8YQE1UWzHdebow=;
	b=nu8BV0iyxqua8NVP3OvJBcCU1fYeGn68jbrDr9o7qNHmOdWL+TEn8UaM37Pq9RjnmI
	dRlkqOb0u0rpLvk1HO2TnZTju6vxLK5DWeX9tawjm8Bu5Aj7fDRfBln1/LrW3eLpk8hY
	XHE1qqP7GJW4RMfb/6Y+3iHzNLxO2LyqNOUQXF9vFhtkLhe7uSXyuhQC/pZqqQ26qA8J
	jcXQmJecIOU0FkNs53WzNk2VUnDmT6Xve5IJ2dF1fKHllTkLJww021YjAx9ktkOskJe9
	nIKeeBXizPM4hRo7DI0F7lV8p6JcDUPlsNqTua2GYQRog8XKUN8OVmeJ2c9dIIQ2Urs1
	5yyw==
X-Gm-Message-State: APjAAAWBSwcD47rOTeMyYSEXQ0KD/dk+e6cfqDnTbUoNLaZmyPNrRTbE
	6WncmC+01EpalJbfal4hQZU=
X-Google-Smtp-Source: APXvYqyfrLG+qygtLvOB7aMVanhawfu+NweE8pst15gzYaHOANoXFH+lHitUVWHRCcCYOCaX7sf5CQ==
X-Received: by 2002:adf:da42:: with SMTP id r2mr2916625wrl.383.1573135285971; 
	Thu, 07 Nov 2019 06:01:25 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 65sm4007801wrs.9.2019.11.07.06.01.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 06:01:25 -0800 (PST)
Message-ID: <8002dca6398624337867ed88608e7156e6f943e4.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 07 Nov 2019 14:01:24 +0000
In-Reply-To: <CANNYZj_Ph4M_cVFQXaWpgPExhnkjntYUOm_8Zio7APmtkP_Tgw@mail.gmail.com>
References: <20191107094033.33950-1-git@andred.net>
	<CANNYZj_Ph4M_cVFQXaWpgPExhnkjntYUOm_8Zio7APmtkP_Tgw@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libevent: enable OpenSSL unconditionally and update packaging
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
X-List-Received-Date: Thu, 07 Nov 2019 14:01:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-11-07 at 13:26 +0100, Alexander Kanavin wrote:
> I would rather keep the option to disable openssl, but simply switch it on by default

Why complicate things, what's the use-case? If libevent_openssl.so is not
used by anything, that library will not be pulled in, as it is a
separate package now.

Cheers,
A.


> .
> 
> Alex
> 
> On Thu, 7 Nov 2019 at 13:11, André Draszik <git@andred.net> wrote:
> > The original commit describes the reason for disabling openssl
> > so as to get 'more deterministic build[s]' and size-reduction:
> > commit 6c36fde6ce2e ("libevent: disable openssl by default"),
> > commit ad130b97a51a in poky.
> > 
> > Since the introduction of per-recipe sysroots, we always have
> > deterministic builds.
> > 
> > Size reduction can be achieved by splitting the package into
> > multiple sub-packages, which each only provide one of the
> > shared libraries.
> > 
> > Hence there appears no reason anymore to disable OpenSSL
> > support.
> > 
> > Because this recipe only provides shared libraries which are
> > handled automatically by bitbake, there is no need to add
> > the subpackages to the RDEPENDS of PN for backwards
> > compatibility. The packageing process of dependees will
> > simply pull in the sub-packages as runtime dependency as
> > needed.
> > 
> > This also how Debian splits this up.
> > 
> > While updating the packaging, we can also drop event_rpcgen.py
> > which appears to be a tool for generating rpc bindings, i.e.
> > something that should normally be in -dev. Given Debian
> > doesn't package this at all, and given it actually requires
> > python to run but no runtime dependency is stated at the
> > moment, it would appear that no users of this exist.
> > 
> > These changes also allow us to build all of nghttp2
> > out-of-the-box, without affecting existing users.
> > 
> > Signed-off-by: André Draszik <git@andred.net>
> > ---
> >  meta/recipes-support/libevent/libevent_2.1.11.bb | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
> > index f005ab8bda..c746f22118 100644
> > --- a/meta/recipes-support/libevent/libevent_2.1.11.bb
> > +++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
> > @@ -19,9 +19,6 @@ UPSTREAM_CHECK_URI = "http://libevent.org/"
> > 
> >  S = "${WORKDIR}/${BPN}-${PV}-stable"
> > 
> > -PACKAGECONFIG ??= ""
> > -PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
> > -
> >  inherit autotools
> > 
> >  # Needed for Debian packaging
> > @@ -29,11 +26,19 @@ LEAD_SONAME = "libevent-2.1.so"
> > 
> >  inherit ptest multilib_header
> > 
> > -DEPENDS = "zlib"
> > +DEPENDS = "openssl zlib"
> > +
> > +PACKAGES =+ "${PN}-core ${PN}-extra ${PN}-openssl ${PN}-pthreads"
> > +FILES_${PN}-core = "${libdir}/libevent_core*${SOLIBS}"
> > +FILES_${PN}-extra = "${libdir}/libevent_extra*${SOLIBS}"
> > +FILES_${PN}-openssl = "${libdir}/libevent_openssl*${SOLIBS}"
> > +FILES_${PN}-pthreads = "${libdir}/libevent_pthreads-*${SOLIBS}"
> > 
> >  BBCLASSEXTEND = "native nativesdk"
> > 
> >  do_install_append() {
> > +       rm ${D}${bindir}/event_rpcgen.py
> > +       rmdir ${D}${bindir}
> >          oe_multilib_header event2/event-config.h
> >  }
> > 
> > -- 
> > 2.23.0.rc1
> > 


