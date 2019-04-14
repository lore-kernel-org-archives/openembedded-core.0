Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id E70027DA45
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 14:21:11 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q16so17169580wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=yqItQravjTlOHH1wbzo9ZB22K9lOyv3z8yoPh/mKdRM=;
	b=J+rzFdKiaVYOvWrgpvho/hQFFqL02jN6/YbyBqPCa9iW22kIT5CGDJN9ueRLn2O9D6
	LeAM9bQJHsy/Ofpi74P8xFVUxmbsJ3viiULAgFzdohXi8BDJhSlfraOibeDLYwq6n7gO
	jqDCyTDVdgxvwOm0g7PwhzOWL/tcI0G3zes51AmpVwl6+4w0OzfOI2TUweNLdXpDxJz2
	0a9uCb6gSDuFUHVeshJAu3VKGlZKCPECUoqgukA/vySq6oM+UavoswDG3utXvKcwd0tQ
	kD1zjElL7SDjrfLnNmSDoep9Jrumwh3QhWPmoRgTGxKT67svaZ498Rx8DZtZYmhCs4ei
	qbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=yqItQravjTlOHH1wbzo9ZB22K9lOyv3z8yoPh/mKdRM=;
	b=rR0+RX8Hh2n/cRmgW/zAUJEPv+CXoriWymJNsIQkR9u4UYZpZynpopOor+p3pfFNR2
	maH1SpT7FQce+gz0u30wPhLB8nWD6m7n21F0YCLtJU0WM2yM/oVY1RQ2Gtl6mPtwZQju
	f1tct6qpSyj7fn/5fJek1Nh5H1pQ/gHe9ppSKdgoYvIjjXKW413AHJcvG4VvmIQ7EXiy
	vnmtb/4kMLYbihwIiQDX7GpRHzdkG3YDqkPp2Uqh+kJSa0WWzJeW5xhHN8tGD8bAKf3E
	j56aVoWZT0DhITYeVoSaQAvJZaYc6PsI2/Vxb9ARyzoXoKErWVD8GzJRQ4fGFBo1Bld8
	Q6rg==
X-Gm-Message-State: APjAAAWQkMP1XnEaUFxl+m+huFPqbHE9ZrT+pmRvliDEfU0nzoaMBjN+
	KiRpDuAifLrUKblxkbFPW/S3a5/9no3UWZdMN1cESQ==
X-Google-Smtp-Source: APXvYqxS19EZouKnb9yAW+MMFkHyc2M9lw1QbSHsC74LzvtrPpCz3++NUEpO9TGrVszsjUXNHDNx19u+NFHsqS1jbKg=
X-Received: by 2002:a1c:6783:: with SMTP id b125mr18485136wmc.41.1555251672244;
	Sun, 14 Apr 2019 07:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190328094652.19336-1-andrey.z@gmail.com>
In-Reply-To: <20190328094652.19336-1-andrey.z@gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Sun, 14 Apr 2019 16:21:00 +0200
Message-ID: <CAHtQpK5ky=PfhuxTGaGkXTzxjevvQ9bD6yiTNkr9KwWL8buSRA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_ipk: handle exception for subprocess command
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
X-List-Received-Date: Sun, 14 Apr 2019 14:21:12 -0000
Content-Type: text/plain; charset="UTF-8"

Ping.

On Thu, Mar 28, 2019 at 10:47 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> When opkg-build command fails to execute, subprocess is returned with
> exception instead of printing to stderr. This causes the error logging
> not to be printed out, as the "finally" statement does not contain any
> bitbake error output.
>
> One example of this behavior is when the package name contains uppercase
> character, which are rejected by opkg-build, subprocess.check_output
> would except and no error log would be produced.
>
> This commit catches the exception subprocess.CalledProcessError and
> produces bb.error output visible to the user.
>
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> ---
>  meta/classes/package_ipk.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index d1b317b42b..f181f5b4fd 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -234,6 +234,8 @@ def ipk_write_pkg(pkg, d):
>              ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH'))
>              sign_ipk(d, ipk_to_sign)
>
> +    except subprocess.CalledProcessError as exc:
> +        bb.error("OPKG Build failed: %s" % exc.output)
>      finally:
>          cleanupcontrol(root)
>          bb.utils.unlockfile(lf)
> --
> 2.17.1
>

