Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMll6-0007Qp-GQ
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 20:46:12 +0200
Received: by wwb17 with SMTP id 17so1716707wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 11:43:17 -0700 (PDT)
Received: by 10.216.237.65 with SMTP id x43mr2095241weq.70.1305744197753;
	Wed, 18 May 2011 11:43:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h39sm914793wes.5.2011.05.18.11.43.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 11:43:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <c27fb95384b158cf4829fcee742d05916395236a.1305742944.git.sgw@linux.intel.com>
Date: Wed, 18 May 2011 20:43:10 +0200
Message-Id: <E579A82C-1112-4886-8B92-B60CF772B674@dominion.thruhere.net>
References: <cover.1305742944.git.sgw@linux.intel.com>
	<c27fb95384b158cf4829fcee742d05916395236a.1305742944.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] utils.bbclass: modify create_wrapper to correctly follow symlinks
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
X-List-Received-Date: Wed, 18 May 2011 18:46:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 mei 2011, om 20:23 heeft Saul Wold het volgende geschreven:

> From: Saul Wold <sgw@linux.intel.com>
>=20
> This ensures you look up the symbolic link to get the full path
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/classes/utils.bbclass |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index 6bcaf86..a789d41 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -312,7 +312,8 @@ create_wrapper () {
>    cmdname=3D`basename $cmd`.real
>    cat <<END >$cmd
> #!/bin/sh
> -exec env $@ \`dirname \$0\`/$cmdname "\$@"
> +realpath=3D`readlink -fn \$0`
> +exec env $@ \`dirname \$realpath\`/$cmdname "\$@"
> END
>    chmod +x $cmd
> }

This patch makes the perl problem come out a lot earlier:

| env: =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/x86_64-linux/perl-nativ=
e-5.12.3-r2/temp/perl.real: No such file or directory
| configure: error: Perl 5.005_03 or better is required
| + bbfatal 'oe_runconf failed'
| + echo 'ERROR: oe_runconf failed'
| ERROR: oe_runconf failed
| + exit 1
| ERROR: Function 'do_configure' failed (see =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/x86_64-linux/autoconf-n=
ative-2.65-r2/temp/log.do_configure.16420 for further information)




