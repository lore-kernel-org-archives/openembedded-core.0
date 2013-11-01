Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 684EE6D181
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 11:04:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1B4Iim027687; Fri, 1 Nov 2013 11:04:18 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w8BE6YNkSSbQ; Fri,  1 Nov 2013 11:04:17 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1B4FC4027677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Nov 2013 11:04:17 GMT
Message-ID: <1383303851.25877.141.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: blloyd <blloyd@familyhonor.net>
Date: Fri, 01 Nov 2013 11:04:11 +0000
In-Reply-To: <eec32fc87fea48dfecfb8af9e26956efaab59558.1383206227.git.blloyd@familyhonor.net>
References: <cover.1383206227.git.blloyd@familyhonor.net>
	<eec32fc87fea48dfecfb8af9e26956efaab59558.1383206227.git.blloyd@familyhonor.net>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] Allow passthrough of important placement variables when using devshell
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
X-List-Received-Date: Fri, 01 Nov 2013 11:04:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-10-31 at 03:02 -0500, blloyd wrote:
> The environment is very well sanitized when using the shell.  However, when using devshell developers are typically interested in sources and build artifacts.  The variables B S and D control this but are cleaned from the environment when a shell is started.  Add a new variable to allow additional variables to be kept for a developer shell and set it to "B S D" by default.  The implementation allows variables for developer convenience and verification while not changing shells used for compile tasks.
> 
> Signed-off-by: blloyd <blloyd@familyhonor.net>
> ---
>  meta/classes/devshell.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
> index 92edb9e..cc1bb64 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -2,7 +2,17 @@ inherit terminal
>  
>  DEVSHELL = "${SHELL}"
>  
> +OE_DEVSHELL_TERMINAL_ADDL_EXPORTS ?= "B S D"
> +OE_DEVSHELL_TERMINAL_ADDL_EXPORTS[type] = 'list'

Can we call this something like DEVSHELL_EXTRA_ENVVARS which is a little
simpler?

>  python do_devshell () {
> +    import oe.data
> +    import oe.terminal

Why do we need to import these?

> +    export_dev=d.getVar('OE_DEVSHELL_TERMINAL_ADDL_EXPORTS') 

We should probably use ", True" here and expand since that is the common
behaviour. I'd also prefer " = " for consistent spacing.

> +    export_term=d.getVar('OE_TERMINAL_EXPORTS')

ditto spacing and ", True".

> +    export_term = export_term + ' ' + export_dev
> +    d.setVar('OE_TERMINAL_EXPORTS', export_term)
> +
>      if d.getVarFlag("do_devshell", "manualfakeroot"):
>         d.prependVar("DEVSHELL", "pseudo ")
>         fakeenv = d.getVar("FAKEROOTENV", True).split()

Cheers,

Richard


