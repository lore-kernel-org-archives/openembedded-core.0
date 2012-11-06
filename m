Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TVn66-0008AL-02
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Nov 2012 18:37:58 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TVmso-0005iE-8D
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Nov 2012 18:24:14 +0100
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 06 Nov 2012 17:24:13 +0000
X-Mailer: Evolution 3.0.2- 
Message-ID: <1352222654.13864.316.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] insane: detect and warn about relocations in .text
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
X-List-Received-Date: Tue, 06 Nov 2012 17:37:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ping?

On Wed, 2012-10-03 at 11:24 +0100, Phil Blundell wrote:
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
> This requires qa.elf.run_objdump() so needs to be applied after the
> patch which adds that function.
> 
>  meta/classes/insane.bbclass |   26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 5848ab4..ff35ed8 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -108,7 +108,7 @@ def package_qa_get_machine_dict():
>  
> 
>  # Currently not being used by default "desktop"
> -WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir"
> +WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir textrel"
>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms dep-cmp"
>  
>  ALL_QA = "${WARN_QA} ${ERROR_QA}"
> @@ -421,6 +421,30 @@ def package_qa_check_desktop(path, name, d, elf, messages):
>          for l in output:
>              messages.append("Desktop file issue: " + l.strip())
>  
> +QAPATHTEST[textrel] = "package_qa_textrel"
> +def package_qa_textrel(path, name, d, elf, messages):
> +    """
> +    Check if the binary contains relocations in .text
> +    """
> +
> +    if not elf:
> +        return
> +
> +    if os.path.islink(path):
> +        return
> +
> +    phdrs = elf.run_objdump("-p", d)
> +    sane = True
> +
> +    import re
> +    textrel_re = re.compile("\s+TEXTREL\s+")
> +    for line in phdrs.split("\n"):
> +        if textrel_re.match(line):
> +	   sane = False
> +
> +    if not sane:
> +        messages.append("ELF binary '%s' has relocations in .text" % path)
> +
>  QAPATHTEST[ldflags] = "package_qa_hash_style"
>  def package_qa_hash_style(path, name, d, elf, messages):
>      """




