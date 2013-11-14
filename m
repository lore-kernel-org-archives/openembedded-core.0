Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BF29F6D614
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 13:12:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAEDCJpm000699; Thu, 14 Nov 2013 13:12:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ir15W_EiH6Mv; Thu, 14 Nov 2013 13:12:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAEDCF5J000685
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 14 Nov 2013 13:12:17 GMT
Message-ID: <1384434732.6460.121.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com
Date: Thu, 14 Nov 2013 13:12:12 +0000
In-Reply-To: <a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>
References: <cover.1384433183.git.Qi.Chen@windriver.com>
	<a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Thu, 14 Nov 2013 13:12:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-14 at 21:07 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> TMPDIR must be an absolute path, otherwise, the build will fail.
> Special characters in TMPDIR will also cause build failures.
> 
> This patch enables checking for the validity of TMPDIR.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/sanity.bbclass |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 83378b0..e45906e 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -672,6 +672,13 @@ def check_sanity_everybuild(status, d):
>          with open(checkfile, "w") as f:
>              f.write(tmpdir)
>  
> +    # Check if TMPDIR contains invalid characters, and check if it is an absolute path
> +    valid_tmpdir_regexp = "^/[a-zA-Z0-9\-_/.~]+$"
> +    import re
> +    valid_pattern = re.compile(valid_tmpdir_regexp)
> +    if not valid_pattern.match(tmpdir):
> +        status.addresult("Error, you have special characters in TMPDIR directory path or your TMPDIR is not an absolute path. The TMPDIR should match the this regexp: ^/[a-zA-Z0-9\-_/.~]$")
> +

I'm ok with the check itself however this does not need to be run every
build. It needs to run when tmpdir changes only.

Cheers,

Richard



