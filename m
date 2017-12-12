Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 880EE78865
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:18:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 21:18:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,394,1508828400"; d="scan'208";a="17492476"
Received: from kdu3-mobl2.amr.corp.intel.com ([10.255.69.163])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2017 21:18:43 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <6e949782898c39ed1850878a13d9d841be4c43c0.1513054233.git.timothy.t.orling@linux.intel.com>
Date: Mon, 11 Dec 2017 21:18:43 -0800
Message-Id: <3FFADA32-E1CD-4710-B904-66E72A5660E9@linux.intel.com>
References: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
	<6e949782898c39ed1850878a13d9d841be4c43c0.1513054233.git.timothy.t.orling@linux.intel.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 01/14] pypi.bbclass: bring in from meta-python
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
X-List-Received-Date: Tue, 12 Dec 2017 05:18:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Moments after hitting send, I realized this was missing the =
documentation strings
from v1. I have added that change in the contrib git repo, but will not =
bother resending
the patch via email. This series must be applied from git regardless, =
due to the long
lines in the old manifest files which break git send-email.

> On Dec 11, 2017, at 9:04 PM, Tim Orling =
<timothy.t.orling@linux.intel.com> wrote:
>=20
> The pypi.bbclass has usefullness in many meta layers, not
> just meta-python. Add it to oe-core for the benefit of
> everyone.
>=20
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
> meta/classes/pypi.bbclass | 26 ++++++++++++++++++++++++++
> 1 file changed, 26 insertions(+)
> create mode 100644 meta/classes/pypi.bbclass
>=20
> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> new file mode 100644
> index 0000000000..e5d7ab3ce1
> --- /dev/null
> +++ b/meta/classes/pypi.bbclass
> @@ -0,0 +1,26 @@
> +def pypi_package(d):
> +    bpn =3D d.getVar('BPN')
> +    if bpn.startswith('python-'):
> +        return bpn[7:]
> +    elif bpn.startswith('python3-'):
> +        return bpn[8:]
> +    return bpn
> +
> +PYPI_PACKAGE ?=3D "${@pypi_package(d)}"
> +PYPI_PACKAGE_EXT ?=3D "tar.gz"
> +
> +def pypi_src_uri(d):
> +    package =3D d.getVar('PYPI_PACKAGE')
> +    package_ext =3D d.getVar('PYPI_PACKAGE_EXT')
> +    pv =3D d.getVar('PV')
> +    return =
'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s' % =
(package[0], package, package, pv, package_ext)
> +
> +PYPI_SRC_URI ?=3D "${@pypi_src_uri(d)}"
> +
> +HOMEPAGE ?=3D "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
> +SECTION =3D "devel/python"
> +SRC_URI +=3D "${PYPI_SRC_URI}"
> +S =3D "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
> +
> +UPSTREAM_CHECK_URI ?=3D =
"https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
> +UPSTREAM_CHECK_REGEX ?=3D "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
> --=20
> 2.14.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


