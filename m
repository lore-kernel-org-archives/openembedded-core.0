Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 057CC6023E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 09:12:21 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Uorxc-00045S-DW; Tue, 18 Jun 2013 11:12:20 +0200
Message-ID: <1371546729.5066.7.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Rongqing Li <rongqing.li@windriver.com>
Date: Tue, 18 Jun 2013 10:12:09 +0100
In-Reply-To: <51C01D87.9080804@windriver.com>
References: <cover.1371539741.git.rongqing.li@windriver.com>
	<b57b85f69322501fb617a01e625734cda1088b5e.1371539741.git.rongqing.li@windriver.com>
	<1371542851.5066.1.camel@pb-ThinkPad-R50e>
	<51C01D87.9080804@windriver.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base-files: create /usr/lib/locale dir
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
X-List-Received-Date: Tue, 18 Jun 2013 09:12:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-18 at 16:42 +0800, Rongqing Li wrote:
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb 
> b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index fa1cc58..84663e3 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -139,6 +139,7 @@ do_install_append_linuxstdbase() {
>          for d in ${dirs4775}; do
>                   install -m 2755 -d ${D}$d
>           done
> +       install -m 755 -d ${D}/usr/lib/locale

Thanks, that looks better.  Could you not just add it to ${dirs3755}
though?  (Despite the confusing/misleading name, this variable appears
to be a list of LSB directories that should be created with mode 0755,
cf ${dirs4755} which is apparently directories to be created with mode
2755.)

In a stylistic sense it might be better to use ${prefix}/lib/locale (or
whatever eglibc uses), but in practice LSB requires ${prefix}=="/usr",
and presumably lsbtest is looking for "/usr/lib/locale" specifically, so
I don't think it will actually make any functional difference in this
specific case.

p.



