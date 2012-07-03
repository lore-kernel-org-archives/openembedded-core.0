Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Sm3l8-0006Nj-T6
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 16:07:18 +0200
Received: by bkcik5 with SMTP id ik5so2527818bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=SKrp/GX4mxij8dGI3H4j7HWhWDBRVlJvEDPtwS7eClM=;
	b=k64AL18iFduu3Yj8F+84sNftMe4G0ng+GdcYtKHkLKENY5NkAngUrUkOct328MjtPL
	YzZwU/ZBlbw6Jwt6Ry+LpLM2fDgmGeDSRWiY2AvHn8bqOiJVVN+jsMKmFTu+IgQJXtTP
	lws+6bFc3pC9VFq04jqb+gXaNI5mG3CjvwdYqH+AqxkFw8e5d3tnQp7fUV84cJ0u75sz
	ggv7y8mb9FjnFtIV1voZep4dZjMxtiAcLVl1zHB8xsHxWqxmBbcoSwfyPhsrM6Qp76Yb
	MjzYOaHP2yyOsh06ipwYSHPOMPBekILhXz9sCmCs48YFyyRx3W1Mz8wt7rJybeimitsH
	v8vw==
Received: by 10.152.46.6 with SMTP id r6mr17706754lam.7.1341323777076; Tue, 03
	Jul 2012 06:56:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Tue, 3 Jul 2012 06:55:56 -0700 (PDT)
In-Reply-To: <1341276037-32076-1-git-send-email-sgw@linux.intel.com>
References: <1341276037-32076-1-git-send-email-sgw@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 3 Jul 2012 06:55:56 -0700
X-Google-Sender-Auth: w09wulblIv8JG2Xa0IDOrsyuNsE
Message-ID: <CABcZANnVy0B_wFyVhxz_JsipTf_PXL2ZzLU4hnNGbObDbZRDLw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC v2] package.bbclass: enable the use of package_qa_handle_error
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
X-List-Received-Date: Tue, 03 Jul 2012 14:07:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 2, 2012 at 5:40 PM, Saul Wold <sgw@linux.intel.com> wrote:
> This will allow the reporting of these errors as either WARNINGs (default)
> or ERRORs if installed_vs_shipped is added to the ERROR_QA of the policy
> file (such as a <distro_name>.conf file.
>
> V2: found the code I had intended to send instead of that other junk,
>     was just not watching what I pushed on that one, sorry. (this is edit in
>     no in the actual commit message)
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/package.bbclass |   11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 0b98c6b..ff2ec96 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -988,9 +988,14 @@ python populate_packages () {
>                                 unshipped.append(path)
>
>         if unshipped != []:
> -               bb.warn("For recipe %s, the following files/directories were installed but not shipped in any package:" % pn)
> -               for f in unshipped:
> -                       bb.warn("  " + f)
> +               msg = pn + ": Files/directories were installed but not shipped"
> +               skip = (d.getVar('INSANE_SKIP_' + pn, True) or "").split()
> +               if "installed_vs_shipped" in skip:
> +                       bb.note("Package %s skipping QA tests: installed_vs_shipped" % pn)
> +               else:
> +                       package_qa_handle_error("installed_vs_shipped", msg, d)
> +                       for f in unshipped:
> +                               package_qa_handle_error("installed_vs_shipped", "  " + f, d)

Hmm, I wonder if this is best, or if it should assemble a single
message with newlines separating the files. *thinks*
-- 
Christopher Larson


