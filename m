Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id C1A647229E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 09:04:36 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 647993F542
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 10:04:35 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 10:04:34 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 10:04:34 +0100 (CET)
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 19 Jan 2015 10:05:58 +0100
Message-ID: <54BCC8A1.70500@topic.nl>
Date: Mon, 19 Jan 2015 10:04:33 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1420897602-29467-1-git-send-email-milo-software@users.sourceforge.net>
In-Reply-To: <1420897602-29467-1-git-send-email-milo-software@users.sourceforge.net>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: [PATCH] package.bbclass: Let PR server update PKGV, not PV
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
X-List-Received-Date: Mon, 19 Jan 2015 09:04:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFping?

On 10-01-15 14:46, Mike Looijmans wrote:
> From: Mike Looijmans <mike.looijmans@topic.nl>
>
> PV is the package version as we need it to be during the build. PKGV is t=
he
> final version as it ends up in the package, and defaults to PV.
>
> The packager handled builds without PR-server by replacing the AUTOINC st=
ring
> in PKGV, but when the PR-server is being used, the script replaces the co=
ntents
> of PKGV with the PV if the PV contains "AUTOINC". Thus the packager overr=
ides
> any change to PKGV the recipe might have made.
> This breaks classes like gitpkgv that provide a correctly numbered PKGV, =
the
> number as calculated by that class will simply be replaced with a 0-based=
 index
> from the PR-server.
>
> This patch makes the packager look at the PKGV version instead of the PV,=
 and
> update the PKGV only based on the PKGV contents as set by the recipe.
>
> See also the discussion here:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-January/10=
0329.html
>
>  From investigating the history of the code and changes in the past year,=
 the
> use of "pv" instead of "pkgv" appears to be just an oversight, introduced=
 in:
> commit b27b438221e16ac3df6ac66d761b77e3bd43db67 "prs: use the PRServer to=
 replace the BB_URI_LOCALCOUNT functionality"
> A later commit 865d001de168915a5796e5c760f96bdd04cebd61 "package/prserv: =
Merge two similar functions into one"
> silently fixed this only for the case without PR-server by using pkgv the=
re.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>   meta/classes/package.bbclass |    7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index fc501fc..93e2461 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -403,9 +403,10 @@ python package_get_auto_pr() {
>       if not (host is None):
>           d.setVar("PRSERV_HOST", host)
>
> +    pkgv =3D d.getVar("PKGV", True)
> +
>       # PR Server not active, handle AUTOINC
>       if not d.getVar('PRSERV_HOST', True):
> -        pkgv =3D d.getVar("PKGV", True)
>           if 'AUTOINC' in pkgv:
>               d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
>           return
> @@ -428,11 +429,11 @@ python package_get_auto_pr() {
>           if conn is None:
>               conn =3D oe.prservice.prserv_make_conn(d)
>           if conn is not None:
> -            if "AUTOINC" in pv:
> +            if "AUTOINC" in pkgv:
>                   srcpv =3D bb.fetch2.get_srcrev(d)
>                   base_ver =3D "AUTOINC-%s" % version[:version.find(srcpv=
)]
>                   value =3D conn.getPR(base_ver, pkgarch, srcpv)
> -                d.setVar("PKGV", pv.replace("AUTOINC", str(value)))
> +                d.setVar("PKGV", pkgv.replace("AUTOINC", str(value)))
>
>               auto_pr =3D conn.getPR(version, pkgarch, checksum)
>       except Exception as e:
>



Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


