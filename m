Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.4334.1590606693040657615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 12:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 04RJBT7i011134
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 14:11:30 -0500
Subject: Re: [OE-core] [PATCH v2] sstate.bbclass: When siginfo or sig files are missing, stop fetcher errors
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
References: <160EA27C0123740E.25148@lists.openembedded.org>
Message-ID: <4409bc1a-7bf3-65b3-8d4a-b75fa7c53e72@kernel.crashing.org>
Date: Wed, 27 May 2020 14:11:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <160EA27C0123740E.25148@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping

I noticed this hasn't been integrated or commented on yet.

On 5/13/20 11:12 AM, Mark Hatle wrote:
> From: Mark Hatle <mark.hatle@xilinx.com>
> 
> Prior to fetching, the system checks if the sstate file is present
> either locally or on the mirror.  If it is, then it goes to the fetch
> stage.  Up to three files can be fetched, sstate, sstate.siginfo and
> sstate.sig (if signature validation is enabled).
> 
> The previous pstaging_fetch function would iterate over these, and if
> a download error occurred would spew forth a great amount of fetcher
> failure messages as well as stop fetching the next item in the set.
> 
> This was resolved by adding a fetcher.checkstatus() call prior to
> the download.  If the file isn't present, then the exception will
> be triggered, and no fetcher failure messages will reach the user.
> 
> The exception handler is then modified to be a pass so that it will
> loop and pull the rest of the files that that are requested.
> 
> Additionally, a check for the existance of the .sig file was added
> to the sstate_installpkg to avoid an error trying to load the .sig
> if it wasn't downloaded.
> 
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
> 
> v2 - fix a typo in the error message about signature not being
>      present.
> 
>  meta/classes/sstate.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index aa9c30b4e1..375196ef21 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -355,6 +355,9 @@ def sstate_installpkg(ss, d):
>      d.setVar('SSTATE_INSTDIR', sstateinst)
>  
>      if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
> +        if not os.path.isfile(sstatepkg + '.sig'):
> +            bb.warn("No signature file for sstate package %s, skipping acceleration..." % sstatepkg)
> +            return False
>          signer = get_signer(d, 'local')
>          if not signer.verify(sstatepkg + '.sig'):
>              bb.warn("Cannot verify signature on sstate package %s, skipping acceleration..." % sstatepkg)
> @@ -733,10 +736,11 @@ def pstaging_fetch(sstatefetch, d):
>          localdata.setVar('SRC_URI', srcuri)
>          try:
>              fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
> +            fetcher.checkstatus()
>              fetcher.download()
>  
>          except bb.fetch2.BBFetchException:
> -            break
> +            pass
>  
>  def sstate_setscene(d):
>      shared_state = sstate_state_fromvars(d)
> 
> 
> 
> 
