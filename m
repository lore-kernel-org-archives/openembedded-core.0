Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SwCQY-0000eF-PK
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 15:24:02 +0200
Received: by yhjj56 with SMTP id j56so5410503yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 06:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=1LEqllHIH7lbypBEYw0vNVLlOSGFCS3hihXlpW1zWwo=;
	b=A/bsTwOXuRaKCmCDMzPk3QZJz/JvVE2SpA1zQcN8Icx2NzluBYmzvp6uvY6O+OeRQs
	w/OW/cVieTebbHHUCYk45Yp2bk1Lwm0rxZDg1a7Tk7dgXKpDeEZkETEZ0PhIdve9+5B1
	KEbh913ivx6dE1agKI2rMt2rAeE0C75v+YY0YBOlyQNFxKbgGYqFgbjn8m6DM0MuY06i
	Y3ZF/dHGeo8FaZ7p1Y6Dt0dq9L+dluIgnmdLLRnOBY3fVcz2CMTZHf4O7dsocQ7RLLBE
	9Ju5Wrbii89i079fsWcy7MSzgE/StCjzj8O7dzwwxULH+s+Y4X8/kyaCrlEDwtbiornm
	Li6Q==
MIME-Version: 1.0
Received: by 10.50.217.163 with SMTP id oz3mr2018606igc.5.1343740340952; Tue,
	31 Jul 2012 06:12:20 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Tue, 31 Jul 2012 06:12:20 -0700 (PDT)
In-Reply-To: <1343638321-25398-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1343638321-25398-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Tue, 31 Jul 2012 15:12:20 +0200
Message-ID: <CALbNGRSMUgxBXzrNkX_1DjCAso5rKjXDrRFckpxzkvqkKsMUNw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/oe-pkgdata-util: exclude unpackaged in glob output
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
X-List-Received-Date: Tue, 31 Jul 2012 13:24:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2012 at 10:52 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Check for .packaged file and exclude packages if this file does not
> exist - this avoids attempting to install empty packages during
> complementary package installation within do_rootfs that didn't end up
> being created (and failing as a result).
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/oe-pkgdata-util |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 2427f10..900c27a 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -112,6 +112,8 @@ def glob(args):
>                      fwdfile =3D fwdpkgdata(mappedpkg)
>                      if os.path.exists(fwdfile):
>                          mappedpkg =3D readrenamed(fwdfile)
> +                    if not os.path.exists(fwdfile + ".packaged"):
> +                        mappedpkg =3D ""
>                  else:
>                      # That didn't work, so now get the PN, substitute th=
at, then map in the other direction
>                      revlink =3D revpkgdata(pkg)
> @@ -121,6 +123,8 @@ def glob(args):
>                          fwdfile =3D fwdpkgdata(newpkg)
>                          if os.path.exists(fwdfile):
>                              mappedpkg =3D readrenamed(fwdfile)
> +                        if not os.path.exists(fwdfile + ".packaged"):
> +                            mappedpkg =3D ""
>                      else:
>                          # Package doesn't even exist...
>                          if debug:
> --
> 1.7.9.5
Thanks for unbreaking do_rootfs part I

Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>


