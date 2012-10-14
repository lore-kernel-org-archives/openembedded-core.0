Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TNDVH-0000hV-Dy
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Oct 2012 04:00:31 +0200
Received: by mail-lb0-f175.google.com with SMTP id y2so2630615lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2012 18:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=9Hi+hsYwfmu0BrYgll0npCRzHI1b5Gvi/wWvWsEevMo=;
	b=qGOsh4uEnt8jOvRRPft8Oac8yarFWlF5jxiWqi1X3gX5nQ2tFE0wg6m60t9QLgiiP7
	hbh4HUKw3wwFrYF96EnAvRn/cSAbl8EpD6RVJr85VIeMgDx8uT9IZ/BIXytzgmHSKVMB
	uaf6mFB1j73ML/6USuUkthgcHSy7KWOa3IhCIlEa6Bq7d3mg258HXqk+1pprVClRL/+2
	OO/4Y10DoGGqGK+Hass/itcK75HXQIXQjSwQDe7EUWfDKHu9ICAjQtIM+LXSjJi54Akm
	Scg+x94dO0ymcRo66nOScDLSeC+S7WqWUrn3D+PiRDH8GpcLWmS8J9UbZ0w8ZJ5xdeqx
	Ijhw==
Received: by 10.112.24.6 with SMTP id q6mr2352720lbf.24.1350179236634; Sat, 13
	Oct 2012 18:47:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Sat, 13 Oct 2012 18:46:56 -0700 (PDT)
In-Reply-To: <1350130322-3100-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1350130322-3100-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 13 Oct 2012 18:46:56 -0700
X-Google-Sender-Auth: iKW-jW_ZiNpHEsSE1bzr_ceC8Ts
Message-ID: <CABcZANkPym+NSXqx6PrZnkhVqtsHoq-D20Dc14OgQ1Cq3G-bUQ@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package.bbclass: search for dangling links in installation directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Oct 2012 02:00:31 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 13, 2012 at 5:12 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 73c4358..30614f0 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1063,14 +1063,23 @@ python populate_packages () {
>                  path = os.path.join(root, f)
>                  rpath = path[len(inst_root):]
>                  pkg_files[pkg].append(rpath)
> +
> +                if not os.path.islink(path):
> +                    continue
> +
> +                target = os.readlink(path)
> +                if target[0] != '/':
> +                    # make path absolute relative to inst_root
> +                    target = os.path.join(root[len(inst_root):], target)
> +
> +                # make path absolute; do not use os.path.join() here
> +                # because target might start with multiple '/'
> +                rtarget = inst_root + target

I think you can use the join() which is in the oe python package for this.
-- 
Christopher Larson


