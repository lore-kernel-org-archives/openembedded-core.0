Received: from mail-ve0-f174.google.com ([209.85.128.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1US2YI-0006cZ-Ra
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 11:51:58 +0200
Received: by mail-ve0-f174.google.com with SMTP id jz10so224842veb.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 02:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=HROGKc9rIBTwoSxiyiLhQNNVc6yqOlPm3d35NsEPB+M=;
	b=jqDjEMseP8JynqEHtiEIZ8fBUvDvFCNP3O7IYX41rDWw0eiyQjyOcdSbeur3un9nle
	SBzGf+yGWiY9++5aXu23AfMyT+lZ8VBB6q5VN+bLeMNHrFCGQkSV5gQTS6wJGfDm1Dab
	uNPs5HG3WFdGopsF9+Xda537/GpSlog1v1hp234EmzHwpjf+PnfSx81H1b9odOVhrdgh
	10nFEevGyRELxfYiPt5tKo/Y7wswNl4aXl+jnryvZTvtKULEwnZyAQ/LNJG6g5NTMA7g
	JlmcD8Sf9UaVPgL5LqgwVCgzopR03KCbaNMRd1r+jCIZO70SS9rpcvCt6/QOBzrKvLQF
	JYkw==
X-Received: by 10.52.23.115 with SMTP id l19mr786352vdf.55.1366104860475; Tue,
	16 Apr 2013 02:34:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 16 Apr 2013 02:34:00 -0700 (PDT)
In-Reply-To: <5B2FD9C3-A643-474B-BC8A-DB24FCCBAA1A@dominion.thruhere.net>
References: <5B2FD9C3-A643-474B-BC8A-DB24FCCBAA1A@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Apr 2013 10:34:00 +0100
Message-ID: <CAJTo0LYnit+CFFvsP7e0HFkKJs81H-D=31n_urgoL6MbVmqzGg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQltLpixt8ZRvvy2l0Di3z2MOPse1N9f6DXRuXoRbnigjl6+sEOKd1+YzQcTWIwtIB0jmJkq
Cc: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Libpng 1.6.x is broken, switch back to 1.5.x before release?
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
X-List-Received-Date: Tue, 16 Apr 2013 09:52:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 16 April 2013 10:06, Koen Kooi <koen@dominion.thruhere.net> wrote:
> I've been looking into the libpng problems people have been reporting (e.=
g. #4060) and tried to upgrade 1.16.1 to fix those. Long story short, 1.16.=
1 doesn't fix them. I'm currently using weston as a testbed and was able to=
 narrow the problems with weston down to:
>
>         cairo_surface_t *surface =3D cairo_image_surface_create_from_png(=
icon);
>
> with ends up as:
>
>         ERROR loading icon from file '/usr/share/icons/gnome/24x24/apps/u=
tilities-terminal.png', error: 'out of memory'

I just spoke to Chris Wilson about this.  libpng 1.6 is throwing more
warnings to the caller, often about invalid PNG extensions that are
being ignored apparently, and cairo-png is being over-zealous (his
words) in handling the warnings, by turning them into errors.

static void
png_simple_warning_callback (png_structp png,
	                     png_const_charp error_msg)
{
    cairo_status_t *error =3D png_get_error_ptr (png);

    /* default to the most likely error */
    if (*error =3D=3D CAIRO_STATUS_SUCCESS)
	*error =3D _cairo_error (CAIRO_STATUS_NO_MEMORY);

    /* png does not expect to abort and will try to tidy up after a warning=
 */
}

The warnings are just warnings and libpng will continue to load the
images.  Sending a patch once this git clone has finished.

Ross


