Return-Path: <mario.goulart@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id ADAF476A45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 12:55:52 +0000 (UTC)
Received: by iodt126 with SMTP id t126so44663643iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=Dn9gTTZ1ZQHO9MczqeBtwJmkBX9NSc5lJkOFutu5WQg=;
	b=oNlKA5Ve26P9u6E+cKv7/9+yZp4nj0O8tOvxSWHEnUMqZBxD22L2+g4xHTBYK0u55g
	CDq5UhjwdIQrsOpPc2csVDCoS7ndGYWeT/GzrpknAGgar5kz2a70bsR3avQmV24CoSb2
	dUbj0SGQDHCEgocoSP6EyEHoOYBvOStTM0pZmcrvkGltaUDalTcMDyP3Wk5uxO+edqTc
	lZ9QMo7wWxdZhLiB7SPnbgs20sJNEYKpfUczR/j6wok3Mz+kRhfXA8XAG7FPiIYXCx0i
	Ug/cnqgQfzqLY7nq/GqZlXG8O/VQ5EwT7b/s7R3+9lKjr0y56mw74XjyyzX8SDVcAUA8
	oNBw==
X-Received: by 10.107.132.20 with SMTP id g20mr2959727iod.175.1440075352439;
	Thu, 20 Aug 2015 05:55:52 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94])
	by smtp.gmail.com with ESMTPSA id n5sm4820752iga.0.2015.08.20.05.55.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 05:55:52 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
	<cover.1440071413.git.ed.bartosh@linux.intel.com>
	<fd86d6aa0db030b3d6d708ed08e8b8d14fd4816d.1440071413.git.ed.bartosh@linux.intel.com>
Date: Thu, 20 Aug 2015 12:55:50 +0000
In-Reply-To: <fd86d6aa0db030b3d6d708ed08e8b8d14fd4816d.1440071413.git.ed.bartosh@linux.intel.com>
	(Ed Bartosh's message of "Thu, 20 Aug 2015 14:56:27 +0300")
Message-ID: <871teynmp5.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 14/17] oe-selftest: test building wic image by bitbake
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
X-List-Received-Date: Thu, 20 Aug 2015 12:55:54 -0000
Content-Type: text/plain

Hi Ed,

On Thu, 20 Aug 2015 14:56:27 +0300 Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> Added test case to verify building of wic-image-minimal recipe
> and produced artifacts: manifest and bzipped partitioned image.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/wic.py | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
> index 15de621..dc0745a 100644
> --- a/meta/lib/oeqa/selftest/wic.py
> +++ b/meta/lib/oeqa/selftest/wic.py
> @@ -180,3 +180,17 @@ class Wic(oeSelfTest):
>                          'IMAGE_LINK_NAME', 'STAGING_LIBDIR', 'ROOTFS_SIZE'):
>                  self.assertTrue(var in content)
>                  self.assertTrue(content[var])
> +
> +    def test19_wic_image_type(self):
> +        """Test building wic images by bitbake"""
> +        self.assertEqual(0, bitbake('wic-image-minimal').status)
> +
> +        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
> +        machine = get_bb_var('MACHINE')
> +        prefix = os.path.join(deploy_dir, 'wic-image-minimal-%s.' % machine)
> +        # check if we have result image and manifests synmlinks

Small typo: s/synmlinks/symlinks/.

> +        # pointing to existing files
> +        for suffix in ('wic.bz2', 'manifest'):
> +            path = prefix + suffix
> +            self.assertTrue(os.path.islink(path))
> +            self.assertTrue(os.path.isfile(os.path.realpath(path)))
> -- 
> 2.1.4

Best wishes.
Mario
-- 
http://www.ossystems.com.br

