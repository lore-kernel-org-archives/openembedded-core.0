Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id A0E916D732
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 13:27:05 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 7856AF811EF; Thu, 14 Nov 2013 06:27:07 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id AE2BDF811EE;
	Thu, 14 Nov 2013 06:27:06 -0700 (MST)
Message-ID: <5284CFAD.2060903@mlbassoc.com>
Date: Thu, 14 Nov 2013 06:27:09 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1384433183.git.Qi.Chen@windriver.com>
	<a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>
In-Reply-To: <a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Thu, 14 Nov 2013 13:27:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-11-14 06:07, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> TMPDIR must be an absolute path, otherwise, the build will fail.
> Special characters in TMPDIR will also cause build failures.
>
> This patch enables checking for the validity of TMPDIR.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/sanity.bbclass |    7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 83378b0..e45906e 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -672,6 +672,13 @@ def check_sanity_everybuild(status, d):
>           with open(checkfile, "w") as f:
>               f.write(tmpdir)
>
> +    # Check if TMPDIR contains invalid characters, and check if it is an absolute path
> +    valid_tmpdir_regexp = "^/[a-zA-Z0-9\-_/.~]+$"
> +    import re
> +    valid_pattern = re.compile(valid_tmpdir_regexp)
> +    if not valid_pattern.match(tmpdir):
> +        status.addresult("Error, you have special characters in TMPDIR directory path or your TMPDIR is not an absolute path. The TMPDIR should match the this regexp: ^/[a-zA-Z0-9\-_/.~]$")
> +
>   def check_sanity(sanity_data):
>       import subprocess

Check the wording of the warning "The TMPDIR should match the this regexp"
should probably be "The TMPDIR should match this regexp" or maybe use a simpler
version like "The TMPDIR name should must be an absolute path and contain only letters,
digits and the characters -_"

Also, is "-" actually valid?  I seem to recall having problems when my build
tree had the hyphen ("-") in the path.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

