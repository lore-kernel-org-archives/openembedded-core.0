Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF36719DA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 20:26:43 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id p102so50015303uap.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2016 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p9DJZ3t0OoSFRIXw1LcXjIxFCjFFucC80apO9vYZWCg=;
	b=VKscz86POVEGZRbPU+g4lwBXQ4cXGDRnbb2jTR4vRmQJ/Ons4HRWPswobgvTbvUQhP
	c176i3yMekbiejv9p5X7LBRKwmNW6hptXq6Pa30ZXv+pvUyJf5Aqc/VzaAaU0b2eSIjy
	4Xx9lhyFoLo5VBGSSCxUPEoLtMn44fNXa0AMtbPJuXsWX50T1OSQPJuh/9iL9qNQVUCl
	LUVzSlj04vKcqf7rw+9uoPm0Z2JvbmvTBMvruZd5H1RJWHPNIQwFCG3dDx1Czgn0sD1X
	4ELAl32T5a5kTuOds3pWeMwiAsuCOIdMF//0fdJJ57m2tTPOCKK5Rbcq4S29XPNhFvHz
	lniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p9DJZ3t0OoSFRIXw1LcXjIxFCjFFucC80apO9vYZWCg=;
	b=Gd28OG5d6McN45n1RoaoGf5+lvdwfVBkCUTc8AUMkON4RbyDk8tiJ/d2sB6BvjJsct
	Bqc1oWAPq7liglGXpam2QYH48zNpiWFOkJZvqAnh4UF1fDe4YdnYfkJzkHUQPPeh9Aod
	lsUBq8mEILSeAr+HaZXqysFsNN1Xg6oMUbf55FZYK7QcRXHXURy7CKb2imOx21xRoll5
	fqZZUXF5VhQVM09yvt9wN2exRGRFABkvEAkhH3cuuAa5aPNCsrO3klNlxIGgDhmx/jTF
	y8j9W4tfuAV4PFOqCk9n4yIi8Ofu+3+Q3Gk8vJLkrYWgcLzu5gPNRbbJ2XpmNhqmepoP
	hkLw==
X-Gm-Message-State: AA6/9Rm9t1uX8nPC0vaylHG8iVD34ks9av7a2Xl7UAqKGZe2kirgNh5SzlYythEJpfWEM5JxbEWmuOLjLq+ZZA==
X-Received: by 10.176.65.10 with SMTP id j10mr6647421uad.17.1475699205057;
	Wed, 05 Oct 2016 13:26:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.140.8 with HTTP; Wed, 5 Oct 2016 13:26:44 -0700 (PDT)
In-Reply-To: <1475290031-20568-23-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
	<1475290031-20568-23-git-send-email-ulfalizer@gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 5 Oct 2016 22:26:44 +0200
Message-ID: <CAFkk2KQHNzLOTfMPf_-V+a+2W1Rp81t7VmbstpsOJq=hXYH3PQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/22] cmake: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Wed, 05 Oct 2016 20:26:44 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 1, 2016 at 4:47 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> This sets a good example and avoids unnecessarily contributing to
> perceived complexity and cargo culting.
>
> Motivating quote below:
>
> < kergoth> the *original* intent was for the function/task to error via
>            whatever appropriate means, bb.fatal, whatever, and
>            funcfailed was what you'd catch if you were calling
>            exec_func/exec_task. that is, it's what those functions
>            raise, not what metadata functions should be raising
> < kergoth> it didn't end up being used that way
> < kergoth> but there's really never a reason to raise it yourself
>
> FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
> argument, which also shows that the original purpose got lost.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  meta/recipes-devtools/cmake/cmake_3.6.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/cmake/cmake_3.6.1.bb b/meta/recipes-devtools/cmake/cmake_3.6.1.bb
> index 67ba9c4..850d6de 100644
> --- a/meta/recipes-devtools/cmake/cmake_3.6.1.bb
> +++ b/meta/recipes-devtools/cmake/cmake_3.6.1.bb
> @@ -14,7 +14,7 @@ python () {
>      docdir=d.getVar("docdir", True)
>
>      if not docdir.startswith(prefix):
> -        raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
> +        bb.fatal('docdir must contain prefix as its prefix')
>
>      docdir_stripped = docdir[len(prefix):]
>      if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
> --
> 2.7.4
>

Thanks for merging these!

There's now some documentation that mentions FuncFailed as well:
https://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-user-manual.html#bitbake-style-python-functions-versus-python-functions

Cheers,
Ulf

