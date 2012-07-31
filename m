Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SwCQk-0000nq-Br
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 15:24:23 +0200
Received: by ggnp4 with SMTP id p4so5378705ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lhbK++AfvgJfoiAomehxNZXvl3FoTHYQy9IMx83tKrU=;
	b=RhbNjLhzrj9QR821OpIviaFaSVQeZxWcloN1n43cKWIKO9nr+MBfEs3QYo5bvmdHGj
	dtgUOzyd+gEoEY397uGXnsl6970p+QQSqHkYiXhMpCCrMQ7OllzAWHjV3Jtih0uFStSW
	L75WoeWZwUPu+7bXRxp9lRKQ6uuzBWOlWx4JKu7xqOsh2FQ8UFbDrpsn381nXn3dLHYc
	5sdpB4Ni6Et37WomJ5X0Xrq7hlE70xj0KqFmxi3KG/Xw7VeC7ILJ6Ah6MLiFic7G+fPH
	5qyR4E1OhFXpO99F1cNhpue4G9Nh1P4ytRlaBoMeuiViMA09ElaCKyEtn559zL1U5f9x
	QSeQ==
MIME-Version: 1.0
Received: by 10.50.106.233 with SMTP id gx9mr1747233igb.45.1343740352527; Tue,
	31 Jul 2012 06:12:32 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Tue, 31 Jul 2012 06:12:32 -0700 (PDT)
In-Reply-To: <1343734381-11130-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1343734381-11130-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Tue, 31 Jul 2012 15:12:32 +0200
Message-ID: <CALbNGRTFdidK67+Gff5_RerMRJ57HoBz_qw+biRC9Pv-sk-cMw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/package: don't make locale pkgs depend on PN pkg if not in PACKAGES
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
X-List-Received-Date: Tue, 31 Jul 2012 13:24:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 1:33 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> If ${PN} is not in PACKAGES then don't add it as an RDEPENDS for each
> locale package. This fixes the installation of gcc-runtime locale
> packages, for example.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/package.bbclass |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 3aaf999..9c4e643 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -407,12 +407,13 @@ python package_do_split_locales() {
>      description =3D d.getVar('DESCRIPTION', True) or ""
>      locale_section =3D d.getVar('LOCALE_SECTION', True)
>      mlprefix =3D d.getVar('MLPREFIX', True) or ""
> +    pndep =3D base_contains('PACKAGES', pn, '%s ' % pn, '', d)
>      for l in sorted(locales):
>          ln =3D legitimize_package_name(l)
>          pkg =3D pn + '-locale-' + ln
>          packages.append(pkg)
>          d.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l))
> -        d.setVar('RDEPENDS_' + pkg, '%s %svirtual-locale-%s' % (pn, mlpr=
efix, ln))
> +        d.setVar('RDEPENDS_' + pkg, '%s%svirtual-locale-%s' % (pndep, ml=
prefix, ln))
>          d.setVar('RPROVIDES_' + pkg, '%s-locale %s%s-translation' % (pn,=
 mlprefix, ln))
>          d.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l)=
)
>          d.setVar('DESCRIPTION_' + pkg, '%s  This package contains langua=
ge translation files for the %s locale.' % (description, l))
> --
> 1.7.9.5
Thanks for unbreaking do_rootfs part II

Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>


