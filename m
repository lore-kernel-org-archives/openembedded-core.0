Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6BDCB77FF6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 21:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id CA1543201BEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 23:42:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id v_6SHTVmWma9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 23:41:59 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A61F97.dip0.t-ipconnect.de
	[87.166.31.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 48B093200154
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 23:41:59 +0200 (CEST)
Date: Mon, 29 May 2017 23:41:58 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170529234158.6bc90238@t510.zcs.saftware.de>
In-Reply-To: <20170529173647.2792-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170522164309.31121-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170529173647.2792-1-leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3] package_ipk: correct ipk multiline descriptions
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
X-List-Received-Date: Mon, 29 May 2017 21:42:04 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 May 2017 10:36:47 -0700
leonardo.sandoval.gonzalez@linux.intel.com wrote:

> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Empty descriptions lines are set with a space following by a dot and
> the multiline ones require a leading space. Also, for non-empty lines,
> there is no need for formating with textwrap, so remove the logic for
> the latter. The documentation for multiline description was taken from [1].
> 
> [1] https://web.archive.org/web/20100727133051/http://handhelds.org:80/moin/moin.cgi/BuildingIpkgs
> 
> [YOCTO #10677]
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/classes/package_ipk.bbclass | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index 5cc7e0a7b24..d2ce3b3e17a 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -148,16 +148,9 @@ def ipk_write_pkg(pkg, d):
>                  description = localdata.getVar('DESCRIPTION') or "."
>                  description = textwrap.dedent(description).strip()
>                  if '\\n' in description:
> -                    # Manually indent
> +                    # Manually indent: multiline description includes a leading space
>                      for t in description.split('\\n'):
> -                        # We don't limit the width when manually indent, but we do
> -                        # need the textwrap.fill() to set the initial_indent and
> -                        # subsequent_indent, so set a large width
> -                        line = textwrap.fill(t.strip(),
> -                                             width=100000,
> -                                             initial_indent=' ',
> -                                             subsequent_indent=' ') or '.'
> -                        ctrlfile.write('%s\n' % line)
> +                        ctrlfile.write(' %s\n' % (t.strip() or ' .'))

Why not fix opkg instead, if it handles the format incorrectly? After all,
opkg claims to use the dpkg package format, AFAIR. It might be worth looking
how OpenWrt handles multi-line descriptions. Maybe they fixed it already in
their version.

Regards,
Andreas


>                  else:
>                      # Auto indent
>                      ctrlfile.write('%s\n' % textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' '))


