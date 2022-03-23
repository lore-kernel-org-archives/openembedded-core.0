Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <fe0f9ee8-e3d0-1681-af93-fa97019b8a0c@gmail.com>
Date: Wed, 23 Mar 2022 19:34:09 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v1 1/2] gpg-sign: Add parameters to gpg signature function
References: <20220322211949.7423-1-fntoth@gmail.com>
From: "Ferry Toth" <fntoth@gmail.com>
In-Reply-To: <20220322211949.7423-1-fntoth@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Xavier Berger <xavier.berger@bio-logic.net>

Hi Richard,

I forgot to add a cover letter, sorry for that. The 2 patches  together 
implement DEB repository signing.

This is necessary since Gatesgarth |apt| (1.8.2) has become more strict 
and doesn’t allow unsigned repositories by default.

It is possible to override this behavior |but||| is more work then to 
enable signed DEB repositories. These patches makes DEB a first class 
citizen as IPK and RPM.

Patches have been in use in meta-intel-edison since Gatesgarth, see 
https://edison-fw.github.io/meta-intel-edison/5.0-Creating-a-deb-repository.html\

Ferry

Op 22-03-2022 om 22:19 schreef Ferry Toth:
> From: Xavier Berger <xavier.berger@bio-logic.net>
>
> output_suffix: If defined, add output_suffix as file name extension.
> use_sha256: If True, use sha256 for gpg as digest algorithm
>
> Signed-off-by: Xavier Berger <xavier.berger@bio-logic.net>
> Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
> ---
>   meta/lib/oe/gpg_sign.py | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index 1bce6cb792..aa9bb49f2c 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -58,7 +58,7 @@ class LocalSigner(object):
>           for i in range(0, len(files), sign_chunk):
>               subprocess.check_output(shlex.split(cmd + ' '.join(files[i:i+sign_chunk])), stderr=subprocess.STDOUT)
>   
> -    def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True):
> +    def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True, output_suffix=None, use_sha256=False):
>           """Create a detached signature of a file"""
>   
>           if passphrase_file and passphrase:
> @@ -71,6 +71,10 @@ class LocalSigner(object):
>               cmd += ['--homedir', self.gpg_path]
>           if armor:
>               cmd += ['--armor']
> +        if output_suffix:
> +            cmd += ['-o', input_file + "." + output_suffix]
> +        if use_sha256:
> +            cmd += ['--digest-algo', "SHA256"]
>   
>           #gpg > 2.1 supports password pipes only through the loopback interface
>           #gpg < 2.1 errors out if given unknown parameters
