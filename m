Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3quV-0008TE-Pw
	for openembedded-core@openembedded.org; Tue, 21 Aug 2012 18:02:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by fmsmga102.fm.intel.com with ESMTP; 21 Aug 2012 08:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,802,1336374000"; d="scan'208";a="136545482"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Aug 2012 08:49:21 -0700
Message-ID: <5033AE01.4030902@linux.intel.com>
Date: Tue, 21 Aug 2012 08:49:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Andy Ross <andy.ross@windriver.com>
References: <1345220434.27428.15.camel@ted>
	<1345496758-29154-1-git-send-email-andy.ross@windriver.com>
In-Reply-To: <1345496758-29154-1-git-send-email-andy.ross@windriver.com>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] insane.bbclass: Fix RPATH warning in the face of funny path strings
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
X-List-Received-Date: Tue, 21 Aug 2012 16:02:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2012 02:05 PM, Andy Ross wrote:
> In toolchain edge cases it's possible for the RPATH of a library to be
> set to something like "/usr/lib/../lib".  This should be detected as
> "/usr/lib" and generate a warning.
>
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
>   meta/classes/insane.bbclass | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 556a176..9d085a4 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -166,6 +166,9 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
>       """
>       Check for RPATHs that are useless but not dangerous
>       """
> +    def rpath_eq(a, b):
> +        return os.path.normpath(a) == os.path.normpath(b)
> +
>       if not elf:
>           return
>
> @@ -181,7 +184,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
>       	m = rpath_re.match(line)
>   	if m:
>   	   rpath = m.group(1)
> -	   if rpath == libdir or rpath == base_libdir:
> +	   if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
>   	      # The dynamic linker searches both these places anyway.  There is no point in
>   	      # looking there again.
>   	      messages.append("%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
>

Merged this to OE-Core

Thanks
	Sau!



