Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 74D19601DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 15:13:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2015 07:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="449752267"
Received: from mtbauma1-mobl1.amr.corp.intel.com (HELO [10.252.136.235])
	([10.252.136.235])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2015 06:59:11 -0800
Message-ID: <1423062803.18649.15.camel@picadillo>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Wed, 04 Feb 2015 09:13:23 -0600
In-Reply-To: <1423047187-8369-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1423047187-8369-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: bail out on kickstart parse errors
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
X-List-Received-Date: Wed, 04 Feb 2015 15:13:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-04 at 11:53 +0100, Maciej Borzecki wrote:
> Kickstart file errors are not emitted by the parser. In case errors, the
> current code will continue to execute possibly creating a faulty or
> incomplete image. The patch enables the parser to emit all encountered
> errors. The error message is shown for the user and further execution is
> ceased.
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>

> ---
>  scripts/lib/wic/kickstart/__init__.py | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
> index 600098293aeff5a1f7756ba20381b8d054c10fd1..b1406a04575906f7d5822139eef5a4a2753040fc 100644
> --- a/scripts/lib/wic/kickstart/__init__.py
> +++ b/scripts/lib/wic/kickstart/__init__.py
> @@ -58,16 +58,13 @@ def read_kickstart(path):
>          def __init__(self):
>              superclass.__init__(self, mapping=commandMap[using_version])
>  
> -    ks = ksparser.KickstartParser(KSHandlers(), errorsAreFatal=False)
> +    ks = ksparser.KickstartParser(KSHandlers(), errorsAreFatal=True)
>  
>      try:
>          ks.readKickstart(path)
>      except (kserrors.KickstartParseError, kserrors.KickstartError), err:
> -        if msger.ask("Errors occured on kickstart file, skip and continue?"):
> -            msger.warning("%s" % err)
> -            pass
> -        else:
> -            raise errors.KsError("%s" % err)
> +        msger.warning("Errors occurred when parsing kickstart file: %s\n" % path)
> +        msger.error("%s" % err)
>  
>      return ks
>  
> -- 
> 1.9.3
> 



